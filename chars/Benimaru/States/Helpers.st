; _________________________________________
;| Benimaru by Jmorphman                   |
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
trigger1 = !(Root, AILevel) && ifElse(Root, NumExplod(92828282) || Root, NumExplod(92468246), Root, command = "up", Root, command = "down")
trigger2 = Root, AILevel && (Root, StateType != A) && P2StateType = C
value = 766

[State 765, Change to Standing / Jumping]
type = ChangeAnim
triggerAll = !Time
trigger1 = !Root, NumExplod(94646464) && !Root, NumExplod(92468246)
trigger1 = !(Root, AILevel) && ifElse(Root, P2dist x >= 0, Root, command = "fwd", Root, command = "back")
trigger2 = Root, NumExplod(94646464) || Root, NumExplod(92468246)
trigger2 = !(Root, AILevel) && ifElse(Root, P2dist x >= 0, Root, command = "back", Root, command = "fwd")
trigger3 = Root, AILevel && Anim != 766
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
triggerAll = !Root, NumExplod(92828282) && !Root, NumExplod(94646464) && !Root, NumExplod(92468246)
trigger1 = ifElse(Root, P2dist x >= 0, Root, command = "holdback", Root, command = "holdfwd")
trigger2 = Time < 4 && (ifElse(Root, P2dist x >= 0, Root, command = "holdfwd", Root, command = "holdback") + Root, command = "holddown") > 1
trigger3 = Time >= 4 && (ifElse(Root, P2dist x >= 0, Root, command = "holdfwd", Root, command = "holdback") || Root, command = "holddown")
trigger4 = Time >= 1 && (((Anim = 765 || Anim = 767) && ifElse(Root, P2dist x >= 0, Root, command = "fwd", Root, command = "back")) || (Anim = 766 && Root, command = "down"))
var(0) = 1

[State 765, Disable (Reverse Commands)]
type = VarSet
triggerAll = !(Root, AILevel)
triggerAll = Root, NumExplod(94646464) || Root, NumExplod(92468246)
trigger1 = ifElse(Root, P2dist x >= 0, Root, command = "holdfwd", Root, command = "holdback")
trigger2 = Time < 4 && (ifElse(Root, P2dist x >= 0, Root, command = "holdback", Root, command = "holdfwd") + ifElse(Root, NumExplod(92468246), Root, command = "holdup", Root, command = "holddown")) > 1
trigger3 = Time >= 4 && (ifElse(Root, P2dist x >= 0, Root, command = "holdback", Root, command = "holdfwd") || ifElse(Root, NumExplod(92468246), Root, command = "holdup", Root, command = "holddown"))
trigger4 = Time >= 1 && (((Anim = 765 || Anim = 767) && ifElse(Root, P2dist x >= 0, Root, command = "back", Root, command = "fwd")) || (Anim = 766 && ifElse(Root, NumExplod(92468246), Root, command = "up", Root, command = "down")))
var(0) = 1

[State 765, Disable (Reverse Up/Down only)]
type = VarSet
triggerAll = !(Root, AILevel)
triggerAll = Root, NumExplod(92828282) && !Root, NumExplod(94646464) && !Root, NumExplod(92468246)
trigger1 = ifElse(Root, P2dist x >= 0, Root, command = "holdback", Root, command = "holdfwd")
trigger2 = Time < 4 && (ifElse(Root, P2dist x >= 0, Root, command = "holdfwd", Root, command = "holdback") + Root, command = "holdup") > 1
trigger3 = Time >= 4 && (ifElse(Root, P2dist x >= 0, Root, command = "holdfwd", Root, command = "holdback") || Root, command = "holdup")
trigger4 = Time >= 1 && (((Anim = 765 || Anim = 767) && ifElse(Root, P2dist x >= 0, Root, command = "fwd", Root, command = "back")) || (Anim = 766 && Root, command = "up"))
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



;====<RAIJINKEN PROJECTILE>=
[StateDef 1005]
type = S
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1

[State 1005, BindToRoot (Normal)]
type = BindToRoot
trigger1 = IsHelper(1005) || IsHelper(1035)
pos = 88, -80
ignoreHitPause = 1

[State 1005, BindToRoot (Aerial)]
type = BindToRoot
trigger1 = IsHelper(1055)
pos = 54, -44
ignoreHitPause = 1

[State 1005, BindToRoot (Taiku)]
type = BindToRoot
trigger1 = IsHelper(1105) || IsHelper(1135)
pos = 56, -115
ignoreHitPause = 1

[State 1005, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1005, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1005

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = ifElse(var(10) = 2 || var(10) >= 3, 3, ifElse(var(10), 2, 1))

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
stateNo = ifElse(var(0) > 1, 1005, 1009)
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1005 && Anim != 1055 && Anim != 1105
value = ifElse((Root, StateNo = [1000,1030]), 1005, ifElse((Root, StateNo = [1100,1130]), 1105, 1055))

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

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
trigger1 = !(Root, var(16)) && (Root, var(15) < (1 + HitCount) || Root, var(20))
trigger1 = Root, StateNo != 1100
trigger1 = var(0) > 0 && var(10) < 3
ID = 1005
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(!HitCount && var(10), 42, ifElse(var(10) = 2, 14, ifElse(var(10), 21, 56))) < 7, 7, fvar(11) * ifElse(!HitCount && var(10), 42, ifElse(var(10) = 2, 14, ifElse(var(10), 21, 56))))), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, 16
guard.pauseTime = 0, 16
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
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
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 32)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1005, EX HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < (1 + HitCount))
trigger1 = var(0) > 0 && var(10) = 3
ID = 1005
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, 28
guard.pauseTime = 0, 16
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 16
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -3.75, -7.34375
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -3.75, -7.34375
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.5126953125
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 59)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1005, Taiku HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < (1 + HitCount) || Root, var(20))
trigger1 = Root, StateNo = 1100
trigger1 = var(0) > 0 && var(10) < 3
ID = 1005
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(!HitCount && var(10), 42, ifElse(var(10) = 2, 21, ifElse(var(10), 35, 70))) < 7, 7, fvar(11) * ifElse(!HitCount && var(10), 42, ifElse(var(10) = 2, 21, ifElse(var(10), 35, 70))))), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, 16
guard.pauseTime = 0, 16
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 16
ground.slideTime = 16
guard.hitTime = 16
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
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 32)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1005, EX Taiku HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < (1 + HitCount))
trigger1 = var(0) > 0 && var(10) = 4
ID = 1005
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,6
guard.pauseTime = 0,6
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.195, -12.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.195, -10.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 51)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1005, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1005)
value = 51005
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
value = ifElse(var(0) > 1, 1005, 1009)
ignoreHitPause = 1

