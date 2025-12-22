; ADD004 BASIC PIEs ReBuilded CNS (25/12/2018)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==

; _____________________________________
;| K' by Chazzanova & Dampir           |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
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
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, VelSet]
type = VelSet
trigger1 = command = "holdback"
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
trigger1 = !AnimTime
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Velocity: Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 1
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Velocity: Long Low Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 2
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = 0.75 * const(velocity.jump.y)

[State 40, Velocity: Long Jump]
type = VelSet
trigger1 = !AnimTime && var(3) = 3
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifElse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

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
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 4 || AnimElem = 8)
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

[State 105, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = 0.985

[State 105, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.4

[State 105, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 105, Land]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = pos y > -vel y
value = 106


;Stop Dashing Backwards
[StateDef 106]
type = S
physics = S
movetype = I
ctrl = 0
anim = 106
velSet = 0,0

[State 106, PosSet]
type = PosSet
trigger1 = !Time
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
triggerall = AnimElemTime(2) <= 0
trigger1 = !AILevel && command != "holdfwd"
sysvar(1) = 0

[State 110, ChangeState to Running]
type = ChangeState
trigger1 = AnimElemTime(2) = 0 && sysvar(1)
value = 100

[State 110, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(2) >= 0
statetype = A
physics = N

[State 110, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 6.8
y = -3

[State 110, VelMul]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = 0.98

[State 110, PosAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.4

[State 110, End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = pos y > -vel y
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
value = 4, ifElse(Random < 500, 0, 1)
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
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifElse((command = "x" || command = "y" || command = "z"), 225, 250)

[State 700, Attack (AI)]
type = ChangeState
trigger1 = AILevel && (Time = [15,25]) && NumEnemy
trigger1 = (EnemyNear, MoveType != A) && (P2BodyDist x = [-60,60]) && (P2Dist y >= -60)
value = ifElse(Random < 666, 220, 250)

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

[State 710, Dash Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0

[State 710, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 710, HitBy]
type = HitBy
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(7) < 0
value = SCA,AT
time = 1

[State 710, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(Random < 500, 0, 1)
channel = 0

[State 710, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(8) < 0
x = 4.5

[State 710, VelSet]
type = VelSet
trigger1 = AnimElemTime(8) = 1
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

[State 715, Dash Sound]
type = PlaySnd
trigger1 = !Time
value = 110,0

[State 715, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 715, HitBy]
type = HitBy
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(6) < 0
value = SCA,AT
time = 1

[State 715, Voice]
type = PlaySnd
trigger1 = !Time
value = 4, ifElse(Random < 500, 0, 1)
channel = 0

[State 715, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(7) < 0
x = -4.5

[State 715, VelSet]
type = VelSet
trigger1 = AnimElemTime(7) = 1
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

[State 730, Flames 1]
type = Explod
trigger1 = AnimElem = 5
ID = 730
anim = 3002
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1

[State 730, Flames 2]
type = Explod
trigger1 = AnimElem = 7
ID = 730
anim = 3003
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
removetime = -1
ownpal = 1
removeongethit = 1

[State 730, RemoveExplod]
type = RemoveExplod
trigger1 = Power >= const(data.power) || Power >= PowerMax || RoundState != 2
trigger2 = !AILevel && (command != "holdb" || command != "holdy")
trigger3 = AILevel && (InGuardDist || P2BodyDist x <= 120)
id = 730

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

[State 731, Flames Vanish]
type = Explod
trigger1 = AnimElem = 1
anim = 3012
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1

[State 731, StopSnd]
type = StopSnd
trigger1 = !Time
channel = 0

[State 731, Full Power Voice]
type = PlaySnd
trigger1 = !Time && Power >= const(data.power)
value = 181,0
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

[State 750, Zero Counter FX Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8350
ID = 8350
name = "Zero Counter"
posType = P1
pos = ceil(-1 * const(size.xScale)), ceil(-67 * const(size.yScale))
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
pos = ceil(40 * const(size.xScale)), ceil(-65 * const(size.yScale))
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
pos = ceil(49 * const(size.xScale)), ceil(-67 * const(size.yScale))
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
pos = ceil(24 * const(size.xScale)), ceil(-93 * const(size.yScale))
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
value = 1202,0
channel = 0

[State 900, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo FX"
posType = P1
pos = ceil(22 * const(size.xScale)), ceil(-93 * const(size.yScale))
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
value = 1202,0
channel = 0

[State 905, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo Startup"
posType = P1
pos = 14, -89
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
x = -6
y = 0

[State 5201, VelMul]
type = VelMul
trigger1 = 1
x = 0.9

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
pos = 0, ceil(-18 * const(size.yScale))
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 5201, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, PosAdd]
type = PosAdd
trigger1 = AnimElemTime(3) > 0
trigger1 = AnimElemTime(4) < 0
y = -3.5
ignoreHitPause = 1

[State 5201, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
y = 7
ignoreHitPause = 1

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
x = ifElse((command = "holdfwd" && command != "holdback"), 4, ifElse((command != "holdfwd" && command = "holdback"), -4, 0))
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


;====<INITIALIZE>====
[StateDef 5900]
type = S

[State 5900, Int VarReset]
type = VarRangeSet
trigger1 = !RoundsExisted
value = 0

[State 5900, Float VarReset]
type = VarRangeSet
trigger1 = !RoundsExisted
fvalue = 0

[State 5900, 3] ;Change palette
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,palno

[State 5900, Turns Intro]
type = ChangeState
trigger1 = TeamMode = Turns
trigger1 = !RoundsExisted && RoundNo >= 2
value = 6900

[State 5900, K' Intro vs Kyo]
type = ChangeState
triggerAll = var(40) != 1
triggerAll = NumEnemy
triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
trigger1 = Enemy, Name = "Kyo Kusanagi"
value = 191


[State 5900, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1
value = 190

[State 5900, End]
type = ChangeState
trigger1 = 1
value = 0

;====<INTRO>====

[StateDef 190]
type = S
physics = N
anim = 190

[State 191, DIALOGUE]
type = helper
trigger1 = ((time = 10 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns) && gametime
helpertype = normal
stateno = 9200
ID = 9200
postype = p1
pos = 0, 0
size.xscale = 1
size.yscale = 1
ownpal = 0
persistent = 0
ignorehitpause = 1

[State 256, AS]
type=assertspecial
trigger1=1
flag=intro
flag2 = nobardisplay

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 190,0 + (Random % 3)
channel = 0

[State 190, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====<INTRO2>====

[StateDef 191]
type = S
physics = N
anim = 191

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 256, AS]
type=assertspecial
trigger1=1
flag=intro
flag2 = nobardisplay


[State 190, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 190,3
channel = 0

[State 190, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 190,4
channel = 0

[State 190, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 190,2
channel = 1

[State 190, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3200,0
channel = 2
volume = 100

[State 3000, Flames 1]
type = Explod
trigger1 = AnimElem = 1
ID = 3002
anim = 3002
bindTime = 1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1

[State 3000, Flames 2]
type = Explod
trigger1 = AnimElem = 2
ID = 3003
anim = 3003
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
removetime = -1
ownpal = 1
removeongethit = 1

[State 3001, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 4
ID = 3002

[State 3001, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 4
ID = 3003

[State 190, End]
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
trigger1 = AnimElem = 16
value = 190,0 + (Random % 2)
channel = 0

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
value = (Random % 22)

[State 180, Victory Quote vs. Kula Diamond]
type = VictoryQuote
trigger1 = Enemy, Name = "Andy Bogard" || Enemy, Name = "cvsandy"
value = 22

[State 180, Victory Quote vs. N.E.S.T.S. Team]
type = VictoryQuote
trigger1 = Enemy, Name = "Angel"
trigger2 = Enemy, Name = "Foxy"
value = 22

[State 180, Victory Quote vs. Ash Crimson]
type = VictoryQuote
trigger1 = Enemy, Name = "Ash Crimson" || Enemy, Name = "Ash"
value = 24 + (Random % 2)

[State 180, Victory Quote vs. Benimaru Nikaido]
type = VictoryQuote
trigger1 = Enemy, Name = "Benimaru Nikaido" || Enemy, Name = "Benimaru" || Enemy, Name = "cvsBenimaru"
value = 26 + (Random % 2)

[State 180, Victory Quote vs. Billy Kane]
type = VictoryQuote
trigger1 = Enemy, Name = "Billy Kane" || Enemy, Name = "Billy"
value = 28

[State 180, Victory Quote vs. Chin Gentsai]
type = VictoryQuote
trigger1 = Enemy, Name = "Chin Gentsai" || Enemy, Name = "Chin"
value = 29

[State 180, Victory Quote vs. Goro Daimon]
type = VictoryQuote
trigger1 = Enemy, Name = "Daimon" || Enemy, Name = "Goro Daimon"
value = 27 + (Random % 2) * 3

[State 180, Victory Quote vs. Elisabeth Blanctorche]
type = VictoryQuote
trigger1 = Enemy, Name = "Elisabeth Blanctorche" || Enemy, Name = "Elisabeth"
value = 31

[State 180, Victory Quote vs. Ash Crimson]
type = VictoryQuote
trigger1 = Enemy, Name = "Dark Ash" || Enemy, Name = "Evil Ash" || Enemy, Name = "Blood Spiraling into Insanity Ash"
value = 32

[State 180, Victory Quote vs. Duo Lon]
type = VictoryQuote
trigger1 = Enemy, Name = "Duo Lon" || Enemy, Name = "DuoLon"
value = 33

[State 180, Victory Quote vs. Iori Yagami]
type = VictoryQuote
trigger1 = Enemy, Name = "Iori Yagami" || Enemy, Name = "Iori" || Enemy, Name = "cvsIori"
value = 34

[State 180, Victory Quote vs. Flameless Iori Yagami]
type = VictoryQuote
trigger1 = Enemy, Name = "F-Iori Yagami" && Enemy, AuthorName = "Vans"
value = 35

[State 180, Victory Quote vs. K']
type = VictoryQuote
trigger1 = Enemy, Name = "Ultimate K'" || Enemy, Name = "K'"
value = 36

[State 180, Victory Quote vs. K9999]
type = VictoryQuote
trigger1 = Enemy, Name = "K9999"
value = 23 + (Random % 2) * 14

[State 180, Victory Quote vs. Kim Kaphwan]
type = VictoryQuote
trigger1 = Enemy, Name = "Kim Kaphwan" || Enemy, Name = "Kim" || Enemy, Name = "cvsKim"
value = 38 + (Random % 2)

[State 180, Victory Quote vs. King]
type = VictoryQuote
trigger1 = Enemy, Name = "King" || Enemy, Name = "cvsking"
value = 40

[State 180, Victory Quote vs. Kula Diamond]
type = VictoryQuote
trigger1 = Enemy, Name = "Kula Diamond" || Enemy, Name = "Kula"
value = 41 + (Random % 4)

[State 180, Victory Quote vs. Kyo Kusanagi]
type = VictoryQuote
trigger1 = (Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName != "Jmorphman") || (Enemy, Name = "cvskyo" && Enemy, PalNo <= 6) || Enemy, Name = "cvskyo_normal" || Enemy, Name = "Kyo_WLS"
trigger2 = Enemy, Name = "Kyo Kusanagi" && Enemy, AuthorName = "Jmorphman" && Enemy, var(40) != 1
value = 45 + (Random % 2)

[State 180, Victory Quote vs. Leona Heidern]
type = VictoryQuote
trigger1 = Enemy, Name = "Leona" || Enemy, Name = "Leona Heidern"
value = 47

[State 180, Victory Quote vs. Mai Shiranui]
type = VictoryQuote
trigger1 = Enemy, Name = "Mai Shiranui" || Enemy, Name = "Mai" || Enemy, Name = "cvsmai"
value = 48

[State 180, Victory Quote vs. Malin]
type = VictoryQuote
trigger1 = Enemy, Name = "Malin"
value = 33 + (Random % 2) * 16

[State 180, Victory Quote vs. Mature]
type = VictoryQuote
trigger1 = Enemy, Name = "Mature" || Enemy, Name = "cvsmature"
value = 50

[State 180, Victory Quote vs. Maxima]
type = VictoryQuote
trigger1 = Enemy, Name = "Maxima"
value = 51 + (Random % 3)

[State 180, Victory Quote vs. Mudman]
type = VictoryQuote
trigger1 = Enemy, Name = "Mudman"
value = 54

[State 180, Victory Quote vs. N.E.S.T.S. Kyo]
type = VictoryQuote
trigger1 = Enemy, Name = "Kyo_WLS"
value = 55

[State 180, Victory Quote vs. Robert Garcia]
type = VictoryQuote
trigger1 = Enemy, Name = "Robert" || Enemy, Name = "Robert Garcia" || Enemy, Name = "Robert_WLS"
value = 56

[State 180, Victory Quote vs. Ryo Sakazaki]
type = VictoryQuote
trigger1 = Enemy, Name = "Ryo" || Enemy, Name = "Ryo Sakazaki" || Enemy, Name = "cvsryo"
value = 57

[State 180, Victory Quote vs. Saiki]
type = VictoryQuote
trigger1 = Enemy, Name = "Saiki"
value = 58

[State 180, Victory Quote vs. Shen Woo]
type = VictoryQuote
trigger1 = Enemy, Name = "Shen Woo" || Enemy, Name = "Shen"
value = 33 + (Random % 2) * 26

[State 180, Victory Quote vs. Shiki]
type = VictoryQuote
trigger1 = Enemy, Name = "Shiki"
value = 60

[State 180, Victory Quote vs. Takuma Sakazaki]
type = VictoryQuote
trigger1 = Enemy, Name = "Takuma" || Enemy, Name = "Takuma Sakazaki"
value = 61

[State 180, Victory Quote vs. Terry Bogard]
type = VictoryQuote
trigger1 = Enemy, Name = "Terry" || Enemy, Name = "Terry Bogard" || Enemy, Name = "cvsterry"
value = 62

[State 180, Victory Quote vs. Vice]
type = VictoryQuote
trigger1 = Enemy, Name = "Vice" || Enemy, Name = "cvsvice"
value = 63

[State 180, Victory Quote vs. Whip]
type = VictoryQuote
trigger1 = Enemy, Name = "Whip"
value = 64 + (Random % 4)

[State 180, Victory Quote vs. Yuri Sakazaki]
type = VictoryQuote
trigger1 = Enemy, Name = "Yuri" || Enemy, Name = "Yuri Sakazaki" || Enemy, Name = "cvsyuri"
value = 49 + (Random % 2) * 19

[State 180, Win Decider]
type = ChangeState
trigger1 = 1
value = 181 + (Random % 2) * 2


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

[State 181, Voice]
type = PlaySnd
trigger1 = AnimElem = 12
value = 181,0 + (Random % 2)
channel = 0


;====<WIN 2>====
[StateDef 183]
type = S
physics = S
anim = 183
ctrl = 0

[State 181, Assert: RoundNotOver]
type = AssertSpecial
trigger1 = Time < 200
flag = RoundNotOver

[State 181, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 183,0
channel = 0


;====<WIN BY HYPER CHAIN DRIVE>====
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
trigger1 = AnimElem = 12
value = 181,0 + (Random % 2)
channel = 0


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
trigger1 = !Time
value = 181, 0
channel = 0

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
trigger1 = AnimElem = 25
value = F7,0

[State 5950, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 25
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



[State -2, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAirGuard

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = StateNo = [3000, 3999]
ID = 1101

[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = StateNo = [3000, 3999]
ID = 1102

[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(30) < 0
var(30) = HitPauseTime
ignoreHitPause = 1

[State -2, Wall Impact Dust]
type = Helper
trigger1 = NumTarget(218)
trigger1 = (Target(218), StateNo = 1092) && !NumHelper(8111)
helperType = Normal
stateNo = 8111
ID = 8111
name = "Wall Impact Dust"
posType = P2
facing = -1
pos = Target(218), Const(size.mid.pos.x) - 10, Target(218), Const(size.mid.pos.y)
ownPal = 1

[State -2, P2 Skid State Snd]
type = PlaySnd
triggerall = NumEnemy
triggerall = EnemyNear, AnimElemTime(1) = 1
trigger1 = P2StateNo = 952 && P2MoveType = H
value = 101,1
persistent = 0
channel = 10

[State -2, Reversal Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0 && var(31) = 750
value = 750,0
ignoreHitPause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0 && var(31) != 750
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
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8020 || var(33) = 8001
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

[State -2, Counter FX]
type = Helper
triggerAll = MoveHit = 1 && var(30) = HitPauseTime
triggerAll = NumEnemy && var(9)
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


[State -2, Excel PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignorehitpause = 1

[State -2, Excel PalFX]
type = palfx
trigger1 = (var(20) = [1, 60])
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignorehitpause = 1

[State -2, Excel Timer]
type = helper
trigger1 = !numhelper(8405) && var(20) > 0
helpertype = normal
stateno = 8405
ID = 8405
name = "Excel Timer"
postype = p1
ownpal = 1
pausemovetime = 2147483647
supermovetime = 2147483647
ignorehitpause = 1

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
ignoreHitPause = 1

[State -2, Dampener]
type = VarSet
trigger1 = 1
fvar(10) = ifElse(var(13) < 6, 24, ifElse(var(13) >= 23, 1, 29 - var(13))) / 24.0
ignoreHitPause = 1

[State -2, Dampener (EX Second Shell)]
type = VarSet
trigger1 = var(12) > 5
fvar(10) = 0.72 * (10 - ifElse(var(13) >= 10, 10, var(13))) / 10.0
ignoreHitPause = 1

[State -2, Dampener - Custom Combo]
type = VarSet
trigger1 = var(20)
fvar(10) = 0.72 * (10 - ifElse(var(13) >= 10, 10, var(13))) / 10.0
ignoreHitPause = 1

[State -2, Dampener - Custom Combo Limiter]
type = VarSet
trigger1 = var(20)
trigger1 = StateNo = 218 || StateNo = 220 || StateNo = 225 || StateNo = 250 || StateNo = 420
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

[State -2, Voice Position]
type = SndPan
trigger1 = 1
channel = 0
pan = 0
ignoreHitPause = 1

[State -2, Advance AnimElem during Collapse Anim]
type = ChangeAnim
trigger1 = Anim = 5950 && StateNo != 5950
trigger1 = AnimElem = 5
value = 5950
elem = 19
ignoreHitPause = 1

[State -2, Collapse Sound]
type = PlaySnd
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = AnimElem = 25
value = F7,0

[State -2, Collapse FX]
type = Explod
trigger1 = StateNo != 5950
trigger1 = Anim = 5950 || Anim = 5955
trigger1 = AnimElem = 25
anim = F60
posType = P1
sprpriority = -3

[State -2, Guard Crush/Throw Escape voice]
type = playsnd
trigger1 = Anim = 5910 || Anim = 5920 || Anim = 5930
trigger1 = AnimElemTime(1) = 1
trigger2 = Anim = 5940 || Anim = 5945
trigger2 = AnimElem = 2 && StateNo != 890
value = 5940,0
channel = 0
ignoreHitPause = 1

[State -2, Back Charge Increment]
type = VarAdd
trigger1 = command = "holdback"
var(47) = 1

[State -2, Back Charge Reset]
type = VarSet
trigger1 = command != "holdback"
var(47) = 0

[State -2, Back Charge Buffer Activation]
type = VarSet
trigger1 = var(47) >= 38
var(48) = 32

[State -2, Back Charge Buffer Decrement]
type = VarAdd
trigger1 = var(47) < 45 && var(48) > 0
var(48) = -1

[State -2, Down Charge Increment]
type = VarAdd
trigger1 = command = "holddown"
var(49) = 1

[State -2, Down Charge Reset]
type = VarSet
trigger1 = command != "holddown"
var(49) = 0

[State -2, Down Charge Buffer Activation]
type = VarSet
trigger1 = var(49) >= 38
var(50) = 32

[State -2, Down Charge Buffer Decrement]
type = VarAdd
trigger1 = var(49) < 45 && var(50) > 0
var(50) = -1

[State -2, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "AI = %d Attack = %f ET Hit Detect = %d Hits = %d Juggle = %d"
params = AILevel, fvar(10), var(12), var(13), var(15)
ignoreHitPause = 1

[State -2, Debug]
type = AppendToClipboard
trigger1 = 1
text = "\nBy Chazzanova"
ignoreHitPause = 1


;Light
[State -2]
type = Helper
triggerall = !NumHelper(23680) 
trigger1 = StageVar(info.author) = "light"
pos = 0,0
stateno = 23680
id = 23680
ownpal = 1
persistent = 0
ignorehitpause = 1
postype = p1

[State -2]
type = Helper
triggerall = !NumHelper(23681) 
trigger1 = StageVar(info.author) = "light"
pos = 134,0
stateno = 23681
id = 23681
ownpal = 1
persistent = 0
ignorehitpause = 1
postype = left

[State -2]
type = Helper
triggerall = !NumHelper(23682)
trigger1 = StageVar(info.author) = "light"
pos = -134,0
stateno = 23682
id = 23682
ownpal = 1
persistent = 0
ignorehitpause = 1
postype = right
;--------------------------------------------------------------
;1aD§3oE?I?OA
;--------------------------------------------------------------
[Statedef 23680]
type = S
movetype= H
physics = N
velset = 0,0
sprpriority = -10

[State 3680, 4]
type = changeanim
trigger1 = time%2 = 0
value = 9741

[State 3680, 4]
type = ChangeAnim
triggerall = time%2 = 1
trigger1 = ((root,anim = [0,9741]) && root,movetype != H) 
trigger2 = (root,anim = [5000,9999])
value = root,anim
elem = root,animelemno(0)
ignorehitpause = 1
persistent = 1

[State 3680, 0]
type = PalFX
trigger1 = time = 0
time = -1
add = 224,88,0
sinadd = 48,50,32,16
;add = 248,232,192

[State 3680,0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3680, 4]
type=BindToParent
trigger1 = 1
time = -1
facing = 1
pos = (1+ifelse(Parent,fvar(36) = 1,-1,0)+ifelse(Parent,fvar(36) = 2,-2,0))*ifelse(Facing = -1,-1,1),0
;--------------------------------------------------------------
;1aD§×o
;--------------------------------------------------------------
[Statedef 23681]
type = S
movetype= H
physics = N
velset = 0,0
anim = 9741
sprpriority = -10

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X > 0 && RootDist X < 52
fvar(40) = 1

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X < 0
fvar(40) = 0

[State 3680,1]
type = NotHitBy
trigger1 = 1
value = SCA
;--------------------------------------------------------------
;1aD§OO
;--------------------------------------------------------------
[Statedef 23682]
type = S
movetype= H
physics = N
velset = 0,0
anim = 9741
sprpriority = -10

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X < 0 && RootDist X > 52
fvar(40) = 1

[State 3680,1]
type = ParentVarSet
trigger1 = RootDist X > 0
fvar(40) = 2

[State 3680,1]
type = NotHitBy
trigger1 = 1
value = SCA

;---------------------------------------------------
;VVVVVVV Electro -2 Interactive stage codes VVVVVVVV
;---------------------------------------------------

;---------------------------------------
;VVVVV - Extra Fun Stuff Remove - VVVVV

;Fire React (Remove this code if you have custom Fire animations)
[State -2,FX]
type = PalFX
trigger1 = time =1
trigger1 = anim = (88912) = 1
time = 45
add = 255,155,2
mul = 255,155,1
sinadd = 110,55,85,10
invertall = 0
color = 0

;---------------------------------------
;Electric react   (Remove this code if you have custom Electric animations)
[State -2,FX]
type = PalFX
trigger1 = time =1
trigger1 = anim = (88920) = 1
time = 45
add = 48,48,48
mul = 256,256,256
sinadd = 64,64,64,4
invertall = 1
color = 0
;--------------------------------------------

;^^^^^^ - Extra Fun Stuff Remove - ^^^^^^
;---------------------------------------------

;---------------------------------------
;Assert Specials Finishers Stuff
[State -2, NoShadowFinishers]
type = AssertSpecial
trigger1 = stateno = 5150
trigger1 = prevstateno = 889668
trigger2 = stateno = 5150
trigger2 = prevstateno = 889674
trigger3 = stateno = 5150
trigger3 = prevstateno = 889756
trigger4 = stateno = 5150 && prevstateno = 889310
flag = noshadow

[State -2, nokoslow]
type = assertspecial
trigger1 = roundno != 1
trigger1 = stagevar(info.name) = "Howard Arena"
trigger2 = roundno != 1
trigger2 = stagevar(info.name) = "Howard Arena Storm"
trigger3 = roundno != 1
trigger3 = stagevar(info.name) = "Howard Arena Thunder"
trigger4 = roundno != 1
trigger4 = stagevar(info.name) = "The Dead Pool"
trigger5 = roundno != 1
trigger5 = stagevar(info.name) = "Green Hell"
trigger6 = roundno != 1
trigger6 = stagevar(info.name) = "Vagnad Stage"
trigger7 = roundno != 1
trigger7 = stagevar(info.name) = "Ultimate_Capcom_Building"
trigger8 = roundno != 1
trigger8 =stagevar(info.name) = "Ultimate_USSR" 
flag = nokoslow

[State -2, NoForeground]
type = AssertSpecial
trigger1 = stateno = 5150
trigger1 = prevstateno = 889764
flag = noFG

[State -2, Invisble]
type = ChangeAnim
trigger1 = stateno = 181
trigger1 = prevstateno = 889769
trigger2 = stateno = 5150 && prevstateno = 889310
value = 9800 ;invisible
ignorehitpause = 1

[State -2, PosSet]
type = PosSet
trigger1 = stateno = 181
trigger1 = prevstateno = 889769
trigger1 = stateno = 5150 && prevstateno = 889310
x = 0
y = 300
ignorehitpause = 1

;---------------------------------------
;Fire React (Remove this code if you have custom Fire animations)
[State -2,FX]
type = PalFX
trigger1 = time =1
trigger1 = anim = (88912) = 1
time = 45
add = 255,155,2
mul = 255,155,1
sinadd = 110,55,85,10
invertall = 0
color = 0

;---------------------------------------
;Electric react   (Remove this code if you have custom Electric animations)
[State -2,FX]
type = PalFX
trigger1 = time =1
trigger1 = anim = (88920) = 1
time = 45
add = 48,48,48
mul = 256,256,256
sinadd = 64,64,64,4
invertall = 1
color = 0

;---------------------------------
;Fire Ropes for J. Carn's World Heroes Death Match 1 stage
[State -2, deathmatchfire]
type = Helper
trigger1 = stagevar(info.name) = "Death Match"
trigger1 = Numhelper(88910) = 0  ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Death Match"
trigger2 = Numhelper(88910) = 0  ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -460,0
name = "Firerope"
stateno = 88910
helpertype = normal
ownpal = 1
ID = 88910   ;Numhelper and ID have to be the same

;---------------------------------
;Electric Ropes for Hanzo's World heroes Death Match 2 stage
[State -2, deathmatchfire]
type = Helper
trigger1 = stagevar(info.name) = "Death Match 2"
trigger1 = Numhelper(88920) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Death Match 2"
trigger2 = Numhelper(88920) = 0  ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -460,0
name = "Electricrope"
stateno = 88920
helpertype = normal
ownpal = 1
ID = 88920    ;Numhelper and ID have to be the same

;------------------------------------------
;Spiked Wall for Fumma's World Heroes Death Match 3 stage
[State -2, deathmatchspikes]
type = Helper
trigger1 = stagevar(info.name) = "Death Match 3"
trigger1 = Numhelper(88926) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Death Match 3"
trigger2 = Numhelper(88926) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -500,0
name = "SpikedWall"
stateno = 88926
helpertype = normal
ownpal = 1
ID = 88926   ;Numhelper and ID have to be the same

;----------------------------------------
; Water Splash KoF Garou stage
[State -2, watersplashfall]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "KoF95_Garou"
trigger1 = stateno = 5100 || stateno = 5110
anim = F89059
ID = 7448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = 1
removetime = 17
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplashjump]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "KoF95_Garou"
trigger1 = stateno = 40 || stateno = 52
anim = F89056
ID = 7448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 14
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplashIdle]
type = Explod
trigger1 = NumExplod(77446) = 0
trigger1 = Pos Y = 0
trigger1 = stagevar(info.name) = "KoF95_Garou"
anim = F89228
ID = 77446
pos = 0,-8
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, RemoveWater]
type = RemoveExplod
trigger1 = Pos Y <= -1 
trigger1 = time >=0
id = 77446

;-----------------------------------------------------
; Water Splash for Northern Country Canyon stages
[State -2, watersplash2fall]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "Northern Country Canyon Autumn"
trigger1 = stateno = 5100 || stateno = 5110
trigger2 = time = 1
trigger2 = stagevar(info.name) = "Northern Country Canyon Spring"
trigger2 = stateno = 5100 || stateno = 5110
anim = F89104
ID = 7448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 27
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplash2jump]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "Northern Country Canyon Autumn"
trigger1 = stateno = 40 || stateno = 52
trigger2 = time = 1
trigger2 = stagevar(info.name) = "Northern Country Canyon Spring"
trigger2 = stateno = 40 || stateno = 52
anim = F89103
ID = 7448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 21
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplash2idle]
type = Explod
trigger1 = NumExplod(77446) = 0
trigger1 = Pos Y = 0
trigger1 = stagevar(info.name) = "Northern Country Canyon Autumn"
trigger2 = NumExplod(77446) = 0 
trigger2 = Pos Y = 0
trigger2 = stagevar(info.name) = "Northern Country Canyon Spring" 
anim = F89102
ID = 77446
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 7
ontop = 0
ownpal = 1
removeongethit = 0

;------------------------------------
;  Totem for "Green Hell" Stage Behind/Lower
[State -2, Totem]
type = Helper
trigger1 = stagevar(info.name) = "Green Hell"
trigger1 = Numhelper(889360) = 0  ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Green Hell"
trigger2 = Numhelper(889360) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -190,17
name = "Totem"
stateno = 889360
helpertype = normal
ownpal = 1
ID = 889360   ;Numhelper and ID have to be the same

;  Totem for "Green Hell" Stage Front/Higher
[State -2, Totem]
type = Helper
trigger1 = stagevar(info.name) = "Green Hell"
trigger1 = Numhelper(889365) = 0  ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Green Hell"
trigger2 = Numhelper(889365) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 266,-2
name = "Totem"
stateno = 889365
helpertype = normal
ownpal = 1
ID = 889365   ;Numhelper and ID have to be the same

;--------------------------------
;Howard Arena stuff
[State -2, Andy FF3 stage finisher floor]
type = Helper
trigger1 = stagevar(info.name) = "Howard Arena"
trigger1 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = roundno != 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Howard Arena Storm"
trigger2 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = roundno != 1
trigger2 = TeamMode != Simul
trigger2 = Pos Y = 0
trigger3 = stagevar(info.name) = "Howard Arena Thunder"
trigger3 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger3 = teamside = 1
trigger3 = roundno != 1
trigger3 = TeamMode != Simul
trigger3 = Pos Y = 0
trigger4 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger4 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger4 = teamside = 1
trigger4 = roundno != 1
trigger4 = TeamMode != Simul
trigger4 = Pos Y = 0
trigger5 = stagevar(info.name) = "Howard Arena"
trigger5 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger5 = teamside = 1
trigger5 = roundno != 1
trigger5 = TeamMode = Simul
trigger5 = numpartner = 1 && id<partner,id
trigger5 = Pos Y = 0
trigger6 = stagevar(info.name) = "Howard Arena Storm"
trigger6 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger6 = teamside = 1
trigger6 = roundno != 1
trigger6 = TeamMode = Simul
trigger6 = numpartner = 1 && id<partner,id
trigger6 = Pos Y = 0
trigger7 = stagevar(info.name) = "Howard Arena Thunder"
trigger7 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger7 = teamside = 1
trigger7 = roundno != 1
trigger7 = TeamMode = Simul
trigger7 = numpartner = 1 && id<partner,id
trigger7 = Pos Y = 0
trigger8 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger8 = Numhelper(889323) = 0 ;Numhelper and ID have to be the same
trigger8 = teamside = 1
trigger8 = roundno != 1
trigger8 = TeamMode = Simul
trigger8 = numpartner = 1 && id<partner,id
trigger8 = Pos Y = 0
helpertype = normal ;player
name = "ff3stagefinisher"
ID = 889323       ;Numhelper and ID have to be the same
stateno = 889323
pos = 0,0
postype = left
facing = 1
ownpal = 1
supermove = 999999999
pausemove = 999999999

;-----------------------------------------
; FF subway stuff
[State -2, barrel subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Train"
trigger1 = Numhelper(889120) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Train"
trigger2 = Numhelper(889120) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,17
name = "Barrel 2"
stateno = 889120
helpertype = normal
ownpal = 1
ID = 889120   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;FF subway barrel Energy #1
[State -2, barrel subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Train"
trigger1 = Numhelper(889140) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Train"
trigger2 = Numhelper(889140) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,-3
name = "Barrel 2"
stateno = 889140
helpertype = normal
ownpal = 1
ID = 889140   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;FF subway barrel Energy #2
[State -2, barrel subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Train"
trigger1 = Numhelper(889150) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Train"
trigger2 = Numhelper(889150) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,21
name = "Barrel 2"
stateno = 889150
helpertype = normal
ownpal = 1
ID = 889150   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;-----------------------------------------
;FF Sodom's Back Alley barrel rolling
[State -2, barrel rolling SBA ff]
type = Helper
trigger1 = stagevar(info.name) = "Sodom's Back Alley"
trigger1 = Numhelper(889475) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamSide = 1
trigger1 = RoundNo = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Sodom's Back Alley"
trigger2 = Numhelper(889475) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamSide = 1
trigger2 = RoundNo = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 259,22
name = "BarrelRoll"
stateno = 889475
helpertype = normal
ownpal = 1
ID = 889475   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF Sodom's Back Alley barrel Health
[State -2, barrel SBA ff]
type = Helper
trigger1 = stagevar(info.name) = "Sodom's Back Alley"
trigger1 = Numhelper(889440) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Sodom's Back Alley"
trigger2 = Numhelper(889440) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 96,-19
name = "Barrel6"
stateno = 889440
helpertype = normal
ownpal = 1
ID = 889440   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF Sodom's Back Alley trash can #1
[State -2, trashcan#1 SBA ff]
type = Helper
trigger1 = stagevar(info.name) = "Sodom's Back Alley"
trigger1 = Numhelper(889458) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Sodom's Back Alley"
trigger2 = Numhelper(889458) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 29,-19
name = "SBAtrashcan1"
stateno = 889458
helpertype = normal
ownpal = 1
ID = 889458   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF Sodom's Back Alley trash can #2 empty
[State -2, trashcan#1 subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Sodom's Back Alley"
trigger1 = Numhelper(889467) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Sodom's Back Alley"
trigger2 = Numhelper(889467) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -27,-19
name = "SBAtrashcan1"
stateno = 889467
helpertype = normal
ownpal = 1
ID = 889467   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------------------
;Barrels for SS2 Galford stage
[State -2, GalfordBarrel1]
type = Helper
trigger1 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger1 = Numhelper(889109) = 0  ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger2 = Numhelper(889109) = 0  ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -123,12
name = "GalfordBarrel1"
stateno = 889109
helpertype = normal
ownpal = 1
ID = 889109   ;Numhelper and ID have to be the same

[State -2, GalfordBarrel2]
type = Helper
trigger1 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger1 = Numhelper(889113) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger2 = Numhelper(889113) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 260,12
name = "GalfordBarrel2"
stateno = 889113
helpertype = normal
ownpal = 1
ID = 889113   ;Numhelper and ID have to be the same

;-----------------------------------------------
;Samurai Monger Life & Bomb toss for player 1
[State -2, LifeandBomb]
type = Helper
trigger1 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger1 = (GameTime % 1600) = random%27
trigger1 = time >=1
trigger1 = teamside = 1
trigger1 = Numhelper(889160) = 0 ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger2 = (GameTime % 1600) = random%27
trigger2 = time >=1
trigger2 = teamside = 1
trigger2 = Numhelper(889160) = 0 ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -385,-5
name = "LifeMonger"
stateno = 889160
helpertype = normal
postype = back;p1    ;p2,front,back,left,right
ownpal = 1
ID = 889160

;-----------------------------------------------
;Samurai Monger Life & Bomb toss for player 2
[State -2, LifeandBomb2]
type = Helper
trigger1 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger1 = (GameTime % 1600) = random%27
trigger1 = time >=1
trigger1 = teamside = 2
trigger1 = Numhelper(889170) = 0 ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "SS2_GALFORD_STAGE"
trigger2 = (GameTime % 1600) = random%27
trigger2 = time >=1
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -400,-5
name = "LifeMonger"
stateno = 889170
helpertype = normal
postype = back;p1    ;p2,front,back,left,right
ownpal = 1
ID = 889170

;------------------------
;FF subway station telephone booth Health
[State -2, telephonebooth subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Station - FF"
trigger1 = Numhelper(889180) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Station - FF"
trigger2 = Numhelper(889180) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,14
name = "telephone1"
stateno = 889180
helpertype = normal
ownpal = 1
ID = 889180   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF subway station trash can #1
[State -2, trashcan#1 subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Station - FF"
trigger1 = Numhelper(889195) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Station - FF"
trigger2 = Numhelper(889195) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,-3
name = "telephone1"
stateno = 889195
helpertype = normal
ownpal = 1
ID = 889195   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;FF subway station trash can #2 empty
[State -2, trashcan#1 subway ff]
type = Helper
trigger1 = stagevar(info.name) = "Subway Station - FF"
trigger1 = Numhelper(889205) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Subway Station - FF"
trigger2 = Numhelper(889205) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,16
name = "telephone1"
stateno = 889205
helpertype = normal
ownpal = 1
ID = 889205   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;Ryu Signs
[State -2, Ryu Sign]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) Ryu"
trigger1 = Numhelper(889211) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) Ryu"
trigger2 = Numhelper(889211) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -190,-5
name = "Ryusign"
stateno = 889211
helpertype = normal
ownpal = 1
ID = 889211   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Ryu Sign2]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) Ryu"
trigger1 = Numhelper(889221) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) Ryu"
trigger2 = Numhelper(889221) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 350,-5
name = "Ryusign2"
stateno = 889221
helpertype = normal
ownpal = 1
ID = 889221   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;Guile Crate
[State -2, Guile Crate]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) Guile" 
trigger1 = Numhelper(889240) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) Guile" 
trigger2 = Numhelper(889240) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 360,-3
name = "GuileCrate"
stateno = 889240
helpertype = normal
ownpal = 1
ID = 889240   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;Ken Barrels/Crates
[State -2, Ken Barrels/Crates]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) Ken"
trigger1 = Numhelper(889248) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) Ken"
trigger2 = Numhelper(889248) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 390,20
name = "KenBarrelsCrates"
stateno = 889248
helpertype = normal
ownpal = 1
ID = 889248   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------
;M.Bison Statues
[State -2, M.Bison Statue]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) M.Bison"
trigger1 = Numhelper(889400) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) M.Bison"
trigger2 = Numhelper(889400) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -190,-5
name = "MBisonStatue1"
stateno = 889400
helpertype = normal
ownpal = 1
ID = 889400   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, M.Bison Statue2]
type = Helper
trigger1 = stagevar(info.name) = "(SF2) M.Bison"
trigger1 = Numhelper(889430) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "(SF2) M.Bison"
trigger2 = Numhelper(889430) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 350,-5
name = "MBisonStatue2"
stateno = 889430
helpertype = normal
ownpal = 1
ID = 889430   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------------------------------------------
;^^^^^^^ ELECTR0's IM Code #1 ^^^^^^^^^
;------------------------------------------------------------

;------------------------------------------------------------
;vvvvvv ELECTR0's IM Code #2 vvvvvvvv
;------------------------------------------------------------

;----------------------------------------------
; Belgrave Square Labs Finishers
[State -2, Death Chamber]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889480) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889480) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 69,0
name = "DeathChamber1"
stateno = 889480
helpertype = normal
ownpal = 1
ID = 889480   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Death Chamber2]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889481) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889481) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 69,0
name = "DeathChamber2"
stateno = 889481
helpertype = normal
ownpal = 1
ID = 889481   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Vapor Chamber]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889482) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889482) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -85,0
name = "VaporChamber1"
stateno = 889482
helpertype = normal
ownpal = 1
ID = 889482   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Vapor Chamber2]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889483) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889483) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 228,0
name = "VaporChamber2"
stateno = 889483
helpertype = normal
ownpal = 1
ID = 889483   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Vapor Chamber Camera Marker]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889478) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889478) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 184,0
name = "VaporChamber3"
stateno = 889478
helpertype = normal
ownpal = 1
ID = 889478   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Vapor Chamber Camera Marker2]
type = Helper
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = Numhelper(889479) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 = Numhelper(889479) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -41,0
name = "VaporChamber4"
stateno = 889479
helpertype = normal
ownpal = 1
ID = 889479   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Belgrave Square Labs] ;send opponent to Death Chamber
type = TargetState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889480)
trigger1=abs(Rootdist X-Helper(889480),Rootdist X)=[-60,60]
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger2=numhelper(889481)
trigger2=abs(Rootdist X-Helper(889481),Rootdist X)=[-60,60]
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
value = 889485
persistent = 0

[State -2, Time Warp] ;player 1 go to time warp
type = ChangeState
triggerall = movehit
trigger1=numhelper(889480)
trigger1=abs(Rootdist X-Helper(889480),Rootdist X)=[-60,60]
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger2=numhelper(889481)
trigger2=abs(Rootdist X-Helper(889481),Rootdist X)=[-60,60]
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
value = 889493
ctrl = 0

[State -2, Belgrave Square Labs2] ;send opponent to Vapor Chamber
type = TargetState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889482)
trigger1=abs(Rootdist X-Helper(889482),Rootdist X)=[-50,50]
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger2=numhelper(889483)
trigger2=abs(Rootdist X-Helper(889483),Rootdist X)=[-50,50]
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
value = 889494
persistent = 0

[State -2, Time Warp2] ;player 1 go to Time Warp
type = ChangeState
triggerall = movehit
trigger1=numhelper(889482)
trigger1=abs(Rootdist X-Helper(889482),Rootdist X)=[-50,50]
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger2=numhelper(889483)
trigger2=abs(Rootdist X-Helper(889483),Rootdist X)=[-50,50]
trigger2 = stagevar(info.name) = "Belgrave Square Labs"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
value = 889498
ctrl = 0

[State -2, AssertSpecial]
type = AssertSpecial
trigger1 = 1
trigger1 = stagevar(info.name) = "Belgrave Square Labs"
trigger1 = roundno != 1
flag = nokoslow

;-----------------------------------------------------
;SurfJet
[State -2, SurfJetidle]
type = Explod
trigger1 = NumExplod(77447) = 0
trigger1 = time <= 1
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = 1
anim = F89156
ID = 77447
pos = 0,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = -10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, SurfJetidle]
type = Explod
trigger1 = NumExplod(77447) = 0
trigger1 = time <= 1
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = -1
anim = F89156
ID = 77447
pos = 0,5
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = -10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, JetRemover]
type = RemoveExplod
trigger1 = Pos Y < 0 
trigger1 = time >=0
id = 77447

[State -2, SurfJetJump]
type = Explod
trigger1 = NumExplod(77448) = 0
trigger1 = time <= 1
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = 1
anim = F89157
ID = 77448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, SurfJetJump]
type = Explod
trigger1 = NumExplod(77448) = 0
trigger1 = time <= 1
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = -1
anim = F89157
ID = 77448
pos = 0,-5
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, JetJumpRemover]
type = RemoveExplod
trigger1 = Pos Y = 0 
trigger1 = time >=0
trigger2 = NumExplod(77447) = 1
id = 77448

