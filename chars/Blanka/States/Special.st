; _________________________________________
;| Blanka by varo_hades                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<Electric Thunder>==
[StateDef 1000]
type = S
physics = S
moveType = A
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "x", 0, ifElse(command = "y", 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1020, ifElse(var(10) = 1, 1010, 1000))

[State 1000, Voice]
type = PlaySnd
triggerall = Anim= 1000
trigger1 = AnimElem = 3
value = 1000, 0
loop = 1
channel = 30
persistent=0

[State 1000, Effect]
type = PlaySnd
triggerall = Anim=1000
trigger1 = AnimElemtime(4)=1
value = 4, 4
channel = 1

[State 1000, Voice]
type = StopSnd
trigger1 = Anim=1050
channel = 1

[State 1000, Voice]
type = PlaySnd
triggerall = Anim=1010
trigger1 = AnimElem = 4
value = 1000, 1
channel = 30
loop = 1
persistent=0

[State 1000, Effect]
type = PlaySnd
triggerall = Anim=1010
trigger1 = AnimElem = 6,=0
;trigger2 = AnimElem = 14,=0
value = 4, 4
channel = 1

[State 1000, Voice]
type = StopSnd
trigger1 = Anim=1050
channel = 1

[State 1000, sound]
type = PlaySnd
triggerall = Anim=1020
trigger1 = AnimElem = 5
value = 1000, 2
channel = 30
loop = 1
persistent=0

[State 1000, Voice]
type = PlaySnd
triggerall = Anim=1020
trigger1 = AnimElemtime(8)=1
value = 4, 4
channel = 1

[State 1000, Voice]
type = StopSnd
trigger1 = Anim=1050
channel = 1

[State 1000, helper]
type = RemoveExplod
triggerall = numexplod(6000)
trigger1 = Time=0
trigger2 = Anim=1050
id = 6000

[State 1000, helper]
type = Explod
trigger1 = AnimElem = 3 && !numexplod(6000)
id = 6000
anim = 1005
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
removetime=-1
sprpriority = 2
ignorehitpause = 1
persistent = 0

[State 1000, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 0
trigger1 = Animelem = 3||Animelem = 5
attr = S, SA
animtype = H
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
guardflag = M
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 76), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = H
ground.hitTime = 10 + 3 * var(10)
ground.slideTime = 15 + 3 * var(10)
ground.velocity = -3,-6
air.velocity = -2,-1.2
envshake.time = 20
envshake.freq = 120
envshake.ampl = -18
envshake.phase = 120
fall = 1
air.fall = 1
fall.recover = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palfx.time = 40
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall = 1
ID = 1000

[State 1000, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 1
trigger1 = Animelem = 4||Animelem = 6||Animelem = 8||Animelem = 10||Animelem = 12||Animelem = 14
attr = S, SA
animtype = H
damage = ceil(ifElse(fvar(11) * 110 < 7, 7, fvar(11) * 110)), 7
guardflag = M
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 76), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = H
ground.hitTime = 10 + 3 * var(10)
ground.slideTime = 15 + 3 * var(10)
ground.velocity = -3,-6
air.velocity = -2,-1.2
envshake.time = 20
envshake.freq = 120
envshake.ampl = -18
envshake.phase = 120
fall = 1
air.fall = 1
fall.recover = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palfx.time = 40
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall = 1
ID = 1000

[State 1000, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 2
trigger1 = Animelem = 5||Animelem = 7
attr = S, SA
animtype = H
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
guardflag = M
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 76), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = H
ground.hitTime = 10 + 3 * var(10)
ground.slideTime = 15 + 3 * var(10)
ground.velocity = -3,-6
air.velocity = -2,-1.2
envshake.time = 20
envshake.freq = 120
envshake.ampl = -18
envshake.phase = 120
fall = 1
air.fall = 1
fall.recover = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palfx.time = 40
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall = 1
ID = 1000

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1000, State]
type = TargetState
trigger1 = movehit
value = 1050
ID = 1000
IgnoreHitPause = 1
Persistent = 0

[State 1000, End]
type = ChangeState
trigger1 = var(46) <= 0
value = 1040


;Recover
[Statedef 1040]
type = S
physics = N
moveType = I
anim = 1050
ctrl = 0
sprPriority = 1
moveHitPersist = 1