[State 1005, End]
type = ChangeState
trigger1 = !var(0) && PrevStateNo && Time = 2
trigger2 = AnimElemTime(10) >= 0
value = 1007
ignoreHitPause = 1

[State 1005, DestroySelf]
type = ChangeState
trigger1 = Root, StateNo != 1000 && Root, StateNo != 1030
trigger1 = Root, StateNo != 1050
trigger1 = Root, StateNo != 1100 && Root, StateNo != 1130
value = 1008
ignoreHitPause = 1


;Hit Pause
[StateDef 1006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1
moveHitPersist = 1

[State 1006, BindToRoot (Normal)]
type = BindToRoot
trigger1 = IsHelper(1005) || IsHelper(1035)
pos = 88, -80
ignoreHitPause = 1

[State 1006, BindToRoot (Aerial)]
type = BindToRoot
trigger1 = IsHelper(1055)
pos = 54, -44
ignoreHitPause = 1

[State 1006, BindToRoot (Taiku)]
type = BindToRoot
trigger1 = IsHelper(1105) || IsHelper(1135)
pos = 56, -115
ignoreHitPause = 1

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

[State 1006, Juggle Reset]
type = ParentVarSet
trigger1 = var(10) = 3
trigger1 = MoveHit && Root, var(11) < 3 && NumTarget(1005)
trigger2 = var(10) = 4
trigger2 = MoveHit && Root, var(12) < 3 && NumTarget(1005)
var(15) = 0

[State 1006, ParentVarAdd]
type = ParentVarAdd
trigger1 = var(10) = 3
trigger1 = MoveHit && NumTarget(1005)
var(11) = 1
persistent = 0

[State 1006, ParentVarAdd]
type = ParentVarAdd
trigger1 = var(10) = 4
trigger1 = MoveHit && NumTarget(1005)
var(12) = 1
persistent = 0

[State 1006, Juggle Flag]
type = ParentVarSet
trigger1 = var(10) = 3
trigger1 = Root, var(11) >= 6
trigger2 = var(10) = 4
trigger2 = Root, var(12) >= 6
var(16) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1050]
trigger2 = Root, StateNo = [1100,1130]
var(18) = ifElse(MoveHit, 2, 1)

[State 1006, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
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
trigger1 = Time >= 4 && var(0) > 1
trigger2 = Time >= 0 && var(0) <= 1
value = ifElse(var(0) <= 1, 1007, 1005)

[State 1006, DestroySelf]
type = ChangeState
trigger1 = Root, StateNo != 1000 && Root, StateNo != 1030
trigger1 = Root, StateNo != 1050
trigger1 = Root, StateNo != 1100 && Root, StateNo != 1130
value = 1008
ignoreHitPause = 1

[State 1006, Freeze AnimElem]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0) - 1


;Disappear
[StateDef 1007]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, HitBy]
type = HitBy
trigger1 = 1
value =
ignoreHitPause = 1

[State 1007, BindToRoot (Normal)]
type = BindToRoot
trigger1 = IsHelper(1005) || IsHelper(1035)
pos = 88, -80
ignoreHitPause = 1

[State 1007, BindToRoot (Taiku)]
type = BindToRoot
trigger1 = IsHelper(1105) || IsHelper(1135)
pos = 56, -115
ignoreHitPause = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, DestroySelf]
type = ChangeState
trigger1 = Root, StateNo != 1000 && Root, StateNo != 1030
trigger1 = Root, StateNo != 1050
trigger1 = Root, StateNo != 1100 && Root, StateNo != 1130
trigger2 = (Root, StateNo = [1000,1030]) && Root, AnimElemTime(5) < 0
trigger3 = Root, StateNo = 1050 && Root, AnimElemTime(3) < 0
trigger4 = (Root, StateNo = [1100,1130]) && Root, AnimElemTime(5) < 0
value = 1008

[State 1007, ChangeAnimElem Flag On]
type = ParentVarAdd
triggerAll = Root, var(10) < 10
trigger1 = NumTarget(1005) && !IsHelper(1055) && !IsHelper(1105) && !IsHelper(1135)
trigger1 = Target(1005), GetHitVar(HitTime) + Target(1005), GetHitVar(HitShakeTime) <= 24 + (60 * (var(10) = 3 && MoveHit))
trigger2 = !var(0) && Time >= 7
var(10) = 10

[State 1007, ChangeAnimElem]
type = ChangeAnim
trigger1 = Root, StateNo != [1100,1130]
trigger1 = Root, var(10) >= 10
trigger1 = AnimElemTime(17) < 0
trigger2 = Root, StateNo = [1100,1130]
trigger2 = Root, var(10) >= 10
trigger2 = AnimElemTime(21) < 0
trigger3 = Root, StateNo = [1100,1130]
trigger3 = Root, AnimElemTime(8) = -1
trigger3 = AnimElemTime(21) < 0
value = Anim
elem = ifElse((Root, StateNo = [1100,1130]), 21, 17)

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

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget


;Health decrement when killed by another projecitle
[StateDef 1009]
moveHitPersist = 1

[State 1009, VarSet]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 1009, End]
type = ChangeState
trigger1 = !Time
value = 1007



;====<RAIJINKEN (TARGET)>=
;Hit shake
[StateDef 51005]
type = S
moveType = H
physics = N
velset = 0,0

