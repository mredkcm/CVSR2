; ADD004 BASIC PIEs ReBuilded CNS (27/12/2018)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==

; _________________________________________
;| Iori Yagami by Knuckles8864             |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===<SYSTEM STATES>====
;==

;====<STANDING>====
[StateDef 0]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 0, Remove Explods]
type = RemoveExplod
trigger1 = IsHelper

[State 0, Destroy Helpers]
type = DestroySelf
trigger1 = IsHelper

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && !AnimTime
value = 0

[State 0, Dead]
type = ChangeState
trigger1 = !Alive
value = 5050

[State 0, Skywalker]
type = ChangeState
triggerall = pos y < 0
trigger1 = !NumEnemy
trigger2 = NumEnemy = 1
trigger2 = (Enemy, Name = "M -NES Game 1" + Enemy, Name = "M -NES Game 2" + Enemy, Name = "M -GB Game 1" + Enemy, AuthorName = "Bane84") < 2
trigger3 = Numenemy >= 2
trigger3 = (Enemy(0), Name = "M -NES Game 1" + Enemy(0), Name = "M -NES Game 2" + Enemy(0), Name = "M -GB Game 1" + Enemy(0), AuthorName = "Bane84") < 2
trigger3 = (Enemy(1), Name = "M -NES Game 1" + Enemy(1), Name = "M -NES Game 2" + Enemy(1), Name = "M -GB Game 1" + Enemy(1), AuthorName = "Bane84") < 2
value = 50

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 5 && Var(40)
anim = 7005
id = 7005
pos = 32,-63
postype = P1
scale = .5,.5
sprpriority = 1
ownpal = 1
bindtime = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 5 && Var(40)
anim = 7005
id = 7005
pos = 38,-68
postype = P1
scale = .5,.5
sprpriority = 0
ownpal = 1
bindtime = 1
removeongethit = 1


[State 0, Dead]
type = ChangeState
trigger1 = !Alive
value = 5050



;====<CROUCHING>====
;Stand to Crouch
[StateDef 10]
type = C
physics = C
moveType = I
velSet = 0,0
sprPriority = 0

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 12
value = 10
elem = 3 - AnimElemNo(0)

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 10
value = 10

[State 10, End]
type = ChangeState
trigger1 = !AnimTime
value = 11


;Crouching
[StateDef 11]
type = C
physics = C
moveType = I
anim = 11
velSet = 0,0
sprPriority = 0

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 5 && Var(40)
anim = 7005
id = 7005
pos = 14,-38
postype = P1
scale = .5,.5
sprpriority = 1
ownpal = 1
bindtime = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 5 && Var(40)
anim = 7005
id = 7005
pos = 20,-43
postype = P1
scale = .5,.5
sprpriority = 0
ownpal = 1
bindtime = 1
removeongethit = 1

[State 11, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 6 && !AnimTime
value = 11


;Crouch to Stand
[StateDef 12]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 10
value = 12
elem = 3 - AnimElemNo(0)

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 12
value = 12

[State 12, End]
type = ChangeState
trigger1 = command = "holddown" && command != "holdup"
value = 10

[State 12, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<WALKING>====
[StateDef 20]
type = S
physics = S
moveType = I
sprPriority = 0

[State 20, VelSet]
type = VelSet
trigger1 = var(40) != 1
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, VelSet]
type = VelSet
trigger1 = var(40) = 1
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x) * 1.915708812270536

[State 20, VelSet]
type = VelSet
trigger1 = var(40) != 1
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, VelSet]
type = VelSet
trigger1 = var(40) = 1
trigger1 = command = "holdback"
x = const(velocity.walk.back.x) * 1.915708812270536

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x > 0
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimElemTime(1) >= 1
value = 20

[State 20, ChangeAnim]
type = ChangeAnim
triggerAll = vel x < 0
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimElemTime(1) >= 1
value = 21



;====<JUMPING>====
;Jumping
[StateDef 40]
type = S
physics = S
moveType = I
anim = 40
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 40, Direction]
type = VarSet
trigger1 = !AILevel
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdfwd", 1, ifElse(command = "holdback", -1, sysvar(1))))

[State 40, Direction (AI)]
type = VarSet
trigger1 = AILevel
sysvar(1) = ifElse((EnemyNear, MoveType != A || BackEdgeBodyDist <= 10), 1, ifElse((EnemyNear, MoveType = A), -1, 0))

[State 40, High Jump]
type = VarSet
trigger1 = !Time && !AILevel
var(3) = ifElse(command = "highjump", 3, 0)

[State 40, High Jump (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(3) = ifElse((P2BodyDist x >= 160 || Random < (125 * (AILevel ** 2 / 64.0))), 3, 0)

[State 40, High Jump]
type = VarSet
trigger1 = !Time && PrevStateNo = 100
var(3) = 3

[State 40, Low Jump]
type = VarSet
trigger1 = !AILevel && command != "holdup" && (var(3) != [1,2])
var(3) = ifElse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Low Jump (AI)]
type = VarSet
trigger1 = AILevel && (var(3) != [1,2])
trigger1 = (EnemyNear, StateType = C) && Random < 500
var(3) = ifElse((var(3) = 3 && sysvar(1)), 2, 1)

[State 40, Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = ifElse((var(3) = [2,3]), 41, 40), 0

[State 40, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 40, Velocity: Normal Jump]
type = VelSet
trigger1 = var(40) != 1
trigger1 = !AnimTime
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Velocity: Low Jump]
type = VelSet
trigger1 = var(40) != 1
trigger1 = !AnimTime && var(3) = 1
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Velocity: Long Low Jump]
type = VelSet
trigger1 = var(40) != 1
trigger1 = !AnimTime && var(3) = 2
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Velocity: Long Jump]
type = VelSet
trigger1 = var(40) != 1
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifElse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 40, Velocity: Normal Jump]
type = VelSet
trigger1 = var(40) = 1
trigger1 = !AnimTime
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x) + 1.1625, const(velocity.jump.back.x) - 1.425))
y = const(velocity.jump.y) + 1.1625

[State 40, Velocity: Low Jump]
type = VelSet
trigger1 = var(40) = 1
trigger1 = !AnimTime && var(3) = 1
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x) + 1.1625, const(velocity.jump.back.x) - 1.425))
y = 0.75 * const(velocity.jump.y) + 1.1625

[State 40, Velocity: Long Low Jump]
type = VelSet
trigger1 = var(40) = 1
trigger1 = !AnimTime && var(3) = 2
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x) + 3.056, const(velocity.runjump.back.x) - 2.137))
y = 0.75 * const(velocity.jump.y) + 1.1625

[State 40, Velocity: Long Jump]
type = VelSet
trigger1 = var(40) = 1
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x) + 3.056, const(velocity.runjump.back.x) - 2.137))
y = ifElse(!sysvar(1), const(velocity.runjump.y) + 0.0725, const(velocity.jump.y) + 1.1625)