[State 1102, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;
[Statedef 1050]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0
sprpriority = 2

[State 1050, NotHitby]
type = NotHitBy
trigger1 = 1
value = SCA
ignorehitpause=1

[State 1050, 3]
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(9010)
value = 9010

[State 1050, 3]
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(7695)
value = 9010

[State 1050, 3]
type = ChangeAnim
trigger1 = time = 0
trigger1 = !SelfAnimExist(9010)&&!SelfAnimExist(7695)
value = 5030

[State 1050,00]
type = Palfx
trigger1 = time = 0
trigger1 = !SelfAnimExist(9010)&&!SelfAnimExist(7695)
mul = 200,200,200
add = 250,250,0
sinadd = 200, 200, 200,4
invertall = 1
time = 40

[State 1050]
type = velset
trigger1 = time = 20
x = -3
y = -6

[State 1050]
type = gravity
trigger1 = time >= 20

[State 1050, State]
type = selfState
trigger1 = Vel Y > 0 && Pos Y >= 10
value = 5100

;====<Ex Electric Thunder>=
[StateDef 1030]
type = S
physics = N
moveType = A
anim = 1010
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 24

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1030, sound]
type = PlaySnd
triggerall = Anim=1010
trigger1 = AnimElem = 5
value = 1000, 2
channel = 30
loop = 1
persistent=0

[State 1030, Voice]
type = PlaySnd
triggerall = Anim=1010
trigger1 = AnimElemtime(4)=1 || AnimElemtime(8)=1 || AnimElemtime(12)=1
value = 4,4
channel = 1

[State 1030, Voice]
type = StopSnd
trigger1 = Anim=1050
channel = 1

[State 1030, Explod]
type = Explod
trigger1 = time = 0
anim = 1005
ID = 6000
pos = 0,0
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
supermovetime = 500
scale = 1,1
sprpriority = 4
ignorehitpause = 1
removeongethit= 1
persistent = 0

[State 1030, RemoveExplod]
type = RemoveExplod
trigger1 = time > 44
id = 6000
ignorehitpause = 0

[State 1030, Hitdef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Animelem = 4||Animelem = 6||Animelem = 8||Animelem = 10||Animelem = 12||Animelem = 14
attr = S, SA
animtype = H
damage = ceil(ifElse(fvar(11) * 150 < 7, 7, fvar(11) * 150)), 7
guardflag = M
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 76), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = H
ground.hitTime = 10 + 3 * var(10)
ground.slideTime = 15 + 3 * var(10)
ground.velocity = -3,-6
air.velocity = -2,-1.2
envshake.time = 20
envshake.freq = 120
envshake.ampl = -18
envshake.phase = 120
fall = 1
air.fall = 1
fall.recover = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palfx.time = 40
palfx.mul = 200,200,200
palfx.add = 250,250,0
palfx.color = 0
palfx.invertall = 1
ID = 1030

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(5) = 0
value = 30,0

[State 1000, State]
type = TargetState
trigger1 = movehit
value = 1050
ID = 1030
IgnoreHitPause = 1
Persistent = 0

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Rolling Attack>=
[StateDef 1100]
type = S
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "z", 2, ifElse(command = "y", 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 1100,StateTypeSet]
type = StateTypeSet
trigger1 = time=0
statetype=A
physics=N

[State 1100,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, 4
channel = 1

[State 1100,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3,=1
value = 1, 3

[State 1100, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 0
trigger1 = AnimElem=3
attr = A, SA
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -11.0
guard.velocity = -8.5
air.velocity = -5.0,-6.0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = -22.0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(12*1.0/2)))<0,0,-22.0)
yaccel = .5
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
air.fall = 1
priority = 5,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),ifelse(P2statetype=A,40,24),ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 1
trigger1 = AnimElem=3
attr = A, SA
damage = ceil(ifElse(fvar(11) * 110 < 7, 7, fvar(11) * 110)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -11.0
guard.velocity = -8.5
air.velocity = -5.0,-6.0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = -22.0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(13*1.0/2)))<0,0,-22.0)
yaccel = .5
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
air.fall = 1
priority = 5,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),ifelse(P2statetype=A,40,24),ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1100, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 2
trigger1 = AnimElem=3
attr = A, SA
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -11.0
guard.velocity = -8.5
air.velocity = -5.0,-6.0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = -22.0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(14*1.0/2)))<0,0,-22.0)
yaccel = .5
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
air.fall = 1
priority = 5,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),ifelse(P2statetype=A,40,24),ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1100, 0]
type = EnvShake
trigger1 = var(10) = 0
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 1100,2]
type = PlayerPush
trigger1 = var(10) = 0
trigger1 = AnimElemTime(2)>=0 && P2statetype=L
value = 0