[State 51005, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(7696) && !SelfAnimExist(9010)
trigger1 = !Time
trigger1 = GetHitVar(AnimType) != [3,5]
value = ifElse((GetHitVar(GroundType) = 1), 5000, 5010) + GetHitVar(AnimType)

[State 51005, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(7696) && !SelfAnimExist(9010)
trigger1 = !Time
trigger1 = GetHitVar(AnimType) = [3,5]
value = 5030

[State 51005, ChangeAnim]
type = ChangeAnim
trigger1 = !SelfAnimExist(7696) && !SelfAnimExist(9010)
trigger1 = !Time
trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
value = 5047 + GetHitVar(AnimType)

[State 51005, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(7696) || SelfAnimExist(9010)
trigger1 = !Time
value = ifElse(SelfAnimExist(7696), 7696, 9010)

[State 51005, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 7696 && Anim != 9010
trigger1 = Time > 0
value = Anim

[State 51005, StateTypeSet]
type = StateTypeSet
trigger1 = !Time
trigger1 = GetHitVar(yVel) != 0 || GetHitVar(fall)
trigger2 = pos y != 0
StateType = A

[State 51005, SelfState]
type = SelfState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yVel) = 0 && !GetHitVar(fall)
value = 5001

[State 51005, SelfState]
type = SelfState
trigger1 = HitShakeOver
value = 5030



;====<EX AERIAL RAIJINKEN PROJECTILE>=
[StateDef 1085]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1

[State 1085, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 1085, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 1085

[State 1085, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 3

[State 1085, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 1085, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateNo = ifElse(var(0) > 1, 1085, 1087)
ignoreHitPause = 1

[State 1085, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1085, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1085
value = 1085

[State 1085, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1085, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1085, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time
var(39) = 1

[State 1085, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1085, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1085, EX HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < (1 + HitCount))
trigger1 = var(0) > 0
ID = 1085
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, 20
guard.pauseTime = 0, 20
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
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
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 28)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1085, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1085)
value = 51005
ID = 1085
ignoreHitPause = 1
persistent = 0

[State 1085, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(NumTarget, 1086, 1085)
ignoreHitPause = 1

[State 1085, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = ifElse(var(0) > 1, 1085, 1087)
ignoreHitPause = 1

[State 1085, End]
type = ChangeState
trigger1 = !var(0) && PrevStateNo && Time = 2
trigger2 = AnimElemTime(10) >= 0
value = 1087
ignoreHitPause = 1


;Hit Pause
[StateDef 1086]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1
moveHitPersist = 1

[State 1086, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1086, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 1086, HitSpark]
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

[State 1086, Counter FX]
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

[State 1086, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1086, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 1086, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1086, ProjContact]
type = ParentVarSet
triggerAll = MoveContact && NumTarget
trigger1 = Root, StateNo = 1080
var(18) = ifElse(MoveHit, 2, 1)

[State 1086, Shock Particles]
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

[State 1086, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1086, End]
type = ChangeState
trigger1 = Time >= 8 && var(0) > 1
trigger2 = Time >= 0 && var(0) <= 1
value = ifElse(var(0) <= 1, 1087, 1085)

[State 1086, Freeze AnimElem]
type = ChangeAnim
trigger1 = 1
value = 1085
elem = AnimElemNo(0) - 1


;Disappear
[StateDef 1087]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1087, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !Time
var(39) = -1

[State 1087, HitBy]
type = HitBy
trigger1 = 1
value =
ignoreHitPause = 1

[State 1087, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1087, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008



;====<RAIKOKEN PROJECTILE>=
[StateDef 3005]
type = S
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1

[State 3005, BindToRoot (Normal)]
type = BindToRoot
trigger1 = IsHelper(3005) || IsHelper(3055)
pos = 88, -80
ignoreHitPause = 1

[State 3005, BindToRoot (Taiku)]
type = BindToRoot
trigger1 = IsHelper(3015)
pos = 56, -115
ignoreHitPause = 1

[State 3005, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 3005, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 3005

[State 3005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = ifElse(Root, StateNo = 3050, 3, Root, var(10))

[State 3005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = ifElse(Root, StateNo = 3050, 10, 5)

[State 3005, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateNo = ifElse(var(0) > 0, 3005, 3007)
ignoreHitPause = 1

[State 3005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3005, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 3005
value = 3005

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3005, Miss]
type = HitDef
trigger1 = 1
attr = S,HP
hitFlag =
sparkXY = -10,0

[State 3005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < (1 + HitCount))
trigger1 = var(0) > 0
ID = 3005
attr = S,HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 3, ifElse(HitCount < 5, 28, 21), 28) < 7, 7, fvar(11) * ifElse(var(10) = 3, ifElse(HitCount < 5, 28, 21), 28))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, 16
guard.pauseTime = 0, 16
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 8
ground.slideTime = 8
guard.hitTime = 8
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -3.75, -7.34375
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -3.75, -7.34375
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
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 47)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 3005, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3005)
value = 51005
ID = 3005
ignoreHitPause = 1
persistent = 0

[State 3005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(NumTarget, 3006, 3005)
ignoreHitPause = 1

[State 3005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = ifElse(var(0) > 0, 3005, 3007)
ignoreHitPause = 1

[State 3005, End]
type = ChangeState
trigger1 = !var(0) && PrevStateNo && Time = 2
trigger2 = AnimElemTime(50) >= 0
value = 3007
ignoreHitPause = 1

[State 3005, DestroySelf]
type = ChangeState
trigger1 = Root, StateNo != 3000 && var(10) != 3
trigger2 = Root, StateNo != 3050 && var(10) = 3
value = 1008
ignoreHitPause = 1


;Hit Pause
[StateDef 3006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1
moveHitPersist = 1

[State 3006, BindToRoot (Normal)]
type = BindToRoot
trigger1 = IsHelper(3005) || IsHelper(3055)
pos = 88, -80
ignoreHitPause = 1

[State 3006, BindToRoot (Taiku)]
type = BindToRoot
trigger1 = IsHelper(3015)
pos = 56, -115
ignoreHitPause = 1

[State 3006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 3006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < -64, -64, ifElse(P2Dist x < 64, ceil(P2Dist x), 64)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < -64, -64, ifElse(P2Dist x < 64, ceil(P2Dist x), 64)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3006, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 3006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 3006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3000,3050]
var(18) = ifElse(MoveHit, 2, 1)

[State 3006, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3006, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3006, VarSet]
type = VarSet
trigger1 = Time >= 0 && var(0) <= 1
var(0) = 0

[State 3006, End]
type = ChangeState
trigger1 = Time >= 4 && var(0) > 1
trigger2 = Time >= 0 && var(0) <= 1
value = ifElse(var(0) <= 1, 3007, 3005)

[State 3006, DestroySelf]
type = ChangeState
trigger1 = Root, StateNo != 3000 && var(10) != 3
trigger2 = Root, StateNo != 3050 && var(10) = 3
value = 1008
ignoreHitPause = 1

[State 3006, Freeze AnimElem]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0) - 1


;Disappear
[StateDef 3007]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 3007, HitBy]
type = HitBy
trigger1 = 1
value =
ignoreHitPause = 1

[State 3007, BindToRoot (Normal)]
type = BindToRoot
trigger1 = IsHelper(3005) || IsHelper(3055)
pos = 88, -80
ignoreHitPause = 1

[State 3007, BindToRoot (Taiku)]
type = BindToRoot
trigger1 = IsHelper(3015)
pos = 56, -115
ignoreHitPause = 1

[State 3007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 3007, DestroySelf]
type = ChangeState
trigger1 = Root, StateNo != 3000 && Root, StateNo != 3050
trigger2 = (Root, StateNo = [3000,3050]) && Root, AnimElemTime(6) < 0
value = 1008

[State 3007, ChangeAnimElem Flag On (Parent)]
type = ParentVarAdd
triggerAll = Root, var(10) < 10
trigger1 = !var(0) && !Time
var(10) = 10

[State 3007, ChangeAnimElem Flag On (Self)]
type = VarAdd
triggerAll = var(10) < 10
trigger1 = !var(0) && Time >= 7
var(10) = 10

[State 3007, ChangeAnimElem]
type = ChangeAnim
trigger1 = var(10) >= 10
trigger1 = AnimElemTime(57) < 0
value = Anim
elem = 57

[State 3007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008



;====<RAIHA JINOKEN>=
[StateDef 3305]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1

[State 3305, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = -10,0
ignoreHitPause = 1

[State 3305, Projectile reflection compatibility detection]
type = VarSet
trigger1 = 1
sysvar(0) = 131072

[State 3305, Set reflected StateNo]
type = VarSet
trigger1 = 1
sysvar(1) = 3305

[State 3305, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 9

[State 3305, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3305, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateNo = ifElse(var(0) > 0, 3305, 3307)
ignoreHitPause = 1

[State 3305, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3305, Button Detect]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(10) = Root, var(10)

[State 3305, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 3305 && Anim != 3315 && Anim != 3325
value = ifElse(var(10) = 2, 3325, ifElse(var(10), 3315, 3305))

[State 3305, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3305, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3305, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3305, Miss]
type = HitDef
trigger1 = 1
attr = S,HP
hitFlag =
sparkXY = -10,0

[State 3305, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && Root, var(15) < (1 + HitCount)
trigger1 = var(0) > 0
ID = 3305
attr = S,HP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36,36
pauseTime = 0,16
guard.pauseTime = 0,16
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 28
ground.slideTime = 28
guard.hitTime = 28
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -3.75, -7.34375
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -3.75, -7.34375
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
palFX.time = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 0, 47)
palFX.mul = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 256, 192)
palFX.sinAdd = ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), -255, 128), ifElse(EnemyNear, SelfAnimExist(7696) || EnemyNear, SelfAnimExist(9010), 48, 4)
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 3305, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3305)
value = 51005
ID = 3305
ignoreHitPause = 1
persistent = 0

[State 3305, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(NumTarget, 3306, 3305)
ignoreHitPause = 1

[State 3305, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = ifElse(var(0) > 0, 3305, 3307)
ignoreHitPause = 1

[State 3305, End]
type = ChangeState
trigger1 = AnimElemTime(11) >= 0
trigger2 = !var(0) && PrevStateNo && Time = 2
value = 3307
ignoreHitPause = 1

[State 3306, DestroySelf]
type = ChangeState
trigger1 = Root, StateNo != 3300
value = 1008
ignoreHitPause = 1


;Hit Pause
[StateDef 3306]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
hitCountPersist = 1
moveHitPersist = 1

[State 3306, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = -10,0
ignoreHitPause = 1

[State 3306, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 3306, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3306, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ceil(P2Dist x),ifElse(var(10) = 2, -129, ifElse(var(10), -18, -78))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3306, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(P2Dist x),ifElse(var(10) = 2, -129, ifElse(var(10), -18, -78))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3306, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 3306, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State 3306, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 3306, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = 3300
var(18) = ifElse(MoveHit, 2, 1)

[State 3306, Shock Particles]
type = Helper
trigger1 = !(EnemyNear, SelfAnimExist(7696)) && !(EnemyNear, SelfAnimExist(9010))
trigger1 = !NumHelper(8155)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = normal
stateNo = 8155
ID = 8155
name = "Shock Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 3306, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 3306, VarSet]
type = VarSet
trigger1 = Time >= 0 && var(0) <= 1
var(0) = 0

[State 3306, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(0) <= 1, 3307, 3305)

[State 3306, DestroySelf]
type = ChangeState
trigger1 = Root, StateNo != 3300
value = 1008
ignoreHitPause = 1


;Disappear
[StateDef 3307]
type = A
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 3307, HitBy]
type = HitBy
trigger1 = 1
value =
ignoreHitPause = 1

[State 3307, BindToRoot]
type = BindToRoot
trigger1 = 1
pos = -10,0
ignoreHitPause = 1

[State 3307, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 3307, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Root, StateNo != 3300
value = 1008



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
scale = (0.3 - (Time * 0.03)) * 0.65, (0.3 - (Time * 0.03)) * 0.65
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
scale = (0.15 + (0.009375 * Time)) * 0.65, (0.15 + (0.009375 * Time)) * 0.65
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
scale = (0.15 + (0.009375 * Time)) * 0.65, (0.15 + (0.009375 * Time)) * 0.65
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
scale = (0.3 - (0.0375 * Time)) * 0.65, (0.3 - (0.0375 * Time)) * 0.65
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
scale = (0.35 - (Time * 0.035)) * 0.65, (0.35 - (Time * 0.035)) * 0.65
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
scale = (0.175 + (0.0109375 * Time)) * 0.65, (0.175 + (0.0109375 * Time)) * 0.65
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
scale = (0.175 + (0.0109375 * Time)) * 0.65, (0.175 + (0.0109375 * Time)) * 0.65
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
scale = (0.35 - (0.04375 * Time)) * 0.65, (0.35 - (0.04375 * Time)) * 0.65
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
scale = (0.4 - (Time * 0.04)) * 0.65, (0.4 - (Time * 0.04)) * 0.65
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
scale = (0.2 + (0.0125 * Time)) * 0.65, (0.2 + (0.0125 * Time)) * 0.65
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
scale = (0.2 + (0.0125 * Time)) * 0.65, (0.2 + (0.0125 * Time)) * 0.65
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
scale = (0.4 - (0.05 * Time)) * 0.65, (0.4 - (0.05 * Time)) * 0.65
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
scale = (0.45 - (Time * 0.045)) * 0.65, (0.45 - (Time * 0.045)) * 0.65
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
scale = (0.225 + (0.0140625 * Time)) * 0.65, (0.225 + (0.0140625 * Time)) * 0.65
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
scale = (0.225 + (0.0140625 * Time)) * 0.65, (0.225 + (0.0140625 * Time)) * 0.65
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
scale = (0.4) * 0.65, (0.4) * 0.65
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority=3
removeTime=8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = (0.45 - (0.05625 * Time)) * 0.65, (0.45 - (0.05625 * Time)) * 0.65
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
scale = (0.5 - (Time * 0.05)) * 0.65, (0.5 - (Time * 0.05)) * 0.65
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
scale = (0.25 + (0.015625 * Time)) * 0.65, (0.25 + (0.015625 * Time)) * 0.65
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
scale = (0.25 + (0.015625 * Time)) * 0.65, (0.25 + (0.015625 * Time)) * 0.65
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
scale = (0.5) * 0.65, (0.5) * 0.65
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
scale = (0.5 - (0.0625 * Time)) * 0.65, (0.5 - (0.0625 * Time)) * 0.65
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
scale = ((0.5 + (Time * 0.15)) / 2) * 0.65, ((1 - (Time * 0.1)) / 2) * 0.65
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
scale = (0.2 + (0.0125 * Time)) * 0.65, (0.2 + (0.0125 * Time)) * 0.65
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
scale = ((0.5 + (Time * 0.15)) / 2) * 0.65, ((1 - (Time * 0.1)) / 2) * 0.65
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
scale = (0.25 + (0.025 * Time)) * 0.65, (0.25 + (0.025 * Time)) * 0.65
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
scale = (0.225 + (0.0140625 * Time)) * 0.65, (0.225 + (0.0140625 * Time)) * 0.65
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
scale = ((0.5 + (Time * 0.15)) / 2) * 0.65, ((1 - (Time * 0.1)) / 2) * 0.65
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
scale = (0.3 + (0.03 * Time)) * 0.65, (0.3 + (0.03 * Time)) * 0.65
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
scale = (0.25 + (0.015625 * Time)) * 0.65, (0.25 + (0.015625 * Time)) * 0.65
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
scale = (0.25 + (0.09375 * Time)) * 0.65, (0.25 + (0.09375 * Time)) * 0.65
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
scale = 0.25 + (0.03125 * Time) * 0.5, 0.25 + (0.03125 * Time) * 0.5
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8110, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8110, End]
type = DestroySelf
trigger1 = !NumExplod



;====<FLAMES>=
[StateDef 8150]
type = A
velSet = 0,0
anim = 1

[State 8150, Player]
type = VarSet
trigger1 = !Time
var(0) = Parent, var(43)

[State 8150, PosSet]
type = PosSet
trigger1 = PlayerIDexist(var(0))
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) + (PlayerID(var(0)), const(size.mid.pos.y))

[State 8150, PosSet (Laying Down)]
type = PosSet
trigger1 = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), StateType = L
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) - 20

[State 8150, Facing]
type = Turn
trigger1 = PlayerIDexist(var(0))
trigger1 = Facing != (PlayerID(var(0)), Facing)

[State 8150, Flame Explod 1]
type = Explod
trigger1 = PlayerIDexist(var(0))
anim = 8150
sprPriority = 3
posType = P1
random = 40,40
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8150, Flames Explod 2]
type = Explod
trigger1 = PlayerIDexist(var(0))
anim = 8150
sprPriority = 3
posType = P1
random = 60,60
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8150, End]
type = DestroySelf
trigger1 = Time >= 600
trigger2 = !PlayerIDexist(var(0))

[State 8150, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), ctrl
trigger2 = PlayerID(var(0)), Movetype != H || PlayerID(var(0)), StateNo = 5300
trigger3 = PlayerID(var(0)), StateType = L && (PlayerID(var(0)), StateNo != [5080,5081])
trigger4 = Root, MoveHit



;====<SHOCK>=
[StateDef 8155]
type = A
velSet = 0,0
anim = 1

[State 8155, Player]
type = VarSet
trigger1 = !Time
var(0) = Parent, var(43)

[State 8155, PosSet]
type = PosSet
trigger1 = PlayerIDexist(var(0))
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) + (PlayerID(var(0)), const(size.mid.pos.y))

[State 8155, PosSet (Laying Down)]
type = PosSet
trigger1 = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), StateType = L
x = ceil(PlayerID(var(0)), pos x)
y = ceil(PlayerID(var(0)), pos y) - 20

[State 8155, Facing]
type = Turn
trigger1 = PlayerIDexist(var(0))
trigger1 = Facing != (PlayerID(var(0)), Facing)

[State 8155, Spark Explod]
type = Explod
trigger1 = PlayerIDexist(var(0))
anim = 8155
sprPriority = 3
posType = P1
random = 40,40
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
;bindtime = -1
scale = 0.25, 0.25
ownPal = 1

[State 8155, End]
type = DestroySelf
trigger1 = Time >= 600
trigger2 = !PlayerIDexist(var(0))

[State 8155, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), ctrl
trigger2 = PlayerID(var(0)), MoveType != H || PlayerID(var(0)), StateNo = 5300
trigger3 = PlayerID(var(0)), StateType = L && (PlayerID(var(0)), StateNo != [5080,5081])
trigger4 = PlayerID(var(0)), PrevStateNo = 1546
trigger5 = PlayerID(var(0)), StateNo = 865

[State 8155, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0)) && Root, MoveHit
trigger1 = Root, StateNo = [200,999]
trigger2 = Root, StateNo = 1200 || Root, StateNo = 1230
trigger3 = (Root, StateNo = 1201 || Root, StateNo = 1231) && Root, AnimElemTime(12) < 0
trigger4 = Root, StateNo = [1400,1499]
trigger5 = Root, StateNo = [3100,3199]



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
vel = ((RootDist x + 10) / 32.0), ((RootDist y - 67) / 32.0)
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



;==<ZERO COUNTER FX>==
[StateDef 8350]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 8350, BGPalFX]
type = BGPalFX
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
channel = 1

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

[State 8600, Move Name: Raikoken]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3000,3099]) && Root, var(23) != 3010
var(0) = 2

[State 8600, Move Name: Taiku Raikoken]
type = VarSet
trigger1 = !Time && Root, var(23) = 3010
var(0) = 3

[State 8600, Move Name: Denei Spark]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 4

[State 8600, Move Name: Elec-Trigger]
type = VarSet
trigger1= !Time && (Root, var(23) = [3200,3299])
var(0) = 5

[State 8600, Move Name: Secret Mirage]
type = VarSet
trigger1= !Time && (Root, var(23) = [3300,3399])
var(0) = 6

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
scale = (0.25 * time) * (1.3333333 * GameHeight / GameWidth), (0.25 * time) * (1.3333333 * GameHeight / GameWidth)
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



;====<GORO DAIMON>=
[StateDef 17000]
type = A
physics = N
moveType = I
anim = 17001
velSet = 0,0
ctrl = 0
sprPriority = -5

[State 17000, Zero Counter PalFX (Root)]
type = PalFX
trigger1 = Root, StateNo = 750
time = 1
color = 16 * (Root, Time - 1)
mul = 16 * (Root, Time - 1), 16 * (Root, Time - 1), 16 * (Root, Time - 1)

[State 17000, Zero Counter PalFX (Enemy)]
type = PalFX
trigger1 = Enemy, StateNo = 750
time = 1
color = 16 * (Enemy, Time - 1)
mul = 16 * (Enemy, Time - 1), 16 * (Enemy, Time - 1), 16 * (Enemy, Time - 1)

[State 17000, Custom Combo PalFX]
type = PalFX
trigger1 = (Root, StateNo = 900 || Root, StateNo = 905) && Root, NumHelper(8400) && Root, Time < 30
trigger2 = (Enemy, StateNo = 900 || Enemy, StateNo = 905) && Enemy, NumHelper(8400) && Enemy, Time < 30
time = 1
mul = 128,128,128

[State 17000, Level 1 PalFX]
type = PalFX
trigger1 = Root, StateNo = 3000 && Root, Time >= 4 && Root, AnimElemTime(4) < -1
trigger2 = Root, StateNo = 3100 && Root, Time >= 4 && Root, AnimElemTime(4) < -1
trigger3 = Root, StateNo = 3200 && Root, Time >= 4 && Root, AnimElemTime(3) < -1
trigger4 = Enemy, StateNo = 3000 && Enemy, Time >= 4 && Enemy, Time < 43
trigger5 = Enemy, StateNo = 3100 && Enemy, Time >= 4 && Enemy, AnimElemTime(8) < -1
trigger6 = Enemy, StateNo = 3500 && Enemy, Time >= 4 && Enemy, Time < 43
time = 1
color = 0
mul = 0,0,256

[State 17000, Level 2 PalFX]
type = PalFX
trigger1 = Root, StateNo = 3050 && Root, Time >= 4 && Root, AnimElemTime(4) < -1
trigger2 = Root, StateNo = 3150 && Root, Time >= 4 && Root, AnimElemTime(4) < -1
trigger3 = Root, StateNo = 3250 && Root, Time >= 4 && Root, AnimElemTime(4) < -1
trigger4 = Enemy, StateNo = 3050 && Enemy, Time >= 4 && Enemy, Time < 43
trigger5 = Enemy, StateNo = 3150 && Enemy, Time >= 4 && Enemy, AnimElemTime(8) < -1
trigger6 = Enemy, StateNo = 3550 && Enemy, Time >= 4 && Enemy, Time < 43
time = 1
color = 0
mul = 192,0,256

[State 17000, Hide during level 3 super spark]
type = AssertSpecial
trigger1 = Root, StateNo = 3300 && Root, Time >= 4 &&  Root, AnimElemTime(6) < 0
trigger2 = Enemy, StateNo = 3200 && Enemy, Time >= 4 && Enemy, AnimElemTime(4) < 0
flag = Invisible
ignoreHitPause = 1

[State 17000, Super pause flag reset]
type = VarSet
trigger1 = 1
var(10) = 0

[State 17000, Super pause flag on]
type = VarSet
trigger1 = Root, StateNo = 750 || Enemy, StateNo = 750
trigger2 = (Root, StateNo = 900 || Root, StateNo = 905) && Root, NumHelper(8400) && Root, Time < 30
trigger3 = (Enemy, StateNo = 900 || Enemy, StateNo = 905) && Enemy, NumHelper(8400) && Enemy, Time < 30
trigger4 = (Root, StateNo = 3000 || Root, StateNo = 3050) && Root, Time >= 4 && Root, AnimElemTime(4) < 0
trigger5 = (Root, StateNo = 3100 || Root, StateNo = 3150) && Root, Time >= 4 && Root, AnimElemTime(4) < 0
trigger6 = Root, StateNo = 3200 && Root, Time >= 4 && Root, AnimElemTime(3) < -1
trigger7 = Root, StateNo = 3250 && Root, Time >= 4 && Root, AnimElemTime(4) < -1
trigger8 = (Enemy, StateNo = 3000 || Enemy, StateNo = 3050) && Enemy, Time >= 4 && Enemy, Time < 43
trigger9 = (Enemy, StateNo = 3100 || Enemy, StateNo = 3150) && Enemy, Time >= 4 && Enemy, AnimElemTime(8) < -1
trigger10 = (Enemy, StateNo = 3500 || Enemy, StateNo = 3550) && Enemy, Time >= 4 && Enemy, Time < 43
trigger11 = Root, StateNo = 3300 && Root, Time >= 4 &&  Root, AnimElemTime(6) < 0
trigger12 = Enemy, StateNo = 3200 && Enemy, Time >= 4 && Enemy, AnimElemTime(4) < 0
var(10) = 1

[State 17000, PosSet]
type = PosSet
trigger1 = !Time && !PrevStateNo
x = Parent, fvar(0)
y = Parent, fvar(1)
ignoreHitPause = 1

[State 17000, Delta Set]
type = PosSet
trigger1 = Parent, fvar(5) != 1
x = ceil(Parent, pos x * Parent, fvar(5))
ignoreHitPause = 1

[State 17000, Scale]
type = AngleDraw
trigger1 = 1
scale = Parent, fvar(10), Parent, fvar(11)
ignoreHitPause = 1

[State 17000, Stand to crouching/Crouching to stand start]
type = ChangeAnim
trigger1 = Random < 150 && Time && Time % 120 = 0 && RoundState < 3
trigger1 = (Anim = [17000,17002]) || (Anim = [17010,17012])
trigger1 = !var(1) && !var(2) && !var(3) && !var(10)
value = ifElse((Anim = [17000,17002]), 17009, 17013)
ignoreHitPause = 1

[State 17000, Stand to crouching/Crouching to stand end]
type = ChangeAnim
trigger1 = Anim = 17009 || Anim = 17013
trigger1 = !AnimTime
value = ifElse(Anim = 17009, 17011, 17001)
ignoreHitPause = 1

[State 17000, Nodding timer on]
type = VarSet
trigger1 = (Anim = [17000,17002]) || (Anim = [17040,17042])
trigger1 = (Root, StateNo = [1000,3999]) && (Root, MoveHit || Root, var(18) = 2) && Enemy, MoveType = H && !var(1)
trigger2 = (Anim = [17000,17002]) || (Anim = [17040,17042])
trigger2 = ((Root, StateNo = 1510 || Root, StateNo = 1540 || Root, StateNo = 3210 || Root, StateNo = 3260) && Root, AnimElem = 1) && !var(1)
trigger3 = (Anim = [17010,17012]) || (Anim = [17050,17052])
trigger3 = (Enemy, StateNo = [1000,3999]) && (Enemy, MoveHit || Enemy, var(45) = 2) && Root, MoveType = H && !var(1) && Enemy, StateNo != 1070 && Enemy, StateNo != 3210
trigger4 = (Anim = [17010,17012]) || (Anim = [17050,17052])
trigger4 = ((Enemy, StateNo = 1070 && Enemy, AnimElem = 4) || ((Enemy, StateNo = 1520 || Enemy, StateNo = 1560) && Enemy, AnimElem = 6) || (Enemy, StateNo = 3210 && Enemy, AnimElem = 6)) && !var(1)
var(1) = ifElse((Anim = [17000,17002]) || (Anim = [17040,17042]), 1, -1)
ignoreHitPause = 1

[State 17000, ChangeAnim (nodding start)]
type = ChangeAnim
trigger1 = (Anim = [17000,17002]) || (Anim = [17040,17042]) || (Anim = [17010,17012]) || (Anim = [17050,17052])
trigger1 = abs(var(1)) > 0
value = ifElse((Anim = [17000,17002]) || (Anim = [17040,17042]), 17201, 17211)
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 17000, ChangeAnim (nodding)]
type = ChangeAnim
trigger1 = (Anim = [17200,17202]) || (Anim = [17210,17212])
trigger1 = abs(var(1)) >= 4
value = ifElse((Anim = [17200,17202]), 17206, 17216)
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 17000, ChangeAnim (nodding end)]
type = ChangeAnim
trigger1 = (Anim = [17205,17207]) || (Anim = [17215,17217])
trigger1 = abs(var(1)) >= 8
value = ifElse((Anim = [17205,17207]), 17201, 17211)
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 17000, ChangeAnim (nodding end)]
type = ChangeAnim
trigger1 = (Anim = [17200,17202]) || (Anim = [17210,17212])
trigger1 = abs(var(1)) >= 18
value = ifElse((Anim = [17200,17202]), 17001, 17011)
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 17000, Nodding timer reset]
type = VarSet
triggerAll = abs(var(1)) >= 18
trigger1 = var(1) > 0 && Enemy, MoveType != H
trigger2 = var(1) < 0 && Root, MoveType != H
var(1) = 0
ignoreHitPause = 1

