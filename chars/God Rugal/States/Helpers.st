; _________________________________________
;| Rugal by varo_hades                     |
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

;=<REPPUKEN PROJECTILE>=
[StateDef 1005]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1005
value = 1005

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 1005, VelSet]
type = VelSet
trigger1 = 1 && var(40) = 0
x = ifelse(var(10)=2, 6.65, ifelse(var(10)=1, 5.33, 4))

[State 1005, VelSet]
type = VelSet
trigger1 = 1 && var(40) = 1
x = ifelse(var(10)=2, 6.95, ifelse(var(10)=1, 5.83, 4.5))

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
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Root, StateNo != 193
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 15
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = ifelse(var(20), -4.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
airGuard.velocity = -5, -1.5
airGuard.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1006
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[State 1005, End]
type = DestroySelf
trigger1 = pos x != [-300,300]

;Hit Pause
[StateDef 1006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
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
var(15) = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(var(12) < 2 && var(10) = 3, 1035, 1007)

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
channel = 3
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

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;=<EX REPPUKEN PROJECTILE>=
[StateDef 1035]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
sprPriority = 3

[State 1035, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifElse(var(2) < 2, 1035, 1007)
ignoreHitPause = 1

[State 1035, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1035, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1005 && !PrevStateNo
value = 1005

[State 1035, VarAdd]
type = VarAdd
trigger1 = !Time
var(2) = 1

[State 1035, VelSet]
type = VelSet
trigger1 = 1 && var(40) = 0
x = 7.25

[State 1035, VelSet]
type = VelSet
trigger1 = 1 && var(40) = 1
x = 8.25

[State 1035, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

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

[State 1035, Hit 1]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = var(2) < 2
attr = S, SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 57 < 7, 7, fvar(11) * 57)), 15
getPower = 0, 0
givePower = 36, 36
pauseTime = 0 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -8.52
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1035, Hit 2]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = var(2) >= 2
attr = S, SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 47 < 7, 7, fvar(11) * 47)), 15
getPower = 0, 0
givePower = 36, 36
pauseTime = 0 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0 * (var(2) < 2), ifElse((Root, var(20)), 6, 12)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
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

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1035, HitSpark]
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
persistent = 0
ignoreHitPause = 1

[State 1035, Counter FX]
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
persistent = 0
ignoreHitPause = 1

[State 1035, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1035, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1035, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1
persistent = 0

[State 1035, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = ifElse(var(2) < 2, 1035, 1007)
ignoreHitPause = 1

[State 1035, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[State 1035, End]
type = DestroySelf
trigger1 = pos x != [-300,300]

;====<GENOCIDE CUTTER EFFECTS>=
[Statedef 1191]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-51

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 1180 && parent,animelemtime(5) >= 0
trigger1 = parent,stateno = 1180 && parent,animelemtime(6) < 0
value = 3190
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 1180 && parent,animelemtime(6) >= 0
trigger1 = parent,stateno = 1180 && parent,animelemtime(7) < 0
value = 3190
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 1180 && parent,animelemtime(7) >= 0
trigger1 = parent,stateno = 1180 && parent,animelemtime(8) < 0
value = 3190
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 1180 && parent,animelem = 8
value = 3190
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 1180
trigger3 = parent,stateno = 1180 && parent,time = 1

;=<KAISER WAVE>==
[Statedef 1305]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1390
sprpriority = 3

[State 1005, HitOverride]
type = hitoverride
trigger1 = parent,var(10) <= 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1306

[State 1005, HitOverride]
type = hitoverride
trigger1 = parent,var(10) > 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifelse((var(2) <= 1),1305,1306)
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = 5.4
y = 0

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = prevstateno != 1307
trigger1 = time = 0
value = 1300,4
channel = -1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = prevstateno != 1307
trigger1 = time = 0
value = 1300,5
channel = -1
freqmul = 2.0

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
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = parent,var(10) = 1
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 87 < 7, 7, fvar(11) * 87)), 15
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 8)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 2)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
airGuard.velocity = -5, -1.5
airGuard.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
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

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 3 || Root, var(20))
trigger1 = parent,var(10) = 2
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 57 < 7, 7, fvar(11) * 57)), 15
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 8)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 4)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
airGuard.velocity = -5, -1.5
airGuard.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
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

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 4 || Root, var(20))
trigger1 = parent,var(10) = 3
attr = S,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 47 < 7, 7, fvar(11) * 47)), 15
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 8)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 6)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = ifelse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
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

[State 3005, end]
type = changestate
trigger1 = movecontact
value = ifelse(var(2)<((root,var(10))),1307,1306)

[State 1005, End]
type = destroyself
trigger1 = pos x != [-300,300]

;explosion
[Statedef 1306]
type = S
movetype = I
physics = N
ctrl = 0
velset = 0,0
anim = 1391
movehitpersist = 1

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
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

[State 1035, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1035, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1035, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1300,1330]
var(18) = 1
persistent = 0

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---Hitpause---
[Statedef 1307]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
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
pos = 20, 0
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
pos = 20, 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1035, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1035, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1035, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1300,1330]
var(18) = 1
persistent = 0

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add

[State 0, PosFreeze]
type = PosFreeze
trigger1 = time <= 4
value = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time > 5
value = 1305
ignorehitpause = 1

