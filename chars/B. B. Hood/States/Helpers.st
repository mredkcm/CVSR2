; _________________________________________
;| B. B. Hood by varo_hades                |
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

;=<BOMB PROJECTILE>=
[Statedef 251]
type = A
physics = N
anim = 251
velset = 0,0
sprpriority = 4

[State 251, 3]
type = VelSet
trigger1 = !time
y = 10

[State 251, 10]
type = ChangeState
Trigger1 = root, movetype = h
value = 256
ctrl = 1

[State 251, 10]
type = ChangeState
Trigger1 = vel y > 0 && pos y >= 0
value = 252
ctrl = 1

;Stand Hard Kick Mine (On the ground, waiting to be kicked)
[Statedef 252]
type = S
physics = S
anim = 252
sprpriority = 2
velset= 0,0

[State -3, Jump Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1,7

[State 253]
type = nothitby
trigger1 = 1
value = SCA

[State 252, 0]
type = PosSet
trigger1 = !time
y = 0

[State 252, a]
type = StateTypeSet
trigger1 = animelem = 1
statetype = S

[State 251, 10]
type = ChangeState
Trigger1 = root, movetype = h
value = 256
ctrl = 1

[State 252, 10]
type = ChangeState
Trigger1 = animtime= 6
value = 253
ctrl = 1

;Stand Hard Kick Mine (projectile)
[Statedef 253]
type = A
movetype = A
physics = N
anim = 253
velset = 0,0
sprpriority = 4

[State -3, Jump Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1,7

[State 253, 3]
type = VelSet
trigger1 = !time
x = 4

[State 253, 3]
type = VelSet
trigger1 = animtime = 24
x = 0

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1000, 5]
type = Projectile
trigger1 = !time
ProjAnim = 254
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 23
ProjID = 200
projpriority = 1
offset = 0, 0
velocity = 4,0
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 89 < 7, 7, fvar(11) * 89)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= 0
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 200
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

[State 1000, 5]
type = Projectile
trigger1 = time = 24
ProjAnim = 254
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 23
ProjID = 200
projpriority = 1
offset = 0, 0
velocity = 0,0
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 89 < 7, 7, fvar(11) * 89)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= 0
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 200
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = [253,256]
var(18) = 1

[State 1000, DestroySelf]
type = DestroySelf
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40

[State 1000, 4]
type = ChangeState
triggerall = time > 1
trigger1 = root,NumProjID(200) = 0
Trigger2 = root, movetype = h
value = 256

[State 253, 10]
type = ChangeState
Trigger1 = time = 60
value = 256
ctrl = 1

;Mine Explosion
[Statedef 256]
type = A
physics = N
anim = 256
velset = 0,0

[State -3, Jump Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1,8

[State 11030, remove fx]
type = RemoveExplod
trigger1 = 1
ID = 3000

[State 256, Flash]
type = Explod
trigger1 = animelem = 1
anim = 255
pos = 0,0
ontop = 1
ownpal = 1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999
scale = 0.25,0.25
postype = p1

[State 256, 10]
type = destroyself
Trigger1 = animelem = 2

;=<BOMB PROJECTILE>=
[Statedef 286]
type = A
physics = N
movetype = A
anim = 286
velset = 0,0
sprpriority = -1

[State 286, 3]
type = VelSet
trigger1 = animtime = 8
x = 4
y = 2

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1000, 5]
type = Projectile
trigger1 = time = 8
ProjAnim = 254
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 24
ProjID = 200
projpriority = 1
offset = 0, 0
velocity = 4,2
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 89 < 7, 7, fvar(11) * 89)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= 0
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 200
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 286
var(18) = 1

[State 1000, DestroySelf]
type = DestroySelf
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40

[State 1000, 4]
type = ChangeState
triggerall = time > 1
trigger1 = time > 8
trigger1 = root,NumProjID(200) = 0
Trigger2 = root, movetype = h
value = 256

[State 286, 10]
type = ChangeState
Trigger1 = vel y > 0 && pos y >= 0
value = 287
ctrl = 1

;Malice & Mine...mine
[Statedef 287]
type = A
physics = S
anim = 287
sprpriority = 2
velset= 0,0

[State -3, Jump Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1,7

[State 287]
type = nothitby
trigger1 = 1
value = SCA

[State 287, 0]
type = PosSet
trigger1 = !time
y = 0

[State 287, a]
type = StateTypeSet
trigger1 = animelem = 1
statetype = S

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1000, 5]
type = Projectile
trigger1 = !time
ProjAnim = 254
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 24
ProjID = 200
projpriority = 1
offset = 0, 0
velocity = 0,0
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 89 < 7, 7, fvar(11) * 89)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= 0
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 200
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 287
var(18) = 1

[State 1000, DestroySelf]
type = DestroySelf
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40

[State 1000, 4]
type = ChangeState
triggerall = time > 1
trigger1 = time > 8
trigger1 = root,NumProjID(200) = 0
Trigger2 = root, movetype = h
value = 256

[State 253, 10]
type = ChangeState
Trigger1 = time= 60
value = 256
ctrl = 1

;=<BOMB PROJECTILE>=
[Statedef 651]
type = A
physics = N
Movetype = A
anim = 651
velset=0,0
sprpriority = 4

[State 651, 3]
type = VelSet
trigger1 = !time
y = 1
x = 4

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1000, 5]
type = Projectile
trigger1 = !time
ProjAnim = 254
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 8
ProjID = 201
projpriority = 1
offset = 0, 0
velocity = 4,1
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 89 < 7, 7, fvar(11) * 89)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= 0
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
id = 201
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 651
var(18) = 1

[State 1000, DestroySelf]
type = DestroySelf
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40

[State 1000, 4]
type = ChangeState
triggerall = time > 1
trigger1 = time > 8
trigger1 = root,NumProjID(201) = 0
Trigger2 = root, movetype = h
Trigger3 = animelem = 11
value = 256

;=<SMILE & MISSILE PROJECTILE>=
[Statedef 1205]
type = A
movetype = A
physics = N
ctrl = 0
velset = parent,var(5), 0
ownpal = 1
sprpriority = 4
juggle = 10
anim = 1226

[State 1205, FX]
type = explod
trigger1 = time = 1
trigger2 = time = 8
trigger3 = time = 16
trigger4 = time = 24
trigger5 = time = 32
trigger6 = time = 40
trigger7 = time = 48
trigger8 = time = 56
trigger9 = time = 64
anim = 1229
sprpriority = 3
bindtime = 1
postype = p1
pos = 0, 0
ownpal = 1
removeongethit = 1
scale = .5,.5