[State 17000, Wincing timer on]
type = VarSet
trigger1 = ((Anim = [17000,17002]) || (Anim = [17040,17042])) && !var(2)
trigger1 = ((Enemy, MoveHit = [1,2]) || Enemy, var(45) = 2) && Enemy, StateNo != 1070 && Enemy, StateNo != 3210
trigger2 = ((Anim = [17000,17002]) || (Anim = [17040,17042])) && !var(2)
trigger2 = (Enemy, StateNo = 810 && Enemy, AnimElem = 5) || (Enemy, StateNo = 820 && Enemy, AnimElem = 9)
trigger3 = ((Anim = [17000,17002]) || (Anim = [17040,17042])) && !var(2)
trigger3 = (Enemy, StateNo = 1070 && (Enemy, AnimElem = 4)) || ((Enemy, StateNo = 1520 || Enemy, StateNo = 1560) && Enemy, AnimElem = 6) || (Enemy, StateNo = 3210 && Enemy, AnimElem = 6)
trigger4 = ((Anim = [17010,17012]) || (Anim = [17050,17052])) && !var(2)
trigger4 = ((Root, MoveHit = [1,2]) || Root, var(18) = 2)
trigger5 = ((Anim = [17010,17012]) || (Anim = [17050,17052])) && !var(2)
trigger5 = (Root, StateNo = 810 && Root, AnimElem = 9) || (Root, StateNo = 820 && Root, AnimElemTime(5) = 1)|| (Root, StateNo = 861 && Root, Time = 1)
trigger6 = ((Anim = [17010,17012]) || (Anim = [17050,17052])) && !var(2)
trigger6 = (Root, StateNo = 1510 && (Root, AnimElem = 1 || Root, AnimElem = 16)) || (Root, StateNo = 1540 && (Root, AnimElem = 1 || Root, AnimElem = 20)) || (Root, StateNo = 3210 && (Root, AnimElem = 1 || Root, AnimElem = 25)) || (Root, StateNo = 3260 && (Root, AnimElem = 1 || Root, AnimElem = 36))
var(2) = ifElse((Anim = [17000,17002]) || (Anim = [17040,17042]), 1, -1)
ignoreHitPause = 1