;====<KAISER HAND FX>=
[Statedef 1315]
type = A
velset = 0,0
anim = 1395
sprpriority = 5

[State 0, Nothitby]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, BindToParent]
type = BindToParent
trigger1 = time < 18
time = 1
pos = -65,-91

[State 0, BindToParent]
type = BindToParent
trigger1 = time = [18,20]
time = 1
pos = -74,-81

[State 0, BindToParent]
type = BindToParent
trigger1 = time = [21,44]
time = 1
pos = -72,-61

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 8500, scale]
type = angledraw
trigger1 = time < 18
scale = .15,.15
persistent = 1

[State 8500, scale]
type = angledraw
trigger1 = time = [18,20]
scale = .15,.15
persistent = 1

[State 8500, scale]
type = angledraw
trigger1 = time = [21,44]
scale = .25,.25
persistent = 1

[State 8500, scale]
type = angledraw
trigger1 = time >= 45
scale = .4,.4
persistent = 1

[State 8500, assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 1150, ChangeState]
type = DestroySelf
trigger1 = parent,anim != 1300
trigger2 = parent,animelem = 29

;=<EX KAISER WAVE>==
[Statedef 1335]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1390
sprpriority = 3

[State 1005, HitOverride]
type = hitoverride
trigger1 = parent,var(10) <= 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1306

[State 1005, HitOverride]
type = hitoverride
trigger1 = parent,var(10) > 1
attr = SCA,AA,AP,AT
time = -1
stateno = ifelse((var(2) <= 1),1335,1336)
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = 10.4
y = 0

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = prevstateno != 1337
trigger1 = time = 0
value = 1300,4
channel = -1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = prevstateno != 1337
trigger1 = time = 0
value = 1300,5
channel = -1
freqmul = 2.0

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
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = parent,var(10) = 1
attr = S,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 97 < 7, 7, fvar(11) * 97)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 8)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 2)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
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

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 3 || Root, var(20))
trigger1 = parent,var(10) = 2
attr = S,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 67 < 7, 7, fvar(11) * 67)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 8)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 4)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
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

[State 1005, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 4 || Root, var(20))
trigger1 = parent,var(10) = 3
attr = S,SP
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 57 < 7, 7, fvar(11) * 57)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 8)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 6)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
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

[State 3005, end]
type = changestate
trigger1 = movecontact
value = ifelse(var(2)<((root,var(10))),1337,1336)

[State 1005, End]
type = destroyself
trigger1 = pos x != [-300,300]

;explosion
[Statedef 1336]
type = S
movetype = I
physics = N
ctrl = 0
velset = 0,0
anim = 1391
movehitpersist = 1

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
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

[State 1035, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1035, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1035, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1300,1330]
var(18) = 1
persistent = 0

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---Hitpause---
[Statedef 1337]
type = A
physics = N
movetype = A
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
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
pos = 20, 0
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
pos = 20, 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1035, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1035, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1
persistent = 0

[State 1035, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1300,1330]
var(18) = 1
persistent = 0

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add

[State 0, PosFreeze]
type = PosFreeze
trigger1 = time <= 4
value = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time > 5
value = 1335
ignorehitpause = 1

;====<BEADS DESTRUCTION EFFECTS>=
[Statedef 1495]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-51

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 1480 && parent,animelemtime(31) >= 0
trigger1 = parent,stateno = 1480 && parent,animelemtime(32) < 0
value = 3190
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 1480 && parent,animelemtime(32) >= 0
trigger1 = parent,stateno = 1480 && parent,animelemtime(33) < 0
value = 3190
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 1480 && parent,animelemtime(33) >= 0
trigger1 = parent,stateno = 1480 && parent,animelemtime(34) < 0
value = 3190
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 1480 && parent,animelem = 34
value = 3190
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 1480
trigger3 = parent,stateno = 1480 && parent,time = 1

;====<DARK BARRIER PROJECTILE>=
[Statedef 1505]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1590
sprpriority = 4
velset = 0,0

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

[State 1505, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1505, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1590
value = 1590

[State 1505, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1505, 0]
type = Bindtoparent
trigger1 = 1
pos = 60,-55
postype = p1

[State 1505, 1]
type = AngleDraw
trigger1 = Time <= 5
scale = .2*Time,.2*Time

[State 1505, 1]
type = Trans
trigger1 = 1
trans = add

[State 1505, Damage Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1505, Miss]
type = HitDef
trigger1 = 1
attr = S, SP
hitFlag =
sparkXY = -10,0

[State 1505, 2]
type = Projectile
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !parent,fvar(18)
trigger1 = root,ProjcontactTime(1500) != 1
trigger1 = Time >= 5
projanim = 1591
Projhitanim = -1
Projremanim = -1
Projremovetime = 1
offset = 0, 0
projpriority = 1
projsprpriority = 7
attr = S, SP
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 15
priority = 7, Hit
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := 0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = ifElse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yaccel = ifElse(var(20),.5,.6)
fall = 1
fall.recover = 1
fall.recoverTime = 120
getPower = 0,0
givePower = 36, 36
envshake.time = 10
envshake.ampl = 3
ProjID = 1500
persistent = 1
ignorehitpause = 0

[State 1505, HitSound]
type = PlaySnd
trigger1 = (root,ProjHitTime(1500) = 1) && numenemy
value = 2,6
channel = 3
ignorehitPause = 1
persistent = 0

[State 1505, HitSound]
type = PlaySnd
trigger1 = (root,ProjGuardedTime(1500) = 1) && numenemy
value = 3,0
channel = 3
ignorehitPause = 1
persistent = 0

[State 1505, HitSpark]
type = Helper
trigger1 = (root,ProjHitTime(1500) = 1) && numenemy
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = 10, 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 1505, BlockSpark]
type = Helper
trigger1 = (root,ProjGuardedTime(1500) = 1) && numenemy
helperType = Normal
stateNo = 8001
ID = 8000
name = "Spark"
posType = P1
pos = 10, 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 1505, Counter FX]
type = Helper
trigger1 = (root,ProjHitTime(1500) = 1) && numenemy && var(9)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = 10, 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1505, End]
type = changestate
trigger1 = parent,anim = 1501
trigger2 = root,ProjContactTime(1500) = 1
value = 1506
ignorehitpause = 1

