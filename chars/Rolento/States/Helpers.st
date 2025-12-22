; _________________________________________
;| Rolento by Jmorphman                    |
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



;=<GRENADE (LOSE)>=
[StateDef 10170]
type = A
physics = N
moveType = I
ctrl = 0
anim = ifElse(Root, Anim = 171, 10171, 3103)
sprPriority = 3

[State 10170, VelSet]
type = VelSet
trigger1 = !Time && Anim != 10171
y = -7.75

[State 10170, VelAdd]
type = VelAdd
trigger1 = Time > 0 && Anim = [3103,3104]
y = 1

[State 10170, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 17 && Anim = 3103
value = 3104
elem = AnimElemNo(0)

[State 10170, ChangeAnim]
type = ChangeAnim
trigger1 = pos y > -vel y
value = 10181

[State 10170, VelSet]
type = VelSet
trigger1 = Anim = 10181
y = 0

[State 10170, PosSet]
type = PosSet
trigger1 = Anim = 10181
y = 0

[State 10170, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 10181 && AnimElemTime(1) = 1
trigger2 = Anim = 10171 && !AnimTime
value = 1

[State 10170, PosSet]
type = PosSet
trigger1 = Anim = 1
x = ceil(Root, pos x)
y = ceil(Root, pos y) + (Root, const(size.mid.pos.y))

[State 10170, Flame Explod 1]
type = Explod
trigger1 = Anim = 1
anim = 8150
sprPriority = 3
posType = P1
random = 40,40
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 10170, Flames Explod 2]
type = Explod
trigger1 = Anim = 1
anim = 8150
sprPriority = 3
posType = P1
random = 60,60
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 10170, End]
type = DestroySelf
trigger1 = Root, Anim = 5100



;=<GRENADE (WIN)>=
[StateDef 10181]
type = A
physics = N
moveType = I
ctrl = 0
anim = 3103
sprPriority = 3

[State 10181, ChangeAnim]
type = ChangeAnim
triggerAll = pos y > -vel y
trigger1 = Time >= 34
trigger2 = Time >= 10 && Root, fvar(0) < 100
trigger3 = Time >= 20 && Root, fvar(0) < 150
value = 10181

[State 10181, VelSet]
type = VelSet
trigger1 = !Time
x = Root, fvar(0) * 0.02
y = -2.5