[State -2, SurfJetSplash]
type = Explod
trigger1 = Pos Y = 0
trigger1 = (GameTime % 10) = 0
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = 1
anim = F89158
ID = 77449
pos = -16,21
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 32
supermove = 99999
pausemove = 99999
scale = 2,2
sprpriority = 10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, SurfJetSplash]
type = Explod
trigger1 = Pos Y = 0
trigger1 = (GameTime % 10) = 0
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = facing = -1
anim = F89158
ID = 77449
pos = 16,21
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = 1
removetime = 32
supermove = 99999
pausemove = 99999
scale = 2,2
sprpriority = 10
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, AiroJetSpawner]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger1 = Numhelper(889500) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Distruction_Surfing"
trigger2 = Numhelper(889500) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -350,0
name = "FarAiroJetSpawn"
stateno = 889500
helpertype = normal
ownpal = 1
ID = 889500   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;-----------------------------------------
;Shin Forest Stuff
[State -2, Shin TimeBox]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889520) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889520) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 1500,0
name = "ShinTimebox1"
stateno = 889520
helpertype = normal
ownpal = 1
ID = 889520   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin TimeBox2]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889525) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889525) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -1205,0
name = "ShinTimebox2"
stateno = 889525
helpertype = normal
ownpal = 1
ID = 889525   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin TimeBox3]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889530) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889530) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 494,0
name = "ShinTimebox3"
stateno = 889530
helpertype = normal
ownpal = 1
ID = 889530   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin Knife]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889535) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889535) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 860,0
name = "ShinKnife1"
stateno = 889535
helpertype = normal
ownpal = 1
ID = 889535   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin Knife2]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889546) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889546) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -550,0
name = "ShinKnife2"
stateno = 889546
helpertype = normal
ownpal = 1
ID = 889546   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin Pow1]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889556) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889556) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -1790,0
name = "ShinPow1"
stateno = 889556
helpertype = normal
ownpal = 1
ID = 889556   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Shin Pow2]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889563) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889563) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 1970,0
name = "ShinPow2"
stateno = 889563
helpertype = normal
ownpal = 1
ID = 889563   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, KnifeTossHelper]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = NumHelper(889542) >= 1
trigger1 = movetype != H
trigger1 = movetype != A
trigger1 = StateType != C
trigger1 = StateType != L
trigger1 = P2BodyDist X > 70
trigger1 = command = "x"
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = NumHelper(889553) >= 1
trigger2 = movetype != H
trigger2 = movetype != A
trigger2 = StateType != C
trigger2 = StateType != L
trigger2 = P2BodyDist X > 70
trigger2 = command = "x"
helpertype = normal ;player
name = "shinknifeToss1"
ID = 889545
stateno = 889545
pos = -5,-75
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999
pausemovetime = 999999
ignorehitpause = 1