[State 1505, End]
type = destroyself
trigger1 = parent,anim = [5000,5300]
trigger2 = !parent,var(10) && parent,time = 46
trigger3 = parent,var(10) = 1 && parent,time = 69
trigger4 = parent,var(10) = 2 && parent,time = 81
trigger5 = parent,fvar(18)
trigger6 = parent,movetype = H
 
;dark barrier fade fx
[Statedef 1506]
type = A
movetype = I
physics = N
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1506, Nothitby]
type = NotHitBy
trigger1 = 1
value = SCA

type = AngleDraw
trigger1 = 1
scale = .2*(5-Time),.2*(5-Time)

[State 1506, Trans]
type = Trans
trigger1 = 1
trans = add

[State 1506, End]
type = DestroySelf
trigger1 = time = 5

;hitoverride
[Statedef 1507]
type = A
movetype = I
physics = N
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1507, movehitvar]
type = varset
trigger1 = time = 0
var(5) = 1
ignorehitpause = 1

[State 1507, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1507, Nothitby]
type = NotHitBy
trigger1 = 1
value = SCA

[State -3, Helper]
type = Helper
trigger1 = time = 1
ID = 1510
name = "reflect"
pos = 0,0
postype = P1
stateno = 1510
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 1507, 1]
type = ChangeState
trigger1 = numhelper(1510) = 1
value = 1506

;projectile
[Statedef 1510]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1595
sprpriority = 3

[State 1505, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1511
ignoreHitPause = 1

[State 1505, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1510, VelSet]
type = VelSet
trigger1 = 1
x = 5.4
y = 0

[State 1510, Anim]
type = changeanim
trigger1 = anim != 1595
value = 1595

[State 1510, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1510, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1510, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1000,1
channel = -1

[State 1510, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target,ishelper)
var(5) = 1
ignorehitpause = 1

[State 1510, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10,0

[State 1510, Proj]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = 1
attr = S, SP
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 15
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
hitflag = MAF
guardflag = MA
priority = 4, Hit
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -71
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = ifelse(var(20), -4.36, -8.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
airGuard.velocity = -5, -1.5
airGuard.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
envshake.time = 20
envshake.freq = 100
envshake.ampl = 4
sprpriority = 4
forcestand = 1

[State 1510, End]
type = changestate
trigger1 = movecontact
value = 1512
ignorehitpause = 1

[State 1510, End]
type = destroyself
trigger1 = pos x != [-300,300]

;explosion
[Statedef 1511]
type = A
movetype = I
physics = N
ctrl = 0
velset = 0,0
anim = 1596

[State 1511, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .5,1

[State 1511, Trans]
type = Trans
trigger1 = 1
trans = add

[State 1511, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1511, DestroySelf]
type = removeexplod
trigger1 = 1

[State 1511, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---Hitpause---
[Statedef 1512]
type = A
movetype = I
physics = N
ctrl = 0
sprpriority = 3
moveHitPersist = 1

[State 1512, freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 1512, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1512, HitSpark]
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

[State 1512, Counter FX]
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

[State 1512, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1512, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1512, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1512, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1500,1530]
var(18) = 1

[State 1512, end]
type = changestate
trigger1 = time >= 0
value = 1511

;====<EX DARK BARRIER PROJECTILE>=
[Statedef 1535]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1590
sprpriority = 4
velset = 0,0

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
trigger1 = Anim != 1590
value = 1590

[State 1535, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1535, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1535, 0]
type = Bindtoparent
trigger1 = 1
pos = 60,-55
postype = p1

[State 1535, 1]
type = AngleDraw
trigger1 = Time <= 5
scale = .2*Time,.2*Time

[State 1535, 1]
type = Trans
trigger1 = 1
trans = add

[State 1535, Damage Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1505, Miss]
type = HitDef
trigger1 = 1
attr = S, SP
hitFlag =
sparkXY = -10,0

[State 1535, 2]
type = Projectile
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = !parent,fvar(18)
trigger1 = root,ProjcontactTime(1530) != 1
trigger1 = Time >= 5
projanim = 1591
Projhitanim = -1
Projremanim = -1
Projremovetime = 1
offset = 0, 0
projpriority = 2
projsprpriority = 7
attr = S, SP
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 87 < 7, 7, fvar(11) * 87)), 15
priority = 7, Hit
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := 0
animType = Hard
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -8.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = 0.36, -9.5
air.cornerPush.velOff = 0
yaccel = .6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
getPower = 0,0
givePower = 36, 36
envshake.time = 10
envshake.ampl = 3
ProjID = 1530
persistent = 1
ignorehitpause = 0

[State 1535, HitSound]
type = PlaySnd
trigger1 = (root,ProjHitTime(1530) = 1) && numenemy
value = 2,6
channel = 3
ignorehitPause = 1
persistent = 0

[State 1535, HitSound]
type = PlaySnd
trigger1 = (root,ProjGuardedTime(1530) = 1) && numenemy
value = 3,0
channel = 3
ignorehitPause = 1
persistent = 0

[State 1535, HitSpark]
type = Helper
trigger1 = (root,ProjHitTime(1530) = 1) && numenemy
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = 10, 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 1535, BlockSpark]
type = Helper
trigger1 = (root,ProjGuardedTime(1530) = 1) && numenemy
helperType = Normal
stateNo = 8001
ID = 8000
name = "Spark"
posType = P1
pos = 10, 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1
persistent = 0

[State 1535, Counter FX]
type = Helper
trigger1 = (root,ProjHitTime(1530) = 1) && numenemy && var(9)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = 10, 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1535, End]
type = changestate
trigger1 = parent,anim = 1531
trigger2 = root,ProjContactTime(1530) = 1
value = 1536
ignorehitpause = 1

[State 1535, End]
type = destroyself
trigger1 = parent,anim = [5000,5300]
trigger2 = parent,time = 100
trigger3 = parent,fvar(18)
trigger4 = parent,movetype = H

;dark barrier fade fx
[Statedef 1536]
type = A
movetype = I
physics = N
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1536, Nothitby]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1536, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .2*(5-Time),.2*(5-Time)

[State 1536, Trans]
type = Trans
trigger1 = 1
trans = add

[State 1536, End]
type = DestroySelf
trigger1 = time = 5

;hitoverride
[Statedef 1537]
type = A
movetype = I
physics = N
ctrl = 0
sprpriority = 4
velset = 0,0

[State 1537, movehitvar]
type = varset
trigger1 = time = 0
var(5) = 1
ignorehitpause = 1

[State 1537, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1537, Nothitby]
type = NotHitBy
trigger1 = 1
value = SCA

[State -3, Helper]
type = Helper
trigger1 = time = 1
ID = 1540
name = "reflect"
pos = 0,0
postype = P1
stateno = 1540
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 1537, 1]
type = ChangeState
trigger1 = numhelper(1540) = 1
value = 1536