[State 10181, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 35
trigger2 = Time = 11 && Root, fvar(0) < 100
trigger3 = Time = 21 && Root, fvar(0) < 150
value = 3104
elem = AnimElemNo(0)

[State 10181, Hit ground detection]
type = VarSet
trigger1 = 1
var(0) = 0

[State 10181, Hit ground detection]
type = VarSet
trigger1 = pos y > -vel y && Anim = [3103,3104]
var(0) = 1

[State 10181, VelAdd]
type = VelAdd
trigger1 = Time > 0 && Anim = [3103,3104]
trigger1 = !var(0)
y = 0.75

[State 10181, VelMul]
type = VelMul
trigger1 = var(0)
y = -0.55

[State 10181, VelSet]
type = VelSet
trigger1 = Anim = 10181
y = 0

[State 10181, PosSet]
type = PosSet
trigger1 = Anim = 10181
trigger2 = var(0)
y = 0

[State 10181, Explosion sound]
type = PlaySnd
trigger1 = Anim = 10181 && AnimElemTime(1) = 1
value = 2,3100
channel = 2

[State 10181, Explosion 1]
type = Explod
trigger1 = Anim = 10181 && AnimElemTime(1) = 1
anim = 3106
sprPriority = 1
scale = 0.5,0.5
posType = P1
pos = 0, -25
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
persistent = 0

[State 10181, Explosion 2]
type = Explod
trigger1 = Anim = 10181 && AnimElemTime(1) = 1
anim = 3106
sprPriority = 1
scale = 0.5,0.5
posType = P1
pos = 60, -29
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
persistent = 0

[State 10181, Explosion 3]
type = Explod
trigger1 = Anim = 10181 && AnimElemTime(1) = 1
anim = 3106
sprPriority = 1
scale = 0.5,0.5
posType = P1
pos = 10, -78
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
persistent = 0

[State 10181, ChangeAnim]
type = DestroySelf
trigger1 = Anim = 10181 && !AnimTime
trigger2 = Time >= 50



;=<HOLLY WOOD (KNIFE STAB)>=
[StateDef 10182]
type = A
physics = N
moveType = I
ctrl = 0
anim = ifElse(Root, var(10) = 3, 10185, 10182)
sprPriority = 1

[State 10182, ChangeAnim]
type = ChangeAnim
trigger1 = Root, var(10) < 3
trigger1 = AnimElemTime(5) >= 0
value = 10182
elem = 5

[State 10182, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1



;=<HOLLY WOOD (HOOK, INTRO)>=
[StateDef 10184]
type = A
physics = N
moveType = I
ctrl = 0
anim = 10184
sprPriority = 1

[State 10184, DestroySelf]
type = DestroySelf
trigger1 = !AnimTime

[State 10184, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1



;=<EL GADO (KNIFE STAB)>=
[StateDef 11182]
type = A
physics = N
moveType = I
ctrl = 0
anim = ifElse(Root, var(10) = 3, 11185, 11182)
sprPriority = 1

[State 11182, ChangeAnim]
type = ChangeAnim
trigger1 = Root, var(10) < 3
trigger1 = AnimElemTime(5) >= 0
value = 11182
elem = 5

[State 11182, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1



;=<KNIVES (INTRO VS. HIBIKI)>=
[StateDef 10191]
type = A
physics = N
moveType = I
ctrl = 0
anim = 10191
sprPriority = 3

[State 10191, BindToRoot]
type = BindToRoot
trigger1 = AnimElem = 7 && Anim = 10191
pos = ceil(34 * (Root, const(size.xscale))),ceil(-41 * (Root, const(size.yscale)))

[State 10191, VelSet]
type = VelSet
trigger1 = AnimElem = 7 && Anim = 10191
x = (P2Dist x) * 0.0325
y = 4

[State 10191, VelAdd]
type = VelAdd
trigger1 = Anim = 1109
y = 0.2

[State 10191, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 30
value = 1109
elem = 4

[State 10191, VelSet]
type = VelSet
trigger1 = Time = 30
x = 0.5
y = -4

[State 10191, Deflected sound]
type = PlaySnd
trigger1 = Time = 30
value = 1109,0

[State 10191, ChangeAnim]
type = ChangeState
trigger1 = pos y > -vel y && Anim = 1109
value = 1110



;=<KNIVES (INTRO VS. MAKI)>=
[StateDef 10192]
type = A
physics = N
moveType = I
ctrl = 0
anim = 10192
sprPriority = 3

[State 10192, BindToRoot]
type = BindToRoot
trigger1 = AnimElem = 3 && Anim = 10192
pos = ceil(34 * (Root, const(size.xscale))),ceil(-41 * (Root, const(size.yscale)))

[State 10192, VelSet]
type = VelSet
trigger1 = AnimElem = 3 && Anim = 10192
x = (P2Dist x) * 0.0325
;x = 6.25
y = 3.9375

[State 10192, VelAdd]
type = VelAdd
trigger1 = Anim = 1109
y = 0.2

[State 10192, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 19
value = 1109
elem = 4

[State 10192, VelSet]
type = VelSet
trigger1 = Time = 19
x = 0.5
y = -4

[State 10192, Deflected sound]
type = PlaySnd
trigger1 = Time = 19
value = 1109,0

[State 10192, ChangeAnim]
type = ChangeState
trigger1 = pos y > -vel y && Anim = 1109
value = 1110



;=<GRENADE (TAUNT)>=
[StateDef 10195]
type = A
physics = N
moveType = I
ctrl = 0
anim = 3103
sprPriority = 3

[State 10195, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(P2Dist x * 0.0125 < 0.1, 0.1, P2Dist X * 0.0125)
y = -2.5

[State 10195, ChangeAnim]
type = ChangeAnim
trigger1 = pos y > -vel y
trigger1 = Time >= 36
value = 10195

[State 10195, Hit ground detection]
type = VarSet
trigger1 = 1
var(0) = 0

[State 10195, Hit ground detection]
type = VarSet
trigger1 = pos y > -vel y && Anim = 3103
var(0) = 1

[State 10195, VelAdd]
type = VelAdd
trigger1 = Time > 0 && Anim = 3103
trigger1 = !var(0)
y = 0.75

[State 10195, VelMul]
type = VelMul
trigger1 = var(0)
y = -0.55

[State 10195, PosSet]
type = PosSet
trigger1 = var(0)
trigger1 = Anim = 10195
y = 0

[State 10195, VelSet]
type = VelSet
trigger1 = Anim = 10195
x = 0
y = 0

[State 10195, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 10195, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 10195, StateTypeSet: Attack]
type = StateTypeSet
trigger1 = Anim = 10195
moveType = A
ignoreHitPause = 1

[State 10195, Dud explosion]
type = Explod
trigger1 = Anim = 10195 && AnimElemTime(1) = 0
anim = 8100
sprPriority = 3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1

[State 10195, Dud explosion sound]
type = PlaySnd
trigger1 = Anim = 10195 && AnimElemTime(1) = 0
value = 195,2
channel = 1

[State 10195, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = Anim = 10195 && AnimElem = 2
attr = S,SP
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
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
ground.slideTime = 18
guard.hitTime = 18
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
palFX.time = 30
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
sprPriority = 3

[State 10195, Flame Particles]
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

[State 10195, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 10196
ignoreHitPause = 1

[State 10195, ChangeAnim]
type = DestroySelf
trigger1 = Anim = 10195 && !AnimTime


;Hit Pause
[StateDef 10196]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 10196, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 10196, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 5)
channel = 2
ignorehitPause = 1

[State 10196, HitSpark]
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

[State 10196, Counter FX]
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

[State 10196, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 10196, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 10196, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1

[State 10196, End]
type = ChangeState
trigger1 = Time >= 12
value = 1108



;=<GRENADES (DEADLY PACKAGE)>=
[StateDef 10820]
type = A
physics = N
moveType = I
ctrl = 0
anim = 10820
sprPriority = 3

[State 10820, PosAdd]
type = PosAdd
trigger1 = Root, AnimElem = 3
x = 10
y = -5

[State 10820, Explosion 1]
type = Explod
trigger1 = Time = 30
anim = 3106
sprPriority = 3
scale = 0.5,0.5
posType = P1
random = 50,50
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 10820, Explosion 2]
type = Explod
trigger1 = Time = 30
anim = 3106
sprPriority = 3
scale = 0.5,0.5
posType = P1
random = 50,50
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 10820, Explosion 3]
type = Explod
trigger1 = Time = 30
anim = 3106
sprPriority = 3
scale = 0.5,0.5
posType = P1
random = 50,50
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 10820, End]
type = DestroySelf
trigger1 = Time >= 30
trigger2 = Root, StateNo != 820



;=<HOLLY WOOD (GRENADE THROW)>=
[StateDef 13311]
type = A
physics = N
moveType = I
ctrl = 0
anim = 13311
sprPriority = 1

[State 13311, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 13311, Grenade]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 13313
ID = 13315
name = "Grenade (Patriot Sweeper)"
posType = P1
pos = ceil(4 * const(size.xScale)), ceil(74 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 13311, HitCount]
type = ParentVarAdd
trigger1 = NumHelper(13315)
trigger1 = var(13) > 0
var(13) = 1
persistent = 0

[State 13311, DestroySelf]
type = DestroySelf
trigger1 = !AnimTime



;=<EL GADO (GRENADE THROW)>=
[StateDef 23311]
type = A
physics = N
moveType = I
ctrl = 0
anim = 23311
sprPriority = 1

[State 23311, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 23311, Grenade]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 13313
ID = 13315
name = "Grenade (Patriot Sweeper)"
posType = P1
pos = ceil(4 * const(size.xScale)), ceil(74 * const(size.yScale))
size.xScale = const(size.xScale)
size.yScale = const(size.yScale)
ownPal = 1

[State 23311, HitCount]
type = ParentVarAdd
trigger1 = NumHelper(13315)
trigger1 = var(13) > 0
var(13) = 1
persistent = 0

[State 23311, DestroySelf]
type = DestroySelf
trigger1 = !AnimTime



;====<KNIFE (STINGER)>=
[StateDef 1105]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3

[State 1105, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1109
ignoreHitPause = 1

[State 1105, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1105, Button Detect]
type = VarSet
trigger1= !Time
var(10) = Root, var(10) % 1100 % 5

[State 1105, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1105 && Anim != 1115 && Anim != 1125
value = ifElse(var(10) = 2, 1125, ifElse(var(10), 1115, 1105))

[State 1105, VelSet]
type = VelSet
trigger1 = 1
x = ifElse(var(10) = 2, 6.25, ifElse(var(10), 5, 3.125))
y = ifElse(var(10) = 2, 3.9375, ifElse(var(10), 5, 6.25))

[State 1105, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1105, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1105, Projectile Flag On]
type = ParentVarSet
trigger1 = !Time
var(39) = 1

[State 1105, Miss]
type = HitDef
trigger1 = 1
attr = A,SP
hitFlag =
sparkXY = -10,0

[State 1105, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
ID = 1105
attr = A,SP
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hittime = 12
ground.slidetime = 12
guard.hittime = 12
air.hittime = 60
airguard.ctrltime = 16
down.hittime = 20
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
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
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 1105, Opponent Recover]
type = TargetState
trigger1 = NumTarget(1105)
trigger1 = Target, StateType = L
value = 11105
ID = 1105
ignoreHitPause = 1
persistent = 0

[State 1105, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 1105, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1109
ignoreHitPause = 1

[State 1105, Projectile Flag Off]
type = ParentVarSet
trigger1 = pos x != [-200,200]
var(39) = 0

[State 1105, Hit floor]
type = ChangeState
trigger1 = pos y >= 0
value = 1109

[State 1105, End]
type = DestroySelf
trigger1 = pos x != [-200,200]


;Hit Pause
[StateDef 1106]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1106, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1106, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 1106, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, ifElse(PrevStateNo = 3205, 8017, 8016))
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

[State 1106, Counter FX]
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

[State 1106, Blood]
type = Explod
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
anim = 8050
sprPriority = 3
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
ignoreHitPause = 1

[State 1106, HitCount]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(13) = 1

[State 1106, Juggle Points]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = !(HitDefAttr = SCA,AT) || PrevStateNo = [1135,1155]
var(15) = 1

[State 1106, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1106, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = 1101 || Root, StateNo = 1131
var(18) = 1

[State 1106, EX Stinger Juggle Count]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = PrevStateNo = [1135,1155]
var(28) = 1

[State 1106, Steel Rain Juggle Count]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
trigger1 = PrevStateNo = 3205
var(29) = 1

[State 1106, End]
type = ChangeState
trigger1 = Time >= 0
value = ifElse(MoveContact && NumTarget, 1107, 1109)


;Disappear
[StateDef 1107]
type = A
physics = N
moveType = A
anim = 1
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1107, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 2
volume = -128
lowPriority = 1

[State 1107, Projectile Flag Off]
type = ParentVarSet
trigger1 = !Time && var(10) < 3
var(39) = 0

[State 1107, Projectile Flag Off]
type = ParentVarAdd
trigger1 = !Time && var(10) >= 3
var(39) = -1

[State 1107, End]
type = ChangeState
trigger1 = Time = 12
value = 1108


;Wait
[StateDef 1108]
type = A
physics = N
moveType = I
anim = 1
ctrl = 0
velSet = 0,0

[State 1108, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target, HitShakeOver)


;Bounce off ground
[StateDef 1109]
type = A
physics = N
moveType = I
anim = 1109
ctrl = 0
sprPriority = 3

[State 1109, PosSet]
type = PosSet
trigger1 = !Time
trigger1 = pos y >= 0
y = 0

[State 1109, Bounce off floor sound]
type = PlaySnd
trigger1 = !Time
value = 1109,0

[State 1109, VelSet]
type = VelSet
trigger1 = !Time
x = 0.5
y = -8.75

[State 1109, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.8

[State 1108, ChangeState]
type = ChangeState
triggerAll = Time > 1
trigger1 = pos y > -vel y
value = 1110


;Second Rebound
[StateDef 1110]
type = A
physics = N
moveType = I
ctrl = 0
sprPriority = 3

[State 1110, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1110, VelSet]
type = VelSet
trigger1 = !Time
x = 0.25
y = -2.34

[State 1110, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.28

[State 1110, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = ceil(192 - (10.67 * Time)), ceil(64 + (10.67 * Time))
ignoreHitPause = 1

[State 1110, Projectile Flag Off]
type = ParentVarSet
triggerAll = Time > 1
trigger1 = pos y > -vel y
trigger1 = var(10) < 3
var(39) = 0

[State 1110, Projectile Flag Off]
type = ParentVarAdd
triggerAll = Time > 1
trigger1 = pos y > -vel y
trigger1 = var(10) >= 3
var(39) = -1

[State 1110, DestroySelf]
type = DestroySelf
triggerAll = Time > 1
trigger1 = pos y > -vel y



;Downed Gethit
[Statedef 11105]
type = L
moveType = H
physics = N
velSet = 0,0

[State 11105, VarSet]
type = VarSet
trigger1 = !Time
sysvar(2) = ifElse(GetHitVar(yVel) = 0, 5080, 5090)

[State 11105, VarAdd]
type = VarAdd
trigger1 = !Time
trigger1 = (Anim = [5081,5089]) || (Anim = [5111,5119])
trigger1 = SelfAnimExist(sysvar(2) + (anim % 10))
sysvar(2) = anim % 10

[State 11105, VarSet]
type = VarSet
trigger1 = !Time
trigger1 = sysvar(2) = 5090
trigger1 = !SelfAnimExist(5090)
sysvar(2) = 5030

[State 11105, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = sysvar(2)

[State 11105, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0
value = 11106

[State 11105, SelfState]
type = SelfState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yVel) != 0
value = 5030


;Knocked Back
[Statedef 11106]
type = L
moveType = H
physics = C

[State 11106, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 11106, VelSet]
type = VelSet
trigger1 = HitOver
x = 0

[State 11106, VarSet]
type = VarSet
trigger1 = !Time
sysvar(0) = 1

[State 11106, ChangeState]
type = ChangeState
trigger1 = HitOver && Alive
value = 11107

[State 11106, SelfState]
type = SelfState
trigger1 = HitOver && !Alive
value = 5150


;Lying Down
[StateDef 11107]
type = L
moveType = H
physics = N

[State 11107, EnvShake]
type = FallEnvShake
trigger1 = !Time

[State 11107, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5110 + (Anim % 10))
trigger1 = Anim = [5081,5089]
value = 5110 + (Anim % 10)
persistent = 0

[State 11107, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (Anim % 10))
value = 5170

[State 11107, ChangeAnim]
type = ChangeAnim
triggerAll = !Time
triggerAll = Anim != [5110,5119]
trigger1 = Anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (Anim % 10))
value = 5170 + (Anim % 10)

[State 11107, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 11107, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 11107, VarSet]
type = VarSet
trigger1 = !Time
trigger1 = GetHitVar(fall.yVel) != 0
sysvar(1) = floor(vel y)

[State 11107, PlaySnd]
type = PlaySnd
trigger1 = !Time
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 11107, Explod]
type = Explod
trigger1 = !Time
trigger1 = !SysVar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0,0
sprPriority = ifElse(sysvar(1) <= Const720p(56), -10, 10)

[State 11107, VelSet]
type = VelSet
trigger1 = Time = 0
y = 0

[State 11107, ChangeAnim]
type = ChangeAnim
triggerAll = Anim = [5171,5179]
triggerAll = SelfAnimExist(5110 + (Anim % 10))
trigger1 = !AnimTime
trigger2 = SysVar(0)
value = 5110 + (Anim % 10)
persistent = 0

[State 11107, ChangeAnim]
type = ChangeAnim
triggerAll = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0)
value = 5110
persistent = 0

[State 11107, SelfState]
type = SelfState
triggerAll = !Alive
trigger1 = !AnimTime
trigger2 = SysVar(0)
trigger3 = Anim = [5110,5119]
value = 5150

[State 11107, VarSet]
type = VarSet
trigger1 = SysVar(0)
trigger1 = !Time
sysvar(0) = 0

[State 11107, VelMul]
type = VelMul
trigger1 = 1
x = 0.85

[State 11107, VelSet]
type = VelSet
trigger1 = abs(vel x) < const(movement.down.friction.threshold)
x = 0
persistent = 0

[State 11107, SelfState]
type = SelfState
trigger1 = !Time
value = 5120



;====<KNIFE (EX STINGER, LOWER)>=
[StateDef 1135]
type = A
physics = N
moveType = A
ctrl = 0
anim = 1115
sprPriority = 3

[State 1135, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1109
ignoreHitPause = 1

[State 1135, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1135, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1115
value = 1115

[State 1135, Button Detect]
type = VarSet
trigger1= !Time
var(10) = 3

[State 1135, VelSet]
type = VelSet
trigger1 = 1
x = 5.95
y = 4.2375

[State 1135, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1135, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1135, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time
var(39) = 1

[State 1135, Miss]
type = HitDef
trigger1 = 1
attr = A,SP
hitFlag =
sparkXY = -10,0

[State 1135, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < (1 + Root, var(28)) || Root, var(20))
ID = 1135
attr = A,SP
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
down.hitTime = 20
ground.velocity = -5.40, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
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

[State 1135, Opponent Recover]
type = TargetState
trigger1 = NumTarget(1135)
trigger1 = Target, StateType = L
value = 11105
ID = 1135
ignoreHitPause = 1
persistent = 0

[State 1135, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 1135, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1109
ignoreHitPause = 1

[State 1135, Projectile Flag Off]
type = ParentVarAdd
trigger1 = pos x != [-200,200]
var(39) = -1

[State 1135, Hit floor]
type = ChangeState
trigger1 = pos y >= 0
value = 1109

[State 1135, End]
type = DestroySelf
trigger1 = pos x != [-200,200]



;====<KNIFE (EX STINGER, MIDDLE)>=
[StateDef 1145]
type = A
physics = N
moveType = A
ctrl = 0
anim = 1125
sprPriority = 3

[State 1145, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1109
ignoreHitPause = 1

[State 1145, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1145, Button Detect]
type = VarSet
trigger1= !Time
var(10) = 3

[State 1145, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1125
value = 1125

[State 1145, AngleSet]
type = AngleSet
trigger1 = 1
value = -8

[State 1145, AngleDraw]
type = AngleDraw
trigger1 = 1
ignoreHitPause = 1

[State 1145, VelSet]
type = VelSet
trigger1 = 1
x = 6.65
y = 3.4875

[State 1145, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1145, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1145, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time
var(39) = 1

[State 1145, Miss]
type = HitDef
trigger1 = 1
attr = A,SP
hitFlag =
sparkXY = -10,0

[State 1145, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < (1 + Root, var(28)) || Root, var(20))
ID = 1145
attr = A,SP
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
down.hitTime = 20
ground.velocity = -5.40, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
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

[State 1145, Opponent Recover]
type = TargetState
trigger1 = NumTarget(1145)
trigger1 = Target, StateType = L
value = 11105
ID = 1145
ignoreHitPause = 1
persistent = 0

[State 1145, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 1145, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1109
ignoreHitPause = 1

[State 1145, Projectile Flag Off]
type = ParentVarAdd
trigger1 = pos x != [-200,200]
var(39) = -1

[State 1145, Hit floor]
type = ChangeState
trigger1 = pos y >= 0
value = 1109

[State 1145, End]
type = DestroySelf
trigger1 = pos x != [-200,200]



;====<KNIFE (EX STINGER, UPPER)>=
[StateDef 1155]
type = A
physics = N
moveType = A
ctrl = 0
anim = 1125
sprPriority = 3

[State 1155, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1109
ignoreHitPause = 1

[State 1155, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1155, Button Detect]
type = VarSet
trigger1= !Time
var(10) = 3

[State 1155, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1125
value = 1125

[State 1155, VelSet]
type = VelSet
trigger1 = 1
x = 7.35
y = 2.7375

[State 1155, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1155, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1155, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time
var(39) = 1

[State 1155, Miss]
type = HitDef
trigger1 = 1
attr = A,SP
hitFlag =
sparkXY = -10,0

[State 1155, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < (1 + Root, var(28)) || Root, var(20))
ID = 1155
attr = A,SP
hitFlag = MAFD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
down.hitTime = 20
ground.velocity = -5.40, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yAccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
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

[State 1155, Opponent Recover]
type = TargetState
trigger1 = NumTarget(1155)
trigger1 = Target, StateType = L
value = 11105
ID = 1155
ignoreHitPause = 1
persistent = 0

[State 1155, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 1155, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1109
ignoreHitPause = 1

[State 1155, Projectile Flag Off]
type = ParentVarAdd
trigger1 = pos x != [-200,200]
var(39) = -1

[State 1155, Hit floor]
type = ChangeState
trigger1 = pos y >= 0
value = 1109

[State 1155, End]
type = DestroySelf
trigger1 = pos x != [-200,200]



;=<TRIPWIRE>=
[StateDef 3003]
type = A
physics = N
moveType = I
ctrl = 0
anim = ifElse(Root, StateNo = 3050, 3053, 3003)
sprPriority = 3

[State 3003, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 3003, BindToRoot]
type = BindToRoot
trigger1 = 1
time = -1
ignoreHitPause = 1

[State 3003, Tripwire position]
type = Null
trigger1 = Root, var(35) = [0,28)
trigger1 = var(0) := 1
trigger2 = Root, var(35) = [28,30)
trigger2 = var(0) := 2
trigger3 = Root, var(35) = [30,38)
trigger3 = var(0) := 3
trigger4 = Root, var(35) = [38,46)
trigger4 = var(0) := 4
trigger5 = Root, var(35) = [46,54)
trigger5 = var(0) := 5
trigger6 = Root, var(35) = [54,62)
trigger6 = var(0) := 6
trigger7 = Root, var(35) = [62,70)
trigger7 = var(0) := 7
trigger8 = Root, var(35) = [70,78)
trigger8 = var(0) := 8
trigger9 = Root, var(35) = [78,86)
trigger9 = var(0) := 9
trigger10 = Root, var(35) = [86,94)
trigger10 = var(0) := 10
trigger11 = Root, var(35) = [94,102)
trigger11 = var(0) := 11
trigger12 = Root, var(35) = [102,110)
trigger12 = var(0) := 12
trigger13 = Root, var(35) = [110,118)
trigger13 = var(0) := 13
trigger14 = Root, var(35) = [118,128)
trigger14 = var(0) := 14
trigger15 = Root, var(35) = [128,136)
trigger15 = var(0) := 15
trigger16 = Root, var(35) = [136,142)
trigger16 = var(0) := 16
trigger17 = Root, var(35) = [142,150)
trigger17 = var(0) := 17
trigger18 = Root, var(35) = [150,160)
trigger18 = var(0) := 18
trigger19 = Root, var(35) = [160,168)
trigger19 = var(0) := 19
trigger20 = Root, var(35) = [168,176)
trigger20 = var(0) := 20
trigger21 = Root, var(35) = [176,182)
trigger21 = var(0) := 21
trigger22 = Root, var(35) = [182,192)
trigger22 = var(0) := 22
trigger23 = Root, var(35) = [192,198)
trigger23 = var(0) := 23
trigger24 = Root, var(35) = [198,208)
trigger24 = var(0) := 24
trigger25 = Root, var(35) = [208,216)
trigger25 = var(0) := 25
trigger26 = Root, var(35) = [216,224)
trigger26 = var(0) := 26
trigger27 = Root, var(35) = [224,232)
trigger27 = var(0) := 27
trigger28 = Root, var(35) = [232,240)
trigger28 = var(0) := 28
trigger29 = Root, var(35) = [240,246)
trigger29 = var(0) := 29
trigger30 = Root, var(35) = [246,256)
trigger30 = var(0) := 30
trigger31 = Root, var(35) = [256,262)
trigger31 = var(0) := 31
trigger32 = Root, var(35) = [262,272)
trigger32 = var(0) := 32
trigger33 = Root, var(35) = [272,278)
trigger33 = var(0) := 33
trigger34 = Root, var(35) = [278,288)
trigger34 = var(0) := 34
trigger35 = Root, var(35) = [288,294)
trigger35 = var(0) := 35
trigger36 = Root, var(35) = [294,304)
trigger36 = var(0) := 36
trigger37 = Root, var(35) = [304,312)
trigger37 = var(0) := 37
trigger38 = Root, var(35) = [312,320)
trigger38 = var(0) := 38
trigger39 = Root, var(35) = [320,328)
trigger39 = var(0) := 39
trigger40 = Root, var(35) = [328,336)
trigger40 = var(0) := 40
trigger41 = Root, var(35) >= 336
trigger41 = var(0) := 41
trigger42 = Root, var(35) < 0
trigger42 = var(0) := -1

[State 3003, ChangeAnim]
type = ChangeAnim
trigger1 = Root, NumTarget && Root, MoveHit && var(0) > 0
value = 3012
elem = var(0)
ignoreHitPause = 1

[State 3003, ChangeAnim]
type = ChangeAnim
trigger1 = Root, NumTarget && Root, MoveHit && var(0) < 0
value = Anim
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 3003, End]
type = DestroySelf
trigger1 = Root, StateNo != 3000 && Root, StateNo != 3050
trigger2 = Root, StateNo = 3000 && Root, AnimElem = 38 && !(Root, MoveHit)
trigger3 = Root, StateNo = 3050 && Root, AnimElem = 27 && !(Root, MoveHit)
trigger4 = Root, MoveGuarded
trigger5 = Root, MoveHit && !(Root, NumTarget)



;=<GRENADE (MINE SWEEPER)>=
;Falling
[StateDef 3103]
type = A
physics = N
moveType = A
ctrl = 0
anim = 3103
sprPriority = 3

[State 3103, VelSet]
type = VelSet
trigger1 = Time = 1
x = 1.25
y = -17.5

[State 3103, VelAdd]
type = VelAdd
trigger1 = Time > 1
y = 1.953125

[State 3103, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y && Anim = 3103
value = 3105


;Hit floor
[StateDef 3105]
type = S
physics = N
moveType = A
anim = ifElse(Root, var(10), 3155, 3105)
ctrl = 0
sprPriority = 3
velSet = 1.875,0

[State 3105, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3105, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0

[State 3105, Hit floor sound]
type = PlaySnd
trigger1 = !Time
value = 3310,0
channel = 4

[State 3105, Explosion sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 2,3100
channel = 5

[State 3105, Explosion 1]
type = Explod
trigger1 = AnimElem = 11
anim = 3106
sprPriority = 3
scale = 0.5,0.5
posType = P1
pos = 0, -60
random = 125,100
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3105, Explosion 2]
type = Explod
trigger1 = AnimElem = 11
anim = 3106
sprPriority = 3
scale = 0.5,0.5
posType = P1
pos = 0, -60
random = 125,100
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3105, Explosion 3]
type = Explod
trigger1 = AnimElem = 11
anim = 3106
sprPriority = 3
scale = 0.5,0.5
posType = P1
pos = 0, -60
random = 125,100
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3105, Button Detect]
type = VarSet
trigger1= !Time
var(10) = Root, var(10)

[State 3105, Counter Flag]
type = VarSet
trigger1 = AnimElemTime(11) >= 0
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3105, Damage Dampener]
type = VarSet
trigger1 = AnimElemTime(11) >= 0
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3105, Miss]
type = HitDef
trigger1 = AnimElemTime(11) >= 0
attr = S,HP
hitFlag =
sparkXY = -10,0

[State 3105, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 + Root, var(28))
trigger1 = AnimElemTime(11) >= 0
attr = S,HP
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10), 77, 105) < 7, 7, fvar(11) * ifElse(var(10), 77, 105))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,4
guard.pauseTime = 0,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = 10.49, -4.49
ground.cornerPush.velOff = 0
guard.velocity = 9.52
guard.cornerPush.velOff = 0
air.velocity = 10.49, -3.69
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.xVelocity = 2.49
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
sparkXY = -10, -48
palFX.time = 24 + 3 * var(10)
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 3105, Flame Particles]
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

[State 3105, End]
type = ChangeState
trigger1 = MoveContact
value = 3106
ignoreHitPause = 1

[State 3105, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 3107
ignoreHitPause = 1

[State 3105, ChangeState]
type = DestroySelf
trigger1 = !AnimTime


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
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 5)
channel = 2
ignoreHitPause = 1

[State 3106, Hit Spark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < -64, -64, ifElse(P2Dist x < 64, ceil(P2Dist x), 64)), ceil(ifElse(P2Dist y > 0, P2Dist y, Target, const(size.mid.pos.y)))
facing = ifElse(PrevStateNo = 13315 && Root, var(10) = -1, 1, -1)
ownPal = 1
size.xScale = 1
size.yScale = 1
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
pos = ifElse(P2Dist x < -64, -64, ifElse(P2Dist x < 64, ceil(P2Dist x), 64)), ceil(ifElse(P2Dist y > 0, P2Dist y, Target, const(size.mid.pos.y)))
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
var(15) = 1

[State 3106, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 3106, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = 3100 || Root, StateNo = 3150
var(18) = 1

[State 3106, Mine Sweeper Juggle Count]
type = ParentVarAdd
trigger1 = !Time
trigger1 = MoveContact && NumTarget
var(28) = 1

[State 3106, End]
type = ChangeState
trigger1 = Time >= 0
value = 3107


;Disappear
[StateDef 3107]
type = A
physics = N
moveType = A
anim = 1
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 3107, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,5
channel = 2
volume = -128
lowPriority = 1

[State 3107, End]
type = ChangeState
trigger1 = Time > 6
value = 1108



;=<HOLLY WOOD (HOOK)>=
[StateDef 13010]
type = A
physics = N
moveType = I
ctrl = 0
anim = 13010
sprPriority = 3

[State 13010, PosSet]
type = PosSet
trigger1 = !Time
y = -ceil(ScreenPos y) - 16

[State 13010, DestroySelf]
type = DestroySelf
trigger1 = !AnimTime

[State 13010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1



;====<KNIVES (STEEL RAIN, INTRO)>=
[StateDef 3204]
type = A
physics = N
moveType = I
ctrl = 0
anim = 3204
sprPriority = 3

[State 3204, BindToRoot]
type = BindToRoot
trigger1 = AnimElemTime(12) < 1
time = 1
ignoreHitPause = 1

[State 3204, VelSet]
type = VelSet
trigger1 = AnimElemTime(12) = 1
y = -8.75

[State 3204, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(12) > 1
y = 0.10546875

[State 3204, DestroySelf]
type = DestroySelf
trigger1 = AnimElemTime(12) < 0 && Root, StateNo != 3200 && Root, StateNo != 3250
trigger2 = Time = 60



;====<KNIFE (STEEL RAIN, FALLING)>=
[StateDef 3205]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3

[State 3205, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1109
ignoreHitPause = 1

[State 3205, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 3205, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 3205
value = 3205

[State 3205, Button Detect]
type = VarSet
trigger1= !Time
var(10) = ifElse(Root, StateNo = 3250, 4, 3)

[State 3205, PosAdd]
type = PosAdd
trigger1 = !Time
y = -(Root, ScreenPos y) - 268.8125

[State 3205, VelSet]
type = VelSet
trigger1 = !Time
y = 10.3125

[State 3205, PosAdd]
type = PosAdd
trigger1 = !Time
x = Root, P2Dist x + 5 * (Root, StateNo = 3250)

[State 3205, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3205, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3205, Projectile Flag On]
type = ParentVarAdd
trigger1 = !Time
var(39) = 1

[State 3205, Miss]
type = HitDef
trigger1 = 1
attr = A,HP
hitFlag =
sparkXY = -10,0

[State 3205, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && Root, var(15) < (1 + Root, var(29))
ID = 3205
attr = A,HP
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 4, 35, 42) < 7, 7, fvar(11) * ifElse(var(10) = 4, 35, 42))), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0, 4
guard.pauseTime = 0, 4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hittime = 22
ground.slidetime = 22
guard.hittime = 22
air.hittime = 60
airguard.ctrltime = 16
down.hittime = 20
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerpush.veloff = 0
airguard.velocity = -5, 0
airguard.cornerpush.veloff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
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
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
sprPriority = 3

[State 3205, Opponent Recover]
type = TargetState
trigger1 = NumTarget(3205)
trigger1 = Target, StateType = L
value = 11105
ID = 3205
ignoreHitPause = 1
persistent = 0

[State 3205, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1106
ignoreHitPause = 1

[State 3205, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1109
ignoreHitPause = 1

[State 3205, Projectile Flag Off]
type = ParentVarSet
trigger1 = pos x != [-200,200]
var(39) = 0

[State 3205, Hit floor]
type = ChangeState
trigger1 = pos y >= 0
value = 1109

[State 3205, End]
type = DestroySelf
trigger1 = pos x != [-200,200]



;=<GRENADE (PATRIOT SWEEPER)>=
;Falling
[StateDef 13313]
type = A
physics = N
moveType = A
ctrl = 0
anim = 3103
sprPriority = 3

[State 13313, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3103
elem = 9

[State 13313, VelSet]
type = VelSet
trigger1 = !Time
y = 4.5

[State 13313, VelAdd]
type = VelAdd
trigger1 = Time > 1
y = 1.553125

[State 13313, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 13314


;Bounce off floor
[StateDef 13314]
type = S
physics = N
moveType = A
ctrl = 0
sprPriority = 3

[State 13314, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 3310,0

[State 13314, VelMul]
type = VelMul
trigger1 = !Time
x = 0.5
y = -0.3

[State 13314, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = 0.75

[State 13314, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 6
value = 3104
elem = AnimElemNo(0)

[State 13314, ChangeState]
type = ChangeState
trigger1 = Time = 8
value = 13315


;Explode
[StateDef 13315]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3

[State 13315, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.75

[State 13315, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 13315
elem = AnimElemNo(0)
ignoreHitPause = 1

[State 13315, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 13315, Damage Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 13315, Miss]
type = HitDef
trigger1 = 1
attr = S,HP
hitFlag =
sparkXY = -10,0

[State 13315, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && Root, var(15) < 1
attr = S,HP
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,4
guard.pauseTime = 0,4
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = ifElse(Root, var(10) = 1, 16.49, -16.49), -3.49
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = ifElse(Root, var(10) = 1, 16.49, -16.49), -2.69
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.sparkNo = -1
sparkXY = -10, -48
palFX.time = 23
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
sprPriority = 3

[State 13315, Flame Particles]
type = Helper
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

[State 13315, Explosion sound]
type = PlaySnd
trigger1 = !Time
value = 2,3100
channel = 4

[State 13315, Explosion 1]
type = Explod
trigger1 = !Time
anim = 3106
sprPriority = 3
scale = 0.5,0.5
posType = P1
random = 125,100
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 13315, Explosion 2]
type = Explod
trigger1 = !Time
anim = 3106
sprPriority = 3
scale = 0.5,0.5
posType = P1
random = 125,100
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 13315, Explosion 3]
type = Explod
trigger1 = !Time
anim = 3106
sprPriority = 3
scale = 0.5,0.5
posType = P1
random = 125,100
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 13315, End]
type = ChangeState
trigger1 = MoveContact
value = 3106
ignoreHitPause = 1

[State 13315, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 3107
ignoreHitPause = 1

[State 13315, ChangeState]
type = DestroySelf
trigger1 = Time = 1



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
sprPriority = ifElse(Root, StateNo = 820 || Root, StateNo = 2910, 1, 3)
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
sprPriority = ifElse(Root, StateNo = 820 || Root, StateNo = 2910, 1, 3)
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



;====<FLAMES (GRENADE WINPOSE>=
[StateDef 8151]
type = A
velSet = 0,0
anim = 1

[State 8151, PosSet]
type = PosSet
trigger1 = 1
x = ceil(EnemyNear, pos x)
y = ceil(EnemyNear, pos y) + (EnemyNear, const(size.mid.pos.y))

[State 8151, Facing]
type = Turn
trigger1 = 1
trigger1 = Facing != (EnemyNear, Facing)

[State 8151, Flame Explod 1]
type = Explod
trigger1 = 1
anim = 8150
sprPriority = 3
posType = P1
random = 40,40
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8151, Flames Explod 2]
type = Explod
trigger1 = 1
anim = 8150
sprPriority = 3
posType = P1
random = 60,60
vel = (Random / 2000.0), -0.5 - (Random / 2000.0)
facing = ifElse(Random < 500, -1, 1)
vfacing = ifElse(Random < 500, -1, 1)
scale = 0.5,0.5
ownpal = 1

[State 8151, End]
type = DestroySelf
trigger1 = Time >= 24



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
pos = 22,0

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
vel = ((RootDist x + 28) / 32.0), ((RootDist y - 68) / 32.0)
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
anim = 8525 + (Root, var(40) = 1)
ID = 20
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Portrait 2]
type = Explod
trigger1 = !Time
anim = 8525 + (Root, var(40) = 1)
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

[State 8600, Move Name: Take No Prisoners]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3000,3099])
var(0) = 2

[State 8600, Move Name: Mine Sweeper]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 3

[State 8600, Move Name: Steel Rain]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3200,3299])
var(0) = 4

[State 8600, Move Name: Patriot Sweeper]
type = VarSet
trigger1= !Time && (Root, var(23) = [3300,3399])
var(0) = 5

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
