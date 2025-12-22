; _________________________________________
;| Demitri by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===<HELPER STATES>====
;==

;====<PARRY HELPER>=
[StateDef 765]
type = A
physics = N
moveType = I
anim = ifElse(Root, StateType = C, 766, ifElse(Root, StateType = A, 767, 765))
velSet = 0,0
ctrl = 0

[State 765, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 765, BindToRoot]
type = BindToRoot
trigger1 = 1
time = -1

[State 765, Change to Crouching]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "down"
trigger2 = Root, AILevel && (Root, StateType != A) && P2StateType = C
value = 766

[State 765, Change to Standing / Jumping]
type = ChangeAnim
triggerAll = !Time
trigger1 = !(Root, AILevel) && Root, command = "fwd"
trigger2 = Root, AILevel && Anim != 766
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Change to Standing / Jumping]
type = ChangeAnim
trigger1 = Anim = 765 || Anim = 767
value = ifElse((Root, StateType = A), 767, 765)

[State 765, Disable]
type = VarSet
trigger1 = Time >= ifElse((Root, StateType = A), 7, 8)
trigger2 = Facing != (Root, Facing)
trigger3 = !(Root, ctrl)
trigger3 = (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
var(0) = 1

[State 765, Disable]
type = VarSet
triggerAll = !(Root, AILevel)
trigger1 = (Root, command = "holdback")
trigger2 = Time < 4 && (Root, command = "holdfwd" + Root, command = "holddown") > 1
trigger3 = Time >= 4 && (Root, command = "holdfwd" || Root, command = "holddown")
trigger4 = Time >= 1 && (((Anim = 765 || Anim = 767) && Root, command = "fwd") || (Anim = 766 && Root, command = "down"))
var(0) = 1

[State 765, Disable]
type = ChangeAnim
trigger1 = var(0) = 1
value = 1

[State 765, Standing/Air]
type = ReversalDef
trigger1 = !var(0) && (Anim = 765 || Anim = 767)
trigger1 = (Root, StateNo != 5120) || !(Root, AnimTime)
reversal.attr = SCA,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Crouching]
type = ReversalDef
trigger1 = !var(0) && Anim = 766
reversal.attr = SC,AA
p1StateNo = 766
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, Disable]
type = ReversalDef
trigger1 = var(0) = 1
reversal.attr =
pauseTime = 0,0
sparkNo = -1
numHits = 0

[State 765, End]
type = DestroySelf
trigger1 = Time >= 18
trigger2 = (Root, MoveType != I)
trigger3 = !(Root, ctrl) && (Root, StateNo != [760,762]) && (Root, StateNo != 5120)
trigger4 = (Root, StateNo = [760,762]) && (Root, Time <= 1)

;Success
[StateDef 766]
moveType = I
ctrl = 0

[State 766, Disable]
type = VarSet
trigger1 = 1
var(0) = 1

[State 766, End]
type = DestroySelf
trigger1 = Root, StateNo = [760,762]
trigger2 = Time >= 2

;====<CHAOS FLARE PROJECTILE>=
[StateDef 1005]
type = S
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1

[State 1005, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1005, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1015

[State 1005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 1

[State 1005, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateNo = ifElse(var(0) > 0, 1005, 1007)
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1006
value = 1006

[State 1005, VelSet]
type = VelSet
trigger1 = 1
x = ifElse(Time < 2 && var(0) < 3, 1, 8.75)

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time && !PrevStateNo
var(39) = 1

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && Root, var(15) < (1 + HitCount + Root, var(41))
trigger1 = var(0) > 0
ID = 1005
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 90 < 7, 7, fvar(11) * 90)), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, 4
guard.pauseTime = 0, 4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 44
ground.slideTime = 44
guard.hitTime = 15
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 34
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = ifElse(EnemyNear, SelfAnimExist(7697), 12 * var(9), 44 - 4 * (EnemyNear, StateType = A))
palFX.add = ifElse(EnemyNear, SelfAnimExist(7697), 255, 0), ifElse(EnemyNear, SelfAnimExist(7697), 255, 0), ifElse(EnemyNear, SelfAnimExist(7697), 255, 0)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7697), 256, 128), ifElse(EnemyNear, SelfAnimExist(7697), 256, 128), ifElse(EnemyNear, SelfAnimExist(7697), 256, 128)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7697), -255, 96), ifElse(EnemyNear, SelfAnimExist(7697), -255, 96), ifElse(EnemyNear, SelfAnimExist(7697), -255, 96), ifElse(EnemyNear, SelfAnimExist(7697), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1005, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1005)
value = 51035
ID = 1005
ignoreHitPause = 1
persistent = 0

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(NumTarget, 1006, 1005)
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = ifElse(var(0) > 0, 1005, 1007)
ignoreHitPause = 1

[State 1005, End]
type = ChangeState
trigger1 = !var(0) && PrevStateNo && Time = 2
value = 1007
ignoreHitPause = 1

[State 1005, Projectile Flag Off]
type = ParentVarAdd
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100
var(39) = -1