[State -2, KnifeTossHelper]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = NumHelper(889542) >= 1
trigger1 = movetype != H
trigger1 = movetype != A
trigger1 = StateType = C
trigger1 = StateType != L
trigger1 = P2BodyDist X > 70
trigger1 = command = "x"
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = NumHelper(889553) >= 1
trigger2 = movetype != H
trigger2 = movetype != A
trigger2 = StateType = C
trigger2 = StateType != L
trigger2 = P2BodyDist X > 70
trigger2 = command = "x"
helpertype = normal ;player
name = "shinknifeToss1Low"
ID = 889555
stateno = 889555
pos = -5,-40
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 999999
pausemovetime = 999999
ignorehitpause = 1

[State -2, ShinHatGuy]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = (GameTime % 600) = random%27
trigger1 = teamside = 2
trigger1 = Numhelper(889571) = 0 ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = (GameTime % 600) = random%27
trigger2 = teamside = 2
trigger2 = Numhelper(889571) = 0 ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -800,0
postype = p1
name = "ShinHatGuy"
stateno = 889571 + random%2
helpertype = normal
ownpal = 1
ID = 889571

[State -2, ShinGirl]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = (GameTime % 1300) = random%27
trigger1 = teamside = 2
trigger1 = Numhelper(889582) = 0 ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = (GameTime % 1300) = random%27
trigger2 = teamside = 2
trigger2 = Numhelper(889582) = 0 ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
Pos = 0,-450
postype = p1 ;left
name = "ShinGirl"
stateno = 889582 + random%2
helpertype = normal
ownpal = 1
ID = 889582

