; _________________________________________
;| Zangief by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;SUPER STATES>====
;==

;Final Atomic Buster>=
[StateDef 3000]
type = S
movetype = A
physics = S
juggle = 8
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
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
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 1
value = 1500,0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 0
value = 5,4
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 3
movetype = I

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,86]
trigger1 = AnimElem = 2
attr = S, HT
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3001
p2stateno = 3009
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = var(18)
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,86]
trigger1 = AnimElem = 2
attr = S, HT
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3001
p2stateno = 3009
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 3001]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3001

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 13
x = 96

[State 902, 1]
type = ChangeAnim
trigger1 = AnimElem = 13
value = anim
elem = 4
persistent = 0

[State 901, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 3015

[State 1201, 2]
type = Playerpush
trigger1 = 1
value = 0

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3001, Width]
type = Width
trigger1 = animelem = 1
edge = 90,0

[State 3001, Width]
type = Width
trigger1 = animelem = 9
edge = 120,0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 3 && var(40) != 1
value = 3000, 0
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time > 50
trigger1 = animelem = 9 && var(40) != 1
value = 3000, 1
channel = 1
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 1
value = 820, 2
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 1
value = 41, 0
channel = 3

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 16
trigger2 = animelemtime(19) = 2
value = 1, 5

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 3 && var(40) != 0
value = 3050, 0
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time > 50
trigger1 = animelem = 9 && var(40) != 0
value = 3050, 1
channel = 1
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 0
value = 820, 2
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 0
value = 6, 2
channel = 3

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 16
trigger2 = animelemtime(19) = 2
value = 6, 1

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 13 && var(40) != 1
value = 1400, 0
channel = 5

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 13 && var(40) != 0
value = 5, 2
channel = 5

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(120*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 16
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 16
y = -13.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(16) > 0
trigger2 = time > 94
y = .75

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(66*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(19*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 4
trigger2 = AnimElem = 13
pos = ceil(-43*const(size.xscale)),ceil(-62*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 7
pos = ceil(-35*const(size.xscale)),ceil(-109*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 8
pos = ceil(96*const(size.xscale)),ceil(-87*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 9
pos = ceil(135*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 12
pos = ceil(72*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 16
trigger2 = animelemtime(19) = 2
pos = ceil(-54*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 17
pos = ceil(15*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 18
pos = ceil(53*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 19
pos = 0,ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 17
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 18
value = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = AnimElem = 9
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 9
value = -100
kill = 0

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(16) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3002

;Part 3
[Statedef 3022]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3022

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3026

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 4
value = 1500, 0
channel = 1
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 1
value = 41, 0
Channel = 3

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 9
trigger2 = animelemtime(12) = 2
value = 1, 5
channel = 4

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 4
value = 5, 2
channel = 1
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 0
value = 6, 2
channel = 3

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 9
trigger2 = animelemtime(12) = 2
value = 6, 1
channel = 4

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(-25*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 9
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 9
y = -13.5

[State 903, Vel]
type = VelAdd
trigger1 = time > 40
trigger1 = AnimElemTime(9) > 0
y = .75

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(-45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(-61*const(size.xscale)),ceil(-78*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(-67*const(size.xscale)),ceil(-98*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 6
pos = ceil(-43*const(size.xscale)),ceil(-62*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
trigger2 = animelemtime(12) = 2
pos = ceil(-54*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 10
pos = ceil(15*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 11
pos = ceil(53*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 12
pos = 0,ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 10
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 11
value = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -150
kill = 0

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(9) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3002

;Part 4
[Statedef 3002]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3002
sprpriority = 1

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3006

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 3000, 2
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 3050, 2
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3
channel = 1

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(-25*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(-45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(-45*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 4.5
y = -6.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = .5

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .99

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -150

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3003

;Part 5
[Statedef 3003]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 1100, turn]
type = turn
trigger1 = Time = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

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

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3005]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3005

;Player 2 part 2
[Statedef 3015]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = !Time
value = 3005

[State 902, 1]
type = ChangeAnim2
trigger1 = animelem = 9
value = anim
elem = 4
persistent = 0

;Player 2 part 3
[Statedef 3026]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3026

;Player 2 part 4
[Statedef 3006]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = AnimElemTime(2) < 0
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3006

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = 6
y = -9

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(2) > 0
y = .5

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 part 6
[Statedef 3009]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

;MAX Final Atomic Buster>=
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
trigger1 = AnimElemTime(8) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(11 * const(size.xScale)), ceil(-88 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 1
value = 1500,0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 0
value = 5,4
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 3
movetype = I

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,86]
trigger1 = AnimElem = 2
attr = S, HT
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3051
p2stateno = 3009
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = var(18)
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,86]
trigger1 = AnimElem = 2
attr = S, HT
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3051
p2stateno = 3009
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 3051]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3001

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 13
x = 96

[State 902, 1]
type = ChangeAnim
trigger1 = AnimElem = 13
value = anim
elem = 4
persistent = 0

[State 901, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 3015

[State 1201, 2]
type = Playerpush
trigger1 = 1
value = 0

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3001, Width]
type = Width
trigger1 = animelem = 1
edge = 90,0

[State 3001, Width]
type = Width
trigger1 = animelem = 9
edge = 120,0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 3 && var(40) != 1
value = 3000, 0
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time > 50
trigger1 = animelem = 9 && var(40) != 1
value = 3000, 1
channel = 1
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 1
value = 820, 2
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 1
value = 41, 0
channel = 3

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 16
trigger2 = animelemtime(19) = 2
value = 1, 5

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 3 && var(40) != 0
value = 3050, 0
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time > 50
trigger1 = animelem = 9 && var(40) != 0
value = 3050, 1
channel = 1
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 0
value = 820, 2
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 0
value = 6, 2
channel = 3

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 16
trigger2 = animelemtime(19) = 2
value = 6, 1

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 13 && var(40) != 1
value = 1400, 0
channel = 5

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 13 && var(40) != 0
value = 5, 2
channel = 5

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(120*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 16
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 16
y = -13.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(16) > 0
trigger2 = time > 94
y = .75

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(66*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(19*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 4
trigger2 = AnimElem = 13
pos = ceil(-43*const(size.xscale)),ceil(-62*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 7
pos = ceil(-35*const(size.xscale)),ceil(-109*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 8
pos = ceil(96*const(size.xscale)),ceil(-87*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 9
pos = ceil(135*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 12
pos = ceil(72*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 16
trigger2 = animelemtime(19) = 2
pos = ceil(-54*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 17
pos = ceil(15*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 18
pos = ceil(53*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 19
pos = 0,ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 17
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 18
value = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = AnimElem = 9
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 9
value = -100
kill = 0

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(16) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3022

;Super Aerial Russian Slam>=
[StateDef 3100]
type = S
movetype = A
physics = S
juggle = 8
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

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

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(59 * const(size.xScale)), ceil(-56 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 5
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 5
x = 2.5+(var(10)*4)
y = -9.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = .5

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(5) > 0
;trigger1 = AnimElemTime(6) < 0
x = .97

[State 903, Vel]
type = null;VelMul
trigger1 = AnimElem = 6
x = .75

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 3100, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 40, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 5, 1
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 6, 2
channel = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 6
movetype = I

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3200]
type = StateTypeSet
triggerall = P2movetype = H
triggerall = !var(18)
trigger1 = Animelem = 5,>= 0
trigger1 = animelem = 6,< 0
movetype = I

[State 3200]
type = StateTypeSet
triggerall = P2movetype != H
trigger1 = teamside = 1
trigger1 = Animelem = 5,>= 0
trigger1 = animelem = 6,< 0
movetype = A

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,67]
triggerall = P2bodydist Y = [-80,-enemynear,const(size.head.pos.y)-66]
triggerall = movetype = A
trigger1 = AnimElemTime(5) >= 0
trigger1 = AnimElemTime(6) < 0
attr = A, HT
hitflag = A-
priority = 3, Miss
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3121
p2stateno = 3109
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
persistent = 1
numhits = 0

[State 900, 1]
type = HitDef
triggerall = var(18)
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,67]
triggerall = P2bodydist Y = [-80,-enemynear,const(size.head.pos.y)-66]
trigger1 = AnimElemTime(5) >= 0
trigger1 = AnimElemTime(6) < 0
attr = A, HT
hitflag = AF
priority = 3, Miss
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3121
p2stateno = 3109
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
persistent = 1
numhits = 0

[State 3200]
type = StateTypeSet
triggerall = P2movetype != H
trigger1 = teamside = 2
trigger1 = Animelem = 5,>= 0
trigger1 = animelem = 6,< 0
movetype = A

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(5) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3105

;Player stand
[Statedef 3105]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

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

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3109]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

;Part 2
[Statedef 3121]
type = A
movetype = A
physics = N
velset = 0,0
anim = 3121

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3125

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(80*const(size.xscale)),ceil(-108*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(60*const(size.xscale)),ceil(-115*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(-53*const(size.xscale)),ceil(-89*const(size.yscale))
postype = P1
time = -1

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = .5

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(3) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3122

;Part 3
[Statedef 3122]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3122
sprpriority = 1

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3126

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 3100, 1
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 3
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3
channel = 1

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(-40*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(-45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(-45*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 4.5
y = -6.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = .5

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .99

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -200

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3123

;Part 4
[Statedef 3123]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 1100, turn]
type = turn
trigger1 = Time = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

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

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3125]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3125

;Player 2 part 2
[Statedef 3126]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = AnimElemTime(2) < 0
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3126

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = 4.5
y = -8.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(2) > 0
y = .5

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Part 2
[Statedef 3131]
type = A
movetype = A
physics = N
velset = 0,0
anim = 3131

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3135

[State 3001, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 730, 1
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 730, 2
channel = 0

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(85*const(size.xscale)),ceil(-96*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(-20*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(85*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(110*const(size.xscale)),ceil(-78*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 2
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 5
value = 1

[State 903, Vel]
type = VelSet
trigger1 = animelem = 5
x = 9.5
y = -9

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = .5

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(5) > 0
x = .98

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(5) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3132

;Part 3
[Statedef 3132]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3132

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3136

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 120,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 3100, 1
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 3
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3
channel = 1

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(75*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(125*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(125*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 3
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 3
x = -4.5
y = -5.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(3) > 0
y = .5

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -300

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3133

;Part 4
[Statedef 3133]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

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

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3135]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3135

;Player 2 part 2
[Statedef 3136]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = AnimElemTime(2) < 0
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3136

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = -4.5
y = -9.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(2) > 0
y = .5

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;MAX Super Aerial Russian Slam>=
[StateDef 3150]
type = S
movetype = A
physics = S
juggle = 8
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 1001, Button Detected]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifelse((command="c" && command="b"),2,ifelse((command="c" && command="a"),1,0))

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

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(59 * const(size.xScale)), ceil(-56 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 5
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 5
x = 2.5+(var(10)*4)
y = -9.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = .5

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(5) > 0
;trigger1 = AnimElemTime(6) < 0
x = .97

[State 903, Vel]
type = null;VelMul
trigger1 = AnimElem = 6
x = .75

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 3100, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 40, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 5, 1
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 6, 2
channel = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 6
movetype = I

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3200]
type = StateTypeSet
triggerall = P2movetype = H
triggerall = !var(18)
trigger1 = Animelem = 5,>= 0
trigger1 = animelem = 6,< 0
movetype = I

[State 3200]
type = StateTypeSet
triggerall = P2movetype != H
trigger1 = teamside = 1
trigger1 = Animelem = 5,>= 0
trigger1 = animelem = 6,< 0
movetype = A

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,67]
triggerall = P2bodydist Y = [-80,-enemynear,const(size.head.pos.y)-66]
triggerall = movetype = A
trigger1 = AnimElemTime(5) >= 0
trigger1 = AnimElemTime(6) < 0
attr = A, HT
hitflag = A-
priority = 3, Miss
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3131
p2stateno = 3109
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
persistent = 1
numhits = 0

[State 900, 1]
type = HitDef
triggerall = var(18)
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,67]
triggerall = P2bodydist Y = [-80,-enemynear,const(size.head.pos.y)-66]
trigger1 = AnimElemTime(5) >= 0
trigger1 = AnimElemTime(6) < 0
attr = A, HT
hitflag = AF
priority = 3, Miss
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3131
p2stateno = 3109
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
persistent = 1
numhits = 0

[State 3200]
type = StateTypeSet
triggerall = P2movetype != H
trigger1 = teamside = 2
trigger1 = Animelem = 5,>= 0
trigger1 = animelem = 6,< 0
movetype = A

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(5) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3105

;Ultimate Atomic Buster>=
[StateDef 3200]
type = S
movetype= A
physics = N
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(16*const(size.xscale)),ceil(-75*const(size.yscale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time = 4 && var(40) != 1
value = 3200, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time = 4 && var(40) != 0
value = 3250, 0
channel = 0

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=1
trigger1 = vel x > 0 && animelem = 3 || animelem = 8
value = 52,0
channel = 1

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 3 || animelem = 8
value = 6,0
channel = 1

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 3 || animelem = 8
value = 820,2
channel = 2

[State 0, EnvShake]
type = EnvShake
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 3 || animelem = 8
time = 8
ampl =  -5
ignorehitpause = 1

[State 3750,1]
type = HitDef
Trigger1 = Time = 0
attr = S,HT
hitflag = MF
priority = 5, miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3201
p2stateno = 3209
fall = 1
forcestand=1
numhits=0

[State 3750,ChangeAnim]
type = ChangeAnim
trigger1=time=70
value = 3208

[State 3750,VelSet]
type = VelSet
trigger1=animelem=2
x = 5

[State 3750,VelSet]
type = VelSet
trigger1=anim=3208
x = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = anim = 3208 && animelem = 4
value = 800, 0
channel = 3

[State 0, PlaySnd]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = anim = 3208 && animelem = 4
value = 800, 1
channel = 3

[State 3750,2]
type = ChangeState
Trigger1=anim=3208&&!animtime
value = 0
ctrl = 1

;Part 2
[Statedef 3201]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3201

[State 901, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 3210

[State 1201, 2]
type = Playerpush
trigger1 = 1
value = 0

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3001, Width]
type = Width
trigger1 = animelem = 1
edge = 90,0

[State 3001, Width]
type = Width
trigger1 = animelem = 9
edge = 120,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 8 && var(40) != 1
value = 1200,0
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 1
value = 820, 2
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 8 && var(40) != 0
value = 5,4
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 0
value = 820, 3
channel = 1

[State 1000, Explosion]
type = PlaySnd
trigger1 = AnimElem = 9
value = 3300,0
channel = 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(120*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 812, 1]
type = Explod
trigger1 = animelem = 9
anim = 8321
pos = ceil(120*const(size.xscale)), 5
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(66*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(19*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 4
trigger2 = AnimElem = 13
pos = ceil(-43*const(size.xscale)),ceil(-62*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 7
pos = ceil(-35*const(size.xscale)),ceil(-109*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 8
pos = ceil(96*const(size.xscale)),ceil(-87*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 9
pos = ceil(135*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 12
pos = ceil(72*const(size.xscale)),0
postype = P1
time = -1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = AnimElem = 9
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 9
value = -220
kill = 0

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = 20

[State 901, State End]
type = ChangeState
trigger1 = !animtime
value = 3202

;Back Breaker
[statedef 3202]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
sprpriority = 0
anim = 3202

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && var(40) != 1
value = 3200, 2
volume = 255
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time && var(40) != 0
value = 197, 0
volume = 255
channel = 0

[State 0, Width]
type = Width
trigger1 = 1
value = 90,90

[State 0, TargetState]
type = TargetState
trigger1 = !time
value = 3211

[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(1)>=0&&animelemtime(2)<0
pos = -40,-10
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(2)>=0&&animelemtime(3)<0
pos = -50,-45
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(3)>=0&&animelemtime(4)<0
pos = -5,-85
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(4)>=0&&animelemtime(5)<0
pos = 5,-160
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(5)>=0&&animelemtime(7)<0
pos = 10,-150
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(7)>=0&&animelemtime(8)<0
pos = 10,-135
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(8)>=0
pos = 10,-55

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = 3200, 5
volume = 255
channel = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 8
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = ceil(30 * const(size.xScale)), ceil(-35 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 =animelem=8
value =-180
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 =animelem=8
value = 1
[State 0, ChangeState]
type = ChangeState
trigger1=!animtime
value = 3205
ctrl = 0

;Part 4
[Statedef 3205]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3205
juggle = 0

[State 0, PosSet]
type = PosSet
trigger1 =!time
Y = 0
ignorehitpause = 1

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3212
[State 3001, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
[State 3001, Width]
type = Width
trigger1 = 1
edge = 30,30

[State 0, NotHitBy]
type = NotHitBy
trigger1 =1
value = SCA

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 1
value = 1200,0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 1, 2
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 1
value = 41, 0
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 0
value = 5,0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 6, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 0
value = 6, 2
channel = 2

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 9
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 9
y = -16

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(9) > 0
y = .5

[State 901,1]
type = targetBind
trigger1 = AnimElem = 1
pos = ceil(65*const(size.xscale)),-15
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 2
pos = ceil(65*const(size.xscale)),-15
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(55*const(size.xscale)),ceil(-60*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(64*const(size.xscale)),ceil(-48*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(70*const(size.xscale)),ceil(-80*const(size.yscale))
postype = P1
time = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
pos = ceil(15*const(size.xscale)),ceil(-36*const(size.yscale))
postype = P1
time = 1
[State 3001, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 30
ampl=8

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 16
movetype = I

[State 900, 1]
type = HitDef
trigger1 = AnimElem = 15
attr = A, HT
hitflag = AF
priority = 3, Miss
sparkno = -1
p1facing = 1
p2facing = 1
hitSound = -1 + 0 * (var(31) := 800)
p1stateno = 3206
p2stateno = 3213
guard.dist = 0
fall = 1
air.fall = 1
fall.recover = 0
numhits = 0

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(9) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;Part 5
[Statedef 3206]
type = A
movetype = A
physics = N
anim = 3206
velset = 0,0

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3214
[State 3001, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 3100, 0
channel = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 1, 5
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1  && var(40) != 1
value = 3200, 3
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 6, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1  && var(40) != 0
value = 3050, 1
channel = 2

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(65*const(size.xscale)),ceil(-75*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(60*const(size.xscale)),ceil(-75*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(68*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(90*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(67*const(size.xscale)),ceil(-47*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
trigger2 = animelemtime(9) = 2
pos = ceil(67*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(2*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 8
pos = ceil(-40*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(14*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 7
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 8
value = 1

[State 903, Vel]
type = VelAdd
trigger1=time>=20
trigger1 = AnimElemTime(6) > 0
y = .2
[State 903, Vel]
type = VelAdd
trigger1=time>=50
trigger1 = AnimElemTime(6) > 0
y = .5
[State 903, Vel]
type = VelAdd
trigger1=time>=70
trigger1 = AnimElemTime(6) > 0
y = 1

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3207

;Part 6
[Statedef 3207]
type = S
movetype= A
physics = N
anim = 3207
sprpriority = 2
velset = 0,0

[State 0, PosSet]
type = PosSet
trigger1 = !time
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = -3.5
y = -7.5

[State 0, TargetState]
type = TargetState
trigger1=!time
value = 3215

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 0
value = -200
kill = 1

[State 0, HitAdd]
type = HitAdd
trigger1=!time
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4 && var(40) != 1
value = 41,0
volume = 255
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0 && var(40) != 1
value = 820,2
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0 && var(40) != 1
value = 3200,4
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4 && var(40) != 0
value = 6,2
volume = 255
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0 && var(40) != 0
value = 820,3
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0 && var(40) != 0
value = 3050,2
channel = 2

[State 1000, Explosion]
type = PlaySnd
trigger1 = time = 0
value = 3300,0
channel = 3

[State 871, Impact Dust]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(40*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 812, 1]
type = Explod
trigger1 = time = 0
anim = 8320
pos = ceil(30*const(size.xscale)), 5
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 60
ampl = 12

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 998
ID = 998
pos = 27,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = -1
ownpal = 1

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = time = 6
ID =998
sprpriority = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 16
pos = 65,-12

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
statetype = A
physics = A

[State 0, TargetState]
type = TargetState
trigger1 = animelem = 3
value = 3216

[State 1303, ChangeState]
type = ChangeState
trigger1 = Time > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52
ctrl = 0

;Player 2
[Statedef 3210]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3210

;Player 2 part 2
[statedef 3211]
type = S
movetype = H
physics = N
velset = 0,0
ctrl = 0
sprpriority = 1
[State 0, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
movecamera = 1,0
ignorehitpause =1
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 3211

;Player 2 part 3
[Statedef 3212]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3212
[State 0, ScreenBound]
type = ScreenBound
trigger1 = AnimElemTime(2) < 0
trigger2=time>=80
value = 1
movecamera = 1,0
ignorehitpause = 1
[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 5
y = -12

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(5) > 0
y = .4

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 part 5
[Statedef 3213]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1
[State 0, AngleDraw]
type = AngleDraw
trigger1 =1
scale =1.2,1.2
ignorehitpause = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3213

;Player 2 part 6
[Statedef 3214]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1
[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3213

;Player 2 part 7
[statedef 3215]
type = A
movetype = H
physics = N
[State 3001, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
[State 0, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
movecamera = 1,0
ignorehitpause = 1
[State 3005, ChangeAnim2]
type = ChangeAnim2
trigger1 = time = 0
value = 3215

;Player 2 8
[Statedef 3216]
type = A
movetype = H
physics = N
velset = -3,-5
poweradd = 40

[State 821, 1]
type = VelAdd
Trigger1 = 1
y = .4

[State 821, 4]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 part 9
[Statedef 3209]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

;Ultra Final Atomic Buster>=
[StateDef 3300]
type = S
movetype = A
physics = S
juggle = 8
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

[State 170, 1]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 64

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(16*const(size.xscale)),ceil(-75*const(size.yscale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time = 4 && var(40) != 1
value = 1000, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time = 4 && var(40) != 0
value = 1000, 1
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 4
movetype = I

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,90]
trigger1 = AnimElem = 3
attr = S, HT
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3351
p2stateno = 3309
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
numhits = 0
ID = 3300

[State 900, 1]
type = HitDef
triggerall = var(18)
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,90]
trigger1 = AnimElem = 3
attr = S, HT
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3351
p2stateno = 3309
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
numhits = 0
ID = 3300

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 3351]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3301

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3311

[State 3001, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 41, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 6, 2
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 1
value = 3000, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 0
value = 3050, 0
channel = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(65*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(78*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(100*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(65*const(size.xscale)),ceil(-74*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
pos = ceil(99*const(size.xscale)),ceil(-114*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(-20*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(85*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 10
pos = ceil(110*const(size.xscale)),ceil(-78*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 9
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 10
value = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
x = 6
y = -12

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = 1

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(6) > 0
x = .98

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3352

;Part 3
[Statedef 3352]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3352

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3362

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 3 && var(40) != 1
value = 1200, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 1
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 41, 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 3 && var(40) != 0
value = 5, 2
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 0
value = 820, 4

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 6, 2

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(75*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3300, 0
channel = 3

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 812, 1]
type = Explod
trigger1 = AnimElem = 1
anim = 8321
pos = ceil(100*const(size.xscale)), 0
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
x = -4.5
y = -15

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(80*const(size.xscale)),ceil(0*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 3
pos = ceil(43*const(size.xscale)),ceil(-62*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 6
pos = ceil(36*const(size.xscale)),ceil(-130*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 7
pos = ceil(-80*const(size.xscale)),ceil(-108*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 8
pos = ceil(-70*const(size.xscale)),ceil(-50*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 9
pos = ceil(-50*const(size.xscale)),ceil(-45*const(size.yscale))
postype = P1
time = -1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -150
kill = 0

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3303

;Player 2 part 2
[Statedef 3362]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3362

;MAX Ultra Final Atomic Buster>=
[StateDef 3350]
type = S
movetype = A
physics = S
juggle = 8
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

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

[State 170, 1]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 64

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(16*const(size.xscale)),ceil(-75*const(size.yscale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time = 4 && var(40) != 1
value = 1000, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = time = 4 && var(40) != 0
value = 1000, 1
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 4
movetype = I

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,90]
trigger1 = AnimElem = 3
attr = S, HT
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3301
p2stateno = 3309
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
numhits = 0
ID = 3300

[State 900, 1]
type = HitDef
triggerall = var(18)
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,90]
trigger1 = AnimElem = 3
attr = S, HT
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3301
p2stateno = 3309
guard.dist = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
numhits = 0
ID = 3300

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 3301]
type = S
movetype = A
physics = N
velset = 0,0
anim = 3301

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3311

[State 3001, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 41, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 6, 2
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 1
value = 3000, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 0
value = 3050, 0
channel = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(65*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(78*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(100*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(65*const(size.xscale)),ceil(-74*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
pos = ceil(99*const(size.xscale)),ceil(-114*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(-20*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(85*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 10
pos = ceil(110*const(size.xscale)),ceil(-78*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 9
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 10
value = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
x = 6
y = -12

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = 1

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(6) > 0
x = .98

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3302

;Part 3
[Statedef 3302]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3302

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3312

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3001, Width]
type = Width
trigger1 = animelem = 8
edge = 105,0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 12 && var(40) != 1
value = 1200, 0
channel = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = animelem = 1
trigger2 = AnimElem = 8
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 15 && var(40) != 1
value = 41, 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 12 && var(40) != 0
value = 5, 2
channel = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = animelem = 1
trigger2 = AnimElem = 8
value = 820, 4

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 15 && var(40) != 0
value = 6, 2

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(75*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 812, 1]
type = Explod
trigger1 = AnimElem = 1
anim = 8321
pos = ceil(100*const(size.xscale)), 0
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElem = 8
value = 3300, 0
channel = 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(-87*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 812, 1]
type = Explod
trigger1 = AnimElem = 8
anim = 8321
pos = ceil(-87*const(size.xscale)), 0
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 15
StateType = A
physics = N

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 12
x = -96

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 15
x = -4.5
y = -15

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(15) > 0
y = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(80*const(size.xscale)),ceil(0*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 3
trigger2 = AnimElem = 12
pos = ceil(43*const(size.xscale)),ceil(-62*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 6
pos = ceil(35*const(size.xscale)),ceil(-109*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 7
pos = ceil(-96*const(size.xscale)),ceil(-87*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 8
pos = ceil(-135*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 11
pos = ceil(-72*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 15
pos = ceil(36*const(size.xscale)),ceil(-130*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 16
pos = ceil(-80*const(size.xscale)),ceil(-108*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 17
pos = ceil(-70*const(size.xscale)),ceil(-50*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 18
pos = ceil(-50*const(size.xscale)),ceil(-45*const(size.yscale))
postype = P1
time = -1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
trigger2 = AnimElem = 8
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
trigger2 = AnimElem = 8
value = -125
kill = 0

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
trigger2 = AnimElem = 8
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(15) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3303

;Part 4
[Statedef 3303]
type = S
movetype = A
physics = S
velset = 0,0
anim = 3303
juggle = 0

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3313

[State 3001, Width]
type = Width
trigger1 = 1
edge = 30,-30

[State 3001, Width]
type = Width
trigger1 = time = 0
edge = -60,60

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 1
value = 3000, 1
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 8 && var(40) != 1
value = 1400, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 1, 5

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 1
value = 41, 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 0
value = 3050, 1
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 8 && var(40) != 0
value = 5, 2
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 6, 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 0
value = 6, 2

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(-77*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3300, 0
channel = 3

[State 812, 1]
type = Explod
trigger1 = AnimElem = 1
anim = 8321
pos = ceil(-77*const(size.xscale)), 0
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 9
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 9
y = -14

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(9) > 0
y = .5

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 1
pos = ceil(-77*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 2
pos = ceil(-18*const(size.xscale)),ceil(-18*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(55*const(size.xscale)),ceil(-60*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(64*const(size.xscale)),ceil(-48*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(70*const(size.xscale)),ceil(-80*const(size.yscale))
postype = P1
time = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
pos = ceil(15*const(size.xscale)),ceil(-36*const(size.yscale))
postype = P1
time = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -125
kill = 0

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 16
movetype = I

[State 900, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
trigger1 = AnimElem = 15
attr = A, HT
hitflag = AF
priority = 3, Miss
sparkno = -1
p1facing = 1
p2facing = 1
hitSound = -1 + 0 * (var(31) := 800)
p1stateno = 3304
p2stateno = 3314
guard.dist = 0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(9) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3310

;Part 5
[Statedef 3310]
type = S
physics = S
ctrl = 0
anim = 12
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

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

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 7
[Statedef 3304]
type = A
movetype = A
physics = N
anim = 3304
velset = 0,0

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3314

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 1, 5
Channel = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 6, 1
Channel = 0

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(75*const(size.xscale)),ceil(-75*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(70*const(size.xscale)),ceil(-75*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(78*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(100*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(77*const(size.xscale)),ceil(-47*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
trigger2 = animelemtime(9) = 2
pos = ceil(77*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(8*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 8
pos = ceil(-30*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(24*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 7
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 8
value = 1

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3305

;Part 8
[Statedef 3305]
type = S
movetype = A
physics = N
velset = 0,0
anim = 811
sprpriority = 1

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 3315

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 3000, 2
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 3050, 2
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3300, 0
channel = 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(48*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 812, 1]
type = Explod
trigger1 = AnimElem = 1
anim = 8320
pos = ceil(48*const(size.xscale)), 0
ownpal = 1
sprpriority = 5
;pausemovetime = -1
supermovetime = -1
scale = .5,.5

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(90*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(90*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = -5.5
y = -9.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = .75

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .99

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
amp = 5
time = 25

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -125

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = time = 1
value = 35

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3306

;End part
[Statedef 3306]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

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

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 3311]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3311

;Player 2 part 2
[Statedef 3312]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3312

;Player 2 part 3
[Statedef 3313]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3313

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 5
y = -15

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(5) > 0
y = .5

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 part 4
[Statedef 3314]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3314

;Player 2 part 5
[Statedef 3315]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = AnimElemTime(2) < 0
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 816

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = -4.5
y = -5.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(2) > 0
y = .4

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 end
[Statedef 3309]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

;Siberian Blizzard>=
[StateDef 3400]
type = S
movetype = A
physics = S
juggle = 8
anim = 3400
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

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(38*const(size.xscale)),ceil(-63*const(size.yscale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = time = 3
value = 1000,1
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 10
movetype = I

[State 52, Effect]
type = PlaySnd
trigger1 = animelem = 4
value = 6, 2

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
value = 6, 1

[State 3001, Width]
type = Width
trigger1 = 1
edge = 10,0

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 4
y = -10.5

[State 1100, Gravity]
type = Veladd
trigger1 = AnimElemTime(4) > 0
y = .5

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
trigger2 = AnimElem = 6
trigger3 = AnimElem = 8
attr = A, HA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 12,13
guard.pauseTime = 12,13
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 2,-8.5
ground.cornerPush.velOff = 0
guard.velocity = 4
guard.cornerPush.velOff = 0
air.velocity = 2,-8.5
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .5
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 114), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
attr = A, HA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 12,13
guard.pauseTime = 12,13
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3,-8.5
ground.cornerPush.velOff = 0
guard.velocity = 4
guard.cornerPush.velOff = 0
air.velocity = -3,-8.5
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .5
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 114), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1100, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
trigger1 = animelemtime(4) > 0
value = 3405

;End
[Statedef 3405]
type = S
physics = S
ctrl = 0
anim = 1055
velset = 0,0

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

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;MAX Siberian Blizzard>=
[StateDef 3450]
type = S
movetype = A
physics = S
juggle = 8
anim = 3450
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

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

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(38*const(size.xscale)),ceil(-63*const(size.yscale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = time = 3
value = 1000,1
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 16
movetype = I

[State 52, Effect]
type = PlaySnd
trigger1 = animelem = 4
value = 6, 2

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
value = 6, 1

[State 3001, Width]
type = Width
trigger1 = 1
edge = 10,0

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 4
y = -14.5

[State 1100, Gravity]
type = Veladd
trigger1 = AnimElemTime(4) > 0
y = .5

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
trigger2 = AnimElem = 6
trigger3 = AnimElem = 8
trigger4 = AnimElem = 10
trigger5 = AnimElem = 12
trigger6 = AnimElem = 14
attr = A, HA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 12,13
guard.pauseTime = 12,13
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 6,-14.5
ground.cornerPush.velOff = 0
guard.velocity = 4
guard.cornerPush.velOff = 0
air.velocity = 6,-14.5
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .5
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 114), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
trigger6 = AnimElem = 13
trigger7 = AnimElem = 15
attr = A, HA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 12,13
guard.pauseTime = 12,13
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -3,-14.5
ground.cornerPush.velOff = 0
guard.velocity = 4
guard.cornerPush.velOff = 0
air.velocity = -3,-14.5
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .5
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 114), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1100, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
trigger1 = animelemtime(4) > 0
value = 3405

;Power Atomic Destruction>=
[StateDef 3500]
type = S
movetype = A
physics = S
anim = 3500
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(16*const(size.xscale)),ceil(-75*const(size.yscale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 6, 5
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 196, 0
channel = 1

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 20

[State 4000, Hitdef]
type = HitDef
trigger1 = Time
attr = S,HT
hitFlag = M-
priority = 4,Miss
getPower = 0,0
givePower = 0,0
numhits = 0
sparkno =  -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 3501
p2stateno = 3502
p2getp1state = 1
hitSound = -1 + 0 * (var(31) := 800)
fall = 1
fall.recover = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 800, 1
channel = 1

[State 3000, End]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

; Success
[Statedef 3501]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3501
poweradd = 0
sprpriority = 2
facep2 = 0

[State 805, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 800, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 830, TargetBind 1]
type = TargetBind
trigger1 = 1
pos = 40,0

[State 4000, Shake]
type = EnvShake
trigger1 = !AnimTime
ampl = 8
freq = 80
time = 20

[State 3000, Voice]
type = PlaySnd
trigger1 = !AnimTime
value = 11, 0
channel = 2

[State 1000, Explosion]
type = PlaySnd
trigger1 = !AnimTime
value = 3300,0
channel = 3

[State 1000, Explosion 2]
type = PlaySnd
trigger1 = !AnimTime
value = 3500, 1
channel = 4

[State 1000, Countdown]
type = PlaySnd
trigger1 = Time = 0
value = 3500, 0
channel = 1
loop = 1

[State 1000, Stop]
type = StopSnd
trigger1 = Time = 95
channel = 1

[State 1201, Landing Dust Explod]
type = Explod
trigger1 = !AnimTime
anim = 8320
sprpriority = 1
postype = P2
pos = 20,0
scale = 1,1
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 4000, PalFX]
type = PalFX
trigger1 = Time % 8 = 0
time = 4
add = 164,0,0
mul = 266,256,256
invertall = 0
color = 256
ignorehitpause = 1

[State 4000, Damage]
type = TargetLifeAdd
trigger1 = !AnimTime
value = floor(ifElse(459 * fvar(11) < 7, -7, -459 * fvar(11)))

[State 4000, Damage]
type = LifeAdd
trigger1 = !AnimTime
value = floor(ifElse(1000 * fvar(11) < 7, -7, -1000 * fvar(11)))
kill = 0

[State 810, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = !AnimTime
value = 70

[State 810, HitAdd]
type = HitAdd
trigger1 = !AnimTime
value = 1

[State 810, VarAdd]
type = VarAdd
trigger1 = !AnimTime
var(13) = 1

[State 810, Juggle]
type = VarAdd
trigger1 = !AnimTime
var(15) = 1
ignoreHitPause = 1

[State 810, Juggle]
type = VarSet
trigger1 = !AnimTime
var(16) = 1
ignoreHitPause = 1

[State 805, TargetState]
type = TargetState
trigger1 = !AnimTime
value = 3504

[State 3000, End]
type = ChangeState
trigger1 = !AnimTime
value = 3503
ctrl = 0

; Target
[StateDef 3502]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 806, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
Time = 1

[State 806, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3502

[State 806, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1

[State 806, SelfState]
type = SelfState
trigger1 = Time >= 100
value = ifElse(pos y < 0, 5040, 0)
ctrl = 1

; Falling 1
[Statedef 3503]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 4000, Invisibility]
type = NotHitBy
trigger1 = 1
value = SCA

[State 805, Facing]
type = TargetFacing
trigger1 = 1
value = -1

[State 800, Anim]
type = ChangeAnim
trigger1 = !Time
value = 3503

[State 1531, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 800, Vel]
type = Velset
trigger1 = AnimElem = 1
x = -4
y = -17.5
persistent = 0

[State 800, Gravity]
type = Veladd
trigger1 = AnimElem = 1 > 0
y = .9

[State 3151, End]
type = EnvShake
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
trigger1 = AnimElem = 1 > 0
time = 25
ampl = 6

[State 3151, End]
type = SelfState
trigger1 = Pos Y >= 0
Trigger1 = Vel Y > 0
Trigger1 = AnimElem = 1 > 0
value = 5100

; Falling 2
[Statedef 3504]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 4000, Invisibility]
type = NotHitBy
trigger1 = 1
value = SCA

[State 805, Facing]
type = TargetFacing
trigger1 = 1
value = -1

[State 800, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 3503

[State 1531, PalFX]
type = PalFX
trigger1 = !Time
time = 30
mul = 128, 128, 128
sinAdd = 96, 96, 96, 4

[State 800, Vel]
type = Velset
trigger1 = AnimElem = 1
x = -4
y = -17.5
persistent = 0

[State 800, Gravity]
type = Veladd
trigger1 = AnimElem = 1 > 0
y = .9

[State 3151, End]
type = EnvShake
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
trigger1 = AnimElem = 1 > 0
time = 25
ampl = 6

[State 3151, End]
type = SelfState
trigger1 = Pos Y >= 0
Trigger1 = Vel Y > 0
Trigger1 = AnimElem = 1 > 0
value = 5100

