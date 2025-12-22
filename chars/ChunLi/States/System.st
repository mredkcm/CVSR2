; ADD004 BASIC PIEs ReBuilded CNS (24/12/2018)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==

; _________________________________________
;| Chun-Li by Jmorphman                    |
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

[State 10, Reversed Commands: change to jumping]
type = ChangeState
trigger1 = !Time
trigger1 = NumExplod(92828282) || NumExplod(92468246) && command = "holddown"
value = 40

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

[State 12, Reversed Commands: change to "fake" crouch state]
type = ChangeState
trigger1 = !Time
trigger1 = (NumExplod(92828282) || NumExplod(92468246)) && command = "holdup"
value = 13

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


;"Fake" crouch state (for reversed commands)
[StateDef 13]
type = C
physics = C
moveType = I
velSet = 0,0
sprPriority = 0
ctrl = 1

[State 13, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 10 && Anim != 11 && Anim != 141
value = 10

[State 13, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 10 && !AnimTime
trigger2 = Anim = 141 && !AnimTime
value = 11



;====<WALKING>====
[StateDef 20]
type = S
physics = S
moveType = I
sprPriority = 0

[State 20, VelSet]
type = VelSet
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = command = "holdfwd"
trigger2 = NumExplod(94646464) || NumExplod(92468246)
trigger2 = command = "holdback"
x = const(velocity.walk.fwd.x)

[State 20, VelSet]
type = VelSet
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = command = "holdback"
trigger2 = NumExplod(94646464) || NumExplod(92468246)
trigger2 = command = "holdfwd"
x = const(velocity.walk.back.x)

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
ctrl = 0
velSet = 0,0
sprPriority = 1
faceP2 = 1

[State 40, Reversed Commands: change to "fake" crouch state]
type = ChangeState
trigger1 = !Time
trigger1 = (NumExplod(92828282) || NumExplod(92468246)) && command = "holdup"
value = 13

[State 40, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 40

[State 40, Direction]
type = VarSet
trigger1 = !AILevel
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdfwd", 1, ifElse(command = "holdback", -1, sysvar(1))))

[State 40, Direction (Reversed Commands)]
type = VarSet
trigger1 = !AILevel
trigger1 = NumExplod(94646464) || NumExplod(92468246)
sysvar(1) = ifElse(!Time, 0, ifElse(command = "holdback", 1, ifElse(command = "holdfwd", -1, sysvar(1))))

[State 40, Direction (AI)]
type = VarSet
trigger1 = AILevel
sysvar(1) = ifElse((EnemyNear, MoveType != A || BackEdgeBodyDist <= 10), 1, ifElse((EnemyNear, MoveType = A), -1, 0))

[State 40, High Jump]
type = VarSet
trigger1 = !Time && !AILevel
;ifElse(command = "highjump", 3, 0)
var(3) = ifElse(NumExplod(90000408), 3, 0)

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
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && command != "holdup" && (var(3) != [1,2])
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && command != "holddown" && (var(3) != [1,2])
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
trigger1 = !AnimTime
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = ifElse(!sysvar(1), const(velocity.jump.y), ifElse(sysvar(1) = 1, -13.046875, -13.4375))

[State 40, Velocity: Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 1
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.75 * ifElse(!sysvar(1), const(velocity.jump.y), ifElse(sysvar(1) = 1, -13.046875, -13.4375))

[State 40, Velocity: Long Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 2
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * ifElse(!sysvar(1), const(velocity.jump.y), ifElse(sysvar(1) = 1, -13.046875, -13.4375))

[State 40, Velocity: Long Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifElse(!sysvar(1), const(velocity.runjump.y), ifElse(sysvar(1) = 1, -13.046875, -13.4375))

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
value = ifElse(!vel x, 41, ifElse(vel x > 0, 42, 43)) + 10 * (var(3) = [1,2])
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

[State 50, VelAdd]
type = VelAdd
trigger1 = vel x
trigger1 = Time >= 1 || PrevStateNo != 40
x = ifElse((var(3) = [2,3]), -0.04577636719, -0.03051757813) * ifElse(vel x < 0, -1, 1)

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

[State 51, VelAdd]
type = VelAdd
trigger1 = vel x
trigger1 = Time >= 1 || PrevStateNo != 40
x = ifElse((var(3) = [2,3]), -0.04577636719, -0.03051757813) * ifElse(vel x < 0, -1, 1)

[State 51, Landing]
type = ChangeState
trigger1 = pos y > -vel y
value = 52


;Landing
[StateDef 52]
type = S
physics = S
moveType = I
anim = 47
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
;ctrl && command = "holdback"
trigger1 = ctrl && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command = "holdfwd", command = "holdback"), ifElse(P2dist x < 0, command = "holdback", command = "holdfwd")))
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



;==<SANKAKU TOBI>===
;Forward
[StateDef 60]
type = A
moveType = I
physics = A
anim = 60
ctrl = 0

[State 60, Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = 52,0

[State 60, Jump Dust]
type = Explod
trigger1 = !AnimTime
anim = 8101
ID = 8101
sprPriority = 3
posType = P1
pos = -23,-34
ownPal = 1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1

[State 60, VarSet]
type = VarSet
trigger1 = 1
var(3) = 0

[State 60, PosSet]
type = PosSet
trigger1 = 1
x = -135 * Facing

[State 60, VelSet]
type = VelSet
trigger1 = AnimTime
x = 0
y = 0

[State 60, VelSet]
type = VelSet
trigger1 = !AnimTime
x = 5.15625
y = -12.5

[State 60, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1


;Backwards
[StateDef 61]
type = A
moveType = I
physics = A
anim = 61
ctrl = 0

[State 61, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 61, Jump Dust]
type = Explod
trigger1 = !AnimTime
anim = 8101
ID = 8101
sprPriority = 3
posType = P1
pos = 23,-34
ownPal = 1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1

[State 61, VarSet]
type = VarSet
trigger1 = 1
var(3) = 0

[State 61, PosSet]
type = PosSet
trigger1 = 1
x = 135 * Facing

[State 61, VelSet]
type = VelSet
trigger1 = AnimTime
x = 0
y = 0

[State 61, Turn]
type = Turn
trigger1 = !AnimTime

[State 61, VelSet]
type = VelSet
trigger1 = !AnimTime
x = 5.15625
y = -12.5

[State 61, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 50
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
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 6)
value = 100, ifElse((AnimElem = 3), 0, 1)

[State 100, Jump]
type = ChangeState
triggerAll = !AILevel
trigger1 = !NumExplod(92828282) && !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = command = "holdfwd" && command = "holdup"
trigger2 = NumExplod(92828282)
trigger2 = command = "holdfwd" && command = "holddown"
trigger3 = NumExplod(94646464)
trigger3 = command = "holdback" && command = "holdup"
trigger4 = NumExplod(92468246)
trigger4 = command = "holdback" && command = "holddown"
value = 40

[State 100, Jump (AI)]
type = ChangeState
trigger1 = AILevel && Random < 25
value = 40

[State 100, End]
type = ChangeState
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = !AILevel && command != "holdfwd"
trigger2 = NumExplod(94646464) || NumExplod(92468246)
trigger2 = !AILevel && command != "holdback"
trigger3 = AILevel && P2BodyDist x <= 90
value = 101


;Stop Running
[StateDef 101]
type = S
physics = N
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

[State 101, VelAdd]
type = VelAdd
trigger1 = 1
x = -0.732421875

[State 101, Jump]
type = ChangeState
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && command = "holdup"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && command = "holddown"
value = 40

[State 101, End]
type = ChangeState
trigger1 = !AnimTime
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
value = ifElse(command = "holddown", 10, 0)
ctrl = 1

[State 101, End (Reversed Commands)]
type = ChangeState
trigger1 = !AnimTime
trigger1 = NumExplod(92828282) || NumExplod(92468246)
value = ifElse(command = "holdup", 10, 0)
ctrl = 1



;====<DASH BACKWARDS>==
[StateDef 105]
type = A
physics = N
moveType = I
velSet = 0,0
anim = 105
ctrl = 0
sprPriority = 1

[State 105, Back Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 105,0

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
trigger1 = AnimElem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
x = 0.09765625

[State 105, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0 && pos y < 0
y = 0.78125

[State 105, PosSet]
type = PosSet
trigger1 = pos y > -vel y
y = 0

[State 105, VelAdd]
type = VelSet
trigger1 = pos y > -vel y
y = 0

[State 105, End]
type = ChangeState
trigger1 = !AnimTime
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
type = A
physics = N
moveType = I
anim = 110
ctrl = 0
sprPriority = 1

[State 110, Dash Sound]
type = PlaySnd
trigger1 = AnimElem = 2
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
triggerAll = AnimElemTime(3) <= 0 && !AILevel
trigger1 = !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = command != "holdfwd"
trigger2 = NumExplod(94646464) || NumExplod(92468246)
trigger2 = command != "holdback"
sysvar(1) = 0

[State 110, ChangeState to Running]
type = ChangeState
trigger1 = AnimElemTime(3) = 0 && sysvar(1)
value = 100

[State 110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 8.125

[State 110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
x = -0.1953125

[State 110, End]
type = ChangeState
trigger1 = !AnimTime
value = 111


;Stop Dashing Forward
[StateDef 111]
type = S
physics = S
ctrl = 1
anim = 111
velSet = 0,0

[State 111, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 111, Dash End Sound]
type = PlaySnd
trigger1 = !Time
value = 100,0

[State 111, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
pos = 12,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 111, End]
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
trigger1 = !Time
value = 4,1
channel = 0

[State 700, Dodge Sound]
type = PlaySnd
trigger1 = !Time
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
;command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
trigger1 = NumExplod(90000200) || NumExplod(90000210) || NumExplod(90000220) || NumExplod(90000230) || NumExplod(90000240) || NumExplod(90000250)
;ifElse((command = "x" || command = "y" || command = "z"), 220, 245)
value = ifElse((NumExplod(90000200) || NumExplod(90000210) || NumExplod(90000220)), 225, 250)

[State 700, Attack (AI)]
type = ChangeState
trigger1 = AILevel && (Time = [15,25]) && NumEnemy
trigger1 = (EnemyNear, MoveType != A) && (P2BodyDist x = [-60,60]) && (P2Dist y >= -60)
value = ifElse(Random < 666, 225, 250)

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
trigger1 = AnimElemTime(15) < 0
value = SCA,AT
time = 1

[State 710, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(Random < 500, 0, 1)
channel = 0

[State 710, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0
channel = 1

[State 710, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger2 = AnimElem = 14
x = 16

[State 710, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = 5.625

[State 710, VelSet]
type = VelSet
trigger1 = AnimElem = 14
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
trigger1 = AnimElemTime(15) < 0
value = SCA,AT
time = 1

[State 715, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(Random < 500, 0, 1)
channel = 0

[State 715, Roll Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0
channel = 1

[State 715, PosAdd]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
trigger2 = AnimElem = 14
x = -16

[State 715, VelSet]
type = VelSet
trigger1 = AnimElem = 4
x = -5.625

[State 715, VelSet]
type = VelSet
trigger1 = AnimElem = 14
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
value = 2 + ifElse(Time < 60, 0, (Time - 60) / 12)

[State 730, Voice]
type = PlaySnd
trigger1 = !Time
value = 730,1
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
trigger1 = !NumHelper(8331)
helperType = Normal
stateNo = 8331
ID = 8331
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

[State 731, Full Power Voice]
type = PlaySnd
trigger1 = !Time && Power >= const(data.power)
value = 191,0
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
;(command = "412k")
var(10) = NumExplod(90000230) || NumExplod(90000235) || NumExplod(90000240) || NumExplod(90000245) || NumExplod(90000250) || NumExplod(90000255)
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
value = 4,1
channel = 0

[State 750, Zero Counter FX Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8350
ID = 8350
name = "Zero Counter"
posType = P1
pos = 24, -64
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
value = 4,1
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
pos = 30, -75
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
value = 4,1
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
pos = 29, -39
pauseMovetime = -1
superMovetime = -1
scale = 0.5,0.5
ownpal = 1

[State 761, EnvShake]
type = EnvShake
trigger1 = !Time
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
value = 4,1
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
pos = 29, -100
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
trigger1 = Time = 4
value = 3100,0
channel = 0

[State 900, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo FX"
posType = P1
pos = -15,-29
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
trigger1 = Time = 4
value = 3100,0
channel = 0

[State 905, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo Startup"
posType = P1
pos = 2,-80
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
trigger1 = anim = 5035
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
trigger1 = !Time
y = 0

[State 5201, VelSet]
type = VelSet
trigger1 = !Time
x = 0
y = 0

[State 5201, PosAdd]
type = PosAdd
trigger1 = !Time
x = -4

[State 5201, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,0
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
time = 10

[State 5201, Recover FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8200
ID = 8200
name = "Recover FX"
posType = P1
pos = 0,-18
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 5201, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = -5

[State 5201, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 5201, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 7
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 5201, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 52,0
channel = 3

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
faceP2 = 1

[State 5210, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.6

[State 5210, VelSet]
type = VelSet
trigger1 = !Time
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
x = ifElse((command = "holdfwd" && command != "holdback"), 4, ifElse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, VelSet (Reversed commands)]
type = VelSet
trigger1 = !Time
trigger1 = NumExplod(92828282) || NumExplod(92468246)
x = ifElse((command = "holdback" && command != "holdfwd"), 4, ifElse((command != "holdback" && command = "holdfwd"), -4, 0))
y = -7.55

[State 5210, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,0
channel = 0

[State 5210, Recover Sound]
type = PlaySnd
trigger1 = !Time
value = 5200,0
channel = 1

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
pos = 0,-66
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 5210, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 5210, CtrlSet]
type = CtrlSet
trigger1 = AnimElemTime(5) >= 0
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
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = S && command = "holdup"
trigger3 = AILevel && StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 120, Crouching to Stand]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = C && command != "holdup"
trigger3 = AILevel && StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger1 = !AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))
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
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = S && command = "holdup"
trigger3 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
value = 131

[State 130, Stop Guarding]
type = ChangeState
trigger1 = !AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))
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
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = S && command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = S && command != "holdup"
trigger3 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger3 = (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
value = 130

[State 131, AI Fix]
type = CtrlSet
trigger1 = AILevel && NumEnemy
value = (EnemyNear, Time >= 120 || Time >= 180)

[State 131, Stop Guarding]
type = ChangeState
trigger1 = !AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))
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
trigger1 = (!AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command = "holdfwd", command = "holdback"), ifElse(P2dist x < 0, command = "holdback", command = "holdfwd")))) || AILevel
value = 130

[State 132, Change to Falling]
type = ChangeState
trigger1 = sysvar(0)
value = 52

[State 132, Stop Guarding]
type = ChangeState
trigger1 = !AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))
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
trigger1 = !AILevel && StateType = S && (NumExplod(90000002) || NumExplod(90000001) || NumExplod(90000003))
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 140, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && (!NumExplod(90000002) && !NumExplod(90000001) && !NumExplod(90000003))
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
value = 151 + 2 * ((!AILevel && (NumExplod(90000002) || NumExplod(90000001) || NumExplod(90000003))) || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 150, Standing to Crouching]
type = StateTypeSet
trigger1 = !AILevel && StateType = S && (NumExplod(90000002) || NumExplod(90000001) || NumExplod(90000003))
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
stateType = C
physics = C

[State 150, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && (!NumExplod(90000002) && !NumExplod(90000001) && !NumExplod(90000003))
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
trigger1 = !AILevel && StateType = S && (NumExplod(90000002) || NumExplod(90000001) || NumExplod(90000003))
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 151, Crouching to Standing]
type = StateTypeSet
trigger1 = !AILevel && StateType = C && (!NumExplod(90000002) && !NumExplod(90000001) && !NumExplod(90000003))
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
value = 151 + 2 * ((!AILevel && ((!NumExplod(92828282) && !NumExplod(92468246) && command = "holddown") || ((NumExplod(92828282) || NumExplod(92468246)) && command = "holdup"))) || (AILevel && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)))

[State 152, Standing to Crouching]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = S && command = "holdup"
trigger3 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 152, Crouching to Standing]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = C && command != "holdup"
trigger3 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger3 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = S && command = "holdup"
trigger3 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
stateType = C
physics = C

[State 153, Crouching to Standing]
type = StateTypeSet
trigger1 = !NumExplod(92828282) && !NumExplod(92468246)
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = NumExplod(92828282) || NumExplod(92468246)
trigger2 = !AILevel && StateType = C && command != "holdup"
trigger3 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger3 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
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
trigger1 = (!AILevel && (ifElse(!NumExplod(94646464) && !NumExplod(92468246), ifElse(P2dist x < 0, command != "holdfwd", command != "holdback"), ifElse(P2dist x < 0, command != "holdback", command != "holdfwd")))) || AILevel
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

[State 5901, RemapPal]
type = RemapPal
triggerAll = !RoundsExisted
trigger1 = var(0) != [7,11]
trigger1 = var(0) != [191,208]
source = 1,1
dest = 1,var(0)

[State 5901, RemapPal]
type = RemapPal
triggerAll = !RoundsExisted
trigger1 = var(0) = [7,11]
trigger2 = var(0) = [191,208]
source = 1,1
dest = var(0),0

[State 5901, Intro vs Ryuji Yamazaki]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, Name = "cvsyamazaki" || Enemy, Name = "Yamazaki" || Enemy, Name = "Ryuji Yamazaki"
value = 193

[State 5901, Intro vs Mai Shiranui]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, Name = "Mai Shiranui" || Enemy, Name = "Mai" || Enemy, Name = "cvsmai"
value = 194

[State 5901, Intro vs Yun]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy
triggerAll = Enemy, Name = "cvsyun" || Enemy, Name = "Yun" || Enemy, Name = "Yun Lee"
trigger1 = Enemy, AuthorName = "Dick Buckus" && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)
trigger1 = RoundNo = 1
trigger2 = Enemy, AuthorName = "Warusaki3"
trigger3 = Enemy, AuthorName != "Dick Buckus" && Enemy, AuthorName != "Warusaki3"
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
value = 196

[State 5901, Intro vs Evil Characters]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = RoundNo = 1 || (((!(Enemy, RoundsExisted) || !RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul)))
trigger1 = Enemy, Name = "cvsgouki" || Enemy, Name = "Akuma" || Enemy, Name = "Gouki" || Enemy, Name = "Shin Akuma" || Enemy, Name = "Shin Gouki" || Enemy, Name = "Rare Akuma" || Enemy, Name = "cvsgouki_normal" || Enemy, Name = "cvsgouki_ex" || Enemy, Name = "Mech Gouki"  || Enemy, Name = "Mech Akuma" || Enemy, Name = "Gouki by M.M.R." || Enemy, Name = "SF3Gouki" || Enemy, Name = "svcgouki" || Enemy, Name = "Shin Gouki SF'2" || Enemy, Name = "Tin's S_Gouki" || Enemy, Name = "Pocket Shin Gouki" || Enemy, Name = "SF3Gouki" || Enemy, Name = "Gouki_Cota" || Enemy, Name = "Eternity of Heroes: Gouki" || Enemy, Name = "Gouki Lv2" ||  Enemy, Name = "MvC-EoH Gouki" || Enemy, Name = "SHINJIN GOUKI"
trigger2 = Enemy, Name = "cvsbalrog" || Enemy, Name = "Balrog"
trigger3 = Enemy, Name = "cvsvega" || Enemy, Name = "Vega" || Enemy, Name = "SVCVEGA" || Enemy, Name = "cvsvega_normal" || Enemy, Name = "cvsvega_ex"
trigger4 = Enemy, Name = "cvsbison" || Enemy, Name = "Bison" || Enemy, Name = "M Bison" || Enemy, Name = "M. Bison" || Enemy, Name = "M.Bison" || Enemy, Name = "Bison Bison" || Enemy, Name = "svc m.bison" || Enemy, Name = "M,bison" || Enemy, Name = "vega_mx" || Enemy, Name = "CvSBison" ||  Enemy, Name = "SSF2HD_Bison"
trigger5 = Enemy, Name = "cvsrolento" || Enemy, Name = "Rolento" || Enemy, Name = "Rolento Schugerg"
trigger6 = Enemy, Name = "cvsbalrog" || Enemy, Name = "cvsbison" || Enemy, Name = "Balrog" || Enemy, Name = "Balrog by M.M.R."
trigger7 = Enemy, Name = "cvsgeese" || Enemy, Name = "Geese" || Enemy, Name = "Geese Howard" || Enemy, Name = "cvsgeese_normal" || Enemy, Name = "cvsgeese_ex" || Enemy, Name = "Nightmare Geese" || Enemy, Name = "Geese_WLS" ||  Enemy, Name = "Geese B Howard" || Enemy, Name = "DGeese" || Enemy, Name = "geese_mmx" || Enemy, Name = "Crazy Laughing Geese" || Enemy, Name = "Mini_Geese"
trigger8 = Enemy, Name = "cvsiori" || Enemy, Name = "Iori" || Enemy, Name = "Iori Yagami" || Enemy, Name = "Orochi Iori" || Enemy, Name = "Iori_WLS" || Enemy, Name = "N.Iori_WLS" || Enemy, Name = "O.Iori_WLS" || Enemy, Name = "IoriMG" || Enemy, Name = "cvsiori_normal" || Enemy, Name = "iori_ex"
trigger9 = Enemy, Name = "cvsraiden" || Enemy, Name = "Raiden"
trigger10 = Enemy, Name = "cvsrugal" || Enemy, Name = "Rugal" || Enemy, Name = "Rugal Bernstein" || Enemy, Name = "cvsrugal_normal" || Enemy, Name = "cvsrugal_ex" || Enemy, Name = "God Rugal" || Enemy, Name = "Omega Rugal" || Enemy, Name = "Tin G_rugal" || Enemy, Name = "Tin 2002_rugal" || Enemy, Name = "cvsg_rugal" || Enemy, Name = "omega rugal98" || Enemy, Name = "Rugal_TLE" || Enemy, Name = "Rugal94(BOSS)" || Enemy, Name = "rugal94" || Enemy, Name = "Mech Rugal" || Enemy, Name = "rugal_B" || Enemy, Name = "Rugal_TLE" || Enemy, Name = "Omega Rugal Gb" || Enemy, Name = "D-Rugal" || Enemy, Name = "Rugal CvS" || Enemy, Name = "omega-rugal" || Enemy, Name = "Rugal.B" || Enemy, Name = "Rugal B." || Enemy, Name = "Rugal_E" || Enemy, Name = "Rugal Berstein"
trigger11 = Enemy, Name = "cvsvice" || Enemy, Name = "Vice" || Enemy, Name = "Mature" || Enemy, Name = "[Vice]'s Mature"
trigger12 = Enemy, Name = "cvsyamazaki" || Enemy, Name = "Yamazaki" || Enemy, Name = "Ryuji Yamazaki" || Enemy, Name = "Yamasaki CvS"
trigger13 = (Enemy, Name = "cvshaohmaru" && Enemy, PalNo = [7,12]) || Enemy, Name = "cvshaohmaru_ex"
trigger14 = Enemy, Name = "Kusanagi" || (Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName = "Jmorphman" && Enemy, var(40) = 1) || (Enemy, Name = "cvskyo" && (Enemy, PalNo = [7,12])) || Enemy, Name = "cvskyo_ex"
trigger15 = Enemy, Name = "alessi"
trigger16 = Enemy, Name = "AMAKUSA SHIRO TOKISADA"
trigger17 = Enemy, Name = "Apocalypse"
trigger18 = Enemy, Name = "Angel"
trigger19 = Enemy, Name = "Ash" || Enemy, Name = "Ash Crimson" || Enemy, Name = "Evil Ash" || Enemy, Name = "Dark Ash" || Enemy, Name = "Ash crazed by the Spiral of Blood " || Enemy, Name = "Blood Spiraling into Insanity Ash" || Enemy, Name = "cvsash" || Enemy, Name = "Evil Ash Diabolosis"
trigger20 = Enemy, Name = "Armor"
trigger21 = Enemy, Name = "Red Arremer" || Enemy, Name = "Firebrand" || Enemy, Name = "Arremer"
trigger22 = Enemy, Name = "Dr.baldhead"
trigger23 = Enemy, Name = "Basara"
trigger24 = Enemy, Name = "Billy Kane" || Enemy, Name = "Billy Karn" || Enemy, Name = "ffsp_billy"
trigger25 = Enemy, Name = "Birdie"
trigger26 = Enemy, Name = "Bishamon"
trigger27 = Enemy, Name = "[o_O]'s Blackheart" || Enemy, Name = "Blackheart"
trigger28 = Enemy, Name = "blackpolnareff" || Enemy,Name = "Black Polnareff"
trigger29 = Enemy, Name = "Chaka"
trigger30 = Enemy, Name = "Chris" || Enemy, Name = "Orochi Chris"
trigger31 = Enemy, Name = "Clone Kyo"
trigger32 = Enemy, Name = "Demitri" || Enemy, Name = "Demitri Maximoff" || Enemy, Name = "Demitri Maximov" || Enemy, Name = "Demitri(DS)"
trigger33 = Enemy, Name = "Devo"
trigger34 = Enemy, Name = "Devil Gundam"
trigger35 = Enemy, Name = "Dio Brando" || Enemy, Name = "Dio"  || Enemy, Name = "Shadow Dio" || Enemy, Name = "Final Dio" || Enemy, Name = "DIO-ShadowFace" || Enemy, Name = "?·????"
trigger36 = Enemy, Name = "Dr. Doom By {_Carnificina_}" || Enemy, Name = "Dr. Doom" || Enemy, Name = "Dr.Doom" || Enemy, Name = "Doctor Doom" || Enemy, Name = "DoctorDoom" || Enemy, Name = "MvC2 Doom by Kamekaze" || Enemy, Name = "Dr. Doom by WhiteMagic2002"
trigger37 = Enemy, Name = "Venom"
trigger38 = Enemy, Name = "Foxy"
trigger39 = Enemy, Name = "Freeman"
trigger40 = Enemy, Name = "Genan" || Enemy, Name = "Genan Shiranui"
trigger41 = Enemy, Name = "Kibagami Genjuro" || Enemy, Name = "Genjuro Kibagami" || Enemy, Name = "Genjuro" || Enemy, Name = "cvsgenjuro" || Enemy, Name = "Tin's Kibagami"
trigger42 = Enemy, Name = "Gill"
trigger43 = Enemy, Name = "Goenitz" || Enemy, Name = "Leopold Goenitz"
trigger44 = Enemy, Name = "Grant"
trigger45 = Enemy, Name = "Gray Fly" || Enemy, Name = "Grey Fly"
trigger46 = Enemy, Name = "Heart"
trigger47 = Enemy, Name = "Hol Horse" || Enemy, Name = "Hol Horse & Boingo" || Enemy, Name = "Hol Horse and Boingo" || Enemy, Name = "Hol Horse & J. Geil" || Enemy, Name = "Hol Horse and J. Geil"
trigger48 = Enemy, Name = "Vanilla Ice" || Enemy, Name = "Iced" || Enemy, Name = "vanillaice"
trigger49 = Enemy, Name = "Igniz By Third" || Enemy, Name = "Igniz"
trigger50 = Enemy, Name = "Jack"
trigger51 = Enemy, Name = "Jedah" || Enemy, Name = "Jedah Dohma" || Enemy, Name = "cvsjedah" || Enemy, Name = "Jedah_LB"
trigger52 = Enemy, Name = "Johann"
trigger53 = Enemy, Name = "Judgment"
trigger54 = Enemy, Name = "Juggernaut by Splode" || Enemy, Name = "Juggernaut" || Enemy, Name = "MvC2 Juggernaut by Kamekaze" || Enemy, Name = "juggy"
trigger55 = Enemy, Name = "Justice"
trigger56 = Enemy, Name = "K9999"
trigger57 = Enemy, Name = "Shinnosuke Kagami" || Enemy, Name = "Shinnosuke Kagami By Third"
trigger58 = Enemy, Name = "Kain" || Enemy, Name = "Kain R. Heinlein" || Enemy, Name = "Kain Heinlein"
trigger59 = Enemy, Name = "Karasu"
trigger60 = Enemy, Name = "Khan"
trigger61 = Enemy, Name = "Kouryu By Third" || Enemy, Name = "Kouryu"
trigger62 = Enemy, Name = "Krauser" || Enemy, Name = "Tin's KOF Krauser" || Enemy, Name = "Wolfgang Krauser" || Enemy, Name = "Lord Krauser"
trigger63 = Enemy, Name = "Krizalid" || Enemy, Name = "Krizalid-0" || Enemy, Name = "ZX"
trigger64 = Enemy, Name = "kusaregedo" || Enemy, Name = "Youkai Kusaregedo" || Enemy, Name = "Gedo Kusaregedo"
trigger65 = Enemy, Name = "Kyo-1" || Enemy, Name = "Kyo-2" || Enemy, Name = "Kyo 1" || Enemy, Name = "Kyo 2"
trigger66 = Enemy, Name = "Laurence" || Enemy, Name = "Laurence Blood"
trigger67 = Enemy, Name = "Magneto" || Enemy, Name = "[Kyoko]'s Magneto" || Enemy, Name = "Magneto(MC2)" || Enemy, Name = "Magneto MVC2ver"
trigger68 = Enemy, Name = "Manto"
trigger69 = Enemy, Name = "Magaki"
trigger70 = Enemy, Name = "Mariah"
trigger71 = Enemy, Name = "Material"
trigger72 = Enemy, Name = "Midler"
trigger73 = Enemy, Name = "Mr. Big" || Enemy, Name = "Mr.Big" || Enemy, Name = "Mister Big" || Enemy, Name = "Mr Big" || Enemy, Name = "Big"
trigger74 = Enemy, Name = "Mukai" || Enemy, Name = "Tin's Mukai"
trigger75 = Enemy, Name = "Mukuro" || Enemy, Name = "Mukuro by MAPPY"
trigger76 = Enemy, Name = "Musashi Akatsuki" || Enemy, Name = "Musashi Akatsuki By Third" || Enemy, Name = "Musashi"
trigger77 = Enemy, Name = "Shiki Nanaya" || Enemy, Name = "Shiki_Nanaya"
trigger78 = Enemy, Name = "Nameless"
trigger79 = Enemy, Name = "Neo Dio" || Enemy, Name = "Neo-Dio" || Enemy, Name = "NeoDio"
trigger80 = Enemy, Name = "Nero_Chaos" || Enemy, Name = "Nero Chaos" || Enemy, Name = "Nrvnqsr Chaos" || Enemy, Name = "Nrvnqsr_Chaos" || Enemy, Name = "RajaaNero"
trigger81 = Enemy, Name = "Ogre"
trigger82 = Enemy, Name = "Omega Red"
trigger83 = Enemy, Name = "Oni Chizuru"
trigger84 = Enemy, Name = "Onslaught"
trigger85 = Enemy, Name = "Original Zero" || Enemy, Name = "O. Zero" || Enemy, Name = "O.Zero" || (Enemy, Name = "Zero" && Enemy, AuthorName != "N64Mario") || Enemy, Name = "Clone Zero" || Enemy, Name = "C. Zero"  || Enemy, Name = "C.Zero" || Enemy, Name = "Zero By Third"
trigger86 = Enemy, Name = "Orochi" || Enemy, Name = "Orochi Rebirth" || Enemy, Name = "God Orochi" || Enemy, Name = "Mithra" || enemy, name = "Mizuchi"
trigger87 = Enemy, Name = "Pet Shop" || Enemy, Name = "PetShop"
trigger88 = Enemy, Name = "Pyron"
trigger89 = Enemy, Name = "Mizuki Rashojin" || Enemy, Name = "Rasyouzin Miduki"
trigger90 = Enemy, Name = "Raoh" || Enemy, Name = "Raou"
trigger91 = Enemy, Name = "Rubber Soul"
trigger92 = Enemy, Name = "Sankuro Yorozu" || Enemy, Name = "Sankuro"
trigger93 = Enemy, Name = "Sentinel" || Enemy, Name = "Prime Sentinels"
trigger94 = Enemy, Name = "Setsuna"
trigger95 = Enemy, Name = "Shermie" || Enemy, Name = "Orochi Shermie" || Enemy, Name = "Shelmie"
trigger96 = Enemy, Name = "Shikyoh" || Enemy, Name = "Shikyoh BY M@PPY"
trigger97 = Enemy, Name = "Shuma Gorath" || Enemy, Name = "shuma gorath by Qkrtkf!"
trigger98 = Enemy, Name = "Silver Samurai"
trigger99 = Enemy, Name = "Sodom" || Enemy, Name = "Sodom by Splode" || Enemy, Name = "Sodom with Samurai Sword"
trigger100 = Enemy, Name = "Sojiro Seta" || Enemy, Name = "Seta Sojiro"
trigger101 = Enemy, Name = "Spiral" || Enemy, Name = "Spiral by Luchini"
trigger102 = Enemy, Name = "Testament"
trigger103 = Enemy, Name = "Thanos" || Enemy, Name = "Thanos of Titan"
trigger104 = Enemy, Name = "Twelve"
trigger105 = Enemy, Name = "Toguro Ototo" || Enemy, Name = "Toguro" || Enemy, Name = "Toguro"
trigger106 = Enemy, Name = "Warakia" || Enemy, Name = "Wallachia" || Enemy, Name = "Night of Wallachia"
trigger107 = Enemy, Name = "Red Arcueid" || Enemy, Name = "WARCUEID" || Enemy, Name = "Red_Arcueid"
trigger108 = Enemy, Name = "Yashiro Nanakase" || Enemy, Name = "Yashiro" || Enemy, Name = "Orochi Yashiro"
trigger109 = Enemy, Name = "Zabel" || Enemy, Name = "Lord Raptor" || Enemy, Name = "Zabel Zarock"
trigger110 = Enemy, Name = "Zankuro Minazuki" || Enemy, Name = "zankuro"
trigger111 = Enemy, Name = "Zato-1" || Enemy, Name = "Zato 1"
trigger112 = Enemy, Name = "Zeus"
trigger113 = Enemy, Name = "gg_venom"
trigger114 = Enemy, Name = "Enja" || Enemy, Name = "Enja Kazuki"
trigger115 = Enemy, Name = "Michael Roa Valdamjong" || Enemy, Name = "Michael_Roa_Valdamjong" || Enemy, Name = "RajaaRoa" || Enemy, Name = "Axl Roa Skaldamjong"
trigger116 = Enemy, Name = "Kane Kelly"
trigger117 = Enemy, Name = "Moses Maddigan"
trigger118 = Enemy, Name = "Thirteen"
trigger119 = Enemy, Name = "Byrne"
trigger120 = Enemy, Name = "Beatrice"
trigger121 = Enemy, Name = "Hazama" || Enemy, Name = "Unlimited Hazama"
trigger122 = Enemy, Name = "Relius Clover"
trigger123 = Enemy, Name = "Vergil"
trigger124 = Enemy, Name = "Goro"
trigger125 = Enemy, Name = "Kintaro"
trigger126 = Enemy, Name = "Motaro"
trigger127 = Enemy, Name = "Shao Kahn" || Enemy, Name = "shaokahn"
trigger128 = Enemy, Name = "Galactus"
trigger129 = Enemy, Name = "Kishima_Kouma" || Enemy, Name = "Kouma Kishima"
trigger130 = Enemy, Name = "Deadpool"
trigger131 = Enemy, Name = "Saiki" ||  Enemy, Name = "KOF XIII Saiki" || Enemy, Name = "SAIKI" || Enemy, Name = "H-SaikiXIII" || Enemy, Name = "KOF XIII True Saiki"
trigger132 = Enemy, Name = "Nyx"
trigger133 = Enemy, Name = "Hitoshura" || Enemy, Name = "Hiitoshura"
trigger134 = Enemy, Name = "Mr. X"
trigger135 = Enemy, Name = "Scharlachrot"
trigger136 = Enemy, Name = "Mildred Avallone"
trigger137 = Enemy, Name = "Kira Daidouji" || Enemy, Name = "Kira Daidohji"
trigger138 = Enemy, Name = "The Joker" || Enemy, Name = "Joker"
trigger139 = Enemy, Name = "Wesker" || Enemy, Name = "Albert Wesker"
trigger140 = Enemy, Name = "Bernkastel"
trigger141 = Enemy, Name = "Bowser"
trigger142 = Enemy, Name = "Bristol"
trigger143 = Enemy, Name = "Piccolo Daimao"
trigger144 = Enemy, Name = "Suave Dude"
trigger145 = Enemy, Name = "Carnage"
trigger146 = Enemy, Name = "Asura"
trigger147 = Enemy, Name = "Captain Ginyu" || Enemy, Name = "Ginew by Kuririn" ||  Enemy, Name = "Ginew"
trigger148 = Enemy, Name = "Raditz"
trigger149 = Enemy, Name = "Bardock"
trigger150 = Enemy, Name = "Turles"
trigger151 = Enemy, Name = "Broly" || Enemy, Name = "[Necromancer's] Broli" || Enemy, Name = "Broly557" || Enemy, Name = "Broli Remix ver1.2" || Enemy, Name = "LSSJ Broli by Ryon" || Enemy, Name = "Broli SSJ4" || Enemy, Name = "Broly by ynvaser" || Enemy, Name = "Broly 'le cauchemar' super saiyen nv3" || Enemy, Name = "Broly mode soft" || Enemy, Name = "Broli" || Enemy, Name = "[FlowaGirl's] Broli"
trigger152 = Enemy, Name = "paragus"
trigger153 = Enemy, Name = "Napa by Bardock" || Enemy, Name = "Nappa"
trigger154 = Enemy, Name = "Cell" || Enemy, Name = "Insect Cell" || Enemy, Name = "Imperfect Cell" || Enemy, Name = "Destroid Cell" || Enemy, Name = "Cell por Ssonic" || Enemy, Name = "Cell Imperfecto" || Enemy, Name = "PunchCell! Bonus Game" || Enemy, Name = "Cell UB22" || Enemy, Name = "cell_2nd_Form" || Enemy, Name = "[Necromancer's] Cell"
trigger155 = Enemy, Name = "Android 16"
trigger156 = Enemy, Name = "Dr Gero" || Enemy, Name = "Android 20"
trigger157 = Enemy, Name = "Android19 by Szowel"
trigger158 = Enemy, Name = "Dabura" || Enemy, Name = "Dabura by DZGTEAM"
trigger159 = Enemy, Name = "Android 18" || Enemy, Name = "Juuhachigou" || Enemy, Name = "Androide 18 by _Vision" || Enemy, Name = "18" || Enemy, Name = "C-18"
trigger160 = Enemy, Name = "Android 17" || Enemy, Name = "17" || Enemy, Name = "androide17"
trigger161 = Enemy, Name = "Burter" || Enemy, Name = "Recoome" || Enemy, Name = "Recoom" || Enemy, Name = "Recoom by Lucifer"
trigger162 = Enemy, Name = "Zarbom by EmuBoarding"
trigger163 = Enemy, Name = "Guldo"
trigger164 = Enemy, Name = "Coola" || Enemy, Name = "Cooler" || Enemy, Name = "M-Kooler" || Enemy, Name = "coola by Franciynaldo"
trigger165 = Enemy, Name = "Freeza UB22" || Enemy, Name = "Freeza" || Enemy, Name = "Freiza" || Enemy, Name = "Freezer" || Enemy, Name = "Freeza by OverMind" || Enemy, Name = "Disciple's Freeza" || Enemy, Name = "Freezer 4th Form OS" || Enemy, Name = "frz"
trigger166 = Enemy, Name = "Buu" || Enemy, Name = "Super Buu" || Enemy, Name = "Majin Buu" || Enemy, Name = "Super Boo" || Enemy, Name = "Boo" || Enemy, Name = "Majin Boo" || Enemy, Name = "Fat Buu" || Enemy, Name = "Pocket-Mr.Buu_SS" || Enemy, Name = "Mr.Boo by OverMind" || Enemy, Name = "Ultimate Bu by Sniper85" || Enemy, Name = "PexBuu" || Enemy, Name = "Kid Buu"
trigger167 = Enemy, Name = "janemba by Franciynaldo"
trigger168 = Enemy, Name = "Spawn" || Enemy, Name = "CVG_Spawn"
trigger169 = Enemy, Name = "H.spawn" || Enemy, Name = "HellSpawn"
trigger170 = Enemy, Name = "Summon Demon"
trigger171 = Enemy, Name = "zodd"
trigger172 = Enemy, Name = "Famardy"
trigger173 = Enemy, Name = "Ghouls n Ghosts - Burning Village"
trigger174 = Enemy, Name = "Tower Of Bloodyfight"
trigger175 = Enemy, Name = "biollente"
trigger176 = Enemy, Name = "Satan"
trigger177 = Enemy, Name = "Lucifeller"
trigger178 = Enemy, Name = "CROCOMIRE" || Enemy, Name = "INFINITY PHALANX" || Enemy, Name = "SOMULO"
trigger179 = Enemy, Name = "Freddy Krugger" || Enemy, Name = "Freddy Krueger"
trigger180 = Enemy, Name = "elque" || Enemy, Name = "elque_edit"
trigger181 = Enemy, Name = "B-Flan"  ;Bloody Flandre
trigger182 = Enemy, Name = "Makai_stage"
trigger183 = Enemy, Name = "Albiole"
trigger184 = Enemy, Name = "Raziel"
trigger185 = Enemy, Name = "DemonsWall" || Enemy, Name = "Diablo_skeleton"
trigger186 = Enemy, Name = "Gig"		;Guilty Gear
trigger187 = Enemy, Name = "Segalow"
trigger188 = Enemy, Name = "DEATH MAUL"
trigger189 = Enemy, Name = "Anakin Skywalker"
trigger190 = Enemy, Name = "Ultimate Sephiroth"
trigger191 = Enemy, Name = "IronPatriot"
trigger192 = Enemy, Name = "Perfect Weapon MB-02"
trigger193 = Enemy, Name = "GLaDOS"
trigger194 = Enemy, Name = "Cyber Shredder"
trigger195 = Enemy, Name = "Metallo"
trigger196 = Enemy, Name = "Predator"
trigger197 = Enemy, Name = "Shang Tsung" || Enemy, Name = "Count Earcula" || (Enemy, Name = "juano`s morph guy" && enemy,fvar(6)!=15) || Enemy, Name = "ShangTsung by binho"
trigger198 = Enemy, Name = "Kano by binho" || Enemy, Name = "Reptile by Binho"
trigger199 = Enemy, Name = "Goenitz" || Enemy, Name = "Goenitz_WLS" || Enemy, Name = "GoenikoD4"
trigger200 = Enemy, Name = "SF4 Seth" || Enemy, Name = "Seth" || Enemy, Name = "SF4 Omni" || Enemy, Name = "G Project"
trigger201 = Enemy, Name = "EvilPeach"
trigger202 = Enemy, Name = "Dark Chun Li" || Enemy, Name = "Dark Chun-Li R"
trigger203 = Enemy, Name = "Abyss Form 1" || Enemy, Name = "Abyss Form 1+"
trigger204 = Enemy, Name = "Street Fighter 3's Urien" || Enemy, Name = "urien_mx" || Enemy, Name = "cvsurien"
trigger205 = Enemy, Name = "Pneophen's random experiment"
trigger206 = Enemy, Name = "Shin Valdoll" || Enemy, Name = "Valdoll"
trigger207 = Enemy, Name = "Aizen"
trigger208 = Enemy, Name = "Final" && enemy,authorname="Andres Borghi"
trigger209 = Enemy, Name = "Cocodrilo"
trigger210 = Enemy, Name = "DcatKrang"
trigger211 = Enemy, Name = "The Manticore, the Queen, and the Dragon" || Enemy, Name = "Manticore"
trigger212 = Enemy, Name = "The King Has No Name" || Enemy, Name = "Thiele"
trigger213 = Enemy, Name = "Bai-Hu"
trigger214 = Enemy, Name = "DOGMA"		;Dragon Might
trigger215 = Enemy, Name = "Ohga"		;Gowkaiser
trigger216 = Enemy, Name = "Deidara" || Enemy, Name = "Tobi_NZC"
trigger217 = Enemy, Name = "Exdeath"
trigger218 = Enemy, Name = "Vinzelles"
trigger219 = Enemy, Name = "Devil_Daigo"
trigger220 = Enemy, Name = "Legend Gold Magaki"
trigger221 = Enemy, Name = "Sevil Nahte"
trigger222 = Enemy, Name = "Taopaipai" || Enemy, Name = "Bojack_CS" || Enemy, Name = "Bojack Enhanced 1.01" || Enemy, Name = "Zangya"
trigger223 = Enemy, Name = "GarlicJr" || Enemy, Name = "Puipui"
trigger224 = Enemy, Name = "Kazuya Mishima"
trigger225 = Enemy, Name = "Marvel_Vulcan"
trigger226 = Enemy, Name = "Mr.Sinister"
trigger227 = Enemy, Name = "Lady Deathstrike"
trigger228 = Enemy, Name = "Avalanche"
trigger229 = Enemy, Name = "Blob"
trigger230 = Enemy, Name = "Mystique"
trigger231 = Enemy, Name = "Onslaught" || Enemy, Name = "Symbiote Onslaught- Forms 1 & 2"
trigger232 = Enemy, Name = "Sabretooth" || Enemy, Name = "MvC2 Sabretooth By Kamekaze" || Enemy, Name = "Sabre Tooth"
trigger233 = Enemy, Name = "Mole Man"
trigger234 = Enemy, Name = "CVG_Skrull" || Enemy, Name = "Super Skrull"
trigger235 = Enemy, Name = "Marvel_Ronan"
trigger236 = Enemy, Name = "Atrocitus" || Enemy, Name = "Red Lantern" || Enemy, Name = "Larfleeze" || Enemy, Name = "Orange Lantern" || Enemy, Name = "Agent Orange"
trigger237 = Enemy, Name = "Black Lantern" || Enemy, Name = "Star Sapphire"
trigger238 = Enemy, Name = "DexStarr"
trigger239 = Enemy, Name = "Black Mask"
trigger240 = Enemy, Name = "Onomatopoiea"
trigger241 = Enemy, Name = "Poison Ivy"
trigger242 = Enemy, Name = "Jason Todd"
trigger243 = Enemy, Name = "Red Hood"
trigger244 = Enemy, Name = "Batzarro"
trigger245 = Enemy, Name = "Riddler"
trigger246 = Enemy, Name = "Harley Quinn"
trigger247 = Enemy, Name = "Catman"
trigger248 = Enemy, Name = "Bane"
trigger249 = Enemy, Name = "Ten"
trigger250 = Enemy, Name = "Scarecrow"
trigger251 = Enemy, Name = "Clayface"
trigger252 = Enemy, Name = "Catwoman"
trigger253 = Enemy, Name = "Black Adam"
trigger254 = Enemy, Name = "Superboy Prime"
trigger255 = Enemy, Name = "Black Manta"
trigger256 = Enemy, Name = "BRAINIAC"
trigger257 = Enemy, Name = "Boomerang"
trigger258 = Enemy, Name = "Cyborg Superman"
trigger259 = Enemy, Name = "Darkseid" || Enemy, Name = "JLTF_DARKSEID" || Enemy, Name = "Darkseid 16 bits" || Enemy, Name = "Darksied"
trigger260 = Enemy, Name = "Despero"
trigger261 = Enemy, Name = "Doomsday"
trigger262 = Enemy, Name = "Gentleman Ghost"
trigger263 = Enemy, Name = "Major Force"
trigger264 = Enemy, Name = "Lex Luthor" || Enemy, Name = "Luthor"
trigger265 = Enemy, Name = "Lobo"
trigger266 = Enemy, Name = "Zoom"
trigger267 = Enemy, Name = "Bizarro" || ((Enemy, Name = "Superman") && (Enemy, PalNo = [8,9]))
trigger268 = Enemy, Name = "Sinestro"
trigger269 = Enemy, Name = "Silver banshee"
trigger270 = Enemy, Name = "Shade"
trigger271 = Enemy, Name = "Professor Zoom"
trigger272 = Enemy, Name = "Parasite"
trigger273 = Enemy, Name = "Mongul DCvsM" || Enemy, Name = "Mongul"
trigger274 = Enemy, Name = "Gato"
trigger275 = Enemy, Name = "Oswald" || Enemy, Name = "Oswald_WLS"
trigger276 = Enemy, Name = "Jazu" || Enemy, Name = "Jyazu"
trigger277 = Enemy, Name = "Silver" || Enemy, Name = "Silber"
trigger278 = Enemy, Name = "Shion"
trigger279 = Enemy, Name = "Sandman"
value = 197

[State 5901, Turns Intro]
type = ChangeState
trigger1 = TeamMode = Turns
trigger1 = !RoundsExisted && RoundNo >= 2
value = 6900

[State 5901, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1 && var(40) != 1
value = 190 + (Random % 2)

[State 5901, Shadow Lady Intro]
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

[State 190, Change to Intro vs Evil Characters]
type = ChangeState
trigger1 = Enemy, var(40) = 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Kyo Kusanagi"
value = 197

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<INTRO 2>====
[StateDef 191]
type = S
physics = S
anim = 191

[State 191, Change to Intro vs Evil Characters]
type = ChangeState
trigger1 = Enemy, var(40) = 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Kyo Kusanagi"
value = 197

[State 191, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 191,0
channel = 0

[State 191, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<INTRO 3>====
[StateDef 192]
type = S
physics = S
anim = 192

[State 190, Change to Intro vs Evil Characters]
type = ChangeState
trigger1 = Enemy, var(40) = 1
trigger1 = NumEnemy
trigger1 = RoundNo = 1 && (!(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, AuthorName = "Jmorphman" && Enemy, Name = "Kyo Kusanagi"
value = 197

[State 192, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<INTRO VS RYUJI YAMAZAKI>====
[StateDef 193]
type = S
physics = S
anim = 193

[State 193, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 193, ChangeAnim]
type = ChangeAnim
trigger1 = Enemy, Name != "cvsyamazaki" && Time = 40
value = 193
elem = 2

[State 193, Voice]
type = PlaySnd
trigger1 = AnimElem = 13
value = 193, 0
channel = 0

[State 193, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<INTRO VS MAI SHIRANUI>====
[StateDef 194]
type = S
physics = S
anim = 194

[State 194, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 194, Laugh]
type = PlaySnd
trigger1 = AnimElem = 7
value = 194,0
channel = 0

[State 194, Voice]
type = PlaySnd
trigger1 = AnimElem = 24
value = 194,1
channel = 0

[State 194, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<INTRO VS YUN>====
[StateDef 196]
type = S
physics = S
anim = 196

[State 196, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 196, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 8
value = 196,0
channel = 0

[State 196, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 25
value = 196, 1
channel = 0

[State 196, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<INTRO VS EVIL CHARACTERS>====
[StateDef 197]
type = S
physics = S
anim = 197

[State 197, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 197, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1,1
channel = 1

[State 196, Voice]
type = PlaySnd
trigger1 = AnimElem = 11
value = 197,0
channel = 0

[State 197, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<SHADOW LADY INTRO>====
[StateDef 198]
type = S
physics = S
anim = 198
ctrl = 0

[State 198, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 198, Warp Effect]
type = Explod
trigger1 = AnimElem = 2
anim = 10198
ID = 10198
posType = P1
ownPal = 1

[State 198, Warp Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3610,0
channel = 1

[State 198 Transparency]
type = Trans
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trans = AddAlpha
alpha = 9 * (AnimElemTime(2)), 256 - 9 * (AnimElemTime(2))
ignoreHitPause = 1

[State 198, PalFX]
type = PalFX
trigger1 = AnimElemTime(3) < 0
time = 1
add = -255, -255, -255

[State 198, PalFX]
type = PalFX
trigger1 = AnimElemTime(3) = -1
time = 16
add = -255, -255, -255
sinadd = 255, 255, 255, 64

[State 198, Eye Spark Sound]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,10
channel = 3

[State 198, Eye Spark Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 6005
posType = p1
pos = 12, -96
sprPriority = 2
scale = 0.5, 0.5
bindTime = -1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 198, End]
type = ChangeState
trigger1 = !Animtime
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
anim = 6901
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
channel = 3

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

[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====<WIN POSE DECIDER>====
[StateDef 180]
type = S

[State 180, Generic Victory Quote]
type = VictoryQuote
trigger1 = 1
value = (Random % 53)

[State 180, Victory Quote vs. Adon]
type = VictoryQuote
trigger1 = Enemy, Name = "Adon" || Enemy, Name = "cvsadon"
value = 53

[State 180, Victory Quote vs. Alex]
type = VictoryQuote
trigger1 = Enemy, Name = "Alex" || Enemy, Name = "cvsalex"
value = 54

[State 180, Victory Quote vs. Akuma]
type = VictoryQuote
trigger1 = Enemy, Name = "Akuma" || Enemy, Name = "cvsgouki" || Enemy, Name = "Gouki" || Enemy, Name = "Shin Akuma" || Enemy, Name = "Shin Gouki" || Enemy, Name = "ShinAkuma" || Enemy, Name = "ShinGouki" || Enemy, Name = "Pocket Shin Gouki"
value = 55

[State 180, Victory Quote vs. Balrog]
type = VictoryQuote
trigger1 = Enemy, Name = "Balrog" || Enemy, Name = "cvsbison"
value = 56

[State 180, Victory Quote vs. Blanka]
type = VictoryQuote
trigger1 = Enemy, Name = "Blanka" || Enemy, Name = "cvsblanka"
value = 57

[State 180, Victory Quote vs. Cammy]
type = VictoryQuote
trigger1 = Enemy, Name = "Cammy" || Enemy, Name = "cvscammy"
value = 58 + (Random % 2)

[State 180, Victory Quote vs. Chun-Li]
type = VictoryQuote
trigger1 = Enemy, Name = "Chun-Li" || Enemy, Name = "cvschunli" || Enemy, Name = "Chun Li" || Enemy, Name = "ChunLi"
value = 60 + (Random % 3)

[State 180, Victory Quote vs. Cody]
type = VictoryQuote
trigger1 = Enemy, Name = "Cody" || Enemy, Name = "cvscody"
value = 63

[State 180, Victory Quote vs. Crimson Viper]
type = VictoryQuote
trigger1 = Enemy, Name = "Crimson Viper" || Enemy, Name = "C. Viper" || Enemy, Name = "C.Viper"
value = 64

[State 180, Victory Quote vs. Dan]
type = VictoryQuote
trigger1 = Enemy, Name = "Dan" || Enemy, Name = "cvsdan" || Enemy, Name = "Dan Hibiki"
value = 65

[State 180, Victory Quote vs. Dee Jay]
type = VictoryQuote
trigger1 = Enemy, Name = "Dee Jay" || Enemy, Name = "DeeJay"
value = 66

[State 180, Victory Quote vs. Dhalsim]
type = VictoryQuote
trigger1 = Enemy, Name = "Dhalsim" || Enemy, Name = "cvsdhalsim"
value = 67

[State 180, Victory Quote vs. Dr. Doom]
type = VictoryQuote
trigger1 = Enemy, Name = "Doctor Doom" || Enemy, Name = "Dr. Doom" || Enemy, Name = "Dr.Doom"
value = 68

[State 180, Victory Quote vs. Dudley]
type = VictoryQuote
trigger1 = Enemy, Name = "Dudley"
value = 69

[State 180, Victory Quote vs. E. Honda]
type = VictoryQuote
trigger1 = Enemy, Name = "E. Honda" || Enemy, Name = "cvshonda" || Enemy, Name = "E.Honda" || Enemy, Name = "Honda"
value = 70

[State 180, Victory Quote vs. Fei Long]
type = VictoryQuote
trigger1 = Enemy, Name = "Fei Long" || Enemy, Name = "cvsfeilong" || Enemy, Name = "FeiLong" || Enemy, Name = "Fei-Long"
value = 71

[State 180, Victory Quote vs. Gen]
type = VictoryQuote
trigger1 = Enemy, Name = "Gen"
value = 72 + (Random % 2)

[State 180, Victory Quote vs. Gouken]
type = VictoryQuote
trigger1 = Enemy, Name = "Gouken"
value = 74

[State 180, Victory Quote vs. Guile]
type = VictoryQuote
trigger1 = Enemy, Name = "Guile" || Enemy, Name = "cvsguile"
value = 75 + (Random % 3)

[State 180, Victory Quote vs. Guy]
type = VictoryQuote
trigger1 = Enemy, Name = "Guy" || Enemy, Name = "cvsguy"
value = 78

[State 180, Victory Quote vs. Hugo]
type = VictoryQuote
trigger1 = Enemy, Name = "Hugo"
value = 79

[State 180, Victory Quote vs. Ibuki]
type = VictoryQuote
trigger1 = Enemy, Name = "Ibuki"
value = 80

[State 180, Victory Quote vs. Ken]
type = VictoryQuote
trigger1 = Enemy, Name = "Ken" || Enemy, Name = "cvsken"
trigger2 = Enemy, Name = "Ken Masters"
trigger2 = Enemy, Authorname != "Phantom.of.the.Server&Jmorphman"
trigger3 = Enemy, Name = "Ken Masters"
trigger3 = Enemy, Authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) != 1
value = 81

[State 180, Victory Quote vs. Kyo Kusanagi]
type = VictoryQuote
trigger1 = (Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName != "Jmorphman") || (Enemy, Name = "cvskyo" && Enemy, PalNo <= 6) || Enemy, Name = "cvskyo_normal" || Enemy, Name = "Kyo_WLS"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName = "Jmorphman" && Enemy, var(40) != 1
value = 82

[State 180, Victory Quote vs. Makoto]
type = VictoryQuote
trigger1 = Enemy, Name = "Makoto"
value = 83

[State 180, Victory Quote vs. M. Bison]
type = VictoryQuote
trigger1 = Enemy, Name = "M. Bison" || Enemy, Name = "cvsvega" || (Enemy, Name = "Vega" && Enemy, AuthorName = "Phantom.of.the.Server") || Enemy, Name = "M.Bison" || Enemy, Name = "Bison" || Enemy, Name = "Bison Bison"
value = 84 + (Random % 3)

[State 180, Victory Quote vs. Morrigan Aensland]
type = VictoryQuote
trigger1 = Enemy, Name = "Morrigan" || Enemy, Name = "Morrigan Aensland"
value = 87

[State 180, Victory Quote vs. Poison]
type = VictoryQuote
trigger1 = Enemy, Name = "Poison"
value = 88

[State 180, Victory Quote vs. Poison]
type = VictoryQuote
trigger1 = Enemy, Name = "Poison"
value = 89

[State 180, Victory Quote vs. Rose]
type = VictoryQuote
trigger1 = Enemy, Name = "Rose"
value = 90

[State 180, Victory Quote vs. Ryu]
type = VictoryQuote
trigger1 = (Enemy, Name = "Ryu" && !(Enemy, AuthorName = "Phantom.of.the.Server")) || (Enemy, Name = "cvsryu" && PalNo = [1,6]) || Enemy, Name = "cvsryu_normal"
trigger2 = (Enemy, Name = "Ryu" && Enemy, AuthorName = "Phantom.of.the.Server")
trigger2 = Enemy, var(1) != 2
value = 91

[State 180, Victory Quote vs. Sagat]
type = VictoryQuote
trigger1 = Enemy, Name = "Sagat" || Enemy, Name = "cvssagat" || Enemy, Name = "SagatMG"
value = 92

[State 180, Victory Quote vs. Sakura]
type = VictoryQuote
trigger1 = Enemy, Name = "Sakura" || Enemy, Name = "cvssakura" || Enemy, Name = "Sakura Kasugano"
value = 93

[State 180, Victory Quote vs. She-Hulk]
type = VictoryQuote
trigger1 = Enemy, Name = "She-Hulk" || Enemy, Name = "She Hulk" || Enemy, Name = "SheHulk"
value = 94

[State 180, Victory Quote vs. T. Hawk]
type = VictoryQuote
trigger1 = Enemy, Name = "T. Hawk" || Enemy, Name = "T.Hawk"
value = 95

[State 180, Victory Quote vs. Thor]
type = VictoryQuote
trigger1 = Enemy, Name = "Thor" || Enemy, Name = "The Mighty Thor"
value = 96

[State 180, Victory Quote vs. Vega]
type = VictoryQuote
triggerAll = Enemy, AuthorName != "Phantom.of.the.Server"
trigger1 = Enemy, Name = "Vega" || Enemy, Name = "cvsbalrog"
value = 97

[State 180, Victory Quote vs. Zangief]
type = VictoryQuote
trigger1 = Enemy, Name = "Zangief" || Enemy, Name = "cvszangief"
value = 98

[State 180, Victory Quote vs. Zero]
type = VictoryQuote
trigger1 = Enemy, Name = "Zero" || Enemy, Name = "cvszero"
value = 99

[State 180, Win 4]
type = ChangeState
trigger1 = var(51) || Life = LifeMax
value = 184

[State 180, Win 1]
type = ChangeState
trigger1 = command = "holdstart"
value = 181

[State 180, Win 2]
type = ChangeState
trigger1 = command = "holdx" || command = "holdy" || command = "holdz"
value = 182

[State 180, Win 3]
type = ChangeState
trigger1 = command = "holda" || command = "holdb" || command = "holdc"
value = 183

[State 180, Win Decider]
type = ChangeState
trigger1 = 1
value = 181 + (Random % 3)



;====<WIN 1>====
[StateDef 181]
type = S
physics = S
anim = 181
ctrl = 0

[State 181, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 181, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 181,0
channel = 0

[State 181, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 7
value = 181,1
channel = 0



;====<WIN 2>====
[StateDef 182]
type = S
physics = S
anim = 182
ctrl = 0

[State 182, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 182, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 182,0
channel = 0



;====<WIN 3>====
[StateDef 183]
type = S
physics = S
anim = 183
ctrl = 0

[State 183, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 183, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 183,0
channel = 0

[State 183, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 19
value = 52,0
channel = 1

[State 183, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 10
trigger2 = AnimElem = 19
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1



;====<WIN 4>====
[StateDef 184]
type = S
physics = S
anim = 184
ctrl = 0

[State 184, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 184, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 183,0
channel = 0

[State 184, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 19
value = 52,0
channel = 1

[State 184, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 10
trigger2 = AnimElem = 19
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1



;==<TAUNT>==
[StateDef 195]
type = S
moveType = I
physics = S
anim = 195
velSet = 0,0
sprPriority = 1
ctrl = 0

[State 195, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 195,0
channel = 0

[State 195, StateTypeSet: Attack]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = A

[State 195, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 39), var(36):= -81
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd = -255,-255,-255,48

[State 195, End]
type = ChangeState
trigger1 = !AnimTime
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
value = 5950,0

[State 5950, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = F7,0

[State 5950, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 3
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
triggerAll = (StateNo != 3000 && StateNo != 3050) || ((StateNo = 3000 || StateNo = 3050) && NumTarget)
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
triggerAll = (StateNo != 3000 && StateNo != 3050) || ((StateNo = 3000 || StateNo = 3050) && NumTarget)
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(32) >= 0
value = 3, var(32)
channel = 2
ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = (StateNo != 458 && StateNo != 1200 && StateNo != 1230 && StateNo != 3310) || var(35) > 0
triggerAll = StateNo != 3000 && StateNo != 3050
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8015 || var(33) = 8016 || var(33) = 8020 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Hit Sparks (Behind P1)]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = StateNo = 458 || StateNo = 1200 || StateNo = 1230 || StateNo = 3310
triggerAll = var(35) < 0
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8015 || var(33) = 8016 || var(33) = 8020 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x > 0, 0, ifElse(P2Dist x > var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = ifElse(StateNo = 3310 && AnimElemTime(55) >= 0, -1, 1)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Hit Sparks (Kikosho)]
type = Helper
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
triggerAll = StateNo = 3000 || StateNo = 3050
triggerAll = NumTarget
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8015 || var(33) = 8016 || var(33) = 8020 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ceil(P2Dist x))), ceil(var(36) * const(size.yScale) + P2Dist y)
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
triggerAll = MoveHit = 1 && var(30) = HitPauseTime
triggerAll = NumEnemy && var(9)
triggerAll = (StateNo != 458 && StateNo != 1200 && StateNo != 1230 && StateNo != 3310) || var(35) > 0
triggerAll = StateNo != 3000 && StateNo != 3050
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Counter FX (Behind P1)]
type = Helper
triggerAll = MoveHit = 1 && var(30) = HitPauseTime
triggerAll = NumEnemy && var(9)
triggerAll = StateNo = 458 || StateNo = 1200 || StateNo = 1230 || StateNo = 3310
triggerAll = var(35) < 0
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x > 0, 0, ifElse(P2Dist x > var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Counter FX (Kikosho)]
type = Helper
triggerAll = MoveHit = 1 && var(30) = HitPauseTime
triggerAll = StateNo = 3000 || StateNo = 3050
triggerAll = NumTarget
triggerAll = NumEnemy && var(9)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ceil(P2Dist x))), ceil(var(36) * const(size.yScale) + P2Dist y)
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
trigger1 = !IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
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
trigger1 = !IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State -2, Juggle Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(15)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100, 5109]) && (Enemy, Time >= 1)
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
ignoreHitPause = 1

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
trigger6 = var(43)
var(38) = 1
ignoreHitPause = 1

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
trigger1 = StateNo = 250
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

[State -2, EX Hyakuretsukyaku Hit Count Reset]
type = VarSet
trigger1 = !var(13)
var(27) = 0
ignoreHitPause = 1

[State -2, Tap Kick Decrement]
type = VarAdd
trigger1 = var(46) > 0
var(46) = -1

[State -2, Tap Kick Reset]
type = VarSet
trigger1 = var(46) <= 0
trigger2 = Time = 1
trigger2 = StateNo = 1100
var(45) = 0

[State -2, Tap Kick Counter + Buffer Increment]
type = VarAdd
trigger1 = command = "a"
trigger1 = var(46) := 12
trigger2 = command = "b"
trigger2 = var(46) := 12
trigger3 = command = "c"
trigger3 = var(46) := 12
trigger4 = command = "kk"
trigger4 = var(46) := 12
var(45) = 1

[State -2, Voice Position]
type = SndPan
trigger1 = 1
channel = 0
pan = 0
ignoreHitPause = 1

[State -2, Collapse Sound]
type = PlaySnd
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = AnimElem = 3
value = F7,0

[State -2, Collapse FX]
type = Explod
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = AnimElem = 3
anim = F60
posType = P1
sprpriority = -3

[State -2, Guard Crush/Throw Escape voice]
type = PlaySnd
trigger1 = Anim = 5910 || Anim = 5920 || Anim = 5930
trigger1 = AnimElemTime(1) = 1
trigger2 = Anim = 5940 || Anim = 5945
trigger2 = AnimElem = 2 && StateNo != 890
value = 800,0
channel = 0
ignoreHitPause = 1

[State -2, PalNo Time Reset]
type = Null
trigger1 = var(41) = 3240 && var(0) = 8
trigger1 = var(41) := 0
trigger2 = var(41) = 576 && var(0) = [194,196] ;Metallic Short
trigger2 = var(41) := 0
trigger3 = var(41) = 48 && var(0) = [194,196] ;Metallic Medium
trigger3 = (var(41) := (0 | 128 * 1))
trigger4 = var(41) = 192 && var(0) = [194,196] ;Metallic Long
trigger4 = (var(41) := (0 | 256 * 1))
trigger5 = var(41) = 336 && var(0) = [194,196] ;Metallic Medium, 2nd
trigger5 = (var(41) := (0 | 512 * 1))
ignoreHitPause = 1

[State -2, PalNo Time Add]
type = VarAdd
triggerAll = (var(0) = [7,11]) || (var(0) = [191,208])
trigger1 = Anim != 198 && Anim != 3601
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
var(41) = 1
ignoreHitPause = 1

[State -2, Mystique Palette Selector]
type = VarSet
triggerAll = var(0) = 8
triggerAll = var(41) % 540 = 250
trigger1 = Anim != 198
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
var(42) = 300 + Random % 63
ignoreHitPause = 1

[State -2, RemapPal: 7 palettes, reversing, 5 tick interval]
type = RemapPal
triggerAll = var(0) = 7 || var(0) = 9 || var(0) = 197 || var(0) = 201 || (var(0) = [205,207])
triggerAll = var(41) % 5 = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond(var(41) % 60 < 30, floor((var(41) % 60) / 5) , 6 - floor((var(41) % 60 - 30) / 5))
ignoreHitPause = 1

[State -2, RemapPal: 6 palettes, no reversing, 5 tick interval]
type = RemapPal
triggerAll = (var(0) = [10,11]) || (var(0) = [203,204]) || var(0) = 208
triggerAll = var(41) % 5 = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), floor((var(41) % 30) / 5)
ignoreHitPause = 1

[State -2, RemapPal: Mystique]
type = RemapPal
triggerAll = var(0) = 8
triggerAll = var(41) % 540 = 0 || var(41) % 540 = 270
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = cond(var(41) % 540 = 270, var(42), 1), cond(var(41) % 540 = 270, 10, 8)
ignoreHitPause = 1

[State -2, RemapPal: 10 palettes, no reversing, 1 tick interval (Mystique, Cyclops)]
type = RemapPal
triggerAll = var(0) = 8 && var(42) = 312
triggerAll = var(41) % 540 = [270,520]
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(42), floor(var(41) % 10) + 10
ignoreHitPause = 1

[State -2, RemapPal: 26 palettes, reversing, 1 tick interval (Mystique, Seth)]
type = RemapPal
triggerAll = var(0) = 8 && var(42) = 348
triggerAll = var(41) % 540 = [270,520]
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(42), cond((var(41) % 270) % 50 < 25, floor((var(41) % 270) % 50), 25 - floor(((var(41) % 270) % 50) - 25)) + 10
ignoreHitPause = 1

[State -2, RemapPal: Mystique transition]
type = RemapPal
triggerAll = var(0) = 8
triggerAll = (var(41) % 540 = [250,270]) || (var(41) % 540 = [520,540])
triggerAll = var(41) % 2 = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(42), cond((var(41) % 540 = [520,540]), 20 - (floor(((var(41) % 540) % 250) / 2)), (floor(((var(41) % 540) % 250) / 2)))
ignoreHitPause = 1

[State -2, RemapPal: 21 palettes, reversing, 2 tick interval (Dormammu)]
type = RemapPal
triggerAll = var(0) = 191
triggerAll = var(41) % 2 = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond(var(41) % 80 < 40, floor((var(41) % 80) / 2) , 20 - floor((var(41) % 80 - 40) / 2))
ignoreHitPause = 1

[State -2, RemapPal: 24 palettes, reversing, 5 tick interval (Endora)]
type = RemapPal
triggerAll = var(0) = 192
triggerAll = var(41) % 5 = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond(var(41) % 230 < 115, floor((var(41) % 230) / 5) , 23 - floor((var(41) % 230 - 115) / 5))
ignoreHitPause = 1

[State -2, RemapPal: 11 palettes, reversing, 5 tick interval (Medusa)]
type = RemapPal
triggerAll = var(0) = 193
triggerAll = var(41) % 2 = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond(var(41) % 100 < 50, floor((var(41) % 100) / 5) , 10 - floor((var(41) % 100 - 50) / 5))
ignoreHitPause = 1

[State -2, RemapPal: 13 palettes, reversing, 2 tick interval (Metallic, Short)]
type = RemapPal
triggerAll = var(0) = [194,196]
triggerAll = var(41) % 2 = 0
trigger1 = (var(41) & 256) = 0 && (var(41) & 128) = 0 && (var(41) & 512) = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond(var(41) % 48 < 24, floor((var(41) % 48) / 2) , 12 - floor((var(41) % 48 - 24) / 2))
ignoreHitPause = 1

[State -2, RemapPal: 19 palettes, reversing, 2 tick interval (Metallic, Medium)]
type = RemapPal
triggerAll = var(0) = [194,196]
triggerAll = var(41) % 2 = 0
triggerAll = (var(41) & 128) > 1
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond((var(41) % 128) % 64 < 32, floor(((var(41) % 128) % 64) / 2) , 16 - floor(((var(41) % 128) % 64 - 32) / 2))
ignoreHitPause = 1

[State -2, RemapPal: 23 palettes, reversing, 2 tick interval (Metallic, Long)]
type = RemapPal
triggerAll = var(0) = [194,196]
triggerAll = var(41) % 2 = 0
triggerAll = (var(41) & 256) > 1
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond((var(41) % 256) % 80 < 40, floor(((var(41) % 256) % 80) / 2) , 20 - floor(((var(41) % 256) % 80 - 40) / 2))
ignoreHitPause = 1

[State -2, RemapPal: 19 palettes, reversing, 2 tick interval (Metallic, Medium Second)]
type = RemapPal
triggerAll = var(0) = [194,196]
triggerAll = var(41) % 2 = 0
triggerAll = (var(41) & 512) > 1
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond((var(41) % 512) % 64 < 32, floor(((var(41) % 512) % 64) / 2) , 16 - floor(((var(41) % 512) % 64 - 32) / 2))
ignoreHitPause = 1

[State -2, RemapPal: 25 palettes, reversing, 2 tick interval (Tron)]
type = RemapPal
triggerAll = var(0) = [198,199]
triggerAll = var(41) % 2 = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond(var(41) % 96 < 48, floor((var(41) % 96) / 2) , 24 - floor((var(41) % 96 - 48) / 2))
ignoreHitPause = 1

[State -2, RemapPal: 29 palettes, reversing, 5 tick interval (Valentine)]
type = RemapPal
triggerAll = var(0) = 200
triggerAll = var(41) % 5 = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond(var(41) % 280 < 140, floor((var(41) % 280) / 5) , 28 - floor((var(41) % 280 - 140) / 5))
ignoreHitPause = 1

[State -2, RemapPal: 15 palettes, reversing, 5 tick interval (RadioactiveUnit)]
type = RemapPal
triggerAll = var(0) = 202
triggerAll = var(41) % 5 = 0
trigger1 = Anim != 198 && Anim != 3610
trigger2 = Anim = 198 && AnimElemTime(3) >= 17
source = 1,1
dest = var(0), cond(var(41) % 140 < 70, floor((var(41) % 140) / 5) , 14 - floor((var(41) % 140 - 70) / 5))
ignoreHitPause = 1

[State -2, PlayerPush]
type = PlayerPush
trigger1 = var(0) = 12 || var(0) = 102
trigger1 = (StateNo = [0,111]) && StateNo != 106
value = 0
ignoreHitPause = 1

[State -2, Shadow Distortion Helper]
type = Helper
trigger1 = var(0) = 12 || var(0) = 102
trigger1 = !NumHelper(6010)
helperType = Normal
stateNo = 6010
ID = 6010
name = "Shadow FX"
posType = p1
superMoveTime = 65535
ownPal = 1

[State -2, Shadow Effect]
type = SprPriority
trigger1 = var(0) = 12 || var(0) = 102
value = -1

[State -2, Finest KO detection]
type = VarSet
trigger1 = RoundState <= 2
var(51) = 0

[State -2, Finest KO detection]
type = VarSet
trigger1 = (StateNo = [1000,2999]) && var(52) = 2
trigger2 = (StateNo = [3000,4999]) && var(52) = 2
trigger3 = (StateNo = 3400 || StateNo = 3600) && var(52) >= 1
var(51) = 1
ignoreHitPause = 1

[State -2, P2 StateNo detection]
type = VarSet
trigger1 = P2MoveType != H
var(52) = 0
ignoreHitPause = 1

[State -2, P2 StateNo detection]
type = VarSet
trigger1 = EnemyNear, StateNo = [3000,4999]
trigger2 = EnemyNear, StateNo = [1000,2999]
var(52) = ifElse((EnemyNear, StateNo = [1000,2999]), 1, 2)
ignoreHitPause = 1

[State -2, EX Hyakuretsukyaku Juggle Flag Reset]
type = VarSet
trigger1 = !NumTarget(1130) && var(12)
var(12) = 0
ignoreHitPause = 1

[State -2, Super jump cancel flag off]
type = VarSet
trigger1 = (StateType != A) && var(43) && StateNo != 3101
trigger2 = MoveType = H
var(43) = 0
ignoreHitPause = 1

[State -2, Yosokyaku Hit Count Reset]
type = VarSet
trigger1 = StateType != A
var(44) = 0
ignoreHitPause = 1

[State -2, Remove Kikosho Effect]
type = RemoveExplod
triggerAll = NumExplod(3005)
triggerAll = Time > 0
trigger1 = StateNo != 3000 && StateNo != 3050
trigger2 = MoveType = H
ID = 3005
ignoreHitPause = 1

[State -2, Sealed by Chizuru's Reigi no Ishizue]
type = PalFX
trigger1 = NumProjID(131035)
trigger1 = GameTime % 2 = 1
time = 1
add = 0,0,92
sinAdd = 0,0,0,0
color = 0
invertAll = 0
color = 256
ignoreHitPause = 1

[State -2, EXPLODsive Buffering Helper]
type = Helper
trigger1 = !NumHelper(90000005)
helpertype = Normal
stateNo = 90000005
ID = 90000005
name = "EXPLODsive Buffering helper"
posType = P1
facing = ifElse(Facing = 1, 1, -1)
keyCtrl = 1
ignoreHitPause = 1

[State -2, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "AI = %d Mode = %d Attack = %f Hits = %d Juggle = %d"
params = AILevel, var(40), fvar(11), var(13), var(15)
ignoreHitPause = 1

[State -2, Debug]
type = AppendToClipboard
trigger1 = 1
text = "\nBy Jmorphman"
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
trigger1 = StateNo != 1000 && StateNo != 1030
trigger1 = StateNo != [3000,3050]
var(18) = 0

[State -3, Projectile Flag Reset]
type = VarSet
trigger1 = var(39) < 0
var(39) = 0
ignoreHitPause = 1

[State -3, Projectile Flag Off]
type = VarSet
trigger1 = !NumHelper(1005)
trigger1 = !NumHelper(1035)
var(39) = 0
ignoreHitPause = 1

[State -3, Chain Combo Reset]
type = VarSet
trigger1 = 1
var(4) = 0
ignoreHitPause = 1

[State -3, Chain Combo Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699]) && MoveContact && StateNo != [648,649]
trigger2 = var(20) && (StateNo = [1000,2999]) && StateType != A && (MoveContact || var(18))
trigger3 = var(20) && StateNo = 195 && MoveContact
var(4) = 1
ignoreHitPause = 1

[State -3, Cancel Reset]
type = VarSet
trigger1 = 1
var(6) = 0
ignoreHitPause = 1

[State -3, Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2 && (StateNo != [246,248])
trigger4 = StateNo = 200
trigger5 = StateNo = 210 && AnimElemTime(6) < 0
trigger6 = StateNo = 215 && AnimElemTime(12) < 0
trigger7 = StateNo = 225 && AnimElemTime(6) < 0
trigger8 = StateNo = 230
trigger9 = StateNo = 235
trigger10 = StateNo = 245 && AnimElemTime(8) < 0
trigger11 = StateNo = 255 && AnimElemTime(7) < 0
trigger12 = StateNo = 256 && AnimElemTime(8) < 0
trigger13 = StateNo = 400
trigger14 = StateNo = 410 && AnimElemTime(6) < 0
trigger15 = StateNo = 420 && AnimElemTime(7) < 0
trigger16 = StateNo = 430
trigger17 = StateNo = 440 && AnimElemTime(6) < 0
trigger18 = var(20) && StateNo = 195 && MoveContact
var(6) = 1
ignoreHitPause = 1

[State -3, Super Cancel Reset]
type = VarSet
trigger1 = 1
var(7) = 0
ignoreHitPause = 1

[State -3, Super Cancel Flag Reset]
type = VarSet
trigger1 = var(21)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(21) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200
trigger5 = StateNo = 210 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger6 = StateNo = 215 && (AnimElemTime(12) < 0 || (MoveContact = [1,8]))
trigger7 = StateNo = 225 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger8 = StateNo = 230
trigger9 = StateNo = 235
trigger10 = StateNo = 240 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger11 = StateNo = 245 && (AnimElemTime(8) < 0 || (MoveContact = [1,8]))
trigger12 = StateNo = 255 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger13 = StateNo = 256 && (AnimElemTime(8) < 0 || (MoveContact = [1,8]))
trigger14 = StateNo = 400
trigger15 = StateNo = 410 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger16 = StateNo = 420 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger17 = StateNo = 430
trigger18 = StateNo = 440 && (AnimElemTime(6) < 0 || (MoveContact = [1,8]))
trigger19 = StateNo = 450 && (AnimElemTime(7) < 0 || (MoveContact = [1,8]))
trigger20 = var(20) && StateNo = 195 && MoveContact
trigger21 = StateNo = 1000 && (AnimElemTime(7) = [1,8])
trigger22 = StateNo = 1030 && (AnimElemTime(7) = [1,8])
trigger23 = (StateNo = 1101 || StateNo = 1130) && MoveContact
trigger24 = (StateNo = 1400 || StateNo = 1430) && AnimElemTime(4) < 0 && MoveContact
var(7) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = 1
var(8) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = StateNo = 3100 && AnimElemTime(38) < 0 && MoveContact
trigger2 = StateNo = 3400 && AnimElemTime(23) < 0 && MoveContact
var(8) = 1
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
trigger1 = !AILevel && (StateType = S || StateType = C || StateNo = 5120)
;Standing/crouch, no reversed commands
trigger1 = !NumExplod(92828282) && !NumExplod(94646464) && !NumExplod(92468246)
trigger1 = ifElse(P2dist x >= 0, command = "fwd", command = "back") || command = "down"
;Air, no reversed commands
trigger2 = !AILevel && StateType = A && (var(3) != 1 && var(3) != 2)
trigger2 = !NumExplod(94646464) && !NumExplod(92468246)
trigger2 = ifElse(P2dist x >= 0, command = "fwd", command = "back")
;Standing/crouch, left/right or all directions reverse
trigger3 = !AILevel && (StateType = S || StateType = C || StateNo = 5120)
trigger3 = NumExplod(94646464) || NumExplod(92468246)
trigger3 = ifElse(P2dist x >= 0, command = "back", command = "fwd") || ifElse(NumExplod(92468246), command = "up", command = "down")
;Standing/crouch, up/down reverse only
trigger4 = !AILevel && (StateType = S || StateType = C || StateNo = 5120)
trigger4 = NumExplod(92828282) && !NumExplod(94646464) && !NumExplod(92468246)
trigger4 = ifElse(P2dist x >= 0, command = "fwd", command = "back") || command = "up"
;Air, reversed commands
trigger5 = !AILevel && StateType = A && (var(3) != 1 && var(3) != 2)
trigger5 = NumExplod(94646464) || NumExplod(92468246)
trigger5 = ifElse(P2dist x >= 0, command = "back", command = "fwd")
trigger6 = AILevel && (StateNo != [760,762]) && InGuardDist && Random < 50
trigger7 = AILevel && (StateNo = [760,762]) && Time = 14 && Random < 667
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
triggerAll = MoveType != H
trigger1 = MoveContact = 1 && NumTarget
fvar(5) = Target, GetHitVar(xVel)
ignoreHitPause = 1

[State -3, Corner Push]
type = PosAdd
triggerAll = (StateNo != 3000 && StateNo != 3050)
triggerAll = fvar(5)
triggerAll = (StateType = S || StateType = C) && NumTarget
triggerAll = !HitPauseTime && Target, GetHitVar(HitShakeTime) <= 0
triggerAll = (Target, StateType = S || Target, StateType = C) && !(Target, GetHitVar(yvel)) && !(Target, HitFall)
trigger1 = Target, FrontEdgeBodyDist <= abs(Target, vel x)
trigger1 = (Target, GetHitVar(xvel) * Target, Facing) > 0
trigger2 = Target, BackEdgeBodyDist <= abs(target, vel x)
trigger2 = (Target, GetHitVar(xvel) * Target, Facing) < 0
x = ifElse(Target, FrontEdgeBodyDist <= 0, -1, 1) * (Target, Facing) * fvar(5)

[State -3, Corner Push (Kikosho)]
type = PosAdd
triggerAll = (StateNo = 3000 && AnimElemTime(22) < 0) || (StateNo = 3050 && AnimElemTime(34) < 0)
triggerAll = FrontEdgeDist < 100
triggerAll = fvar(5)
triggerAll = (StateType = S || StateType = C) && NumTarget
triggerAll = !HitPauseTime && Target, GetHitVar(HitShakeTime) <= 0
trigger1 = Target, FrontEdgeBodyDist <= abs(Target, vel x)
trigger1 = (Target, GetHitVar(xvel) * Target, Facing) > 0
trigger2 = Target, BackEdgeBodyDist <= abs(target, vel x)
trigger2 = (Target, GetHitVar(xvel) * Target, Facing) < 0
x = ifElse(Target, FrontEdgeBodyDist <= 0, -1, 1) * (Target, Facing) * fvar(5) * ifElse(StateNo = 3000, 4, 2)

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
trigger1 = (StateNo = 3000 || StateNo = 3100 || StateNo = 3200 || StateNo = 3400 || StateNo = 3500) && (!var(40) || (var(40) && var(1)))
trigger1 = Time = 43
trigger2 = StateNo = 3000 && Time = 68 && var(40) && !var(1)
trigger3 = StateNo = 3400 && Time = 54 && var(40) && !var(1)
trigger4 = StateNo = 3500 && Time = 63 && var(40) && !var(1)
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
trigger1 = (StateNo = 3050 || StateNo = 3150 || StateNo = 3250 || StateNo = 3450 || StateNo = 3550) && (!var(40) || (var(40) && var(1)))
trigger1 = Time = 43
trigger2 = StateNo = 3050 && Time = 68 && var(40) && !var(1)
trigger3 = StateNo = 3450 && Time = 54 && var(40) && !var(1)
trigger4 = StateNo = 3550 && Time = 63 && var(40) && !var(1)
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
trigger1 = StateNo = 3300 && Time = 43
trigger2 = StateNo = 3600
trigger2 = (Time = 43 && var(1)) || (Time = 59 && !var(1))
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
trigger4 = StateNo != [3600,3611]
trigger5 = StateNo = 3600 && AnimElemTime(14) < 0
time = 2

[State -3, AfterImage Off]
type = AfterImageTime
triggerAll = Time <= 1
trigger1 = StateNo = 3000 || StateNo = 3050 || StateNo = 3100 || StateNo = 3150 || StateNo = 3200 || StateNo = 3250 || StateNo = 3400 || StateNo = 3450 || StateNo = 3500 || StateNo = 3550
trigger2 = StateNo = 3300 || StateNo = 3600
trigger3 = StateNo = 3610
time = 0

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
value = 5000,(Random % 3)
channel = 0
ignoreHitPause = 1

[State -3, Get Hit Sound]
type = PlaySnd
triggerAll = Alive && Time = 1
trigger1 = (StateNo = 5000 || StateNo = 5010) && NumEnemy
trigger1 = GetHitVar(fall) || (EnemyNear, HitDefAttr = SCA,SA,HA)
trigger2 = (StateNo = 5020 || StateNo = 5070 || StateNo = 5080)
trigger3 = (StateNo = 5050 || StateNo = 5100) && (PrevStateNo != [5000,5199])
value = 5000,(Random % 3)
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

[State -3, Stop Guarding Voice]
type = StopSnd
trigger1 = StateNo = [120,155]
channel = 0

[State -3, Custom Combo Finish]
type = Helper
triggerAll = WinKO && var(20)
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = [1,4]
trigger2 = StateNo = 810 && (AnimElemTime(8) = [0, 1])
trigger3 = StateNo = 820 && (AnimElemTime(16) = [0, 1])
trigger4 = StateNo = 861 && Time <= 1
trigger5 = NumHelper(1005)
trigger5 = (Helper(1005), StateNo = [1005,1007]) && (Helper(1005), var(18))
helperType = Normal
stateNo = 8600
ID = 8600 + 0 * (var(23) := 900)
name = "Super Finish"
posType = Left
pos = 160, -120
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
trigger3 = (StateNo = [3100,3199]) && StateNo != 3101
trigger3 = var(23) := 3100
trigger4 = (StateNo = [3200,3299])
trigger4 = var(23) := 3200
trigger5 = (StateNo = [3300,3399])
trigger5 = var(23) := 3300
trigger6 = (StateNo = [3400,3499])
trigger6 = var(23) := 3400
trigger7 = (StateNo = [3500,3599])
trigger7 = var(23) := 3500
trigger8 = (StateNo = [3600,3699])
trigger8 = var(23) := 3600
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