[State -2, ShinNinjaSpawner]
type = Helper
trigger1 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger1 = Numhelper(889600) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Shinobi_Zeed_Ressurection_Forest"
trigger2 = Numhelper(889600) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 0,0
name = "ShinNinjaSpawner"
stateno = 889600
helpertype = normal
ownpal = 1
ID = 889600   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;------------------------------------------------
;Sheeps
[State -2, Sheep]
type = Helper
trigger1 = stagevar(info.name) = "Mareep"
trigger1 = Numhelper(889632) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = Pos Y = 0
;trigger1 = TeamMode != simul
Pos = 0,0
name = "sheep"
stateno = 889632
helpertype = normal
ownpal = 1
ID = 889632   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;-----------------------------------------
;Pit 1 Fatality
[State -2, Pit1Fatality] ;send opponent to Death Chamber
type = TargetState
triggerall = movehit
trigger1 = stagevar(info.name) = "The Pit"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger1 = StateType != A
trigger2 = stagevar(info.name) = "SF1 China"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
trigger2 = StateType != A
trigger3 = stagevar(info.name) = "The Pit I"
trigger3 =p2life=0
trigger3=MatchOver
trigger3=P2Dist Y =0
trigger3 = StateType != A
value = 889660
persistent = 0

[State -2, Pit1Fatality] ;player 1 go to time warp
type = ChangeState
triggerall = movehit
trigger1 = stagevar(info.name) = "The Pit"
trigger1 =p2life=0
trigger1=MatchOver
trigger1=P2Dist Y =0
trigger1 = StateType != A
trigger2 = stagevar(info.name) = "SF1 China"
trigger2 =p2life=0
trigger2=MatchOver
trigger2=P2Dist Y =0
trigger2 = StateType != A
trigger3 = stagevar(info.name) = "The Pit I"
trigger3 =p2life=0
trigger3=MatchOver
trigger3=P2Dist Y =0
trigger3 = StateType != A
value = 889658
ctrl = 0