[State 1205, FX]
type = explod
trigger1 = animelem = 1
anim = 1228
sprpriority = 3
bindtime = -1
postype = p1
pos = -10, 0
ownpal = 1
removeongethit = 1
removetime = -1
scale = .5,.5
ID = 3000

[State 1205, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1205, 5]
type = Projectile
triggerall = parent,var(10)=0
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 38
ProjID = 1000
projpriority = 1
offset = 0, 0
velocity = parent,var(5)
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -60
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id = 1000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

[State 1205, 5]
type = Projectile
triggerall = parent,var(10)=1
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 48
ProjID = 1000
projpriority = 1
offset = 0, 0
velocity = parent,var(5)
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -60
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id= 1000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

[State 1205, 5]
type = Projectile
triggerall = parent,var(10)=2
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 58
ProjID = 1000
projpriority = 1
offset = 0, 0
velocity = parent,var(5)
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -60
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id= 1000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 1205
var(18) = 1

[State 1205, 4]
type = ChangeState
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40
trigger2 = root,NumProjID(1000) = 0
value = 256

;=<EX SMILE & MISSILE PROJECTILE>=
[Statedef 1235]
type = A
movetype = A
physics = N
ctrl = 0
velset = parent,var(5), 0
ownpal = 1
sprpriority = 4
juggle = 10
anim = 1226

[State 1205, FX]
type = explod
trigger1 = time = 1
trigger2 = time = 8
trigger3 = time = 16
trigger4 = time = 24
trigger5 = time = 32
trigger6 = time = 40
trigger7 = time = 48
trigger8 = time = 56
trigger9 = time = 64
anim = 1229
sprpriority = 3
bindtime = 1
postype = p1
pos = 0, 0
ownpal = 1
removeongethit = 1
scale = .5,.5

[State 1205, FX]
type = explod
trigger1 = animelem = 1
anim = 1228
sprpriority = 3
bindtime = -1
postype = p1
pos = -10, 0
ownpal = 1
removeongethit = 1
removetime = -1
scale = .5,.5
ID = 3000

[State 1205, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1205, 5]
type = Projectile
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 38
ProjID = 1000
Projhits = 3
projpriority = 1
offset = 0, 0
velocity = parent,var(5)
hitflag = MAF
attr = S, SP
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -60
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = 0,0
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id = 1000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 1235
var(18) = 1

[State 1205, 4]
type = ChangeState
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40
trigger2 = root,NumProjID(1000) = 0
value = 256

;=<SMILE & MISSILE PROJECTILE>=
[Statedef 1255]
type = A
movetype = A
physics = N
ctrl = 0
velset = parent,var(5), 0
ownpal = 1
sprpriority = 4
juggle = 10
anim = 1226

[State 1255, FX]
type = explod
trigger1 = time = 1
trigger2 = time = 8
trigger3 = time = 16
trigger4 = time = 24
trigger5 = time = 32
trigger6 = time = 40
trigger7 = time = 48
trigger8 = time = 56
trigger9 = time = 64
anim = 1229
sprpriority = 3
bindtime = 1
postype = p1
pos = 0, 0
ownpal = 1
removeongethit = 1
scale = .5,.5

[State 1255, FX]
type = explod
trigger1 = animelem = 1
anim = 1228
sprpriority = 3
bindtime = -1
postype = p1
pos = -10, 0
ownpal = 1
removeongethit = 1
removetime = -1
scale = .5,.5
ID = 3000

[State 1255, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1035, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1255, 5]
type = Projectile
triggerall = parent,var(10)=0
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 38
ProjID = 1005
projpriority = 1
offset = 0, 0
velocity = parent,var(5)
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -20
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id = 1005
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

[State 1255, 5]
type = Projectile
triggerall = parent,var(10)=1
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 48
ProjID = 1005
projpriority = 1
offset = 0, 0
velocity = parent,var(5)
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -20
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id= 1005
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

[State 1255, 5]
type = Projectile
triggerall = parent,var(10)=2
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 58
ProjID = 1005
projpriority = 1
offset = 0, 0
velocity = parent,var(5)
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -20
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id= 1005
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 1255
var(18) = 1

[State 1255, 4]
type = ChangeState
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40
trigger2 = root,NumProjID(1005) = 0
value = 256

;=<EX SMILE & MISSILE PROJECTILE>=
[Statedef 1285]
type = A
movetype = A
physics = N
ctrl = 0
velset = parent,var(5), 0
ownpal = 1
sprpriority = 4
juggle = 10
anim = 1226

[State 1285, FX]
type = explod
trigger1 = time = 1
trigger2 = time = 8
trigger3 = time = 16
trigger4 = time = 24
trigger5 = time = 32
trigger6 = time = 40
trigger7 = time = 48
trigger8 = time = 56
trigger9 = time = 64
anim = 1229
sprpriority = 3
bindtime = 1
postype = p1
pos = 0, 0
ownpal = 1
removeongethit = 1
scale = .5,.5

[State 1285, FX]
type = explod
trigger1 = animelem = 1
anim = 1228
sprpriority = 3
bindtime = -1
postype = p1
pos = -10, 0
ownpal = 1
removeongethit = 1
removetime = -1
scale = .5,.5
ID = 3000

[State 1285, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1285, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1285, 5]
type = Projectile
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 38
ProjID = 1005
Projhits = 3
projpriority = 1
offset = 0, 0
velocity = parent,var(5)
hitflag = MAF
attr = S, SP
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -20
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = 0,0
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id = 1005
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 1285
var(18) = 1

[State 1285, 4]
type = ChangeState
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40
trigger2 = root,NumProjID(1005) = 0
value = 256

;=<HAPPY & MISSILE PROJECTILE>=
[Statedef 1305]
type = A
movetype = A
physics = N
ctrl = 0
velset = parent,var(11), parent,var(5)
ownpal = 1
sprpriority = 4
juggle = 10
anim = ifElse(parent,var(10)=0,1303,ifElse(parent,var(10)=0,1304,1305))

[State 1305, FX]
type = explod
trigger1 = time = 1
trigger2 = time = 8
trigger3 = time = 16
trigger4 = time = 24
trigger5 = time = 32
trigger6 = time = 40
trigger7 = time = 48
trigger8 = time = 56
trigger9 = time = 64
anim = 1229
sprpriority= 3
bindtime = 1
postype = p1
pos = 0, 0
ownpal = 1
removeongethit=1
scale = .5,.5

