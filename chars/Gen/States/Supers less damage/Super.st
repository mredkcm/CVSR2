; _________________________________________
;| Gen by mwryly & varo_hades              |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<Zanei>=
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

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

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
trigger1 = Anim = 3000 && AnimElemTime(7) < 0
time = 1
value = SCA

[State 3000, Push]
type = Playerpush
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(10) < 0
value = 0

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 12
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-46 * const(size.xScale)), ceil(-95 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 6
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice 1]
type = PlaySnd
trigger1 = Time = 6
value = 3000,0
channel = 0

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
x = ifElse(var(10) = 2, 13.263, ifElse(var(10) = 1, 10.357, 8.388))

[State 3000, ChangeState]
type = ChangeState
trigger1 = MoveHit && Numtarget(3000)
value = 3005
ignorehitpause = 1

[State 3000, HitDef 1]
type = HitDef
trigger1 = !NumTarget(3004)
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 7
ID = 3000
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 4, 4
animType = Hard
;air.animType = Back
;fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
kill = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Hit Confirm
[StateDef 3005]
type = S
physics = S
moveType = A
anim = 3005
ctrl = 0
sprPriority = 1

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) < 0
x = ifElse(p2bodydist x < 50, 8.357, 5.388)

[State 3000, p2state]
type = targetstate
trigger1 = NumTarget(3000)
trigger1 = !Time
value = 3040
ID = 3000
ignorehitpause = 1

[State 3000, Additional Hits]
type = Helper
trigger1 = (Time = [14,37]) && !(Time % 8)
helperType = Normal
stateNo = 3002
ID = 3002
name = "Additional Hits"
posType = P2
pos = 0,0

[State 3000, Additional Hits]
type = Helper
trigger1 = !NumHelper(3004)
trigger1 = Time = 42
helperType = Normal
stateNo = 3004
ID = 3004
name = "Additional Hits"
posType = P2
pos = 0,0

[State 3000, Push]
type = Playerpush
trigger1 = AnimElemTime(5) < 0
value = 0

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;--- --TARGET -----
[Statedef 3040]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0
[State 3050, Pos]
type = PosSet
trigger1 = 1
y = 0
[State 3050, fall]
type = HitFallSet
trigger1 = 1
value = 0

[State 3050, Anim]
type = ChangeAnim
trigger1 = 1
value = 5012
[State 3050, Shake]
type = PosAdd
trigger1 = 1
x = ifelse((time % 2), 1, -1)

[State 3050, End]
type = SelfState
trigger1 = time >= 90
value = 5001

;====<Zanei Max>=
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

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

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

[State 3000,AfterImage]
type = AfterImage
trigger1 = time = 0
time = 999999999
length = 9
TimeGap = 2
FrameGap = 3
palbright = 0,0,0
palcontrast = 0,0,150
palpostbright = 0,0,0
paladd = -30,-30,-30
palmul = .75,.75,.75
trans = add1

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3000 && AnimElemTime(7) < 0
time = 1
value = SCA

[State 3000, Push]
type = Playerpush
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(10) < 0
value = 0

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 12
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-46 * const(size.xScale)), ceil(-95 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 6
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice 1]
type = PlaySnd
trigger1 = Time = 6
value = 3000,0
channel = 0

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(9) < 0
x = ifElse(var(10) = 2, 14.263, ifElse(var(10) = 1, 12.357, 10.388))

[State 3000, ChangeState]
type = ChangeState
trigger1 = MoveHit && Numtarget(3050)
value = 3055
ignorehitpause = 1

[State 3000, HitDef 1]
type = HitDef
trigger1 = !NumTarget(3004)
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 7
ID = 3050
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 4, 4
animType = Hard
;air.animType = Back
;fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
kill = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
moveType = I

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Hit Confirm
[StateDef 3055]
type = S
physics = S
moveType = A
anim = 3005
ctrl = 0
sprPriority = 1

[State 3000, VelSet]
type = VelSet
trigger1 = AnimElemTime(4) < 0
x = ifElse(p2bodydist x < 50, 8.357, 5.388)

[State 3000, p2state]
type = targetstate
trigger1 = NumTarget(3050)
trigger1 = !Time
value = 3080
ID = 3050
ignorehitpause = 1

[State 3000, Additional Hits]
type = Helper
trigger1 = (Time = [14,37]) && !(Time % 5)
helperType = Normal
stateNo = 3006
ID = 3006
name = "Additional Hits"
posType = P2
pos = 0,0

[State 3000, Additional Hits]
type = Helper
trigger1 = !NumHelper(3004)
trigger1 = Time = 42
helperType = Normal
stateNo = 3008
ID = 3008
name = "Additional Hits"
posType = P2
pos = 0,0

[State 3000, Push]
type = Playerpush
trigger1 = AnimElemTime(5) < 0
value = 0

[State 3000, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;--- --TARGET -----
[Statedef 3080]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0
[State 3050, Pos]
type = PosSet
trigger1 = 1
y = 0
[State 3050, fall]
type = HitFallSet
trigger1 = 1
value = 0

[State 3050, Anim]
type = ChangeAnim
trigger1 = 1
value = 5012
[State 3050, Shake]
type = PosAdd
trigger1 = 1
x = ifelse((time % 2), 1, -1)

[State 3050, End]
type = SelfState
trigger1 = time >= 90
value = 5001

;====<Zetsuei>=
[StateDef 3100]
type = S
physics = S
moveType = A
anim = 3008
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
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

[State 3000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = Anim = 3008 && AnimElemTime(5) < 0
time = 1
value = SCA

[State 3000, Push]
type = Playerpush
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
value = 0

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-46 * const(size.xScale)), ceil(-95 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 6
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice 1]
type = PlaySnd
trigger1 = Time = 5
value = 3000,0
channel = 0

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 3102
ctrl = 1

;--------------------------
;??
[Statedef 3102]
type = S
movetype = A
physics = N
juggle = 1
ctrl = 0
velset = 0,0
anim = 3010
sprpriority = 2

[State 0, PlayerPush]
type = PlayerPush
trigger1 = time>= 0
value = 0

[State 3000, HitDef 1]
type = HitDef
trigger1 = !NumTarget(3004)
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 2
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 4, 4
animType = Hard
;air.animType = Back
;fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
kill = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
p1stateno = 3120

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime=0
value = 0
ctrl = 1

[State 0, VelSet]
type = VelSet
trigger1 =time>=2
x = 50
[State 0, VelSet]
type = VelSet
trigger1 =time>=8
x = 28
[State 0, VelSet]
type = VelSet
trigger1 =time>=16
x = 20

;-----------------------------------------------------------------------
[Statedef 3120]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3020
juggle = 0

[State 3000, HitDef 1]
type = HitDef
trigger1 = !NumTarget(3004)
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 1
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 4, 4
animType = Hard
;air.animType = Back
;fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
kill = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, landing explode]
type = Explod
trigger1 = time = 2
anim = 7362
sprpriority = 4
postype = p1
pos = 10,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
[State 0, landing explode]
type = Explod
trigger1 = time = 2
anim = 7363
sprpriority = 4
postype = p1
pos = 10,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 4,0.1
ownpal = 1
persistent = 0

[State 0, Explod]
type = Explod
trigger1 = Time = 2
anim = 7330
sprpriority = -1
postype = back
pos = -20,30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
ownpal = 1

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time=0
time = 20
add = 0,0,0
mul = 0,0,0
[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, TargetBind]
type = TargetBind
trigger1 =  time = 0
time = 2
pos = 10,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 1
x = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = time>=0
value = 0
[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, VelSet]
type = VelSet
trigger1 =time >= 3
x = 30

[State 0, ChangeState]
type = ChangeState
trigger1 = frontedgedist <= 20
ctrl = 0
value = 3121

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = p2bodydist X <10
value = 5,3
persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = p2bodydist X <10
value = 0,1001
persistent = 0
[State 0, EnvShake]
type = EnvShake
trigger1 = p2bodydist X <10
time = 5
freq = 100
ampl = -6
persistent = 0
;-----------------------------------------------------------------------
[Statedef 3121]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3020
juggle = 0

[State 3000, HitDef 1]
type = HitDef
trigger1 = !NumTarget(3004)
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 1
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 4, 4
animType = Hard
;air.animType = Back
;fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
kill = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, landing explode]
type = Explod
trigger1 = time = 3
anim = 7362
sprpriority = 4
postype = p1
pos = 20,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
[State 0, landing explode]
type = Explod
trigger1 = time = 3
anim = 7363
sprpriority = 4
postype = p1
pos = 20,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 4,0.1
ownpal = 1
persistent = 0

[State 0, Explod]
type = Explod
trigger1 = Time = 2
anim = 7340
sprpriority = -1
postype = back
pos = -20,30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
ownpal = 1

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time=0
time = 20
add = 0,0,0
mul = 0,0,0
[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
;ignorehitpause =
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 =time=0
x = -40

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, VelSet]
type = VelSet
trigger1 =time>=0
x = 30

[State 0, ChangeState]
type = ChangeState
trigger1 = frontedgedist <= 20
ctrl = 0
value = 3122

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = p2bodydist X <10
value = 5,3
persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = p2bodydist X <10
value = 0,1001
persistent = 0
persistent = 0
[State 0, EnvShake]
type = EnvShake
trigger1 = p2bodydist X <10
time = 5
freq = 100
ampl = -6
persistent = 0
;-----------------------------------------------------------------------
[Statedef 3122]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3020
juggle = 0

[State 3000, HitDef 1]
type = HitDef
trigger1 = !NumTarget(3004)
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 1
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 4, 4
animType = Hard
;air.animType = Back
;fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
kill = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, landing explode]
type = Explod
trigger1 = time = 4
anim = 7362
sprpriority = 4
postype = p1
pos = 30,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
[State 0, landing explode]
type = Explod
trigger1 = time = 4
anim = 7363
sprpriority = 4
postype = p1
pos = 30,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 4,0.1
ownpal = 1
persistent = 0

[State 0, Explod]
type = Explod
trigger1 = Time = 2
anim = 7350
sprpriority = -1
postype = back
pos = -20,30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
ownpal = 1

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time=0
time = 20
add = 0,0,0
mul = 0,0,0
[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
;ignorehitpause =
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 =time=0
x = -40

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, VelSet]
type = VelSet
trigger1 =time>=0
x = 30

[State 0, ChangeState]
type = ChangeState
trigger1 = frontedgedist <= 20
ctrl = 0
value = 3123

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = p2bodydist X <10
value = 5,3
persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = p2bodydist X <10
value = 0,1001
persistent = 0
[State 0, EnvShake]
type = EnvShake
trigger1 = p2bodydist X <10
time = 5
freq = 100
ampl = -6
persistent = 0
;-----------------------------------------------------------------------
[Statedef 3123]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3020
juggle = 0

[State 3000, HitDef 1]
type = HitDef
trigger1 = !NumTarget(3004)
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 1
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 4, 4
animType = Hard
;air.animType = Back
;fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
kill = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, landing explode]
type = Explod
trigger1 = time = 4
anim = 7362
sprpriority = 4
postype = p1
pos = 30,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
[State 0, landing explode]
type = Explod
trigger1 = time = 4
anim = 7363
sprpriority = 4
postype = p1
pos = 30,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 4,0.1
ownpal = 1
persistent = 0