[State 1005, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;Hit Pause
[StateDef 1006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1
hitCountPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1080]
var(18) = 1

[State 1006, Flames]
type = Helper
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = ifElse(Target, SelfAnimExist(7697), 8150, 8151)
name = "Flames"
posType = P2
size.xScale = Root, const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 1

[State 1006, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 3 && var(0) > 1
trigger2 = Time >= 0 && var(0) <= 1
value = ifElse(var(0) <= 1, 1007, 1005)

;Disappear
[StateDef 1007]
type = A
physics = N
moveType = A
anim = 1007
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 2
volume = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008

;Wait
[StateDef 1008]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1008, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !NumHelper(8150) && !NumHelper(8151)
trigger2 = NumHelper(8150)
trigger2 = Helper(8150), AnimElemTime(18) >= 1
trigger3 = NumHelper(8151)
trigger3 = Helper(8151), AnimElemTime(18) >= 1
trigger4 = !NumTarget
trigger5 = NumTarget
trigger5 = Target, Time <= 1 && !(Target, HitShakeOver)
var(39) = -1
persistent = 0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target, HitShakeOver)

;====<ES CHAOS FLARE PROJECTILE (REFLECTED)>=
[StateDef 1015]
type = S
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1

[State 1015, Turn]
type = Turn
trigger1 = !Time && PrevStateNo != [1015,1016]

[State 1015, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1015, Projectile Health Fix]
type = VarAdd
trigger1 = !Time && sysvar(1) != 1005
var(0) = 1
ignoreHitPause = 1

[State 1015, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !Time && sysvar(1) != 1005
var(39) = -1

[State 1015, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1005

[State 1015, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 1015, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateNo = ifElse(var(0) > 0, 1015, 1007)
ignoreHitPause = 1

[State 1015, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1015, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1006
value = 1006

[State 1015, VelSet]
type = VelSet
trigger1 = 1
x = ifElse(Time < 2 && var(0) < 3, 1, 8.75)

[State 1015, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1015, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1015, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1015, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1015, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && Root, var(15) < (1 + HitCount + Root, var(41))
trigger1 = var(0) > 0
ID = sysvar(0)
affectTeam = F
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, 4
guard.pauseTime = 0, 4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 44
ground.slideTime = 44
guard.hitTime = 15
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 34
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1015, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(sysvar(0))
value = 51035
ID = sysvar(0)
ignoreHitPause = 1
persistent = 0

[State 1015, Turn]
type = Turn
trigger1 = MoveContact
trigger1 = Root, NumProjID(262144)
ignoreHitPause = 1
persistent = 0

[State 1015, ChangeState]
type = ChangeState
trigger1 = MoveContact
trigger1 = Root, NumProjID(262144)
value = sysvar(1)
ignoreHitPause = 1

[State 1015, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(NumTarget, 1016, 1015)
ignoreHitPause = 1

[State 1015, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = ifElse(var(0) > 0, 1015, 1007)
ignoreHitPause = 1

[State 1015, End]
type = ChangeState
trigger1 = !var(0) && PrevStateNo && Time = 2
value = 1007
ignoreHitPause = 1

[State 1015, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;Hit Pause
[StateDef 1016]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1
hitCountPersist = 1

[State 1016, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1016, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 1016, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1016, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1016, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1016, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 1016, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1016, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1080]
var(18) = 1

[State 1016, Flames]
type = Helper
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = ifElse(Target, SelfAnimExist(7697) || Target, StateType = A, 8150, 8151)
name = "Flames"
posType = P2
size.xScale = Root, const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 1

[State 1016, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1016, End]
type = ChangeState
trigger1 = Time >= 3 && var(0) > 1
trigger2 = Time >= 0 && var(0) <= 1
value = ifElse(var(0) <= 1, 1007, 1015)

;====<ES CHAOS FLARE (TARGET)>=
;Hit shake
[StateDef 51035]
type = S
moveType = H
physics = N
velset = 0,0

[State 51035, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = GetHitVar(AnimType) != [3,5]
value = ifElse((GetHitVar(GroundType) = 1), 5000, 5010) + GetHitVar(AnimType)

[State 51035, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = GetHitVar(AnimType) = [3,5]
value = 5030

[State 51035, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
value = 5047 + GetHitVar(AnimType)

[State 51035, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 51035, StateTypeSet]
type = StateTypeSet
trigger1 = !Time
trigger1 = GetHitVar(yVel) != 0 || GetHitVar(fall)
trigger2 = pos y != 0
StateType = A

[State 51035, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yVel) = 0 && !GetHitVar(fall)
value = 51036

[State 51035, SelfState]
type = ChangeState
trigger1 = HitShakeOver
value = 51037

;Knocked back
[StateDef 51036]
type = S
moveType = H
physics = S

[State 51036, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 51036, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime && Anim = (ifElse((GetHitVar(GroundType) = 1), 5000, 5010) + GetHitVar(AnimType))
value = ifElse(SelfAnimExist(7697), 7697, 5005 + GetHitVar(AnimType) + (GetHitVar(GroundType) = 2) * 10)

[State 51036, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 39 && Anim = 7697
value = 5005 + GetHitVar(AnimType) + (GetHitVar(GroundType) = 2) * 10

[State 51036, VelMul]
type = VelMul
trigger1 = Time >= GetHitVar(SlideTime)
x = 0.6

[State 51036, VelSet]
type = VelSet
trigger1 = HitOver
x = 0

[State 51036, DefenseMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 51036, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1

;Knocked into air
[StateDef 51037]
type = A
physics = N
movetype = H
ctrl = 0
velSet = -3.75, -10
sprPriority = 1

[State 51037, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(7697) && Anim != 7697
value = 7697

[State 51037, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(7697)
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
value = 5030

[State 51037, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(7697) && Time < 24
trigger1 = Anim = 5030 && AnimElemTime(AnimElemNo(0)+1) = 0
value = 5030
elem = AnimElemNo(0)

[State 51037, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(7697) && Time >= 24
trigger1 = Anim = 5030
trigger1 = SelfAnimExist(5035)
value = 5035

[State 51037, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5035 && !AnimTime
trigger2 = !SelfAnimExist(5035)
trigger2 = Anim = 5030 && Time >= 24
value = 5050

[State 51037, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = [5050,5059]
trigger1 = vel y >= ifElse(Anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(Anim + 10)
value = Anim + 10
persistent = 0

[State 51037, VelAdd]
type = VelAdd
trigger1 = Time < 14
x = 0.048828125
y = 0.732421875

[State 51037, VelSet]
type = VelSet
trigger1 = Time = 14
x = 0
y = 0

[State 51037, PosFreeze]
type = PosFreeze
trigger1 = Time = [14,24]
value = 1
ignoreHitPause = 1

[State 51037, VelAdd]
type = VelAdd
trigger1 = Time > 24
y = 0.6944417953

[State 51037, Recover]
type = SelfState
trigger1 = Alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 51037, End]
type = SelfState
trigger1 = pos y > -vel y
value = 5100

;====<EX CHAOS FLARE PROJECTILE>=
[StateDef 1035]
type = S
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1

[State 1035, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1035, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1045

[State 1035, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 3

[State 1035, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 1035, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateNo = ifElse(var(0) > 0, 1035, 1037)
ignoreHitPause = 1

[State 1035, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1035, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1035
value = 1035

[State 1035, VelSet]
type = VelSet
trigger1 = 1
x = ifElse(Time < 2 && var(0) < 3, 1, 8.75)

[State 1035, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1035, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time && !PrevStateNo
var(39) = 1

[State 1035, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1035, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1035, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && Root, var(15) < (1 + HitCount + Root, var(41))
trigger1 = var(0) > 0
ID = 1035
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, 4
guard.pauseTime = 0, 4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 44
ground.slideTime = 44
guard.hitTime = 15
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 34
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = ifElse(EnemyNear, SelfAnimExist(7697), 12 * var(9), 44 - 4 * (EnemyNear, StateType = A))
palFX.add = ifElse(EnemyNear, SelfAnimExist(7697), 255, 0), ifElse(EnemyNear, SelfAnimExist(7697), 255, 0), ifElse(EnemyNear, SelfAnimExist(7697), 255, 0)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7697), 256, 128), ifElse(EnemyNear, SelfAnimExist(7697), 256, 128), ifElse(EnemyNear, SelfAnimExist(7697), 256, 128)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7697), -255, 96), ifElse(EnemyNear, SelfAnimExist(7697), -255, 96), ifElse(EnemyNear, SelfAnimExist(7697), -255, 96), ifElse(EnemyNear, SelfAnimExist(7697), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1035, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1035)
value = 51035
ID = 1035
ignoreHitPause = 1
persistent = 0

[State 1035, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(NumTarget, 1036, 1035)
ignoreHitPause = 1

[State 1035, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = ifElse(var(0) > 0, 1035, 1037)
ignoreHitPause = 1

[State 1035, End]
type = ChangeState
trigger1 = !var(0) && PrevStateNo && Time = 2
value = 1037
ignoreHitPause = 1

[State 1035, Projectile Flag Off]
type = ParentVarAdd
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100
var(39) = -1

[State 1035, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;Hit Pause
[StateDef 1036]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1
hitCountPersist = 1

[State 1036, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1036, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 1036, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1036, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1036, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1036, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 1036, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1036, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1080]
var(18) = 1

[State 1036, Flames]
type = Helper
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = ifElse(Target, SelfAnimExist(7697), 8150, 8151)
name = "Flames"
posType = P2
size.xScale = Root, const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 1

[State 1036, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1036, End]
type = ChangeState
trigger1 = Time >= 3 && var(0) > 1
trigger2 = Time >= 0 && var(0) <= 1
value = ifElse(var(0) <= 1, 1037, 1035)

;Disappear
[StateDef 1037]
type = A
physics = N
moveType = A
anim = 1036
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1037, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 2
volume = -128
lowPriority = 1

[State 1037, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1037, End]
type = ChangeState
trigger1 = !AnimTime
value = 1038

;Wait
[StateDef 1038]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1038, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !NumHelper(8150) && !NumHelper(8151)
trigger2 = NumHelper(8150)
trigger2 = Helper(8150), AnimElemTime(18) >= 1
trigger3 = NumHelper(8151)
trigger3 = Helper(8151), AnimElemTime(18) >= 1
trigger4 = !NumTarget
trigger5 = NumTarget
trigger5 = Target, Time <= 1 && !(Target, HitShakeOver)
var(39) = -1
persistent = 0

[State 1038, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target, HitShakeOver)

;====<ES CHAOS FLARE PROJECTILE (REFLECTED)>=
[StateDef 1045]
type = S
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1

[State 1045, Turn]
type = Turn
trigger1 = !Time && PrevStateNo != [1045,1046]

[State 1045, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1045, Projectile Health Fix]
type = VarAdd
trigger1 = !Time && sysvar(1) != 1035
var(0) = 1
ignoreHitPause = 1

[State 1045, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !Time && sysvar(1) != 1035
var(39) = -1

[State 1045, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1035

[State 1045, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 1045, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateNo = ifElse(var(0) > 0, 1045, 1037)
ignoreHitPause = 1

[State 1045, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1045, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1035
value = 1035

[State 1045, VelSet]
type = VelSet
trigger1 = 1
x = ifElse(Time < 2 && var(0) < 3, 1, 8.75)

[State 1045, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1045, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1045, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1045, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1045, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && Root, var(15) < (1 + HitCount + Root, var(41))
trigger1 = var(0) > 0
ID = sysvar(0)
affectTeam = F
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, 4
guard.pauseTime = 0, 4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 44
ground.slideTime = 44
guard.hitTime = 15
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 34
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1045, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(sysvar(0))
value = 51035
ID = sysvar(0)
ignoreHitPause = 1
persistent = 0

[State 1045, Turn]
type = Turn
trigger1 = MoveContact
trigger1 = Root, NumProjID(262144)
ignoreHitPause = 1
persistent = 0

[State 1045, ChangeState]
type = ChangeState
trigger1 = MoveContact
trigger1 = Root, NumProjID(262144)
value = sysvar(1)
ignoreHitPause = 1

[State 1045, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(NumTarget, 1046, 1045)
ignoreHitPause = 1

[State 1045, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = ifElse(var(0) > 0, 1045, 1037)
ignoreHitPause = 1

[State 1045, End]
type = ChangeState
trigger1 = !var(0) && PrevStateNo && Time = 2
value = 1037
ignoreHitPause = 1

[State 1045, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;Hit Pause
[StateDef 1046]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1
hitCountPersist = 1

[State 1046, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1046, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 1046, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1046, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1046, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1046, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 1046, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1046, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1080]
var(18) = 1

[State 1046, Flames]
type = Helper
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = ifElse(Target, SelfAnimExist(7697) || Target, StateType = A, 8150, 8151)
name = "Flames"
posType = P2
size.xScale = Root, const(size.xScale) * 0.5
size.yScale = 0.5
ownPal = 1
ignoreHitPause = 1

[State 1046, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1046, End]
type = ChangeState
trigger1 = Time >= 3 && var(0) > 1
trigger2 = Time >= 0 && var(0) <= 1
value = ifElse(var(0) <= 1, 1037, 1045)

;====<CHAOS FLARE 2 PROJECTILE>=
[StateDef 1505]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1505
sprPriority = 2

[State 1505, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1505, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1515

[State 1505, Projectile Flag on]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(39) = 1

[State 1505, Bat Helper]
type = Helper
trigger1 = !Time && !PrevStateNo
helperType = Normal
stateNo = 11005
ID = 11005
name = "Chaos Flare Bat"
posType = P1
size.xScale = Root, const(size.xScale)
size.yScale = 1

[State 1505, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1507
ignoreHitPause = 1

[State 1505, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1505, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1505
value = 1505

[State 1505, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1505, VelSet]
type = VelSet
trigger1 = 1
x = ifElse(var(10) = 2, 6.25, ifElse(var(10) = 1, 5, 3.75))

[State 1505, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1505, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1505, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time
var(39) = 1

[State 1505, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1505, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1505, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1)
ID = 1505
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, 4
guard.pauseTime = 0, 4
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 15
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 24
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 2

[State 1505, VarSet]
type = VarSet
trigger1 = MoveHit && NumTarget(1505)
trigger1 = Target(1505), StateType = A
var(0) = 1
ignoreHitPause = 1
persistent = 0

[State 1505, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1505)
trigger1 = Target(1505), StateType != A
value = 51005
ID = 1505
ignoreHitPause = 1
persistent = 0

[State 1505, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1506
ignoreHitPause = 1

[State 1505, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1507
ignoreHitPause = 1

[State 1505, Projectile Dissipate]
type = ChangeState
trigger1 = var(10) < 2 && var(12) >= 55
value = 1509
ignoreHitPause = 1

[State 1505, Timer]
type = VarAdd
trigger1 = 1
var(12) = 1

[State 1505, Projectile Flag Off]
type = ParentVarAdd
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100
var(39) = -1

[State 1505, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;Hit Pause
[StateDef 1506]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 2
moveHitPersist = 1

[State 1506, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1506, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 8)
channel = 2
ignorehitPause = 1

[State 1506, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = ifElse(PrevStateNo = 3205 || PrevStateNo = 3215, 1, -1)
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1506, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1506, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1506, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 1506, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1506, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = [1500,1580]
var(18) = 1

[State 1506, Biting Bat Helper]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 11007
ID = 11007
name = "Biting Bat"
posType = P2
size.xScale = Root, const(size.xScale)
size.yScale = 1
ownPal = 1
ignoreHitPause = 1

[State 1506, End]
type = ChangeState
trigger1 = Time >= 0
value = 1507

;Disappear
[StateDef 1507]
type = A
physics = N
moveType = A
anim = ifElse(MoveContact = 1 && NumTarget, 1, 1507)
ctrl = 0
velSet = 0,0
sprPriority = 2
moveHitPersist = 1

[State 1507, VarSet]
type = VarSet
trigger1 = MoveHit && NumTarget(1505)
trigger1 = !(Target(1505), Alive)
var(0) = 1
ignoreHitPause = 1
persistent = 0

[State 1507, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1507 && Time
value = 1507

[State 1507, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !var(39)
var(39) = -1

[State 1507, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,8
channel = 2
volume = -128
lowPriority = 1

[State 1507, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1507, End]
type = ChangeState
trigger1 = !AnimTime
value = 1508

;Wait
[StateDef 1508]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1508, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !var(39)
var(39) = -1

[State 1508, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target, HitShakeOver)

;Fade Away
[StateDef 1509]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 2
moveHitPersist = 1

[State 1509, HitBy]
type = HitBy
trigger1 = 1
value =
ignoreHitPause = 1

[State 1509, Projectile Flag Decrement]
type = ParentVarAdd
trigger1 = !Time
var(39) = -1

[State 1509, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 128 - (16 * (Time + 1)), 256
ignoreHitPause = 1

[State 1509, End]
type = ChangeState
trigger1 = Time >= 7
value = 1508

;====<CHAOS FLARE PROJECTILE (REFLECTED)>=
[StateDef 1515]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1505
sprPriority = 2

[State 1515, Turn]
type = Turn
trigger1 = !Time && PrevStateNo != 1515

[State 1515, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1515, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1505

[State 1515, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1507
ignoreHitPause = 1

[State 1515, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1515, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1505
value = 1505

[State 1515, VelSet]
type = VelSet
trigger1 = 1
x = ifElse(var(10) = 2, 6.25, ifElse(var(10) = 1, 5, 3.75))

[State 1515, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1515, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1515, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time && PrevStateNo != 1515
var(39) = -1

[State 1515, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1515, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1515, HitDef]
type = HitDef
trigger1 = 1
ID = sysvar(0)
affectTeam = F
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, 12
guard.pauseTime = 0, 12
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 15
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 24
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 2

[State 1515, VarSet]
type = VarSet
trigger1 = MoveHit && NumTarget(sysvar(0))
trigger1 = Target(sysvar(0)), StateType = A
var(0) = 1
ignoreHitPause = 1
persistent = 0

[State 1515, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(sysvar(0))
trigger1 = Target(sysvar(0)), StateType != A
value = 51005
ID = sysvar(0)
ignoreHitPause = 1
persistent = 0

[State 1515, Turn]
type = Turn
trigger1 = MoveContact
trigger1 = Root, NumProjID(262144)
ignoreHitPause = 1
persistent = 0

[State 1515, ChangeState]
type = ChangeState
trigger1 = MoveContact
trigger1 = Root, NumProjID(262144)
value = sysvar(1)
ignoreHitPause = 1

[State 1515, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1506
ignoreHitPause = 1

[State 1515, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1507
ignoreHitPause = 1

[State 1515, Projectile Dissipate]
type = ChangeState
trigger1 = var(10) < 2 && var(12) >= 55
value = 1509
ignoreHitPause = 1

[State 1515, Timer]
type = VarAdd
trigger1 = 1
var(12) = 1

[State 1515, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;====<CHAOS FLARE BAT>=
[StateDef 11005]
type = A
physics = N
moveType = I
ctrl = 0
anim = 11005
sprPriority = 3

[State 11005, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 11005, Flames (Top Layer)]
type = Explod
trigger1 = !NumExplod(1506)
anim = 1506
ID = 1506
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = -1

[State 11005, Turn]
type = Turn
trigger1 = Parent, StateNo = 1515 && Parent, Time = 1

[State 11005, RemoveExplod]
type = RemoveExplod
trigger1 = Parent, StateNo = 1515 && Parent, Time = 1
ID = 1506
ignoreHitPause = 1

[State 11005, Flames (Top Layer)]
type = Explod
trigger1 = Parent, StateNo = 1515 && Parent, Time = 1
anim = 1506
ID = 1506
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = -1

[State 11005, Projectile Dissipate]
type = ChangeState
trigger1 = Parent, StateNo = 1509
value = 11006

[State 11005, RemoveExplod]
type = RemoveExplod
trigger1 = !Root, NumHelper(1505)
trigger2 = FrontEdgeDist < -100 || BackEdgeDist < -100
trigger3 = (Parent, StateNo = [1506,1508])
ID = 1506
ignoreHitPause = 1

[State 11005, End]
type = DestroySelf
trigger1 = !Root, NumHelper(1505)
trigger2 = FrontEdgeDist < -100 || BackEdgeDist < -100
trigger3 = (Parent, StateNo = [1506,1508])

[State 11005, BindToParent]
type = BindToParent
trigger1 = 1
ignoreHitPause = 1

;Disappear
[StateDef 11006]
type = A
physics = N
moveType = I
ctrl = 0
velSet = 0,0
moveHitPersist = 1

[State 11006, ModifyExplod]
type = ModifyExplod
trigger1 = 1
ID = 1506
trans = AddAlpha
alpha = 128 - (16 * (Time + 1)), 256

[State 11006, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 128 - (16 * (Time + 1)), 128 + (16 * (Time + 1))
ignoreHitPause = 1

[State 11006, End]
type = DestroySelf
trigger1 = Time >= 7

[State 11006, BindToParent]
type = BindToParent
trigger1 = 1
ignoreHitPause = 1

;====<CHAOS FLARE BAT (BITING)>=
[StateDef 11007]
type = A
physics = N
moveType = I
ctrl = 0
anim = 11007
sprPriority = 3

[State 11007, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 11007, ChangeAnim]
type = ChangeAnim
trigger1 = Time < 4
value = 11007
elem = 1

[State 11007, Player]
type = VarSet
trigger1 = !Time
var(0) = Parent, var(43)

[State 11007, Facing]
type = Turn
trigger1 = PlayerIDexist(var(0))
trigger1 = Facing = (PlayerID(var(0)), Facing)

[State 11007, PosAdd]
type = PosAdd
trigger1 = !Time
x = ParentDist x
y = ParentDist y

[State 11007, PosSet]
type = PosSet
trigger1 = PlayerIDexist(var(0)) && Time >= 4 && !(Parent, MoveGuarded) && !(Parent, var(0))
x = ceil(PlayerID(var(0)), pos x) + ifElse(Facing = 1, -15, 15)
y = ceil(PlayerID(var(0)), pos y) + (PlayerID(var(0)), const(size.head.pos.y)) - ((PlayerID(var(0)), const(size.head.pos.y)) - (PlayerID(var(0)), const(size.mid.pos.y))) / 2

[State 11007, Biting Sound]
type = PlaySnd
trigger1 = Time = 8 || Time = 16 || Time = 24 || Time = 32
value = 2,8

[State 11007, Blood]
type = Explod
trigger1 = PlayerIDexist(var(0))
trigger1 = Time = 8 || Time = 16 || Time = 24 || Time = 32
anim = 8050 + Random % 2
sprPriority = 4
posType = P1
pos = ceil(8 * Root, const(size.xScale)), ceil(2 * Root, const(size.yScale))
scale = Root, const(size.xScale), 1
ownPal = 1
ignoreHitPause = 1

[State 11007, Projectile Flag Off]
type = ParentVarAdd
trigger1 = Time >= 32
trigger2 = !PlayerIDexist(var(0))
trigger3 = Time >= 2 && (Parent, MoveGuarded || Parent, var(0))
var(39) = -1

[State 11007, Fly away]
type = ChangeState
trigger1 = Time >= 34
trigger2 = !PlayerIDexist(var(0))
trigger3 = Time >= 4 && (Parent, MoveGuarded || Parent, var(0))
value = 11008

;Flying away
[StateDef 11008]
type = A
physics = N
moveType = I
ctrl = 0
anim = 11008
sprPriority = 3

[State 11008, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 11008, VelSet]
type = VelSet
trigger1 = !Time
x = 1.25

[State 11008, VelAdd]
type = VelAdd
trigger1 = 1
x = 0.390625
y = -0.390625

[State 11008, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;====<EX CHAOS FLARE 2 PROJECTILE>=
[StateDef 1535]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1505
sprPriority = 2

[State 1535, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1535, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1545

[State 1535, Projectile Flag on]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(39) = 1

[State 1535, Bat Helper]
type = Helper
trigger1 = !Time && !PrevStateNo
helperType = Normal
stateNo = 11035
ID = 11035
name = "Chaos Flare Bat"
posType = P1
size.xScale = Root, const(size.xScale)
size.yScale = 1

[State 1535, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1537
ignoreHitPause = 1

[State 1535, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1535, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1505
value = 1505

[State 1535, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1535, VelSet]
type = VelSet
trigger1 = 1
x = 8

[State 1535, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1535, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1535, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time
var(39) = 1

[State 1535, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1535, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1535, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1)
ID = 1535
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 140 < 7, 7, fvar(11) * 140)), 7
getPower = 0
givePower = 36, 36
pauseTime = 0, 4
guard.pauseTime = 0, 4
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 15
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 24
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 2

[State 1535, VarSet]
type = VarSet
trigger1 = MoveHit && NumTarget(1535)
trigger1 = Target(1535), StateType = A
var(0) = 1
ignoreHitPause = 1
persistent = 0

[State 1535, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1535)
trigger1 = Target(1535), StateType != A
value = 51005
ID = 1535
ignoreHitPause = 1
persistent = 0

[State 1535, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1536
ignoreHitPause = 1

[State 1535, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1537
ignoreHitPause = 1

[State 1535, Projectile Dissipate]
type = ChangeState
trigger1 = var(10) < 2 && var(12) >= 55
value = 1539
ignoreHitPause = 1

[State 1535, Timer]
type = VarAdd
trigger1 = 1
var(12) = 1

[State 1535, Projectile Flag Off]
type = ParentVarAdd
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100
var(39) = -1

[State 1535, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;Hit Pause
[StateDef 1536]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 2
moveHitPersist = 1

[State 1536, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1536, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 8)
channel = 2
ignorehitPause = 1

[State 1536, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = ifElse(PrevStateNo = 3205 || PrevStateNo = 3215, 1, -1)
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1536, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1536, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1536, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 1536, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1536, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = [1500,1580]
var(18) = 1

[State 1536, Biting Bat Helper]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 11037
ID = 11037
name = "Biting Bat"
posType = P2
size.xScale = Root, const(size.xScale)
size.yScale = 1
ownPal = 1
ignoreHitPause = 1

[State 1536, End]
type = ChangeState
trigger1 = Time >= 0
value = 1537

;Disappear
[StateDef 1537]
type = A
physics = N
moveType = A
anim = ifElse(MoveContact = 1 && NumTarget, 1, 1507)
ctrl = 0
velSet = 0,0
sprPriority = 2
moveHitPersist = 1

[State 1537, VarSet]
type = VarSet
trigger1 = MoveHit && NumTarget(1535)
trigger1 = !(Target(1535), Alive)
var(0) = 1
ignoreHitPause = 1
persistent = 0

[State 1537, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1507 && Time
value = 1507

[State 1537, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !var(39)
var(39) = -1

[State 1537, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,8
channel = 2
volume = -128
lowPriority = 1

[State 1537, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1537, End]
type = ChangeState
trigger1 = !AnimTime
value = 1538

;Wait
[StateDef 1538]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1538, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !var(39)
var(39) = -1

[State 1538, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target, HitShakeOver)

;Fade Away
[StateDef 1539]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 2
moveHitPersist = 1

[State 1539, HitBy]
type = HitBy
trigger1 = 1
value =
ignoreHitPause = 1

[State 1539, Projectile Flag Decrement]
type = ParentVarAdd
trigger1 = !Time
var(39) = -1

[State 1539, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 128 - (16 * (Time + 1)), 256
ignoreHitPause = 1

[State 1539, End]
type = ChangeState
trigger1 = Time >= 7
value = 1538

;====<CHAOS FLARE PROJECTILE (REFLECTED)>=
[StateDef 1545]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1505
sprPriority = 2

[State 1545, Turn]
type = Turn
trigger1 = !Time && PrevStateNo != 1545

[State 1545, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1545, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1535

[State 1545, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1537
ignoreHitPause = 1

[State 1545, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1545, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1505
value = 1505

[State 1545, VelSet]
type = VelSet
trigger1 = 1
x = 8

[State 1545, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1545, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1545, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time && PrevStateNo != 1545
var(39) = -1

[State 1545, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1545, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1545, HitDef]
type = HitDef
trigger1 = 1
ID = sysvar(0)
affectTeam = F
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getPower = 0
givePower = 36, 36
pauseTime = 0, 12
guard.pauseTime = 0, 12
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 15
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 24
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 2

[State 1545, VarSet]
type = VarSet
trigger1 = MoveHit && NumTarget(sysvar(0))
trigger1 = Target(sysvar(0)), StateType = A
var(0) = 1
ignoreHitPause = 1
persistent = 0

[State 1545, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(sysvar(0))
trigger1 = Target(sysvar(0)), StateType != A
value = 51005
ID = sysvar(0)
ignoreHitPause = 1
persistent = 0

[State 1545, Turn]
type = Turn
trigger1 = MoveContact
trigger1 = Root, NumProjID(262144)
ignoreHitPause = 1
persistent = 0

[State 1545, ChangeState]
type = ChangeState
trigger1 = MoveContact
trigger1 = Root, NumProjID(262144)
value = sysvar(1)
ignoreHitPause = 1

[State 1545, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1536
ignoreHitPause = 1

[State 1545, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1537
ignoreHitPause = 1

[State 1545, Projectile Dissipate]
type = ChangeState
trigger1 = var(10) < 2 && var(12) >= 55
value = 1539
ignoreHitPause = 1

[State 1545, Timer]
type = VarAdd
trigger1 = 1
var(12) = 1

[State 1545, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;====<EX CHAOS FLARE BAT>=
[StateDef 11035]
type = A
physics = N
moveType = I
ctrl = 0
anim = 11005
sprPriority = 3

[State 11035, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 11035, Flames (Top Layer)]
type = Explod
trigger1 = !NumExplod(1536)
anim = 1506
ID = 1536
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = -1

[State 11035, Turn]
type = Turn
trigger1 = Parent, StateNo = 1545 && Parent, Time = 1

[State 11035, RemoveExplod]
type = RemoveExplod
trigger1 = Parent, StateNo = 1545 && Parent, Time = 1
ID = 1536
ignoreHitPause = 1

[State 11035, Flames (Top Layer)]
type = Explod
trigger1 = Parent, StateNo = 1545 && Parent, Time = 1
anim = 1506
ID = 1536
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = -1

[State 11035, Projectile Dissipate]
type = ChangeState
trigger1 = Parent, StateNo = 1539
value = 11036

[State 11035, RemoveExplod]
type = RemoveExplod
trigger1 = !Root, NumHelper(1535)
trigger2 = FrontEdgeDist < -100 || BackEdgeDist < -100
trigger3 = (Parent, StateNo = [1536,1538])
ID = 1536
ignoreHitPause = 1

[State 11035, End]
type = DestroySelf
trigger1 = !Root, NumHelper(1535)
trigger2 = FrontEdgeDist < -100 || BackEdgeDist < -100
trigger3 = (Parent, StateNo = [1536,1538])

[State 11035, BindToParent]
type = BindToParent
trigger1 = 1
ignoreHitPause = 1

;Disappear
[StateDef 11036]
type = A
physics = N
moveType = I
ctrl = 0
velSet = 0,0
moveHitPersist = 1

[State 11036, ModifyExplod]
type = ModifyExplod
trigger1 = 1
ID = 1536
trans = AddAlpha
alpha = 128 - (16 * (Time + 1)), 256

[State 11036, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 128 - (16 * (Time + 1)), 128 + (16 * (Time + 1))
ignoreHitPause = 1

[State 11036, End]
type = DestroySelf
trigger1 = Time >= 7

[State 11036, BindToParent]
type = BindToParent
trigger1 = 1
ignoreHitPause = 1

;====<EX CHAOS FLARE BAT (BITING)>=
[StateDef 11037]
type = A
physics = N
moveType = I
ctrl = 0
anim = 11007
sprPriority = 3

[State 11037, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 11037, ChangeAnim]
type = ChangeAnim
trigger1 = Time < 4
value = 11007
elem = 1

[State 11037, Player]
type = VarSet
trigger1 = !Time
var(0) = Parent, var(43)

[State 11037, Facing]
type = Turn
trigger1 = PlayerIDexist(var(0))
trigger1 = Facing = (PlayerID(var(0)), Facing)

[State 11037, PosAdd]
type = PosAdd
trigger1 = !Time
x = ParentDist x
y = ParentDist y

[State 11037, PosSet]
type = PosSet
trigger1 = PlayerIDexist(var(0)) && Time >= 4 && !(Parent, MoveGuarded) && !(Parent, var(0))
x = ceil(PlayerID(var(0)), pos x) + ifElse(Facing = 1, -15, 15)
y = ceil(PlayerID(var(0)), pos y) + (PlayerID(var(0)), const(size.head.pos.y)) - ((PlayerID(var(0)), const(size.head.pos.y)) - (PlayerID(var(0)), const(size.mid.pos.y))) / 2

[State 11037, Biting Sound]
type = PlaySnd
trigger1 = Time = 8 || Time = 16 || Time = 24 || Time = 32
value = 2,8

[State 11037, Blood]
type = Explod
trigger1 = PlayerIDexist(var(0))
trigger1 = Time = 8 || Time = 16 || Time = 24 || Time = 32
anim = 8050 + Random % 2
sprPriority = 4
posType = P1
pos = ceil(8 * Root, const(size.xScale)), ceil(2 * Root, const(size.yScale))
scale = Root, const(size.xScale), 1
ownPal = 1
ignoreHitPause = 1

[State 11037, Projectile Flag Off]
type = ParentVarAdd
trigger1 = Time >= 32
trigger2 = !PlayerIDexist(var(0))
trigger3 = Time >= 2 && (Parent, MoveGuarded || Parent, var(0))
var(39) = -1

[State 11037, Fly away]
type = ChangeState
trigger1 = Time >= 34
trigger2 = !PlayerIDexist(var(0))
trigger3 = Time >= 4 && (Parent, MoveGuarded || Parent, var(0))
value = 11038

;Flying away
[StateDef 11038]
type = A
physics = N
moveType = I
ctrl = 0
anim = 11008
sprPriority = 3

[State 11038, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 11038, VelSet]
type = VelSet
trigger1 = !Time
x = 1.25

[State 11038, VelAdd]
type = VelAdd
trigger1 = 1
x = 0.390625
y = -0.390625

[State 11038, End]
type = DestroySelf
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100

;====<CHAOS FLARE (TARGET)>=
;Hit shake
[Statedef 51005]
type = S
moveType = H
physics = N
velset = 0,0

[State 51005, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = GetHitVar(AnimType) != [3,5]
value = ifElse((GetHitVar(GroundType) = 1), 5000, 5010) + GetHitVar(AnimType)

[State 51005, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = GetHitVar(AnimType) = [3,5]
value = 5030

[State 51005, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
value = 5047 + GetHitVar(AnimType)

[State 51005, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 51005, StateTypeSet]
type = StateTypeSet
trigger1 = !Time
trigger1 = GetHitVar(yVel) != 0 || GetHitVar(fall)
trigger2 = pos y != 0
StateType = A

[State 51005, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yVel) = 0 && !GetHitVar(fall)
value = 51006

[State 51005, SelfState]
type = SelfState
trigger1 = HitShakeOver
value = 5030

;Knocked back
[StateDef 51006]
type = S
moveType = H
physics = S

[State 51006, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 51006, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 5010 && !AnimTime
value = 5010

[State 51006, VelMul]
type = VelMul
trigger1 = Time >= GetHitVar(SlideTime)
x = 0.6

[State 51006, VelSet]
type = VelSet
trigger1 = HitOver
x = 0

[State 51006, DefenseMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 51006, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1

;====<DEMON BLAST PROJECTILE>=
[StateDef 3105]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3

[State 3105, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 3105, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !PrevStateNo
value = 1

[State 3105, Startup 1 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3105) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 3

[State 3105, Startup 1 (Top)]
type = Explod
trigger1 = Time = 3 && IsHelper(3105) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 1 (Bottom)]
type = Explod
trigger1 = Time = 3 && IsHelper(3105) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 1]
type = ChangeAnim
trigger1 = Time = 9 && IsHelper(3105) && Anim != 3105
value = 3105

[State 3105, Startup 2 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3106) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 2

[State 3105, Startup 2 (Top)]
type = Explod
trigger1 = Time = 2 && IsHelper(3106) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 2 (Bottom)]
type = Explod
trigger1 = Time = 2 && IsHelper(3106) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 2]
type = ChangeAnim
trigger1 = Time = 8 && IsHelper(3106) && Anim != 3105
value = 3105

[State 3105, Startup 3 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3107) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3105, Startup 3 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3107) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 3 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3107) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 3]
type = ChangeAnim
trigger1 = Time = 7 && IsHelper(3107) && Anim != 3105
value = 3105

[State 3105, Startup 4 (Top)]
type = Explod
trigger1 = !Time && IsHelper(3108) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 4 (Bottom)]
type = Explod
trigger1 = !Time && IsHelper(3108) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 4]
type = ChangeAnim
trigger1 = Time = 6 && IsHelper(3108) && Anim != 3105
value = 3105

[State 3105, Startup 5 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3109) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 3

[State 3105, Startup 5 (Top)]
type = Explod
trigger1 = Time = 3 && IsHelper(3109) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 5 (Bottom)]
type = Explod
trigger1 = Time = 3 && IsHelper(3109) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 5]
type = ChangeAnim
trigger1 = Time = 9 && IsHelper(3109) && Anim != 3105
value = 3105

[State 3105, Startup 6 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3110) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 2

[State 3105, Startup 6 (Top)]
type = Explod
trigger1 = Time = 2 && IsHelper(3110) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 6 (Bottom)]
type = Explod
trigger1 = Time = 2 && IsHelper(3110) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 6]
type = ChangeAnim
trigger1 = Time = 8 && IsHelper(3110) && Anim != 3105
value = 3105

[State 3105, Startup 7 (Top)]
type = Explod
trigger1 = !Time && IsHelper(3111) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 7 (Bottom)]
type = Explod
trigger1 = !Time && IsHelper(3111) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 7]
type = ChangeAnim
trigger1 = Time = 6 && IsHelper(3111) && Anim != 3105
value = 3105

[State 3105, Startup 8 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3112) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 3

[State 3105, Startup 8 (Top)]
type = Explod
trigger1 = Time = 3 && IsHelper(3112) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 8 (Bottom)]
type = Explod
trigger1 = Time = 3 && IsHelper(3112) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 8]
type = ChangeAnim
trigger1 = Time = 9 && IsHelper(3112) && Anim != 3105
value = 3105

[State 3105, Startup 9 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3113) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3105, Startup 9 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3113) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 9 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3113) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 9]
type = ChangeAnim
trigger1 = Time = 7 && IsHelper(3113) && Anim != 3105
value = 3105

[State 3105, Startup 10 (Top)]
type = Explod
trigger1 = !Time && IsHelper(3114) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 10 (Bottom)]
type = Explod
trigger1 = !Time && IsHelper(3114) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 10]
type = ChangeAnim
trigger1 = Time = 6 && IsHelper(3114) && Anim != 3105
value = 3105

[State 3105, Startup 11 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3115) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3105, Startup 11 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3115) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 11 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3115) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 11]
type = ChangeAnim
trigger1 = Time = 7 && IsHelper(3115) && Anim != 3105
value = 3105

[State 3105, Startup 12 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3116) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 2

[State 3105, Startup 12 (Top)]
type = Explod
trigger1 = Time = 2 && IsHelper(3116) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 12 (Bottom)]
type = Explod
trigger1 = Time = 2 && IsHelper(3116) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 12]
type = ChangeAnim
trigger1 = Time = 8 && IsHelper(3116) && Anim != 3105
value = 3105

[State 3105, Startup 13 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3117) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 2

[State 3105, Startup 13 (Top)]
type = Explod
trigger1 = Time = 2 && IsHelper(3117) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 13 (Bottom)]
type = Explod
trigger1 = Time = 2 && IsHelper(3117) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 13]
type = ChangeAnim
trigger1 = Time = 8 && IsHelper(3117) && Anim != 3105
value = 3105

[State 3105, Startup 14 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3118) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3105, Startup 14 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3118) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 14 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3118) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 14]
type = ChangeAnim
trigger1 = Time = 7 && IsHelper(3118) && Anim != 3105
value = 3105

[State 3105, Startup 15 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3119) && Anim != 3105
anim = 13104
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 3

[State 3105, Startup 15 (Top)]
type = Explod
trigger1 = Time = 3 && IsHelper(3119) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 15 (Bottom)]
type = Explod
trigger1 = Time = 3 && IsHelper(3119) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 15]
type = ChangeAnim
trigger1 = Time = 9 && IsHelper(3119) && Anim != 3105
value = 3105

[State 3105, Startup 16 (Top)]
type = Explod
trigger1 = !Time && IsHelper(3120) && Anim != 3105
anim = 13105
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Startup 16 (Bottom)]
type = Explod
trigger1 = !Time && IsHelper(3120) && Anim != 3105
anim = 13106
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3105, Turn Visible 16]
type = ChangeAnim
trigger1 = Time = 6 && IsHelper(3120) && Anim != 3105
value = 3105

[State 3105, Timer Set]
type = VarSet
trigger1 = !Time
var(12) = -1

[State 3105, Timer]
type = VarAdd
trigger1 = Root, var(10)
var(12) = 1

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && var(12) = 1
trigger2 = IsHelper(3118) && var(12) = 1
y = -7.3828125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 3 || var(12) = 33)
trigger2 = IsHelper(3106) && var(12) = 5
trigger3 = IsHelper(3107) && var(12) = 11
trigger4 = IsHelper(3108) && var(12) = 13
trigger5 = IsHelper(3109) && var(12) = 19
trigger6 = IsHelper(3110) && var(12) = 21
trigger7 = IsHelper(3113) && var(12) = 27
trigger8 = IsHelper(3113) && var(12) = 29
trigger9 = IsHelper(3116) && var(12) = 7
trigger10 = IsHelper(3115) && var(12) = 9
trigger11 = IsHelper(3114) && var(12) = 23
trigger12 = IsHelper(3119) && var(12) = 17
trigger13 = IsHelper(3117) && var(12) = 23
trigger14 = IsHelper(3118) && var(12) = 25
trigger15 = IsHelper(3120) && var(12) = 31
y = 5.82421875

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 4 || var(12) = 32)
trigger2 = IsHelper(3106) && var(12) = 4
trigger3 = IsHelper(3107) && var(12) = 12
trigger4 = IsHelper(3108) && var(12) = 12
trigger5 = IsHelper(3109) && var(12) = 20
trigger6 = IsHelper(3110) && var(12) = 20
trigger7 = IsHelper(3113) && var(12) = 28
trigger8 = IsHelper(3113) && var(12) = 28
trigger9 = IsHelper(3116) && var(12) = 8
trigger10 = IsHelper(3115) && var(12) = 8
trigger11 = IsHelper(3114) && var(12) = 24
trigger12 = IsHelper(3119) && var(12) = 16
trigger13 = IsHelper(3117) && var(12) = 24
trigger14 = IsHelper(3118) && var(12) = 24
trigger15 = IsHelper(3120) && var(12) = 32
y = 5.99609375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 5 || var(12) = 31)
trigger2 = IsHelper(3106) && var(12) = 3
trigger3 = IsHelper(3107) && var(12) = 13
trigger4 = IsHelper(3108) && var(12) = 11
trigger5 = IsHelper(3109) && var(12) = 21
trigger6 = IsHelper(3110) && var(12) = 19
trigger7 = IsHelper(3113) && var(12) = 29
trigger8 = IsHelper(3113) && var(12) = 27
trigger9 = IsHelper(3116) && var(12) = 9
trigger10 = IsHelper(3115) && var(12) = 7
trigger11 = IsHelper(3114) && var(12) = 25
trigger12 = IsHelper(3119) && var(12) = 15
trigger13 = IsHelper(3117) && var(12) = 25
trigger14 = IsHelper(3118) && var(12) = 23
trigger15 = IsHelper(3120) && var(12) = 33
y = 3.5625

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 6 || var(12) = 30)
trigger2 = IsHelper(3106) && var(12) = 2
trigger3 = IsHelper(3107) && var(12) = 14
trigger4 = IsHelper(3108) && var(12) = 10
trigger5 = IsHelper(3109) && var(12) = 22
trigger6 = IsHelper(3110) && var(12) = 18
trigger7 = IsHelper(3113) && var(12) = 30
trigger8 = IsHelper(3111) && (var(12) = 2 || var(12) = 26)
trigger9 = IsHelper(3116) && var(12) = 10
trigger10 = IsHelper(3115) && var(12) = 6
trigger11 = IsHelper(3114) && var(12) = 26
trigger12 = IsHelper(3119) && var(12) = 14
trigger13 = IsHelper(3117) && var(12) = 26
trigger14 = IsHelper(3118) && var(12) = 22
y = -2.34765625

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 7 || var(12) = 29)
trigger2 = IsHelper(3107) && var(12) = 15
trigger3 = IsHelper(3108) && var(12) = 9
trigger4 = IsHelper(3109) && var(12) = 23
trigger5 = IsHelper(3110) && var(12) = 17
trigger6 = IsHelper(3113) && var(12) = 31
trigger7 = IsHelper(3111) && (var(12) = 3 || var(12) = 25)
trigger8 = IsHelper(3116) && (var(12) = 11 || var(12) = 33)
trigger9 = IsHelper(3115) && var(12) = 5
trigger10 = IsHelper(3114) && var(12) = 27
trigger11 = IsHelper(3119) && var(12) = 13
trigger12 = IsHelper(3117) && var(12) = 27
trigger13 = IsHelper(3118) && var(12) = 21
y = -7.2109375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 8 || var(12) = 28)
trigger2 = IsHelper(3107) && var(12) = 16
trigger3 = IsHelper(3108) && var(12) = 8
trigger4 = IsHelper(3109) && var(12) = 24
trigger5 = IsHelper(3110) && var(12) = 16
trigger6 = IsHelper(3113) && var(12) = 32
trigger7 = IsHelper(3111) && (var(12) = 4 || var(12) = 24)
trigger8 = IsHelper(3116) && (var(12) = 12 || var(12) = 32)
trigger9 = IsHelper(3115) && var(12) = 4
trigger10 = IsHelper(3114) && var(12) = 28
trigger11 = IsHelper(3119) && var(12) = 12
trigger12 = IsHelper(3117) && var(12) = 28
trigger13 = IsHelper(3118) && var(12) = 20
y = -5.0859375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 9 || var(12) = 27)
trigger2 = IsHelper(3107) && var(12) = 17
trigger3 = IsHelper(3108) && var(12) = 7
trigger4 = IsHelper(3109) && var(12) = 25
trigger5 = IsHelper(3110) && var(12) = 15
trigger6 = IsHelper(3113) && var(12) = 33
trigger7 = IsHelper(3111) && (var(12) = 5 || var(12) = 23)
trigger8 = IsHelper(3116) && (var(12) = 13 || var(12) = 31)
trigger9 = IsHelper(3115) && var(12) = 3
trigger10 = IsHelper(3114) && var(12) = 29
trigger11 = IsHelper(3119) && var(12) = 11
trigger12 = IsHelper(3117) && var(12) = 29
trigger13 = IsHelper(3118) && var(12) = 19
y = -0.73828125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 10 || var(12) = 26)
trigger2 = IsHelper(3107) && var(12) = 18
trigger3 = IsHelper(3108) && var(12) = 6
trigger4 = IsHelper(3109) && var(12) = 26
trigger5 = IsHelper(3110) && var(12) = 14
trigger6 = IsHelper(3111) && (var(12) = 6 || var(12) = 22)
trigger7 = IsHelper(3116) && (var(12) = 14 || var(12) = 30)
trigger8 = IsHelper(3115) && var(12) = 2
trigger9 = IsHelper(3114) && var(12) = 30
trigger9 = IsHelper(3119) && var(12) = 10
trigger10 = IsHelper(3117) && var(12) = 30
trigger11 = IsHelper(3118) && (var(12) = 2 || var(12) = 18)
y = 4.328125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 11 || var(12) = 25)
trigger2 = IsHelper(3107) && (var(12) = 19 || var(12) = 33)
trigger3 = IsHelper(3108) && var(12) = 5
trigger4 = IsHelper(3109) && var(12) = 27
trigger5 = IsHelper(3110) && var(12) = 13
trigger6 = IsHelper(3111) && (var(12) = 7 || var(12) = 21)
trigger7 = IsHelper(3116) && (var(12) = 15 || var(12) = 29)
trigger8 = IsHelper(3114) && var(12) = 31
trigger9 = IsHelper(3119) && var(12) = 9
trigger10 = IsHelper(3117) && var(12) = 31
trigger11 = IsHelper(3118) && (var(12) = 3 || var(12) = 17)
y = 7.4921875

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 12 || var(12) = 24)
trigger2 = IsHelper(3107) && (var(12) = 20 || var(12) = 32)
trigger3 = IsHelper(3108) && var(12) = 4
trigger4 = IsHelper(3109) && var(12) = 28
trigger5 = IsHelper(3110) && var(12) = 12
trigger6 = IsHelper(3111) && (var(12) = 8 || var(12) = 20)
trigger7 = IsHelper(3116) && (var(12) = 16 || var(12) = 28)
trigger8 = IsHelper(3114) && var(12) = 32
trigger9 = IsHelper(3119) && var(12) = 8
trigger10 = IsHelper(3117) && var(12) = 32
trigger11 = IsHelper(3118) && (var(12) = 4 || var(12) = 16)
y = 3.40234375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 13 || var(12) = 23)
trigger2 = IsHelper(3107) && (var(12) = 31 || var(12) = 31)
trigger3 = IsHelper(3108) && var(12) = 3
trigger4 = IsHelper(3109) && var(12) = 29
trigger5 = IsHelper(3110) && var(12) = 11
trigger6 = IsHelper(3111) && (var(12) = 9 || var(12) = 19)
trigger7 = IsHelper(3116) && (var(12) = 17 || var(12) = 27)
trigger8 = IsHelper(3114) && var(12) = 33
trigger9 = IsHelper(3119) && var(12) = 7
trigger10 = IsHelper(3117) && var(12) = 33
trigger11 = IsHelper(3118) && (var(12) = 5 || var(12) = 15)
y = -2.1875

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 14 || var(12) = 22)
trigger2 = IsHelper(3106) && var(12) = 1
trigger3 = IsHelper(3107) && (var(12) = 22 || var(12) = 30)
trigger4 = IsHelper(3108) && var(12) = 2
trigger5 = IsHelper(3109) && var(12) = 30
trigger6 = IsHelper(3110) && (var(12) = 2 || var(12) = 10)
trigger7 = IsHelper(3111) && (var(12) = 10 || var(12) = 18)
trigger8 = IsHelper(3116) && (var(12) = 18 || var(12) = 26)
trigger9 = IsHelper(3119) && var(12) = 6
trigger10 = IsHelper(3117) && var(12) = 1
trigger11 = IsHelper(3118) && (var(12) = 6 || var(12) = 14)
y = -5.65234375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 15 || var(12) = 21)
trigger2 = IsHelper(3107) && (var(12) = 23 || var(12) = 29)
trigger3 = IsHelper(3109) && var(12) = 31
trigger4 = IsHelper(3110) && (var(12) = 3 || var(12) = 9)
trigger5 = IsHelper(3111) && (var(12) = 11 || var(12) = 17)
trigger6 = IsHelper(3116) && (var(12) = 19 || var(12) = 25)
trigger7 = IsHelper(3119) && var(12) = 5
trigger8 = IsHelper(3118) && (var(12) = 7 || var(12) = 13)
y = -6.64453125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 16 || var(12) = 20)
trigger2 = IsHelper(3107) && (var(12) = 24 || var(12) = 28)
trigger3 = IsHelper(3109) && var(12) = 32
trigger4 = IsHelper(3110) && (var(12) = 4 || var(12) = 8)
trigger5 = IsHelper(3111) && (var(12) = 12 || var(12) = 16)
trigger6 = IsHelper(3116) && (var(12) = 20 || var(12) = 24)
trigger7 = IsHelper(3119) && var(12) = 4
trigger8 = IsHelper(3118) && (var(12) = 8 || var(12) = 12)
y = -1.1953125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && (var(12) = 17 || var(12) = 19)
trigger2 = IsHelper(3107) && (var(12) = 25 || var(12) = 27)
trigger3 = IsHelper(3109) && var(12) = 33
trigger4 = IsHelper(3110) && (var(12) = 5 || var(12) = 7)
trigger5 = IsHelper(3111) && (var(12) = 13 || var(12) = 15)
trigger6 = IsHelper(3116) && (var(12) = 21 || var(12) = 23)
trigger7 = IsHelper(3119) && var(12) = 3
trigger8 = IsHelper(3118) && (var(12) = 9 || var(12) = 11)
y = 4.78515625

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3105) && var(12) = 18
trigger2 = IsHelper(3107) && var(12) = 26
trigger3 = IsHelper(3110) && var(12) = 6
trigger4 = IsHelper(3111) && var(12) = 14
trigger5 = IsHelper(3116) && var(12) = 22
trigger6 = IsHelper(3119) && var(12) = 2
trigger7 = IsHelper(3118) && var(12) = 10
y = 6.109375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && var(12) = 7
trigger2 = IsHelper(3107) && var(12) = 9
trigger3 = IsHelper(3108) && var(12) = 15
trigger4 = IsHelper(3109) && var(12) = 17
trigger5 = IsHelper(3110) && var(12) = 23
trigger6 = IsHelper(3113) && var(12) = 25
trigger7 = IsHelper(3113) && var(12) = 31
trigger8 = IsHelper(3112) && (var(12) = 3 || var(12) = 33)
trigger9 = IsHelper(3116) && var(12) = 5
trigger10 = IsHelper(3115) && var(12) = 11
trigger11 = IsHelper(3114) && var(12) = 21
trigger12 = IsHelper(3119) && var(12) = 19
trigger13 = IsHelper(3117) && var(12) = 21
trigger14 = IsHelper(3118) && var(12) = 27
trigger15 = IsHelper(3120) && var(12) = 29
y = -5.82421875

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && var(12) = 8
trigger2 = IsHelper(3107) && var(12) = 8
trigger3 = IsHelper(3108) && var(12) = 16
trigger4 = IsHelper(3109) && var(12) = 16
trigger5 = IsHelper(3110) && var(12) = 24
trigger6 = IsHelper(3113) && var(12) = 24
trigger7 = IsHelper(3113) && var(12) = 32
trigger8 = IsHelper(3112) && (var(12) = 4 || var(12) = 32)
trigger9 = IsHelper(3116) && var(12) = 4
trigger10 = IsHelper(3115) && var(12) = 12
trigger11 = IsHelper(3114) && var(12) = 20
trigger12 = IsHelper(3119) && var(12) = 20
trigger13 = IsHelper(3117) && var(12) = 20
trigger14 = IsHelper(3118) && var(12) = 28
trigger15 = IsHelper(3120) && var(12) = 28
y = -5.99609375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && var(12) = 9
trigger2 = IsHelper(3107) && var(12) = 7
trigger3 = IsHelper(3108) && var(12) = 17
trigger4 = IsHelper(3109) && var(12) = 15
trigger5 = IsHelper(3110) && var(12) = 25
trigger6 = IsHelper(3113) && var(12) = 23
trigger7 = IsHelper(3113) && var(12) = 33
trigger8 = IsHelper(3112) && (var(12) = 5 || var(12) = 31)
trigger9 = IsHelper(3116) && var(12) = 3
trigger10 = IsHelper(3115) && var(12) = 13
trigger11 = IsHelper(3114) && var(12) = 19
trigger12 = IsHelper(3119) && var(12) = 21
trigger13 = IsHelper(3117) && var(12) = 19
trigger14 = IsHelper(3118) && var(12) = 29
trigger15 = IsHelper(3120) && var(12) = 27
y = -3.5625

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && var(12) = 10
trigger2 = IsHelper(3107) && var(12) = 6
trigger3 = IsHelper(3108) && var(12) = 18
trigger4 = IsHelper(3109) && var(12) = 14
trigger5 = IsHelper(3110) && var(12) = 26
trigger6 = IsHelper(3113) && var(12) = 22
trigger7 = IsHelper(3112) && (var(12) = 6 || var(12) = 30)
trigger8 = IsHelper(3116) && var(12) = 2
trigger9 = IsHelper(3115) && var(12) = 14
trigger10 = IsHelper(3114) && var(12) = 18
trigger11 = IsHelper(3119) && var(12) = 22
trigger12 = IsHelper(3117) && var(12) = 18
trigger13 = IsHelper(3118) && var(12) = 30
trigger14 = IsHelper(3120) && (var(12) = 2 || var(12) = 26)
y = 2.34765625

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 11 || var(12) = 33)
trigger2 = IsHelper(3107) && var(12) = 5
trigger3 = IsHelper(3108) && var(12) = 19
trigger4 = IsHelper(3109) && var(12) = 13
trigger5 = IsHelper(3110) && var(12) = 27
trigger6 = IsHelper(3113) && var(12) = 21
trigger7 = IsHelper(3112) && (var(12) = 7 || var(12) = 29)
trigger8 = IsHelper(3115) && var(12) = 15
trigger9 = IsHelper(3114) && var(12) = 17
trigger10 = IsHelper(3119) && var(12) = 23
trigger11 = IsHelper(3117) && var(12) = 17
trigger12 = IsHelper(3118) && var(12) = 31
trigger13 = IsHelper(3120) && (var(12) = 3 || var(12) = 25)
y = 7.2109375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 12 || var(12) = 32)
trigger2 = IsHelper(3107) && var(12) = 4
trigger3 = IsHelper(3108) && var(12) = 20
trigger4 = IsHelper(3109) && var(12) = 12
trigger5 = IsHelper(3110) && var(12) = 28
trigger6 = IsHelper(3113) && var(12) = 20
trigger7 = IsHelper(3112) && (var(12) = 8 || var(12) = 28)
trigger8 = IsHelper(3115) && var(12) = 16
trigger9 = IsHelper(3114) && var(12) = 16
trigger10 = IsHelper(3119) && var(12) = 24
trigger11 = IsHelper(3117) && var(12) = 16
trigger12 = IsHelper(3118) && var(12) = 32
trigger13 = IsHelper(3120) && (var(12) = 4 || var(12) = 24)
y = 5.0859375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 13 || var(12) = 31)
trigger2 = IsHelper(3107) && var(12) = 3
trigger3 = IsHelper(3108) && var(12) = 21
trigger4 = IsHelper(3109) && var(12) = 11
trigger5 = IsHelper(3110) && var(12) = 29
trigger6 = IsHelper(3113) && var(12) = 19
trigger7 = IsHelper(3112) && (var(12) = 9 || var(12) = 27)
trigger8 = IsHelper(3115) && var(12) = 17
trigger9 = IsHelper(3114) && var(12) = 15
trigger10 = IsHelper(3119) && var(12) = 25
trigger11 = IsHelper(3117) && var(12) = 15
trigger12 = IsHelper(3118) && var(12) = 33
trigger13 = IsHelper(3120) && (var(12) = 5 || var(12) = 23)
y = 0.73828125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 14 || var(12) = 30)
trigger2 = IsHelper(3107) && var(12) = 2
trigger3 = IsHelper(3108) && var(12) = 22
trigger4 = IsHelper(3109) && var(12) = 10
trigger5 = IsHelper(3110) && var(12) = 30
trigger6 = IsHelper(3113) && (var(12) = 2 || var(12) = 18)
trigger7 = IsHelper(3112) && (var(12) = 10 || var(12) = 26)
trigger8 = IsHelper(3115) && var(12) = 18
trigger9 = IsHelper(3114) && var(12) = 14
trigger10 = IsHelper(3119) && var(12) = 26
trigger11 = IsHelper(3117) && var(12) = 14
trigger12 = IsHelper(3120) && (var(12) = 6 || var(12) = 22)
y = -4.328125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 15 || var(12) = 29)
trigger2 = IsHelper(3108) && var(12) = 23
trigger3 = IsHelper(3109) && var(12) = 9
trigger4 = IsHelper(3110) && var(12) = 31
trigger5 = IsHelper(3113) && (var(12) = 3 || var(12) = 17)
trigger6 = IsHelper(3112) && (var(12) = 11 || var(12) = 25)
trigger7 = IsHelper(3115) && (var(12) = 19 || var(12) = 33)
trigger8 = IsHelper(3114) && var(12) = 13
trigger9 = IsHelper(3119) && var(12) = 27
trigger10 = IsHelper(3117) && var(12) = 13
trigger11 = IsHelper(3120) && (var(12) = 7 || var(12) = 21)
y = -7.4921875

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 16 || var(12) = 28)
trigger2 = IsHelper(3108) && var(12) = 24
trigger3 = IsHelper(3109) && var(12) = 8
trigger4 = IsHelper(3110) && var(12) = 32
trigger5 = IsHelper(3113) && (var(12) = 4 || var(12) = 16)
trigger6 = IsHelper(3112) && (var(12) = 12 || var(12) = 24)
trigger7 = IsHelper(3115) && (var(12) = 20 || var(12) = 32)
trigger8 = IsHelper(3114) && var(12) = 12
trigger9 = IsHelper(3119) && var(12) = 28
trigger10 = IsHelper(3117) && var(12) = 12
trigger11 = IsHelper(3120) && (var(12) = 8 || var(12) = 20)
y = -3.40234375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 17 || var(12) = 27)
trigger2 = IsHelper(3108) && var(12) = 25
trigger3 = IsHelper(3109) && var(12) = 7
trigger4 = IsHelper(3110) && var(12) = 33
trigger5 = IsHelper(3113) && (var(12) = 5 || var(12) = 15)
trigger6 = IsHelper(3112) && (var(12) = 13 || var(12) = 23)
trigger7 = IsHelper(3115) && (var(12) = 21 || var(12) = 31)
trigger8 = IsHelper(3114) && var(12) = 11
trigger9 = IsHelper(3119) && var(12) = 29
trigger10 = IsHelper(3117) && var(12) = 11
trigger11 = IsHelper(3120) && (var(12) = 9 || var(12) = 19)
y = 2.1875

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 18 || var(12) = 26)
trigger2 = IsHelper(3108) && var(12) = 26
trigger3 = IsHelper(3109) && var(12) = 6
trigger4 = IsHelper(3110) && var(12) = 1
trigger5 = IsHelper(3113) && (var(12) = 6 || var(12) = 14)
trigger6 = IsHelper(3112) && (var(12) = 14 || var(12) = 22)
trigger7 = IsHelper(3116) && var(12) = 1
trigger8 = IsHelper(3115) && (var(12) = 22 || var(12) = 30)
trigger9 = IsHelper(3114) && (var(12) = 2 || var(12) = 10)
trigger10 = IsHelper(3119) && var(12) = 30
trigger11 = IsHelper(3117) && (var(12) = 2 || var(12) = 10)
trigger12 = IsHelper(3120) && (var(12) = 10 || var(12) = 18)
y = 5.65234375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 19 || var(12) = 25)
trigger2 = IsHelper(3108) && (var(12) = 27 || var(12) = 33)
trigger3 = IsHelper(3109) && var(12) = 5
trigger4 = IsHelper(3113) && (var(12) = 7 || var(12) = 13)
trigger5 = IsHelper(3112) && (var(12) = 15 || var(12) = 21)
trigger6 = IsHelper(3115) && (var(12) = 23 || var(12) = 29)
trigger7 = IsHelper(3114) && (var(12) = 3 || var(12) = 9)
trigger8 = IsHelper(3119) && var(12) = 31
trigger9 = IsHelper(3117) && (var(12) = 3 || var(12) = 9)
trigger10 = IsHelper(3120) && (var(12) = 11 || var(12) = 17)
y = 6.64453125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 20 || var(12) = 24)
trigger2 = IsHelper(3108) && (var(12) = 28 || var(12) = 32)
trigger3 = IsHelper(3109) && var(12) = 4
trigger4 = IsHelper(3113) && (var(12) = 8 || var(12) = 12)
trigger5 = IsHelper(3112) && (var(12) = 16 || var(12) = 20)
trigger6 = IsHelper(3115) && (var(12) = 24 || var(12) = 28)
trigger7 = IsHelper(3114) && (var(12) = 4 || var(12) = 8)
trigger8 = IsHelper(3119) && var(12) = 32
trigger9 = IsHelper(3117) && (var(12) = 4 || var(12) = 8)
trigger10 = IsHelper(3120) && (var(12) = 12 || var(12) = 16)
y = 1.1953125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && (var(12) = 21 || var(12) = 23)
trigger2 = IsHelper(3108) && (var(12) = 29 || var(12) = 31)
trigger3 = IsHelper(3109) && var(12) = 3
trigger4 = IsHelper(3113) && (var(12) = 9 || var(12) = 11)
trigger5 = IsHelper(3112) && (var(12) = 17 || var(12) = 19)
trigger6 = IsHelper(3115) && (var(12) = 25 || var(12) = 27)
trigger7 = IsHelper(3114) && (var(12) = 5 || var(12) = 7)
trigger8 = IsHelper(3119) && var(12) = 33
trigger9 = IsHelper(3117) && (var(12) = 5 || var(12) = 7)
trigger10 = IsHelper(3120) && (var(12) = 13 || var(12) = 15)
y = -4.78515625

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3106) && var(12) = 22
trigger2 = IsHelper(3108) && var(12) = 30
trigger3 = IsHelper(3109) && var(12) = 2
trigger4 = IsHelper(3113) && var(12) = 10
trigger5 = IsHelper(3112) && var(12) = 18
trigger6 = IsHelper(3115) && var(12) = 26
trigger7 = IsHelper(3116) && var(12) = 6
trigger8 = IsHelper(3117) && var(12) = 6
trigger9 = IsHelper(3120) && var(12) = 14
y = -6.109375

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3107) && var(12) = 1
trigger2 = IsHelper(3109) && var(12) = 1
trigger3 = IsHelper(3119) && var(12) = 1
y = -3.0546875

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3113) && var(12) = 1
trigger2 = IsHelper(3112) && var(12) = 1
y = 7.3828125

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3111) && var(12) = 1
y = 8

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3115) && var(12) = 1
y = 3.0546875

[State 3105, PosAdd]
type = PosAdd
triggerAll = Root, var(10)
trigger1 = IsHelper(3120) && var(12) = 1
y = -8

[State 3105, Projectile Health]
type = VarSet
trigger1 = AnimElemTime(2) = 0
var(0) = 1

[State 3105, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 3105, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 3105

[State 3105, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 3105
ignoreHitPause = 1

[State 3105, HitBy]
type = HitBy
trigger1 = 1
value =
time = -1
ignoreHitPause = 1

[State 3105, VelSet]
type = VelSet
trigger1 = Root, var(10)
x = 6.25

[State 3105, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
trigger1 = var(0) > 0
var(9) = (EnemyNear, MoveType = A)

[State 3105, Dampener]
type = VarSet
trigger1 = var(0) > 0
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3105, Miss]
type = HitDef
trigger1 = var(0) > 0
attr = S,HA
hitFlag =
sparkXY = -10,0

[State 3105, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && Root, var(15) < (1 + Root, var(41))
trigger1 = var(0) > 0
attr = S,HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,4
guard.pauseTime = 0,4
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
airGuard.ctrlTime = 18
ground.velocity = -5, -6.5625
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 3105, Demon Billion HitCount]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(41) = 1
ignoreHitPause = 1

[State 3105, Projectile Health Decrement]
type = VarAdd
trigger1 = MoveContact && !NumTarget
var(0) = -1
ignoreHitPause = 1

[State 3105, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3106
ignoreHitPause = 1

[State 3105, ChangeState]
type = ChangeState
trigger1 = MoveReversed
trigger1 = var(0) := 0
value = 3105
ignoreHitPause = 1

[State 3105, End]
type = ChangeState
trigger1 = Root, AnimElemTime(14) = -5
value = 3107

[State 3105, End]
type = DestroySelf
trigger1 = var(0) > 0
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100
trigger2 = Parent, StateNo != 3100

;Hit Pause
[StateDef 3106]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 3106, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 3106, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 8)
channel = 2
ignorehitPause = 1

[State 3106, HitSpark (Low)]
type = Explod
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
trigger1 = IsHelper(3105) || IsHelper(3106) || IsHelper(3107) || IsHelper(3108) || IsHelper(3109) || IsHelper(3110) || IsHelper(3111) || IsHelper(3112) || IsHelper(3113) || IsHelper(3114)
anim = 3115 + Random % 4
ID = 3115
sprPriority = 5
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
ownPal = 1
ignoreHitPause = 1

[State 3106, HitSpark (High)]
type = Explod
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
trigger1 = IsHelper(3115) || IsHelper(3116) || IsHelper(3117) || IsHelper(3118) || IsHelper(3119) || IsHelper(3120)
anim = 3119 + Random % 2
ID = 3115
sprPriority = 5
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
ownPal = 1
ignoreHitPause = 1

[State 3106, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8017)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = ifElse(PrevStateNo = 3205 || PrevStateNo = 3215, 1, -1)
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3106, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3106, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 3106, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 3106, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 3106, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = 3100
var(18) = 1

[State 3106, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(0) = -1
ignoreHitPause = 1

[State 3106, End]
type = ChangeState
trigger1 = Time >= 0
value = 3105

;Disappear
[StateDef 3107]
type = A
physics = N
moveType = A
anim = 3105
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 3107, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 3107, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 3105
elem = 1

[State 3107, Dissipate 1 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3105)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 3

[State 3107, Dissipate 1 (Top)]
type = Explod
trigger1 = Time = 3 && IsHelper(3105)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 1 (Bottom)]
type = Explod
trigger1 = Time = 3 && IsHelper(3105)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 1]
type = ChangeState
trigger1 = Time = 7 && IsHelper(3105)
value = 3108

[State 3107, Dissipate 2 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3106)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 2

[State 3107, Dissipate 2 (Top)]
type = Explod
trigger1 = Time = 2 && IsHelper(3106)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 2 (Bottom)]
type = Explod
trigger1 = Time = 2 && IsHelper(3106)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 2]
type = ChangeState
trigger1 = Time = 6 && IsHelper(3106)
value = 3108

[State 3107, Dissipate 3 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3107)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3107, Dissipate 3 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3107)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 3 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3107)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 3]
type = ChangeState
trigger1 = Time = 5 && IsHelper(3107)
value = 3108

[State 3107, Dissipate 4 (Top)]
type = Explod
trigger1 = !Time && IsHelper(3108)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 4 (Bottom)]
type = Explod
trigger1 = !Time && IsHelper(3108)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 4]
type = ChangeState
trigger1 = Time = 4 && IsHelper(3108)
value = 3108

[State 3107, Dissipate 5 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3109)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 3

[State 3107, Dissipate 5 (Top)]
type = Explod
trigger1 = Time = 3 && IsHelper(3109)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 5 (Bottom)]
type = Explod
trigger1 = Time = 3 && IsHelper(3109)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 5]
type = ChangeState
trigger1 = Time = 7 && IsHelper(3109)
value = 3108

[State 3107, Dissipate 6 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3110)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 2

[State 3107, Dissipate 6 (Top)]
type = Explod
trigger1 = Time = 2 && IsHelper(3110)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 6 (Bottom)]
type = Explod
trigger1 = Time = 2 && IsHelper(3110)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 6]
type = ChangeState
trigger1 = Time = 5 && IsHelper(3110)
value = 3108

[State 3107, Dissipate 7 (Top)]
type = Explod
trigger1 = !Time && IsHelper(3111)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 7 (Bottom)]
type = Explod
trigger1 = !Time && IsHelper(3111)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 7]
type = ChangeState
trigger1 = Time = 4 && IsHelper(3111)
value = 3108

[State 3107, Dissipate 8 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3112)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 3

[State 3107, Dissipate 8 (Top)]
type = Explod
trigger1 = Time = 3 && IsHelper(3112)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 8 (Bottom)]
type = Explod
trigger1 = Time = 3 && IsHelper(3112)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 8]
type = ChangeState
trigger1 = Time = 7 && IsHelper(3112)
value = 3108

[State 3107, Dissipate 9 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3113)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3107, Dissipate 9 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3113)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 9 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3113)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 9]
type = ChangeState
trigger1 = Time = 5 && IsHelper(3113)
value = 3108