[State 17000, ChangeAnim (wincing)]
type = ChangeAnim
trigger1 = (Anim = [17000,17002]) || (Anim = [17040,17042]) || (Anim = [17010,17012]) || (Anim = [17050,17052])
trigger1 = abs(var(2)) > 0
value = ifElse((Anim = [17000,17002]) || (Anim = [17040,17042]), 17101, 17111)
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 17000, ChangeAnim (wincing end)]
type = ChangeAnim
trigger1 = (Anim = [17100,17102]) || (Anim = [17110,17112])
trigger1 = abs(var(2)) >= 20
value = ifElse((Anim = [17100,17102]), 17106, 17116)
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 17000, ChangeAnim (wincing end)]
type = ChangeAnim
trigger1 = (Anim = [17105,17107]) || (Anim = [17115,17117])
trigger1 = abs(var(2)) >= 21
value = ifElse((Anim = [17105,17107]), 17001, 17011)
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 17000, Wincing timer reset]
type = VarSet
triggerAll = abs(var(2)) >= 21
trigger1 = var(2) > 0 && Enemy, MoveHit != 1
trigger2 = var(2) < 0 && Root, MoveHit != 1
var(2) = 0
ignoreHitPause = 1

[State 17000, Looking up timer on]
type = VarSet
trigger1 = Anim = [17000,17002]
trigger1 = Root, StateType = A && !var(3)
trigger2 = Anim = [17010,17012]
trigger2 = Enemy, StateType = A && !var(3)
var(3) = ifElse((Anim = [17000,17002]), 1, -1)
ignoreHitPause = 1