[State 0, Explod]
type = Explod
trigger1 = Time = 2
anim = 7360
sprpriority = -1
postype = back
pos = -20,30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
ownpal = 1

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time=0
time = 20
add = 0,0,0
mul = 0,0,0
[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
;ignorehitpause =
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 =time=0
x = -40

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, VelSet]
type = VelSet
trigger1 =time>=0
x = 30

[State 0, ChangeState]
type = ChangeState
trigger1 = frontedgedist <= 20
ctrl = 0
value = 3124

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = p2bodydist X <10
value = 5,3
persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = p2bodydist X <10
value = 0,1001
persistent = 0
[State 0, EnvShake]
type = EnvShake
trigger1 = p2bodydist X <10
time = 5
freq = 100
ampl = -6
persistent = 0
;-----------------------------------------------------------------------
[Statedef 3124]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3020
juggle = 0

[State 3000, HitDef 1]
type = HitDef
trigger1 = !NumTarget(3004)
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 1
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 4, 4
animType = Hard
;air.animType = Back
;fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
kill = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, landing explode]
type = Explod
trigger1 = time = 4
anim = 7362
sprpriority = 4
postype = p1
pos = 30,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
[State 0, landing explode]
type = Explod
trigger1 = time = 4
anim = 7363
sprpriority = 4
postype = p1
pos = 30,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 4,0.1
ownpal = 1
persistent = 0

[State 0, Explod]
type = Explod
trigger1 = Time = 2
anim = 7330
sprpriority = -1
postype = back
pos = -20,30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
ownpal = 1

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time=0
time = 20
add = 0,0,0
mul = 0,0,0
[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
;ignorehitpause =
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 =time=0
x = -40

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, VelSet]
type = VelSet
trigger1 =time>=0
x = 30

[State 0, ChangeState]
type = ChangeState
trigger1 = frontedgedist <= 20
ctrl = 0
value = 3125

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = p2bodydist X <10
value = 5,3
persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = p2bodydist X <10
value = 0,1001
persistent = 0
[State 0, EnvShake]
type = EnvShake
trigger1 = p2bodydist X <10
time = 5
freq = 100
ampl = -6
persistent = 0
;-----------------------------------------------------------------------
[Statedef 3125]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3020
juggle = 0

[State 3000, HitDef 1]
type = HitDef
trigger1 = !NumTarget(3004)
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 1
ID = 3100
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 4, 4
guard.pauseTime = 4, 4
animType = Hard
;air.animType = Back
;fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -3.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
kill = 0
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 0, landing explode]
type = Explod
trigger1 = time = 4
anim = 7362
sprpriority = 4
postype = p1
pos = 30,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
[State 0, landing explode]
type = Explod
trigger1 = time = 4
anim = 7363
sprpriority = 4
postype = p1
pos = 30,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 4,0.1
ownpal = 1
persistent = 0

[State 0, Explod]
type = Explod
trigger1 = Time = 2
anim = 7350
sprpriority = -1
postype = back
pos = -20,30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
ownpal = 1

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time=0
time = 20
add = 0,0,0
mul = 0,0,0
[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
;ignorehitpause =
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 =time=0
x = -40

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, VelSet]
type = VelSet
trigger1 =time>=0
x = 30

[State 0, ChangeState]
type = ChangeState
trigger1 = frontedgedist <= 20
ctrl = 0
value = 3126

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = p2bodydist X <10
value = 5,3
persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = p2bodydist X <10
value = 0,1001
persistent = 0
[State 0, EnvShake]
type = EnvShake
trigger1 = p2bodydist X <10
time = 5
freq = 100
ampl = -6
persistent = 0
;-----------------------------------------------------------------------
[Statedef 3126]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3040
juggle = 0

[State 0, landing explode]
type = null;Explod
trigger1 = time = 8
anim = 7362
sprpriority = 4
postype = p1
pos = 10,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 1,1
ownpal = 1
persistent = 0
[State 0, landing explode]
type = null;Explod
trigger1 = time = 8
anim = 7363
sprpriority = 4
postype = p1
pos = 10,-50
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 1
scale = 4,0.1
ownpal = 1
persistent = 0