[State 1305, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1305, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1305, 5]
type = Projectile
triggerall = parent,var(10)=0
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 38
ProjID = 1000
projpriority = 1
offset = 0, 0
velocity = parent,var(11),parent,var(5)
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -10
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id= 1000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

[State 1305, 5]
type = Projectile
triggerall = parent,var(10)=1
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 48
ProjID = 1000
projpriority = 1
offset = 0, 0
velocity = parent,var(11),parent,var(5)
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -10
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id= 1000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

[State 1305, 5]
type = Projectile
triggerall = parent,var(10)=2
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 58
ProjID = 1000
projpriority = 1
offset = 0, 0
velocity = parent,var(11),parent,var(5)
hitflag = MA
attr = S, SP
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -10
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id= 1000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 1305
var(18) = 1

[State 1305, 4]
type = ChangeState
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40
trigger2 = root,NumProjID(1000) = 0
trigger3 = Pos Y + Vel Y >= 0
value = 256

;=<EX HAPPY & MISSILE PROJECTILE>=
[Statedef 1335]
type = A
movetype = A
physics = N
ctrl = 0
velset = parent,var(11), parent,var(5)
ownpal = 1
sprpriority = 4
juggle = 10
anim = ifElse(parent,var(10)=0,1303,ifElse(parent,var(10)=0,1304,1305))

[State 1335, FX]
type = explod
trigger1 = time = 1
trigger2 = time = 8
trigger3 = time = 16
trigger4 = time = 24
trigger5 = time = 32
trigger6 = time = 40
trigger7 = time = 48
trigger8 = time = 56
trigger9 = time = 64
anim = 1229
sprpriority= 3
bindtime = 1
postype = p1
pos = 0, 0
ownpal = 1
removeongethit=1
scale = .5,.5

[State 1335, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1335, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1335, 5]
type = Projectile
trigger1 = time = 1
trigger1 != root,NumProjID(1000) = 0
ProjAnim = 1227
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 38
ProjID = 1000
Projhits = 3
projpriority = 1
offset = 0, 0
velocity = parent,var(11),parent,var(5)
hitflag = MAF
attr = S, SP
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 8
animtype = Hard
guardflag = M
pausetime = 0,4
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -10
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getPower = 0,0
givePower = 36, 36
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
Id= 1000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 1335
var(18) = 1

[State 1335, 4]
type = ChangeState
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40
trigger2 = root,NumProjID(1000) = 0
trigger3 = Pos Y + Vel Y >= 0
value = 256

;=<LAW OF THE LAW PROJECTILE>=
[Statedef 1635, Success Bombs]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
sprpriority = 4
juggle = 0
anim = 1638

[State 1635, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1635, go]
type = VelSet
trigger1 = time = 0
x = 4
y = 4

[State 1635, go]
type = VelAdd
trigger1 = time > 0
y = .5

[State 1635, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 1635, 4]
type = changestate
Trigger1 = movecontact
Trigger2 = vel y > 0 && pos y >= 0
value = 1637
ignorehitpause = 1

;=<LAW OF THE LAW PROJECTILE>=
[Statedef 1637]
type = A
movetype = A
physics = N
anim = 1636
velset = 0,0

[State 1637, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1637, 5]
type = Projectile
trigger1 = !time
ProjAnim = 1639
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 5
ProjID = 1635
projpriority = 1
offset = 0, 0
velocity = 0,0
hitflag = MAFD
attr = S, SA
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
animtype = Hard
guardflag = MA
pausetime = 0,12
guard.pausetime = 0,2
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= 0
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -4,-7.77564102564102564102564102563869
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0,0
givepower = 16,16
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
palfx.time = 33
palfx.color = 64
palfx.invertall = 0
palfx.add = 100,40,50
palfx.mul= 90,50,40
id = 200