[State 17000, ChangeAnim (looking up)]
type = ChangeAnim
trigger1 = (Anim = [17000,17002]) || (Anim = [17010,17012])
trigger1 = abs(var(3)) > 0
value = ifElse((Anim = [17000,17002]), 17041, 17051)
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 17000, ChangeAnim (looking up end)]
type = ChangeAnim
trigger1 = (Anim = [17040,17042]) || (Anim = [17050,17052])
trigger1 = abs(var(3)) >= 19
value = ifElse((Anim = [17040,17042]), 17001, 17011)
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 17000, Looking up timer reset]
type = VarSet
triggerAll = abs(var(3)) >= 19
trigger1 = var(3) > 0 && Root, StateType != A
trigger2 = var(3) < 0 && Enemy, StateType != A
var(3) = 0
ignoreHitPause = 1

[State 17000, Head direction (Standing)]
type = VarSet
trigger1 = (Anim = [17000,17002]) || (Anim = [17040,17042]) || (Anim = [17100,17102]) || (Anim = [17105,17107]) || (Anim = [17200,17202]) || (Anim = [17205,17207])
var(0) = ifElse(Root, pos x - pos x < -125, 0, ifElse(Root, pos x - pos x > 125, 2, 1))

[State 17000, ChangeAnim (Standing)]
type = ChangeAnim
trigger1 = (Anim = [17000,17002]) && Anim % 17000 != var(0)
value = 17000 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Standing, looking up)]
type = ChangeAnim
trigger1 = (Anim = [17040,17042]) && Anim % 17040 != var(0)
value = 17040 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Standing, wincing)]
type = ChangeAnim
trigger1 = (Anim = [17100,17102]) && Anim % 17100 != var(0)
value = 17100 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Standing, wince end)]
type = ChangeAnim
trigger1 = (Anim = [17105,17107]) && Anim % 17105 != var(0)
value = 17105 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Standing, nod start)]
type = ChangeAnim
trigger1 = (Anim = [17200,17202]) && Anim % 17200 != var(0)
value = 17200 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Standing, nodding)]
type = ChangeAnim
trigger1 = (Anim = [17205,17207]) && Anim % 17205 != var(0)
value = 17205 + var(0)
elem = AnimElemNo(0)