[State -2, Pit1nokoslow]
type = assertspecial
trigger1 = roundno != 1
trigger1 = stagevar(info.name) = "The Pit"
trigger2 = roundno != 1
trigger2 = stagevar(info.name) = "SF1 China"
trigger3 = roundno != 1
trigger3 = stagevar(info.name) = "The Pit I"
flag = nokoslow
flag2 = nokosnd

;----------------------------------------------
;Real Bout Fatal Fury Subway 3
[State -2, RBFFTrain1]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 = Numhelper(889665) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 = Numhelper(889665) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -446,21
name = "RBFFTrain1"
stateno = 889665
helpertype = normal
ownpal = 1
ID = 889665   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, RBFFTrain2] ;Position marker player 1
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 = Numhelper(889671) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 = Numhelper(889671) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 648,0
name = "RBFFTrainMarker1"
stateno = 889671
helpertype = normal
ownpal = 1
ID = 889671   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, RBFFTrain2] ;Position marker player 2
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 = Numhelper(889676) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 = Numhelper(889676) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -508,0
name = "RBFFTrainMarker2"
stateno = 889676
helpertype = normal
ownpal = 1
ID = 889676   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, RBFFSubway3Finisher] ;send opponent to train death
type = TargetState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889671)
trigger1=abs(Rootdist X-Helper(889671),Rootdist X)=[1,300]
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 =p2life=0
trigger1=MatchOver
trigger2=numhelper(889676)
trigger2=abs(Rootdist X-Helper(889676),Rootdist X)=[1,300]
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 =p2life=0
trigger2=MatchOver
value = 889672
persistent = 0
ignorehitpause = 1