;projectile
[Statedef 1540]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1595
sprpriority = 3

[State 1540, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1541
ignoreHitPause = 1

[State 1540, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1540, VelSet]
type = VelSet
trigger1 = 1
x = 7.4
y = 0

[State 1540, Anim]
type = changeanim
trigger1 = anim != 1595
value = 1595

[State 1540, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1540, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1540, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1540, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1000,1
channel = -1

[State 1540, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target,ishelper)
var(5) = 1
ignorehitpause = 1

[State 1540, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10,0

[State 1540, Proj]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = 1
attr = S, SP
damage = ceil(ifElse(fvar(11) * 87 < 7, 7, fvar(11) * 87)), 15
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
hitflag = MAF
guardflag = M
priority = 4, Hit
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -71
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
fall = 1
fall.recover = 1
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
envshake.time = 20
envshake.freq = 100
envshake.ampl = 4
sprpriority = 4
forcestand = 1

[State 1510, End]
type = changestate
trigger1 = movecontact
value = 1542
ignorehitpause = 1

[State 1510, End]
type = destroyself
trigger1 = pos x != [-300,300]

;explosion
[Statedef 1541]
type = A
movetype = I
physics = N
ctrl = 0
velset = 0,0
anim = 1596

[State 1541, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = .5,1

[State 1541, Trans]
type = Trans
trigger1 = 1
trans = add

[State 1541, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1541, DestroySelf]
type = removeexplod
trigger1 = 1

[State 1541, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---Hitpause---
[Statedef 1542]
type = A
movetype = I
physics = N
ctrl = 0
sprpriority = 3
moveHitPersist = 1

[State 1542, freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 1542, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1542, HitSpark]
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

[State 1542, Counter FX]
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

[State 1542, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1542, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1542, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1542, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1500,1530]
var(18) = 1

[State 1542, end]
type = changestate
trigger1 = time >= 0
value = 1541

;====<DARK SMASH FX>=
[Statedef 1608]
type = A
physics = N
movetype = I
anim = 1392
ctrl = 0
velset = 0,0
sprpriority = 5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = Root,StateNo = 1600
time = 1
pos = -20,-89
ignorehitpause = 1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = Root,StateNo = 1630
time = 1
pos = -20,-89
ignorehitpause = 1

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -50
ignorehitpause = 1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1,1
ignorehitpause = 1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 8500, assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3005, End]
type = destroyself
trigger1 = root, Stateno != 1600 && root, StateNo != 1630|| Root, MoveType = H
ignorehitpause = 1

;====<DARK SMASH FX>=
[Statedef 1690]
type = A
velset = 0,0
anim = 1690
sprpriority = 5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 0, BindToParent]
type = BindToParent
trigger1 = 1
time = 1
pos = 10,-95

[State 0, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256,256

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -50

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <=8
scale = 0+(time*.0625),0+(time*.0625)

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time >8
scale = .5,.5

[State 8500, assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 1150, ChangeState]
type = DestroySelf
trigger1 = parent,anim !=[1650,1680]
trigger2 = parent,vel x !=0

;=<GIGANTIC PRESSURE FX>==
[Statedef 3090]
type = S
movetype = I
physics = N
velset = 0,0
ctrl = 0
anim = 1
sprpriority = 1

[State 1100, Fire1]
type = Explod
trigger1 = time = 0
Anim = 3090
id = 3090
pos = 0,0
postype = p1
ownpal = 1
sprpriority = 5
removetime = -2
supermovetime = -1
removeongethit = 1
scale = .75,.75

[State 1100, Fire1]
type = Explod
trigger1 = time = 0
Anim = 3091
pos = 0,-128
postype = p1
ownpal = 0
removetime = -2
sprpriority = 6
supermovetime = -1
removeongethit = 1
scale = .5,.5

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time >44
ID =  3090
scale = .75-((time-44)*.125),1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 =1
flag = noshadow

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time >= 50

[State 1205, ChangeState]
type = destroyself
trigger1 = time >= 50

;====<GENOCIDE HEAVEN EFFECTS>=
[Statedef 3140]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-51

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(5) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(6) < 0
value = 3190
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(6) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(7) < 0
value = 3190
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(7) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(8) < 0
value = 3190
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelem = 8
value = 3190
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 3100
trigger3 = parent,stateno = 3100 && parent,time = 1

;====<GENOCIDE HEAVEN EFFECTS>=
[Statedef 3141]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-51

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(13) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(14) < 0
value = 3191
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(14) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(15) < 0
value = 3191
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(15) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(16) < 0
value = 3191
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelem = 16
value = 3191
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 3100
trigger3 = parent,stateno = 3100 && parent,time = 1

;====<GENOCIDE HEAVEN EFFECTS>=
[Statedef 3143]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-81

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(22) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(23) < 0
value = 3193
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(23) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(24) < 0
value = 3193
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(24) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(25) < 0
value = 3193
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelem = 25
value = 3193
elem = 4
persistent = 0

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && !parent,var(5) && parent,animelem = 35
trigger2 = parent,stateno = 3100 && parent,var(5) && parent,animelem = 32
value = 3194
elem = 1
persistent = 0

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = anim = 3194 && animtime = 0
trigger2 = parent,stateno != 3100
trigger3 = parent,stateno = 3100 && parent,animelem = 35
trigger4 = parent,stateno = 3100 && parent,time = 1

;====<GENOCIDE HEAVEN EFFECTS>=
[Statedef 3144]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-81

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(35) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(36) < 0
value = 3195
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelemtime(36) >= 0
trigger1 = parent,stateno = 3100 && parent,animelemtime(37) < 0
value = 3195
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelem = 37
value = 3195
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3100 && parent,animelem = 40
value = 3196
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = anim = 3196 && animtime = 0
trigger2 = parent,stateno != 3100
trigger3 = parent,stateno = 3100 && parent,time = 1

;====<MAX GENOCIDE HEAVEN EFFECTS>=
[Statedef 3190]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-51

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(5) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(6) < 0
value = 3190
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(6) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(7) < 0
value = 3190
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(7) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(8) < 0
value = 3190
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelem = 8
value = 3190
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 3150
trigger3 = parent,stateno = 3150 && parent,time = 1

;====<MAX GOD RUGAL GENOCIDE HEAVEN EFFECTS>=
[Statedef 31900]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-51

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(5) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(6) < 0
value = 3190
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(6) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(7) < 0
value = 3190
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(7) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(8) < 0
value = 3190
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelem = 8
value = 3190
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 3160
trigger3 = parent,stateno = 3160 && parent,time = 1

;====<MAX GENOCIDE HEAVEN EFFECTS>=
[Statedef 3191]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-51

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(13) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(14) < 0
value = 3191
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(14) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(15) < 0
value = 3191
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(15) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(16) < 0
value = 3191
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelem = 16
value = 3191
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 3150
trigger3 = parent,stateno = 3150 && parent,time = 1

;====<MAX GOD RUGAL GENOCIDE HEAVEN EFFECTS>=
[Statedef 31910]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-51

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(13) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(14) < 0
value = 3191
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(14) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(15) < 0
value = 3191
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(15) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(16) < 0
value = 3191
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelem = 16
value = 3191
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 3160
trigger3 = parent,stateno = 3160 && parent,time = 1

;====<MAX GENOCIDE HEAVEN EFFECTS>=
[Statedef 3193]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-81

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(22) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(23) < 0
value = 3193
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(23) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(24) < 0
value = 3193
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(24) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(25) < 0
value = 3193
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelem = 25
value = 3193
elem = 4
persistent = 0

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && !parent,var(5) && parent,animelem = 35
trigger2 = parent,stateno = 3150 && parent,var(5) && parent,animelem = 32
value = 3194
elem = 1
persistent = 0

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = anim = 3194 && animtime = 0
trigger2 = parent,stateno != 3150
trigger3 = parent,stateno = 3150 && parent,animelem = 35
trigger4 = parent,stateno = 3150 && parent,time = 1

;====<MAX GOD RUGAL GENOCIDE HEAVEN EFFECTS>=
[Statedef 31930]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-81

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(22) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(23) < 0
value = 3193
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(23) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(24) < 0
value = 3193
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(24) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(25) < 0
value = 3193
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelem = 25
value = 3193
elem = 4
persistent = 0

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && !parent,var(5) && parent,animelem = 35
trigger2 = parent,stateno = 3160 && parent,var(5) && parent,animelem = 32
value = 3194
elem = 1
persistent = 0

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = anim = 3194 && animtime = 0
trigger2 = parent,stateno != 3160
trigger3 = parent,stateno = 3160 && parent,animelem = 35
trigger4 = parent,stateno = 3160 && parent,time = 1

;====<MAX GENOCIDE HEAVEN EFFECTS>=
[Statedef 3194]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-81

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(35) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(36) < 0
value = 3195
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(36) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(37) < 0
value = 3195
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelem = 37
value = 3195
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelem = 40
value = 3196
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = anim = 3196 && animtime = 0
trigger2 = parent,stateno != 3150
trigger3 = parent,stateno = 3150 && parent,time = 1

;====<MAX GOD RUGAL GENOCIDE HEAVEN EFFECTS>=
[Statedef 31940]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-81

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(35) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(36) < 0
value = 3195
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(36) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(37) < 0
value = 3195
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelem = 37
value = 3195
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelem = 40
value = 3196
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = anim = 3196 && animtime = 0
trigger2 = parent,stateno != 3160
trigger3 = parent,stateno = 3160 && parent,time = 1

;====<MAX GENOCIDE HEAVEN EFFECTS>=
[Statedef 3195]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-81

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(50) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(50) < 1
value = 3190
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(50) >= 1
trigger1 = parent,stateno = 3150 && parent,animelemtime(51) < 0
value = 3190
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(51) >= 0
trigger1 = parent,stateno = 3150 && parent,animelemtime(51) < 2
value = 3190
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3150 && parent,animelemtime(51) = 2
value = 3190
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 3150
trigger3 = parent,stateno = 3150 && parent,time = 1

;====<MAX GOD RUGAL GENOCIDE HEAVEN EFFECTS>=
[Statedef 31950]
type = A
movetype = I
physics = N
ctrl = 0
anim = 1
velset = 0,0
ownpal = 1
sprpriority = 3

[State 1505,0]
type = BindToRoot
trigger1 = 1
pos = 38,-81

[State 9000, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(50) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(50) < 1
value = 3190
elem = 1
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(50) >= 1
trigger1 = parent,stateno = 3160 && parent,animelemtime(51) < 0
value = 3190
elem = 2
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(51) >= 0
trigger1 = parent,stateno = 3160 && parent,animelemtime(51) < 2
value = 3190
elem = 3
persistent = 1

[State 0]
type = changeanim
trigger1 = parent,stateno = 3160 && parent,animelemtime(51) = 2
value = 3190
elem = 4
persistent = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent,stateno != 3160
trigger3 = parent,stateno = 3160 && parent,time = 1

;====<SHOCK>=
[Statedef 3240]
type = A
velset = 0,0
anim = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time%10 = 0
value = 5,9
ignorehitpause = 1

[State 6250, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 6250, flames]
type = explod
trigger1 = Time%3 = 0
anim = 7300+random%2
ID = 7300
sprpriority = 5
postype = p2
vel = -.2,-.75
pos = (enemynear,const(size.mid.pos.x))+random%30,(enemynear,const(size.mid.pos.y)-30)+random%60
random = 40,40
removetime = -2
scale = .2,.2
ownpal = 1
bindtime = 1

[State 6250, PosAdd]
type = PosAdd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)

[State 6250, DestroySelf]
type = DestroySelf
trigger1 = time >= 60
trigger2 = enemynear,ctrl ||(enemynear,movetype != H) || (enemynear,statetype = L)

;====<KAISER PHOENIX PROJECTILE>=
[Statedef 3241]
type = S
physics = N
moveType = A
ctrl = 0
anim = 3290
sprPriority = 3

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = Root,StateNo = 1300
time = 1
pos = -20,-89
ignorehitpause = 1

[State 0, BindToRoot]
type = BindToRoot
trigger1 = Root,StateNo = 3200
time = 1
pos = -73,-69
ignorehitpause = 1

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -50
ignorehitpause = 1

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1,1
ignorehitpause = 1

[State 0, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 8500, assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3005, End]
type = destroyself
trigger1 = root, Stateno != 1300 && root, StateNo != 3200 || Root, MoveType = H
ignorehitpause = 1

;====<KAISER PHOENIX PROJECTILE>=
[Statedef 3260]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1605
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 3270
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = 12.5

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S, HP
hitFlag =
sparkXY = -10,0

[State 1005, Hit]
type = Hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
trigger1 = 1
attr = S, HP
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 57 < 7, 7, fvar(11) * 57)), 25
animtype = Hard
pausetime = 1,12
guard.pauseTime = 1,12
sparkno = -1
guard.sparkno = -1
guardsound = s3,0
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -6
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2, -5.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forcestand = 1
getpower = 0,0
givepower = 36,36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
persistent = 0
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(9))
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
persistent = 1
ignoreHitPause = 1

[State 1035, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3200,3290]
var(18) = 1

[State 3005, End]
type = changestate
trigger1 = MoveContact
value = 3270

[State 3005, End]
type = destroyself
trigger1 = pos x != [-300,300]

;====<KAISER PHOENIX PROJECTILE>=
[Statedef 3261]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1605
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 3270
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = 13

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S, HP
hitFlag =
sparkXY = -10,0

[State 1005, Hit]
type = Hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 3 || Root, var(20))
trigger1 = 1
attr = S, HP
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 47 < 7, 7, fvar(11) * 47)), 25
pausetime = 1,12
guard.pauseTime = 1,12
sparkno = -1
guard.sparkno = -1
guardsound = s3,0
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -6
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -3, -5.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forcestand = 1
getpower = 0,0
givepower = 36,36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
persistent = 0
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(9))
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
persistent = 1
ignoreHitPause = 1