[State 3107, Dissipate 10 (Top)]
type = Explod
trigger1 = !Time && IsHelper(3114)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 10 (Bottom)]
type = Explod
trigger1 = !Time && IsHelper(3114)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 10]
type = ChangeState
trigger1 = Time = 4 && IsHelper(3114)
value = 3108

[State 3107, Dissipate 11 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3115)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3107, Dissipate 11 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3115)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 11 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3115)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 11]
type = ChangeState
trigger1 = Time = 5 && IsHelper(3115)
value = 3108

[State 3107, Dissipate 12 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3116)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 2

[State 3107, Dissipate 12 (Top)]
type = Explod
trigger1 = Time = 2 && IsHelper(3116)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 12 (Bottom)]
type = Explod
trigger1 = Time = 2 && IsHelper(3116)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 12]
type = ChangeState
trigger1 = Time = 6 && IsHelper(3116)
value = 3108

[State 3107, Dissipate 13 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3117)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 2

[State 3107, Dissipate 13 (Top)]
type = Explod
trigger1 = Time = 2 && IsHelper(3117)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 13 (Bottom)]
type = Explod
trigger1 = Time = 2 && IsHelper(3117)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 13]
type = ChangeState
trigger1 = Time = 6 && IsHelper(3117)
value = 3108