[State 1100,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElemTime(2)>=0 && !movecontact && !movereversed
x = 6.0

[State 1100,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time=22 || FrontEdgeBodyDist <10
x = 0

[State 1100,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = movecontact || movereversed
x = ifelse(moveguarded,-2.2,-3.2)
y = -10.35

[State 1100,Exit]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = time=22 || movecontact || movereversed || FrontEdgeBodyDist <10
value = 1150

[State 1000, 0]
type = EnvShake
trigger1 = var(10) = 1
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 900,2]
type = PlayerPush
trigger1 = var(10) = 1
trigger1 = AnimElemTime(2)>=0 && P2statetype=L
value = 0

[State 200,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElemTime(2)>=0 && !movecontact && !movereversed
x = 8.0

[State 200,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time=28 || FrontEdgeBodyDist <10
x = 0

[State 200,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = movecontact || movereversed
x = ifelse(moveguarded,-2.2,-3.2)
y = -10.35

[State 200,Exit]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = time=28 || movecontact || movereversed || FrontEdgeBodyDist <10
value = 1150

[State 1000, 0]
type = EnvShake
trigger1 = var(10) = 2
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 900,2]
type = PlayerPush
trigger1 = var(10) = 2
trigger1 = AnimElemTime(2)>=0 && P2statetype=L
value = 0

[State 200,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = AnimElemTime(2)>=0 && !movecontact && !movereversed
x = 10.0

[State 200,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time=34 || FrontEdgeBodyDist <10
x = 0

[State 200,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = movecontact || movereversed
x = ifelse(moveguarded,-2.2,-3.2)
y = -10.35

[State 200,Exit]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = time=34 || movecontact || movereversed || FrontEdgeBodyDist <10
value = 1150

;
[Statedef 1150]
type = A
physics = N
ctrl = 0

[State 1150,StateTypeSet]
type = StateTypeSet
trigger1 = Anim!=1150
movetype=A

[State 1150, Landing Dust Explod]
type = Explod
trigger1 = Vel X && Vel Y>0 && Pos Y>=0
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1150,VelMul]
type = VelSet
trigger1 = Anim!=1150 && vel Y>0
x = Vel X*.75
persistent=0

[State 1150,PlaySnd]
type = PlaySnd
trigger1 = Anim!=1150 && AnimElem = 3,=1
value = 1, 3

[State 1150,VelMul]
type = VelAdd
trigger1 = Anim!=1150
y = .675

[State 1150,ChangeAnim]
type = ChangeAnim
trigger1 = Vel X && Vel Y>0 && Pos Y>=0
trigger2 = !Vel X && Anim!=1150
value = 1150

[State 1150,VelMul]
type = VelSet
trigger1 = Anim=1150
x = 0
y = 0

[State 1150,StateTypeSet]
type = StateTypeSet
trigger1 = Anim=1150
statetype=S
movetype=I
physics=S

[State 1150,VelMul]
type = PosSet
trigger1 = Anim=1150
y = 0

[State 1150, PlaySnd]
type = PlaySnd
trigger1 = Anim=1150 && AnimElem=1
value = 52, 0

[State 1150,Exit]
type = ChangeState
trigger1 = Anim=1150 && AnimTime=0
value = 11
ctrl = 1

;====<Ex Rolling Attack>=
[StateDef 1130]
type = S
physics = N
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 41

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1130,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, 4
channel = 1

[State 1130,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3,=1
value = 1, 3

[State 1130, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 3
stateType = A
physics = N

[State 1130, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time > 0
attr = S,SA
damage = ceil(ifElse(fvar(11) * 150 < 7, 7, fvar(11) * 150)), 7
animtype = hard
guardflag = HA
hitflag = MAF
priority = 7, Hit
pausetime = ifElse(var(20), 3.5, 7), ifElse(var(20), 4, 8)
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -7,-3
air.type = High
air.velocity = -12,10
air.fall = 1
air.hittime = 25
fall=1
fall.recover = 0
ground.cornerpush.veloff= -10
getpower = 0
givePower = 36, 36
envshake.freq = 80
envshake.ampl = -5
envshake.time = 20

[State 1130,VelSet]
type = VelSet
trigger1 = AnimElemTime(2)>=0 && !movecontact
x = 13.0

[State 1130,VelSet]
type = VelSet
trigger1 = time=38 || FrontEdgeBodyDist <=0
x = 0

[State 1130,VelSet]
type = VelSet
trigger1 = hitcount || moveguarded
x = -4.2
y = -11.90

[State 1130,Exit]
type = ChangeState
trigger1 = time=38 || hitcount || FrontEdgeBodyDist <= 0 || moveguarded
value = 1150

;====<Backstep Rolling>=
[StateDef 1200]
type = S
physics = S
moveType = A
juggle = 15
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "c", 2, ifElse(command = "b", 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1220, ifElse(var(10) = 1, 1210, 1200))

[State 1200,StateTypeSet]
type = StateTypeSet
trigger1 = time=0
statetype=A
physics=N

[State 1200,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1200, 0
channel = 1

[State 1200,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 10,=1
value = 1, 3

[State 1200, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 0
trigger1 = AnimElem=10
attr = A, SA
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -3.0,-6.0
guard.velocity = -8.5
air.velocity = -3.0,-6.0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(13*1.0/2)))<0,0,-22.0)
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
fall = 1
air.fall = 1
priority = 7,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),40,ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1200, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 1
trigger1 = AnimElem=10
attr = A, SA
damage = ceil(ifElse(fvar(11) * 110 < 7, 7, fvar(11) * 110)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -3.0,-6.0
guard.velocity = -8.5
air.velocity = -3.0,-6.0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(14*1.0/2)))<0,0,-22.0)
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
fall = 1
air.fall = 1
priority = 7,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),40,ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1200, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 2
trigger1 = AnimElem=10
attr = A, SA
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -3.0,-6.0
guard.velocity = -8.5
air.velocity = -3.0,-6.0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(15*1.0/2)))<0,0,-22.0)
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
fall = 1
air.fall = 1
priority = 7,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),40,ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1200,VelSet]
type = VelAdd
trigger1 = AnimElemTime(2)>=0 && AnimElemTime(5)<0
trigger2 = AnimElemTime(7)>=0
y = .675