[State 0, Explod]
type = Explod
trigger1 = Time = 2
anim = 7340
sprpriority = -1
postype = back
pos = -20,30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
ownpal = 1

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time=0
time = 10
add = 0,0,0
mul = 0,0,0
[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
;ignorehitpause =
persistent = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,1

[State 0, VelSet]
type = VelSet
trigger1 =time>=4
x = 50
[State 0, VelSet]
type = VelSet
trigger1 =time>=8
x = 28
[State 0, VelSet]
type = VelSet
trigger1 =time>=14
x = 20

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
ctrl = 1
value = 0

[State 3000, Additional Hits]
type = Helper
trigger1 = (Time = [5,28]) && !(Time % 5)
helperType = Normal
stateNo = 3002
ID = 3002
name = "Additional Hits"
posType = P2
pos = 0,0

[State 3000, Additional Hits]
type = Helper
trigger1 = !NumHelper(3004)
trigger1 = Time = 32
helperType = Normal
stateNo = 3008
ID = 3008
name = "Additional Hits"
posType = P2
pos = 0,0

persistent = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = p2bodydist X <10
value = 0,1001
persistent = 0
[State 0, EnvShake]
type = EnvShake
trigger1 = p2bodydist X <10
time = 5
freq = 100
ampl = -6
persistent = 0

[State 0, BGPalFX]
type = BGPalFX
trigger1 = Time = 8
time = 14
add = 0,0,0
mul = 0,0,0
;persistent =
[State 0, PalFX]
type = PalFX
trigger1 = Time = 7
time = 4
add = 0,0,0
mul = 0,0,0
invertall = 0
color = 256
;persistent =
[State 0, Pause]
type = Pause
trigger1 = Time = 8
time = 10
movetime = 0
[State 0, Explod]
type = Explod
trigger1 = Time = 8
anim = 3298
sprpriority = -1
postype = back
pos = -20,-100
bindtime = 1
pausemovetime = 10
removetime = -2
ignorehitpause = 0
scale = 0.5,1
ownpal = 1

;-----------------------------------------------------------------------
[Statedef 3130]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -60
kill = 0

[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3030

[State 0, PosSet]
type = PosSet
trigger1 = time >= 0
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3121
value = 3131
ctrl = 0

[Statedef 3131]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -60
kill = 0

[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3030

[State 0, PosSet]
type = PosSet
trigger1 = time >= 0
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3122
value = 3132
ctrl = 0

[Statedef 3132]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -60
kill = 0

[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3030

[State 0, PosSet]
type = PosSet
trigger1 = time >= 0
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3123
value = 3133
ctrl = 0

[Statedef 3133]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -60
kill = 0

[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3030

[State 0, PosSet]
type = PosSet
trigger1 = time >= 0
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3124
value = 3134
ctrl = 0

[Statedef 3134]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -60
kill = 0

[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3030

[State 0, PosSet]
type = PosSet
trigger1 = time >= 0
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3125
value = 3135
ctrl = 0

[Statedef 3135]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -60
kill = 0

[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3030

[State 0, PosSet]
type = PosSet
trigger1 = time >= 0
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3126
value = 3136
ctrl = 0

[Statedef 3136]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -60
kill = 1

[State 0, PalFX]
type = PalFX
trigger1 = time=1
time = 6
add = 0,0,0
mul = 0,0,0

[State 0, Turn]
type = Turn
trigger1 = time=0
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3030

[State 0, PosSet]
type = PosSet
trigger1 = time >= 0
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3126
value = 3137
ctrl = 0

[Statedef 3137]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, PalFX]
type = PalFX
trigger1 = Time = 0
time = 4
add = 0,0,0
mul = 0,0,0
invertall = 0
color = 256

[State 0, Turn]
type = Turn
trigger1 = time = 0
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3030

[State 0, EnvShake]
type = EnvShake
trigger1 =time >= 6 && Pos Y >= 0
time = 20
freq = 100
ampl = -6

[State 0, NotHitBy]
type = NotHitBy
trigger1 =  time>=0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 1
;ignorehitpause =
;persistent =

[State 0, ChangeAnim]
type = Changestate
trigger1 = Time = 60
value = 5950

[State 450, End]
type = ChangeState
trigger1 = !AnimTime
value = 5100
ctrl = 1
;anim =
;ctrl =
;ignorehitpause = 0
;persistent = 1

;====<Shitenshuu>=
[StateDef 3200]
type = S
physics = S
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
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
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

[State 3000,AfterImage]
type = AfterImage
trigger1 = time = 0
time = 999999999
length = 9
TimeGap = 2
FrameGap = 3
palbright = 0,0,0
palcontrast = 255,255,255
palpostbright = 0,0,0
paladd = -30,-30,-30
palmul = .75,.75,.75
trans = add1

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

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(8 * const(size.xScale)), ceil(-64 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 180,0
channel = 0

[State 3200, Sound]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 13
value = 4,1
channel = 0

[State 240, HitDef 1]
type = HitDef
trigger1 = Anim = 3200
trigger1 = Animelem = 11||Animelem = 13
attr = S, HA
animtype = H
damage = 20,10
guardflag = M
pausetime = 2,3
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -30 + 0 * (var(35) := 107), var(36) := -70
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = H
ground.slidetime = 10
ground.hittime = 30
ground.velocity = 0,0
air.velocity = 0,0
envshake.time = 10
envshake.freq = 60
envshake.ampl = -4
envshake.phase = 60
getpower = 0
givepower = 20
p1facing = 1
p2facing = 1
down.bounce = 0
kill = 0

[State 240, HitDef 2]
type = HitDef
trigger1 = Anim = 3200
trigger1 = Animelem = 15
attr = S, HA
animtype = H
damage = ifelse(var(1)=1,100,ifelse(var(1)=2,170,90)),10
guardflag = M
pausetime = 0,0
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -30 + 0 * (var(35) := 107), var(36) := -70
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = H
ground.slidetime = 10
ground.hittime = 30
ground.velocity = -15
air.velocity = -5,-4
envshake.time = 20
envshake.freq = 120
envshake.ampl = -4
envshake.phase = 160
getpower = 0
givepower = 20
air.fall = 1
fall.recover = 0
p1facing = 1
p2facing = 1
down.bounce = 0
id = 3200

[State -3, ]
type=helper
triggerall=!NumHelper(3210+id)
triggerall=movehit
trigger1 = Anim = 3200
trigger1 = Animelem = 15
helpertype=normal
name="shi"
stateno=3210
ID=3210+id
pos=0,-100
postype = p2
facing = ifelse(facing = 1,-1,1)
keyctrl=0

[State 240, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<Shitenshuu Max>=
[StateDef 3250]
type = S
physics = S
moveType = A
anim = 3201
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3200, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Custom Combo Reset]
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

[State 3000,AfterImage]
type = AfterImage
trigger1 = time = 0
time = 999999999
length = 9
TimeGap = 2
FrameGap = 3
palbright = 0,0,0
palcontrast = 0,0,150
palpostbright = 0,0,0
paladd = -30,-30,-30
palmul = .75,.75,.75
trans = add1

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

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(8 * const(size.xScale)), ceil(-64 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 180,0
channel = 0

[State 3200, Sound]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 13
trigger3 = AnimElem = 15
trigger4 = AnimElem = 17
value = 4,1
channel = 0

[State 240, HitDef 1]
type = HitDef
trigger1 = Anim = 3200
trigger1 = Animelem = 11||Animelem = 13
trigger2 = Anim = 3201
trigger2 = Animelem = 11||Animelem = 13||Animelem = 15||Animelem = 17
attr = S, HA
animtype = H
damage = 20,10
guardflag = M
pausetime = 2,3
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -30 + 0 * (var(35) := 107), var(36) := -70
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = H
ground.slidetime = 10
ground.hittime = 30
ground.velocity = 0,0
air.velocity = 0,0
envshake.time = 10
envshake.freq = 60
envshake.ampl = -4
envshake.phase = 60
getpower = 0
givepower = 20
p1facing = 1
p2facing = 1
down.bounce = 0
kill = 0

[State 240, HitDef 2]
type = HitDef
trigger1 = Anim = 3200
trigger1 = Animelem = 15
trigger2 = Anim = 3201
trigger2 = Animelem = 20
attr = S, HA
animtype = H
damage = ifelse(var(1)=1,100,ifelse(var(1)=2,170,90)),10
guardflag = M
pausetime = 0,0
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -30 + 0 * (var(35) := 107), var(36) := -70
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = H
ground.slidetime = 10
ground.hittime = 30
ground.velocity = -15
air.velocity = -5,-4
envshake.time = 20
envshake.freq = 120
envshake.ampl = -4
envshake.phase = 160
getpower = 0
givepower = 20
air.fall = 1
fall.recover = 0
p1facing = 1
p2facing = 1
down.bounce = 0
id = 3200

[State -3, ]
type=helper
triggerall=!NumHelper(3210+id)
triggerall=movehit
trigger1 = Anim = 3200
trigger1 = Animelem = 15
trigger2 = Anim = 3201
trigger2 = Animelem = 20
helpertype=normal
name="shi"
stateno=3210
ID=3210+id
pos=0,-100
postype = p2
facing = ifelse(facing = 1,-1,1)
keyctrl=0

[State 240, ??????]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Finish
[Statedef 3210]
type=S
movetype=A
anim = 3210+var(2)

[State 1001, Varset]
type = VarSet
Triggerall = PrevStateno != 3210
trigger1 = Time = 0
var(1) = root,var(1)
IgnoreHitPause = 1
Persistent = 1

[State -2, Varset]
Type = VarSet
trigger1 = RoundState = 2
var(30) = 0 + (NumEnemy = 2 && EnemyNear(0),life <= 0||EnemyNear(0),stateno = 5150)
IgnoreHitPause = 1

[State 40, 3]
type = ChangeAnim
trigger1 = var(1) = 1
trigger1 = Time >= 54
trigger2 = var(1) = 2
trigger2 = Time >= 50
value = 3210+var(2)
elem = 2

[state 2110+id, Posset]
type= posset
trigger1= 1
x = EnemyNear(var(30)),pos X
ignorehitpause=1

[State -3, Varadd]
Type = Varadd
Trigger1 = time = 0
var(2) = 1
ignorehitpause = 1

[state 2110+id, Selfstate]
type=selfstate
trigger1=!ishelper
value=50
ctrl=1

[state 2110+id, Assertspecial]
type=assertspecial
trigger1=1
flag=noshadow
ignorehitpause=1

[State 3000, NotHitby]
type = NotHitBy
trigger1=1
value = SCA

[State 240, HitDef 1]
type = HitDef
trigger1 = Anim != 3219
attr = S, HT
animtype = H
damage = 15
pausetime = 0,0
hitflag = MA-
sparkno = -1
guard.sparkno = -1
hitsound = S3200,0
guardsound = -1
ground.type = L
ground.slidetime = 0
ground.hittime = 0
getpower = 0
givepower = 0
down.bounce = 0
guard.dist = 0
p1stateno = 3210
id = 3200
palfx.time = 10
palfx.add = 80,-70,-200
palfx.sinadd = 0,30,0,10
palfx.color = 0

[State 240, HitDef 2]
type = HitDef
trigger1 = Anim = 3219
attr = S, HT
animtype = H
damage = 15
pausetime = 0,0
hitflag = MA-
sparkno = -1
guard.sparkno = -1
hitsound = S3200,1
guardsound = -1
ground.type = L
ground.slidetime = 0
ground.hittime = 0
getpower = 0
givepower = 0
down.bounce = 0
guard.dist = 0
p2stateno = 3215
id = 3200
palfx.time = 10
palfx.add = 80,-70,-200
palfx.sinadd = 0,30,0,10
palfx.color = 0

[state 2110+id, Destroyself]
type=destroyself
triggerall=ishelper
trigger1=roundstate = 4
trigger2=root,stateno >= 5000
trigger3=movehit
trigger3= anim = 3219
ignorehitpause=1

;------------
;Dizzy anim
[Statedef 3215]
type = S
movetype = H
velset = 0,0
sprpriority = 2

[State 2021, Dizzy]
type = ChangeAnim
Trigger1 = time = 0
value = 5300

[State 2010, Posset]
type = posset
trigger1 = time = 0
y = 0

[State 2020, SelfState]
type = selfState
trigger1 = time > 140
value = 0
ctrl = 1

;====<Shitenketsu>=
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

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 0, NotHitBy]
type = NotHitBy
trigger1 =  time>=0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 10

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 180,0
channel = 0

[State 1001,1]
type = ChangeState
trigger1 = time = 48
value = 3310
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 3310]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3301
juggle = 0

[State 6699,Explod]
type = Explod
trigger1 = time = 6
anim = 6014
sprpriority = 2
facing= -1
postype = p1
pos = -20, 5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.8,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 6699,Explod]
type = Explod
trigger1 = time = 6
anim = 6080
sprpriority = -2
postype = p1
pos = 40, 5
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.4,1
vel = 0,0
ownpal = 1
supermove = 0

[State 0, hitdef]
type = HitDef
trigger1 = time = 0
priority = 5, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = S,HA				;STAND / NORMAL ATTACK
hitflag = MAF				;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard			; = medium		;2p ANIM
ground.type = high
damage = 15
getpower = 0
GivePower = ifelse ( var(20) > 0,40, 40)
pausetime = 0,0
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -14
air.velocity = -3,-8
yaccel = 0.55
guard.velocity = -14
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -70
sparkNo = -1
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 5
envshake.freq = 100
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak
p1stateno = 3302
p2stateno = 3305
p2facing = 1
p1facing = 1
fall = 0
air.fall = 0
fall.recover = 0
kill = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2
channel = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------------
[Statedef 3302]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3302
juggle = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 10
pos = 60,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3320
ctrl = 0

[State 6699,Explod]
type = Explod
trigger1 = time = 0
anim = 6014
sprpriority = 2
facing= -1
postype = p1
pos = -20, 5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.8,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 6699,Explod]
type = Explod
trigger1 = time = 0
anim = 6080
sprpriority = -2
postype = p1
pos = 100, 5
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 2,2
vel = 0,0
ownpal = 1
supermove = 0

[State 6699,Explod]
type = Explod
trigger1 = time = 0
anim = 6080
sprpriority = 2
postype = p1
pos = 80, 0
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.5,0.8
vel = 0,0
ownpal = 1
supermove = 0

[State 6699,Explod]
type = Explod
trigger1 = time = 0
anim = 7400
sprpriority = 2
postype = p1
pos = 100,-67
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6, 0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 6699,Explod]
type = Explod
trigger1 = time = 6
anim = 7450
sprpriority = 2
postype = p1
pos = 100,-67
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0

;-----------------------------------------------------------------------
[Statedef 3305]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3305

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 90
value = 3325
ctrl = 0
;-----------------------------------------------------------------------
[Statedef 3320]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3320
juggle = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = time = 3
trigger2 = time = 6
trigger3 = time = 9
trigger4 = time = 12
trigger5 = time = 15
trigger6 = time = 18
trigger7 = time = 21
trigger8 = time = 24
trigger9 = time = 27
trigger10 = time = 30
value = 1

[State 0,Explod]
type = Explod
trigger1 = time = 2
anim = 3297
sprpriority = 2
postype = p1
pos = 70,-30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 8,0

[State 0,Explod]
type = Explod
trigger1 = time = 4
anim = 3297
sprpriority = 2
postype = p1
pos = 80,-90
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 8,0

[State 0,Explod]
type = Explod
trigger1 = time = 6
anim = 3297
sprpriority = 2
postype = p1
pos = 80,-60
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 8,0

[State 0,Explod]
type = Explod
trigger1 = time = 8
anim = 3297
sprpriority = 2
postype = p1
pos = 90,-70
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 8,0

[State 0,Explod]
type = Explod
trigger1 = time = 10
anim = 3297
sprpriority = 2
postype = p1
pos = 90,-10
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 8,0

[State 0,Explod]
type = Explod
trigger1 = time = 12
anim = 3297
sprpriority = 2
postype = p1
pos = 90,-100
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 6,0

[State 0,Explod]
type = Explod
trigger1 = time = 14
anim = 3297
sprpriority = 2
postype = p1
pos = 60,-45
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 4,0

[State 0,Explod]
type = Explod
trigger1 = time = 16
anim = 3297
sprpriority = 2
postype = p1
pos = 80,-80
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 6,0

[State 0,Explod]
type = Explod
trigger1 = time = 18
anim = 3297
sprpriority = 2
postype = p1
pos = 70,-30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 2,0

[State 0,Explod]
type = Explod
trigger1 = time = 20
anim = 3297
sprpriority = 2
postype = p1
pos = 70,-70
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 8,0

[State 0,Explod]
type = Explod
trigger1 = time = 22
anim = 3297
sprpriority = 2
postype = p1
pos = 70,-55
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 4,0

[State 0,Explod]
type = Explod
trigger1 = time = 24
anim = 3297
sprpriority = 2
postype = p1
pos = 90,-95
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 6,0

[State 0,Explod]
type = Explod
trigger1 = time = 26
anim = 3297
sprpriority = 2
postype = p1
pos = 70,-30
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 8,0

[State 0,Explod]
type = Explod
trigger1 = time = 28
anim = 3297
sprpriority = 2
postype = p1
pos = 80,-90
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 2,0

[State 0,Explod]
type = Explod
trigger1 = time = 30
anim = 3297
sprpriority = 2
postype = p1
pos = 80,-60
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 8,0

[State 0,Explod]
type = Explod
trigger1 = time = 32
anim = 3297
sprpriority = 2
postype = p1
pos = 90,-70
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.3,0.3
ownpal = 1
supermove = 0
vel = 6,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
value = 1,0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
value = 2,0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 8
value = 2,1

[State 0, ScreenBound]
type = null;ScreenBound
trigger1 = time = 0
value = 1
movecamera = 0,0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 10
pos = 60,0

[State 0, ChangeState]
type = ChangeState
trigger1 = time=32
value = 3330
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 3330]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3330
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 80
value = 2,80

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 7450
sprpriority = 4
postype = p1
pos = 80,-20
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.1,0.1
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Explod]
type = Explod
trigger1 = time = 15
anim = 7450
sprpriority = 4
postype = p1
pos = 30,-80
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.7,0.7
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Explod]
type = Explod
trigger1 = time = 30
anim = 7450
sprpriority = 4
postype = p1
pos = 50,-30
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.8,0.8
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Explod]
type = Explod
trigger1 = time = 45
anim = 7450
sprpriority = 4
postype = p1
pos = 70,-60
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Explod]
type = Explod
trigger1 = time = 60
anim = 7450
sprpriority = 4
postype = p1
pos = 60,-50
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.7,0.7
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Explod]
type = Explod
trigger1 = time = 80
anim = 7450
sprpriority = 4
postype = p1
pos = 80,-20
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.1,0.1
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Explod]
type = Explod
trigger1 = time = 80
anim = 7450
sprpriority = 4
postype = p1
pos = 30,-80
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.7,0.7
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Explod]
type = Explod
trigger1 = time = 80
anim = 7450
sprpriority = 4
postype = p1
pos = 50,-30
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.8,0.8
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Explod]
type = Explod
trigger1 = time = 80
anim = 7450
sprpriority = 4
postype = p1
pos = 70,-60
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, Explod]
type = Explod
trigger1 = time = 80
anim = 7450
sprpriority = 4
postype = p1
pos = 60,-50
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.7,0.7
vel = 0,0
ownpal = 1
supermove = 0