[State 1637, Jump Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1,8

[State 1637, remove fx]
type = RemoveExplod
trigger1 = 1
ID = 3000

[State 1637, Flash]
type = Explod
trigger1 = animelem = 1
anim = 255
pos = 0,-20
ontop = 1
ownpal = 1
ignorehitpause = 1
supermovetime = 999
pausemovetime = 999
scale=0.5,0.5
postype = p1
random = 50, 50

[State 1637, 10]
type= destroyself
Trigger1 = animtime = 0

;=<COOL HUNTING PROJECTILE>=
[Statedef 3105]
type = A
physics = N
Movetype = A
anim = 3103
velset = 0,0
sprpriority = -4

[State 3105, Cloak up]
type = Explod
trigger1 = animelem =5
anim = 3108
vel = 0,-6
pos = 0, 0
ontop = 1
ownpal = 1
removeongethit=1
ignorehitpause = 1
scale = Const(size.xscale),1

[State 3105, Cloak Down]
type = Explod
trigger1 = animelem =34
anim = 3109
vel = 0,10
pos = 0, -30
ontop = 1
ownpal = 1
removeongethit=1
ignorehitpause = 1
scale = Const(size.xscale),1

[State 3105]
type = PlaySnd
trigger1 = animelem = 3
value = 3100,1
volume = 200

[State 3105, 1]
type = PlaySnd
trigger1 = animelemtime(8) = 1
trigger2 = animelemtime(11) = 1
trigger3 = animelemtime(14) = 1
trigger4 = animelemtime(17) = 1
trigger5 = animelemtime(20) = 1
trigger6 = animelemtime(23) = 1
trigger7 = animelemtime(26) = 1
trigger8 = animelemtime(29) = 1
trigger9 = animelemtime(32) = 1
ignorehitpause=1
value = 3100, 2

[State 3105, Flash]
type = Explod
trigger1 = animelemtime(8) = 1
trigger2 = animelemtime(11) = 1
trigger3 = animelemtime(14) = 1
trigger4 = animelemtime(17) = 1
trigger5 = animelemtime(20) = 1
trigger6 = animelemtime(23) = 1
trigger7 = animelemtime(26) = 1
trigger8 = animelemtime(29) = 1
trigger9 = animelemtime(32) = 1
anim = 3106
pos = 110, -115
sprpriority = -3
ownpal = 1
removeongethit=1
ignorehitpause = 0
bindtime = -1
scale=0.5,0.5

[State 3105, Flash]
type = Explod
trigger1 = animelemtime(8) = 1
trigger2 = animelemtime(11) = 1
trigger3 = animelemtime(14) = 1
trigger4 = animelemtime(17) = 1
trigger5 = animelemtime(20) = 1
trigger6 = animelemtime(23) = 1
trigger7 = animelemtime(26) = 1
trigger8 = animelemtime(29) = 1
trigger9 = animelemtime(32) = 1
anim = 3107
pos = 110, -115
sprpriority = -2
ownpal = 1
removeongethit=1
ignorehitpause = 0
bindtime = -1
scale=0.5,0.5

[State 3105: Helper]
type = Helper
trigger1 = animelemtime(8) = 1
trigger2 = animelemtime(11) = 1
trigger3 = animelemtime(14) = 1
trigger4 = animelemtime(17) = 1
trigger5 = animelemtime(20) = 1
trigger6 = animelemtime(23) = 1
trigger7 = animelemtime(26) = 1
trigger8 = animelemtime(29) = 1
trigger9 = animelemtime(32) = 1
helpertype = Normal
name = "H.Missile"
id = 3106
pos = 125, -115 ;50
postype = p1
facing = 1
stateno = 3106
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .5
size.yscale = .5

[State 3105, 10]
type= destroyself
Trigger1 = animelem = 37
trigger2 = parent, movetype = h

;Hunter Rockets
[Statedef 3106]
type = A
movetype = A
physics = N
ctrl = 0
velset = 9, 0
ownpal = 1
sprpriority = 4
juggle = 0
anim = 1

[State 3106, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3106, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3106, 5]
type = Projectile
trigger1 = time = 1
projscale = .5,.5
ProjAnim = 3105
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 38
ProjID = 3105
projpriority = 20
projhits = 1
projmisstime = 0
offset = 0, 0
velocity = 9
hitflag = MAF
attr = S, HP
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 8
animtype = Hard
guardflag = M
pausetime = 0,12
guard.pausetime = 0,11
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -10
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -12.61205725171355925864938338293,-5.8
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0,0
givepower = 0,0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
;Id= 2000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 3106
var(18) = 1

[State 3106, 4]
type = destroyself
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40
trigger2 = projcontact = 1

;=<MAX COOL HUNTING PROJECTILE>=
[Statedef 3155]
type = A
physics = N
Movetype = A
anim = 3103
velset = 0,0
sprpriority = -4

[State 3155, Cloak up]
type = Explod
trigger1 = animelem =5
anim = 3108
vel = 0,-6
pos = 0, 0
ontop = 1
ownpal = 1
removeongethit=1
ignorehitpause = 1
scale = Const(size.xscale),1

[State 3155, Cloak Down]
type = Explod
trigger1 = animelem =34
anim = 3109
vel = 0,10
pos = 0, -30
ontop = 1
ownpal = 1
removeongethit=1
ignorehitpause = 1
scale = Const(size.xscale),1

[State 3155]
type = PlaySnd
trigger1 = animelem = 3
value = 3100,1
volume = 200

[State 3155, 1]
type = PlaySnd
trigger1 = animelemtime(8) = 1
trigger2 = animelemtime(11) = 1
trigger3 = animelemtime(14) = 1
trigger4 = animelemtime(17) = 1
trigger5 = animelemtime(20) = 1
trigger6 = animelemtime(23) = 1
trigger7 = animelemtime(26) = 1
trigger8 = animelemtime(29) = 1
trigger9 = animelemtime(32) = 1
ignorehitpause=1
value = 3100, 2

[State 3155, Flash]
type = Explod
trigger1 = animelemtime(8) = 1
trigger2 = animelemtime(11) = 1
trigger3 = animelemtime(14) = 1
trigger4 = animelemtime(17) = 1
trigger5 = animelemtime(20) = 1
trigger6 = animelemtime(23) = 1
trigger7 = animelemtime(26) = 1
trigger8 = animelemtime(29) = 1
trigger9 = animelemtime(32) = 1
anim = 3106
pos = 110, -115
sprpriority = -3
ownpal = 1
removeongethit=1
ignorehitpause = 0
bindtime = -1
scale=0.5,0.5

[State 3155, Flash]
type = Explod
trigger1 = animelemtime(8) = 1
trigger2 = animelemtime(11) = 1
trigger3 = animelemtime(14) = 1
trigger4 = animelemtime(17) = 1
trigger5 = animelemtime(20) = 1
trigger6 = animelemtime(23) = 1
trigger7 = animelemtime(26) = 1
trigger8 = animelemtime(29) = 1
trigger9 = animelemtime(32) = 1
anim = 3107
pos = 110, -115
sprpriority = -2
ownpal = 1
removeongethit=1
ignorehitpause = 0
bindtime = -1
scale=0.5,0.5

[State 3155: Helper]
type = Helper
trigger1 = animelemtime(8) = 1
trigger2 = animelemtime(11) = 1
trigger3 = animelemtime(14) = 1
trigger4 = animelemtime(17) = 1
trigger5 = animelemtime(20) = 1
trigger6 = animelemtime(23) = 1
trigger7 = animelemtime(26) = 1
trigger8 = animelemtime(29) = 1
trigger9 = animelemtime(32) = 1
helpertype = Normal
name = "H.Missile"
id = 3156
pos = 125, -115 ;50
postype = p1
facing = 1
stateno = 3156
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0
size.xscale = .5
size.yscale = .5

[State 3155, 10]
type= destroyself
Trigger1 = animelem = 37
trigger2 = parent, movetype = h

;Hunter Rockets
[Statedef 3156]
type = A
movetype = A
physics = N
ctrl = 0
velset = 9, 0
ownpal = 1
sprpriority = 4
juggle = 0
anim = 1

[State 3156, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 3156, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3156, 5]
type = Projectile
trigger1 = time = 1
projscale = .5,.5
ProjAnim = 3105
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 38
ProjID = 3105
projpriority = 20
projhits = 1
projmisstime = 0
offset = 0, 0
velocity = 9
hitflag = MAF
attr = S, HP
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
animtype = Hard
guardflag = M
pausetime = 0,12
guard.pausetime = 0,11
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -10
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -12.61205725171355925864938338293,-5.8
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0,0
givepower = 0,0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
;Id= 2000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

[State 3156, 5]
type = Projectile
trigger1 = time = 1
ProjAnim = 3105
projscale = .5,.5
Projhitanim = -1
ProjStageBound = 40
ProjEdgeBound = 40
ProjHeightBound = -240, 1
projremovetime = 38
ProjID = 3105
projpriority = 20
projhits = 1
projmisstime = 0
offset = 5, -5
velocity = 9
hitflag = MAF
attr = S, HP
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 8
animtype= Hard
guardflag = M
pausetime = 0,12
guard.pausetime = 0,11
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 71), var(36):= -10
hitsound = S2,6
guardsound = s3,0
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -12.61205725171355925864938338293,-5.8
air.type = High
air.velocity = -4,-7.77564102564102564102564102563869
air.hittime = 13
air.juggle = 0
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0,0
givepower = 0,0
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .5
;Id= 2000
PalFX.Time = 50
PalFX.Mul = 150,120,100
PalFX.SinAdd = 130,100,90,8
PalFX.Add = 220,100,90

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
trigger1 = Root, StateNo = 3156
var(18) = 1