[State 3107, Dissipate 14 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3118)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3107, Dissipate 14 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3118)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 14 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3118)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 14]
type = ChangeState
trigger1 = Time = 5 && IsHelper(3118)
value = 3108

[State 3107, Dissipate 15 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3119)
anim = 13107
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 3

[State 3107, Dissipate 15 (Top)]
type = Explod
trigger1 = Time = 3 && IsHelper(3119)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 15 (Bottom)]
type = Explod
trigger1 = Time = 3 && IsHelper(3119)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 15]
type = ChangeState
trigger1 = Time = 7 && IsHelper(3119)
value = 3108

[State 3107, Dissipate 16 (Top)]
type = Explod
trigger1 = !Time && IsHelper(3120)
anim = 13108
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, Dissipate 16 (Bottom)]
type = Explod
trigger1 = !Time && IsHelper(3120)
anim = 13109
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3107, End 16]
type = ChangeState
trigger1 = Time = 4 && IsHelper(3120)
value = 3108

;Wait
[StateDef 3108]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 3108, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target, HitShakeOver)

;====<MAX DEMON BLAST PROJECTILE>=
[StateDef 3155]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = ifElse(PrevStateno, 3, -1)
hitCountPersist = 1

[State 3155, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 3155, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !PrevStateNo
value = 1

[State 3155, Timer Set]
type = VarSet
trigger1 = !Time
var(12) = -1

[State 3155, Timer Increment]
type = VarAdd
trigger1 = var(12) > 0
var(12) = 1

[State 3155, Startup 1 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3155) && Anim != 3155
anim = 13104
sprPriority = 0
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 11

[State 3155, Startup 1 (Top)]
type = Explod
trigger1 = Time = 11 && IsHelper(3155) && Anim != 3155
anim = 13155
sprPriority = 0
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Startup 1 (Bottom)]
type = Explod
trigger1 = Time = 11 && IsHelper(3155) && Anim != 3155
anim = 13156
sprPriority = -2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Turn Visible 1]
type = ChangeAnim
trigger1 = Time = 20 && IsHelper(3155) && Anim != 3155
value = 3155