[State 0, PlaySnd]
type = null; PlaySnd
trigger1 = time = 0
trigger2 = time = 15
trigger3 = time = 30
trigger4 = time = 45
trigger5 = time = 60
value = 930,0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
trigger2 = time = 15
trigger3 = time = 30
trigger4 = time = 45
trigger5 = time = 60
value = 2,7

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3340
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 3340]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 3340
juggle = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = time = 0
value = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = time=21
x = -40

[State 7450,Explod]
type = Explod
trigger1 = time = 0
anim = 7450
sprpriority = 3
postype = p1
pos = 80,-68
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 0
anim = 6009
sprpriority = 3
postype = p1
pos = 80,-68
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 6, 0.1
vel = 0,0
ownpal = 1
supermove = 0

[State 6699,Explod]
type = Explod
trigger1 = time = 21
anim = 7400
sprpriority = 2
postype = p1
pos = 100,-65
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.7,0.7
vel = 0,0
ownpal = 1
supermove = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 2,80
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 20
value = 0,1001
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 20
value = 2,2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 20
value = 40,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
x = 16
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
x = 12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 34
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 38
x = 0

;-----------------------------------------------------------------------
[Statedef 3325]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = animelem =1
trigger2 = animelem =2
trigger3 = animelem =3
trigger4 = animelem =4
value = -20
kill = 0

[State 0, PosSet]
type = PosSet
trigger1 =1
y = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3325

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3330
value = 3335
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 3335]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 =time = 0
trigger2 =time = 15
trigger3 =time = 30
trigger4 =time = 45
trigger5 =time = 60
value = -20
kill = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3335

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3340
value = 3345
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 3345]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 0, PalFX]
type = PalFX
trigger1 = time= 0
time = 20
add = 255,255,255
mul = 255,255,255

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3345

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 26
value = 3346
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 3346]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -25
kill = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 2999

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=0
value = 45

[State 0, PosAdd]
type = PosAdd
trigger1 = time=0
y = -60

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 4
value = 11,0

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 4
x = -6
y = -6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 8
y = -6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 12
y = -6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 16
y = -6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 20
y = -4
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 24
y = -2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 28
y = 0
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 32
y = 2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 36
y = 2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 40
y = 4
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 44
y = 6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 48
y = 8

[State 0, EnvShake]
type = EnvShake
trigger1 =time >= 6 && Pos Y >= 0
time = 20
freq = 100
ampl = -6

[State 0, NotHitBy]
type = NotHitBy
trigger1 =  time>=0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 1

;ignorehitpause =
;persistent =
[State 0, SelfState]
type = selfstate
trigger1 = Pos Y >= 0
value = 5100

;====<Yasen>=
[StateDef 3400]
type = S
physics = S
moveType = A
anim = 3400
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

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(command = "c", 2, ifElse(command = "b", 1, 0))

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

[State 3000, Push]
type = Playerpush
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(10) < 0
value = 0

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 12
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-60 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 6
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3000,0
channel = 0

[State 110, Dust Helper]
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

[State 2100, ChangeState]
type = ChangeState
trigger1 = time = 60
value = 3410
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 3410]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3410
juggle = 0

[State 10210, Skid Dust]
type = Explod
trigger1 = AnimElem = 4
trigger2 = AnimElem = 8
trigger3 = AnimElem = 12
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 38
x = 0

[State 205,2]
type = HitDef
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
trigger5 = animelem = 9
trigger6 = animelem = 11
trigger7 = animelem = 13
priority = 6, Hit	;2 for ??, 3 for L, 4 for M/H, 5 for special, 6 fot hyper
attr = C,HA		;STAND / NORMAL ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
hitflag = MAF
animtype = hard         ;2p ANIM, light", "medium", "hard", "back", "up",or "diagup".
air.animtype = hard	;2p ANIM
ground.type = low	;  high,middle,low,trip
damage = 10,2
pausetime = 4,4
guard.pausetime = 4,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 11
guard.ctrltime = 11
ground.velocity = -2
air.velocity = -1,-1
yaccel = 0.6
guard.velocity = -7
ground.cornerpush.veloff =  -5
guard.cornerpush.veloff =  -5
getpower = 0
GivePower = 10
fall = 0
air.fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -0 + 0 * (var(35) := 57), var(36) := -10
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak

[State 205,2]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 6
trigger4 = animelem = 8
trigger5 = animelem = 10
trigger6 = animelem = 12
trigger7 = animelem = 18
priority = 6, Hit	;2 for ??, 3 for L, 4 for M/H, 5 for special, 6 fot hyper
attr = C,HA		;STAND / NORMAL ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
hitflag = MAF
animtype = hard         ;2p ANIM, light", "medium", "hard", "back", "up",or "diagup".
air.animtype = hard	;2p ANIM
ground.type = high	;  high,middle,low,trip
damage = 10,2
pausetime = 4,4
guard.pausetime = 4,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 11
guard.ctrltime = 11
ground.velocity = -2
air.velocity = -1,-1
yaccel = 0.6
guard.velocity = -7
ground.cornerpush.veloff =  -5
guard.cornerpush.veloff =  -5
getpower = 0
GivePower = 10
fall = 0
air.fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -0 + 0 * (var(35) := 57), var(36) := -10
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 5
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak

[State 210,2]
type = HitDef
trigger1 = animelem = 19
priority = 5, Hit
attr = S,HA		;STAND / NORMAL ATTACK
hitflag = MAF		;MIDDLE ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
animtype = hard	 	;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard	; = medium		;2p ANIM
ground.type = high
damage = 30,6
getpower = 0
GivePower = 40
pausetime = 18,18
guard.pausetime = 12,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-8
air.velocity = -2,-8
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff =  -5
guard.cornerpush.veloff =  -20
fall = 1
air.fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -40 + 0 * (var(35) := 57), var(36) := -80
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 10
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 5
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 19
value = 4,4
channel = 0

[State 2110, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<Yasen Max>=
[StateDef 3450]
type = S
physics = S
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(command = "c", 2, ifElse(command = "b", 1, 0))

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

[State 3000, Push]
type = Playerpush
trigger1 = AnimElemTime(8) >= 0 && AnimElemTime(10) < 0
value = 0

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 12
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-60 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 6
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3000,0
channel = 0

[State 110, Dust Helper]
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

[State 2100, ChangeState]
type = ChangeState
trigger1 = time = 60
value = 3460
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 3460]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3410
juggle = 0

[State 10210, Skid Dust]
type = Explod
trigger1 = AnimElem = 4
trigger2 = AnimElem = 8
trigger3 = AnimElem = 12
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 38
x = 0

[State 205,2]
type = HitDef
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
trigger5 = animelem = 9
trigger6 = animelem = 11
trigger7 = animelem = 13
priority = 6, Hit	;2 for ??, 3 for L, 4 for M/H, 5 for special, 6 fot hyper
attr = C,HA		;STAND / NORMAL ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
hitflag = MAF
animtype = hard         ;2p ANIM, light", "medium", "hard", "back", "up",or "diagup".
air.animtype = hard	;2p ANIM
ground.type = low	;  high,middle,low,trip
damage = 10,2
pausetime = 4,4
guard.pausetime = 4,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 11
guard.ctrltime = 11
ground.velocity = -2
air.velocity = -1,-1
yaccel = 0.6
guard.velocity = -7
ground.cornerpush.veloff =  -5
guard.cornerpush.veloff =  -5
getpower = 0
GivePower = 10
fall = 0
air.fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -0 + 0 * (var(35) := 57), var(36) := -10
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak

[State 205,2]
type = HitDef
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 6
trigger4 = animelem = 8
trigger5 = animelem = 10
trigger6 = animelem = 12
trigger7 = animelem = 18
priority = 6, Hit	;2 for ??, 3 for L, 4 for M/H, 5 for special, 6 fot hyper
attr = C,HA		;STAND / NORMAL ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
hitflag = MAF
animtype = hard         ;2p ANIM, light", "medium", "hard", "back", "up",or "diagup".
air.animtype = hard	;2p ANIM
ground.type = high	;  high,middle,low,trip
damage = 10,2
pausetime = 4,4
guard.pausetime = 4,4
ground.slidetime = 10
ground.hittime = 10
air.hittime = 20
guard.hittime = 11
guard.ctrltime = 11
ground.velocity = -2
air.velocity = -1,-1
yaccel = 0.6
guard.velocity = -7
ground.cornerpush.veloff =  -5
guard.cornerpush.veloff =  -5
getpower = 0
GivePower = 10
fall = 0
air.fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -0 + 0 * (var(35) := 57), var(36) := -10
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 5
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak

[State 210,2]
type = HitDef
trigger1 = animelem = 19
priority = 5, Hit
attr = S,HA		;STAND / NORMAL ATTACK
hitflag = MAF		;MIDDLE ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
animtype = hard	 	;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard	; = medium		;2p ANIM
ground.type = high
damage = 30,6
getpower = 0
GivePower = 40
pausetime = 18,18
guard.pausetime = 12,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-8
air.velocity = -2,-8
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff =  -5
guard.cornerpush.veloff =  -20
fall = 1
air.fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -40 + 0 * (var(35) := 57), var(36) := -80
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 10
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 5
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak

[State 3200, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 19
value = 4,4
channel = 0

[State 2110, ChangeState]
type = ChangeState
trigger1 = time > 35 && movehit = 1
value = 3420
ctrl = 0

[State 2110, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;-----------------------------------------------------------------------
[Statedef 3420]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3420
juggle = 0

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8100
ID = 8100
name = "Gekiro Dust"
posType = P1
ownPal = 1

[State 2310, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 4
x = 4
y = -9
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 8
y = -8
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 12
y = -6
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 16
y = -4
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 20
x = 2
y = -2
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 24
y = -1
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 38
y = -0.5
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 42
x = 0
y = -0.5
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 46
y = -0.5
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 50
y = -0.5
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 54
y = 0
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 58
y = 0
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 62
y = 1
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 66
y = 1
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 70
y = 1
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 74
y = 2
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 78
y = 4
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 82
y = 6
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 86
y = 8
[State 2310, VelSet]
type = VelSet
trigger1 = time >= 90
y = 10

[State 205,2]
type = HitDef
trigger1 = animelem = 1
priority = 6, Hit	;2 for ??, 3 for L, 4 for M/H, 5 for special, 6 fot hyper
attr = A,HA		;STAND / NORMAL ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
hitflag = MAF
animtype = hard         ;2p ANIM, light", "medium", "hard", "back", "up",or "diagup".
air.animtype = hard	;2p ANIM
ground.type = low	;  high,middle,low,trip
damage = 10,2
pausetime = 12,12
guard.pausetime = 12,12
ground.slidetime = 17
ground.hittime = 17
air.hittime = 20
guard.hittime = 17
guard.ctrltime = 17
ground.velocity = -1,-10
air.velocity = -1,-10
yaccel = 0.5
guard.velocity = -7
ground.cornerpush.veloff =  -5
guard.cornerpush.veloff =  -5
getpower = 0
GivePower = 10
fall = 1
air.fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -40 + 0 * (var(35) := 57), var(36) := -80
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)

[State 210,2]
type = HitDef
trigger1 = animelem = 6
trigger2 = animelem = 10
trigger3 = animelem = 14
trigger4 = animelem = 20
priority = 5, Hit
attr = S,HA		;STAND / NORMAL ATTACK
hitflag = MAF		;MIDDLE ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
animtype = hard	 	;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard	; = medium		;2p ANIM
ground.type = high
damage = 10,2
getpower = 0
GivePower = 10
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-8
air.velocity = -1,-3
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff =  -5
guard.cornerpush.veloff =  -5
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -40 + 0 * (var(35) := 57), var(36) := -80
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 5
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak

[State 210,2]
type = HitDef
trigger1 = animelem = 8
trigger2 = animelem = 12
trigger3 = animelem = 16
priority = 5, Hit
attr = S,HA		;STAND / NORMAL ATTACK
hitflag = MAF		;MIDDLE ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
animtype = medium 	;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = medium	; = medium		;2p ANIM
ground.type = high
damage = 10,2
getpower = 0
GivePower = 10
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,-8
air.velocity = -1,-3
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff =  -5
guard.cornerpush.veloff =  -5
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -40 + 0 * (var(35) := 57), var(36) := -80
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 5
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 5
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak

[State 210,2]
type = HitDef
trigger1 = animelem = 24
priority = 6, Hit
attr = S,HA		;STAND / NORMAL ATTACK
hitflag = MAF		;MIDDLE ATTACK
guardflag = M		;GUARD is MIDDLE /L is LOW
animtype = hard	 	;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard	; = medium		;2p ANIM
ground.type = high
damage = 30,10
getpower = 0
GivePower = 10
pausetime = 20,20
guard.pausetime = 12,12
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -8,10
air.velocity = -8,10
yaccel = 0.6
guard.velocity = -12
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -40 + 0 * (var(35) := 57), var(36) := -80
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 20
envshake.freq = 100
envshake.ampl = 10
fall.envshake.time = 5
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak

[State 2310,ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3430
ctrl = 0

;------------------------------------------------------------------------
[Statedef 3430]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 3430
juggle = 0
poweradd = 0

[State 1215,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 1215,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<JYAKOHA>=
[StateDef 13000]
type = S
physics = N
moveType = A
anim = 13000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 13000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 13000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 13000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 13000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 13000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 13000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 13000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 13000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(Command = "c", 2, ifElse(Command = "b", 1, 0))

[State 13000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 13000, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-15 * const(size.xScale)), ceil(-72 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 13000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 13000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 13000, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,3
channel = 0

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1
channel = 1

[State 13000, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse(var(10) = 2, 13, ifElse(var(10) = 1, 8.75, 3))
y = ifElse(var(10) = 2, -9.45, ifElse(var(10) = 1, -13, -15.375))

[State 13000, VelSet]
type = VelSet
trigger1 = AnimElem = 5
y = 0

[State 13000, VelMul]
type = VelMul
trigger1 = AnimElemTime(5) < 0
x = 0.922
y = 0.922

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) >= 0
y = 0.5

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Gekiro Dust"
posType = P1
ownPal = 1

[State 3200, Safety]
type = SuperPause
trigger1 = AnimElem = 3 && NumEnemy
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
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElemTime(3) < 5 ;&& !var(43)
;trigger1 = P2Dist x >= 0 && P2BodyDist x <= 41
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
p1StateNo = 13040
p2Facing = 1

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;Success
[StateDef 13040]
type = A
anim = 13050
physics = N
moveType = A
velSet = 8, -8

[State 3210, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 50

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = -70

[State 13000, VelMul]
type = VelMul
trigger1 = AnimElemTime(6) < 0
x = 0.922
y = 0.922

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
value = 1100,1
channel = 1

[State 3210, Grab Sound]
type = PlaySnd
trigger1 = Time = 1
value = 2,800
channel = 2

[State 3210, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 13075

[State 3210, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 27, -42

[State 3210, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 27,-63

[State 3210, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 43,-73

[State 3210, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 47,-59

[State 3210, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -35,-90

[State 3210, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0
pos = -35,-60

[State 3210, VelAdd]
type = VelSet
trigger1 = AnimElem = 5
X = 0

[State 3210, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
Y = 0.5

[State 2310, PlaySnd]
type = PlaySnd
trigger1 = time = 34
trigger2 = time = 38
trigger3 = time = 42
trigger4 = time = 46
value = 2,900

[State 3210, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 13045

;Finish
[StateDef 13045]
type = S
anim = 13055
physics = N
moveType = A
velSet = 0,0

[State 13055, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 13055, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 13055, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 13076

[State 13055, Slammed to the Ground Sound]
type = PlaySnd
trigger1 = !Time
value = 820,2
channel = 3

[State 13055, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 0, 0
ownPal = 1

[State 13055, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3211, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = 0,0

[State 3211, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = floor(ifElse(210 * fvar(11) < 7, -7, -180 * fvar(11)))

[State 13055, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && !Time
value = 36

[State 13055, HitAdd]
type = HitAdd
trigger1 = NumTarget && !Time
value = 1

[State 13055, HitCount]
type = VarAdd
trigger1 = NumTarget && !Time
var(13) = 1

[State 13055, Juggle]
type = VarAdd
trigger1 = NumTarget && !Time
var(15) = 1
ignoreHitPause = 1

[State 13055, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 14
ampl = -4
freq = 120

[State 13055, TargetState]
type = TargetState
trigger1 = AnimElem = 2 && NumTarget
value = 13076

[State 13055, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = -4
y = -5.6

[State 13055, Gravity]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.45

[State 13055, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 13055, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;Jyakoha (Target)
[StateDef 13075]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 13075, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 13075

[State 13075, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

;After Throw
[StateDef 13076]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0, 0

[State 3216, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5080

[State 3216, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 38
value = 13076
persistent = 0

[State 3216, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
moveCamera = 1,0
ignoreHitPause = 1

[State 3216, VelSet]
type = VelSet
Trigger1 = 1
y = 0

[State 1114003, End]
type = SelfState
trigger1 = Time >= 12 && !Alive
value = 5150

[State 1114003, End]
type = SelfState
trigger1 = Time >= 72 && Alive
value = 5120

;====<JYAKOHA Max>=
[StateDef 13050]
type = S
physics = N
moveType = A
anim = 13000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 13000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 13000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 13000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 13000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 13000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 13000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 13000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(Command = "c" && Command = "b", 2, ifElse(Command = "b" && Command = "a", 1, 0))

[State 13000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3000,AfterImage]
type = AfterImage
trigger1 = time = 0
time = 999999999
length = 9
TimeGap = 2
FrameGap = 3
palbright = 0,0,0
palcontrast = 0,0,150
palpostbright = 0,0,0
paladd = -30,-30,-30
palmul = .75,.75,.75
trans = add1

[State 13000, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-15 * const(size.xScale)), ceil(-72 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 13000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 13000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 13000, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,3
channel = 0

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1
channel = 1

[State 13000, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse(var(10) = 2, 13, ifElse(var(10) = 1, 8.75, 3))
y = ifElse(var(10) = 2, -9.45, ifElse(var(10) = 1, -13, -15.375))

[State 13000, VelSet]
type = VelSet
trigger1 = AnimElem = 5
y = 0

[State 13000, VelMul]
type = VelMul
trigger1 = AnimElemTime(5) < 0
x = 0.922
y = 0.922

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) >= 0
y = 0.5

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Gekiro Dust"
posType = P1
ownPal = 1

[State 3200, Safety]
type = SuperPause
trigger1 = AnimElem = 3 && NumEnemy
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
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElemTime(3) < 5 ;&& !var(43)
;trigger1 = P2Dist x >= 0 && P2BodyDist x <= 41
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
p1StateNo = 13051
p2Facing = 1

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;Success
[StateDef 13051]
type = A
anim = 13050
physics = N
moveType = A
velSet = 8, -8

[State 3210, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 50

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = -70

[State 13000, VelMul]
type = VelMul
trigger1 = AnimElemTime(6) < 0
x = 0.922
y = 0.922

[State 3210, Grab Sound]
type = PlaySnd
trigger1 = Time = 1
value = 2,800
channel = 2

[State 3210, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 13075

[State 3210, TargetBind 1]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0
pos = 27, -42

[State 3210, TargetBind 2]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
pos = 27,-63

[State 3210, TargetBind 3]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 43,-73

[State 3210, TargetBind 4]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 47,-59

[State 3210, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = -35,-90

[State 3210, TargetBind 5]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemTime(6) >= 0
pos = -35,-60

[State 2310, PlaySnd]
type = PlaySnd
trigger1 = time = 34
trigger2 = time = 38
trigger3 = time = 42
trigger4 = time = 46
value = 2,900

[State 3210, VelAdd]
type = VelSet
trigger1 = AnimElem = 5
X = 0

[State 3210, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
Y = 0.5

[State 3210, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 13055

;-------------------
;???
[Statedef 13055]
type = A
movetype = A
physics = N
anim = 13055
VelSet = 0,0

[State 810, ]
type = posset
Trigger1 = anim = 13055
trigger1=AnimElem = 1
y = 0

[State 810, ????????]
type = TargetBind
Trigger1 = anim = 13055
trigger1 = AnimElem =1
pos = ceil(0*const(size.xscale)),ceil(0*const(size.yscale))
postype = P1
time = 1

[State 810, ??????????????]
type = TargetLifeAdd
Trigger1 = anim = 13055
trigger1 = AnimElem = 1
value = Ceil(-100*fvar(10)*(const(data.attack)*0.01))
kill = 0

[State -2, ?????]
type = PlaySnd
Trigger1 = anim = 13055
trigger1 = AnimElem = 1
value = 1, 2
ignorehitpause = 1

[State -2, ?????]
type = PlaySnd
Trigger1 = anim = 13055
trigger1 = AnimElem = 1
value = 820, 2
ignorehitpause = 1

[State -2, 3]
type = EnvShake
Trigger1 = anim = 13055
trigger1 = AnimElem = 1
time = 20
freq = 120
ampl = -12
phase = 120
ignorehitpause = 1

[State 13055, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 0, 0
ownPal = 1

[State 13055, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 811, ????????????]
type = ChangeAnim
Trigger1 = anim = 13055
trigger1 = Animelem = 2
value = 13056

[State 4];??????
type = VelSet
Trigger1 = anim = 13056
trigger1 = Animelem = 1
y = -8
Persistent = 1

[State -2, ?????]
type = PlaySnd
Trigger1 = anim = 13056
trigger1 = Animelem = 1
value = 41, 0
ignorehitpause = 1

[State 5];??????????????
type = Gravity
Trigger1 = anim = 13056
trigger1 = AnimElemtime(1) > 0

[State 1];????????
type = NotHitBy
trigger1 = 1
value = SCA

[State 105, 3]
type = ChangeState
Trigger1 = anim = 13056
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 13045

;====<Ryukoha>=
[StateDef 13100]
type = S
physics = N
moveType = A
anim = 13000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 13000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 13000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 13000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 13000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 13000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 13000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 13000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 13000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(Command = "c", 2, ifElse(Command = "b", 1, 0))

[State 13000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 13000, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-15 * const(size.xScale)), ceil(-72 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 13000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 13000, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,3
channel = 0

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,1
channel = 1

[State 13000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8100
ID = 8100
name = "Gekiro Dust"
posType = P1
ownPal = 1

[State 13000, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = ifElse(var(10) = 2, 15, ifElse(var(10) = 1, 8.75, 3))
y = ifElse(var(10) = 2, -11.45, ifElse(var(10) = 1, -13, -15.375))

[State 13000, VelSet]
type = VelSet
trigger1 = AnimElem = 5
y = 0

[State 13000, VelMul]
type = VelMul
trigger1 = AnimElemTime(5) < 0
x = 0.922
y = 0.922

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5) >= 0
y = 0.5

[State 3200, Safety]
type = SuperPause
trigger1 = AnimElem = 3 && NumEnemy
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
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElemTime(3) < 5 ;&& !var(43)
;trigger1 = P2Dist x >= 0 && P2BodyDist x <= 41
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
p1StateNo = 13120
p2stateno = 13125
p2Facing = 1

[State 3100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1105

;-----------------------------------------------------------------------
[Statedef 13120]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13120
juggle = 0

[State 0, PosSet]
type =null; PosSet
trigger1 = time=0
y = -90

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 2,800

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
trigger2 = animelem = 8
trigger3 = animelem = 9
trigger4 = animelem = 10
trigger5 = animelem = 11
trigger6 = animelem = 12
trigger7 = animelem = 13
trigger8 = animelem = 14
trigger9 = animelem = 15
trigger10 = animelem = 16
trigger11 = animelem = 17
trigger12 = animelem = 18
value = 2,900

[State 0, PosSet]
type = PosSet
trigger1 = time=0
x = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 70
pos = 0,0

[State 0, VelSet]
type = VelSet
trigger1 = time>=0
x = 0
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time>=12
x = 2
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time>=16
x = 1
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time>=20
x = 1
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time>=24
x = 0
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>=28
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>=32
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>=36
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time>=40
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time>=44
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time>=48
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time>=52
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time>=58
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time>=62
y = 10

[State 0,ChangeState]
type = ChangeState
triggerall = time >= 10
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 13130
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13130]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13130
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 820, 2

[State 0, Explod]
type = Explod
trigger1 = Time = 0
anim = 6080
sprpriority = -2
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 2,2
ownpal = 1
[State 0, Explod]
type = Explod
trigger1 = Time = 0
anim = 6080
sprpriority = 2
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1,1
ownpal = 1

[State 13055, Impact Dust]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 0, 0
ownPal = 1

[State 13055, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, PosSet]
type = PosSet
trigger1 = time=0
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 13140
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13140]
type = S              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 0
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 4
trigger2 = time = 9
trigger3 = time = 14
trigger4 = time = 21
trigger5 = time = 26
trigger6 = time = 31
trigger7 = time = 34
trigger8 = time = 37
trigger9 = time = 42
trigger10 = time = 46
trigger11 = time = 49
trigger12 = time = 53
trigger13 = time = 57
value = 2,1000

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 2,2000
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 4
value = 2,2000
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 10
value = 2,2000

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 4
value = 4,2

[State 0, PosSet]
type = PosSet
trigger1 =  1
x = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
;ignorehitpause =
;persistent =

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = invisible
flag2 = globalnoshadow

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 3399
sprpriority = 2
postype = p1
pos = -160,-255
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1,0.9
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 3399
sprpriority = 2
postype = p1
pos = -70,-255
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.4,0.9
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 100
value = 13150
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13150]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = I          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13150
juggle = 0

[State 0, PosSet]
type = PosSet
trigger1 = time=0
y = -60

[State 0, VelSet]
type = VelSet
trigger1 = time >=1
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >=4
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >=8
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >=12
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >=16
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >=20
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >=24
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >=28
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >=32
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >=36
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >=40
y = 10

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && vel Y > 0
value = 1105
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13125]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 13125

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno=13130
value = 13135
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13135]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 13135

[State 3211, Damage]
type = LifeAdd
trigger1 = !Time
value = -180

[State 0, PosSet]
type = PosSet
trigger1 = time=0
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno=13140
value = 13145
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13145]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
;velset = 0,0
juggle = 0

[State 0, Turn]
type = null;Turn
trigger1 = time = 0
persistent = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
;ignorehitpause =
;persistent =

[State 0, PosSet]
type = PosSet
trigger1 = time=0
x = 0
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 13145

[State 3211, Damage]
type = LifeAdd
trigger1 = time = 4
trigger2 = time = 9
trigger3 = time = 14
trigger4 = time = 21
trigger5 = time = 26
trigger6 = time = 31
trigger7 = time = 34
trigger8 = time = 37
trigger9 = time = 42
trigger10 = time = 46
trigger11 = time = 49
trigger12 = time = 53
trigger13 = time = 57
value = -20
kill = 1

[State 0, VelSet]
type = VelSet
trigger1 = time>= 4
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 8
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 12
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 16
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 20
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 24
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 28
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 32
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time>= 36
y = -2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 40
y = -2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 44
y = -2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 48
y = -0.5

[State 0, VelSet]
type = VelSet
trigger1 =  time >= 0
x = 0
[State 0, VelSet]
type = null;VelSet
trigger1 =  time >= 4
x = -11
[State 0, VelSet]
type = null;VelSet
trigger1 =  time >= 8
x = 22
[State 0, VelSet]
type = null;VelSet
trigger1 =  time >= 12
x = -11
[State 0, VelSet]
type = null;VelSet
trigger1 =  time >= 16
x = 11
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 20
x = -11
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 24
x = 11
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 28
x = -22
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 32
x = 22
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 36
x = -22
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 40
x = 22
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 44
x = -33
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 48
x = 33
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 52
x = -33
[State 0, VelSet]
type = null;VelSet
trigger1 =  time>= 56
x = 33

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 60
value = 13146
ctrl = 0

[State 0, SelfState]
type = null;SelfState
trigger1 = pos  Y>=-60&&vel Y>0
value =5110

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time>=0
value = 1
movecamera = 0,0
[State 0, ScreenBound]
type = null;ScreenBound
trigger1 = time>=40
value = 1
movecamera = 0,1

;-----------------------------------------------------------------------
[Statedef 13146]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 2999

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=0
value = 0
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=16
value = -30
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=20
value = -60
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=24
value = -90
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=28
value = -120
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=32
value = -150

[State 0, PosSet]
type = Posadd
trigger1 = time=0
y = -60
persistent = 0

[State 0, PosSet]
type = PosSet
trigger1 = time=0
x = 0
persistent = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 0
x = 2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 4
y = -10
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 8
y = -8
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 12
y = -6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 16
y = -4
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 20
y = -2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 24
y = 0
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 28
y = 2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 32
y = 4
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 36
y = 6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 40
y = 8
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 44
y = 10

[State 0, EnvShake]
type = EnvShake
trigger1 =time >= 6 && Pos Y >= -60 && vel Y > 0
time = 20
freq = 100
ampl = -6

[State 0, NotHitBy]
type = NotHitBy
trigger1 =  time>=0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 1

;ignorehitpause =
;persistent =
[State 0, SelfState]
type = selfstate
trigger1 = Pos Y >= -60 && vel Y > 0
value = 5100

;====<Kouga>=
[StateDef 13200]
type = S
physics = N
moveType = A
anim = 13200
ctrl = 0
juggle = 1
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 13000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 13000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [13000,14999]) && var(8)

[State 13000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 13000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 13000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 13000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 13000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 13000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(Command = "c", 2, ifElse(Command = "b", 1, 0))

[State 13000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 13000, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-15 * const(size.xScale)), ceil(-72 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 6
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 13000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 13000, Voice 1]
type = PlaySnd
trigger1 = Time = 1
value = 3000,0
channel = 0

[State 2200, ChangeState]
type = ChangeState
trigger1 = time = 30
value = 13210
ctrl = 0

;-----------------------------------------------------------------------
;FIRST KICK FROM AIR
[Statedef 13210]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13201
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 210,2]
type = playsnd
trigger1 = time = 0
value = 2,900
[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =4,3

[State 0, hitdef]
type = HitDef
trigger1 = time = 0
priority = 5, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard			; = medium		;2p ANIM
ground.type = high
damage = 50,10
getpower = 0
GivePower = 50
pausetime = 4,12
guard.pausetime = 12,12
ground.slidetime = 40
ground.hittime = 40
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,0
air.velocity = -2,-8
yaccel = 0.6
guard.velocity = -1
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -30 + 0 * (var(35) := 57), var(36) := -30
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 10
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 5	;strong weak

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 8
y = 10

[State 0,ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 13202
ctrl = 0

;-----------------------------------------------------------------------
;LANDING
[Statedef 13202]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13210
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7220
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

;F
[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 13203
ctrl = 0

;---------------------------------------------------------------------
[Statedef 13203] ;jump front
type = A
physics = N
movetype = I
ctrl = 0
velset = 0,0
anim = 13204
juggle = 0
poweradd = 0

[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 2,900
[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 4,3

[State 1000,0]
type = Statetypeset
trigger1 = time >= 0
statetype = A
movetype= A
physics = N

[State 1100, 8]
type = Velset
trigger1 = time >= 0
x = 20
y = -16

[State 1100, 8]
type = Velset
trigger1 = pos Y <= -100
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 2201, 8]
type = ChangeState
triggerall = pos Y <= -100
trigger1 = FrontEdgeBodyDist <= 10
trigger1 = time >= 11
trigger2 = time >= 12
value = 13204

;------------------------------------------------------------------------
;FRONT WALL  time12
[Statedef 13204]
type = A
physics = N
movetype = A
ctrl = 0
anim = 13207
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 100,1

[State 1301, 1]
type = Posset
trigger1 = time = 0
y = -100
[State 1301, 1]
type = Velset
trigger1 = time = 0
y = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 13
value = 13205
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13205]  ; FAST kick to LEFT
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13208
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 210,2]
type = playsnd
trigger1 = time = 0
value = 2,900
[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =4,3

[State 0, hitdef]
type = HitDef
trigger1 = time = 0
priority = 5, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard			; = medium		;2p ANIM
ground.type = high
damage = 50,10
getpower = 0
GivePower = 50
pausetime = 4,12
guard.pausetime = 12,12
ground.slidetime = 40
ground.hittime = 40
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = 4,0
air.velocity = 1,-8
yaccel = 0.5
guard.velocity = -10
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -30 + 0 * (var(35) := 57), var(36) := -30
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 10
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 5	;strong weak
p2facing = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = -22
y = 12

[State 0,ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 13201
ctrl = 0

;-----------------------------------------------------------------------
;LANDING
[Statedef 13201]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13211
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7220
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

;F
[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 13206
ctrl = 0

;---------------------------------------------------------------------
[Statedef 13206] ;jump BACK
type = A
physics = N
movetype = I
ctrl = 0
velset = 0,0
anim = 13203
juggle = 0
poweradd = 0

[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 2,900
[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 4,3

[State 1000,0]
type = Statetypeset
trigger1 = time >= 0
statetype = A
movetype= A
physics = N

[State 1100, 8]
type = Velset
trigger1 = time >= 0
x = -20
y = -16

[State 1100, 8]
type = Velset
trigger1 = pos Y <= -100
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 2201, 8]
type = ChangeState
triggerall = pos Y <= -100
trigger1 = BackEdgeBodyDist <= 10
trigger1 = time >= 11
trigger2 = time >= 12
value = 13207

;------------------------------------------------------------------------
;BACK WALL  time12
[Statedef 13207]
type = A
physics = N
movetype = A
ctrl = 0
anim = 13205
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 100,1

[State 1301, 1]
type = Posset
trigger1 = time = 0
y = -100
[State 1301, 1]
type = Velset
trigger1 = time = 0
y = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 12
value = 13208
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13208]  ; FAST kick to RIGHT
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13206
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 210,2]
type = playsnd
trigger1 = time = 0
value = 2,900
[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =4,3

[State 0, hitdef]
type = HitDef
trigger1 = time = 0
priority = 5, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard			; = medium		;2p ANIM
ground.type = high
damage = 50,10
getpower = 0
GivePower = 50
pausetime = 4,12
guard.pausetime = 12,12
ground.slidetime = 40
ground.hittime = 40
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4,0
air.velocity = -1,-8
yaccel = 0.5
guard.velocity = -10
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -30 + 0 * (var(35) := 57), var(36) := -30
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 10
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 5	;strong weak

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 22
y = 12

[State 0,ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 13209
ctrl = 0

;-----------------------------------------------------------------------
;LANDING
[Statedef 13209]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13210
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7220
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Kouga Max>=
[StateDef 13250]
type = S
physics = N
moveType = A
anim = 13200
ctrl = 0
juggle = 1
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 13000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 13000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [13000,14999]) && var(8)

[State 13000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 13000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 13000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 13000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 13000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 13000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(Command = "c", 2, ifElse(Command = "b", 1, 0))

[State 13000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3000,AfterImage]
type = AfterImage
trigger1 = time = 0
time = 999999999
length = 9
TimeGap = 2
FrameGap = 3
palbright = 0,0,0
palcontrast = 0,0,150
palpostbright = 0,0,0
paladd = -30,-30,-30
palmul = .75,.75,.75
trans = add1

[State 13000, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-15 * const(size.xScale)), ceil(-72 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 6
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 13000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 13000, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 2200, ChangeState]
type = ChangeState
trigger1 = time = 30
value = 13251
ctrl = 0

;-----------------------------------------------------------------------
;FIRST KICK FROM AIR
[Statedef 13251]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13201
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 210,2]
type = playsnd
trigger1 = time = 0
value = 2,900
[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =4,3

[State 0, hitdef]
type = HitDef
trigger1 = time = 0
priority = 5, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard			; = medium		;2p ANIM
ground.type = high
damage = 65,10
getpower = 0
GivePower = 50
pausetime = 4,12
guard.pausetime = 12,12
ground.slidetime = 40
ground.hittime = 40
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -2,0
air.velocity = -2,-8
yaccel = 0.6
guard.velocity = -1
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -30 + 0 * (var(35) := 57), var(36) := -30
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 10
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 5	;strong weak

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 8
y = 10

[State 0,ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 13252
ctrl = 0

;-----------------------------------------------------------------------
;LANDING
[Statedef 13252]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13210
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7220
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

;F
[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 13253
ctrl = 0

;---------------------------------------------------------------------
[Statedef 13253] ;jump front
type = A
physics = N
movetype = I
ctrl = 0
velset = 0,0
anim = 13204
juggle = 0
poweradd = 0

[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 2,900
[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 4,3

[State 1000,0]
type = Statetypeset
trigger1 = time >= 0
statetype = A
movetype= A
physics = N

[State 1100, 8]
type = Velset
trigger1 = time >= 0
x = 20
y = -16

[State 1100, 8]
type = Velset
trigger1 = pos Y <= -100
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 2201, 8]
type = ChangeState
triggerall = pos Y <= -100
trigger1 = FrontEdgeBodyDist <= 10
trigger1 = time >= 11
trigger2 = time >= 12
value = 13254

;------------------------------------------------------------------------
;FRONT WALL  time12
[Statedef 13254]
type = A
physics = N
movetype = A
ctrl = 0
anim = 13207
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 100,1

[State 1301, 1]
type = Posset
trigger1 = time = 0
y = -100
[State 1301, 1]
type = Velset
trigger1 = time = 0
y = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 13
value = 13255
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13255]  ; FAST kick to LEFT
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13208
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 210,2]
type = playsnd
trigger1 = time = 0
value = 2,900
[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =4,3

[State 0, hitdef]
type = HitDef
trigger1 = time = 0
priority = 5, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard			; = medium		;2p ANIM
ground.type = high
damage = 65,10
getpower = 0
GivePower = 50
pausetime = 4,12
guard.pausetime = 12,12
ground.slidetime = 40
ground.hittime = 40
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = 4,0
air.velocity = 1,-8
yaccel = 0.5
guard.velocity = -10
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -30 + 0 * (var(35) := 57), var(36) := -30
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 10
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 5	;strong weak
p2facing = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = -22
y = 12

[State 0,ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 13256
ctrl = 0

;-----------------------------------------------------------------------
;LANDING
[Statedef 13256]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13211
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7220
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

;F
[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 13257
ctrl = 0

;---------------------------------------------------------------------
[Statedef 13257] ;jump BACK
type = A
physics = N
movetype = I
ctrl = 0
velset = 0,0
anim = 13203
juggle = 0
poweradd = 0

[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 2,900
[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 4,3

[State 1000,0]
type = Statetypeset
trigger1 = time >= 0
statetype = A
movetype= A
physics = N

[State 1100, 8]
type = Velset
trigger1 = time >= 0
x = -20
y = -16

[State 1100, 8]
type = Velset
trigger1 = pos Y <= -100
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 2201, 8]
type = ChangeState
triggerall = pos Y <= -100
trigger1 = BackEdgeBodyDist <= 10
trigger1 = time >= 11
trigger2 = time >= 12
value = 13258

;------------------------------------------------------------------------
;BACK WALL  time12
[Statedef 13258]
type = A
physics = N
movetype = A
ctrl = 0
anim = 13205
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 100,1

[State 1301, 1]
type = Posset
trigger1 = time = 0
y = -100
[State 1301, 1]
type = Velset
trigger1 = time = 0
y = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 12
value = 13259
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13259]  ; FAST kick to RIGHT
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13206
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 210,2]
type = playsnd
trigger1 = time = 0
value = 2,900
[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =4,3

[State 0, hitdef]
type = HitDef
trigger1 = time = 0
priority = 5, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard			; = medium		;2p ANIM
ground.type = high
damage = 65,10
getpower = 0
GivePower = 50
pausetime = 4,12
guard.pausetime = 12,12
ground.slidetime = 40
ground.hittime = 40
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -4,0
air.velocity = -1,-8
yaccel = 0.5
guard.velocity = -10
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -30 + 0 * (var(35) := 57), var(36) := -30
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 10
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 5	;strong weak

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 22
y = 12

[State 0,ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 13260
ctrl = 0

;-----------------------------------------------------------------------
;LANDING
[Statedef 13260]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13210
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7220
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

;F
[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 13261
ctrl = 0

;---------------------------------------------------------------------
[Statedef 13261] ;jump front
type = A
physics = N
movetype = I
ctrl = 0
velset = 0,0
anim = 13204
juggle = 0
poweradd = 0

[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 2,900
[State 0,PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 4,3

[State 1000,0]
type = Statetypeset
trigger1 = time >= 0
statetype = A
movetype= A
physics = N

[State 1100, 8]
type = Velset
trigger1 = time >= 0
x = 20
y = -16

[State 1100, 8]
type = Velset
trigger1 = pos Y <= -100
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 2201, 8]
type = ChangeState
triggerall = pos Y <= -100
trigger1 = FrontEdgeBodyDist <= 10
trigger1 = time >= 11
trigger2 = time >= 12
value = 13262

;------------------------------------------------------------------------
;FRONT WALL  time12
[Statedef 13262]
type = A
physics = N
movetype = A
ctrl = 0
anim = 13207
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 100,1

[State 1301, 1]
type = Posset
trigger1 = time = 0
y = -100
[State 1301, 1]
type = Velset
trigger1 = time = 0
y = 0
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 13
value = 13263
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13263]  ; FAST kick to LEFT
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13208
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 210,2]
type = playsnd
trigger1 = time = 0
value = 2,900
[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =4,3

[State 0, hitdef]
type = HitDef
trigger1 = time = 0
priority = 5, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA			;STAND / NORMAL ATTACK
hitflag = MAF			;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard			; = medium		;2p ANIM
ground.type = high
damage = 65,10
getpower = 0
GivePower = 50
pausetime = 4,12
guard.pausetime = 12,12
ground.slidetime = 40
ground.hittime = 40
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = 4,0
air.velocity = 1,-8
yaccel = 0.5
guard.velocity = -10
ground.cornerpush.veloff = -20
guard.cornerpush.veloff = -20
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -30 + 0 * (var(35) := 57), var(36) := -30
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 10
envshake.freq = 100
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 5	;strong weak
p2facing = -1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = -22
y = 12

[State 0,ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 13264
ctrl = 0

;-----------------------------------------------------------------------
;LANDING
[Statedef 13264]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 13211
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7220
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = time >= 0
value = 1
movecamera = 0,1

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Teiga>=
[StateDef 13300]
type = S
physics = N
moveType = A
anim = 13300
ctrl = 0
juggle = 1
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 13000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 13000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [13000,14999]) && var(8)

[State 13000, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 13000, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 13000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 13000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 13000, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 13000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = ifElse(Command = "c", 2, ifElse(Command = "b", 1, 0))

[State 13000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

;varset for LEFT and RIGHT
[State -2, var]
type = VarSet
trigger1 = facing = 1
var(44) = 1
;varset
[State -2, var]
type = VarSet
trigger1 = facing = -1
var(44) = 2

[State 13000, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-15 * const(size.xScale)), ceil(-72 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 6
time = 44
moveTime = 44
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 13000, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0

[State 1001,1]
type = ChangeState
trigger1 = time = 40
value = 13301
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13301]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13301
juggle = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, hitdef]
type = HitDef
trigger1 = time = 0
priority = 5, Hit			;2 for ??, 3 for M/H att, 4 for L att, 5 for super, 6 fot hyper
attr = A,HA				;STAND / NORMAL ATTACK
hitflag = MAF				;MIDDLE ATTACK
guardflag = M			;GUARD is MIDDLE /L is LOW
animtype = hard	 		;2p ANIM, light", "medium", "hard", "back", "up",    or "diagup"
air.animtype = hard			; = medium		;2p ANIM
ground.type = high
damage = 20
getpower = 0
GivePower = ifelse ( var(20) > 0,40, 40)
pausetime = 0,0
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -12
air.velocity = -3,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff =  -10
guard.cornerpush.veloff = -10
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -70
sparkNo = -1
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 5
envshake.freq = 100
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 100 ;speed
fall.envshake.ampl = 10	;strong weak
p1stateno = 13311
p2stateno = 13321
p2facing = 1
p1facing = 1
fall = 0
air.fall = 0
fall.recover = 0
kill = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0 && vel Y > 0
value = 52
ctrl = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 210,2]
type = playsnd
trigger1 = time = 0
value = 2,900
[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =4,3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = 8
y = 10

;-----------------------------------------------------------------------
[Statedef 13311]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13311
juggle = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 0
anim = 3286
sprpriority = 2
postype = back
pos = -20,-20
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,100
[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 3
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,2

[State 0, BGPalFX]
type = BGPalFX
trigger1 = time= 0
time = 130
add = 255,255,255
mul = 255,255,255

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3280
sprpriority = 2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 2
anim = 3270
sprpriority = -2
postype = back
pos = -10,-10
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = -200
x = -200

[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = -200
x = 200

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 25
y = 25

[State 0, ChangeState]
type = ChangeState
trigger1 = pos Y >= 60
value = 13312
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13312]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13312
juggle = 0

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 3
value = 1,100
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,5

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3281
sprpriority = -2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3271
sprpriority = 2
postype = back
pos = -30,-10
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = -200
x = 200
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = -200
x = -200

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = -25
y = 25

[State 0, ChangeState]
type = ChangeState
trigger1 = pos Y >= 60
value = 13313
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13313]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13313
juggle = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 0
anim = 3286
sprpriority = -2
postype = back
pos = -20,-20
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,100
[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 0
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,2

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3282
sprpriority = 2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 2
anim = 3272
sprpriority = -2
postype = back
pos = -20,-60
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = -60
x = -200
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = -60
x = 200

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 35
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 13314
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13314]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13314
juggle = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 0
anim = 3286
sprpriority = -2
postype = back
pos = -20,-60
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,1
vel = 0,0
ownpal = 1
supermove = 0

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 0
value = 1,100
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,3

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3283
sprpriority = -2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.2,1.2
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 2
anim = 3273
sprpriority = 2
postype = back
pos = -50,-30
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=0
value = 30;  (winmugen only)
;scale =  (winmugen only)
;ignorehitpause =
;persistent =


[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = 80
x = 240
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = 80
x = -240

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = -20
y = -15

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 13315
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13315]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13315
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,100
[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 0
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,2

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=0
value = -15;  (winmugen only)
;scale =  (winmugen only)
;ignorehitpause =
;persistent =

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3280
sprpriority = 2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 2
anim = 3271
facing = -1
sprpriority = -2
postype = back
pos = 400,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = -200
x = -200
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = -200
x = 200

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 20
y = 25

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 13316
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13316]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13316
juggle = 0

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 0
value = 1,100
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,3

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3281
sprpriority = -2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 2
anim = 3271
facing = 1
sprpriority = 2
postype = back
pos = -100,-20
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = -200
x = 220
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = -200
x = -220

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = -30
y = 25

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 13317
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13317]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13317
juggle = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 0
anim = 3286
sprpriority = -2
postype = back
pos = -100,-20
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.7,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,100
[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 0
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,2

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3282
sprpriority = 2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 2
anim = 3273
facing = 1
sprpriority = -2
postype = back
pos = -100,-60
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = -140
x = -240
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = -140
x = 240

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 35
y = 20

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 13318
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13318]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13318
juggle = 0

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 3
value = 1,100
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,3

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3283
sprpriority = 2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.1,1.1
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 0
anim = 3272
sprpriority = -2
postype = back
pos = -20,-60
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = -60
x = 200
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = -60
x = -200

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = -35
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 13319
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13319]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13319
juggle = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 0
anim = 3286
sprpriority = -2
postype = back
pos = -20,-20
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,100
[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 3
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,2

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=0
value = -30;  (winmugen only)
;scale =  (winmugen only)
;ignorehitpause =
;persistent =

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3280
sprpriority = -2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 3
anim = 3274
sprpriority = 2
postype = back
pos = -20,-80
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = 20
x = -200
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = 20
x = 200

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 35
y = -15

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 13320
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13320]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13320
juggle = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 0
anim = 3286
sprpriority = -2
postype = back
pos = -20,-20
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.6
vel = 0,0
ownpal = 1
supermove = 0

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 3
value = 1,100
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,200
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,3

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 4
freq = 111
ampl = 11

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3281
sprpriority = 2
postype = p2
pos = -10,-40
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 2
anim = 3270
sprpriority = -2
postype = back
pos = -10,-10
bindtime = -1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = -200
x = -200
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = -200
x = 200

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = 35
y = 35

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 10
value = 13350
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13350]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13316
juggle = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 0
anim = 3286
sprpriority = -2
postype = back
pos = -20,-20
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.8,0.8
vel = 0,0
ownpal = 1
supermove = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1,300
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,3

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = globalnoshadow
;flag3 = nobardisplay
;ignorehitpause =
;persistent =

[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3284
sprpriority = -2
postype = p2
pos = -20,-40
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0
[State 6009,Explod]
type = Explod
trigger1 = time = 4
anim = 3285
sprpriority = 2
postype = p2
pos = 10,-40
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.2,1.2
vel = 0,0
ownpal = 1
supermove = 0

[State 6009,Explod]
type = Explod
trigger1 = time = 2
anim = 3275
sprpriority = -2
postype = back
pos = -10,-10
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.5,0.5
vel = 0,0
ownpal = 1
supermove = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PosSet]
type = PosSet
trigger1=var(44)=1
trigger1 = time = 0
y = -200
x =  260
[State 0, PosSet]
type = PosSet
trigger1=var(44)=2
trigger1 = time = 0
y = -200
x =  -260

[State 0, VelSet]
type = VelSet
trigger1 = time >= 1
x = -35
y = 35

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 4
value = 13360
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13360]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = A          ;A,H,I
ctrl = 0
velset = 0,0
anim = 13316
juggle = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 20
freq = 110
ampl = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
x = -20
y = 20

[State 0, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0 && vel Y > 0
value = 52
ctrl = 1

;-----------------------------------------------------------------------
[Statedef 13321]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
;flag2 = invisible
;flag3 = roundnotover
;ignorehitpause =
;persistent =
;-----------------------
;flag = nobardisplay
;flag = noBG
;flag = noFG
;flag = nostandguard
;flag = nocrouchguard
;flag = noairguard
;flag = noautoturn
;flag = nojugglecheck
;flag = nokosnd
;flag = nokoslow
;flag = noshadow
;flag = globalnoshadow
;flag = nomusic
;flag = nowalk
;flag = timerfreeze
;flag = unguardable


[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = animelem =1
value = 0
kill = 0

[State 0, PosSet]
type = PosSet
trigger1 =1
y = -30
x = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 13321

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = p2stateno = 13312
value = 13322
persistent = 0
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = p2stateno = 13313
value = 13323
persistent = 0
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = p2stateno = 13314
value = 13324
persistent = 0
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = p2stateno = 13315
value = 13325
persistent = 0
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = p2stateno = 13316
value = 13326
persistent = 0
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = p2stateno = 13317
value = 13327
persistent = 0
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = p2stateno = 13318
value = 13328
persistent = 0
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = p2stateno = 13319
value = 13329
persistent = 0
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = p2stateno = 13320
value = 13330
persistent = 0
[State 0, ChangeAnim2]
type = LifeAdd
trigger1 = p2stateno = 13312
value = -30
kill = 0
persistent = 0
[State 0, ChangeAnim2]
type = LifeAdd
trigger1 = p2stateno = 13313
value = -30
kill = 0
persistent = 0
[State 0, ChangeAnim2]
type = LifeAdd
trigger1 = p2stateno = 13314
value = -30
kill = 0
persistent = 0
[State 0, ChangeAnim2]
type = LifeAdd
trigger1 = p2stateno = 13315
value = -30
kill = 0
persistent = 0
[State 0, ChangeAnim2]
type = LifeAdd
trigger1 = p2stateno = 13316
value = -30
kill = 0
persistent = 0
[State 0, ChangeAnim2]
type = LifeAdd
trigger1 = p2stateno = 13317
value = -30
kill = 0
persistent = 0
[State 0, ChangeAnim2]
type = LifeAdd
trigger1 = p2stateno = 13318
value = -30
kill = 0
persistent = 0
[State 0, ChangeAnim2]
type = LifeAdd
trigger1 = p2stateno = 13319
value = -30
kill = 0
persistent = 0
[State 0, ChangeAnim2]
type = LifeAdd
trigger1 = p2stateno = 13320
value = -30
kill = 0
persistent = 0
[State 0, ChangeAnim2]
type = HitAdd
trigger1 = p2stateno = 13312
value = 1
persistent = 0
[State 0, ChangeAnim2]
type = HitAdd
trigger1 = p2stateno = 13313
value = 1
persistent = 0
[State 0, ChangeAnim2]
type = HitAdd
trigger1 = p2stateno = 13314
value = 1
persistent = 0
[State 0, ChangeAnim2]
type = HitAdd
trigger1 = p2stateno = 13315
value = 1
persistent = 0
[State 0, ChangeAnim2]
type = HitAdd
trigger1 = p2stateno = 13316
value = 1
persistent = 0
[State 0, ChangeAnim2]
type = HitAdd
trigger1 = p2stateno = 13317
value = 1
persistent = 0
[State 0, ChangeAnim2]
type = HitAdd
trigger1 = p2stateno = 13318
value = 1
persistent = 0
[State 0, ChangeAnim2]
type = HitAdd
trigger1 = p2stateno = 13319
value = 1
persistent = 0
[State 0, ChangeAnim2]
type = HitAdd
trigger1 = p2stateno = 13320
value = 1
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 13360
value = 13365
ctrl = 0

;-----------------------------------------------------------------------
[Statedef 13365]
type = A              ;S,C,A
physics = N           ;S,C,A,N
movetype = H          ;A,H,I
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 0
value = -100
kill = 1
persistent = 0

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0
[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 0
value = 13365
[State 0, ChangeAnim2]
type = ChangeAnim2
Trigger1 = Time = 20
value = 2999

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time>=20
value = -45

[State 0, PosAdd]
type = PosAdd
trigger1 = time=20
y = -60

[State 0, VelSet]
type = VelSet
trigger1 =  time>= 20
x = 1
y = -6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 24
y = -6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 28
y = -6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 32
y = -6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 36
y = -4
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 40
y = -2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 44
y = 0
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 48
y = 2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 52
y = 2
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 56
y = 4
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 60
y = 6
[State 0, VelSet]
type = VelSet
trigger1 =  time>= 64
y = 8

[State 0, NotHitBy]
type = NotHitBy
trigger1 =  time>=0
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 1

;ignorehitpause =
;persistent =
[State 0, SelfState]
type = selfstate
trigger1 = Pos Y >= -60 && vel Y > 0
value = 5100