[State -2, RBFFSubway3Finisher] ;player walk away from train path
type = ChangeState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889671)
trigger1=abs(Rootdist X-Helper(889671),Rootdist X)=[1,300]
trigger1 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger1 =p2life=0
trigger1=MatchOver
trigger2=numhelper(889676)
trigger2=abs(Rootdist X-Helper(889676),Rootdist X)=[1,300]
trigger2 = stagevar(info.name) = "Ultimate_RBFF_Subway_3"
trigger2 =p2life=0
trigger2=MatchOver
value = 889675
ctrl = 0
ignorehitpause = 1

;------------------------
; FF West Side barrel Health
[State -2, barrel1 WestSide Health]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889440) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 602,-15
name = "Barrel1"
stateno = 889440
helpertype = normal
ownpal = 1
ID = 889440   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, barrel2 WestSide Energy]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889680) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 545,-15
name = "Barrel2"
stateno = 889680
helpertype = normal
ownpal = 1
ID = 889680   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Trashcan WestSide Energy]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889690) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 1267,-14
name = "trashcanWSEnergy"
stateno = 889690
helpertype = normal
ownpal = 1
ID = 889690   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Trashcan WestSide Empty]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889700) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 1315,-14
name = "trashcanWSEmpty"
stateno = 889700
helpertype = normal
ownpal = 1
ID = 889700   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Trashcan2 WestSide Empty]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889706) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 330,23
name = "trashcan2WSEmpty"
stateno = 889706
helpertype = normal
ownpal = 1
ID = 889706   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Wall 1 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889712) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -255,0
name = "Wall1"
stateno = 889712
helpertype = normal
ownpal = 1
ID = 889712  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Wall 2 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889713) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 208,0
name = "Wall2"
stateno = 889713
helpertype = normal
ownpal = 1
ID = 889713  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Wall 3 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889714) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 943,0
name = "Wall3"
stateno = 889714
helpertype = normal
ownpal = 1
ID = 889714  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Door 1 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889715) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889715) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0 
Pos = -255,0
name = "WSDoor1"
stateno = 889715
helpertype = normal
ownpal = 1
ID = 889715  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Door 2 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889717) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889717) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id 
trigger2 = Pos Y = 0
Pos = 208,0
name = "WSDoor2"
stateno = 889717
helpertype = normal
ownpal = 1
ID = 889717  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Door 3 WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 943,0
name = "WSDoor3"
stateno = 889719
helpertype = normal
ownpal = 1
ID = 889719  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Edi E WestSide]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889724) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -1000,0
name = "WSEdiE"
stateno = 889724
helpertype = normal
ownpal = 1
ID = 889724  ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Surf Sign1]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889743) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -970,-9
name = "Surfsign1"
stateno = 889743
helpertype = normal
ownpal = 1
ID = 889743   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, Surf Sign2]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger1 = Numhelper(889749) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_FF_Westside"
trigger2 = Numhelper(889719) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 662,-7
name = "Surfsign2"
stateno = 889749
helpertype = normal
ownpal = 1
ID = 889749   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;-----------------------------------------------------
; Water Splash for YDA_Forest-of_Desolation stage by Yoda & Elk
[State -2, Desolationplash2fall]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "YDA_Forest-of_Desolation"
trigger1 = stateno = 5100 || stateno = 5110
anim = F89226
ID = 7448
pos = 0,-12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 27
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 52
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, Desolationplash2jump]
type = Explod
trigger1 = time = 1
trigger1 = stagevar(info.name) = "YDA_Forest-of_Desolation"
trigger1 = stateno = 40 || stateno = 52
anim = F89225
ID = 7448
pos = 0,-12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = 21
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 52
ontop = 0
ownpal = 1
removeongethit = 0