[State 3155, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) = 0 && IsHelper(3155) && Anim = 3155
value = 3

[State 3155, Timer 1]
type = VarAdd
trigger1 = AnimElemTime(2) = 1 && IsHelper(3155) && var(12) = -1
trigger2 = AnimElemTime(2) = 2 && IsHelper(3155) && !var(12)
var(12) = 1

[State 3155, VelSet 1]
type = VelSet
trigger1 = !var(12) && IsHelper(3155)
x = 1.25
y = 1.875

[State 3155, SprPriority 2]
type = SprPriority
trigger1 = !Time && IsHelper(3156) && Anim != 3155
value = -1

[State 3155, Startup 2 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3156) && Anim != 3155
anim = 13104
sprPriority = 0
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 8

[State 3155, Startup 2 (Top)]
type = Explod
trigger1 = Time = 8 && IsHelper(3156) && Anim != 3155
ID = 13156
anim = 13155
sprPriority = 0
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, ModifyExplod 2 (Top)]
type = ModifyExplod
trigger1 = Time = 14 && IsHelper(3156) && Anim != 3155
ID = 13156
sprPriority = 4

[State 3155, Startup 2 (Bottom)]
type = Explod
trigger1 = Time = 8 && IsHelper(3156) && Anim != 3155
ID = 23156
anim = 13156
sprPriority = -2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, ModifyExplod 2 (Bottom)]
type = ModifyExplod
trigger1 = Time = 14 && IsHelper(3156) && Anim != 3155
ID = 23156
sprPriority = 2