[State 3156, 4]
type = destroyself
triggerall = time > 1
trigger1 = FrontEdgeDist <= -40
trigger2 = projcontact = 1

;====<HELPER>=
[Statedef 7650]
physics = N
velset = 0,0
anim = 1

[State 7650, bound]
type = screenbound
trigger1 = roundstate = 1
trigger1 = 1
value = 0
movecamera = 1,1

;====<HARRY>=
[Statedef 30000]
sprpriority = 5
anim = 30000
velset = 0,0

[State 30000, Walk]
type = ChangeState
trigger1 = root, statetype = C
value = 30011
ctrl = 0

[State 30000, NORMAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 220
trigger2 = root, Stateno = 250
trigger3 = root, Stateno = 280
trigger4 = root, Stateno = 285
trigger5 = root, Stateno = 420
trigger6 = root, Stateno = 620
trigger7 = root, Stateno = 621
trigger8 = root, Stateno = 650
value = 30200
ctrl = 0

[State 30000, SPECIAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 1100
trigger2 = root, Stateno = 1130
trigger3 = root, Stateno = 1150
trigger4 = root, Stateno = 1180
trigger5 = root, Stateno = 1200
trigger6 = root, Stateno = 1230
trigger7 = root, Stateno = 1250
trigger8 = root, Stateno = 1280
trigger9 = root, Stateno = 1300
trigger10 = root, Stateno = 1330
trigger11 = root, Stateno = 1410
trigger11 = root, animelem = 16
trigger12 = root, Stateno = 1440
trigger12 = root, animelem = 16
trigger13 = root, Stateno = 3001
trigger13 = root, animelem = 13
trigger14 = root, Stateno = 3051
trigger14 = root, animelem = 13
trigger15 = root, Stateno = 3102
trigger16 = root, Stateno = 3152
trigger17 = root, Stateno = 3204
trigger18 = root, Stateno = 1600
trigger19 = root, Stateno = 1630
value = 31000
ctrl = 0

[State 30000, DOSEI!]
type = ChangeState
trigger1 = root, Stateno = 181
trigger2 = root, Stateno = 182
value = 30180
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 184
value = 30181
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 185
trigger2 = root, Stateno = 186
value = 30182
ctrl = 0

[State 30000, OKAY HARRY! 1]
type = ChangeState
trigger1 = root, Stateno = 195
value = 30195
ctrl = 0

[State 30000, NOOOOOOO]
type = ChangeState
trigger1 = root, movetype = H
value = 35000
ctrl = 0

[State 30000, Walk]
type = ChangeState
triggerall = time >= 30
trigger1 = rootdist X > 90
value = 30020
ctrl = 0

[State 30000, Walk]
type = ChangeState
triggerall = time >= 30
trigger1 = rootdist X < 70 && rootdist X < -90
value = 30021
ctrl = 0

[State 30000, TOO CLOSE]
type = ChangeState
triggerall = animelem = 1 || !animtime ;Only during the first animelem.
trigger1 = rootdist X >= 0 && rootdist X < 10
value = 30121
ctrl = 0

[State 30000, No turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 30000, Stance]
type = ChangeAnim
trigger1 = !animtime
value = 30000

[Statedef 30011]
sprpriority = 5
anim = 30011
velset = 0,0

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = 0

[State 30000, NORMAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 220
trigger2 = root, Stateno = 250
trigger3 = root, Stateno = 280
trigger4 = root, Stateno = 285
trigger5 = root, Stateno = 420
trigger6 = root, Stateno = 620
trigger7 = root, Stateno = 621
trigger8 = root, Stateno = 650
value = 30200
ctrl = 0

[State 30000, SPECIAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 1100
trigger2 = root, Stateno = 1130
trigger3 = root, Stateno = 1150
trigger4 = root, Stateno = 1180
trigger5 = root, Stateno = 1200
trigger6 = root, Stateno = 1230
trigger7 = root, Stateno = 1250
trigger8 = root, Stateno = 1280
trigger9 = root, Stateno = 1300
trigger10 = root, Stateno = 1330
trigger11 = root, Stateno = 1410
trigger11 = root, animelem = 16
trigger12 = root, Stateno = 1440
trigger12 = root, animelem = 16
trigger13 = root, Stateno = 3001
trigger13 = root, animelem = 13
trigger14 = root, Stateno = 3051
trigger14 = root, animelem = 13
trigger15 = root, Stateno = 3102
trigger16 = root, Stateno = 3152
trigger17 = root, Stateno = 3204
trigger18 = root, Stateno = 1600
trigger19 = root, Stateno = 1630
value = 31000
ctrl = 0

[State 30000, DOSEI!]
type = ChangeState
trigger1 = root, Stateno = 181
trigger2 = root, Stateno = 182
value = 30180
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 184
value = 30181
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 185
trigger2 = root, Stateno = 186
value = 30182
ctrl = 0

[State 30000, OKAY HARRY! 1]
type = ChangeState
trigger1 = root, Stateno = 195
value = 30195
ctrl = 0

[State 30000, NOOOOOOO]
type = ChangeState
trigger1 = root, movetype = H
value = 35000
ctrl = 0

[State 30000, No turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 30000, Crouch]
type = ChangeState
trigger1 = root, statetype != C
value = 30000
ctrl = 0

[Statedef 30020]
sprpriority = 5
anim = 30020
velset = 0,0

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = 3

[State 30000, No turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 30000, NORMAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 220
trigger2 = root, Stateno = 250
trigger3 = root, Stateno = 280
trigger4 = root, Stateno = 285
trigger5 = root, Stateno = 420
trigger6 = root, Stateno = 620
trigger7 = root, Stateno = 621
trigger8 = root, Stateno = 650
value = 30200
ctrl = 0

[State 30000, SPECIAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 1100
trigger2 = root, Stateno = 1130
trigger3 = root, Stateno = 1150
trigger4 = root, Stateno = 1180
trigger5 = root, Stateno = 1200
trigger6 = root, Stateno = 1230
trigger7 = root, Stateno = 1250
trigger8 = root, Stateno = 1280
trigger9 = root, Stateno = 1300
trigger10 = root, Stateno = 1330
trigger11 = root, Stateno = 1410
trigger11 = root, animelem = 16
trigger12 = root, Stateno = 1440
trigger12 = root, animelem = 16
trigger13 = root, Stateno = 3001
trigger13 = root, animelem = 13
trigger14 = root, Stateno = 3051
trigger14 = root, animelem = 13
trigger15 = root, Stateno = 3102
trigger16 = root, Stateno = 3152
trigger17 = root, Stateno = 3204
trigger18 = root, Stateno = 1600
trigger19 = root, Stateno = 1630
value = 31000
ctrl = 0

[State 30000, DOSEI!]
type = ChangeState
trigger1 = root, Stateno = 181
trigger2 = root, Stateno = 182
value = 30180
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 184
value = 30181
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 185
trigger2 = root, Stateno = 186
value = 30182
ctrl = 0

[State 30000, OKAY HARRY! 1]
type = ChangeState
trigger1 = root, Stateno = 195
value = 30195
ctrl = 0

[State 30000, NOOOOOOO]
type = ChangeState
trigger1 = root, movetype = H
value = 35000
ctrl = 0

[State 30000, Stop when close]
type = ChangeState
trigger1 = rootdist x<=0
value = 30000
ctrl = 0

[Statedef 30021]
sprpriority = 5
anim = 30021
velset = 0,0

[State 30000, Walk]
type = ChangeState
triggerall = time >= 30
trigger1 = rootdist X > 90
value = 30020
ctrl = 0

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = -3

[State 30000, No turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 30000, NORMAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 220
trigger2 = root, Stateno = 250
trigger3 = root, Stateno = 280
trigger4 = root, Stateno = 285
trigger5 = root, Stateno = 420
trigger6 = root, Stateno = 620
trigger7 = root, Stateno = 621
trigger8 = root, Stateno = 650
value = 30200
ctrl = 0

[State 30000, SPECIAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 1100
trigger2 = root, Stateno = 1130
trigger3 = root, Stateno = 1150
trigger4 = root, Stateno = 1180
trigger5 = root, Stateno = 1200
trigger6 = root, Stateno = 1230
trigger7 = root, Stateno = 1250
trigger8 = root, Stateno = 1280
trigger9 = root, Stateno = 1300
trigger10 = root, Stateno = 1330
trigger11 = root, Stateno = 1410
trigger11 = root, animelem = 16
trigger12 = root, Stateno = 1440
trigger12 = root, animelem = 16
trigger13 = root, Stateno = 3001
trigger13 = root, animelem = 13
trigger14 = root, Stateno = 3051
trigger14 = root, animelem = 13
trigger15 = root, Stateno = 3102
trigger16 = root, Stateno = 3152
trigger17 = root, Stateno = 3204
trigger18 = root, Stateno = 1600
trigger19 = root, Stateno = 1630
value = 31000
ctrl = 0

[State 30000, DOSEI!]
type = ChangeState
trigger1 = root, Stateno = 181
trigger2 = root, Stateno = 182
value = 30180
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 184
value = 30181
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 185
trigger2 = root, Stateno = 186
value = 30182
ctrl = 0

[State 30000, OKAY HARRY! 1]
type = ChangeState
trigger1 = root, Stateno = 195
value = 30195
ctrl = 0

[State 30000, NOOOOOOO]
type = ChangeState
trigger1 = root, movetype = H
value = 35000
ctrl = 0

[State 30000, Stop when close]
type = ChangeState
trigger1 = rootdist x>=0
value = 30000
ctrl = 0

[Statedef 30121]
sprpriority = 5
anim = 30121
velset = 0,0

[State 30000, Walk]
type = ChangeState
triggerall = time >= 30
trigger1 = rootdist X > 90
value = 30020
ctrl = 0

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = -2

[State 30000, No turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 30000, NORMAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 220
trigger2 = root, Stateno = 250
trigger3 = root, Stateno = 280
trigger4 = root, Stateno = 285
trigger5 = root, Stateno = 420
trigger6 = root, Stateno = 620
trigger7 = root, Stateno = 621
trigger8 = root, Stateno = 650
value = 30200
ctrl = 0

[State 30000, SPECIAL ORDNANCE]
type = ChangeState
trigger1 = root, Stateno = 1100
trigger2 = root, Stateno = 1130
trigger3 = root, Stateno = 1150
trigger4 = root, Stateno = 1180
trigger5 = root, Stateno = 1200
trigger6 = root, Stateno = 1230
trigger7 = root, Stateno = 1250
trigger8 = root, Stateno = 1280
trigger9 = root, Stateno = 1300
trigger10 = root, Stateno = 1330
trigger11 = root, Stateno = 1410
trigger11 = root, animelem = 16
trigger12 = root, Stateno = 1440
trigger12 = root, animelem = 16
trigger13 = root, Stateno = 3001
trigger13 = root, animelem = 13
trigger14 = root, Stateno = 3051
trigger14 = root, animelem = 13
trigger15 = root, Stateno = 3102
trigger16 = root, Stateno = 3152
trigger17 = root, Stateno = 3204
trigger18 = root, Stateno = 1600
trigger19 = root, Stateno = 1630
value = 31000
ctrl = 0

[State 30000, DOSEI!]
type = ChangeState
trigger1 = root, Stateno = 181
trigger2 = root, Stateno = 182
value = 30180
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 184
value = 30181
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 185
trigger2 = root, Stateno = 186
value = 30182
ctrl = 0

[State 30000, OKAY HARRY! 1]
type = ChangeState
trigger1 = root, Stateno = 195
value = 30195
ctrl = 0

[State 30000, NOOOOOOO]
type = ChangeState
trigger1 = root, movetype = H
value = 35000
ctrl = 0

[State 30000, Stop when close]
type = ChangeState
trigger1 = rootdist x>=70
value = 30000
ctrl = 0

[Statedef 30200]
sprpriority = 5
anim = 30200
velset = 0,0

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = 0

[State 30000, No turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 30000, NOOOOOOO]
type = ChangeState
trigger1 = root, movetype = H
value = 35000
ctrl = 0

[State 30000, Stop when close]
type = ChangeState
trigger1 = root, movetype != A
value = 30000
ctrl = 0

[Statedef 31000]
sprpriority = 5
anim = 31000
velset = 0,0

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = 0

[State 30000, No turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 30000, NOOOOOOO]
type = ChangeState
trigger1 = root, movetype = H
value = 35000
ctrl = 0

[State 30000, Stop when close]
type = ChangeState
trigger1 = root, movetype != A
value = 30000
ctrl = 0

[Statedef 35000]
sprpriority = 5
anim = 35000
velset = 0,0

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = 0

[State 30000, No turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 30000, Stop when close]
type = ChangeState
trigger1 = root, movetype != H
value = 30000
ctrl = 0

[Statedef 30180, Win 1/2]
sprpriority = 5
anim = 31000
velset = 0,0

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = 0

[Statedef 30181, Win 3]
sprpriority = 5
anim = 30181
velset = 0,0

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = 0

[Statedef 30182, Win 3]
sprpriority = 5
anim = 30181
velset = 0,0

[State 30020, Stand]
type = Changeanim
triggerall= anim != 30000
trigger1= root,stateno=185 && root,animelemtime(40)=1
value = 30000

[State 30020, Gasp]
type = Changeanim
triggerall= anim != 31000
trigger1= root,stateno=185 && root,animelemtime(50)=1
trigger2= root,stateno=185 && root,animelemtime(67)=1
value = 31000

[State 30020, Walk]
type = Changeanim
triggerall= anim != 30020
trigger1= root,stateno=185 && root,animelemtime(60)=1
value = 30020

[State 30020, Stand]
type = Changeanim
triggerall= anim != 30000
trigger1= root,stateno=186 && root,animelemtime(40)=1
value = 30000

[State 30020, Gasp]
type = Changeanim
triggerall= anim != 31000
trigger1= root,stateno=186 && root,animelemtime(50)=1
trigger2= root,stateno=186 && root,animelemtime(61)=1
value = 31000

[State 30020, Walk]
type = Changeanim
triggerall= anim != 30021
trigger1= root,stateno=186 && root,animelemtime(60)=1
value = 30021

[State 30020, Walk]
type = VelSet
trigger1 = anim = 30020
x = 2

[State 30020, Walk]
type = VelSet
trigger1 = anim = 30021
x = -2

[State 30020, Walk]
type = VelSet
trigger1 = anim != 30020
trigger2 = anim != 30021
x = 0

[Statedef 30195]
sprpriority = 5
anim = 30195
velset = 0,0

[State 195,2]
type = PlaySnd
trigger1 = animelem = 9
value = 111,0
volume = 200

[State 30020, Walk]
type = VelSet
trigger1 = 1
x = 0

[State 30000, No turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn

[State 30000, DOSEI!]
type = ChangeState
trigger1 = root, Stateno = 181
trigger2 = root, Stateno = 182
value = 30180
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 184
value = 30181
ctrl = 0

[State 30000, DOKAN! 1]
type = ChangeState
trigger1 = root, Stateno = 185
trigger2 = root, Stateno = 186
value = 30182
ctrl = 0

[State 30000, NOOOOOOO]
type = ChangeState
trigger1 = root, movetype = H
value = 35000
ctrl = 0

[State 30000, Stop when close]
type = ChangeState
trigger1 = !animtime
value = 30000
ctrl = 0

;====<BUTTERFLY>=
[Statedef 40000]
type= A
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 40000, Turn]
type = turn
trigger1= facing != (root,facing)

[State 40000, Anim]
type= null
trigger1 = ishelper(40000) && anim!=40000
value = 40000

[State 40000, Anim]
type= changeanim
trigger1= anim!=[40000,40004]
trigger1= vel x >= 0
value = 40000+(random%5)

[State 40000, Anim]
type= changeanim
trigger1= anim!=[40005,40009]
trigger1= vel x < 0
value = 40006+(random%5)

[State 40000, Dist X]
type= varset
trigger1= ishelper(40000)
fvar(1)= (rootdist x - 24)

[State 40000, Dist Y]
type= varset
trigger1= ishelper(40000)
fvar(2)= (rootdist y - 80)

[State 40000, Dist - Attacks]; Set the butterfly formations with this controller, it changes the position they should fly to
type= null
triggerall= ishelper(40000)
triggerall= root,movetype!=H
trigger1= root,stateno=11
trigger1= fvar(1):=(rootdist x + 10) || fvar(2):=(rootdist y - 46)
trigger2= root,stateno=220 && root,animelemtime(1)>=0 && root,animelemtime(17)<0
trigger2= fvar(1):=(rootdist x - 100) || fvar(2):=(rootdist y - 100)

[State 40000, Dist /];Angle to destination position
type= varset
trigger1= 1
fvar(3)= (fvar(1)**2 + fvar(2)**2) ** 0.5

[State 40000, Vel];Head to destination
type= velset
triggerall= fvar(3)
trigger1= (fvar(1) != [-64, 64]) || (fvar(2) != [-64, 64])
trigger2= root,stateno = 11
x= (fvar(1) / fvar(3)) * 4
y= (fvar(2) / fvar(3)) * 4

[State 40000, Vel];Stop if at destination
type= velset
trigger1= (fvar(1) = [-4, 4]) && (fvar(2) = [-4, 4])
x= 0
y= 0

[State 40000, Vel];Float around randomly
type= velset
trigger1= ishelper(40000)
trigger1= random < 50
trigger1= (fvar(1) = [-64, 64]) && (fvar(2) = [-64, 64]);But only if they're this close to BBH
trigger1= root,stateno != 11
x= 0.5 + (random / 500.0) * ifelse(random < 500, -1, 1)
y= 0.5 + (random / 500.0) * ifelse(random < 500, -1, 1)

[Statedef 40010]
type= A
physics= N
movetype= I
ctrl= 0
velset= 0, 0
sprpriority = 2

[State 40000, Turn]
type= turn
trigger1= facing != (root,facing)

[State 40000, Anim]
type= null
trigger1= ishelper(40010) && anim!=40000
value = 40000

[State 40000, Anim]
type= changeanim
trigger1= anim!=[40000,40004]
trigger1= vel x >= 0
value = 40000+(random%5)

[State 40000, Anim]
type= changeanim
trigger1= anim!=[40005,40009]
trigger1= vel x < 0
value = 40006+(random%5)

[State 40000, Dist X]
type= varset
trigger1= ishelper(40010)
fvar(1)= (rootdist x - 60)

[State 40000, Dist Y]
type= varset
trigger1= ishelper(40010)
fvar(2)= (rootdist y - 68)

[State 40000, Dist - Attacks]; Set the butterfly formations with this controller, it changes the position they should fly to
type= null
triggerall= ishelper(40010)
triggerall= root,movetype!=H
trigger1= root,stateno=11
trigger1= fvar(1):=(rootdist x + 10) || fvar(2):=(rootdist y - 46)
trigger2= root,stateno=220 && root,animelemtime(1)>=0 && root,animelemtime(17)<0
trigger2= fvar(1):=(rootdist x - 100) || fvar(2):=(rootdist y - 100)

[State 40000, Dist /];Angle to destination position
type= varset
trigger1= 1
fvar(3)= (fvar(1)**2 + fvar(2)**2) ** 0.5

[State 40000, Vel];Head to destination
type= velset
triggerall= fvar(3)
trigger1= (fvar(1) != [-64, 64]) || (fvar(2) != [-64, 64])
trigger2= root,stateno = 11
x= (fvar(1) / fvar(3)) * 4
y= (fvar(2) / fvar(3)) * 4

[State 40000, Vel];Stop if at destination
type= velset
trigger1= (fvar(1) = [-4, 4]) && (fvar(2) = [-4, 4])
x= 0
y= 0

[State 40000, Vel];Float around randomly
type= velset
trigger1= ishelper(40010)
trigger1= random < 50
trigger1= (fvar(1) = [-64, 64]) && (fvar(2) = [-64, 64]);But only if they're this close to BBH
trigger1= root,stateno != 11
x= 0.5 + (random / 500.0) * ifelse(random < 500, -1, 1)
y= 0.5 + (random / 500.0) * ifelse(random < 500, -1, 1)

[Statedef 40020]
type= A
physics= N
movetype= I
ctrl= 0
velset= 0, 0
sprpriority = 2

[State 40000, Turn]
type= turn
trigger1= facing != (root,facing)

[State 40000, Anim]
type= null
trigger1= ishelper(40020) && anim!=40000
value = 40000

[State 40000, Anim]
type= changeanim
trigger1= anim!=[40000,40004]
trigger1= vel x >= 0
value = 40000+(random%5)

[State 40000, Anim]
type= changeanim
trigger1= anim!=[40005,40009]
trigger1= vel x < 0
value = 40006+(random%5)

[State 40000, Anim]
type= changeanim
trigger1= anim!=40001
trigger1= vel x > 0
value = 40001

[State 40000, Dist X]
type= varset
trigger1= ishelper(40020)
fvar(1)= (rootdist x + 34)

[State 40000, Dist Y]
type= varset
trigger1= ishelper(40020)
fvar(2)= (rootdist y - 56)

[State 40000, Dist - Attacks]; Set the butterfly formations with this controller, it changes the position they should fly to
type= null
triggerall= ishelper(40020)
triggerall= root,movetype!=H
trigger1= root,stateno=11
trigger1= fvar(1):=(rootdist x + 10) || fvar(2):=(rootdist y - 46)
trigger2= root,stateno=220 && root,animelemtime(1)>=0 && root,animelemtime(17)<0
trigger2= fvar(1):=(rootdist x - 100) || fvar(2):=(rootdist y - 100)

[State 40000, Dist /];Angle to destination position
type= varset
trigger1= 1
fvar(3)= (fvar(1)**2 + fvar(2)**2) ** 0.5

[State 40000, Vel];Head to destination
type= velset
triggerall= fvar(3)
trigger1= (fvar(1) != [-64, 64]) || (fvar(2) != [-64, 64])
trigger2= root,stateno = 11
x= (fvar(1) / fvar(3)) * 4
y= (fvar(2) / fvar(3)) * 4

[State 40000, Vel];Stop if at destination
type= velset
trigger1= (fvar(1) = [-4, 4]) && (fvar(2) = [-4, 4])
x= 0
y= 0

[State 40000, Vel];Float around randomly
type= velset
trigger1= ishelper(40020)
trigger1= random < 50
trigger1= (fvar(1) = [-64, 64]) && (fvar(2) = [-32, 32]);But only if they're this close to BBH
trigger1= root,stateno != 11
x= 0.5 + (random / 500.0) * ifelse(random < 500, -1, 1)
y= 0.5 + (random / 500.0) * ifelse(random < 500, -1, 1)

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
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
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
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
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
scale = 0.4, 0.4
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
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
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
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
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
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
scale = 0.25 + (0.09375 * Time), 0.25 + (0.09375 * Time)
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
anim = 8150 + (Root, StateNo = [3500,3599])
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
anim = 8150 + (Root, StateNo = [3500,3599])
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
trigger3 = Time > 45 && (Root, StateNo = [3100,3101]) && !(Root, var(40))
trigger4 = Time > 45 && (Root, StateNo = [3200,3299])
trigger5 = Time > 45 && (Root, StateNo = [3400,3510])

[State 8150, End]
type = DestroySelf
triggerAll = PlayerIDexist(var(0))
trigger1 = PlayerID(var(0)), ctrl
trigger2 = PlayerID(var(0)), Movetype != H || PlayerID(var(0)), StateNo = 5300
trigger3 = PlayerID(var(0)), StateType = L && (PlayerID(var(0)), StateNo != [5080,5081])

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
pos = 13,0

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
vel = ((RootDist x + 12) / 32.0), ((RootDist y - 56) / 32.0)
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

[State 8600, Super Finish Sound]
type = PlaySnd
trigger1 = !Time
value = 8600,0
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

[State 8600, Move Name: Apple For You]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3000,3099])
var(0) = 2

[State 8600, Move Name: Cool Hunting]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3100,3199])
var(0) = 3

[State 8600, Move Name: Beautiful Memory]
type = VarSet
trigger1 = !Time && (Root, var(23) = [3200,3299])
var(0) = 4

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