[State 17000, Head direction (Sitting)]
type = VarSet
trigger1 = (Anim = [17010,17012]) || (Anim = [17050,17052]) || (Anim = [17110,17112]) || (Anim = [17115,17117]) || (Anim = [17210,17212]) || (Anim = [17215,17217])
var(0) = ifElse(Enemy, pos x - pos x < -125, 0, ifElse(Enemy, pos x - pos x > 125, 2, 1))

[State 17000, ChangeAnim (Sitting)]
type = ChangeAnim
trigger1 = (Anim = [17010,17012]) && Anim % 17010 != var(0)
value = 17010 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Sitting, looking up)]
type = ChangeAnim
trigger1 = (Anim = [17050,17052]) && Anim % 17050 != var(0)
value = 17050 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Sitting, wincing)]
type = ChangeAnim
trigger1 = (Anim = [17110,17112]) && Anim % 17110 != var(0)
value = 17110 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Sitting, wince end)]
type = ChangeAnim
trigger1 = (Anim = [17115,17117]) && Anim % 17115 != var(0)
value = 17115 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Sitting, nod start)]
type = ChangeAnim
trigger1 = (Anim = [17210,17212]) && Anim % 17210 != var(0)
value = 17210 + var(0)
elem = AnimElemNo(0)

[State 17000, ChangeAnim (Sitting, nodding)]
type = ChangeAnim
trigger1 = (Anim = [17215,17217]) && Anim % 17215 != var(0)
value = 17215 + var(0)
elem = AnimElemNo(0)