[State 3155, SprPriority 2]
type = SprPriority
trigger1 = Time = 17 && IsHelper(3156) && Anim != 3155
value = 3

[State 3155, Turn Visible 2]
type = ChangeAnim
trigger1 = Time = 17 && IsHelper(3156) && Anim != 3155
value = 3155

[State 3155, Timer 2]
type = VarAdd
trigger1 = Time = 14 && IsHelper(3156) && Anim != 3155 && var(12) = -1
trigger2 = Time = 15 && IsHelper(3156) && Anim != 3155 && !var(12)
var(12) = 1

[State 3155, VelSet 2]
type = VelSet
trigger1 = !var(12) && IsHelper(3156)
x = 1.25
y = 1.25

[State 3155, SprPriority 3]
type = SprPriority
trigger1 = !Time && IsHelper(3157) && Anim != 3155
value = -1

[State 3155, Startup 3 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3157) && Anim != 3155
anim = 13104
sprPriority = 0
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 11

[State 3155, Startup 3 (Top)]
type = Explod
trigger1 = Time = 4 && IsHelper(3157) && Anim != 3155
anim = 13155
sprPriority = 0
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Startup 3 (Bottom)]
type = Explod
trigger1 = Time = 4 && IsHelper(3157) && Anim != 3155
anim = 13156
sprPriority = -2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Turn Visible 3]
type = ChangeAnim
trigger1 = Time = 13 && IsHelper(3157) && Anim != 3155
value = 3155

[State 3155, SprPriority 3]
type = SprPriority
trigger1 = Time = 24 && IsHelper(3157) && !PrevStateNo
value = 3

[State 3155, Timer 3]
type = VarAdd
trigger1 = Time = 24 && IsHelper(3157) && !PrevStateNo && var(12) = -1
trigger2 = Time = 25 && IsHelper(3157) && !PrevStateNo && !var(12)
var(12) = 1

[State 3155, VelSet 3]
type = VelSet
trigger1 = !var(12) && IsHelper(3157)
x = 1.25
y = 0.625

[State 3155, Startup 4 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3158) && Anim != 3155
anim = 13104
sprPriority = 0
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3155, Startup 4 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3158) && Anim != 3155
anim = 13155
sprPriority = 0
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Startup 4 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3158) && Anim != 3155
anim = 13156
sprPriority = -2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Turn Visible 4]
type = ChangeAnim
trigger1 = Time = 10 && IsHelper(3158) && Anim != 3155
value = 3155

[State 3155, SprPriority 4]
type = SprPriority
trigger1 = AnimElemTime(2) = 0 && IsHelper(3158) && Anim = 3155
value = 3

[State 3155, Timer 4]
type = VarAdd
trigger1 = AnimElemTime(2) = 1 && IsHelper(3158) && var(12) = -1
trigger2 = AnimElemTime(2) = 2 && IsHelper(3158) && !var(12)
var(12) = 1