[State 1035, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3200,3290]
var(18) = 1

[State 3005, End]
type = changestate
trigger1 = MoveContact
value = 3270

[State 3005, End]
type = destroyself
trigger1 = pos x != [-300,300]

;====<KAISER PHOENIX PROJECTILE>=
[Statedef 3262]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1605
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 3270
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = 12

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256,256
ignorehitpause = 1

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S, HP
hitFlag =
sparkXY = -10,0

[State 1005, Hit]
type = Hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 4 || Root, var(20))
trigger1 = 1
attr = S, HP
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 57 < 7, 7, fvar(11) * 57)), 25
pausetime = 1,12
guard.pauseTime = 1,12
sparkno = -1
guard.sparkno = -1
guardsound = s3,0
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -6
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -5.2
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
fall.recoverTime = 120
forcestand = 1
getpower = 0,0
givepower = 36,36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4

[State 1035, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
persistent = 0
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(9))
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
persistent = 1
ignoreHitPause = 1

[State 1035, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1
persistent = 0

[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1
persistent = 0

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [3200,3290]
var(18) = 1

[State 3005, End]
type = changestate
trigger1 = MoveContact
value = 3270

[State 3005, End]
type = destroyself
trigger1 = pos x != [-300,300]

;=<ReppuKen End>==
[Statedef 3270]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 3270
ID = 3270
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 2
ownpal = 1

[State 1006, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target,HitShakeOver)

;====<RASHOUMON AURA>=
;--- Looping ---
[Statedef 3555]
type = A
physics = N
movetype = I
anim = 1
velset = 0, 0

[State 3255, Bind]
type = bindtoroot
trigger1 = 1
pos = 0, 0

[State 3255, FX]
type = explod
trigger1 = !numexplod(1)
anim = 3555
ID = 1
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 3255, FX]
type = explod
trigger1 = !numexplod(2)
anim = 3556
ID = 2
sprpriority = -1
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
ownpal = 1

;--- PURPLE ---
[Statedef 7181]
physics = N
velset = 0, 0
anim = 1
sprpriority = 4

[State 7181, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 7181, flames]
type = explod
trigger1 = 1
anim = 7181
ID = 7181
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
removetime = -2
scale = 0.5, 0.5
ownpal = 1

[State 7181, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)

[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H || enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])