[State 1200, 0]
type = EnvShake
trigger1 = var(10) = 0
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 1200,2]
type = PlayerPush
trigger1 = var(10) = 0
trigger1 = AnimElemTime(7)>=0 && P2statetype=L
value = 0

[State 1200,2]
type = StatetypeSet
trigger1 = var(10) = 0
trigger1 = AnimElem=2
trigger2 = AnimElem=7
statetype=A
physics = N

[State 1200,2]
type = StatetypeSet
trigger1 = var(10) = 0
trigger1 = AnimElem=5
statetype=S
physics = S

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElem=2
x = -4.0
y = -4.0

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElem=7
x = 5.0
y = -9.0

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time=48
trigger2 = AnimElem=5
x = 0
y = 0

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = movecontact
x = -3.2
y = -7.35

[State 1200,Exit]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = time=48 || movecontact
value = 1250

[State 1200, 0]
type = EnvShake
trigger1 = var(10) = 1
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 1200,2]
type = PlayerPush
trigger1 = var(10) = 1
trigger1 = AnimElemTime(2)>=0 && P2statetype=L
value = 0

[State 1200,2]
type = StatetypeSet
trigger1 = var(10) = 1
trigger1 = AnimElem=2
trigger2 = AnimElem=7
statetype=A
physics = N

[State 1200,2]
type = StatetypeSet
trigger1 = var(10) = 1
trigger1 = AnimElem=5
statetype=S
physics = S

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElem=2
x = -4.0
y = -4.0

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElem=7
x = 5.5
y = -9.5

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time=49
trigger2 = AnimElem=5
x = 0
y = 0

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = movecontact
x = -3.2
y = -7.35

[State 1200,Exit]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = time=49 || movecontact
value = 1250

[State 1200, 0]
type = EnvShake
trigger1 = var(10) = 2
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 1200,2]
type = PlayerPush
trigger1 = var(10) = 2
trigger1 = AnimElemTime(2)>=0 && P2statetype=L
value = 0

[State 1200,2]
type = StatetypeSet
trigger1 = var(10) = 2
trigger1 = AnimElem=2
trigger2 = AnimElem=7
statetype=A
physics = N

[State 1200,2]
type = StatetypeSet
trigger1 = var(10) = 2
trigger1 = AnimElem=5
statetype=S
physics = S

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = AnimElem=2
x = -4.0
y = -4.0

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = AnimElem=7
x = 6.0
y = -10.0

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time=50
trigger2 = AnimElem=5
x = 0
y = 0