[State 3155, VelSet 4]
type = VelSet
trigger1 = !var(12) && IsHelper(3158)
x = 1.25

[State 3155, Startup 5 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3159) && Anim != 3155
anim = 13104
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 11

[State 3155, Startup 5 (Top)]
type = Explod
trigger1 = Time = 11 && IsHelper(3159) && Anim != 3155
anim = 13155
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Startup 5 (Bottom)]
type = Explod
trigger1 = Time = 11 && IsHelper(3159) && Anim != 3155
anim = 13156
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Turn Visible 5]
type = ChangeAnim
trigger1 = Time = 20 && IsHelper(3159) && Anim != 3155
value = 3155

[State 3155, SprPriority 5]
type = SprPriority
trigger1 = AnimElemTime(1) = 0 && IsHelper(3159) && Anim = 3155
value = 3

[State 3155, Timer 5]
type = VarAdd
trigger1 = Time = 17 && IsHelper(3159) && var(12) = -1
trigger2 = Time = 18 && IsHelper(3159) && !var(12)
var(12) = 1

[State 3155, VelSet 5]
type = VelSet
trigger1 = !var(12) && IsHelper(3159)
x = 1.25
y = 1.875

[State 3155, Startup 6 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3160) && Anim != 3155
anim = 13104
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 8

[State 3155, Startup 6 (Top)]
type = Explod
trigger1 = Time = 8 && IsHelper(3160) && Anim != 3155
anim = 13155
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Startup 6 (Bottom)]
type = Explod
trigger1 = Time = 8 && IsHelper(3160) && Anim != 3155
anim = 13156
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Turn Visible 6]
type = ChangeAnim
trigger1 = Time = 17 && IsHelper(3160) && Anim != 3155
value = 3155

[State 3155, SprPriority 6]
type = SprPriority
trigger1 = AnimElemTime(1) = 0 && IsHelper(3160) && Anim = 3155
value = 3

[State 3155, Timer 6]
type = VarAdd
trigger1 = Time = 21 && IsHelper(3160) && var(12) = -1
trigger2 = Time = 22 && IsHelper(3160) && !var(12)
var(12) = 1

[State 3155, VelSet 6]
type = VelSet
trigger1 = !var(12) && IsHelper(3160)
x = 1.25
y = 1.25

[State 3155, Startup 7 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3161) && Anim != 3155
anim = 13104
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 11

[State 3155, Startup 7 (Top)]
type = Explod
trigger1 = Time = 4 && IsHelper(3161) && Anim != 3155
anim = 13155
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Startup 7 (Bottom)]
type = Explod
trigger1 = Time = 4 && IsHelper(3161) && Anim != 3155
anim = 13156
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Turn Visible 7]
type = ChangeAnim
trigger1 = Time = 13 && IsHelper(3161) && Anim != 3155
value = 3155

[State 3155, SprPriority 7]
type = SprPriority
trigger1 = !Time && IsHelper(3161) && !PrevStateNo
value = 3

[State 3155, Timer 7]
type = VarAdd
trigger1 = Time = 24 && IsHelper(3161) && !PrevStateNo && var(12) = -1
trigger2 = Time = 25 && IsHelper(3161) && !PrevStateNo && !var(12)
var(12) = 1

[State 3155, VelSet 7]
type = VelSet
trigger1 = !var(12) && IsHelper(3161)
x = 1.25
y = 0.625

[State 3155, Startup 8 (Hold Frame)]
type = Explod
trigger1 = !Time && IsHelper(3162) && Anim != 3155
anim = 13104
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1
removeTime = 1

[State 3155, Startup 8 (Top)]
type = Explod
trigger1 = Time = 1 && IsHelper(3162) && Anim != 3155
anim = 13155
sprPriority = 4
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Startup 8 (Bottom)]
type = Explod
trigger1 = Time = 1 && IsHelper(3162) && Anim != 3155
anim = 13156
sprPriority = 2
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
bindTime = -1

[State 3155, Turn Visible 8]
type = ChangeAnim
trigger1 = Time = 10 && IsHelper(3162) && Anim != 3155
value = 3155

[State 3155, SprPriority 8]
type = SprPriority
trigger1 = !Time && IsHelper(3162) && !PrevStateNo
value = 3

[State 3155, Timer 8]
type = VarAdd
trigger1 = AnimElemTime(2) = 1 && IsHelper(3162) && var(12) = -1
trigger2 = AnimElemTime(2) = 2 && IsHelper(3162) && !var(12)
var(12) = 1

[State 3155, VelSet 8]
type = VelSet
trigger1 = !var(12) && IsHelper(3162)
x = 1.25

[State 3155, VelAdd]
type = VelAdd
trigger1 = var(12) > 0
x = 0.5859375
y = -0.09765625

[State 3155, Projectile Health]
type = VarSet
trigger1 = AnimElemTime(2) = 0
var(0) = 3

[State 3155, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 3155, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 3155

[State 3155, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateNo = 3155
ignoreHitPause = 1

[State 3155, HitBy]
type = HitBy
trigger1 = 1
value =
time = -1
ignoreHitPause = 1

[State 3155, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
trigger1 = var(0) > 0
var(9) = (EnemyNear, MoveType = A)

[State 3155, Dampener]
type = VarSet
trigger1 = var(0) > 0
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3155, Miss]
type = HitDef
trigger1 = var(0) > 0
attr = S,HA
hitFlag =
sparkXY = -10,0

[State 3155, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && Root, var(15) < (1 + Root, var(41) + HitCount)
trigger1 = var(0) > 0
attr = S,HA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,8
guard.pauseTime = 0,8
animType = Hard
air.animType = Hard
fall.animType = Hard
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
airGuard.ctrlTime = 18
ground.velocity = -5, -6.5625
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5, -6.5625
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 3155, Demon Blast HitCount]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(41) = 1
ignoreHitPause = 1

[State 3155, Projectile Health Decrement]
type = VarAdd
trigger1 = MoveContact && !NumTarget
var(0) = -1
ignoreHitPause = 1

[State 3155, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 3156
ignoreHitPause = 1

[State 3155, ChangeState]
type = ChangeState
trigger1 = MoveReversed
trigger1 = var(0) := var(0) - 1
value = 3155
ignoreHitPause = 1

[State 3155, End]
type = DestroySelf
trigger1 = var(0) > 0
trigger1 = FrontEdgeDist < -100 || BackEdgeDist < -100
trigger2 = var(0) <= 0

;Hit Pause
[StateDef 3156]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1
hitCountPersist = 1

[State 3156, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 3156, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 3156, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 8)
channel = 2
ignorehitPause = 1

[State 3156, HitSpark]
type = Helper
trigger1 = !var(10)
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8017)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3156, Bat HitSpark (Low)]
type = Explod
trigger1 = !var(10)
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
trigger1 = pos y > -70
anim = 3115 + Random % 4
ID = 3115
sprPriority = 5
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
ownPal = 1
ignoreHitPause = 1

[State 3156, Bat HitSpark (High)]
type = Explod
trigger1 = !var(10)
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = !MoveGuarded
trigger1 = pos y <= -70
anim = 3119 + Random % 2
ID = 3115
sprPriority = 5
posType = P1
scale = Root, const(size.xScale) * 0.5, 0.5
ownPal = 1
ignoreHitPause = 1

[State 3156, HitSpark flag]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
var(10) = 1
ignoreHitPause = 1

[State 3156, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3156, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 3156, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 3156, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 3156, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = 3150
var(18) = 1

[State 3156, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(0) = -1
ignoreHitPause = 1

[State 3156, End]
type = ChangeState
trigger1 = Time >= 2
value = ifElse(var(0) <= 0, 3108, 3155)

;====<SPARKS>=
;Guard Spark (Normal)
[StateDef 8000]
type = A
physics = N
moveType = I
anim = 8000
velset = 0,0
sprPriority = 5

[State 8000, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8000, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.125 + (0.046875 * Time), 0.125 + (0.046875 * Time)
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8000, End]
type = DestroySelf
trigger1 = Time >= 8


;Guard Spark (Special)
[StateDef 8001]
type = A
physics = N
moveType = I
anim = 8001
velSet = 0,0
sprPriority = 5

[State 8001, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8001, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8001, End]
type = DestroySelf
trigger1 = Time >= 8

;Weak Hit Spark
[StateDef 8010]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8010, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8010, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8010, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8010, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.3 - (Time * 0.03), 0.3 - (Time * 0.03)
ignoreHitPause = 1

[State 8010, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8010, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time),256

[State 8010, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8010, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.3 - (0.0375 * Time), 0.3 - (0.0375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8010, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8010, End]
type = DestroySelf
trigger1 = Time >= 16

;Medium Hit Spark
[StateDef 8011]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8011, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8011, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8011, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8011, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.35 - (Time * 0.035), 0.35 - (Time * 0.035)
ignoreHitPause = 1

[State 8011, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8011, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8011, Center]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removetime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.35 - (0.04375 * Time), 0.35 - (0.04375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8011, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8011, End]
type = DestroySelf
trigger1 = Time >= 16

;Strong Hit Spark
[StateDef 8012]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8012, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8012, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8012, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8012, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.4 - (Time * 0.04), 0.4 - (Time * 0.04)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8012, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8012, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.4 - (0.05 * Time), 0.4 - (0.05 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8012, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8012, End]
type = DestroySelf
trigger1 = Time >= 16

;Special Move Hit Spark
[StateDef 8013]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8013, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8013, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8013, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8013, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.45 - (Time * 0.045), 0.45 - (Time * 0.045)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8013, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8013, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = -1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale P2 Back Explod]
type = ModifyExplod
trigger1= NumExplod(3)
ID = 3
scale = 0.4, 0.4
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(random < 500, -1, 1)
vFacing = ifElse(random < 500, -1, 1)
sprPriority=3
removeTime=8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.45 - (0.05625 * Time), 0.45 - (0.05625 * Time)
trans = AddAlpha
alpha = 192 - (24 * Time), 256

[State 8013, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8013, End]
type = DestroySelf
trigger1 = Time >= 16

;Super Hit Spark
[StateDef 8014]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8014, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8014, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = ifElse((Parent, StateNo = [3000,3999]), -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16

;Normal Slash Spark
[StateDef 8015]
type = A
physics = N
moveType = I
anim = 8015
velSet = 0,0
sprPriority = 5

[State 8015, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8015, AngleSet]
type = AngleSet
trigger1 = !Time
value = 15 * (Random % 24)

[State 8015, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.5 + (Time * 0.15)) / 2, (1 - (Time * 0.1)) / 2
ignoreHitPause = 1

[State 8015, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8015, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8015, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8015, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8015, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8015, End]
type = DestroySelf
trigger1 = Time >= 16

;Special Move Slash Spark
[StateDef 8016]
type = A
physics = N
moveType = I
anim = 8015
velSet = 0,0
sprPriority = 5

[State 8016, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8016, AngleSet]
type = AngleSet
trigger1 = !Time
value = 15 * (Random % 24)

[State 8016, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.5 + (Time * 0.15)) / 2, (1 - (Time * 0.1)) / 2
ignoreHitPause = 1

[State 8016, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8016, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8016, Circle]
type = Explod
trigger1 = !Time
anim = 8016
ID = 8016
posType = p1
removeTime = 10
sprPriority = 5
pauseMoveTime = -1
superMoveTime = -1

[State 8016, Circle Scale]
type = ModifyExplod
trigger1 = NumExplod(8016)
ID = 8016
scale = 0.25 + (0.025 * Time), 0.25 + (0.025 * Time)
trans = AddAlpha
alpha = ceil(256 - 25.6 * Time), 256

[State 8016, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8016, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8016, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8016, End]
type = DestroySelf
trigger1 = Time >= 16

;Super Move Slash Spark
[StateDef 8017]
type = A
physics = N
moveType = I
anim = 8015
velSet = 0,0
sprPriority = 5

[State 8017, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8017, AngleSet]
type = AngleSet
trigger1 = !Time
value = 15 * (Random % 24)

[State 8017, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = (0.5 + (Time * 0.15)) / 2, (1 - (Time * 0.1)) / 2
ignoreHitPause = 1

[State 8017, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8017, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8017, Circle]
type = Explod
trigger1 = !Time
anim = 8016
ID = 8016
posType = p1
removeTime = 10
sprPriority = 5
pauseMoveTime = -1
superMoveTime = -1

[State 8017, Circle Scale]
type = ModifyExplod
trigger1 = NumExplod(8016)
ID = 8016
scale = 0.3 + (0.03 * Time), 0.3 + (0.03 * Time)
trans = AddAlpha
alpha = ceil(256 - 25.6 * Time), 256

[State 8017, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8017, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8017, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8017, End]
type = DestroySelf
trigger1 = Time >= 16

;Reversal Spark
[StateDef 8020]
type = A
physics = N
moveType = I
anim = 8020
velSet = 0,0
sprPriority = 5

[State 8020, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8020, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.09375 * Time), 0.25 + (0.09375 * Time)
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8020, End]
type = DestroySelf
trigger1 = Time >= 8

;==<JUMP DUST>===
[StateDef 8100]
type = S
anim = 1
velSet = 0,0

[State 8100, Bind]
type = BindToRoot
trigger1 = Time

[State 8100, Floor Dust]
type = Explod
trigger1 = !Time
anim = 8100
sprPriority = 3
posType = P1
pos = 0, ceil(pos y)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8100, Player Dust]
type = Explod
trigger1 = !Time || Time = 2 || Time = 6
anim = 8101
sprPriority = 3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8100, End]
type = DestroySelf
trigger1 = Time >= 7



;==<DASH DUST>===
[StateDef 8103]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8103, posSet]
type = PosSet
trigger1 = !Time = 0
y = 0

[State 8103, Dash Dust]
type = Explod
trigger1 = Time = 0 || Time = 3 || Time = 6
anim = 8103
ID = ifElse((Time = 6), 3, ifElse((Time = 3), 2, 1))
posType = P1
pos = 0,-4
random = 8,8
vel = -3 - (Random / 1000.0), -2 - (Random / 2000.0)
facing = ifElse(Random < 500,-1,1)
vFacing = ifElse(Random < 500,-1,1)
removeTime = 16
sprPriority = 3
pauseMoveTime = -1
superMoveTime = -1

[State 8103, Scale Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.1 + (0.025 * Time), 0.1 + (0.025 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8103, Scale Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.1 + (0.025 * (Time - 3)), 0.1 + (0.025 * (Time - 3))
trans = AddAlpha
alpha = 256 - (16 * (Time - 3)), 256

[State 8103, Scale Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.1 + (0.025 * (Time - 6)), 0.1 + (0.025 * (Time - 6))
trans = AddAlpha
alpha = 256 - (16 * (Time - 6)), 256

[State 8103, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 22

[State 8103, End]
type = DestroySelf
trigger1 = !NumExplod


;==<IMPACT DUST>===
[StateDef 8110]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8110, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8110
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8120
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8110, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8110, End]
type = DestroySelf
trigger1 = !NumExplod


;==<WALL IMPACT DUST>===
[StateDef 8111]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8111, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8111
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8121
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8111, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8111, End]
type = DestroySelf
trigger1 = !NumExplod

;====<FLAMES>=
[StateDef 8150]
type = A
physics = N
moveType = I
ctrl = 0
anim = 8150
sprPriority = 4

[State 8150, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8150, Flames sound]
type = PlaySnd
trigger1 = Time = 1 && Root, StateNo != 3011
trigger2 = !Time && Root, StateNo = 3011
value = 2, 8150
ignorehitPause = 1

[State 8150, Player]
type = VarSet
trigger1 = !Time
var(0) = Parent, var(43)

[State 8150, PosSet]
type = PosSet
trigger1 = PlayerIDexist(var(0))
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y)

[State 8150, Facing]
type = Turn
trigger1 = PlayerIDexist(var(0))
trigger1 = Facing != (PlayerID(var(0)), Facing)

[State 8150, Flame Explod 1]
type = Explod
trigger1 = PlayerIDexist(var(0)) && IsHelper(8151) && AnimElemTime(3) >= 0
ID = 18150
anim = 8151
sprPriority = 3
posType = P1
pos = 0, ceil((PlayerID(var(0)), const(size.mid.pos.y)))
random = 40,40
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8150, Flames Explod 2]
type = Explod
trigger1 = PlayerIDexist(var(0)) && IsHelper(8151) && AnimElemTime(3) >= 0
ID = 18151
anim = 8151
sprPriority = 3
posType = P1
pos = 0, ceil((PlayerID(var(0)), const(size.mid.pos.y)))
random = 60,60
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8150, ChangeAnim]
type = ChangeAnim
trigger1 = IsHelper(8151) && !AnimTime
value = 1