[State End]
type = destroyself
trigger1 = !numenemy || time >= 120

;=<ELECTRIFIED FX>===
[Statedef 7300]
type = A
movetype = A
physics = N
ctrl = 0
anim = 1
sprpriority = 5
velset = 0,0
juggle = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = (gametime%20) = 1
value = 2000,12
channel = -1

[State 0, PosSet]
type = velset
trigger1 = 1
x = p2dist x
y = (p2dist y)

[State 901:Assertspecial]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 901:playerpush]
type = PlayerPush
trigger1 = 1
value = 0
persistent = 1

[State 1710, FireB]
type = Explod
triggerall = p2movetype = H
trigger1 = numexplod(7300) < 1
ignorehitpause = 1
anim = 7301
id = 7300
scale = 0.55,0.55
postype = p2
pos=((enemynear,const(size.mid.pos.x))+5),(enemynear,const(size.mid.pos.y))+(ifelse((enemynear,statetype != A),15,7))
random = 70,60
bindtime = -1
sprpriority = 2
ownpal = 1
removetime = 15

[State 1710, FireA]
type = Explod
triggerall = p2movetype = H
trigger1 = numexplod(7300) < 1
ignorehitpause = 1
anim = 7301
id = 7300
scale = 0.55,0.55
postype = p2
pos=((enemynear,const(size.mid.pos.x))+25),(enemynear,const(size.mid.pos.y))+(ifelse((enemynear,statetype != A),15,7))
random = 70,60
bindtime = -1
sprpriority = 2
ownpal = 1
removetime = 15

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time>=(ifelse(enemynear,statetype != A ,30,120))
trigger2 = enemynear,ctrl || (enemynear,movetype!=H) || (enemynear,statetype=L)
trigger3 = (root,stateno = [200,999]) && (root,movecontact)
trigger4 = (root,stateno = [3000,3999]) && (root,movecontact)

