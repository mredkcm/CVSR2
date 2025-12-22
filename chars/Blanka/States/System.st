; ADD004 BASIC PIEs ReBuilded CNS (08/04/2018)
;==
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==

; _________________________________________
;| Blanka by varo_hades                    |
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
trigger1 = (AnimElem = 1 || AnimElem = 3 || AnimElem = 6)
value = 100, ifElse((AnimElem = 1 || AnimElem = 6), 0, 1)

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
x = 0.98

[State 105, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.65

[State 105, End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = pos y > -vel y
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
trigger1 = !Time
value = 110,0

[State 110, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
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
triggerAll = AnimElemTime(3) < 0
trigger1 = !AILevel && command != "holdfwd"
sysvar(1) = 0

[State 110, ChangeState to Running]
type = ChangeState
trigger1 = AnimElemTime(3) = 0 && sysvar(1)
value = 100

[State 110, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 7.8
y = -3

[State 110, VelMul]
type = VelMul
trigger1 = AnimElemTime(3) > 0
x = 0.98

[State 110, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = 0.65

[State 110, End]
type = ChangeState
trigger1 = AnimElemTime(3) >= 0
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
pos = ceil(16 * const(size.xScale)),0
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
value = 700,0
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
value = ifElse((command = "x" || command = "y" || command = "z"), 220, 250)

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
trigger1 = !Time
value = 700, 1
channel = 0

[State 710, Roll Sound]
type = PlaySnd
trigger1 = Time = 1
value = 110,0
channel = 1

[State 710, Start Roll]
type = VelSet
trigger1 = AnimElem = 2
x = 6.45

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
trigger1 = !Time
value = 700, 1
channel = 0

[State 715, Roll Sound]
type = PlaySnd
trigger1 = Time = 1
value = 110,0
channel = 1

[State 715, Start Roll]
type = VelSet
trigger1 = AnimElem = 2
x = -6.45

[State 715, End Roll]
type = VelSet
trigger1 = AnimElem = 7
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
trigger1 = !Time
value = 730,1
channel = 0

[State 730, Character Flash]
type = PalFX
trigger1 = 1
time = 1
add = 75 + ceil(sin(Time / 6.0 * pi) * 75),25 + ceil(sin(Time / 6.0 * pi) * 25),0

[State 730, Power Charge Helper]
type = Helper
trigger1 = !NumHelper(8330)
helperType = Normal
stateNo = 8330
ID = 8330
name = "Power Charge"
posType = P1
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

[State 730, Full Power Voice]
type = PlaySnd
trigger1 = !Time && Power >= const(data.power)
value = 190,0
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
value = 4,4
channel = 0

[State 750, Zero Counter FX Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8350
ID = 8350
name = "Zero Counter"
posType = P1
pos = ceil(-20 * const(size.xScale)), ceil(-57 * const(size.yScale))
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
value = 4,2
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
pos = ceil(39 * const(size.xscale)), ceil(-53 * const(size.yscale))
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
value = 4,2
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
pos = ceil(32 * const(size.xscale)), ceil(-26 * const(size.yscale))
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
value = 4,2
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
pos = ceil(38 * const(size.xscale)), ceil(-66 * const(size.yscale))
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
value = 900,1
channel = 0

[State 900, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo FX"
posType = P1
pos = ceil(-8 * const(size.xscale)), ceil(-60 * const(size.yscale))
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
trigger1 = Time = 4
value = 900,1
channel = 0

[State 905, Custom Combo FX Helper]
type = Helper
trigger1 = Time = 4
helperType = Normal
stateNo = 8400
ID = 8400
name = "Custom Combo Startup"
posType = P1
pos = ceil(10 * const(size.xscale)), ceil(-81 * const(size.yscale))
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
value = 4,1
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
value = 4,1
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
pos = ceil(8 * const(size.xscale)), ceil(-65 * const(size.yscale))
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
anim = 5500
velSet = 0,0
ctrl = 0

[State 5500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5500



;====<INITIALIZE>====
[StateDef 5900]
type = S

[state 5900, 3] ;Change palette
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,palno

;[State 5900, Intro vs Charlie/Leona]
;type = ChangeState
;triggerAll = NumEnemy
;triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
;trigger1 = Enemy, Name = "Charlie" || Enemy, Name = "cvsnash" || (Enemy, Name = "Nash" && Enemy, AuthorName != "Phantom.of.the.Server")
;trigger2 = Enemy, Name = "Nash" && Enemy, AuthorName = "Phantom.of.the.Server" && Enemy, var(1) != 1
;trigger3 = Enemy, Name = "Leona" || Enemy, Name = "Leona Heidern"
;value = 192

;[State 5900, Intro vs Rugal Bernstein]
;type = ChangeState
;triggerAll = NumEnemy
;triggerAll = RoundNo = 1 || (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
;trigger1 = Enemy, Name = "cvsrugal" && Enemy, PalNo < 7
;trigger2 = Enemy, Name = "cvsrugal_normal"
;value = 193

;[State 5900, vs Intro vs Bison Bison]
;type = ChangeState
;triggerAll = NumEnemy
;triggerAll = RoundNo = 1 && (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
;trigger1 = Enemy, AuthorName = "Coelasquid and PotS" && Enemy, Name = "Bison Bison"
;value = 194

;[State 5900, vs Intro vs Master Ken]
;type = ChangeState
;triggerAll = NumEnemy
;triggerAll = RoundNo = 1 && (!(Enemy, RoundsExisted) && !(TeamMode = Simul) && !(Enemy, TeamMode = Simul))
;triggerAll = Enemy, AuthorName = "Phantom.of.the.Server&Jmorphman" && Enemy, Name = "Ken Masters"
;trigger1 = Enemy, var(40) = 2
;value = 196

[State 5900, Turns Intro]
type = ChangeState
trigger1 = TeamMode = Turns
trigger1 = !RoundsExisted && RoundNo >= 2
value = 6900

[State 5900, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1
value = 190 + (Random % 4)

[State 5900, End]
type = ChangeState
trigger1 = 1
value = 0

;====<INTRO 1>====
[StateDef 190]
type = S
movetype = I
physics = S
ctrl =0
velset = 0,0
anim = 190

[State 190, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190,Intro]
type = PlaySnd
trigger1 = AnimElem=2
value = 190,0
channel = 1

[State 190, Landing Dust Explod]
type = Explod
trigger1 = AnimElem=9
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 190, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====<INTRO 2>====
[StateDef 191]
type = S
ctrl = 0
anim = 191
velset = 0,0

[State 191, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, PlaySnd]
type = PlaySnd
trigger1 = AnimElemTime(2)>= 5
value = 191,0
volume = 255
persistent = 0

[State 191, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====<INTRO 3>====
[StateDef 192]
type = S
ctrl = 0
anim = 197
velset = 0,0

[State 192, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192,Helper]
type = Helper
trigger1 = Time = 0
helpertype = Normal
name = "Blanka2"
ID = 196
pos = -62, -70
postype = back
stateno = 196
keyctrl = 0
ownpal = 1

[State 192,Helper]
type = Helper
trigger1 = Time = 118
helpertype = Normal
name = "Fruit"
ID = 5287
pos = 10, -81
postype = back
stateno = 5287
keyctrl = 0
ownpal = 1

[State 192,Helper]
type = Helper
trigger1 = Time = 118
helpertype = Normal
name = "Fruit"
ID = 5288
pos = 10, -107
postype = back
stateno = 5287
keyctrl = 0
ownpal = 1

[State 192, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S52,0
volume = 175

[State 192,Helper]
type = Helper
trigger1 = Time = 118
helpertype = Normal
name = "Fruit"
ID = 5289
pos = 10, -115
postype = back
stateno = 5287
keyctrl = 0
ownpal = 1

[State 192,Helper]
type = Helper
trigger1 = Time = 0
helpertype = Normal
name = "Truck1"
ID = 5285
pos = 0, 0
postype = back
stateno = 5285
keyctrl = 0
ownpal = 1

[State 192,Helper]
type = Helper
trigger1 = Time = 0
helpertype = Normal
name = "Truck2"
ID = 5286
pos = 0, 0
postype = back
stateno = 5286
keyctrl = 0
ownpal = 1

[State 192, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====<INTRO 4>====
[Statedef 193]
type = S
ctrl = 0
anim = 199
velset = 0,0

[State 193, 2]
type = PlaySnd
trigger1 = Time = 15
value = S3300, 0

[State 193,4]
type = AssertSpecial
trigger1 = Time = [0,120]
flag = Intro

[State 193, EnvShake]
type = EnvShake
trigger1 = Time = 30
time = 28
freq = 90
ampl = -7

[State 193,Helper]
type = Helper
trigger1 = Time = 15
helpertype = Normal
name = "Blanka2"
ID = 4510
pos = -10, -200
postype = back
stateno = 4510
keyctrl = 0
ownpal = 1

[State 193,Helper]
type = Helper
trigger1 = Time >= 30 & Time <= 50
trigger1 = Random < 200
helpertype = Normal
name = "Watermelon"
ID = 7650
pos = (10+random%140), -250
postype = back
stateno = 7650
keyctrl = 0
ownpal = 1

[State 193,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;====<INTRO Watermelons 1>====
[Statedef 4510]
type = A
movetype = I
physics = N
anim = 4510
velset = 9,6
ctrl = 0

[State 4510,VelAdd]
type = Veladd
trigger1 = 1
y = .75

[State 4510,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 4520

;====<INTRO Watermelons 2>====
[Statedef 4520]
type = S
movetype= I
physics = N
anim = 4520
velset = 0,0
ctrl = 0

[State 4520, 2]
type = PlaySnd
trigger1 = Time = 0
value = 2, 6

[State 4520,Posset]
type = Posset
trigger1 = Time = 0
y = 0

[State 4520,VelAdd]
type = Veladd
trigger1 =  ParentDist X > 0
x = .25

[State 4520,VelAdd]
type = Veladd
trigger1 = Time > 1
y = .5

[State 4520,VelSet]
type = VelSet
trigger1 = Time = 1
x = -2
y = -9

[State 4520,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 4530

;====<INTRO Watermelons 3>====
[Statedef 4530]
type = S
movetype= I
physics = N
anim = 4520
velset = 3.5,0
ctrl = 0

[State 4530,Posset]
type = Posset
trigger1 = Time = 0
y = 0

[State 4530,DestroySelf]
type = DestroySelf
trigger1 =  ParentDist X <= 0

;====<INTRO Watermelons 4>====
[Statedef 7650]
type = A
movetype = I
physics = N
anim = 3450
velset = 0,3
sprpriority = 2

[State 7650,VelAdd]
type = VelAdd
trigger1 = 1
y = .4

[State 7650,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 7651

;====<INTRO Watermelons 5>====
[Statedef 7651]
type = S
movetype = I
physics = N
anim = 3452
velset = 0,-6
sprpriority = 2

[State 7651,VelAdd]
type = VelAdd
trigger1 = Time >= 0
y = .3

[State 7651,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 7652

;====<INTRO Watermelons 6>====
[Statedef 7652]
type = S
movetype = I
physics = N
anim = 3452
velset = 0,-4
sprpriority = 2

[State 7652,VelAdd]
type = VelAdd
trigger1 = Time >= 0
y = .3

[State 7652,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 7653

;====<INTRO Watermelons 7>====
[Statedef 7653]
type = S
movetype = I
physics = N
anim = 3452
velset = 0,-2
sprpriority = 2

[State 7653,VelAdd]
type = VelAdd
trigger1 = Time >= 0
y = .3

[State 7653,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 7602

;====<INTRO Watermelons 8>====
[Statedef 7602]
type = S
movetype = I
physics = N
velset = 0, 0

[State 7602,DestroySelf]
type = DestroySelf
trigger1 = Time = 0

;====<INTRO VS BISON BISON>====
[StateDef 194]
type = S
physics = S
anim = 194
ctrl = 0

[State 194, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 194, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 194,0
channel = 0

[State 194, Fire Pillar]
type = Explod
trigger1 = AnimElem = 4
anim = 10194
sprPriority = -1
posType = P1
pos = ceil(16 * const(size.xScale)),0
scale = 0.5, 0.5
ownPal = 1
removeOnGetHit = 1
ignoreHitPause = 0

[State 194, End]
type = ChangeState
trigger1 = !Animtime
value = 0

;====<INTRO Roll>====
[StateDef 196]
type = A
movetype = I
physics = N
anim = 198
velset = 0,0
ctrl = 0

[State 196,VelAdd]
type = Veladd
triggerall = Time >= 106
trigger1 = ScreenPos X >= 0 && facing = 1
trigger2 = ScreenPos X <= 320 && facing = -1
y = .37

[State 196,VelAdd]
type = VelSet
trigger1 = Time = 106
x = 4.7

[State 196,DestroySelf]
type = DestroySelf
trigger1 = Time = 140

;====<INTRO Truck 1>====
[Statedef 5285]
type = A
movetype = I
physics = N
anim = 192
velset = 0,0
ctrl = 0
sprpriority = -2

[State 5285,VelAdd]
type = VelSet
trigger1 = Time >= 13 && Time < 108
x = -.5

[State 5285,VelAdd]
type = VelSet
trigger1 = Time >= 108
x = -1.5

[State 5285, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2 || animelem = 6 || animelem = 10
value = 192,0
volume = 200

[State 5285, PlaySnd]
type = PlaySnd
trigger1 = animelem = 14 || animelem = 21 || animelem = 27
value = 192, 1
volume = 200

[State 5285, PlaySnd]
type = PlaySnd
trigger1 = animelem = 35
value = 192,2
volume = 200

[State 5285, PlaySnd]
type = PlaySnd
trigger1 = animelem = 36
value = S900,1
volume = 200

[State 5285, EnvShake]
type = EnvShake
trigger1 = animelem = 35
time = 25
freq = 120
ampl = -5

[State 5285,DestroySelf]
type = DestroySelf
trigger1 = Time = 200

;====<INTRO Truck 2>====
[Statedef 5286]
type = A
movetype = I
physics = N
anim = 193
velset = 0,0
ctrl = 0
sprpriority = -2

[State 5286,VelAdd]
type = VelSet
trigger1 = Time >= 12 && Time < 108
x = -.5

[State 5286,VelAdd]
type = VelSet
trigger1 = Time >= 108
x = -1.5

[State 5286,DestroySelf]
type = DestroySelf
trigger1 = Time = 200

;====<INTRO Truck 3>====
[Statedef 5287]
type = A
movetype = I
physics = N
anim = 194
velset = 0,0
sprpriority = 2

[State 5287,VelSet]
type = VelSet
trigger1 = Time = 0
x = IfElse(Ishelper(5287) = 1,1,IfElse(Ishelper(5288) = 1,2,3))
y = IfElse(Ishelper(5287) = 1,-1,IfElse(Ishelper(5288) = 1,.75,-.75))

[State 5287,VelAdd]
type = Veladd
trigger1 = 1
y = .17

[State 5287,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5288

;====<INTRO Truck 4>====
[Statedef 5288]
type = S
movetype = I
physics = N
anim = 196
velset = 0,0
sprpriority = 2

[State 5288,VelSet]
type = VelSet
trigger1 = Time = 0
x = IfElse(Ishelper(5287) = 1,1,IfElse(Ishelper(5288) = 1,1.5,2))
y = IfElse(Ishelper(5287) = 1,-2.8,IfElse(Ishelper(5288) = 1,-2.9,-3.3))

[State 5288,VelAdd]
type = Veladd
trigger1 = 1
y = .17

[State 5288,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5289

;====<INTRO Truck 5>====
[Statedef 5289]
type = S
movetype = I
physics = N
anim = 196
velset = 0,0
sprpriority = 2

[State 5289,VelSet]
type = VelSet
trigger1 = Time = 0
x = IfElse(Ishelper(5287) = 1,1,IfElse(Ishelper(5288) = 1,1.5,2))
y = IfElse(Ishelper(5287) = 1,-1.6,IfElse(Ishelper(5288) = 1,-1.7,-1.6))

[State 5289,VelAdd]
type = Veladd
trigger1 = 1
y = .17

[State 5289,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5290

[Statedef 5290]
type = S
movetype = I
physics = N
velset = 0, 0

[State 5290,DestroySelf]
type = DestroySelf
trigger1 = Time = 0

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

[State 6901, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 190, 0
channel = 0

[State 190, Landing Dust Explod]
type = Explod
trigger1 = AnimElem=9
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 6901, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,0
channel = 1

[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;====<WIN POSE DECIDER>====
[StateDef 180]
type = S

[State 180, Generic Victory Quote (Normal/Master mode)]
type = VictoryQuote
trigger1 = 1
value = Random % 50

[State 180, Victory Quote vs. Abel]
type = VictoryQuote
trigger1 = Enemy, Name = "Abel" || Enemy, Name = "cvsAbel"
value = 50

[State 180, Victory Quote vs. Adon]
type = VictoryQuote
trigger1 = Enemy, Name = "Adon" || Enemy, Name = "cvsadon"
value = 51

[State 180, Victory Quote vs. Akuma]
type = VictoryQuote
trigger1 = Enemy, Name = "Akuma" || Enemy, Name = "cvsgouki" || Enemy, Name = "Gouki" || Enemy, Name = "Shin Akuma" || Enemy, Name = "Shin Gouki" || Enemy, Name = "ShinAkuma" || Enemy, Name = "ShinGouki" || Enemy, Name = "Pocket Shin Gouki"
value = 52

[State 180, Victory Quote vs. Balrog]
type = VictoryQuote
trigger1 = Enemy, AuthorName != "Phantom.of.the.Server" && Enemy, AuthorName != "Froz"
trigger1 = Enemy, Name = "Balrog" || Enemy, Name = "cvsbison" || Enemy, Name = "K-Mike Bison"
value = 53

[State 180, Victory Quote vs. Cammy]
type = VictoryQuote
trigger1 = Enemy, Name = "Cammy" || Enemy, Name = "cvscammy"
value = 54

[State 180, Victory Quote vs. Chun-Li]
type = VictoryQuote
trigger1 = Enemy, Name = "Chun-Li" || Enemy, Name = "cvschunli" || Enemy, Name = "Chun Li" || Enemy, Name = "ChunLi"
value = 55

[State 180, Victory Quote vs. Cody]
type = VictoryQuote
trigger1 = Enemy, Name = "Cody" || Enemy, Name = "cvscody"
value = 56

[State 180, Victory Quote vs. Crimson Viper]
type = VictoryQuote
trigger1 = Enemy, Name = "C. Viper" || Enemy, Name = "Crimson Viper"
value = 57

[State 180, Victory Quote vs. Dan]
type = VictoryQuote
trigger1 = Enemy, Name = "Dan" || Enemy, Name = "cvsdan" || Enemy, Name = "Dan Hibiki"
value = 58

[State 180, Victory Quote vs. Decapre]
type = VictoryQuote
trigger1 = Enemy, Name = "Decapre" || Enemy, Name = "cvsdecapre"
value = 59

[State 180, Victory Quote vs. Dee Jay]
type = VictoryQuote
trigger1 = Enemy, Name = "Dee Jay" || Enemy, Name = "DeeJay"
value = 60

[State 180, Victory Quote vs. Dhalsim]
type = VictoryQuote
trigger1 = Enemy, Name = "Dhalsim" || Enemy, Name = "cvsdhalsim" || Enemy, Name = "RajaaDhalsim"
value = 61

[State 180, Victory Quote vs. Dudley]
type = VictoryQuote
trigger1 = Enemy, Name = "Dudley"
value = 62

[State 180, Victory Quote vs. Elena]
type = VictoryQuote
trigger1 = Enemy, Name = "Elena" || Enemy, Name = "cvselena"
value = 63

[State 180, Victory Quote vs. El Fuerte]
type = VictoryQuote
trigger1 = Enemy, Name = "El Fuerte" || Enemy, Name = "elfuerte" || Enemy, Name = "Fuerte"
value = 64

[State 180, Victory Quote vs. E. Honda]
type = VictoryQuote
trigger1 = Enemy, Name = "E. Honda" || Enemy, Name = "cvshonda" || Enemy, Name = "E.Honda" || Enemy, Name = "Honda"
value = 65

[State 180, Victory Quote vs. Fei Long]
type = VictoryQuote
trigger1 = Enemy, Name = "Fei Long" || Enemy, Name = "cvsfeilong" || Enemy, Name = "FeiLong" || Enemy, Name = "Fei-Long"
value = 66

[State 180, Victory Quote vs. Gen]
type = VictoryQuote
trigger1 = Enemy, Name = "Gen"
value = 67

[State 180, Victory Quote vs. Gouken]
type = VictoryQuote
trigger1 = Enemy, Name = "Gouken"
value = 68

[State 180, Victory Quote vs. Guile]
type = VictoryQuote
trigger1 = Enemy, Name = "Guile" || Enemy, Name = "cvsguile"
value = 69

[State 180, Victory Quote vs. Guy]
type = VictoryQuote
trigger1 = Enemy, Name = "Guy" || Enemy, Name = "cvsguy"
value = 70

[State 180, Victory Quote vs. Hakkan]
type = VictoryQuote
trigger1 = Enemy, Name = "Hakkan"
value = 71

[State 180, Victory Quote vs. Hugo]
type = VictoryQuote
trigger1 = Enemy, Name = "Hugo"
value = 72

[State 180, Victory Quote vs. Ibuki]
type = VictoryQuote
trigger1 = Enemy, Name = "Ibuki"
value = 73

[State 180, Victory Quote vs. Juri Han]
type = VictoryQuote
trigger1 = Enemy, Name = "Juri" || Enemy, Name = "Juri Han"
value = 74

[State 180, Victory Quote vs. Ken]
type = VictoryQuote
trigger1 = Enemy, Name = "Ken" || Enemy, Name = "cvsken" || Enemy, Name = "Ken Masters"
value = 75

[State 180, Victory Quote vs. Makoto]
type = VictoryQuote
trigger1 = Enemy, Name = "Makoto"
value = 76

[State 180, Victory Quote vs. Oni]
type = VictoryQuote
trigger1 = Enemy, Name = "Oni" || Enemy, Name = "Oni Akuma" || Enemy, Name = "Oni Gouki" || Enemy, Name = "OniAkuma"
value = 77

[State 180, Victory Quote vs. M. Bison]
type = VictoryQuote
trigger1 = Enemy, Name = "M. Bison" || Enemy, Name = "cvsvega" || Enemy, Name = "M.Bison" || Enemy, Name = "Bison"
trigger2 = (Enemy, Name = "Vega" && Enemy, AuthorName = "Phantom.of.the.Server")
trigger3 = (Enemy, Name = "Vega" && Enemy, AuthorName = "Froz")
value = 78

[State 180, Victory Quote vs. Rolento]
type = VictoryQuote
trigger1 = Enemy, Name = "Rolento" || Enemy, Name = "Rolento Schugerg" || Enemy, Name = "cvsrolento"
value = 79

[State 180, Victory Quote vs. Rose]
type = VictoryQuote
trigger1 = Enemy, Name = "Rose"
value = 80

[State 180, Victory Quote vs. Rufus]
type = VictoryQuote
trigger1 = Enemy, Name = "Rufus"
value = 81

[State 180, Victory Quote vs. Ryu]
type = VictoryQuote
trigger1 = (Enemy, Name = "Ryu" && !(Enemy, AuthorName = "Phantom.of.the.Server")) || (Enemy, Name = "cvsryu" && PalNo = [1,6]) || Enemy, Name = "cvsryu_normal"
trigger2 = (Enemy, Name = "Ryu" && Enemy, AuthorName = "Phantom.of.the.Server")
trigger2 = Enemy, var(1) != 2
value = 82

[State 180, Victory Quote vs. Sagat]
type = VictoryQuote
trigger1 = Enemy, Name = "Sagat" || Enemy, Name = "cvssagat" || Enemy, Name = "SagatMG"
value = 83

[State 180, Victory Quote vs. Sakura]
type = VictoryQuote
trigger1 = Enemy, Name = "Sakura" || Enemy, Name = "cvssakura" || Enemy, Name = "Sakura Kasugano"
value = 84

[State 180, Victory Quote vs. Seth]
type = VictoryQuote
trigger1 = Enemy, Name = "Seth" || Enemy, Name = "cvsseth"
value = 85

[State 180, Victory Quote vs. T. Hawk]
type = VictoryQuote
trigger1 = Enemy, Name = "T. Hawk" || Enemy, Name = "T.Hawk"
value = 86

[State 180, Victory Quote vs. Vega]
type = VictoryQuote
trigger1 = Enemy, AuthorName != "Phantom.of.the.Server" && Enemy, AuthorName != "Froz"
trigger1 = Enemy, Name = "Vega" || Enemy, Name = "cvsbalrog"
value = 87

[State 180, Victory Quote vs. Zangief]
type = VictoryQuote
trigger1 = Enemy, Name = "Zangief" || Enemy, Name = "cvszangief"
value = 88

[State 180, Win 1]
type = ChangeState
trigger1 = command = "holdstart"
value = 181

[State 180, Win 2]
type = ChangeState
trigger1 = command = "holdx"
value = 182

[State 180, Win 3]
type = ChangeState
trigger1 = command = "holdy" || command = "holdz"
value = 183

[State 180, Win 4]
type = ChangeState
trigger1 = command = "holda"
value = 184

[State 180, Win 4]
type = ChangeState
trigger1 = command = "holdb" || command = "holdc"
value = 185

[State 180, Win Decider]
type = ChangeState
trigger1 = 1
value = 181 + (Random % 5)

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

[State 181, Landing Dust Explod]
type = Explod
trigger1 = AnimElem=13,=0
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 181,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=9,=0
value = 4, 1
channel = 1

[State 181, PlaySnd]
type = PlaySnd
trigger1 = AnimElem=13,=0
value = 52, 0

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
trigger1 = AnimElem=1
value = 181, 0
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
trigger1 = AnimElem=4
value = 3000, 1
channel = 20

[State 183,PlaySnd]
type = StopSnd
trigger1 = AnimElem=8
channel = 20

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
trigger1 = AnimElem=3,=1
value = 4, 4
channel = 1

;====<WIN 5>====
[Statedef 185]
type = S
movetype = I
velset = 0,0
ctrl = 0
anim = 185

[State 185,PlaySnd]
type = ChangeState
trigger1 = AnimTime=0
value = 186+random%3

[state 185]
type = varset
trigger1 = time=0
var(51)= 0

[state 185]
type = varadd
trigger1 = 1
var(2)=1

[State 185,1]
type = AssertSpecial
trigger1 = var(2)=[0,200]
flag = RoundNotOver

;====<WIN 6>====
[Statedef 186]
type = S
movetype = I
velset = 0,0
ctrl = 0
anim = 186

[State 186, Spark]
type = Varset
trigger1 = Time = 0
var(1) = random%3

[State 186, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 7905+var(1)*10
id = 7905+var(1)*10
pos = 0, 0
postype = p1
ownpal = 1
bindtime = 1
pausemovetime = -1
supermove = 1
ignorehitpause = 1
sprpriority = 1

[State 186, Helper]
type = Helper
trigger1 = AnimElem=5
id = 7900+var(1)*10
stateno=7900+var(1)*10
pos = 0, -66
postype = p1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 186,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=3
value = 182, 0
channel = 1

[state 186]
type = varadd
trigger1 = 1
var(2)=1

[State 186,PlaySnd]
type = ChangeState
trigger1 = Anim>=186 && AnimTime=0
value = 186+random%3

[State 186,1]
type = AssertSpecial
trigger1 = var(2)=[0,320]
flag = RoundNotOver

;====<WIN 7>====
[Statedef 187]
type = S
movetype = I
velset = 0,0
ctrl = 0
anim = 187

[State 187, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 6935
id = 7935
pos = 0, 0
postype = p1
ownpal = 1
bindtime = 1
pausemovetime = -1
supermove = 1
ignorehitpause = 1
sprpriority = 1

[State 187, Helper]
type = Helper
trigger1 = AnimElem=6
id = 7930
stateno=7930
pos = 0, -66
postype = p1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 187,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=3
value = 182, 0
channel = 1

[state 187]
type = varadd
trigger1 = 1
var(2)=1

[State 187,PlaySnd]
type = ChangeState
trigger1 = Anim>=186 && AnimTime=0
value = 186+random%3

[State 187,1]
type = AssertSpecial
trigger1 = var(2)=[0,320]
flag = RoundNotOver

;====<WIN 8>====
[Statedef 188]
type = S
movetype = I
velset = 0,0
ctrl = 0
anim = 188

[State 188, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 6945+random%2*10
id = 7945+random%2*10
pos = 0, 0
postype = p1
ownpal = 1
bindtime = 1
pausemovetime = -1
supermove = 1
ignorehitpause = 1
sprpriority = 1

[State 188, Helper]
type = Helper
trigger1 = AnimElem=13
id = 7940
stateno=7940
pos = 0, -66
postype = p1
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 188,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=2
value = 182, 0
channel = 1

[State 188, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 189
id = 189
pos = 0, 0
postype = p1
ownpal = 0
bindtime = -1
shadow = -1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[state 188]
type = varadd
trigger1 = 1
var(2)=1

[State 188,PlaySnd]
type = ChangeState
trigger1 = Anim>=186 && AnimTime=0
value = 186+random%3

[State 188,1]
type = AssertSpecial
trigger1 = var(2)=[0,320]
flag = RoundNotOver

;====<WIN 9>====
[statedef 7900]
type = A
physics = N
ctrl = 0
velset = (ceil(Abs(root,Pos X-root,fvar(15)))-30)/40,-10
anim=6900
sprpriority = 2

[state 1000]
type = Veladd
trigger1 = 1
y = .4

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-20 && root,var(51)<4
Anim = 6902
id = 7902
pos = root,var(51)*20-40, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-30 && (root,var(51)=[4,5])
Anim = 6902
id = 7902
pos = (root,var(51)-3)*20-30, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[state 7900]
type = parentvaradd
trigger1 = time=48
var(51)= 1

[state 7900]
type = DestroySelf
trigger1 = Pos Y>=ifelse((root,var(51)=[4,5]),-30,-20)

;====<WIN 10>====
[statedef 7910]
type = A
physics = N
ctrl = 0
velset = (ceil(Abs(root,Pos X-root,fvar(15)))-30)/40,-10
anim=6910
sprpriority = 2

[state 1000]
type = Veladd
trigger1 = 1
y = .4

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-20 && root,var(51)<4
Anim = 6911
id = 7911
pos = root,var(51)*20-40, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-30 && (root,var(51)=[4,5])
Anim = 6911
id = 7911
pos = (root,var(51)-3)*20-30, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[state 7900]
type = parentvaradd
trigger1 = time=48
var(51)= 1

[state 7900]
type = DestroySelf
trigger1 = Pos Y>=ifelse((root,var(51)=[4,5]),-30,-20)

;====<WIN 11>====
[statedef 7920]
type = A
physics = N
ctrl = 0
velset = (ceil(Abs(root,Pos X-root,fvar(15)))-30)/40,-10
anim=6920
sprpriority = 2

[state 1000]
type = Veladd
trigger1 = 1
y = .4

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-20 && root,var(51)<4
Anim = 6921
id = 7921
pos = root,var(51)*20-40, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-30 && (root,var(51)=[4,5])
Anim = 6921
id = 7921
pos = (root,var(51)-3)*20-30, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[state 7900]
type = parentvaradd
trigger1 = time=48
var(51)= 1

[state 7900]
type = DestroySelf
trigger1 = Pos Y>=ifelse((root,var(51)=[4,5]),-30,-20)

;====<WIN 12>====
[statedef 7930]
type = A
physics = N
ctrl = 0
velset = (ceil(Abs(root,Pos X-root,fvar(15)))-30)/40,-10
anim=6930
sprpriority = 2

[state 1000]
type = Veladd
trigger1 = 1
y = .4

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-20 && root,var(51)<4
Anim = 6931
id = 7931
pos = root,var(51)*20-40, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-30 && (root,var(51)=[4,5])
Anim = 6931
id = 7931
pos = (root,var(51)-3)*20-30, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[state 7900]
type = parentvaradd
trigger1 = time=48
var(51)= 1

[state 7900]
type = DestroySelf
trigger1 = Pos Y>=ifelse((root,var(51)=[4,5]),-30,-20)

;====<WIN 13>====
[statedef 7940]
type = A
physics = N
ctrl = 0
velset = (ceil(Abs(root,Pos X-root,fvar(15)))-30)/40,-10
anim=6940
sprpriority = 2

[state 1000]
type = Veladd
trigger1 = 1
y = .4

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-20 && root,var(51)<4
Anim = 6941
id = 7941
pos = root,var(51)*20-40, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[State 1000, Spark]
type = Explod
trigger1 = Pos Y>=-30 && (root,var(51)=[4,5])
Anim = 6941
id = 7941
pos = (root,var(51)-3)*20-30, 0
postype = p1
ownpal = 1
bindtime = 1
sprpriority = 2
pausemovetime = -1
supermove = 1
ignorehitpause = 1

[state 7900]
type = parentvaradd
trigger1 = time=48
var(51)= 1

[state 7900]
type = DestroySelf
trigger1 = Pos Y>=ifelse((root,var(51)=[4,5]),-30,-20)

;==<TAUNT>==
[StateDef 195]
type = S
moveType = I
physics = S
anim = 195
velSet = 0,0
sprPriority = 1
ctrl = 0

[State 195, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = 195, 0
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

[State 5981, Hitting the Floor Sound]
type = PlaySnd
trigger1 = AnimElem = 10
value = F7,0

[State 5981, Hitting the Floor Explod]
type = Explod
trigger1 = AnimElem = 10
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
trigger1 = MoveHit = 1 && var(30) = HitPauseTime
trigger1 = NumEnemy && var(9)
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

[State -2, Tap Kick Decrement]
type = VarAdd
trigger1 = var(46) > 0
var(46) = -1

[State -2, Tap Kick Reset]
type = VarSet
trigger1 = var(46) <= 0
trigger2 = Time = 1
trigger2 = StateNo = 1000
var(45) = 0

[State -2, Tap Kick Increment]
type = VarAdd
trigger1 = command = "x"
trigger1 = var(46) := 14
trigger2 = command = "y"
trigger2 = var(46) := 12
trigger3 = command = "z"
trigger3 = var(46) := 10
trigger4 = command = "pp"
trigger4 = var(46) := 14
var(45) = 1

[State -2]
type = Varset
trigger1 = (stateno=[3100,3199]) && AnimElemTime(5)<0
var(51)= 0

[State -2]
type = Varadd
triggerall = (stateno=[3100,3199])
triggerall = (command="x" || command="y" || command="z" || command="a" || command="b" || command="c")
trigger1 = AnimElemTime(5)>=0
var(51)= 1
ignorehitpause=1
persistent = 1

[State -2]
type = varset
trigger1 = enemynear,alive=1 || enemynear,stateno!=5150
fvar(15) = ceil(enemynear,Pos X)

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

[State -2, Voice Position]
type = SndPan
trigger1 = 1
channel = 0
pan = 0
ignoreHitPause = 1

[State -2, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "AI = %d Attack = %f Hits = %d Juggle = %d"
params = AILevel, fvar(11), var(13), var(15)
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
trigger1 = (StateNo != [3403,3453])
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
trigger1 = Helper(1005), StateNo = 1035
trigger2 = NumHelper(3205)
trigger2 = Helper(3205), StateNo = 3205
trigger3 = NumHelper(4000)
trigger3 = Helper(4000), StateNo = 4000
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

[State -3, DestroySelf]
type = StopSnd
trigger1 = !NumExplod(6000)
trigger1 = !NumExplod(6500)
channel = 30

[State 6000, DestroySelf]
type = RemoveExplod
trigger1 = (stateno!=[1000,1099]) || animelem = 15
trigger1 = (stateno!=[3200,3299])
id = 6000

[State 6000, DestroySelf]
type = RemoveExplod
trigger1 = (stateno!=[3000,3099])
trigger2 = (stateno=[3000,3099]) && time>=78
trigger3 = (stateno=[3000,3099]) && movecontact
id = 6100

[State 3210,***]
type = RemoveExplod
trigger1 = animelem = 15
id = 3210

[State 6000, DestroySelf]
type = RemoveExplod
trigger1 = (stateno!=[3200,3299])
id = 3220

[State 6000, DestroySelf]
type = RemoveExplod
trigger1 = (stateno!=[3200,3299])
trigger1 = (stateno!=[3300,3399])
id = 6500

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
trigger4 = StateNo = 200
trigger5 = StateNo = 215 && AnimElemTime(4) < 0
trigger6 = StateNo = 225 && AnimElemTime(5) < 0
trigger7 = StateNo = 230
trigger8 = StateNo = 400
trigger9 = StateNo = 410 && AnimElemTime(3) < 0
trigger10 = StateNo = 430
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
trigger4 = StateNo = 200
trigger5 = StateNo = 210 && AnimElemTime(4) < 0
trigger6 = StateNo = 215 && AnimElemTime(5) < 0
trigger7 = StateNo = 220 && AnimElemTime(5) < 0
trigger8 = StateNo = 225 && AnimElemTime(5) < 0
trigger9 = StateNo = 230
trigger10 = StateNo = 240 && AnimElemTime(4) < 0
trigger11 = StateNo = 245 && AnimElemTime(5) < 0
trigger12 = StateNo = 400
trigger13 = StateNo = 410 && AnimElemTime(3) < 0
trigger14 = StateNo = 420 && AnimElemTime(4) < 0
trigger15 = StateNo = 430
trigger16 = StateNo = 440 && AnimElemTime(3) < 0
trigger17 = StateNo = 450 && AnimElemTime(4) < 0
trigger18 = (StateNo = [1000,1030]) && (AnimElemTime(5) = [1,8])
var(7) = 1
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = 1
var(8) = 0
ignoreHitPause = 1

[State -3, Hyper Cancel Reset]
type = VarSet
trigger1 = StateNo = 3100 && AnimElemTime(3) >= 0 && AnimElemTime(18) < 0 && MoveContact
trigger2 = StateNo = 3300 && AnimElemTime(5) >= 0 && AnimElemTime(20) < 0 && MoveContact
trigger3 = StateNo = 3300 && AnimElemTime(5) >= 0 && AnimElemTime(20) < 0 && MoveContact
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
trigger1 = (StateNo = 3000 || StateNo = 3100 || StateNo = 3300) && Time = 43
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
trigger3 = StateNo = 3350 && Time = 43
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
trigger1 = StateNo = 3200 && Time = 43
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

[State -3, Custom Combo Finish]
type = Helper
triggerAll = WinKO && var(20)
triggerAll = RoundState = 3 && !NumHelper(8600)
trigger1 = MoveHit = [1,4]
trigger2 = NumHelper(1005)
trigger2 = (Helper(1005), StateNo = [1005,1007]) && (Helper(1005), var(18))
trigger3 = StateNo = 810 && (AnimElemTime(5) = [0,1])
trigger4 = StateNo = 820 && (AnimElemTime(6) = [0,1])
trigger5 = StateNo = 860 && (AnimElemTime(3) = [0,1])
trigger6 = StateNo = 871 && (AnimElemTime(1) = [0,1])
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
trigger6 = (StateNo = [3400,3499])
trigger6 = var(23) := 3400
trigger7 = (StateNo = [3500,3599])
trigger7 = var(23) := 3500
trigger8 = (StateNo = [3600,3699])
trigger8 = var(23) := 3600
trigger9 = (StateNo = [3700,3799])
trigger9 = var(23) := 3700
trigger10 = Numhelper(4000)
trigger10 = (Helper(4000), StateNo = [0,4999]) && (Helper(4000), var(18))
trigger10 = var(23) := 3400
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

