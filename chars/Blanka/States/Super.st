; _________________________________________
;| Blanka by varo_hades                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<Direct Lightning>=
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
pos = ceil(20 * const(size.xScale)), ceil(-50 * const(size.yScale))
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

[State 3000, Voice 1]
type = PlaySnd
trigger1 = Time = 3
value = 3000,0
channel = 0

[State 3000, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3000,1
channel = 1

[State 3000, Spark]
type = Explod
trigger1 = AnimElem = 6 && !numExplod(6100)
Anim = 3010
id = 6100
pos = 0, -30
postype = p1
ownpal = 1
bindtime = -1
removetime = -1
sprpriority = 4
scale = 1.75,1.75
persistent=0
ignorehitpause=0

[State 3000,NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA
time = 56

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = time=0
stateType = A
physics = N

[State 3000, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem=6
attr = A, HA
damage = ceil(ifElse(fvar(11) * 200 < 7, 7, fvar(11) * 200)), 7
animtype = Hard
guardflag = M
hitflag = MAF
pausetime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -45
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -3.5,-7.5
guard.velocity = -9.5
air.velocity = -4.0,-3.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -22.0
fall = 1
air.fall = 1
yaccel = .5
fall.recover= 0
air.recover=0
getPower = 0,0
givePower = 36, 36
forcestand = 1
palfx.time = 44
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall
priority = 7,Hit
ID = 3000

[State 3000, State]
type = TargetState
trigger1 = movehit
value = 1050
ID = 3000
IgnoreHitPause = 1
Persistent = 0

[State 3000, 0]
type = EnvShake
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 12
ampl = 4
ignorehitpause=1

[State 3000,2]
type = PlayerPush
trigger1 = AnimElemTime(6)>=0 && P2statetype=L
value = 0

[State 3000,VelSet]
type = VelSet
trigger1 = AnimElemTime(6)>=0 && !movecontact && !movereversed
x = 10.0

[State 3000,VelSet]
type = VelSet
trigger1 = time= 78 || FrontEdgeBodyDist <10
x = 0

[State 3000,VelSet]
type = VelSet
trigger1 = movecontact || movereversed
x = -3.2
y = -9.15

[State 3000,Exit]
type = ChangeState
trigger1 = time= 78 || movecontact || movereversed || FrontEdgeBodyDist <10
value = 3010

;Landing
[Statedef 3010]
type = A
physics = N
ctrl = 0

[State 3010,StateTypeSet]
type = StateTypeSet
trigger1 = Anim=3000
movetype=A

[State 3010,VelMul]
type = VelSet
trigger1 = Anim=3000 && vel Y>0
x = Vel X*.75
persistent=0

[State 3010,PlaySnd]
type = PlaySnd
trigger1 = Anim=3000 && AnimElem = 3,=1
value = 1, 3

[State 3010,VelMul]
type = VelAdd
trigger1 = Anim=3000
y = .675

[State 3010,ChangeAnim]
type = ChangeAnim
trigger1 = Vel X && Vel Y>0 && Pos Y>=0
trigger2 = !Vel X && Anim=3000
value = 3050

[State 3010,VelMul]
type = VelSet
trigger1 = Anim=3050
x = 0
y = 0

[State 3010,StateTypeSet]
type = StateTypeSet
trigger1 = Anim=3050
statetype=S
movetype=I
physics=S

[State 3010,VelMul]
type = PosSet
trigger1 = Anim=3050
y = 0

[State 3010, PlaySnd]
type = PlaySnd
trigger1 = Anim=3050 && AnimElem=1
value = 52, 0

[State 3010, Landing Dust Explod]
type = Explod
trigger1 = Anim=3050 && AnimElem=1
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3010,Exit]
type = ChangeState
trigger1 = Anim=3050 && AnimTime=0
value = 11
ctrl = 1

;====<Max Direct Lightning>=
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
pos = ceil(20 * const(size.xScale)), ceil(-50 * const(size.yScale))
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

[State 3050, Voice 1]
type = PlaySnd
trigger1 = Time = 3
value = 3000,0
channel = 0

[State 3050, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3000,1
channel = 1

[State 3050, StateTypeSe]
type = StateTypeSet
trigger1 = AnimElem = 6
stateType = A
physics = N

[State 3050,NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA
time = 68

[State 3050,StateTypeSet]
type = StateTypeSet
trigger1 = time=0
statetype=A
physics=N

[State 3050, Spark]
type = Explod
trigger1 = AnimElem = 6 && !numExplod(6100)
Anim = 3010
id = 6100
pos = 0, -30
postype = p1
ownpal = 1
bindtime = -1
removetime = -1
sprpriority = 4
scale = 1.75,1.75
persistent=0
ignorehitpause=0

[State 3000, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem=6
attr = A, HA
damage = ceil(ifElse(fvar(11) * 350 < 7, 7, fvar(11) * 350)), 7
animtype = Hard
guardflag = M
hitflag = MAF
pausetime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -45
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -3.5,-7.5
guard.velocity = -9.5
air.velocity = -4.0,-3.5
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -22.0
fall = 1
air.fall = 1
yaccel = .5
fall.recover= 0
air.recover=0
getPower = 0,0
givePower = 36, 36
forcestand = 1
palfx.time = 44
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall
priority = 7,Hit
ID = 3050

[State 3000, State]
type = TargetState
trigger1 = movehit
value = 1050
ID = 3050
IgnoreHitPause = 1
Persistent = 0

[State 1000, 0]
type = EnvShake
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 12
ampl = 4
ignorehitpause=1

[State 900,2]
type = PlayerPush
trigger1 = AnimElemTime(6)>=0 && P2statetype=L
value = 0

[State 200,VelSet]
type = VelSet
trigger1 = AnimElemTime(6)>=0 && !movecontact && !movereversed
x = 15

[State 200,VelSet]
type = VelSet
trigger1 = time= 78 || FrontEdgeBodyDist <10
x = 0

[State 200,VelSet]
type = VelSet
trigger1 = movecontact || movereversed
x = -3.2
y = -9.15

[State 200,Exit]
type = ChangeState
trigger1 = time= 78 || movecontact || movereversed || FrontEdgeBodyDist <10
value = 3010

;====<Ground Shave Rolling>=
[StateDef 3100]
type = S
physics = N
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3100, Button Detected]
type = VarSet
Triggerall = PrevStateno != 3100
trigger1 = Time = 0
var(10) = ifelse((command="b"),1,ifelse((command="c"),2,0))
IgnoreHitPause = 1
Persistent = 1

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
pos = ceil(25 * const(size.xScale)), ceil(-50 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3600, 0
channel = 1

[State 3100,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2,=2
value = 1, 3

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3.5

[State 3100, Dust Helper]
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

[State 3100, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 14
value = 52,0
channel = 3

[State 3100, Landing Dust Expod]
type = Explod
trigger1 = AnimElem = 14
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3100,NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA
time = 56

[State 3100, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem=2
attr = A, HA
damage = ceil(ifElse(fvar(11) * 67 < 7, 7, fvar(11) * 67)), 7
animtype = Hard
guardflag = M
hitflag = MAF
pausetime = 1,2
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 83), var(36) := -45
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -2.0,-7.5
guard.velocity = -11.0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -22.0
air.velocity = -2.0,-7.5
air.cornerpush.veloff = 0
fall = 1
air.fall = 1
yaccel = .5
fall.recover= 0
air.recover=0
getPower = 0,0
givePower = 36, 36
forcestand = 1
priority = 7,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),40,ifelse(var(14),10,0))
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 3100, 0]
type = EnvShake
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 12
ampl = 4
ignorehitpause=1

[State 3100,2]
type = PlayerPush
trigger1 = AnimElemTime(6)>=0 && P2statetype=L
value = 0

[State 3100,StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem=2,=2
statetype=A
physics=N

[State 3100,VelSet]
type = VelSet
trigger1 = AnimElem=2,=2 && time<60
x = .5
y = -5.5*1.25

[State 3100,VelSet]
type = Veladd
trigger1 = AnimElemTime(2)>=2
y = .675*1.25

[State 3100,VelSet]
type = VelSet
trigger1 = time= 74
x = 0

[State 3100,Exit]
type = ChangeState
trigger1 = time= 74
value = 3105

;
[Statedef 3105]
type = S
movetype = A
physics = N
ctrl = 0
juggle = 15

[State 3105, 3]
type = EnvShake
trigger1 = Time = 0
time = 20
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 3105, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 3105, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3105,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2,=2
value = 1, 3

[State 52, 4]
type = ChangeState
trigger1 = !AILevel
trigger1 = command!="holda"&&command!="holdb"&&command!="holdc"
trigger2 = Time >= 320
trigger3 = AILevel
value = 3106

;
[Statedef 3106]
type = S
movetype = A
physics = N
juggle = 1
ctrl = 0
velset = 0,0
sprpriority = 2

[State 3106,PlaySnd]
type = PlaySnd
trigger1 = time=0
value = 3000, 0
channel = 1
persistent=0

[State 3106, NotHitby]
type = NotHitBy
trigger1 = Anim != 1150
value = SCA,AT
ignorehitpause=1

[State 3106, 3]
type = ChangeAnim
trigger1 = Anim != 1150
trigger1 = time >= 35
value = 1150

[State 3106];??????
type = VelSet
trigger1 = time = 0
x = ifelse(var(10)=1,8,ifelse(var(10)=0,5,12))

[State 3106];??????
type = VelSet
trigger1 = Anim = 1150
trigger1 = Animelem = 1
x = 0

[State 3106,?????]
Type = Varset
Trigger1 = time = 0
var(2) = 0
IgNoreHitPause = 1

[State 3106,?????]
Type = Varadd
trigger1 =movecontact = 1
var(2) = 1

[State 3106, Hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 = var(2) <= 4
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
guardflag = M
pausetime = 6,6
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 83), var(36) := -45
ground.type = H
ground.slidetime = 10
ground.hittime = 23
ground.velocity = -8,0
air.velocity = -5,-4
envshake.time = 20
envshake.freq = 120
envshake.ampl = -4
envshake.phase = 160
getpower = 0
givepower = 20
fall = 1
air.fall = 1
fall.recover = 0

[State 3106,***]
type = RemoveExplod
trigger1 = Anim = 1150
trigger1 = Animelem = 1
trigger2 = var(2) >= ifelse(var(10) = 2,6,ifelse(var(10) = 1,4,1))
id = 1010

[State 3106, 3]
type = StopSnd
trigger1 = Anim = 1150
trigger1 = Animelem = 1
trigger2 = var(2) >= ifelse(var(10) = 2,6,ifelse(var(10) = 1,4,1))
channel = 6

[State 3106, ??????]
type = ChangeState
trigger1 = var(2) >= 3
value = 3107

[State 3106, ??????]
type = ChangeState
trigger1 = Anim = 1150
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 3106,***]
type = RemoveExplod
trigger1 = Anim = 3050
trigger1 = Animelem = 1
id = 1010

[State 3106,***]
type = RemoveExplod
trigger1 = Anim = 3106
trigger1 = Animelem = 1
id = 1010

;
[Statedef 3107]
type = A
movetype = I
physics = A
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 3107

[State 640, ?????]
type = PlaySnd
trigger1 = Anim=3107 && AnimElem = 3,=1
value = 1, 3
channel = 1

[State 4];??????
type = VelSet
trigger1 = time = 0
x = -3
y = -11

[State 5];??????????????
type = gravity
trigger1 = 1

[State 7];??state???
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 10
value = 52

;====<MAX Ground Shave Rolling>=
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 3110
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3150, Button Detected]
type = VarSet
Triggerall = PrevStateno != 3100
trigger1 = Time = 0
var(10) = ifelse((command="c" && command="b"),2,ifelse((command="c" && command="a"),1,0))
IgnoreHitPause = 1
Persistent = 1

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
trigger1 = AnimElemTime(5) < 0
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
pos = ceil(25 * const(size.xScale)), ceil(-50 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3600, 0
channel = 1

[State 3150,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2,=2
value = 1, 3

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 3.5

[State 3150, Dust Helper]
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

[State 3150,“d‹C]
type = Explod
trigger1 = Animelem = 2
anim = 3150
id = 1010
pos = ceil(0*const(size.xscale)),ceil(-20*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0
ignorehitpause = 0

[State 3150, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 14
value = 52,0
channel = 3

[State 3150, Landing Dust Expod]
type = Explod
trigger1 = AnimElem = 14
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3150,NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA
time = 56

[State 3150, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem=2
attr = A, HA
damage = ceil(ifElse(fvar(11) * 67 < 7, 7, fvar(11) * 67)), 7
animtype = Hard
guardflag = M
hitflag = MAF
pausetime = 1,2
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 83), var(36) := -45
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -2.0,-7.5
guard.velocity = -11.0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -22.0
air.velocity = -2.0,-7.5
air.cornerpush.veloff = 0
fall = 1
air.fall = 1
yaccel = .5
fall.recover= 0
air.recover=0
getPower = 0,0
givePower = 36, 36
forcestand = 1
priority = 7,Hit
palfx.time = 40
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall = 1

[State 3150, 0]
type = EnvShake
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 12
ampl = 4
ignorehitpause=1

[State 3150,2]
type = PlayerPush
trigger1 = AnimElemTime(6)>=0 && P2statetype=L
value = 0

[State 3150,StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem=2,=2
statetype=A
physics=N

[State 3150,VelSet]
type = VelSet
trigger1 = AnimElem=2,=2 && time<60
x = .5
y = -5.5*1.25

[State 3150,VelSet]
type = Veladd
trigger1 = AnimElemTime(2)>=2
y = .675*1.25

[State 3150,VelSet]
type = VelSet
trigger1 = time= 74
x = 0

[State 3150,Exit]
type = ChangeState
trigger1 = time= 74
value = 3155

;
[Statedef 3155]
type = S
movetype = A
physics = N
ctrl = 0
juggle = 15

[State 3155, 3]
type = EnvShake
trigger1 = Time = 0
time = 20
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 3155, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 3155, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3155,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2,=2
value = 1, 3

[State 3155, 4]
type = ChangeState
trigger1 = !AILevel
trigger1 = command!="holda"&&command!="holdb"&&command!="holdc"
trigger2 = Time >= 320
trigger3 = AILevel
value = 3156

;
[Statedef 3156]
type = S
movetype = A
physics = N
juggle = 1
ctrl = 0
velset = 0,0
sprpriority = 2

[State 3156,PlaySnd]
type = PlaySnd
trigger1 = time=0
value = 3000, 0
channel = 1
persistent=0

[State 3156, NotHitby]
type = NotHitBy
trigger1 = Anim != 1150
value = SCA,AT
ignorehitpause=1

[State 3156, 3]
type = ChangeAnim
trigger1 = Anim != 1150
trigger1 = time >= 35
value = 1150

[State 3156];??????
type = VelSet
trigger1 = time = 0
x = ifelse(var(10)=1,8,ifelse(var(10)=0,5,12))

[State 3156];??????
type = VelSet
trigger1 = Anim = 1150
trigger1 = Animelem = 1
x = 0

[State 3156,?????]
Type = Varset
Trigger1 = time = 0
var(2) = 0
IgNoreHitPause = 1

[State 3156,?????]
Type = Varadd
trigger1 =movecontact = 1
var(2) = 1

[State 3156, Hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 = var(2) <= 5
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 7
guardflag = M
pausetime = 6,6
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 83), var(36) := -45
ground.type = H
ground.slidetime = 10
ground.hittime = 23
ground.velocity = -8,0
air.velocity = -5,-4
envshake.time = 20
envshake.freq = 120
envshake.ampl = -4
envshake.phase = 160
getpower = 0
givepower = 20
fall = 1
air.fall = 1
fall.recover = 0
palfx.time = 40
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall = 1

[State 3156,***]
type = RemoveExplod
trigger1 = Anim = 1150
trigger1 = Animelem = 1
trigger2 = var(2) >= 4
id = 1010

[State 3156, 3]
type = StopSnd
trigger1 = Anim = 1150
trigger1 = Animelem = 1
trigger2 = var(2) >= ifelse(var(10) = 2,6,ifelse(var(10) = 1,4,1))
channel = 6

[State 3156, ??????]
type = ChangeState
trigger1 = var(2) >= 4
value = 3107

[State 3156, ??????]
type = ChangeState
trigger1 = Anim = 1150
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<Shout of Thunder>=
[StateDef 3200]
type = S
physics = S
moveType = A
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
pos = ceil(0 * const(size.xScale)), ceil(-95 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, NotHitby]
type = NotHitBy
trigger1 = Anim = 3200
value = ,AP
ignorehitpause=1

[State -2, 3]
type = EnvShake
trigger1 = Anim = 3200
trigger1 = Animelem = 11||Animelem = 22||Animelem = 33
time = 20
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 3200, helper]
type = Explod
trigger1 = Anim = 3200
trigger1 = AnimElem = 21 && !numexplod(6000)
id = 6000
anim = 1005
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
removetime=30
sprpriority = 3
ignorehitpause = 1
persistent = 0

[State 3200, helper]
type = Explod
trigger1 = Anim = 3200
trigger1 = AnimElem = 33
id = 3220
anim = 1005
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
removetime=99999
sprpriority = 3
ignorehitpause = 1
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3210
id = 3210
pos = ceil(68*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3211
id = 3210
pos = ceil(128*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3212
id = 3210
pos = ceil(188*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3210
id = 3210
pos = ceil(248*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3211
id = 3210
pos = ceil(308*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3212
id = 3210
pos = ceil(368*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3210
id = 3210
pos = ceil(-52*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3211
id = 3210
pos = ceil(-112*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3212
id = 3210
pos = ceil(-172*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3210
id = 3210
pos = ceil(-232*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3211
id = 3210
pos = ceil(-292*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State 3200,??]
type = Explod
trigger1 = Anim = 3200
trigger1 = Animelem = 22
anim = 3212
id = 3210
pos = ceil(-352*const(size.xscale)),ceil(49*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = const(size.xscale),const(size.yscale)
persistent = 0

[State -3,?????]
Type = Varset
Trigger1 = time = 0
var(2) = 0
IgNoreHitPause = 1

[State -3,?????]
Type = Varadd
trigger1 =movecontact = 1
var(2) = 1

[State 210, 3]
type = PlayerPush
trigger1 =1
value = 0

[State 40, 3]
type = ChangeAnim
triggerall = Anim = 3200
trigger1 = time >= 140
trigger2 = var(2) > 9
value = 3201

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000, 0

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 14
value = 3300, 0

[State 3200, Hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = var(2) <= 9
attr = C, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7
hitflag = MP
guardflag = L
pausetime = 6,8
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1
guard.sparkNo = -1
sparkXY = -1
ground.type = H
ground.slidetime = 10
ground.hittime = 23
ground.velocity = 0
air.velocity = 0
envshake.time = 20
envshake.freq = 120
envshake.ampl = -13
envshake.phase = 160
palfx.time = 40
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall = 1
getpower = 0
givepower = 20
fall = ifelse(var(2) >= 9,1,0)
air.fall = 1
fall.recover = 0
forcestand = 1
guard.dist = 480

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 22
value = 3000, 1

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 34,=4
value = 3000, 1

[State 821, Spark]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helpertype=normal
stateno=ifElse(MoveGuarded, 8001, 8011)
ID=8000
name="Spark"
postype=p1
pos= ceil(P2Dist x), 0
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 700,***]
type = RemoveExplod
trigger1 = Anim = 3201
trigger1 = Animelem = 1
id = 3210

[State 700,***]
type = RemoveExplod
trigger1 = Anim = 3201
trigger1 = Animelem = 1
id = 3220

[State 3200, 3]
type = StopSnd
trigger1 = Anim = 3201
trigger1 = Animelem = 1
channel = 6

[State 3200, changestate]
type = ChangeState
trigger1 = Anim = 3201
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Finish
[StateDef 3201]
type = S
anim = 3201
physics = N
moveType = I
velSet = 0,0

[State 3201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Shout of Thunder>=
[StateDef 3250]
type = S
physics = S
moveType = A
anim = 3250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3250, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3250, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3250, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3250, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3250, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3250, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3250, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3250, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3250, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(0 * const(size.xScale)), ceil(-95 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3250, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3250, NotHitby]
type = NotHitBy
trigger1 = Anim = 3250
trigger1 = Animelem = 15,<= 0
value = SCA
ignorehitpause=1

[State 3250,??]
type = Explod
trigger1 = Anim = 3250
trigger1 = Animelem = 16
anim = 3305
id = 3210
pos = ceil(0*const(size.xscale)),ceil(0*const(size.yscale))
postype = p1
sprpriority = 3
ownpal = 1
bindtime = -1
removetime = 99999
removeongethit = 1
scale = 2*const(size.xscale),4*const(size.yscale)
persistent = 0
ignorehitpause = 0

[State 3250, ?????]
type = PlaySnd
trigger1 = time = 0
value = 3000, 0
channel = 0

[State 3250, ?????]
type = PlaySnd
trigger1 = Anim = 3250
trigger1 = Animelem = 16
value = 3300, 0
channel = 1

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 16,=4
value = 3000, 1

[State 3250, ?????]
type = PlaySnd
trigger1 = Anim = 3250
trigger1 = Animelem = 11
value = 52, 0
ignorehitpause = 1

[State 3250, 3]
type = EnvShake
trigger1 = Anim = 3250
trigger1 = Animelem = 11
time = 20
freq = 60
ampl = -4
phase = 90
ignorehitpause = 1

[State 3250,?????]
Type = Varset
Trigger1 = time = 0
var(2) = 0
IgNoreHitPause = 1

[State 3250,?????]
Type = Varadd
trigger1 =movecontact = 1
var(2) = 1

[State 3250, 3]
type = PlayerPush
trigger1 =1
value = 0

[State 3250, 3]
type = ChangeAnim
triggerall = Anim = 3250
trigger1 = time >= 140
trigger2 = var(2) > 9
value = 3251

[State 3250, Hitdef]
type = HitDef
trigger1 = var(2) <= 9
attr = S, HA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 7
hitflag = MAFP
guardflag = M
pausetime = 2,8
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1
guard.sparkNo = -1
sparkxy = -1
ground.type = H
ground.slidetime = 10
ground.hittime = 23
ground.velocity = -8,-10
air.velocity = -4,-10
envshake.time = 20
envshake.freq = 120
envshake.ampl = -13
envshake.phase = 160
palfx.time = 44
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall
getpower = 0
givepower = 20
fall = 1
air.fall = 1
fall.recover = 0
forcestand = 1

[State 821, Spark]
type=helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helpertype=normal
stateno=ifElse(MoveGuarded, 8001, 8011)
ID=8000
name="Spark"
postype=p1
pos= ceil(P2Dist x), ceil(P2Dist y-80)
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 3250,***]
type = RemoveExplod
trigger1 = Anim = 3251
trigger1 = Animelem = 1
id = 3210

[State 3250, ??????]
type = ChangeState
trigger1 = Anim = 3251
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<Shout of Earth>=
[StateDef 3300]
type = S
physics = N
moveType = A
anim = 3300
ctrl = 0
juggle = 15
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
pos = ceil(0 * const(size.xScale)), ceil(-95 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

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

[State 3300,NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA
time = 56

[State 3300,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3300, 0
channel = 1

[State 3300,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000, 0
loop=1
channel = 30

[State 3300, Spark]
type = Explod
trigger1 = AnimElem = 5 && !numExplod(6500)
Anim = 3305
id = 6500
pos = 0, -10
postype = p1
ownpal = 1
bindtime = -1
removetime = -1
sprpriority = 4
scale = 1.75,1.75
persistent=0
ignorehitpause=0

[State 3300,Hitdef 1]
type = HitDef
triggerall = !var(16) && var(15) < 1
triggerall = var(18)<6||var(56)
triggerall = var(2)<ifelse(ceil(var(46)/7)>2,6,ceil(var(46)/7)+4)
trigger1 = AnimElem=5
trigger2 = AnimElem=6
trigger3 = AnimElem=7
trigger4 = AnimElem=8
trigger5 = AnimElem=9
trigger6 = AnimElem=10
trigger7 = AnimElem=11
trigger8 = AnimElem=12
trigger9 = AnimElem=13
trigger10 = AnimElem=14
trigger11 = AnimElem=15
trigger12 = AnimElem=16
trigger13 = AnimElem=17
trigger14 = AnimElem=18
trigger15 = AnimElem=19
trigger16 = AnimElem=20
trigger17 = AnimElem=21
trigger18 = AnimElem=22
trigger19 = AnimElem=23
trigger20 = AnimElem=24
trigger21 = AnimElem=25
trigger22 = AnimElem=26
trigger23 = AnimElem=27
trigger24 = AnimElem=28
trigger25 = AnimElem=29
trigger26 = AnimElem=30
trigger27 = AnimElem=31
trigger28 = AnimElem=32
trigger29 = AnimElem=33
trigger30 = AnimElem=34
attr = S, HA
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
animtype = Hard
guardflag = M
hitflag = MAF
pausetime = floor(4/ifelse(var(56),2,1)),floor(3/ifelse(var(56),2,1))
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 146), var(36) := -80
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = 1,-8
guard.velocity = -8.25
air.velocity = 1,-8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;ifelse((fvar(23)-1)<0,0,-22.0)
air.cornerpush.veloff = 0
fall = 1
air.fall = 1
yaccel = .5
fall.recover= 0
air.recover=0
getPower = 0,0
givePower = 36, 36
forcestand = 1
palfx.time = 44
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall
priority = 7,Hit

[State 3300,Hitdef 2]
type = HitDef
triggerall = !var(16) && var(15) < 1
triggerall = var(18)<7||var(56)
trigger1 = AnimElem=44
attr = S, HA
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
animtype = Hard
guardflag = M
hitflag = MAF
pausetime = floor(4/ifelse(var(56),2,1)),floor(3/ifelse(var(56),2,1))
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 146), var(36) := -80
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -2,-10
guard.velocity = -8.25
air.velocity = -2,-10
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = ifelse((fvar(23)-1)<0,0,-22.0)
air.cornerpush.veloff = 0
fall = 1
air.fall = 1
yaccel = .5
fall.recover= 0
air.recover=0
getPower = 0,0
givePower = 36, 36
forcestand = 1
palfx.time = 44
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall
priority = 7,Hit

[State 3300,VarSet]
type = VarSet
trigger1 = 1
var(40) = ifelse((Abs(P2bodydist X)-10)<20,-20,-10)

[State 3300,VarSet]
type = VarSet
trigger1 = 1
var(41) = -65

[State 3300, 0]
type = EnvShake
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 12
ampl = 4*ifelse(time%2=1,-1,1)
ignorehitpause=1

[State 3300,VarSet]
type = Varset
trigger1 = time=0
var(2) = 0

[State 3300,VarSet]
type = VarAdd
trigger1 = Movecontact
var(2) = 1
ignorehitpause=1

[State 3300,VarSet]
type = MoveHitReset
trigger1 = Movecontact
persistent=1
ignorehitpause=1

[State 3300,Exit]
type = ChangeState
trigger1 = Animtime= 0
value = 0
ctrl=1

;====<MAX Shout of Earth>=
[StateDef 3350]
type = S
physics = N
moveType = A
anim = 3350
ctrl = 0
juggle = 15
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

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-95 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3350, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3350,NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA
time = 68

[State 3350,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3300, 0
channel = 1

[State 3350,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1000, 0
loop=1
channel = 30

[State 3350, Spark]
type = Explod
trigger1 = AnimElem = 5 && !numExplod(6500)
Anim = 3305
id = 6500
pos = 0, -10
postype = p1
ownpal = 1
bindtime = -1
removetime = -1
sprpriority = 4
scale = 1.75,1.75
persistent=0
ignorehitpause=0

[State 3350,Hitdef 1]
type = HitDef
triggerall = !var(16) && var(15) < 1
triggerall = var(18)<14||var(56)
triggerall = var(2)<ifelse(ceil(var(46)/7)>7,14,ceil(var(46)/7)+7)
trigger1 = AnimElem=5
trigger2 = AnimElem=6
trigger3 = AnimElem=7
trigger4 = AnimElem=8
trigger5 = AnimElem=9
trigger6 = AnimElem=10
trigger7 = AnimElem=11
trigger8 = AnimElem=12
trigger9 = AnimElem=13
trigger10 = AnimElem=14
trigger11 = AnimElem=15
trigger12 = AnimElem=16
trigger13 = AnimElem=17
trigger14 = AnimElem=18
trigger15 = AnimElem=19
trigger16 = AnimElem=20
trigger17 = AnimElem=21
trigger18 = AnimElem=22
trigger19 = AnimElem=23
trigger20 = AnimElem=24
trigger21 = AnimElem=25
trigger22 = AnimElem=26
trigger23 = AnimElem=27
trigger24 = AnimElem=28
trigger25 = AnimElem=29
trigger26 = AnimElem=30
trigger27 = AnimElem=31
trigger28 = AnimElem=32
trigger29 = AnimElem=33
trigger30 = AnimElem=34
attr = S, HA
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
animtype = Hard
guardflag = M
hitflag = MAF
pausetime = floor(4/ifelse(var(56),2,1)),floor(3/ifelse(var(56),2,1))
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 146), var(36) := -80
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = 1,-8
guard.velocity = -8.25
air.velocity = 1,-8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0;ifelse((fvar(23)-1)<0,0,-22.0)
air.cornerpush.veloff = 0
fall = 1
air.fall = 1
yaccel = .5
fall.recover= 0
air.recover=0
getPower = 0,0
givePower = 36, 36
forcestand = 1
palfx.time = 44
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall
priority = 7,Hit

[State 3350,Hitdef 2]
type = HitDef
triggerall = !var(16) && var(15) < 1
triggerall = var(18)<15||var(56)
trigger1 = AnimElem=44
attr = S, HA
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
animtype = Hard
guardflag = M
hitflag = MAF
pausetime = floor(4/ifelse(var(56),2,1)),floor(3/ifelse(var(56),2,1))
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 146), var(36) := -80
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -2,-10
guard.velocity = -8.25
air.velocity = -2,-10
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = ifelse((fvar(23)-1)<0,0,-22.0)
air.cornerpush.veloff = 0
fall = 1
air.fall = 1
yaccel = .5
fall.recover= 0
air.recover=0
getPower = 0,0
givePower = 36, 36
forcestand = 1
palfx.time = 44
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall
priority = 7,Hit

[State 3350,VarSet]
type = VarSet
trigger1 = 1
var(40) = ifelse((Abs(P2bodydist X)-10)<20,-20,-10)

[State 3350,VarSet]
type = VarSet
trigger1 = 1
var(41) = -65

[State 3350, 0]
type = EnvShake
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 12
ampl = 4*ifelse(time%2=1,-1,1)
ignorehitpause=1

[State 3350,VarSet]
type = Varset
trigger1 = time=0
var(2) = 0

[State 3350,VarSet]
type = VarAdd
trigger1 = Movecontact
var(2) = 1
ignorehitpause=1

[State 3350,VarSet]
type = MoveHitReset
trigger1 = Movecontact
persistent=1
ignorehitpause=1

[State 3350,Exit]
type = ChangeState
trigger1 = Animtime= 0
value = 0
ctrl=1

;====<Tropical Hazard>=
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

[State 3400, Button Detected]
type = VarSet
Triggerall = PrevStateno != 3400
trigger1 = Time = 0
var(10) = ifelse((command="b"),1,ifelse((command="c"),2,0))
IgnoreHitPause = 1
Persistent = 1

[State 3400, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3400, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3400, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3400, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3400, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3400, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3400, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3400,ChangeState]
type = ChangeState
trigger1 = AnimTIme = 0
value = 3401

;
[Statedef 3401]
type = A
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 3401

[State 3400, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 49
moveTime = 49
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3401,VelAdd]
type = VelAdd
trigger1 = time >= 0
y = -0.2

[State 3401,VelSet]
type = VelSet
trigger1 = time = 0
y = -8

[State 3401,ChangeState]
type = ChangeState
trigger1 = ScreenPos Y < 147
value = 3402

;
[Statedef 3402]
type = A
movetype= I
physics = N
ctrl = 0
velset = 0,0
anim = 3402

[State 3402, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3402, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(6 * const(size.xScale)), ceil(-16 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3402,VelAdd]
type = PosAdd
trigger1 = AnimElem = 1
y = -87

[State 3402,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3403

;
[Statedef 3403]
type = A
movetype= I
physics = N
ctrl = 0
velset = 0,0
anim = 3403

[State 3403,VarAdd]
type = VarAdd
trigger1 = time = 0
v = 11
value = 1

[State 3403,VarAdd]
type = VarAdd
trigger1 = 1
v = 12
value = -1

[State 3403,VarAdd]
type = VarAdd
triggerall = Command = "P_renda"
trigger1 = 1
v = 12
value = 15

[State 3403,VarRandom]
type = VarRandom
trigger1 = time = 0
v = 14
range = 0,4

[State 3403,Watermelon]
type = Helper
trigger1 = AnimElem = 5
ID = 4000
pos = (0+random%320),Floor(Pos Y-25)
postype = left
stateno = 4000
helpertype = normal
name = "Watermelon"
keyctrl = 0
ownpal = 1

[State 3403,EnvShake]
type = EnvShake
trigger1 = AnimElem = 5
time = 20
ampl = 5

[State 3403, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1, 3

[State 3403,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
trigger1 = Var(11) < 2
trigger1 = Var(12) > 10
value = 3403

[State 3403,ChangeState]
type = ChangeState
triggerall = AnimTime = 0
trigger1 = Var(11) >= 2
trigger2 = Var(12) < 10
value = 3404

;
[Statedef 3404]
type = A
movetype= A
physics = N
ctrl = 0
velset = 0,0
anim = 3404

[State 3404, PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = S3300, 0

[State 3404,HitDef]
type = HitDef
triggerall = UniqHitCount < 3
trigger1 = TimeMod = 1, 0
attr = A, HA
animtype = diagup
damage = ceil(ifElse(fvar(11) * 67 < 7, 7, fvar(11) * 67)), 7
priority = 5
hitflag = MAFD
guardflag = MA
pausetime = 5,6
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -3,-7
guard.velocity = -7
air.velocity = -3,-7
fall = 1
fall.recover = 0
air.recover = 0
recover = 0

[State 3404,PosFreeze]
type = PosFreeze
trigger1 = Movecontact= 1
trigger1 = HitPauseTime = 0
trigger1 = enemy,anim = 5030

[State 3404,PlaySnd]
type = PlaySnd
trigger1 = time = 1
persistent = 0
value = 1, 4
ignorehitpause = 1

[State 3404,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = Time = 17
x = 6
y = 3

[State 3404,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = Time = 17
x = 9
y = 3

[State 3404,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = Time = 17
x = 12
y = 3

[State 3404,VelAdd]
type = VelAdd
trigger1 = Time >= 17
trigger1 = HitShakeOver = 1
y = .5

[State 3404,VelSet]
type = VelSet
trigger1 = HitShakeOver = 0
y = 0

[State 3404,VarAdd]
type = VarAdd
trigger1 = UniqHitcount = 1
V = 15
value = 1
ignorehitpause = 1

[State 3404,PlaySnd]
type = PlaySnd
trigger1 = Vel Y > 0 && Pos Y >= 0
trigger1 = UniqHitCount = 0
persistent = 0
value = 2, 6
ignorehitpause = 1

[State 3404,ChangeState]
type = ChangeState
trigger1 = UniqHitCount >= 3
trigger2 = MoveGuarded = 1
value = 3405
ctrl = 0

[State 3404,End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3405

;
[Statedef 3405]
type = A
movetype = I
physics = S
velset = -5,-10
ctrl = 0

[State 3405, PlaySnd]
type = PlaySnd
trigger1 = TimeMod = 8, 0
value = 1, 3

[State 3405,Valadd]
type = Veladd
trigger1 = 1
x = -.3

[State 3405,Gravity]
type = Gravity
Trigger1 = 1

[State 3405,ChangeAnim]
type = ChangeAnim
trigger1 = AnimExist(3405)
trigger1 = Anim != 3405
value = 3405

[State 3004,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3406

;
[Statedef 3406]
type = S
movetype = I
physics = S
velset = 0,0
anim = 3406
ctrl = 0

[State 3406,Posset]
type = Posset
trigger1 = Time = 0
y = 0

[State 3100, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 52,0
channel = 0

[State 3406,AfterImageTime]
type = AfterImageTime
trigger1 = AnimTime = 0
time = 0

[State 3406, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;====<Max Tropical Hazard>=
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

[State 3450, Button Detected]
type = VarSet
Triggerall = PrevStateno != 3400
trigger1 = Time = 0
var(10) = ifelse((command="c" && command="b"),2,ifelse((command="c" && command="a"),1,0))
IgnoreHitPause = 1
Persistent = 1

[State 3450, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3450, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3450, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3450, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3450, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3450, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3450, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3450,ChangeState]
type = ChangeState
trigger1 = AnimTIme = 0
value = 3451

;
[Statedef 3451]
type = A
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 3401

[State 3451, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 49
moveTime = 49
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3451,VelAdd]
type = VelAdd
trigger1 = time >= 0
y = -0.2

[State 3451,VelSet]
type = VelSet
trigger1 = time = 0
y = -8

[State 3451,ChangeState]
type = ChangeState
trigger1 = ScreenPos Y < 147
value = 3452

;
[Statedef 3452]
type = A
movetype= I
physics = N
ctrl = 0
velset = 0,0
anim = 3402

[State 3452, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3452, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(6 * const(size.xScale)), ceil(-16 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3452,VelAdd]
type = PosAdd
trigger1 = AnimElem = 1
y = -87

[State 3452,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3453

;
[Statedef 3453]
type = A
movetype= I
physics = N
ctrl = 0
velset = 0,0
anim = 3403

[State 3453,VarAdd]
type = VarAdd
trigger1 = time = 0
v = 11
value = 1

[State 3453,VarAdd]
type = VarAdd
trigger1 = 1
v = 12
value = -1

[State 3453,VarAdd]
type = VarAdd
triggerall = Command = "P_renda"
trigger1 = 1
v = 12
value = 15

[State 3453,VarRandom]
type = VarRandom
trigger1 = time = 0
v = 14
range = 0,4

[State 3453,Watermelon]
type = Helper
trigger1 = AnimElem = 5
ID = 4000
pos = (0+random%320),Floor(Pos Y-25)
postype = left
stateno = 4000
helpertype = normal
name = "Watermelon"
keyctrl = 0
ownpal = 1

[State 3453,Watermelon]
type = Helper
trigger1 = AnimElem = 5
ID = 4000
pos = (0+random%320),Floor(Pos Y-25)
postype = left
stateno = 4000
helpertype = normal
name = "Watermelon"
keyctrl = 0
ownpal = 1

[State 3453,Watermelon]
type = Helper
trigger1 = AnimElem = 5
ID = 4000
pos = (0+random%320),Floor(Pos Y-25)
postype = left
stateno = 4000
helpertype = normal
name = "Watermelon"
keyctrl = 0
ownpal = 1

[State 3453,EnvShake]
type = EnvShake
trigger1 = AnimElem = 5
time = 20
ampl = 5

[State 3453, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1, 3

[State 3453,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
trigger1 = Var(11) < 2
trigger1 = Var(12) > 10
value = 3453

[State 3453,ChangeState]
type = ChangeState
triggerall = AnimTime = 0
trigger1 = Var(11) >= 2
trigger2 = Var(12) < 10
value = 3454

;
[Statedef 3454]
type = A
movetype= A
physics = N
ctrl = 0
velset = 0,0
anim = 3404

[State 3454, PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = S3300, 0

[State 3454,HitDef]
type = HitDef
triggerall = UniqHitCount < 5
trigger1 = TimeMod = 1, 0
attr = A, HA
animtype = diagup
damage = ceil(ifElse(fvar(11) * 67 < 7, 7, fvar(11) * 67)), 7
priority = 5
hitflag = MAFD
guardflag = MA
pausetime = 5,6
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -20
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -3,-7
guard.velocity = -7
air.velocity = -3,-7
fall = 1
fall.recover = 0
air.recover = 0
recover = 0

[State 3454,PosFreeze]
type = PosFreeze
trigger1 = Movecontact= 1
trigger1 = HitPauseTime = 0
trigger1 = enemy,anim = 5030

[State 3454,PlaySnd]
type = PlaySnd
trigger1 = time = 1
persistent = 0
value = 1, 4
ignorehitpause = 1

[State 3454,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = Time = 17
x = 6
y = 3

[State 3454,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = Time = 17
x = 9
y = 3

[State 3454,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = Time = 17
x = 12
y = 3

[State 3454,VelAdd]
type = VelAdd
trigger1 = Time >= 17
trigger1 = HitShakeOver = 1
y = .5

[State 3454,VelSet]
type = VelSet
trigger1 = HitShakeOver = 0
y = 0

[State 3454,VarAdd]
type = VarAdd
trigger1 = UniqHitcount = 1
V = 15
value = 1
ignorehitpause = 1

[State 3454,PlaySnd]
type = PlaySnd
trigger1 = Vel Y > 0 && Pos Y >= 0
trigger1 = UniqHitCount = 0
persistent = 0
value = 2, 6
ignorehitpause = 1

[State 3454,ChangeState]
type = ChangeState
trigger1 = UniqHitCount >= 5
trigger2 = MoveGuarded = 1
value = 3405
ctrl = 0

[State 3454,End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 3405

;====<Jungle Heat>=
[StateDef 3500]
type = S
physics = S
moveType = A
anim = 3503
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3500, Button Detected]
type = VarSet
Triggerall = PrevStateno != 3500
trigger1 = Time = 0
var(10) = ifelse((command="b"),1,ifelse((command="c"),2,0))
IgnoreHitPause = 1
Persistent = 1

[State 3500, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3500, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3500, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3500, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3500, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3500, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-95 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3500, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3300,0
channel = 3

[State 3500]
type = PlayerPush
trigger1 = AnimElemTime(6)>=0
value = 0

[State 3500]
type = StatetypeSet
trigger1 = AnimElem=6
statetype=A
physics = N

[State 3500,VelSet]
type = VelAdd
trigger1 = AnimElemTime(6)>=0
y = .675

[State 3500,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElem=6
x = 3
y = -10

[State 3500,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElem=6
x = 5
y = -10

[State 3500,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = AnimElem=6
x = 7
y = -10

[State 3501, 1]
type = HitDef
trigger1 = TIME=0
attr = S, HT
hitflag = M
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
sparkxy = -1
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 2
p1facing = 1
p2facing = 1
p1stateno = 3501
guard.dist = 0
numhits = 0
getpower = 0
givepower = 0

[State 3500,Exit]
type = ChangeState
trigger1 = time>=70
trigger1 = pos y >=0
value = 1250

[statedef 3501]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
sprpriority = 4
poweradd = 0
ctrl = 0
anim = 800

[State 3501, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3501, 1]
type = HitDef
trigger1 = TIME=0
attr = S, HT
hitflag = MAF
priority = 1, Miss
sparkno = -1
sprpriority = 2
p1facing = 1
p2facing = 1
p1stateno = 3502
p2stateno = 3504
guard.dist = 0
numhits = 0
getpower = 0
givepower = 0

[State 3501, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

[statedef 3502]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3501

[State 3502, Bind 3]
type = BindtoTarget
trigger1 = Anim=3501
pos = 30, 80,head

[State 3502, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2 || animelem = 5 || animelem = 8 || animelem = 11 || animelem = 14
trigger2 = animelem = 17 || animelem = 20 || animelem = 23 || animelem = 26 || animelem = 29
trigger3 = animelem = 32 || animelem = 35 || animelem = 38 || animelem = 41 || animelem = 44
trigger4 = animelem = 47 || animelem = 50 || animelem = 53
value = 820,0
volume = 0

[State 3502, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54
value = 800,1
volume = 0

[State 3502, Width]
type = Width
triggerall = Time = 0
trigger1 = FrontEdgeDist < 30
trigger2 = BackEdgeDist < 40
edge = 40,40

[State 3502, Screen Lock]
type = ScreenBound
trigger1 = 1
value = 0

[State 3502, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54
value = -10
kill = 0

[State 3502, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 57
value = -50
kill = 1
absolute = 1

[State 3502, HitAdd]
type = HitAdd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54 || animelem = 57
value = 1

[State 3502, EnvShake]
type = EnvShake
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54
time = 6
freq = 100
ampl = -9

[State 3502, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54
value = S800,3

[State 3502, Spark]
type=helper
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54
helpertype=normal
stateno=8015
ID=8000
name="Spark"
postype=p1
pos= ceil(40 * const(size.xscale)), ceil(-65 * const(size.yscale))
size.xScale = 0.5
size.yScale = 0.5
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 3502, Spark]
type=helper
trigger1 = animelem = 57
helpertype=normal
stateno=8015
ID=8000
name="Spark"
postype=p1
pos= ceil(40 * const(size.xscale)), ceil(-55 * const(size.yscale))
size.xScale = 0.5
size.yScale = 0.5
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 3502, PlaySnd]
type = PlaySnd
trigger1 = animelem = 57
value = 800,1
volume = -50

[State 3502, EnvShake]
type = EnvShake
trigger1 = animelem = 57
time = 40
freq = 140
ampl = -9

[State 3502, State End1]
type = ChangeState
trigger1 =  time = 260
value = 3503

[Statedef 3503]
type = A
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 812

[State 3503, Bind 3]
type = Targetbind
trigger1 = time=0
pos = 50, 0

[State 807, 1]
type = PosSet
Trigger1 = time=0
y = 0

[State 3503, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -45
kill = 1
absolute = 1

[State 3503,Exit]
type = PlaySnd
trigger1 = AnimElem=2
value = 2,5

[State 3503, 1]
type = PlaySnd
Trigger1 = AnimElem=3
value = 1,5

[State 3503, 1]
type = PlaySnd
Trigger1 = AnimElem=1
value = 1300,0

[State 812, Spark]
type=helper
trigger1= animelem=3
helpertype=normal
stateno=8013
ID=8000
name="Spark"
postype=p1
pos= ceil(60 * const(size.xscale)), ceil(-80 * const(size.yscale))
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 3503, HitAdd]
type = HitAdd
trigger1 = AnimElem=3
value = 1

[State 3503, Target State End1]
type = TargetState
trigger1 = AnimElem=4
value = 3506

[State 3503, 1]
type = ChangeState
Trigger1 = AnimTime=0
value = 0
ctrl = 1

[Statedef 3504]
type = A
movetype= H
physics = N
ctrl = 0
velset = 0,0

[State 3504, ChangeAnim]
type = ChangeAnim2
trigger1 = time = 0
value = 3502

[Statedef 3505]
type = A
movetype= H
physics = N
velset = 0,0

[State 3505, 1]
type = ChangeAnim2
Trigger1 = Time = 0
trigger2 = enemynear,Anim = 811
value = 3505

[State 3505, 1]
type = ChangeAnim2
Trigger1 = enemynear,Anim = 815
value = 3506

[State 3505, 1]
type = ChangeAnim2
Trigger1 = enemynear,Anim = 812
value = 3507

[Statedef 3506]
type = A
movetype= H
physics = N
velset = -2.0,-14.0

[State 3506, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 818

[State 3506, 1]
type = VelAdd
Trigger1 = 1
y = .50

[State 3506, 2]
type = SelfState
trigger1 = Pos Y>=0 && Vel Y>0
value = 5100

[Statedef 3507]
type = A
movetype= H
physics = N
velset = -1,-8.0

[State 3507, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 818

[State 3507, 1]
type = VelAdd
Trigger1 = 1
y = .2

[State 3507, 2]
type = SelfState
trigger1 = Pos Y>=0 && Vel Y>0
value = 5100

;====<Max Jungle Heat>=
[StateDef 3550]
type = S
physics = S
moveType = A
anim = 3503
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3550, Button Detected]
type = VarSet
Triggerall = PrevStateno != 3550
trigger1 = Time = 0
var(10) = ifelse((command="c" && command="b"),2,ifelse((command="c" && command="a"),1,0))
IgnoreHitPause = 1
Persistent = 1

[State 3550, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3550, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3550, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3550, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3550, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3550, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3550, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3550, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3550, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-95 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3550, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3550, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 3300,0
channel = 3

[State 3550]
type = PlayerPush
trigger1 = AnimElemTime(6)>=0
value = 0

[State 3550]
type = StatetypeSet
trigger1 = AnimElem=6
statetype=A
physics = N

[State 3550,VelSet]
type = VelAdd
trigger1 = AnimElemTime(6)>=0
y = .675

[State 3550,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElem=6
x = 3
y = -10

[State 3550,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElem=6
x = 5
y = -10

[State 3550,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = AnimElem=6
x = 7
y = -10

[State 3550, 1]
type = HitDef
trigger1 = TIME=0
attr = S, HT
hitflag = M
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
sparkxy = -1
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 2
p1facing = 1
p2facing = 1
p1stateno = 3551
guard.dist = 0
numhits = 0
getpower = 0
givepower = 0

[State 3550,Exit]
type = ChangeState
trigger1 = time>=70
trigger1 = pos y >=0
value = 1250

[statedef 3551]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
sprpriority = 4
poweradd = 0
ctrl = 0
anim = 800

[State 3551, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3551, 1]
type = HitDef
trigger1 = TIME=0
attr = S, HT
hitflag = MAF
priority = 1, Miss
sparkno = -1
sprpriority = 2
p1facing = 1
p2facing = 1
p1stateno = 3552
p2stateno = 3554
guard.dist = 0
numhits = 0
getpower = 0
givepower = 0

[State 3551, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

[statedef 3552]
type = A
movetype = A
physics = N
ctrl = 0
anim = 3501

[State 3552, Bind 3]
type = BindtoTarget
trigger1 = Anim=3501
pos = 30, 80,head

[State 3552, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2 || animelem = 5 || animelem = 8 || animelem = 11 || animelem = 14
trigger2 = animelem = 17 || animelem = 20 || animelem = 23 || animelem = 26 || animelem = 29
trigger3 = animelem = 32 || animelem = 35 || animelem = 38 || animelem = 41 || animelem = 44
trigger4 = animelem = 47 || animelem = 50 || animelem = 53
value = 820,0
volume = 0

[State 3552, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54
value = 800,1
volume = 0

[State 3552, Width]
type = Width
triggerall = Time = 0
trigger1 = FrontEdgeDist < 30
trigger2 = BackEdgeDist < 40
edge = 40,40

[State 3552, Screen Lock]
type = ScreenBound
trigger1 = 1
value = 0

[State 3552, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54
value = -10
kill = 0

[State 3552, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 57
value = -50
kill = 1
absolute = 1

[State 3552, HitAdd]
type = HitAdd
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54 || animelem = 57
value = 1

[State 3552, EnvShake]
type = EnvShake
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54
time = 6
freq = 100
ampl = -9

[State 3552, Spark]
type=helper
trigger1 = animelem = 3 || animelem = 6 || animelem = 9 || animelem = 12 || animelem = 15
trigger2 = animelem = 18 || animelem = 21 || animelem = 24 || animelem = 27 || animelem = 30
trigger3 = animelem = 33 || animelem = 36 || animelem = 39 || animelem = 42 || animelem = 45
trigger4 = animelem = 48 || animelem = 51 || animelem = 54
helpertype=normal
stateno=8015
ID=8000
name="Spark"
postype=p1
pos= ceil(40 * const(size.xscale)), ceil(-65 * const(size.yscale))
size.xScale = 0.5
size.yScale = 0.5
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 3552, Spark]
type=helper
trigger1 = animelem = 57
helpertype=normal
stateno=8015
ID=8000
name="Spark"
postype=p1
pos= ceil(40 * const(size.xscale)), ceil(-55 * const(size.yscale))
size.xScale = 0.5
size.yScale = 0.5
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 3552, PlaySnd]
type = PlaySnd
trigger1 = animelem = 57
value = 800,1
volume = -50

[State 3552, EnvShake]
type = EnvShake
trigger1 = animelem = 57
time = 40
freq = 140
ampl = -9

[State 3552, State End1]
type = ChangeState
trigger1 =  time = 260
value = 3553

[Statedef 3553]
type = A
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 812

[State 3553, Bind 3]
type = Targetbind
trigger1 = time=0
pos = 50, 0

[State 3553, 1]
type = PosSet
Trigger1 = time=0
y = 0

[State 3553, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 3
value = -25
kill = 1
absolute = 1

[State 3553,Exit]
type = PlaySnd
trigger1 = AnimElem=2
value = 2,5

[State 3553, 1]
type = PlaySnd
Trigger1 = AnimElem=3
value = 1,5

[State 3553, 1]
type = PlaySnd
Trigger1 = AnimElem=1
value = 1300,0

[State 3553, Spark]
type=helper
trigger1= animelem=3
helpertype=normal
stateno=8013
ID=8000
name="Spark"
postype=p1
pos= ceil(60 * const(size.xscale)), ceil(-80 * const(size.yscale))
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 3553, HitAdd]
type = HitAdd
trigger1 = AnimElem=3
value = 1

[State 3553, Target State End1]
type = TargetState
trigger1 = AnimElem=4
value = 3556

[State 3553, 1]
type = ChangeState
Trigger1 = AnimTime=0
value = 3560
ctrl = 1

[Statedef 3560]
type = A
movetype= I
physics = N
velset = 0,0
ctrl = 0
anim = 3500

[State 3560, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 5 || animelem = 11 || animelem = 15 || animelem = 18 || animelem = 24
trigger2 = animelem = 28 || animelem = 32 || animelem = 38 || animelem = 42 || animelem = 47
value = -10
kill = 1

[State 3560, HitAdd]
type = HitAdd
trigger1 = animelem = 5 || animelem = 11 || animelem = 15 || animelem = 18 || animelem = 24
trigger2 = animelem = 28 || animelem = 32 || animelem = 38 || animelem = 42 || animelem = 47
value = 1

[State 3552, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5 || animelem = 11 || animelem = 15 || animelem = 18 || animelem = 24
trigger2 = animelem = 28 || animelem = 32 || animelem = 38 || animelem = 42 || animelem = 47
value = 2,2
volume = 0

[State 3552, PlaySnd]
type = PlaySnd
trigger1 = animelem = 45
value = 4,4
volume = 0

[State 3560, Spark]
type=helper
trigger1 = animelem = 5 || animelem = 11 || animelem = 15 || animelem = 18 || animelem = 24
trigger2 = animelem = 28 || animelem = 32 || animelem = 38 || animelem = 42 || animelem = 47
helpertype=normal
stateno=8013
ID=8000
name="Spark"
postype=p1
pos= ceil(50 * const(size.xscale)), ceil(-65 * const(size.yscale))
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 3560,VelSet]
type = VelSet
trigger1 = AnimElem=1
y = -5

[State 3560,VelSet]
type = VelSet
trigger1 = AnimElem=3
y = 0

[State 3560, Gravity]
type = Gravity
trigger1 = Time >= 160

[State 3560, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

[Statedef 3554]
type = A
movetype= H
physics = N
ctrl = 0
velset = 0,0

[State 3504, ChangeAnim]
type = ChangeAnim2
trigger1 = time = 0
value = 3502

[Statedef 3555]
type = A
movetype= H
physics = N
velset = 0,0

[State 3555, 1]
type = ChangeAnim2
Trigger1 = Time = 0
trigger2 = enemynear,Anim = 811
value = 3505

[State 3555, 1]
type = ChangeAnim2
Trigger1 = enemynear,Anim = 815
value = 3506

[State 3555, 1]
type = ChangeAnim2
Trigger1 = enemynear,Anim = 812
value = 3507

[Statedef 3556]
type = A
movetype= H
physics = N
velset = 0,0

[State 3560,VelSet]
type = VelSet
trigger1 = time=0
y = -2

[State 3560,VelSet]
type = VelSet
trigger1 = time=15
y = 0

[State 3556, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3504

[State 3556, Gravity]
type = Gravity
trigger1 = Time >= 160

[State 3556, 2]
type = SelfState
trigger1 = Vel Y>0
value = 5100

[Statedef 3557]
type = A
movetype= H
physics = N
velset = -1,-8.0

[State 3557, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 818

[State 3557, 1]
type = VelAdd
Trigger1 = 1
y = .2

[State 3557, 2]
type = SelfState
trigger1 = Pos Y>=0 && Vel Y>0
value = 5100