[State 901:destroyself]
type = destroyself
trigger1 = time>=(ifelse(enemynear,statetype != A ,30,120))
trigger2 = enemynear,ctrl || (enemynear,movetype!=H) || (enemynear,statetype=L)
trigger3 = (root,stateno = [200,999]) && (root,movecontact)
trigger4 = (root,stateno = [3000,3999]) && (root,movecontact)

;====<KANJI>=
[Statedef 7070]
physics = N
velset = 0, 0
anim = 7070
sprpriority = 7

[state 6000, Shadow]
type = changeanim
trigger1 = root, anim = 187
value = 7070
elem = 3

[State 6012, glow]
type = palfx
trigger1 = !time
time = 9999
add = 50, 0, 0
sinadd = 100, 0, 0, 80

[State 6021, Particles]
type = helper
trigger1 = 1
Stateno = 7072
pos = -15 + (random % 30), 10 - (random % 40)
size.xscale = 0.25
size.yscale = 0.25

[state 6000, Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[Statedef 7072]
physics = N
anim = 6021 + (random % 4)
sprpriority = 7

[State 6021, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6021, Assert]
type = assertspecial
trigger1 = !time
flag = invisible

[State 6012, Sprpriority]
type = Sprpriority
trigger1 = var(12) = 2
value = 7

[State 6021, Vel]
type = veladd
trigger1 = 1
x = 0
y = -0.25

[State 6021, End]
type = destroyself
trigger1 = !animtime

;====<BLACK KANJI>=
[Statedef 7075]
physics = N
velset = 0, 0
anim = 7075
sprpriority = 6

[state 6000, Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[state 6000, Shadow]
type = changeanim
trigger1 = root, anim = 187
value = 7075
elem = 3

[State 6012, destroyself]
type = destroyself
trigger1 = root, stateno = 3501 && time = 73

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
anim = 8020
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
anim = 8021
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
anim = 8022
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
anim = 8023
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
anim = 8024
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
anim = 8030
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
anim = 8031
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
anim = 8032
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
anim = 8033
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

;Super Hit Spark(Last Judgement)
[StateDef 8018]
type = A
physics = N
moveType = I
anim = 8030
velSet = 0,0
sprPriority = 5

[State 8018, BindToRoot]
type = BindToRoot
triggerAll = (Root,StateNo=3501) && (Root,AnimElemTime(2) > 0) && (Root,AnimElemTime(16) < 0)
trigger1 = !Time
pos = (Random % 40) * ifElse(Random % 2, -1, 1) + 26, -50 - (Random % 40) * ifElse(Random % 2, -1, 1)
facing = 1

[State 8018, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8018, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8018, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8018, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8018, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8018, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8018, Center Explod]
type = Explod
triggerAll = (Root,StateNo=3501)
trigger1 = !Time
anim = 8030
ID = 10
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8018, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
trigger1 = Time < 10
ID = 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8018, Center Explod]
type = Explod
triggerAll = (Root,StateNo=3501)
trigger1 = !Time
anim = 8031
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8018, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8018, Streaks Explod]
type = Explod
triggerAll = (Root,StateNo=3501)
trigger1 = !Time
anim = 8032
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8018, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8018, P2 Back Explod]
type = Explod
triggerAll = (Root,StateNo=3501)
trigger1 = !Time
anim = 8033
ID = 3
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8018, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8018, Impact Explod]
type = Explod
triggerAll = (Root,StateNo=3501)
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
onTop = 1