[State -2, watersplash2idle]
type = Explod
trigger1 = NumExplod(77446) = 0
trigger1 = Pos Y = 0
trigger1 = stagevar(info.name) = "YDA_Forest-of_Desolation"
anim = F89224
ID = 77446
pos = 0,-12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
supermove = 99999
pausemove = 99999
scale = 1,1
sprpriority = 51
ontop = 0
ownpal = 1
removeongethit = 0

;--------------------------------------
;Train Floor for Vagnad Stage
[State -2, Vagnad Stage finisher floor]
type = Helper
trigger1 = stagevar(info.name) = "Vagnad Stage"
trigger1 = Numhelper(889315) = 0 ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Vagnad Stage"
trigger2 = Numhelper(889315) = 0 ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
helpertype = normal ;player
name = "Vagnadstagefinisher"
ID = 889315       ;Numhelper and ID have to be the same
stateno = 889315
pos = 0,0
postype = left
facing = 1
ownpal = 1
supermove = 999999999
pausemove = 999999999

;--------------------------------------------
;Railing for Capcom Building Stage
[State -2, Capcom Builing Stage finisher Railing]
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_Capcom_Building"
trigger1 = Numhelper(889758) = 0 ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = roundno != 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_Capcom_Building"
trigger2 = Numhelper(889758) = 0 ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = roundno != 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
helpertype = normal ;player
name = "CBRailstagefinisher"
ID = 889758       ;Numhelper and ID have to be the same
stateno = 889758
pos = 0,0
postype = left
facing = 1
;keyctrl = 0
ownpal = 1
supermove = 999999999
pausemove = 999999999

;------------------------------------------
;Spiked Wall for Death Match Needle stage
[State -2, deathmatchspikes]
type = Helper
trigger1 = stagevar(info.name) = "DEATH MATCH NEEDLE"
trigger1 = Numhelper(889759) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "DEATH MATCH NEEDLE"
trigger2 = Numhelper(889759) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -500,0
name = "SpikedWall"
stateno = 889759
helpertype = normal
ownpal = 1
ID = 889759   ;Numhelper and ID have to be the same

;--------------------------------------------------
;USSR stage finisher stuff
[State -2, USSRstagefinisher] ;Position marker player 1
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_USSR" 
trigger1 = Numhelper(889761) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_USSR" 
trigger2 = Numhelper(889761) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 70,0
name = "USSRMarker1"
stateno = 889761
helpertype = normal
ownpal = 1
ID = 889761   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, USSRstagefinisher] ;Position marker player 2
type = Helper
trigger1 = stagevar(info.name) = "Ultimate_USSR" 
trigger1 = Numhelper(889762) = 0   ;Numhelper and ID have to be the same
trigger1 = teamside = 2
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Ultimate_USSR" 
trigger2 = Numhelper(889762) = 0   ;Numhelper and ID have to be the same
trigger2 = teamside = 2
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 70,0
name = "USSRMarker2"
stateno = 889762
helpertype = normal
ownpal = 1
ID = 889762   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

[State -2, RSSRFinisherReact] ;send opponent to train death
type = TargetState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889761)
trigger1=abs(Rootdist X-Helper(889761),Rootdist X)=[-100,100]
trigger1 = stagevar(info.name) = "Ultimate_USSR" 
trigger1 =p2life=0
trigger1=MatchOver
trigger2=numhelper(889762)
trigger2=abs(Rootdist X-Helper(889762),Rootdist X)=[-100,100]
trigger2 = stagevar(info.name) = "Ultimate_USSR" 
trigger2 =p2life=0
trigger2=MatchOver
value = 889763
persistent = 0
ignorehitpause = 1

[State -2, USSR3Finisher] ;player walk away from train path
type = ChangeState
triggerall = movehit
triggerall = stateno = [200,499]
trigger1=numhelper(889761)
trigger1=abs(Rootdist X-Helper(889761),Rootdist X)=[-100,100]
trigger1 = stagevar(info.name) = "Ultimate_USSR" 
trigger1 =p2life=0
trigger1=MatchOver
trigger2=numhelper(889762)
trigger2=abs(Rootdist X-Helper(889762),Rootdist X)=[-100,100]
trigger2 = stagevar(info.name) = "Ultimate_USSR" 
trigger2 =p2life=0
trigger2=MatchOver
value = 889769
ctrl = 0
ignorehitpause = 1

;---------------------------------
;Electric Ropes for Axel's Fatal Fury 2 stage
[State -2, ElectricRing]
type = Helper
trigger1 = stagevar(info.name) = "Axel Hawk FFS Night"
trigger1 = Numhelper(889770) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Axel Hawk FFS Night"
trigger2 = Numhelper(889770) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -460,0
name = "Electricrope2"
stateno = 889770
helpertype = normal
ownpal = 1
ID = 889770    ;Numhelper and ID have to be the same

;---------------------------------
;Explode Ropes for Neo Deo World Heroes Death Match stage
[State -2, deathmatchfire]
type = Helper
trigger1 = stagevar(info.name) = "DIO DEATH MATCH"
trigger1 = Numhelper(889772) = 0  ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "DIO DEATH MATCH"
trigger2 = Numhelper(889772) = 0  ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = -460,0
name = "Firerope"
stateno = 889772
helpertype = normal
ownpal = 1
ID = 889772  ;Numhelper and ID have to be the same

;------------------------
;Andy Barrel
[State -2, Andy Barrel]
type = Helper
trigger1 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger1 = Numhelper(889240) = 0   ;Numhelper and ID have to be the same
trigger1 = TeamMode != Simul
trigger1 = Pos Y = 0
trigger2 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger2 = Numhelper(889240) = 0   ;Numhelper and ID have to be the same
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
trigger2 = Pos Y = 0
Pos = 350,-3
name = "AndyBarrel"
stateno = 889240
helpertype = normal
ownpal = 1
ID = 889240   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;----------------------------------------------
;VFGowcaizer Fire Flair
[State -2, VFGowcaizer Fire Flair]
type = Helper
trigger1 = stagevar(info.name) = "VFGowcaizer Stage"
trigger1 = Numhelper(889780) = 0 
trigger1 = teamside = 1
trigger1 = TeamMode != Simul
trigger2 = stagevar(info.name) = "VFGowcaizer Stage"
trigger1 = Numhelper(889780) = 0 
trigger2 = teamside = 1
trigger2 = TeamMode = Simul
trigger2 = numpartner = 1 && id<partner,id
Pos = 52,15
name = "FireFlair"
stateno = 889780
helpertype = normal
ownpal = 1
ID = 889780   ;Numhelper and ID have to be the same
size.xscale = 1.0
size.yscale = 1.0