[State 1200,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = movecontact
x = -3.2
y = -7.35

[State 1200,Exit]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = time=50 || movecontact
value = 1250

;
[Statedef 1250]
type = A
physics = N
ctrl = 0

[State 1250,StateTypeSet]
type = StateTypeSet
trigger1 = Anim!=1250
movetype=A

[State 1250, Landing Dust Explod]
type = Explod
trigger1 = Vel X && Vel Y>0 && Pos Y>=0
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1250,VelMul]
type = VelSet
trigger1 = Anim!=1250 && vel Y>0
x = Vel X*.75
persistent=0

[State 1250,PlaySnd]
type = PlaySnd
trigger1 = Anim!=1250 && AnimElem = 10,=1
value = 1, 3

[State 1250,VelMul]
type = VelAdd
trigger1 = Anim!=1250
y = .675

[State 1250,ChangeAnim]
type = ChangeAnim
trigger1 = Vel X && Vel Y>0 && Pos Y>=0
trigger2 = !Vel X && Anim!=1250
value = 1250

[State 1250,VelMul]
type = VelSet
trigger1 = Anim=1250
x = 0
y = 0

[State 1250,StateTypeSet]
type = StateTypeSet
trigger1 = Anim=1250
statetype=S
movetype=I
physics=S

[State 1250,VelMul]
type = PosSet
trigger1 = Anim=1250
y = 0

[State 1250, PlaySnd]
type = PlaySnd
trigger1 = Anim=1250 && AnimElem=1
value = 52, 0

[State 1250,Exit]
type = ChangeState
trigger1 = Anim=1250 && AnimTime=0
value = 11
ctrl = 1

;====<Ex Backstep Rolling>=
[StateDef 1230]
type = S
physics = N
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1230, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1230, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1230, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 41

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230,StateTypeSet]
type = StateTypeSet
trigger1 = time=0
statetype=A
physics=N

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1200,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1200, 0
channel = 1

[State 1200,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 10,=1
value = 1, 3

[State 1230, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem=10
attr = A, SA
damage = ceil(ifElse(fvar(11) * 150 < 7, 7, fvar(11) * 150)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -3.0,-6.0
guard.velocity = -8.5
air.velocity = -3.0,-6.0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(16*1.0/2)))<0,0,-22.0)
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
fall = 1
air.fall = 1
priority = 7,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),40,ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1230,VelSet]
type = VelAdd
trigger1 = AnimElemTime(2)>=0 && AnimElemTime(5)<0
trigger2 = AnimElemTime(7)>=0
y = .775

[State 1230, 0]
type = EnvShake
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 1230,2]
type = PlayerPush
trigger1 = AnimElemTime(2)>=0 && P2statetype=L
value = 0

[State 1230,2]
type = StatetypeSet
trigger1 = AnimElem=2
trigger2 = AnimElem=7
statetype=A
physics = N

[State 1230,2]
type = StatetypeSet
trigger1 = AnimElem=5
statetype=S
physics = S

[State 1230,VelSet]
type = VelSet
trigger1 = AnimElem=2
x = -4.0
y = -4.0

[State 1230,VelSet]
type = VelSet
trigger1 = AnimElem=7
x = 9.0
y = -11.0

[State 1230,VelSet]
type = VelSet
trigger1 = time=50
trigger2 = AnimElem=5
x = 0
y = 0

[State 1230,VelSet]
type = VelSet
trigger1 = movecontact
x = -3.2
y = -7.35

[State 1230,Exit]
type = ChangeState
trigger1 = time=50 || movecontact
value = 1250

;====<Vertical Rolling>=
[StateDef 1300]
type = S
physics = S
moveType = A
juggle = 15
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse(command = "c", 2, ifElse(command = "b", 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 1300,StateTypeSet]
type = StateTypeSet
trigger1 = time=0
statetype=A
physics=N

[State 1300,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1300, 0
channel = 1

[State 1300,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3,=1
value = 1, 3

[State 1300,Hitdef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 0
trigger1 = AnimElem=3
attr = A, SA
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -9.5
guard.velocity = -9.5
ground.cornerpush.veloff = -22.0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(12*1.0/2)))<0,0,-22.0)
air.velocity = -3.0,-7.0
air.cornerpush.veloff = 0
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
air.fall = 1
priority = 7,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),40,ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1300,Hitdef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 1
trigger1 = AnimElem=3
attr = A, SA
damage = ceil(ifElse(fvar(11) * 110 < 7, 7, fvar(11) * 110)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -9.5
guard.velocity = -9.5
ground.cornerpush.veloff = -22.0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(13*1.0/2)))<0,0,-22.0)
air.velocity = -3.0,-7.0
air.cornerpush.veloff = 0
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
air.fall = 1
priority = 7,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),40,ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1300,Hitdef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 2
trigger1 = AnimElem=3
attr = A, SA
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -9.5
guard.velocity = -9.5
ground.cornerpush.veloff = -22.0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(14*1.0/2)))<0,0,-22.0)
air.velocity = -3.0,-7.0
air.cornerpush.veloff = 0
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
air.fall = 1
priority = 7,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),40,ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1300, 0]
type = EnvShake
trigger1 = var(10) = 0
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 1300,2]
type = PlayerPush
trigger1 = var(10) = 0
trigger1 = AnimElemTime(2)>=0 && P2statetype=L
value = 0