[State 8018, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8018, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8018, End]
type = DestroySelf
trigger1 = Time >= 16

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

[State 200, Voice]
type = PlaySnd
trigger1 = !Time
value = 820, 2
channel = 0

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

[State 200, Voice]
type = PlaySnd
trigger1 = !Time
value = 820, 2
channel = 0

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

;====<BURN FX>=
[Statedef 8180]
physics=N
velset=0,0
anim=1
sprpriority=4

[State 7180, assert]
type=assertspecial
trigger1= 1
flag=noshadow
ignorehitpause=1

[State 7180, flames]
type=explod
trigger1= 1
anim=7180
ID=7180
sprpriority=3
postype=p2
vel=-.2,-.75
pos=(enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))+(ifelse((enemynear,statetype != A),-5,10))
random=40,40
removetime=-2
scale=(.3-(.001*time)),(.3-(.001*time))
ownpal=0

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1
ID = 7180
trans=addalpha
alpha=220,256

[State 7180, pos]
type=posadd
trigger1= 1
x=ceil(p2dist x)
y=ceil(p2dist y)

[State 7180, end]
type=destroyself
trigger1= time>=(ifelse(enemynear,statetype != A ,30,120))
trigger2= enemynear,ctrl || (enemynear,movetype!=H) || (enemynear,statetype=L)
trigger3 = (root,stateno = [200,999]) && (root,movecontact)
trigger4 = (root,stateno = [3000,3999]) && (root,movecontact)

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
pos = 5,0

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

[State 8600, Super Moves Finish Sound]
type = PlaySnd
trigger1 = !Time
value = 8600,2
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

[State 8600, Move Name: Gigantic Pressure]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3000,3099])
var(0) = 2

[State 8600, Move Name: Genocide Heaven]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 3

[State 8600, Move Name: Kaiser Phoenix]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3200,3299])
var(0) = 4

[State 8600, Move Name: Destruction Omega]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3300,3399])
var(0) = 5

[State 8600, Move Name: Dead End Screamer]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3400,3499])
var(0) = 6

[State 8600, Move Name: Last Judgement]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3500,3599])
var(0) = 7

[State 8600, Move Name: God End]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3600,3699])
var(0) = 8

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