;----------------------------------------
;VVVVVV stage finishers VVVVVV
;----------------------------------------
[State -2, Stage Finisher Andy FF3]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "Howard Arena"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889320
trigger2 = stagevar(info.name) = "Howard Arena Storm"
trigger2 =p2life=0
trigger2=MatchOver
trigger2 = P2stateno !=889320
trigger3 = stagevar(info.name) = "Howard Arena Thunder"
trigger3 =p2life=0
trigger3=MatchOver
trigger3 = P2stateno !=889320
trigger4 = stagevar(info.name) = "VFGowcaizer Stage"
trigger4 =p2life=0
trigger4=MatchOver
trigger4 = P2stateno !=889320
value = 889320
ignorehitpause = 1
persistent = 0

[State -2, Stage Finisher Green Hell]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "Green Hell"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889370
trigger2 = stagevar(info.name) = "Andy's FFS stage(day)"
trigger2 =p2life=0
trigger2=MatchOver
trigger2 = P2stateno !=889370
value = 889370
ignorehitpause = 1
persistent = 0

[State -2, Stage Finisher Deadpool MK]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "The Dead Pool"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889629
value = 889629
ignorehitpause = 1
persistent = 0

[State -2, Stage Finisher Vagnad]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "Vagnad Stage"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889310
value = 889310
ignorehitpause = 1
persistent = 0

[State -2, Stage Finisher Capcom Building]
type = TargetState
triggerall = movehit
triggerall = stateno = [200,699] 
trigger1 = stagevar(info.name) = "Ultimate_Capcom_Building"
trigger1 =p2life=0
trigger1=MatchOver
trigger1 = P2stateno !=889755
value = 889755
ignorehitpause = 1
persistent = 0

;--------------------------------------
;Remove Explod from Slam Masters Intros
[State -2, RemoveExplod]
type = RemoveExplod
trigger1 = stateno = 0
trigger1 = stagevar(info.name) = "Slam Masters LA" || stagevar(info.name) = "Slam Masters LA Ringout"
ID = 889775
ignorehitpause = 1


;---------------------------------------
;^^^^^^ stage finishers^^^^^^
;---------------------------------------

;-------------------------------------------------------------
;^^^^^^^ ELECTR0's IM Code ^^^^^^^^
;-------------------------------------------------------------
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
trigger1 = StateNo != 1000
trigger1 = StateNo != 1010
trigger1 = StateNo != 1030
trigger1 = StateNo != 1040
trigger1 = StateNo != 1500
trigger1 = StateNo != 1530
trigger2 = StateNo != 1000 && Time = 8
trigger3 = StateNo != 1010 && AnimElemTime(4) < 0
trigger4 = StateNo != 1030 && Time = 8
trigger5 = StateNo != 1040 && AnimElemTime(4) < 0
trigger6 = StateNo != 1500 && AnimElemTime(6) < 0
trigger7 = StateNo != 1530 && AnimElemTime(6) < 0
var(18) = 0

[State -3, Projectile Flag Off]
type = VarSet
trigger1 = !NumHelper(1005)
trigger1 = !NumHelper(1015)
trigger1 = !NumHelper(1045)
trigger1 = !NumHelper(1505)
trigger1 = !NumHelper(1535)
var(39) = 0
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
ignorehitpause = 1

[State -3, Command Cancel Check]
type = varset
triggerAll = !var(20)
trigger1 = StateNo = 200 && MoveContact
trigger2 = StateNo = 220 && MoveContact && MoveContact = [1,8]
trigger3 = StateNo = 225 && MoveContact && MoveContact = [1,8]
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 245 && MoveContact && MoveContact = [1,8]
trigger6 = StateNo = 400 && MoveContact
trigger7 = StateNo = 420 && MoveContact && MoveContact = [1,8]
trigger8 = StateNo = 430 && MoveContact
trigger9 = StateNo = 450 && MoveContact && MoveContact = [1,8]
var(5) = 1
ignorehitpause = 1

[State -3, Special Cancel Reset]
type = VarSet
trigger1 = 1
var(6) = 0
ignoreHitPause = 1

[State -3, Special Cancel Check]
type = VarSet
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 2
trigger4 = StateNo = 200 && MoveContact
trigger5 = StateNo = 219 && MoveContact && MoveContact = [1,8]
trigger6 = StateNo = 220 && MoveContact && MoveContact = [1,8]
trigger7 = StateNo = 225 && MoveContact && MoveContact = [1,8]
trigger8 = StateNo = 230 && MoveContact
trigger9 = StateNo = 245 && MoveContact && MoveContact = [1,8]
trigger10 = StateNo = 248 && MoveContact && MoveContact = [1,8]
trigger11 = StateNo = 249 && MoveContact && MoveContact = [1,8]
trigger12 = StateNo = 400 && MoveContact
trigger13 = StateNo = 420 && MoveContact && MoveContact = [1,8]
trigger14 = StateNo = 430 && MoveContact
trigger15 = StateNo = 450 && MoveContact && MoveContact = [1,8]
trigger16 = StateNo = 458 && MoveContact && MoveContact = [1,8]
trigger17 = StateNo = 459 && MoveContact && MoveContact = [1,8]
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
trigger4 = StateNo = 200 && MoveContact
trigger5 = StateNo = 219 && MoveContact && MoveContact = [1,8]
trigger6 = StateNo = 220 && MoveContact && MoveContact = [1,8]
trigger7 = StateNo = 225 && MoveContact && MoveContact = [1,8]
trigger8 = StateNo = 230 && MoveContact
trigger9 = StateNo = 245 && MoveContact && MoveContact = [1,8]
trigger10 = StateNo = 248 && MoveContact && MoveContact = [1,8]
trigger11 = StateNo = 249 && MoveContact && MoveContact = [1,8]
trigger12 = StateNo = 400 && MoveContact
trigger13 = StateNo = 420 && MoveContact && MoveContact = [1,8]
trigger14 = StateNo = 430 && MoveContact
trigger15 = StateNo = 450 && MoveContact && MoveContact = [1,8]
trigger16 = StateNo = 458 && MoveContact && MoveContact = [1,8]
trigger17 = StateNo = 459 && MoveContact && MoveContact = [1,8]
trigger18 = StateNo = 1100 && MoveContact && AnimElemTime(5) < 0
trigger29 = StateNo = 1130 && MoveContact && AnimElemTime(15) < 0
trigger20 = StateNo = 1200 && MoveContact && AnimElemTime(7) < 0
trigger21 = StateNo = 1230 && MoveContact && AnimElemTime(7) < 0
trigger22 = StateNo = 1250 && MoveContact && AnimElemTime(8) < 0
trigger23 = StateNo = 1280 && MoveContact && AnimElemTime(8) < 0
trigger24 = StateNo = 1300 && MoveContact && AnimElemTime(6) < 0
trigger25 = StateNo = 1330 && MoveContact && AnimElemTime(6) < 0
var(7) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = 1
var(8) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = StateNo = 3110 && AnimElemTime(74) < 0 && MoveContact
var(8) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Flag Reset]
type = VarSet
trigger1 = var(22)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(22) = 0
ignoreHitPause = 1

[State -3, Alternate Hit Detect Reset]
type = VarSet
triggerAll = var(12)
trigger1 = !NumTarget(1005) && P2MoveType != H
trigger2 = !NumTarget(1020) && P2MoveType != H
trigger3 = !NumTarget(1050) && P2MoveType != H
trigger4 = !NumTarget(1051) && P2MoveType != H
var(12) = 0

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
triggerAll = MoveType != H
trigger1 = MoveContact = 1 && NumTarget
fvar(5) = Target, GetHitVar(xVel)
ignoreHitPause = 1

[State -3, Corner Push]
type = PosAdd
triggerAll = fvar(5) && StateNo != [1202,1232]
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
trigger1 = (StateNo = 3000) && Time = 43
trigger2 = (StateNo = 3100) && Time = 43
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
trigger1 = (StateNo = 3050) && Time = 43
trigger2 = (StateNo = 3150) && Time = 43
trigger3 = (StateNo = 3200) && Time = 1
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
trigger2 = StateNo = 810 && (AnimElemTime(12) = [0, 1])
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
trigger3 = (StateNo = [3100,3199])
trigger3 = var(23) := 3100
trigger4 = (StateNo = [3200,3299])
trigger4 = var(23) := 3200
trigger5 = (StateNo = [3300,3399])
trigger5 = var(23) := 3300
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