[State 17000, Nodding timer]
type = VarAdd
trigger1 = var(1) && !var(10)
trigger1 = (Anim = [17200,17202]) || (Anim = [17210,17212]) || (Anim = [17205,17207]) || (Anim = [17215,17217])
var(1) = ifElse(var(1) > 0, 1, -1)
ignoreHitPause = 1

[State 17000, Wincing timer]
type = VarAdd
trigger1 = var(2) && !var(10)
trigger1 = (Anim = [17100,17102]) || (Anim = [17110,17112]) || (Anim = [17105,17107]) || (Anim = [17115,17117])
var(2) = ifElse(var(2) > 0, 1, -1)
ignoreHitPause = 1

[State 17000, Looking up timer]
type = VarAdd
trigger1 = var(3) && !var(10)
trigger1 = (Anim = [17040,17042]) || (Anim = [17050,17052])
var(3) = ifElse(var(3) > 0, 1, -1)
ignoreHitPause = 1

[State 17000, Freeze Anim]
type = ChangeAnim
trigger1 = var(10)
value = Anim
elem = ifElse(Anim = 17009 || Anim = 17013, AnimElemNo(0), AnimElemNo(0) - 1)

[State 7000, End]
type = DestroySelf
trigger1 = !Root, NumHelper(7000)



;====<EXPLODSIVE BUFFERING HELPER>=
[StateDef 90000005]
type = A
physics = N
moveType = I
anim = 1
velSet = 0,0
ctrl = 0

[State 90000005, Turn]
type = Turn
trigger1 = (Root, NumExplod(94646464) || Root, NumExplod(92468246)) && !var(0)
trigger2 = !Root, NumExplod(94646464) && !Root, NumExplod(92468246) && var(0)
ignoreHitPause = 1

[State 90000005, Reverse Left/Right]
type = VarSet
trigger1 = (Root, NumExplod(94646464) || Root, NumExplod(92468246)) && !var(0)
var(0) = 1
ignoreHitPause = 1

[State 90000005, Reset Turn Variable]
type = VarSet
trigger1 = !Root, NumExplod(94646464) && !Root, NumExplod(92468246) && var(0)
var(0) = 0
ignoreHitPause = 1

[State 90000005, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = 1
text = "by JustMorphPointman"
ignoreHitPause = 1