[State 40, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1


;In Air
[StateDef 50]
type = A
physics = N
moveType = I
sprPriority = 1

[State 50, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(!vel x , 41, ifElse(vel x > 0, 42, 43)) + 10 * (var(3) = [1,2])
persistent = 0

[State 50, Assert: No Guard]
type = AssertSpecial
trigger1 = var(3) = [1,2]
flag = NoAirGuard
ignoreHitPause = 1

[State 50, Grounded Frame]
type = PosFreeze
trigger1 = Time < 1 && PrevStateNo = 40
value = 1

[State 50, Gravity]
type = Gravity
trigger1 = Time >= 1 || PrevStateNo != 40

[State 50, Accel]
type = VelAdd
trigger1 = var(40) = 1
y = 0.102

[State 50, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


[StateDef 51]
type = A
physics = N
moveType = I
sprPriority = 1

[State 51, Gravity]
type = Gravity
trigger1 = 1

[State 51, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Landing
[StateDef 52]
type = S
physics = S
moveType = I
anim = ifElse(var(3) >= 2, 48, 47)
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 52, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && (var(3) = 1 || var(3) = 2)
trigger1 = (PrevStateNo = [600,699])
value = 57

[State 52, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 52, CtrlSet]
type = CtrlSet
trigger1 = !Time && (PrevStateNo != [600,699])
trigger2 = Time = 1 && Anim != 57
value = 1

[State 52, ChangeState to Guarding]
type = ChangeState
trigger1 = ctrl && command = "holdback"
trigger1 = InGuardDist && (PrevStateNo != [600,699])
value = 120

[State 52, Assert: NoWalk]
type = AssertSpecial
trigger1 = Anim != 5
flag = NoWalk
ignoreHitPause = 1

[State 52, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

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

[State 52, ChangeAnim to Turning]
type = ChangeAnim
trigger1 = ctrl && P2Dist x < 0
trigger1 = Anim != 5
value = 5

[State 52, Turn]
type = Turn
trigger1 = Anim = 5 && AnimElem = 1

[State 52, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;==<RUN>===
[StateDef 100]
type = S
physics = N
moveType = I
anim = 100
ctrl = 0
sprPriority = 1

[State 100, VelSet]
type = VelSet
trigger1 = var(40) != 1
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, VelSet]
type = VelSet
trigger1 = var(40) = 1
trigger1 = 1
x = const(velocity.run.fwd.x) * 1.384615384615385

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 6)
value = 100, ifElse((AnimElem = 3), 0, 1)

[State 100, Jump]
type = ChangeState
trigger1 = !AILevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40

[State 100, Jump (AI)]
type = ChangeState
trigger1 = AILevel && Random < 25
value = 40

[State 100, End]
type = ChangeState
trigger1 = !AILevel && command != "holdfwd"
trigger2 = AILevel && P2BodyDist x <= 90
value = 101


;Stop Running
[StateDef 101]
type = S
physics = S
moveType = I
anim = 101
ctrl = 0
sprPriority = 1

[State 101, Stopping Sound]
type = PlaySnd
trigger1 = !Time
value = 101,0

[State 101, Skid Dust]
type = Explod
trigger1 = !Time
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 101, Jump]
type = ChangeState
trigger1 = !AILevel && command = "holdup"
value = 40

[State 101, End]
type = ChangeState
trigger1 = !AnimTime
value = ifElse(command = "holddown", 10, 0)
ctrl = 1



;====<DASH BACKWARDS>==
[Statedef 105]
type = S
movetype = I
physics = S
anim = 105
ctrl = 0
velset = 0, 0

[State 105, StateTypeSet];Air, no physics
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A
physics = N

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, VelSet]
type = VelSet
trigger1 = var(40) != 1
trigger1 = AnimElem = 2
x = Const(velocity.run.back.x)
y = Const(velocity.run.back.y)

[State 105, VelSet]
type = VelSet
trigger1 = var(40) = 1
trigger1 = AnimElem = 2
x = Const(velocity.run.back.x) - 2.9
y = Const(velocity.run.back.y) + 0.4

[State 105, Gravity]
type = VelAdd
trigger1 = AnimElem = 2 > 0
y = .58

[State 105, Back Dash Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 105, 0

[State 105, VelAdd]
type = VelSet
trigger1 = AnimElem = 2 > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
x = 0

[State 105, On Ground]
type = PosSet
trigger1 = AnimElem = 2 > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
y = 0

[State 105, End]
type = ChangeState
trigger1 = AnimElem = 2 > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 106


;Stop Dashing Backwards
[StateDef 106]
type = S
physics = S
ctrl = 0
anim = 106
velSet = 0,0

[State 106, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 106, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 100,1

[State 106, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprpriority = -3
postype = P1
pos = ceil(7 * const(size.xScale)),0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 106, CtrlSet]
type = CtrlSet
trigger1 = Time >= 2
value = 1

[State 106, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;=<DASH FORWARD>=
[StateDef 110]
type = S
physics = S
moveType = I
anim = 110
ctrl = 0
sprPriority = 1

[State 110, Dash Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 110, VarSet -> Running]
type = VarSet
trigger1 = !Time
sysvar(1) = 1

[State 110, VarSet -> Not Running]
type = VarSet
triggerAll = AnimElemTime(2) < 0
trigger1 = !AILevel && command != "holdfwd"
sysvar(1) = 0

[State 110, ChangeState to Running]
type = ChangeState
trigger1 = AnimElemTime(2) = 0 && sysvar(1)
value = 100

[State 110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = -1.98 * Const(Velocity.Run.Back.x)

[State 110, Skid Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8104
sprPriority = 3
posType = P1
pos = 0,0
vel = 0,0
scale = 0.5,0.5
pauseMovetime = -1
superMoveTime = -1
ownpal = 1

[State 110, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<DODGE>====
[StateDef 700]
type = S
physics = S
moveType = I
anim = 700
ctrl = 0
velSet = 0,0
sprPriority = -2

[State 700, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, ifElse(var(40) = 1, 10, 0)
channel = 0

[State 700, Dodge Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,3
channel = 1

[State 700, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 700, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 700, Attack]
type = ChangeState
trigger1 = !AILevel && Time = [15,25]
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifElse((command = "x" || command = "y" || command = "z"), 220, 240)

[State 700, Attack (AI)]
type = ChangeState
trigger1 = AILevel && (Time = [15,25]) && NumEnemy
trigger1 = (EnemyNear, MoveType != A) && (P2BodyDist x = [-60,60]) && (P2Dist y >= -60)
value = ifElse(Random < 666, 220, 240)

[State 700, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<ROLL FORWARD>====
[StateDef 710]
type = S
physics = N
moveType = I
anim = 710
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 710, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 710, HitBy]
type = HitBy
trigger1 = AnimElemTime(7) < 0
value = SCA,AT
time = 1

[State 710, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 1
value = 4, ifElse(Random < 500, 0, 1)
channel = 0

[State 710, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 1
value = 4, 10
channel = 0

[State 710, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0
channel = 1

[State 710, Start Roll]
type = VelSet
trigger1 = AnimElem = 2
x = 4.8

[State 710, End Roll]
type = VelSet
trigger1 = AnimElem = 7
x = 0

[State 710, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;===<ROLL BACKWARDS>===
[StateDef 715]
type = S
physics = N
moveType = I
anim = 715
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 715, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 715, HitBy]
type = HitBy
trigger1 = AnimElemTime(7) < 0
value = SCA,AT
time = 1

[State 715, Voice]
type = PlaySnd
trigger1 = var(40) != 1
trigger1 = AnimElem = 1
value = 4, ifElse(Random < 500, 0, 1)
channel = 0

[State 715, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40) = 1
trigger1 = AnimElem = 1
value = 4, 10
channel = 0

[State 715, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0
channel = 1

[State 715, Start Roll]
type = VelSet
trigger1 = AnimElem = 1
x = -4.8

[State 715, Stop Roll]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 715, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;==<POWER CHARGE>==
[StateDef 730]
type = S
physics = S
moveType = I
anim = 730
velSet = 0,0
ctrl = 0

[State 730, PowerAdd]
type = PowerAdd
triggerAll = Power < const(data.power) && Power < PowerMax
trigger1 = !AILevel && (command = "holdb" && command = "holdy")
trigger2 = AILevel
value = 2 + ifElse(time < 60, 0, (time - 60) / 12)

[State 730, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 730,1
channel = 0

[State 730, Voice (Orochi)]
type = PlaySnd
trigger1 = !Time && var(40) = 1
value = 730,11
channel = 0

[State 730, Character Flash]
type = PalFX
trigger1 = 1
time = 1
add = 75 + ceil(sin(Time / 6.0 * pi) * 75), 25 + ceil(sin(Time / 6.0 * pi) * 25),0

[State 730, Power Charge Helper]
type = Helper
trigger1 = !NumHelper(8330)
helperType = Normal
stateNo = 8330
ID = 8330
name = "Power Charge"
posType = P1
pos = 0,0
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 730, Particles]
type = Helper
trigger1 = var(40) != 1
trigger1 = !NumHelper(8331)
helperType = Normal
stateNo = 8331
ID = 8331
name = "Particles"
postype = P1
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 730, Particles]
type = Helper
trigger1 = var(40) = 1
trigger1 = !NumHelper(8332)
helperType = Normal
stateNo = 8332
ID = 8332
name = "Particles"
postype = P1
pauseMoveTime = 65535
superMoveTime = 65535
ownPal = 1

[State 730, End]
type = ChangeState
trigger1 = Power >= const(data.power) || Power >= PowerMax || RoundState != 2
trigger2 = !AILevel && (command != "holdb" || command != "holdy")
trigger3 = AILevel && (InGuardDist || P2BodyDist x <= 120)
value = 731
ctrl = 1


;Power Charge End
[StateDef 731]
type = S
physics = S
moveType = I
anim = 731
velSet = 0,0
ctrl = 1

[State 731, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 0

[State 730, Full Power Voice]
type = PlaySnd
trigger1 = !Time && Power >= const(data.power) && var(40) != 1
value = 182,0
channel = 0
persistent = 0

[State 730, Full Power Voice (Orochi)]
type = PlaySnd
trigger1 = !Time && Power >= const(data.power) && var(40) = 1
value = 195,10
channel = 0
persistent = 0

[State 730, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;====<ZERO COUNTER>====
[StateDef 750]
type = S
physics = S
moveType = I
anim = 750
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = -1000
faceP2 = 1

[State 750, Button]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = (command = "412k")
ignoreHitPause = 1

[State 750, Button (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2StateType = A), 0, ifElse((P2StateType = C), 1, ifElse(Random < 500, 0, 1)))
ignoreHitPause = 1

[State 750, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 750, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 750, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,ifElse(var(40) = 1, 10, 1)
channel = 0

[State 750, Zero Counter FX Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8350
ID = 8350
name = "Zero Counter"
posType = P1
pos = 22, -65
superMoveTime = 255
ownPal = 1

[State 750, SuperPause]
type = SuperPause
trigger1 = !Time
time = 15
moveTime = 15
p2DefMul = 1
anim = -1
sound = s750,0
darken = 0

[State 750, End]
type = ChangeState
trigger1 = Time >= 15
value = ifElse(var(10) = 1, 2910, 2900)



;====<PARRY>====
;Standing Parry
[StateDef 760]
type = S
physics = S
moveType = I
anim = 760
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 78
faceP2 = 1

[State 760, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 760, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 760, Stop]
type = PosFreeze
trigger1 = 1
value = 1

[State 760, No Walking]
type = VarSet
trigger1 = 1
var(26) = 7

[State 760, Voice]
type = PlaySnd
trigger1= !Time
value = 4,ifElse(var(40) = 1, 10, 1)
channel = 0

[State 760, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 760, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinadd = 0,-64,-255,60
time = 15

[State 760, FX]
type = Explod
trigger1 = !Time
anim = 8360
sprPriority = 5
posType = P1
pos = 12, -71
pauseMoveTime = -1
superMoveTime = -1
scale = 0.5,0.5
ownPal = 1

[State 760, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 760, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Crouching Parry
[StateDef 761]
type = C
physics = C
moveType = I
anim = 761
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = 78
faceP2 = 1

[State 761, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 761, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 761, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 761, No Walk]
type = VarSet
trigger1 = 1
var(26) = 7

[State 761, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,ifElse(var(40) = 1, 10, 1)
channel = 0

[State 761, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 761, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinAdd = 0,-64,-255,60
time = 15

[State 761, Parry FX]
type = Explod
trigger1 = !Time
anim = 8360
sprpriority = 5
postype = P1
pos = 27,-21
pauseMovetime = -1
superMovetime = -1
scale = 0.5,0.5
ownpal = 1

[State 761, EnvShake]
type = EnvShake
trigger1 = !time
time = 0
ampl = 0

[State 761, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;Jumping Parry
[StateDef 762]
type = A
physics = N
moveType = I
anim = 762
ctrl = 0
sprPriority = 2
powerAdd = 78
faceP2 = 1

[State 762, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 762, Pause]
type = Pause
trigger1 = !Time
time = 15
moveTime = 15
endCmdBufTime = 15
pauseBg = 0

[State 762, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 762, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,ifElse(var(40) = 1, 10, 1)
channel = 0

[State 762, Parry Sound]
type = PlaySnd
trigger1 = !Time
value = 760,0
channel = 1

[State 762, Player Flash]
type = PalFX
trigger1 = !Time
add = 0,64,255
sinadd = 0,-64,-255,60
time = 15

[State 762, Parry FX]
type = Explod
trigger1 = !Time
anim = 8360
sprPriority = 5
posType = P1
pos = 21, -84
pauseMoveTime = -1
superMoveTime = -1
scale = 0.5,0.5
ownpal = 1

[State 762, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 762, End]
type = ChangeState
trigger1 = !AnimTime
value = 763
ctrl = 1


;Falling
[StateDef 763]
type = A
physics = N
movetype = I
anim = 763
ctrl = 1

[State 763, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse(vel x > 2, 2, ifElse(vel x < -2, -2, vel x))
y = ifElse(vel y < -2, vel y, -2)

[State 763, Gravity]
type = Gravity
trigger1 = 1

[State 763, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;====<CUSTOM COMBO>====
;Ground Version
[StateDef 900]
type = S
physics = S
moveType = A
anim = 900
velSet = 0,0
ctrl = 0
sprPriority = 2
powerAdd = -1000

[State 900, Corner Push]
type = VarSet
trigger1 = Time = 4
fvar(5) = 0

[State 900, Unguardable]
type = VarSet
trigger1 = Time = 4 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 30

[State 900, NotHitBy]
type = NotHitBy
trigger1 = !time
value = SCA
time = 38

[State 900, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 900, Custom Combo Time]
type = VarSet
trigger1 = Time >= 4
var(20) = 180

[State 900, Voice]
type = PlaySnd
trigger1 = Time = 4 && var(40) != 1
value = 4,0
channel = 0

[State 900, Voice (Orochi)]
type = PlaySnd
trigger1 = Time = 4 && var(40) = 1
value = 750,10
channel = 0

[State 900, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo FX"
posType = P1
pos = 2,-65
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 900, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 30
moveTime = 30
anim = -1
sound = s900,0
p2DefMul = 1
darken = 0

[State 900, AfterImage]
type = AfterImage
trigger1= !AnimTime
time = 2
timeGap = 1
frameGap = 4
length = 13
palBright = 0,0,0
palContrast = 64,128,192
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = add1

[State 900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Air Version
[Statedef 905]
type = A
physics = N
moveType = A
anim = 905
ctrl = 0
sprPriority = 2
powerAdd = -1000

[State 905, Corner Push]
type = VarSet
trigger1 = Time = 4
fvar(5) = 0

[State 905, Unguardable]
type = VarSet
trigger1 = Time = 4 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 30

[State 905, NotHitBy]
type = NotHitBy
trigger1 = !Time
value = SCA
time = 38

[State 905, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 905, Custom Combo Timer]
type = VarSet
trigger1 = Time >= 4
var(20) = 180

[State 905, Voice]
type = PlaySnd
trigger1 = Time = 4 && var(40) != 1
value = 4,0
channel = 0

[State 905, Voice (Orochi)]
type = PlaySnd
trigger1 = Time = 4 && var(40) = 1
value = 194,1
channel = 0

[State 905, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo Startup"
posType = P1
pos = -2,-81
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 905, SuperPause]
type = SuperPause
trigger1 = Time = 4
time = 30
moveTime = 30
anim = -1
sound = s900,0
p2DefMul = 1
darken = 0

[State 905, AfterImage]
type = AfterImage
trigger1 = !AnimTime
time = 2
timeGap = 1
frameGap = 4
length = 13
palBright = 0,0,0
palContrast = 64,128,192
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = add1

[State 905, End]
type = ChangeState
trigger1 = !AnimTime
value = 906
ctrl = 1


;Air Finish
[StateDef 906]
type = A
physics = N
moveType = I
anim = 906
ctrl = 1

[State 906, Gravity]
type = Gravity
trigger1 = 1

[State 906, Land]
type = ChangeState
trigger1 = pos y > -vel y
value = 52



;==<TARGET SAFE FALL>==
[StateDef 5205]
type = A
physics = N
moveType = H

[State 5205, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 5035
value = 5050

[State 5205, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5205, SelfState (Ground)]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.getHit.groundRecover.ground.threshold)
value = 5200

[State 5205, SelfState (Air)]
type = SelfState
trigger1 = Time >= 60
value = 5210



;==<FALL RECOVERY>==
[StateDef 5200]
type = A
moveType = H
physics = N

[State 5200, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5035 && !AnimTime
value = 5050

[State 5200, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5200, End]
type = SelfState
trigger1 = vel y > 0 && pos y >= 10
value = 5201


[StateDef 5201]
type = S
moveType = I
physics = N
anim = 5200
ctrl = 0
faceP2 = 1

[State 5201, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5201, VelSet]
type = VelSet
trigger1 = !Time
x = -8
y = 0

[State 5201, VelMul]
type = VelMul
trigger1 = 1
x = 0.9

[State 5201, Voice]
type = PlaySnd
trigger1 = !Time
value = 5200,1 + 9 * var(40)
channel = 0

[State 5201, Recover Sound]
type = PlaySnd
trigger1 = !Time
value = 5200,0
channel = 1

[State 5201, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time=10

[State 5201, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-18 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 5201, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Air Recover
[StateDef 5210]
type = A
moveType = I
physics = N
anim = 5210
ctrl = 0

[State 5210, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.6

[State 5210, VelSet]
type = VelSet
trigger1 = !Time
x = ifElse((command = "holdfwd" && command != "holdback"), 4, ifElse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,1 + 9 * var(40)
channel = 0

[State 5210, Recover Sound]
type = PlaySnd
trigger1 = !Time
value = 5200,0

[State 5210, Flash]
type = PalFX
trigger1 = !Time
add = 255,255,255
sinAdd = -255,-255,-255,40
time = 10

[State 5210, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0, ceil(-66 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 5210, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(8) < 0
value = SCA
time = 1

[State 5210, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(8) >= 0
value = 1

[State 5210, Land]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52



;===<GUARD>====
;Guard Start
[StateDef 120]
type = U
physics = U
anim = 120 + (StateType = C) + (StateType = A) * 2

[State 120, StateTypeSet: Standing]
type = StateTypeSet
trigger1 = !Time && StateType = S
physics = S

[State 120, StateTypeSet: Crouching]
type = StateTypeSet
trigger1 = !Time && StateType = C
physics = C

[State 120, StateTypeSet: Jumping]
type = StateTypeSet
trigger1 = !Time && StateType = A
physics = A

[State 120, VelSet]
type = VelSet
trigger1 = !Time && StateType != A
x = 0
y = 0

[State 120, Stand to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 120, Crouching to Stand]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 120, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 120, Change to Guard State]
type = ChangeState
trigger1 = !AnimTime || AILevel
value = 130 + (StateType = C) + (StateType = A) * 2

[State 120, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140


;Standing Guard
[StateDef 130]
type = S
physics = S

[State 130, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 130
value = 130

[State 130, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 130, Standing to Crouch]
type = ChangeState
trigger1 = !AILevel && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
value = 131

[State 130, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140

[State 130, Landing Sound]
type = PlaySnd
trigger1 = !Time
trigger1 = PrevStateNo = 132 || (PrevStateNo = [154,155])
value = 52,0

[State 130, Landing Dust Expod]
type = Explod
trigger1 = !Time
trigger1 = PrevStateNo = 132 || (PrevStateNo = [154,155])
anim = 8102
sprpriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1


;Crouch Guarding
[StateDef 131]
type = C
physics = C

[State 131, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 131
value = 131

[State 131, Crouching to Standing]
type = ChangeState
trigger1 = !AILevel && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
value = 130

[State 131, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 131, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140


;Air Guard
[StateDef 132]
type = A
physics = N

[State 132, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 132
value = 132

[State 132, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yAccel)

[State 132, VarSet]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)

[State 132, VelSet]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 132, PosSet]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 132, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 132, Jumping to Standing]
type = ChangeState
trigger1 = sysvar(0) && InGuardDist
trigger1 = (!AILevel && command = "holdback") || AILevel
value = 130

[State 132, Change to Falling]
type = ChangeState
trigger1 = sysvar(0)
value = 52

[State 132, Stop Guarding]
type = ChangeState
trigger1 = (!AILevel && command != "holdback")
trigger2 = !InGuardDist
trigger3 = AILevel && NumEnemy
trigger3 = EnemyNear, HitDefAttr = SCA, AT
value = 140


;Guard End
[StateDef 140]
type = U
physics = U
ctrl = 1

[State 140, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 140 + (StateType = C) + (StateType = A) * 2

[State 140, StateTypeSet: Standing]
type = StateTypeSet
trigger1 = !Time && StateType = S
physics = S

[State 140, StateTypeSet: Crouching]
type = StateTypeSet
trigger1 = !Time && StateType = C
physics = C

[State 140, StateTypeSet: Jumping]
type = StateTypeSet
trigger1 = !Time && StateType = A
physics = A

[State 140, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 140, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 140, End]
type = ChangeState
trigger1 = !AnimTime
value = (StateType = C) * 11 + (StateType = A) * 51


;Hit while Guarding (Standing)
[StateDef 150]
type = S
movetype = H
physics = N
velSet = 0,0

[State 150, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 150

[State 150, End]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!AILevel && command = "holddown") || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 150, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
stateType = C
physics = C

[State 150, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AIlevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S


;Knocked Back while Guarding (Standing)
[StateDef 151]
type = S
moveType = H
physics = S
anim = 150

[State 151, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 151, VelSet]
type = VelSet
trigger1 = Time = GetHitVar(SlideTime)
trigger2 = HitOver
x = 0

[State 151, CtrlSet]
type = CtrlSet
trigger1 = time = GetHitVar(CtrlTime)
value = 1

[State 151, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 151, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 151, End]
type = ChangeState
trigger1 = HitOver
value = 130
ctrl = 1


;Hit while Guarding (Crouching)
[StateDef 152]
type = C
moveType = H
physics = N
velSet = 0,0

[State 152, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 151

[State 152, End]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2 * ((!AILevel && command = "holddown") || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 152, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 152, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S


;Knocked Back while Guarding (Crouching)
[StateDef 153]
type = C
moveType = H
physics = C
anim = 151

[State 153, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1

[State 153, VelSet]
type = VelSet
trigger1 = Time = GetHitVar(SlideTime)
trigger2 = HitOver
x = 0

[State 153, CtrlSet]
type = CtrlSet
trigger1 = Time = GetHitVar(CtrlTime)
value = 1

[State 153, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 153, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
stateType = S
physics = S

[State 153, End]
type = ChangeState
trigger1 = HitOver
value = 131
ctrl = 1


;Hit while Guarding (Jumping)
[StateDef 154]
type = A
moveType = H
physics = N
velSet = 0,0

[State 154, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 152

[State 154, End]
type = ChangeState
trigger1 = HitShakeOver
value = 155


;Knocked Back while Guarding (Jumping)
[StateDef 155]
type = A
moveType = H
physics = N
anim = 152

[State 155, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 155, VelAdd]
type = VelAdd
trigger1 = 1
y = const(movement.yAccel)

[State 155, CtrlSet]
type = CtrlSet
trigger1 = Time = GetHitVar(CtrlTime)
value = 1

[State 155, VarSet]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0 && vel y > 0)

[State 155, VelSet]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 155, PosSet]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 155, End]
type = ChangeState
trigger1 = sysvar(0) && InGuardDist
trigger1 = (!AILevel && command = "holdback") || AILevel
value = 130

[State 155, End]
type = ChangeState
trigger1 = sysvar(0)
value = 52



;====<LOSE>====
[StateDef 170]
type = S
ctrl = 0
anim = 170
velSet = 0,0

[State 170, Explod]
type = Explod
trigger1 = AnimElem = 3 && Var(40)
anim = 7005
id = 7005
pos = 17,-83
postype = P1
scale = .5,.5
sprpriority = 1
ownpal = 1
bindtime = 1
removeongethit = 1

[State 170, Explod]
type = Explod
trigger1 = AnimElem = 3 && Var(40)
anim = 7005
id = 7005
pos = 23,-88
postype = P1
scale = .5,.5
sprpriority = 0
ownpal = 1
bindtime = 1
removeongethit = 1

[State 170, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 10 && Var(40)
value = F7,0

[State 170, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 10 && Var(40)
anim = F60
posType = P1
pos = 0,0
sprPriority = -3

[State 170, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver



;====<DRAW GAME>====
[StateDef 175]
type = S
ctrl = 0
velSet = 0,0

[State 175, ChangeState]
type = ChangeState
trigger1 = !Time
value = 170



;====<CONTINUE?>====
[StateDef 5500]
type = S
anim = 5300
velSet = 0,0
ctrl = 0

[State 5500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5500



;====<INITIALIZE (PART 2)>====
[StateDef 5901]
type = S

[State 5901, Configuration]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 7650
ID = 7650
name = "Configuration Helper"
posType = P1

[State 5901, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(10192)
id = 10192

[State 5901, Turns Intro]
type = ChangeState
trigger1 = TeamMode = Turns
trigger1 = !RoundsExisted && RoundNo >= 2
value = 6900

[State 5901, Intro vs Kyo Kusanagi]
type = ChangeState
triggerAll = !var(40)
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = (Enemy, Name= "Kyo" || Enemy, Name = "Kyo Kusanagi" || Enemy, Name = "cvskyo" || Enemy, Name = "cvskyo_normal" || Enemy, Name = "Kyo_WLS") && Enemy, AuthorName != "Jmorphman"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName != "Jmorphman"
value = 192

;[State 5901, Intro vs PotS Bison]
;type = ChangeState
;trigger1 = NumEnemy
;trigger1 = !RoundsExisted && !(Enemy,RoundsExisted)
;trigger1 = !(TeamMode = Simul) && !(Enemy,TeamMode = Simul)
;trigger1 = Enemy,Name = "Vega" && Enemy,AuthorName = "Phantom.of.the.Server"
;value = 193

[State 5901, Intro vs Froz Bison]
type = ChangeState
triggerAll = !var(40)
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = !(TeamMode = Simul) && !(Enemy,TeamMode = Simul)
trigger1 = Enemy,Name = "Vega" && Enemy,AuthorName = "Froz" && Enemy, var(40) != 1
value = 193

[State 5901, Intro vs Orochi]
type = ChangeState
triggerAll = !var(40)
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = !(TeamMode = Simul) && !(Enemy,TeamMode = Simul)
trigger1 = Enemy,Name = "Orochi"
value = 197

[State 5901, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1  && var(40) != 1
value = 190 + (Random % 2)

[State 5901, Orochi Intro]
type = ChangeState
trigger1 = RoundNo = 1 && var(40) = 1
value = 198

[State 5901, End]
type = ChangeState
trigger1 = 1
value = 0



;====<INTRO 1>====
[StateDef 190]
type = S
physics = S
anim = 190

[State 190, Change to intro vs Kyo Kusanagi]
type = ChangeState
trigger1 = Time > 1
trigger1 = Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName = "Jmorphman" && Enemy, var(40) != 1
value = 192

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 190,0
channel = 0

[State 190, End]
type = ChangeState
trigger1 = !AnimTime
value = 0


;====<INTRO 2>====
[StateDef 191]
type = S
physics = S
anim = 191

[State 191, Change to intro vs Kyo Kusanagi]
type = ChangeState
trigger1 = Time > 1
trigger1 = Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName = "Jmorphman" && Enemy, var(40) != 1
value = 192

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 191,0
channel = 0

[State 190, End]
type = ChangeState
trigger1 = !AnimTime
value = 0


;====<INTRO VS KYO KUSANAGI>====
[StateDef 192]
type = S
physics = S
anim = 192
ctrl = 0

[State 191, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 0, Flame Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 192,1
channel = 0

[State 192, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 192,0
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 37
value = 192,2
channel = 0

;[State 0, Helper]
;type = Helper
;trigger1 = animelem= 6
;helpertype = normal
;name = "Intro Flame"
;ID = 6000
;stateno = 6000
;pos = 0,0
;postype = p1
;facing = 1
;keyctrl = 0
;ownpal = 1
;size.xscale = .5
;size.yscale = .5

[State 191, Fire Explod 1]
type = Explod
trigger1 = AnimElem = 6
anim = 3005
sprPriority = 3
posType = P1
pos = 5,-104
removeTime = 5
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 191, Fire Explod 2]
type = Explod
trigger1 = AnimElem = 7
anim = 10192
ID = 10192
sprPriority = 3
posType = P1
pos = 18,-97
removeTime = 15
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 191, ModifyExplod 2]
type = ModifyExplod
trigger1 = AnimElem = 8
ID = 10192
pos = 23,-91
posType = P1

[State 191, ModifyExplod 3]
type = ModifyExplod
trigger1 = AnimElem = 9
ID = 10192
pos = 25,-83
posType = P1

[State 191, Fire Explod 1]
type = Explod
trigger1 = AnimElem = 10
anim = 3005
sprPriority = 3
posType = P1
pos = 25,-88
removeTime = 195
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 191, Fire Explod 4]
type = Explod
trigger1 = AnimElem = 37
anim = 10193
sprPriority = 3
posType = P1
pos = 28,-71
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 191, End]
type = ChangeState
trigger1 = !AnimTime
value = 0


;====<INTRO VS VEGA>====
[Statedef 193]
type = S
ctrl = 0
anim = 193
velset = 0,0

[State 193, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = Intro
flag2 = NoAutoTurn

[State 193, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 193, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 193, VarSet]
type = VarSet
trigger1 = !Time
var(10) = ceil(pos x)

[State 901,1]
type = PosSet
trigger1 = !Time
x = 30 * Facing

[State 193, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1000,0
channel = 1

[State 1004, Yami Barai Startup Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1000,1
channel = 2

[State 1004, Yami Barai Startup FX]
type = Explod
trigger1 = AnimElem = 8
anim = 1004
sprPriority = 3
pos = 20,0
posType = P1
facing = -1
scale = 0.5 * const(size.xScale),0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 1004, Projectile]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 1005
ID = 1005
name = "Yami Barai Projectile"
posType = P1
pos = -40,0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1
Facing = -1

[State 105, Dash Back Snd]
type = PlaySnd
trigger1 = AnimElem = 20
value = 105, 0

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 20
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1300,VelSet]
type = VelSet
trigger1 = Numhelper(8999)
trigger1 = AnimElem = 20
x = ((helper(8999),Pos X-Pos X)*Facing)/21
y = -4

[State 1201,VelAdd]
type = VelAdd
trigger1 = AnimElem = 20,>0
y = .39

[State 1201,End]
type = ChangeState
trigger1 = AnimElem = 2, > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 194


;Landing
[Statedef 194]
type = S
movetype = I
physics = S
anim = 194
velset = 0,0

[State 194, Camera]
type = Helper
trigger1 = !numHelper(8999)
helperType = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1
pos = 0, 0
facing = 1

[State 194, Land Sound]
type = PlaySnd
trigger1 = Time = 0
value = 52,0

[State 194, Landing Dust Explod]
type = Explod
trigger1 = Anim = 194 && !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 194, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = Intro
flag2 = NoAutoTurn

[State 194, VelSet]
type = PosSet
trigger1 = Numhelper(8999)
trigger1 = Time = 0
x = helper(8999),pos x
y = 0

[State 194, RemoveExplod]
type = RemoveExplod
trigger1 = AnimTime = 0
id = 1005

[State 194, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 191,0
channel = 3

[State 194, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0


;====<INTRO VS OROCHI>====
[StateDef 197]
type = S
physics = S
anim = 197

[State 197, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 197, Orochi Scream]
type = PlaySnd
trigger1 = AnimElem = 2
value = 185,0
channel = 0

[State 197, Voice]
type = PlaySnd
trigger1 = AnimElem = 51
value = 5000,1
channel = 0

[State 197, Voice]
type = PlaySnd
trigger1 = AnimElem = 82
value = 800,0
channel = 0

[State 197, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<OROCHI INTRO>====
[StateDef 198]
type = S
physics = S
anim = 198

[State 198, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 198, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 193,0
channel = 0

[State 198, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<TURNS INTRO>====
[StateDef 6900]
type = A
anim = 42
velSet = 0,0
ctrl = 0

[State 6900, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6900, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6900, PosSet]
type = PosSet
trigger1 = !Time
x = (-320 + abs(pos x)) * Facing

[State 6900, VelSet]
type = VelSet
trigger1 = !Time
x = (Helper(8999), RootDist x) / -40.0
y = -10.25

[State 6900, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 6900, End]
type = ChangeState
trigger1 = Time
trigger1 = pos y > -vel y
value = 6901


;Landing
[StateDef 6901]
type = S
physics = S
anim = 6901 + (var(40) = 1)
velSet = 0,0

[State 6901, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6901, PosSet]
type = PosSet
trigger1 = !Time && NumHelper(8999)
x = ceil(Helper(8999), pos x)

[State 6901, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0
channel = 1

[State 6901, Landing Dust Expod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6901, Voice]
type = PlaySnd
trigger1 = !var(40)
trigger1 = AnimElem = 9
value = 191, 0
channel = 0

[State 6901, Voice (Orochi)]
type = PlaySnd
trigger1 = var(40)
trigger1 = AnimElem = 5
value = 193, 0
channel = 0

[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<WIN POSE DECIDER>====
[StateDef 180]
type = S

[State 180, Generic Victory Quote (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
value = (Random % 28)

[State 180, Victory Quote vs. Kyo Kusanagi (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = (Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName != "Jmorphman") || (Enemy, Name = "cvskyo" && Enemy, PalNo <= 6) || Enemy, Name = "cvskyo_normal" || Enemy, Name = "Kyo_WLS"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName = "Jmorphman" && Enemy, var(40) != 1
value = 28 + (Random % 3)

[State 180, Victory Quote vs. Benimaru Nikaido]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Benimaru" || Enemy, Name = "Benimaru Nikaido" || Enemy, Name = "cvsbenimaru"
value = 31 + (Random % 2)

[State 180, Victory Quote vs. Goro Daimon]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Daimon" || Enemy, Name = "Goro Daimon"
value = 32 + (Random % 2) * 2

[State 180, Victory Quote vs. Kusanagi (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = (Enemy, Name = "Kusanagi") || (Enemy, Name = "cvskyo" && Enemy, PalNo > 6) || Enemy, Name = "cvskyo_ex"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName = "Jmorphman" && Enemy, var(40) = 1
value = 34 + (Random % 2)

[State 180, Victory Quote vs. Iori Yagami (Normal mode)]
type = VictoryQuote
triggerAll = !var(40)
trigger1 = Enemy, Name = "Iori" || Enemy, Name = "IoriMG" || (Enemy, Name = "cvsiori" && Enemy, PalNo <= 6) || Enemy, Name = "cvsiori_normal" || Enemy, Name = "N.Iori_WLS" || (Enemy, Name = "Iori_WLS" && Enemy, PalNo <= 6) || (Enemy, Name = "Iori Yagami" && Enemy, AuthorName != "Anjel") || (Enemy, Name = "Iori Yagami" && Enemy, AuthorName = "Anjel" && Enemy, PalNo <= 6)
value = 36 + (Random % 4)

[State 180, Victory Quote vs. Mature (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Mature" || Enemy, Name = "cvsmature"
value = 39 + (Random % 3)

[State 180, Victory Quote vs. Vice (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Vice" || Enemy, Name = "cvsvice"
value = 41 + (Random % 3)

[State 180, Victory Quote vs. Chizuru Kagura, Maki Kagura (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Chizuru" || Enemy, Name = "Chizuru Kagura" || Enemy, Name = "Maki Kagura"
value = 44

[State 180, Victory Quote vs. KOF 2001 Hero Team (Normal mode)]
type = VictoryQuote
triggerAll = !var(40)
trigger1 = Enemy, Name = "Maxima"
trigger2 = Enemy, Name = "Whip"
trigger3 = Enemy, Name = "Lin"
value = 45

[State 180, Victory Quote vs. K' (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Ultimate K'" || Enemy, Name = "K'"
value = 45 + (Random % 2)

[State 180, Victory Quote vs. Kula Diamond (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Kula Diamond" || Enemy, Name = "Kula"
value = 47

[State 180, Victory Quote vs. Takuma Sakazaki (Normal mode)]
type = VictoryQuote
triggerAll = !var(40)
trigger1 = Enemy, Name = "Takuma" || Enemy, Name = "Takuma Sakazaki"
value = 48

[State 180, Victory Quote vs. Yuri Sakazaki (Normal mode)]
type = VictoryQuote
triggerAll = !var(40)
trigger1 = Enemy, Name = "Yuri" || Enemy, Name = "Yuri Sakazaki" || Enemy, Name = "cvsyuri"
value = 49 + (Random % 2)

[State 180, Victory Quote vs. Robert Garcia (Normal mode)]
type = VictoryQuote
triggerAll = !var(40)
trigger1 = Enemy, Name = "Robert" || Enemy, Name = "Robert Garcia" || Enemy, Name = "Robert_WLS"
value = 51

[State 180, Victory Quote vs. Ryo Sakazaki (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Ryo" || Enemy, Name = "Ryo Sakazaki" || Enemy, Name = "cvsryo"
value = 52

[State 180, Victory Quote vs. Terry Bogard (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Terry" || Enemy, Name = "Terry Bogard" || Enemy, Name = "cvsterry"
value = 53 + (Random % 2)

[State 180, Victory Quote vs. Ash Crimson (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = (Enemy, Name = "Ash" && Enemy, AuthorName = "Jin") || Enemy, Name = "Ash Crimson"
value = 55 + (Random % 2)

[State 180, Victory Quote vs. Dark Ash (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Dark Ash" || Enemy, Name = "Evil Ash" || Enemy, Name = "Blood Spiraling into Insanity Ash"
value = 57

[State 180, Victory Quote vs. Andy Bogard]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Andy Bogard" || Enemy, Name = "Andy" || Enemy, Name = "cvsandy"
value = 58 + (Random % 2)

[State 180, Victory Quote vs. Athena Asamiya]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Athena Asamiya" || Enemy, Name = "Athena" || Enemy, Name = "cvsathena"
value = 60

[State 180, Victory Quote vs. Chin Gentsai]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Chin" || Enemy, Name = "Chin Gentsai"
value = 61 + (Random % 2)

[State 180, Victory Quote vs. Clark Still]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Clark" || Enemy, Name = "Clark Still"
value = 63

[State 180, Victory Quote vs. Duo Lon (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Duo Lon" || Enemy, Name = "DuoLon" || Enemy, Name = "Duo-Lon"
value = 64

[State 180, Victory Quote vs. Elisabeth Blanctorche]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Elisabeth" || Enemy, Name = "Elisabeth Blanctorche"
value = 65

[State 180, Victory Quote vs. Hwa Jai]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Hwa" || Enemy, Name = "Hwa Jai"
value = 66

[State 180, Victory Quote vs. Joe Higashi]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Joe Higashi" || Enemy, Name = "Joe" || Enemy, Name = "cvsjoe"
value = 67 + (Random % 2)

[State 180, Victory Quote vs. Sie Kensou]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Sie Kensou" || Enemy, Name = "Kensou"
value = 69

[State 180, Victory Quote vs. Kim Kaphwan]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Kim Kaphwan" || Enemy, Name = "Kim" || Enemy, Name = "cvskim"
value = 70

[State 180, Victory Quote vs. King]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "cvsking" || Enemy, Name = "King"
value = 71

[State 180, Victory Quote vs. Leona Heidern]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Leona" || Enemy, Name = "Leona Heidern"
value = 72

[State 180, Victory Quote vs. Mai Shiranui]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Mai Shiranui" || Enemy, Name = "Mai" || Enemy, Name = "cvsmai"
value = 73

[State 180, Victory Quote vs. Maxima]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Maxima"
value = 74

[State 180, Victory Quote vs. Nakoruru]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Nakoruru" || Enemy, Name = "cvsnakoruru"
value = 75

[State 180, Victory Quote vs. Raiden]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Raiden" || Enemy, Name = "Big Bear" || Enemy, Name = "cvsraiden"
value = 76

[State 180, Victory Quote vs. Ralf Jones]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Ralf" || Enemy, Name = "Ralf Jones"
value = 77

[State 180, Victory Quote vs. Saiki (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Saiki"
value = 78

[State 180, Victory Quote vs. Shen Woo (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Shen" || Enemy, Name = "Shen Woo" || Enemy, Name = "Shen_WLS"
value = 79

[State 180, Victory Quote vs. Shermie (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Shermie"
value = 80

[State 180, Victory Quote vs. Tessa (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Tessa" || Enemy, Name = "Tabasa"
value = 81

[State 180, Victory Quote vs. Vanessa (Normal mode)]
type = VictoryQuote
trigger1 = !var(40)
trigger1 = Enemy, Name = "Vanessa"
value = 82

[State 180, Generic Victory Quote (Orochi mode)]
type = VictoryQuote
trigger1 = var(40)
value = 83 + (Random % 12)

[State 180, Victory Quote vs. K' (Kusanagi mode)]
type = VictoryQuote
trigger1 = var(40)
trigger1 = Enemy, Name = "Ultimate K'" || Enemy, Name = "K'"
value = 95

[State 180, Victory Quote vs. Kyo Kusanagi (Orochi mode)]
type = VictoryQuote
triggerAll = var(40)
trigger1 = (Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName != "Jmorphman") || (Enemy, Name = "cvskyo" && Enemy, PalNo <= 6) || Enemy, Name = "cvskyo_normal" || Enemy, Name = "Kyo_WLS"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName = "Jmorphman" && Enemy, var(40) != 1
value = 96 + (Random % 2)

[State 180, Victory Quote vs. Leona Heidern]
type = VictoryQuote
trigger1 = var(40)
trigger1 = Enemy, Name = "Leona" || Enemy, Name = "Leona Heidern"
value = 98

[State 180, Victory Quote vs. Ryuji Yamazaki (Orochi mode)]
type = VictoryQuote
triggerAll = var(40)
trigger1 = Enemy, Name = "Yamazaki" || Enemy, Name = "Ryuji Yamazaki" || Enemy, Name = "cvsyamazaki"
value = 99

[State 180, Win 1]
type = ChangeState
trigger1 = command = "holdx" || command = "holda"
value = ifElse(var(40) != 1, 181, 185)

[State 180, Win 2]
type = ChangeState
triggerAll = var(40) != 1
trigger1 = command = "holdy" || command = "holdb"
value = 182

[State 180, Win 3]
type = ChangeState
triggerAll = var(40) != 1
trigger1 = command = "holdz" || command = "holdc"
value = 183

[State 180, Win vs Kyo]
type = ChangeState
triggerAll = var(40) != 1
triggerall = MatchOver && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
triggerall = NumEnemy
trigger1 = (Enemy, Name= "Kyo" || Enemy, Name = "Kyo Kusanagi" || Enemy, Name = "cvskyo" || Enemy, Name = "cvskyo_normal" || Enemy, Name = "Kyo_WLS") && Enemy, AuthorName != "Jmorphman"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, Authorname = "Jmorphman" && Enemy, var(40) != 1
value = 184

[State 180, Win Decider]
type = ChangeState
trigger1 = var(40) != 1
value = 181 + (Random % 3)

[State 180, Orochi Win Decider]
type = ChangeState
trigger1 = var(40) = 1
value = 185


;====<WIN 1>====
[StateDef 181]
type = S
physics = S
anim = 181
ctrl = 0

[State 181, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 300
flag = RoundNotOver

[State 181, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 181, 0
channel = 0



;====<WIN 2>====
[Statedef 182]
type = S
ctrl = 0
anim = 182
velset = 0,0

[State 182, AssertSpecial]
type = AssertSpecial
trigger1 = Time < 300
flag = RoundNotOver

[State 182, Laugh 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 182, 0
channel = 0

[State 182, Laugh 2]
type = PlaySnd
trigger1 = AnimElem = 10
value = 182, 1
channel = 0

[State 182, Laugh 3]
type = PlaySnd
trigger1 = AnimElem = 21
value = 182, 2
channel = 0



;====<WIN 3>====
[Statedef 183]
type = S
ctrl = 0
anim = 183
velset = 0,0

[State 183, AssertSpecial]
type = AssertSpecial
trigger1 = Time < 300
flag = RoundNotOver

[State 183, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 183, 0
channel = 0


;====<WIN VS KYO KUSANAGI>====
[Statedef 184]
type = S
ctrl = 0
anim = 184
velset = 0,0

[State 184, AssertSpecial]
type = AssertSpecial
trigger1 = Time < 300
flag = RoundNotOver

[State 184, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 184, 0
channel = 0



;====<WIN (OROCHI)>====
[StateDef 185]
type = S
physics = S
anim = 185
ctrl = 0

[State 181, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 300
flag = RoundNotOver

[State 181, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 185, 0
channel = 0



;==<TAUNT>==
[StateDef 195]
type = S
moveType = I
physics = S
anim = ifElse(Var(40) = 1,199,195)
velSet = 0,0
sprPriority = 1
ctrl = 0

[State 195, vs Kyo]
type = ChangeState
triggerAll = !var(40)
triggerAll = Time = 0
trigger1 = (Enemy, Name= "Kyo" || Enemy, Name = "Kyo Kusanagi" || Enemy, Name = "cvskyo" || Enemy, Name = "cvskyo_normal" || Enemy, Name = "Kyo_WLS") && Enemy, AuthorName != "Jmorphman"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, Authorname = "Jmorphman" && Enemy, var(40) != 1
value = 196

[State 195, Voice]
type = PlaySnd
triggerAll = !var(40)
trigger1 = AnimElem = 1
value = 195, ifElse(Random < 500, 0, 1)
channel = 0

[State 195, Voice]
type = PlaySnd
triggerAll = var(40)
trigger1 = AnimElem = 3
value = 195, 10
channel = 0

[State 195, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;==<TAUNT VS KYO>==
[Statedef 196]
type = S
moveType = I
physics = S
anim = 196
velSet = 0,0
sprPriority = 1
ctrl = 0

[State 195, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 195,2
channel = 0

[State 196, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;====<CHEAP K.O.>====
[StateDef 5950]
type = S
moveType = H
physics = S
anim = 5950
velSet = 0,0

[State 5950, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 5950, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5950, Assert: NoKOsnd]
type = AssertSpecial
trigger1 = 1
flag = NoKOsnd

[State 5950, StopSnd]
type = StopSnd
trigger1 = !Time && !Alive
channel = 0

[State 5950, KO Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && !Alive
value = 5950,0 + 10 * (var(40) = 1)

[State 5950, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 8
value = F7,0

[State 5950, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 8
anim = F60
posType = P1
pos = 0,0
sprPriority = -3

[State 5950, End]
type = ChangeState
trigger1= !AnimTime
value = ifElse(Alive, 5110, 5150)




;====<AIR HIT TRANSITION>====
[Statedef 5035]
type = A
movetype = H
physics = N

[State 5035, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5035)
trigger1 = Anim = [5000,5029]
value = 5035

[State 5035, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yAccel)

[State 5035, Recover]
type = ChangeState
triggerAll = !HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5040

[State 5035, Fall]
type = ChangeState
triggerAll = HitFall
trigger1 = HitOver
trigger2 = !AnimTime
trigger3 = vel y > 0 && pos y >= 10
trigger4 = !Time
trigger4 = Anim != 5035
value = 5050



;===
;===<-2 STATES>=
;===
[StateDef -2]

;#ADD004BASIC PIEs#
;//==
;// add004-sctrls-start
;//==
;sys::-2::partners_standby ; ???????
[state 0]
	type=selfstate
	value=190190
	ctrl=0
	;;---
	triggerall=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	triggerall=(stateno!=[190190,190199]) && playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(22)=4
	;;---// switch / change ;(??)
	trigger1=sysfvar(4)<1 && ( ctrl || (time<2 && stateno<600) ) && playerid(floor(sysfvar(0))),var(48)=11
	trigger1=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// assist ;(??)
	trigger2=sysfvar(4)=1 && ( ctrl || (stateno-playerid(floor(sysfvar(0))),var(53+id-playerid(floor(sysfvar(0))),sysvar(0))!=[0,999]) )
	trigger2=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// switch-canceling ;(??????)
	trigger3=sysfvar(4)=2 && ( ctrl || stateno<160 )
	trigger3=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// player-priority ;(??)
	trigger4=sysfvar(4)<1 && playerid(floor(sysfvar(0))),var(15)!=id
	;;---
	ignorehitpause=1

;sys::-2::partners_change_interrupted ; ??????
[state 0]
	type=varset
	trigger1=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(48)=21 && sysfvar(4)<1
	sysfvar(4)=2 ;; (0:main / 1:assist / 2:switch-canceling)

;sys::-2::helper::bar004 ; ?????
[state 0]
	type=helper
	triggerall=!ishelper && !numhelper(90900)
	trigger1=numpartner
	trigger1=id<(partner,id) && partner,numhelper(90900)=0
	trigger2=!numpartner
	id=90900
	stateno=90900
	helpertype=normal
	ownpal=1
	size.air.front=1702252 ;; <<-version
	size.height=0
	ignorehitpause=1
	supermovetime=88888
	pausemovetime=88888
	pos=0,88888

;sys::-2::get_helper::bar004_id ; ID??
[state 0]
	type=varset
	trigger1=!ishelper && numhelper(90900)
	trigger1=(helper(90900),var(0)=90900) && (sysfvar(0)!=helper(90900),id)
	sysfvar(0)=(helper(90900),id)
;sys::-2::get_players_id2
[state 0]
	type=varset
	trigger1=!ishelper && numpartner
	trigger1=!numhelper(90900) && (partner,numhelper(90900)) && (sysfvar(0)!=(partner,sysfvar(0)))
	sysfvar(0)=(partner,sysfvar(0))

;sys::-2::bk/jd_system ; ?????/????D
[state 0]
	type=hitoverride
	trigger1=(numprojid(195502)||numprojid(195503)) && !ishelper && roundstate=2 && alive && (ctrl || stateno=52)
	attr=sca,na,sa,ha,np,sp,hp
	stateno=195500
	time=1
	ignorehitpause=1

;//==
;;>>@Config.Face>>
;sys::-2::face_d ; portrait (?)
[state 0]
	type=explod
	trigger1=!ishelper && alive && !numexplod(490600) && selfanimexist(909002)
	trigger1=sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490600)
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909002
	space=screen
	postype=left
	facing=ifelse(teamside=1,1,-1)
	ownpal=1
	bindtime=-1
	removetime=-1
	scale=playerid(floor(sysfvar(0))),fvar(32-(id=playerid(floor(sysfvar(0))),var(15))*10), playerid(floor(sysfvar(0))),fvar(33-(id=playerid(floor(sysfvar(0))),var(15))*10)
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(30-(id=playerid(floor(sysfvar(0))),var(15))*10))), floor(const240p(playerid(floor(sysfvar(0))),fvar(31-(id=playerid(floor(sysfvar(0))),var(15))*10)))
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(36-(id=playerid(floor(sysfvar(0))),var(15))*10))
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(34-(id=playerid(floor(sysfvar(0))),var(15))*10)), floor(playerid(floor(sysfvar(0))),fvar(35-(id=playerid(floor(sysfvar(0))),var(15))*10))
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1
;sys::-2::face_d_mod
[state 0]
	type=removeexplod
	trigger1=sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900)
	trigger1=(playerid(floor(sysfvar(0))),var(9)&262144) || !(playerid(floor(sysfvar(0))),var(9)&4)
	trigger2=roundstate!=2 || (stateno=5150 && time=5 && !alive)
	id=490600
	ignorehitpause=1

;//==
;;>>@Config.Camera>>
;sys::-2::camera_nc ; ????
[state 0]
	type=screenbound
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	movecamera=0,0
	ignorehitpause=1
;sys::-2::camera_np
[state 0]
	type=playerpush
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	ignorehitpause=1
;sys::-2::camera_nc2
[state 0]
	type=screenbound
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && (playerid(floor(sysfvar(0))),var(7)&65536) ;; system_switch
	value= ((numpartner && sysfvar(4)<1) || !numpartner) ;; [def=0]
	movecamera=0,0 ;; [x,y]
	ignorehitpause=1

;//==
;sys::-2::add.option2-noko
[state 0] ;; opt-noko
	type=assertspecial
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && (playerid(floor(sysfvar(0))),var(9)&65536) ;; opt-noko
	flag=noko
	ignorehitpause=1
;sys::-2::add.option3-life-mod
[state 0] ;; opt-life-mod
	type=lifeadd
	trigger1=!ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && playerid(floor(sysfvar(0))),var(23)!=0 ;; opt-mod-life
	value=playerid(floor(sysfvar(0))),var(23)
	kill=0
	ignorehitpause=1

;//==
;// optional settings
;sys::-2::guard_crush_fx ; ????????
[state 0]
	type=palfx
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && (gametime%5=0) && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=40
	time=2
	add=200,0,0
;sys::-2::guard_crush_cs
[state 0]
	type=changestate
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=50
	value=190010
	ignorehitpause=1
;;--- dizzy
;sys::-2::goto-dizzy_s/c
[state 0] ;[.03-2d1]
	type=selfstate
	trigger1=(stateno=5001 || stateno=5011) && hitover     && alive && !ishelper && life>1 && roundstate=2 && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195201 ;; (goto-dizzy:190116)
;sys::-2::goto-dizzy_a/l
[state 0] ;[.03-2d2]
	type=selfstate
	trigger1=(stateno=5030 || stateno=5071) && hitshakeover && alive && !ishelper && life>1 && roundstate=2 && sysfvar(0)>id && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195050
;;--- fadeout when KOed ; KO????
;sys::-2::st5150-1
[state 0]
	type=varset
	trigger1=stateno=5150 && time=1 && alive=0 && !ishelper && numpartner
	sysvar(1)=(roundstate<=2)
;sys::-2::st5150-2
[state 0]
	type=assertspecial
	trigger1=stateno=5150 && alive=0 && !ishelper && numpartner && sysvar(1) && (((time=[80,150]) && time%10<5) || time>150)
	flag=invisible
	flag2=noshadow
;;--- intro-pos-reset
;sys::-2::st5900-p3
[state 0]
	type=turn
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && facing=ifelse(teamside=1,-1,1)
;sys::-2::st5900-p4
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && playeridexist(id-2)
	trigger1=playerid(id-2),ishelper=0 && playerid(id-2),teamside=teamside
	x=const240p(120)*ifelse(teamside=1,-1,1)
;sys::-2::st5900-p5
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>2 && playeridexist(id-3)
	trigger1=playerid(id-3),ishelper=0 && playerid(id-3),teamside=teamside
	x=const240p(144)*ifelse(teamside=1,-1,1)

;//==
;// add004-sctrls-end
;//==


[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(30) < 0
var(30) = HitPauseTime
ignoreHitPause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
trigger1 = StateNo != [1100,1140]
value = 2, var(31)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(32) >= 0
value = 3, var(32)
channel = 2
ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
trigger3 = MoveHit = 1 && NumEnemy
trigger3 = var(33) = 8015 || var(33) = 8016 || var(33) = 8017
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
triggerAll = MoveHit = 1 && var(30) = HitPauseTime
triggerAll = NumEnemy && var(9)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1) && (StateNo!=[3800,3899])
trigger2 = (EnemyNear, MoveReversed != 1) && StateNo = [1100,1299]
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))), var(36)
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Counter Flag]
type = VarSet
trigger1 = NumEnemy
var(9) = (EnemyNear, MoveType = A)
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = 1
var(30) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 30
last = 36
value = -1
ignoreHitPause = 1

[State -2, P2 Facing]
type = TargetFacing
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver) && !(Target, HitFall) && (Target, Time <= 1)
trigger2 = MoveContact = 1 && NumTarget(1232)
trigger2 = !(Target, HitShakeOver) && (Target, Time <= 1)
value = ifElse(P2Dist x >= 0, -1, 1)
ignoreHitPause = 1

[State -2, P2 Safe Fall]
type = TargetState
trigger1 = NumTarget = 1
trigger1 = Target, command = "recovery"
trigger1 = Target, pos y >= -48 && Target, vel y > 0
trigger1 = Target, Alive && Target, HitFall && Target, GetHitVar(fall.recover)
trigger1 = Target, StateNo = 5030 || Target, StateNo = 5035 || Target, StateNo = 5050 || Target, StateNo = 5071
value = 5205
ignoreHitPause = 1

[State -2, Assert: UnGuardable]
type = AssertSpecial
trigger1 = var(17) > 0
trigger1 = var(17) := (var(17) - 1)
flag = UnGuardable
ignoreHitPause = 1

[State -2, Hit Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -2, Hit Count Reset]
type = VarSet
trigger1 = NumEnemy && var(13)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
var(13) = 0
ignoreHitPause = 1

[State -2, Juggle Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State -2, Juggle Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(15)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100,5109]) && (Enemy, Time >= 1)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(15)
trigger1 = (EnemyNear(0), StateType != A) && (EnemyNear(0), Time >= 1)
trigger2 = (EnemyNear(0), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), StateType != A) && (EnemyNear(0), Time >= 1)
trigger4 = (EnemyNear(1), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Free Juggling]
type = VarSet
trigger1 = RoundState != 2
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Flag]
type = VarSet
trigger1 = NumEnemy && !var(16)
trigger1 = (EnemyNear, StateNo = 5040) && !(EnemyNear, Ctrl)
var(16) = 1
ignorehitpause = 1

[State -2, Juggle Flag Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(16)
trigger1 = (Enemy, MoveType != H) && (Enemy, StateNo != 5040)
trigger2 = !(Enemy, HitShakeOver) || (Enemy, StateType = L) || (Enemy, Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Juggle Flag Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(16)
trigger1 = (EnemyNear(0), MoveType != H) && (EnemyNear(0), StateNo != 5040)
trigger2 = !(EnemyNear(0), HitShakeOver) || (EnemyNear(0), StateType = L) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), MoveType != H) && (EnemyNear(1), StateNo != 5040)
trigger4 = !(EnemyNear(1), HitShakeOver) || (EnemyNear(1), StateType = L) || (EnemyNear(1), Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Custom Combo End]
type = VarSet
trigger1 = var(20) < 0
trigger2 = MoveType = H
trigger3 = RoundState != 2
trigger4 = (StateNo = [3000,4999])
var(20) = 0
ignoreHitPause=1

[State -2, Custom Combo Time]
type = VarAdd
trigger1 = var(20) > 0
var(20) = -1
ignoreHitPause = 1

[State -2, Custom Combo Asserts]
type = AssertSpecial
trigger1 = var(20) > 0
flag = NoStandGuard
flag2 = NoCrouchGuard
flag3 = NoAirGuard
ignoreHitPause = 1

[State -2, Custom Combo PalFX]
type = PalFX
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignoreHitPause = 1

[State -2, Custom Combo PalFX]
type = PalFX
trigger1 = var(20) = [1,60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignoreHitPause = 1

[State -2, Throws Allowed]
type = VarSet
trigger1 = EnemyNear, MoveType != H
trigger1 = EnemyNear, StateNo != 140
trigger1 = (EnemyNear, ctrl && EnemyNear, Time >= 1) || (EnemyNear, Time >= 8)
trigger2 = EnemyNear, MoveType = A
trigger3 = (EnemyNear, StateNo != [0,52]) && (EnemyNear, StateNo != [120,155]) && (EnemyNear, StateNo != [5000,5120])
trigger4 = var(20) || var(21) || var(22)
var(38) = 0

[State -2, Throws Disallowed]
type = VarSet
triggerAll = NumEnemy
trigger1 = EnemyNear, StateNo = [150,155]
trigger2 = (EnemyNear, StateNo = 51 || EnemyNear, StateNo = 140) && (EnemyNear, PrevStateNo = [150, 155])
trigger3 = EnemyNear, MoveType = H && EnemyNear, StateType != A && !var(20) && !var(21) && !var(22)
trigger4 = (EnemyNear, StateNo = [5020,5040]) && EnemyNear, HitFall = 0
trigger5 = EnemyNear, StateNo = 40 && EnemyNear, PrevStateNo != 52 && (EnemyNear, Anim != [0, 29])
var(38) = 1
ignorehitpause = 1

[State -2, Dampener]
type = VarSet
trigger1 = 1
fvar(10) = ifElse(var(13) < 6, 24, ifElse(var(13) >= 23, 1, 29 - var(13))) / 24.0
ignoreHitPause = 1

[State -2, Dampener - Custom Combo]
type = VarSet
trigger1 = var(20)
fvar(10) = 0.72 * (10 - ifElse(var(13) >= 10, 10, var(13))) / 10.0
ignoreHitPause = 1

[State -2, Dampener - Custom Combo Limiter]
type = VarSet
trigger1 = var(20)
trigger1 = 0
fvar(10) = ifElse(var(13), 0, 0.72)
ignoreHitPause = 1

[State -2, Dampener - Supers]
type = VarSet
trigger1 = (StateNo = [3000,4999])
fvar(10) = ifElse(var(22), 0.6, ifElse(var(21), 0.8, 1.0))
ignoreHitPause = 1

[State -2, Dampener Limit]
type = VarSet
trigger1 = fvar(10) < 0
fvar(10) = 0
ignoreHitPause = 1

[State -2, Root Dampener]
type = VarSet
trigger1 = 1
fvar(11) = fvar(10) * ifElse(var(9), 1.2, 1)
ignoreHitPause = 1

[State -2, Defense Levels]
type = LifeAdd
trigger1 = var(40) = 1
trigger1 = GetHitVar(HitCount) = 1 && GetHitVar(Damage)
trigger1 = StateNo != [760,762]
value = -ceil(ifElse(var(40) = 2, 0.25, 0.125) * GetHitVar(Damage))
kill = 0
ignoreHitPause = 1

[State -2, Voice Position]
type = SndPan
trigger1 = 1
channel = 0
pan = 0
ignoreHitPause = 1

[State -2, KO Sound Variable]
type = VarSet
triggerAll = StateNo != 5950
trigger1 = Alive && var(41) > 0
trigger2 = !Alive && var(41) < 2
var(41) = ifElse(Alive, 0, var(41) + 1)
ignoreHitPause = 1

[State -2, KO Sound]
type = PlaySnd
triggerAll = PrevStateNo != 5950
trigger1 = !Alive && var(41) = 1
trigger1 = var(41) := 2
value = 11, ifElse((var(40) = 1), 2, 1) + 2 * (StateNo = 5130)
ignoreHitPause = 1

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(1206) && !NumHelper(1205)
ID = 1206

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(1606) && !NumHelper(1605)
ID = 1606

[State -2, VarSet]
type = VarSet
trigger1 = !NumTarget(1300) && var(11)
var(11) = 0

[State -2, VarSet]
type = VarSet
trigger1 = !var(11)
var(12) = 0

[State -2, Special/Super Throws Allowed]
type = VarSet
trigger1 = 1
var(43) = 0

[State -2, Special/Super Throws Disallowed]
type = VarSet
trigger1 = (EnemyNear, StateNo = [150,155]) && StateNo != 1060
trigger2 = (EnemyNear, StateNo = [5020,5040]) && !(EnemyNear, HitFall)
trigger3 = ((EnemyNear, StateNo = 0) || (EnemyNear, StateNo = 52)) && (EnemyNear, PrevStateNo = [5000,5040]) && ((EnemyNear, Time <= 0) || !(EnemyNear, Ctrl))
trigger4 = (EnemyNear, StateNo = 0) && (EnemyNear, PrevStateNo = 52) && ((EnemyNear, Time <= 0) || !(EnemyNear, Ctrl))
trigger5 = (EnemyNear, StateNo = 40) && (EnemyNear, Time >= 1 || EnemyNear, PrevStateNo = 0 || EnemyNear, PrevStateNo = 52)
trigger6 = EnemyNear, StateNo = 5110
var(43) = 1

[State -2, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "AI = %d Mode = %d Attack = %f Hits = %d Juggle = %d"
params = AILevel, var(40), fvar(11), var(13), var(15)
ignoreHitPause = 1

[State -2, Debug]
type = AppendToClipboard
trigger1 = 1
text = "\nBy Knuckles8864"
ignoreHitPause = 1



;===
;===<-3 STATES>=
;===
[StateDef -3]

[State -3, GameTime]
type = VarSet
trigger1 = 1
var(58) = GameTime
ignoreHitPause = 1

[State -3, ProjContact Reset]
type = VarSet
triggerAll = var(18)
trigger1 = (StateNo != [1000,1030]) && (StateNo != [3000,3099])
trigger2 = (StateNo != [1000,1030]) && AnimElemTime(4) < 0
trigger3 = StateNo = 3001 && AnimElemTime(4) < 0
var(18) = 0

[State -3, Projectile Flag Off]
type = VarSet
trigger1 = 1
var(39) = 0
ignoreHitPause = 1

[State -3, Projectile Flag On]
type = VarSet
triggerAll = var(20) <= 0
trigger1 = NumHelper(1005)
trigger1 = Helper(1005), StateNo = 1005
trigger2 = NumHelper(1005)
trigger2 = Helper(1005), StateNo = 1035
;trigger3 = NumHelper(3205)
;trigger3 = Helper(3205), StateNo = 3205
var(39) = 1
ignoreHitPause = 1

[State -3, Chain Combo Reset]
type = VarSet
trigger1 = 1
var(4) = 0
ignoreHitPause = 1

[State -3, Chain Combo Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699]) && MoveContact
trigger2 = var(20) && (StateNo = [1000,2999]) && StateType != A && (MoveContact || var(18))
var(4) = 1
ignoreHitPause = 1

[State -3, Command Cancel Reset]
type = VarSet
trigger1 = 1
var(5) = 0
ignoreHitPause = 1

[State -3, Command Cancel Check]
type = VarSet
triggerAll = !var(20)
trigger1 = StateNo = 200 && MoveContact
trigger2 = StateNo = 205 && MoveContact
trigger3 = StateNo = 210 && AnimElemTime(6) < 0
trigger4 = StateNo = 220 && AnimElemTime(7) < 0
trigger5 = StateNo = 225 && AnimElemTime(7) < 0
trigger6 = StateNo = 230 && MoveContact
trigger7 = StateNo = 235 && MoveContact
trigger8 = StateNo = 400 && MoveContact
trigger9 = StateNo = 410 && AnimElemTime(4) < 0
trigger12 = StateNo = 420 && AnimElemTime(5) < 0
trigger13 = StateNo = 430 && MoveContact
trigger14 = StateNo = 450 && AnimElemTime(6) < 0
var(5) = 1
ignorehitpause = 1

[State -3, Cancel Reset]
type = VarSet
trigger1 = 1
var(6) = 0
ignoreHitPause = 1

[State -3, Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200 && MoveContact
trigger5 = StateNo = 205 && MoveContact
trigger6 = StateNo = 210 && AnimElemTime(6) < 0
trigger7 = StateNo = 218 && AnimElemTime(5) < 0
trigger8 = StateNo = 220 && AnimElemTime(7) < 0
trigger9 = StateNo = 225 && AnimElemTime(7) < 0
trigger10 = StateNo = 230 && MoveContact
trigger11 = StateNo = 235 && MoveContact
trigger12 = StateNo = 400 && MoveContact
trigger13 = StateNo = 410 && AnimElemTime(4) < 0
trigger14 = StateNo = 420 && AnimElemTime(5) < 0
trigger15 = StateNo = 430 && MoveContact
var(6) = 1
ignoreHitPause = 1

[State -3, Super Cancel Reset]
type = VarSet
trigger1 = 1
var(7) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200 && MoveContact
trigger5 = StateNo = 205 && MoveContact
trigger6 = StateNo = 210 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger7 = StateNo = 218 && (AnimElemTime(5) < 0 || (MoveContact = [1,8]))
trigger8 = StateNo = 220 && AnimElemTime(7) >= 0 && Abs(P2BodyDist X) <= 25
trigger9 = StateNo = 230 && MoveContact
trigger10 = StateNo = 235 && MoveContact
trigger11 = StateNo = 240 && (AnimElemTime(4) < 0 || (MoveContact = [1,8]))
trigger12 = StateNo = 249 && (AnimElemTime(8) < 0 || (MoveContact = [1,8]))
trigger13 = StateNo = 250 && AnimElemTime(7) >= 0 && Abs(P2BodyDist X) <= 25
trigger14 = StateNo = 400 && MoveContact
trigger15 = StateNo = 410 && (AnimElemTime(4) < 0 || (MoveContact = [1,8]))
trigger16 = StateNo = 420 && (AnimElemTime(5) < 0 || (MoveContact = [1,8]))
trigger17 = StateNo = 430 && MoveContact
trigger18 = (StateNo = [1000,1030]) && (AnimElemTime(4) = [1,8])
trigger19 = (StateNo = [1100, 1130]) && AnimElemTime(4) < 0
trigger20 = StateNo = 1140 && AnimElemTime(24) < 0
trigger21 = StateNo = 1200 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger22 = StateNo = 1210 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger23 = StateNo = 1230 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger24 = StateNo = 1240 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger25 = StateNo = 1310 && AnimElemTime(4) < 0 && (MoveContact = [1,8])
trigger26 = StateNo = 1360 && AnimElemTime(4) < 0 && (MoveContact = [1,8])
trigger27 = StateNo = 1420 && AnimElemTime(4) < 0 && (MoveContact = [1,8])
trigger28 = StateNo = 1434 && AnimElemTime(4) < 0 && (MoveContact = [1,8])
var(7) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = 1
var(8) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = StateNo = 3210 && AnimElemTime(50) < 0 && MoveContact
trigger2 = StateNo = 3500 && AnimElemTime(4) >= 0 && AnimElemTime(16) < 0 && MoveContact
trigger3 = StateNo = 3610 && AnimElemTime(50) < 0 && MoveContact
var(8) = 1
ignoreHitPause = 1

[State -3, Super Cancel Flag Reset]
type = VarSet
trigger1 = var(21)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(21) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Flag Reset]
type = VarSet
trigger1 = var(22)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(22) = 0
ignoreHitPause = 1

[State -3, Parry Detection]
type = Helper
triggerAll = RoundState = 2 && !NumHelper(765) && !var(20)
triggerAll = (MoveType = I && ctrl) || (StateNo = [760, 762]) || StateNo = 5120
triggerAll = (command != "rlsfwd" && command != "rlsback" && command != "rlsup" && command != "rlsdown") || AILevel
trigger1 = !AILevel && (StateType = S || StateType = C || StateNo = 5120) && (command = "fwd" || command = "down")
trigger2 = !AILevel && StateType = A && (var(3) != 1 && var(3) != 2) && command = "fwd"
trigger3 = AILevel && (StateNo != [760,762]) && InGuardDist && Random < 50
trigger4 = AILevel && (StateNo = [760,762]) && Time = 14 && Random < 667
helperType = Normal
stateNo = 765
ID = 765
name = "Parry Detection"
posType = P1
pauseMoveTime = 65535
superMoveTime = 65535

[State -3, Parry Attacks]
type = ChangeState
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = Helper(765), StateNo = 766
value = ifElse((Helper(765), Anim = 767), 762, ifElse((Helper(765), Anim = 766), 761, 760))
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 765)
attr = SA, AP
stateNo = 760
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 766)
attr = C, AP
stateNo = 761
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Parry Projectiles]
type = HitOverride
trigger1 = (StateNo != [760,762]) && NumHelper(765)
trigger1 = !(Helper(765), var(0)) && (Helper(765), Anim = 767)
attr = SCA, AP
stateNo = 762
slot = 0
time = 1
ignoreHitPause = 1

[State -3, Assert: NoWalk after Parry]
type = AssertSpecial
trigger1 = var(26) > 0
trigger1 = var(26) := (var(26)-1)
flag = NoWalk
ignoreHitPause = 1

[State -3, Corner Push]
type = VarSet
trigger1 = fvar(5)
trigger1 = NumTarget
trigger1 = Target, HitOver || (Target, GetHitVar(HitShakeTime) > 0 && Target, Time <= 0)
fvar(5) = 0

[State -3, Corner Push]
type = VarSet
trigger1 = MoveContact = 1 && NumTarget
fvar(5) = Target, GetHitVar(xVel)
ignoreHitPause = 1

[State -3, Corner Push]
type = PosAdd
triggerAll = fvar(5)
triggerAll = (StateType = S || StateType = C) && NumTarget
triggerAll = !HitPauseTime && Target, GetHitVar(HitShakeTime) <= 0
triggerAll = (Target, StateType = S || Target, StateType = C) && !(Target, GetHitVar(yvel)) && !(Target, HitFall)
trigger1 = Target, FrontEdgeBodyDist <= abs(Target, vel x)
trigger1 = (Target, GetHitVar(xvel) * Target, Facing) > 0
trigger2 = Target, BackEdgeBodyDist <= abs(target, vel x)
trigger2 = (Target, GetHitVar(xvel) * Target, Facing) < 0
x = ifElse(Target, FrontEdgeBodyDist <= 0, -1, 1) * (Target, Facing) * fvar(5)

[State -3, Corner Push]
type = VarSet
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0

[State -3, Corner Push]
type = VarSet
trigger1 = NumTarget
trigger1 = Target, GetHitVar(HitShakeTime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, EX FX Decrement]
type = VarAdd
trigger1 = var(25) > 0
var(25) = -1

[State -3, EX FX Reset]
type = VarSet
trigger1 = (StateNo != [1000,2999]) || MoveType = H
var(25) = 0

[State -3, EX Flash]
type = PalFX
trigger1 = !(GameTime % 2) && var(25)
time = 1
color = 0
mul = 256, 224, 0
add = 128, 128, 128
ignoreHitPause = 1

[State -3, Movement AfterImage]
type = AfterImage
triggerAll = Time = 1 && !var(20)
trigger1 = StateNo = 50 && (var(3) = 2 || var(3) = 3)
trigger2 = (StateNo = [700,715])
trigger3 = StateNo = 5983
time = 2
timeGap = 1
frameGap = 4
length = 9
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.9,0.9,0.9
trans = Add1

[State -3, Level 1 Super AfterImage]
type = AfterImage
trigger1 = (StateNo = 3000 || StateNo = 3100 || StateNo = 3200 || StateNo = 3300 || StateNo = 3400 || StateNo = 3500 || StateNo = 3600) && Time = 43
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 2 Super AfterImage]
type = AfterImage
trigger1 = StateNo = 3050 && Time = 43
trigger2 = StateNo = 3150 && Time = 43
trigger3 = StateNo = 3151 && AnimElem = 35
trigger4 = StateNo = 3250 && Time = 43
trigger5 = StateNo = 3650 && Time = 43
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 32,32,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 3 Super AfterImage]
type = AfterImage
trigger1 = StateNo = 3400 && Time = 43
trigger2 = StateNo = 3410 && AnimElem = 1
trigger3 = StateNo = 3700 && Time = 43
trigger4 = StateNo = 3800 && Time = 1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,32,32
palPostBright = 0,0,0
palAdd = 0,0,0
palMul= 0.75,0.75,0.75
trans = Add1

[State -3, AfterImage Persist]
type = AfterImageTime
trigger1 = StateNo = 50 || (StateNo = [600,699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20)
trigger3 = StateNo = [700,715]
trigger4 = (StateNo = [3000,4999])
time = 2

[State -3, Underground Juggle Prevention]
type = TargetBind
trigger1 = MoveContact = 1
trigger1 = NumTarget && NumEnemy
trigger1 = (Target, Time = 0) && (Target, ID = EnemyNear, ID)
trigger1 = !(Target, HitShakeOver) && (Target, pos y > 0)
pos = ceil(P2Dist x), ceil(-pos y)
ignoreHitPause = 1

[State -3, Prevent Crossup]
type = Width
trigger1 = MoveType != H
edge = 8, 0
ignoreHitPause = 1

[State -3, Variable Height]
type = PlayerPush
triggerAll = StateType = A && MoveType != H && NumEnemy
triggerAll = P2BodyDist x = [-(EnemyNear, const(size.ground.back) + EnemyNear, const(size.ground.front)), 0]
trigger1 = P2StateType = S
trigger1 = P2Dist y >= (EnemyNear, const(size.height) - 12)
trigger2 = P2StateType = C
trigger2 = P2Dist y >= (EnemyNear, const(size.height) - 28)
trigger3 = P2StateType = L
trigger3 = P2Dist y >= 12
value = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerall = Alive && Time = 1
triggerall = StateNo = 5000 || StateNo = 5010
trigger1 = GetHitVar(AnimType) >= 2 && Random < 500
trigger2 = GetHitVar(AnimType) = 1 && Random < 375
trigger3 = GetHitVar(AnimType) = 0 && Random < (250 * (AILevel ** 2 / 64.0))
value = 5000,(Random % 4) + 10 * (var(40) = 1)
channel = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerAll = Alive && Time = 1
trigger1 = (StateNo = 5000 || StateNo = 5010) && NumEnemy
trigger1 = GetHitVar(fall) || (EnemyNear, HitDefAttr = SCA,SA,HA)
trigger2 = (StateNo = 5020 || StateNo = 5070 || StateNo = 5080)
trigger3 = (StateNo = 5050 || StateNo = 5100) && (PrevStateNo != [5000,5199])
value = 5000,(Random % 4) + 10 * (var(40) = 1)
channel = 0
ignoreHitPause = 1

[State -3, Cheap KO]
type = ChangeState
trigger1 = !Alive && (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo = [150,153])
value = 5950
ignoreHitPause = 1

[State -3, Assert: NoKOsnd (Cheap KO)]
type = AssertSpecial
trigger1 = (StateNo = [5000,5010])
trigger1 = (PrevStateNo = [130,131]) || (PrevStateNo = [140,141]) || (PrevStateNo=[150,153])
flag = NoKOsnd
ignoreHitPause = 1

[State -3, Custom Combo Finish]
type = Helper
triggerAll = WinKO && var(20)
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = [1,4]
trigger2 = NumHelper(1005)
trigger2 = (Helper(1005), StateNo = [1005,1007]) && (Helper(1005), var(18))
trigger3 = StateNo = 810 && (AnimElemTime(5) = [0, 1])
trigger4 = StateNo = 820 && (AnimElemTime(9) = [0, 1])
trigger5 = StateNo = 1070 && (AnimElemTime(4) = [0, 1])
trigger6 = StateNo = 1520 && (AnimElemTime(5) = [0, 1])
helperType = Normal
stateNo = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
posType = left
pos = 160, -120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -3, Custom Combo Finish]
type = Helper
triggerAll = var(20)
triggerAll = WinKO && RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = 1
trigger2 = NumHelper(1005)
trigger2 = (Helper(1005), StateNo = [1005,1007]) && (Helper(1005), var(18))
helperType = normal
stateNo = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
posType = Left
pos = 160,-120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -3, Super Finish]
type = Helper
triggerAll = WinKO
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = 1 && (StateNo = [3000,4999])
trigger1 = var(23) := StateNo
trigger2 = (StateNo = [3000,3099])
trigger2 = var(23) := 3000
trigger3 = (StateNo = [3100,3199])
trigger3 = var(23) := 3100
trigger4 = (StateNo = [3200,3299])
trigger4 = var(23) := 3200
trigger5 = (StateNo = [3300,3399])
trigger5 = var(23) := 3300
trigger6 = StateNo = [3400,3499]
trigger6 = var(23) := 3400
trigger7 = (StateNo = [3500,3599])
trigger7 = var(23) := 3500
trigger8 = (StateNo = [3600,3699])
trigger8 = var(23) := 3600
trigger9 = (StateNo = [3700,3799])
trigger9 = var(23) := 3700
trigger10 = (StateNo = [3800,3899])
trigger10 = var(23) := 3800
helperType = Normal
stateNo = 8600
ID = 8600
name = "Super Finish"
posType = left
pos = 160,-120
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