[State 8150, End]
type = DestroySelf
trigger1 = IsHelper(8150) && !AnimTime
trigger2 = IsHelper(8151) && Time = 36
trigger3 = !PlayerIDexist(var(0))
trigger4 = (Parent, StateNo = [1036,1037]) && Parent, Time = 1 && Time >= 2

[State 8150, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), StateType = L && (PlayerID(var(0)), StateNo != [5080,5081])

;====<RECOVER FX>=
[StateDef 8200]
type = A
velSet = 0,0
anim = 8200
sprPriority = 5

[State 8200, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8200, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.017 * Time), 0.25 + (0.017 * Time)
ignoreHitPause = 1

[State 8200, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = ceil(256 - 17.1 * Time), 256
ignoreHitPause = 1

[State 8200, End]
type = DestroySelf
trigger1 = Time >= 15



;====<COUNTER FX>=
[StateDef 8290]
type = A
physics = N
velSet = 0,0
anim = 1

[State 8290, "Counter!" Text Explod]
type = Explod
trigger1 = !NumExplod(8290)
anim = 8290
ID = 8290
sprPriority = 64
posType = P1
facing = Facing
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time < 8
ID = 8290
scale = 0.5, .5
trans = AddAlpha
alpha = 256,0

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time >= 8
ID = 8290
scale = 0.5 + 0.0625 * (Time - 8), 0.5 + 0.0625 * (Time - 8)
trans = AddAlpha
alpha = 256 - 32 * (Time - 8), 32 * (Time - 8)

[State 8290, Safety]
type = RemoveExplod
trigger1 = Time >= 16

[State 8290, End]
type = DestroySelf
trigger1 = Time >= 16



;==<POWER CHARGE FX>==
;Aura and Dust
[StateDef 8330]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velset = 0,0

[State 8330, BindToRoot]
type = BindToRoot
trigger1 = (Root, StateNo = 730)
pos = 0,0

[State 8330, Charging Sound]
type = PlaySnd
trigger1 = !Time
value = 730,0
channel = 0

[State 8330, Power Charge Aura]
type = Explod
trigger1 = !NumExplod(8330)
ID = 8330
anim = 8330
sprPriority = 3
posType = P1
bindTime = -1
removeTime = -1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8330, Power Charge Dust]
type = Explod
trigger1 = !(Time % 6)
anim = 8105
sprPriority = -3
posType = P1
pos = 0, -ceil(pos y)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8330, Modify Aura 1]
type = ModifyExplod
trigger1 = Numexplod(8330) && Root, Power < 3000
ID = 8330
scale = 0.5, 0.1 + 0.4 * (Root, Power / 3000.0)

[State 8330, Modify Aura 2]
type = ModifyExplod
trigger1 = NumExplod(8330) && Root, Power >= 3000
ID = 8330
scale = 0.5, 0.5

[State 8330, StopSnd]
type = StopSnd
trigger1 = Root, StateNo != 730
channel = 0

[State 8330, RemoveExplod]
type = RemoveExplod
trigger1 = Root, StateNo != 730

[State 8330, End]
type = DestroySelf
trigger1 = Root, StateNo != 730


;Particles
[StateDef 8331]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8331, BindToRoot]
type = BindToRoot
trigger1 = !(Time % 8)
pos = ceil(-151 + (Random / 3.125)), ceil(98 - (Random / 3.125))

[State 8331, Particle]
type = Explod
trigger1 = (Time % 8) = 1
anim = 8331
sprPriority = ifElse(Random < 750, 5, -1)
posType = P1
vel = ((RootDist x + 9) / 32.0), ((RootDist y - 71) / 32.0)
scale = ifElse(Random < 500, 0.5, -0.5), ifElse(Random < 500, 0.5, -0.5)
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 8331, RemoveExplod]
type = RemoveExplod
trigger1 = Root, StateNo != 730

[State 8331, End]
type = DestroySelf
trigger1 = Root, StateNo != 730


;==<VIOLENT WIN VS VEGA PARTICLES>==
[StateDef 8332]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8332, BindToRoot]
type = BindToRoot
trigger1 = !(Time % 4)
pos = ceil(-40 + (Random /10.25)), ceil(-17 - (Random / 10.25))

[State 8332, Particles]
type = Explod
trigger1 = (Time % 4) = 1
anim = 8332
sprPriority = ifElse(Random < 750,5,-1)
posType = P1
vel = (-(RootDist x + 4) / 10.0),(-(RootDist y - 85) / 10.0)
scale = ifElse(random < 500 ,0.5, -0.5),ifElse(random < 500, 0.5, -0.5)
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8332, RemoveExplod]
type = RemoveExplod
trigger1 = Root, StateNo != 187 || Root, AnimElemTime(60) >= 0

[State 833, End]
type = DestroySelf
trigger1 = Root, StateNo != 187 || Root, AnimElemTime(60) >= 0



;==<ZERO COUNTER FX>==
[StateDef 8350]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8350, bgPalFX]
type = bgPalFX
trigger1 = 1
time = 1
color = 16 * Time
mul = 16 * Time, 16 * Time, 16 * Time

[State 8350, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8350
ID = 1
sprPriority = 3
posType = P1
removeTime = 16
superMoveTime = -1
ownPal = 1

[State 8350, Scale]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.0625 * Time), (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8350, Lightning Explod]
type = Explod
trigger1 = !Time
anim = 8351
ID = 2
sprPriority = -2
posType = P1
pos = 0, -ceil(pos y)
superMoveTime = -1
ownPal = 1

[State 8350, End]
type = DestroySelf
trigger1 = Time >= 16



;====<CUSTOM COMBO>=
[StateDef 8400]
type = A
physics = N
moveType = I
anim = 8400
ctrl = 0
velSet = 0,0
sprPriority = 5

[State 8400, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8400, BGpalFX]
type = BGpalFX
trigger1 = Time < 25
time = 1
mul = 128,128,128

[State 8400, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8400, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8400, Scale]
type = AngleDraw
trigger1 = Time < 8
scale = (0.0625 * Time), (0.0625 * Time)
ignoreHitPause = 1

[State 8400, Scale]
type = AngleDraw
trigger1 = Time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time < 16
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time >= 16
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256
ignoreHitPause = 1

[State 8400, Lines Explod]
type = Explod
trigger1 = !Time
anim = 8401
ID = 1
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8400, Scale Lines Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 2 - (0.125 * Time), 2 - (0.125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8400, Circle Explod]
type = Explod
trigger1 = Time = 16
anim = 8402
ID = 2
sprPriority = 5
posType = P1
removeTime = 32
superMoveTime = -1

[State 8400, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = (0.1 * (Time - 16)), (0.1 * (Time - 16))
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256

[State 8400, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 26

[State 8400, End]
type = DestroySelf
trigger1 = Time >= 26



;====<SUPER PAUSE FX>=
;Level 1 Super FX
[StateDef 8500]
type = A
velSet = 0,0
anim = 8500
sprPriority = 5

[State 8500, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8500, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 0,0,256

[State 8500, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8500, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8500, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8500, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5,0.5
ignoreHitPause = 1

[State 8500, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8500, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8501
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8500, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8500, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8502
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8500, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8500, End]
type = DestroySelf
trigger1 = Time >= 40


;Level 2 Super FX
[StateDef 8510]
type = A
velSet = 0,0
anim = 8510
sprPriority = 5

[State 8510, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8510, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 192,0,256

[State 8510, Rotate]
type = AngleSet
trigger1 = !Time
value =6 * (Random % 60)

[State 8510, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8510, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8510, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8510, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8511
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8510, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8510, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8510, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8510, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 -(0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8510, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8512
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500,-1,1)
vFacing = ifElse(Random < 500,-1,1)
removeTime = 32
superMoveTime = -1

[State 8510, Scale]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24)<4, 64 * (Time - 24), 256), 256

[State 8510, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8510, End]
type = DestroySelf
trigger1 = Time >= 40


;Level 3 Super FX
[StateDef 8520]
type = A
velset = 0,0
anim = 8520
sprPriority = 5

[State 8520, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8520, Assert: NoBarDisplay, NoBG, NoFG]
type = AssertSpecial
trigger1 = Time < 40
flag = NoBarDisplay
flag2 = NoBG
flag3 = NoFG

[State 8520, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8520, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8520, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8520, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8520, Portrait 1]
type = Explod
trigger1 = !Time
anim = 8525
ID = 20
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Portrait 2]
type = Explod
trigger1 = !Time
anim = 8525
ID = 21
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Scale Portrait 1a]
type = ModifyExplod
trigger1 = NumExplod(20) && Time < 16
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 1 - (0.03125 * Time), 1 - (0.03125 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 2a]
type = ModifyExplod
trigger1 = NumExplod(21) && Time < 16
ID = 21
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 2 - (0.09375 * Time), 2 - (0.09375 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 1b]
type = ModifyExplod
trigger1 = NumExplod(20) && (Time = [16,32])
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines Explod]
type = explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8521
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8520, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8520, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1-(0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8520, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8520, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8522
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1 ,1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8520, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8520, End]
type = DestroySelf
trigger1 = Time >= 40



;====<SUPER FINISH>=
[StateDef 8600]
type = A
velSet = 0,0
anim = 1

[State 8600, Super Finish Sound]
type = PlaySnd
trigger1 = !Time
value = 8600,0
channel = 0

[State 8600, SndPan]
type = SndPan
trigger1 = Time <= 80
channel = 1
absPan = ceil(sin(GameTime / 20.0 * pi) * 160)

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time < 16
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time = [16,24)
time = 1
mul = 32 * (Time - 16), 32 * (Time - 16), 32 * (Time - 16)

[State 8600, Move Name: Custom Combo]
type = VarSet
trigger1= !Time && Root, var(23) = 900
var(0) = 1

[State 8600, Move Name: Midnight Bliss]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3000,3099])
var(0) = 2

[State 8600, Move Name: Demon Blast]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 3

[State 8600, Move Name: Midnight Pleasure]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3200,3299])
var(0) = 4

[State 8600, Super Finish Explod]
type = Explod
trigger1 = !Time
anim = 8600
ID = 8600
ontop = 1
postype = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Super Finish Explod Fade]
type = ModifyExplod
trigger1 = NumExplod(8600)
ID = 8600
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), 256

[State 8600, Text 1]
type = Explod
trigger1 = !Time && var(0)
anim = 8610 + var(0)
ID = 10
onTop = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 2]
type = Explod
trigger1 = !Time && var(0)
anim = 8610 + var(0)
ID = 11
onTop = 1
posType = left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 1 Fade]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), ifElse(Time < 16, 0, 32 * (Time - 16))

[State 8600, Text 2 Fade]
type = ModifyExplod
trigger1 = NumExplod(11)
ID = 11
scale = 0.5 + (0.0625 * Time), 0.5 + (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time), 32 * Time

[State 8600, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8601
ID = 8601
under = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
bindTime = -1
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Circle Fade]
type = ModifyExplod
trigger1 = NumExplod(8601)
ID = 8601
scale = (0.25 * Time) * (1.3333333 * GameHeight / GameWidth), (0.25 * Time) * (1.3333333 * GameHeight / GameWidth)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8600, Assert: NoFG]
type = AssertSpecial
trigger1 = Time < 16
flag = NoFG

[State 8600, Assert: NoBarDisplay]
type = AssertSpecial
trigger1 = Time < 24
flag = NoBarDisplay

[State 8600, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 24
trigger2 = RoundState < 3

[State 8600, End]
type = DestroySelf
trigger1 = RoundState < 3



;====<CAMERA CONTROL>=
[StateDef 8999]
type = S
velSet = 0,0
anim = 1

[State 8999, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 8999, End]
type = DestroySelf
trigger1 = RoundState = 2