[State 1300,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = AnimElemTime(2)>=0 && !movecontact
x = 4.0
y = -7.2

[State 1300,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time=15
x = 0
y = 0

[State 1300,VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = movecontact
x = -2.2
y = -10.35

[State 1300,Exit]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = movecontact
value = 1340

[State 1300,Exit]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = time=15
value = 1350

[State 1300, 0]
type = EnvShake
trigger1 = var(10) = 1
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 1300,2]
type = PlayerPush
trigger1 = var(10) = 1
trigger1 = AnimElemTime(2)>=0 && P2statetype=L
value = 0

[State 1300,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = AnimElemTime(2)>=0 && !movecontact
x = 9.0
y = -8.2

[State 1300,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time=14
x = 0
y = 0

[State 1300,VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = movecontact
x = -2.2
y = -10.35

[State 1300,Exit]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = movecontact
value = 1340

[State 1300,Exit]
type = ChangeState
trigger1 = var(10) = 1
trigger1 = time=14
value = 1350

[State 1300, 0]
type = EnvShake
trigger1 = var(10) = 2
trigger1 = numtarget
trigger1 = movecontact=1 && target,time=0
time = 8
ampl = 2
ignorehitpause=1

[State 1300,2]
type = PlayerPush
trigger1 = var(10) = 2
trigger1 = AnimElemTime(2)>=0 && P2statetype=L
value = 0

[State 1300,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = AnimElemTime(2)>=0 && !movecontact
x = 15.0
y = -9.2

[State 1300,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time=13
x = 0
y = 0

[State 1300,VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = movecontact
x = -2.2
y = -10.35

[State 1300,Exit]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = movecontact
value = 1340

[State 1300,Exit]
type = ChangeState
trigger1 = var(10) = 2
trigger1 = time=13
value = 1350

;
[Statedef 1340]
type = A
physics = N
ctrl = 0

[State 1340,PlaySnd]
type = PlaySnd
trigger1 = ifelse(anim=1200,(AnimElem = 2,=1),ifelse(anim=1210,(AnimElem = 3,=1),(AnimElem = 3,=1)))
value = 1, 3

[State 1340,StateTypeSet]
type = StateTypeSet
trigger1 = (Anim=[1300,1320])
movetype=A

[State 1340,VelMul]
type = VelAdd
trigger1 = (Anim=[1300,1320])
y = .675

[State 1340,ChangeAnim]
type = ChangeAnim
trigger1 = (Anim=[1300,1320]) && Vel Y>0 && Pos Y>=0
value = 1380

[State 1340,VelMul]
type = VelSet
trigger1 = Anim=1380
x = 0
y = 0

[State 1340,StateTypeSet]
type = StateTypeSet
trigger1 = Anim=1380
statetype=S
movetype=I
physics=S

[State 1340,VelMul]
type = PosSet
trigger1 = Anim=1380
y = 0

[State 1340, PlaySnd]
type = PlaySnd
trigger1 = Anim=1380 && AnimElem=1
value = 52, 0

[State 1250, Landing Dust Explod]
type = Explod
trigger1 = Anim=1380 && AnimElem=1
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1340,Exit]
type = ChangeState
trigger1 = Anim=1380 && AnimTime=0
value = 11
ctrl = 1

;
[Statedef 1350]
type = A
physics = N
ctrl = 0

[State 1350,StateTypeSet]
type = StateTypeSet
trigger1 = (Anim=[1300,1320])
movetype=A

[State 1350,VelMul]
type = PosFreeze
trigger1 = (Anim=[1350,1370]) && ifelse(prevstateno=1320,AnimElemTime(11)<0,ifelse(prevstateno=1310,AnimElemTime(10)<0,AnimElemTime(9)<0))
value = 1

[State 1350,VelMul]
type = VelAdd
trigger1 = (Anim=[1300,1320]) || ((Anim=[1350,1370]) && ifelse(prevstateno=1320,AnimElemTime(11)>=0,ifelse(prevstateno=1310,AnimElemTime(10)>=0,AnimElemTime(9)>=0)))
y = .675

[State 1350,ChangeAnim]
type = ChangeAnim
trigger1 = time=0
value = ifelse(prevstateno=1320,1370,ifelse(prevstateno=1310,1360,1350))

[State 1350,ChangeAnim]
type = ChangeAnim
trigger1 = (Anim=[1350,1370]) && Vel Y>0 && Pos Y>=0
value = 1380

[State 1350,VelMul]
type = VelSet
trigger1 = ((Anim=[1350,1370]) && Animelem=1) || Anim=1380
x = 0
y = 0

[State 1350,StateTypeSet]
type = StateTypeSet
trigger1 = Anim=1380
statetype=S
movetype=I
physics=S

[State 1350,VelMul]
type = PosSet
trigger1 = Anim=1380
y = 0

[State 1350, PlaySnd]
type = PlaySnd
trigger1 = Anim=1380 && AnimElem=1
value = 52, 0

[State 1250, Landing Dust Explod]
type = Explod
trigger1 = Anim=1380 && AnimElem=1
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1350,Exit]
type = ChangeState
trigger1 = Anim=1380 && AnimTime=0
value = 11
ctrl = 1

;====<Ex Vertical Rolling>=
[StateDef 1330]
type = S
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1330, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1330, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 71

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1300, 0

[State 1100, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3,=1
value = 1, 3

[State 1330,StateTypeSet]
type = StateTypeSet
trigger1 = time=0
statetype=A
physics=N

[State 1330, NotHitby]
type = NotHitBy
trigger1 = Anim = 1300
trigger1 = Animelem = 4,<= 0
value = SCA
ignorehitpause=1

[State 1330, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem=3
attr = A, SA
damage = ceil(ifElse(fvar(11) * 150 < 7, 7, fvar(11) * 150)), 7
animtype = Hard
guardflag = MA
hitflag = MAF
pausetime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -45
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -9.5
guard.velocity = -9.5
air.velocity = -3.0,-7.0
air.cornerpush.veloff = 0
ground.cornerpush.veloff = -22.0
guard.cornerpush.veloff = ifelse((fvar(23)-ifelse(var(21),1,ceil(12*1.0/2)))<0,0,-22.0)
fall.recover= 0
air.recover=0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
forcestand=1
fall = 1
air.fall = 1
priority = 7,Hit
palfx.color = ifelse(fvar(1),60,255)
palfx.mul = ifelse(fvar(1),255,128),ifelse(fvar(1),255,128),ifelse(fvar(1),255,128)
palfx.time = ifelse(fvar(1),40,ifelse(var(14),10,0))
palfx.sinadd = 120,120,120,ifelse(fvar(1),3,0)
palfx.add = ifelse(fvar(1),0,255),ifelse(fvar(1),0,255),ifelse(fvar(1),0,255)

[State 1330]
type = VelSet
trigger1 = Anim = 1300
trigger1 = Animelem = 2
x =  11
y =  -8

[state 1330]
type = StatetypeSet
triggerall = Anim = 1300
triggerall = statetype != A
trigger1 = Animelem = 2
value = A

[State 1330]
type = VelSet
trigger1 = Anim = 1301
trigger1 = Animelem = 3
trigger2 = Anim = 1300
trigger2 = time = 25
x =  0
y =  0

[State 1330]
type = gravity
trigger1 = Anim = 1301
trigger1 = Animelem = 3,>= 0
trigger2 = Anim = 1300
trigger2 = time >= 25

[State 1330]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 10
value = 1360

[State 1330]
type = ChangeState
trigger1 = movecontact = 1
value = 1370

;
[Statedef 1360]
type = S
physics = S
ctrl = 0
anim = 1390

[State 1360, PlaySnd]
type = PlaySnd
trigger1 = Anim=1390 && AnimElem=1
value = 52, 0

[State 1360, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 1360, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1360,00]
type = Palfx
trigger1 = AnimTime = 0
time = 1

[State 1360]
type = AfterImage
trigger1 = AnimTime = 0
time = 1
trans = add

[State 1360, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;
[Statedef 1370]
type = A
movetype = I
physics = A
ctrl = 0
velset = 0,0
sprpriority = 2
anim = 1302

[State 1370]
type = PlaySnd
trigger1 = Animelem = 4
value = 1, 3
channel = 1

[State 1370]
type = VelSet
trigger1 = time = 0
x = -3
y = -11

[State 1370]
type = gravity
trigger1 = 1

[State 1370]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 10
value = 52

;====<Surprise Forward>=
[Statedef 1400]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 1400

[State 1400, Dust Helper]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1400, Effect]
type = PlaySnd
trigger1 = time=0
value = 110,0

[State 1400, Effect]
type = PlaySnd
trigger1 = AnimElem=1
value = 4,4
channel = 1

[State 1400,StatetypeSet]
type = StatetypeSet
trigger1 = AnimElem=4
Statetype = A
physics = N

[State 1400,VelSet]
type = VelSet
trigger1 = AnimElem=4,=0
x = 7
y = -7

[State 1400,VelAdd]
type = VelAdd
trigger1 = AnimElemTime(4)>=0
y = .798

[State 1400,StatetypeSet]
type = StatetypeSet
trigger1 = AnimElem=8
Statetype = S
physics = S

[State 1400,VelSet]
type = VelSet
trigger1 = AnimElem=8
x = 0
y = 0

[State 1400,PosSet]
type = PosSet
trigger1 = AnimElem=8
y = 0

[State 1400, Landing Dust Explod]
type = Explod
trigger1 = AnimElem=8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1400, Effect]
type = PlaySnd
trigger1 = AnimElem=8
value = 100,1

[State 1400,2]
type = PlayerPush
trigger1 = AnimElemTime(4)>=0
value = 0

[State 1400,Exit]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1450

;
[Statedef 1450]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 1450

[State 1450, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1450,Exit]
type = ChangeState
trigger1 = AnimTime=0
value = 0
ctrl = 1

;====<Surprise Back>=
[Statedef 1500]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 1500

[State 1500,NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA
time = 10

[State 1500, Dust Helper]
type = Helper
trigger1 = time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
facing = -1
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1500, Effect]
type = PlaySnd
trigger1 = Time=0
value = 105,0

[State 1500, Effect]
type = PlaySnd
trigger1 = Anim=1500 && AnimElem=1
value = 4,4
channel = 1

[State 1500,StatetypeSet]
type = StatetypeSet
trigger1 = Anim=1500 && AnimElem=4
Statetype = A
physics = N

[State 1500,VelSet]
type = VelSet
trigger1 = AnimElem=4,=0
x = -7
y = -7

[State 1500,VelAdd]
type = VelAdd
trigger1 = Anim=1500 && AnimElemTime(4)>=0 && AnimElemTime(8)<0
y = .798

[State 1500,StatetypeSet]
type = StatetypeSet
trigger1 = AnimElem=8
Statetype = S
physics = S

[State 1500,VelSet]
type = VelSet
trigger1 = AnimElem=8
x = 0
y = 0

[State 1500,PosSet]
type = PosSet
trigger1 = AnimElem=8
y = 0

[State 1500, Landing Dust Explod]
type = Explod
trigger1 = AnimElem=8
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1500, Effect]
type = PlaySnd
trigger1 = AnimElem=8
value = 100,1

[State 1500,Exit]
type = ChangeState
trigger1 = AnimTime=0
value = 1550

;
[Statedef 1550]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 1550

[State 1550, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1550,Exit]
type = ChangeState
trigger1 = AnimTime=0
value = 0
ctrl = 1

;====<Coward Crouch>=
[Statedef 1600]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0,0
anim = 1600

[State 1600,NotHitBy]
type = NotHitBy
trigger1 = time=0
value = SCA,AT
time = 10

[State 1600, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AT
time = 1

[State 1600, Effect]
type = PlaySnd
trigger1 = Time=0
value = 700,0

[State 1600, 4]
type = ChangeState
trigger1 = Time >= 53
trigger1 = command!="holdx"&&command!="holdy"&&command!="holdz"
value = 11
ctrl = 1

[State 1600, 4]
type = ChangeState
trigger1 = Time >= 90
value = 11
ctrl = 1

;====<PUNCH ZERO COUNTER>=
[StateDef 2900]
type = S
physics = N
moveType = A
anim = 2900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, 4
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 2900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<KICK ZERO COUNTER>=
[StateDef 2910]
type = S
physics = N
moveType = A
anim = 2910
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 4
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 0
getpower = 0,0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -24
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
