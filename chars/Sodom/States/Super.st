; _________________________________________
;| Sodom by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<Meido no Miyage>=
[StateDef 3000]
type = S
physics = S
moveType = A
anim = 3000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
juggle = 8
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

[State 3000,Muteki]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 41

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-80 * const(size.yScale))
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
trigger1 = Time =0
value = 730,1
channel = 0

[State 3100,VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 9.0

[State 3100,VelSet]
type = VelSet
trigger1 = AnimElem = 7 || AnimElem = 11
x = 11.0

[State 3100,PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 17

[State 3000, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000, 0

[State 3000, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 7
value = 4, 0

[State 3000, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1000, 1

[State 3000, Sound]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 7
trigger3 = animelem = 12
value = 1,7

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8103
pos = 80,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 7
helperType = Normal
stateNo = 8103
pos = 70,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 12
helperType = Normal
stateNo = 8103
pos = 40,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3000,HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, HA
damage = ceil(ifElse(fvar(11) * 43 < 7, 7, fvar(11) * 43)), 7
animtype = Hard
getpower = 0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=3
anim = 1003
ID = 1003
pos = 25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3000,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 3
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3000,HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
damage = ceil(ifElse(fvar(11) * 43 < 7, 7, fvar(11) * 43)), 7
animtype = Hard
getpower = 0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=4
anim = 1003
ID = 1003
pos = 25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 1000,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 4
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3000,HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7
attr = S, HA
damage = ceil(ifElse(fvar(11) * 43 < 7, 7, fvar(11) * 43)), 7
animtype = Hard
getpower = 0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=7
anim = 1004
ID = 1004
pos = -20,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 0

[State 3000,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 7
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3000,HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, HA
damage = ceil(ifElse(fvar(11) * 43 < 7, 7, fvar(11) * 43)), 7
animtype = Hard
getpower = 0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=8
anim = 1004
ID = 1004
pos = -20,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 0

[State 3000,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 8
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3000,HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 12
attr = S, HA
damage = ceil(ifElse(fvar(11) * 43 < 7, 7, fvar(11) * 43)), 7
animtype = Hard
getpower = 0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -50
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=12
anim = 1005
ID = 1005
pos = -25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3000,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 12
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-45
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3000,HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 13
attr = S, HA
damage = ceil(ifElse(fvar(11) * 43 < 7, 7, fvar(11) * 43)), 7
animtype = DiagUp
getpower = 0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,8
guard.pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -50
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -4.0,-6.5
guard.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -4.0,-5.0
fall = 1
fall.recover = 0
air.recover = 0
recover = 0

[State 0, Explod]
type = Explod
trigger1 = animelem=13
anim = 1005
ID = 1005
pos = -25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3000,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 13
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-45
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3100,AfterImageTime]
type = AfterImageTime
trigger1 = AnimTime = 0
time = 0

[State 3100,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<Max Meido no Miyage>=
[StateDef 3050]
type = S
physics = S
moveType = A
anim = 3050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
juggle = 8
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

[State 3050,Muteki]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 52

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(0 * const(size.xScale)), ceil(-80 * const(size.yScale))
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
trigger1 = Time =0
value = 730,1
channel = 0

[State 3200,VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 11.0

[State 3200,VelSet]
type = VelSet
trigger1 = AnimElem = 7 || AnimElem = 11
x = 13.0

[State 3200,PosAdd]
type = PosAdd
trigger1 = AnimElem = 7
x = 17

[State 3050, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000, 0

[State 3050, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 7
value = 4, 0

[State 3050, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 12
value = 1000, 1

[State 3050, Sound]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 7
trigger3 = animelem = 12
value = 1,7

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8103
pos = 80,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 7
helperType = Normal
stateNo = 8103
pos = 70,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 12
helperType = Normal
stateNo = 8103
pos = 40,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3050,HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, HA
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7
animtype = Hard
getpower = 0,0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=3
anim = 1003
ID = 1003
pos = 25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3050,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 3
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3050,HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, HA
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7
animtype = Hard
getpower = 0,0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=4
anim = 1003
ID = 1003
pos = 25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3050,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 4
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3050,HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 7
attr = S, HA
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7
animtype = Hard
getpower = 0,0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=7
anim = 1004
ID = 1004
pos = -20,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 0

[State 3050,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 7
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3050,HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 8
attr = S, HA
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7
animtype = Hard
getpower = 0,0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=8
anim = 1004
ID = 1004
pos = -20,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 0

[State 3050,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 8
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3050,HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 12
attr = S, HA
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7
animtype = Hard
getpower = 0,0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -5.0,-3.5

[State 0, Explod]
type = Explod
trigger1 = animelem=12
anim = 1005
ID = 1005
pos = -25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3050,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 12
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3050,HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 13
attr = S, HA
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 7
animtype = DiagUp
getpower = 0,0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 5,8
guard.pausetime = 5,10
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -2.0,-8.5
guard.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -2.0,-7.0
fall = 1
fall.recover = 0
air.recover = 0
recover = 0

[State 0, Explod]
type = Explod
trigger1 = animelem=13
anim = 1005
ID = 1005
pos = -25,-5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3050,Explod]
type = Explod
trigger1 = movehit
trigger1 = AnimElem = 13
anim = 7232
sprpriority = 2
postype = p1
pos = 127,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3200,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3051

;
[Statedef 3051]
type = A
movetype = A
physics = N
anim = 3051
velset = 2.4,-9.0

[State 3210,VelAdd]
type = VelAdd
trigger1 = AnimElemNo(0) = 1
y = .35

[State 3210,VelSet]
type = VelSet
trigger1 = AnimElem = 2
y = 0

[State 3210,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 41, 0
channel = 0

[State 3210,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000, 0
channel = 1

[State 3210,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000, 1
channel = 2

[State 3210,PosFreeze]
type = PosFreeze
trigger1 = AnimElemNo(0) = 2

[State 0, landing explode]
type = Explod
trigger1 = time = 0
anim = 8100
sprpriority = 4
postype = p1
pos = -10,10
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.2 ,1.2
ownpal = 1
ignorehitpause =1
persistent = 0

[State 3051,HitDef]
type = HitDef
trigger1 = AnimElem = 3
attr = A, HA
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 50)), 7
animtype = Up
getpower = 0,0
givepower = 36,36
guardflag = M
hitflag = MAF
pausetime = 10,12
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 70), var(36) := -21
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 15
ground.hittime = 24
ground.velocity = -4.0,2.5
guard.velocity = -8.2
ground.cornerpush.veloff = -4.0
air.velocity = -4.0,4.0
yaccel = .55
fall = 1
fall.recover = 0
air.recover = 0
recover = 0

[State 0, Explod]
type = Explod
trigger1 = animelem=3
anim = 621
ID = 621
pos = -5,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,1
sprpriority = 8

[State 3050,Explod]
type = Explod
trigger1 = movehit
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-16
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 3210,Gravity]
type = Gravity
trigger1 = AnimElemNo(0) >= 3

[State 3210,ChangeState]
type = ChangeState
trigger1 = AnimElemNo(0) >= 4 && Vel Y > 0 && Pos Y >= 0
value = 3052

;
[Statedef 3052]
type = S
movetype = I
physics = S
anim = 3052
velset = 0, 0

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 8102
sprpriority = -2
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 3220,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 52, 0

[State 3220,PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3200,AfterImageTime]
type = AfterImageTime
trigger1 = AnimTime = 0
time = 0

[State 3220,End]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;====<Ten Chuu Satsu>=
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
pos = ceil(15 * const(size.xScale)), ceil(-91 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1000,0

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

[State 210,3]
type = ChangeState
trigger1 = time = 38
value = 3101
ctrl = 0

[Statedef 3101]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3101
juggle = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 4
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 2
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 6
[State 0,ChangeState]
type = ChangeState
trigger1=time>=6
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3110
ctrl = 0

[Statedef 3110]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3110
juggle = 0
poweradd = 0

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 3110, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
Triggerall = Time = 0
trigger1 = p2statetype != A
trigger1 = p2stateno != [150,152]
attr = S, HT
hitflag = M
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 1
p2facing = 1
p1stateno = 3120
p2stateno = 3125
fall = 1
fall.recover = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 800,0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3120]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3120
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 40
value = 40,0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 8102
sprpriority = -2
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = time=0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 2,800

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 730,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = 1300,0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = 1
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 49
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 10

[State 0,ChangeState]
type = ChangeState
trigger1=time>=60
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3140
ctrl = 0

[Statedef 3130]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3130
juggle = 0
poweradd = 0

[State 3330,Width]
type = Width
trigger1=time>=0
trigger1 = FrontEdgeDist < 100 && AnimElemNo(0) = 1
edge = 100,20

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 820,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 3100,0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = 12
freq = 120
ampl = 8

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = 1
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 39
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 42
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 45
y = -0.4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = -0.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 51
y = -0.2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 54
y = -0.1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 57
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 72
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 75
y = 12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 78
y = 14

[State 0,ChangeState]
type = ChangeState
trigger1=time>= 50
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3140
ctrl = 0

[Statedef 3140]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3140
juggle = 0
poweradd = 0

[State 3330,Width]
type = Width
trigger1=time>=0
trigger1 = FrontEdgeDist < 100 && AnimElemNo(0) = 1
edge = 100,20

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 820,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 8
value = 102,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = 190,0

[State 1305, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 40, 5
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, Explod1]
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 8
trigger4 = animelem = 10
anim = 7005
pos = -80,-40
postype = p2  ;p2,front,back,left,right
facing = -1
bindtime = 1
vel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, Explod2]
type = Explod
trigger1 = animelem = 9
trigger2 = animelem = 11
trigger3 = animelem = 4
anim = 7005
pos = -90,-20
postype = p2  ;p2,front,back,left,right
facing = -1
bindtime = 1
vel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, Explod3]
type = Explod
trigger1 = animelem = 9
trigger2 = time = 46
trigger3 = time = 52
anim = 7005
pos = -70,-70
postype = p2  ;p2,front,back,left,right
facing = -1
bindtime = 1
vel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = 12
freq = 120
ampl = 8

[State 0, EnvShake]
type = EnvShake
trigger1 = time=16
time = 24
freq = 120
ampl = 4

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = -3
y=-8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
y=-6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
y=-4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 49
y=-2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y=-1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y=0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y=2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 61
y=4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 64
y=6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 67
y=8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y=10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 73
y=12

[State 0,ChangeState]
type = ChangeState
trigger1=time>=43
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3149
ctrl = 0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
trigger5 = animelem = 9
trigger6 = animelem = 11
anim = 8100
sprpriority = 4
postype = p1
pos = -20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[Statedef 3149]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 3149
juggle = 0
poweradd = 0

;52 add landing smoke
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 8102
sprpriority = -2
postype = p1
pos = 0,0
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3125]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3125

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = -1
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 49
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 10

[State 0,ChangeState]
type = ChangeState
trigger1=p2stateno=3140
value = 3145
ctrl = 0

[Statedef 3135]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=0
value = -100
kill = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3135

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = -1
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 39
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 42
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 45
y = -0.4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = -0.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 51
y = -0.2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 54
y = -0.1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 57
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 72
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 75
y = 12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 78
y = 14

[State 0,ChangeState]
type = ChangeState
trigger1=p2stateno=3140
value = 3145
ctrl = 0

[Statedef 3145]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=0
value = -80
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=20
trigger2 = time=30
value = -65
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=40
value = -90
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3145

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = -6

[State 0,ChangeState]
type = ChangeState
trigger1=time=40
value = 3199
ctrl = 0

[Statedef 3199]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, PalFXWiz]
type = PalFX
trigger1 = time=0
time = 50
add = 240,50,0
mul = 250,224,120
sinadd = 110,55,85,10
invertall = 0
color = 0;256
;ignorehitpause = 0
;persistent = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3199

[State 0, PosAdd]
type = PosAdd
trigger1 =time = 0
x = -60

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -3
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 12

;800
[State 0, VarAdd]
type = VarAdd
triggerall=var(40) = 1
trigger1 = time = 0
v = 54
value = -300
persistent = 0
[State 0, VarAdd]
type = VarAdd
triggerall=var(40) = 1
trigger1 = time = 0
v = 44
value = -300
persistent = 0

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

;====<MAX Ten Chuu Satsu>=
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

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
pos = ceil(15 * const(size.xScale)), ceil(-91 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1000,0

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

[State 210,3]
type = ChangeState
trigger1 = time = 38
value = 3151
ctrl = 0

[Statedef 3151]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3101
juggle = 0

[State 0, VarSet]
type = VarSet
trigger1 = prevstateno = [1000,2999]
trigger1 = time = 1
v = 20
value = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 4
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 2
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 6
[State 0,ChangeState]
type = ChangeState
trigger1=time>=6
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3160
ctrl = 0

[Statedef 3160]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3110
juggle = 0
poweradd = 0

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 3160,HitDef 1]
type = HitDef
Triggerall = var(20)<=0
Triggerall = Time = 0
trigger1 = !var(16) && var(15) < 1
trigger1 = p2statetype != A
trigger1 = p2stateno != [150,152]
attr = S, HT
hitflag = M
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 1
p2facing = 1
p1stateno = 3170
p2stateno = 3175
fall = 1
fall.recover = 0

[State 3160,HitDef 2]
type = HitDef
Triggerall = var(20)> 0
Triggerall = Time = 0
trigger1 = !var(16) && var(15) < 1
trigger1 = p2stateno != [150,152]
attr = S, HT
hitflag = MAF
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 1
p2facing = 1
p1stateno = 3170
p2stateno = 3175
fall = 1
fall.recover = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 800,0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3170]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3120
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 40
value = 40,0

;925/ 920 add jump smnoke
[State 0, jump up explode]
type = Explod
trigger1 = Time = 40
anim = 6020
sprpriority = 4
postype = p1
pos = 0,10
bindtime = 1
pausemovetime = 22
removetime = -2
ignorehitpause = 1
scale = 0.6,0.3
ownpal = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = time=0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 2,800

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 730,1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = 1
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 49
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 10

[State 0,ChangeState]
type = ChangeState
trigger1=time>=60
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3180
ctrl = 0

[Statedef 3180]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3130
juggle = 0
poweradd = 0

[State 0, landing explode]
type = Explod
trigger1 = time = 15
anim = 8100
sprpriority = 4
postype = p1
pos = -10,10
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.2 ,1.2
ownpal = 1
ignorehitpause =1
persistent = 0

[State 0, landing explode]
type = Explod
trigger1 = time = 20
anim = 8100
sprpriority = 4
postype = p1
pos = -10,10
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.9 ,0.9
ownpal = 1
ignorehitpause =1
persistent = 0

[State 0, landing explode]
type = Explod
trigger1 = time = 25
anim = 8100
sprpriority = 4
postype = p1
pos = -10,10
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.7,0.7
ownpal = 1
ignorehitpause =1
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 15
value = 41,0

;925/ 920 add jump smnoke
[State 0, jump up explode]
type = Explod
trigger1 = Time = 15
anim = 6020
sprpriority = 4
postype = p1
pos = 0,20
bindtime = 1
pausemovetime = 22
removetime = -2
ignorehitpause = 1
scale = 0.6,0.3
ownpal = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 14
time = 24
pos = 0,0

[State 0, Width]
type = Width
trigger1 = 1
edge = 60,0
player = 0,0

[State 3330,Width]
type = null;Width
trigger1=time>=0
trigger1 = FrontEdgeDist < 100 && AnimElemNo(0) = 1
edge = 100,20

[State 0, TargetBind]
type = TargetBind
trigger1 = 1;time = 0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 820,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 730,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 1300,0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = 12
freq = 120
ampl = 8

[State 1305, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 40, 5
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = 1
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 39
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 42
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 45
y = -0.4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = -0.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 51
y = -0.2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 54
y = -0.1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 57
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 72
y = 12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 75
y = 14

[State 0, VelSet]
type = VelSet
trigger1 = time >= 78
y = 0
[State 0, PosSet]
type = PosSet
trigger1 = time >= 78
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1=time = 80
value = 3190
ctrl = 0

[Statedef 3190]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3140
juggle = 0
poweradd = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 14
time = 24
pos = 0,0

[State 0, Width]
type = Width
trigger1 = 1
edge = 85,0
player = 0,0

[State 3330,Width]
type = null;Width
trigger1=time>=0
trigger1 = FrontEdgeDist < 100 && AnimElemNo(0) = 1
edge = 100,20

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 820,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 8
value = 102,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = 190,0

[State 1305, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 40, 5
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, Explod1]
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 8
trigger4 = animelem = 10
anim = 7005
pos = -80,-40
postype = p2  ;p2,front,back,left,right
facing = -1
bindtime = 1
vel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, Explod2]
type = Explod
trigger1 = animelem = 9
trigger2 = animelem = 11
trigger3 = animelem = 4
anim = 7005
pos = -90,-20
postype = p2  ;p2,front,back,left,right
facing = -1
bindtime = 1
vel = 0,0
removetime = -2
supermove = 0
pausemove = 0
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = 12
freq = 120
ampl = 8

[State 0, EnvShake]
type = EnvShake
trigger1 = time=16
time = 24
freq = 120
ampl = 4

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = -3
y=-8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
y=-6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
y=-4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 49
y=-2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y=-1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y=0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y=2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 61
y=4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 64
y=6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 67
y=8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y=10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 73
y=12

[State 0,ChangeState]
type = ChangeState
trigger1=time>=43
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3149
ctrl = 0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
trigger5 = animelem = 9
trigger6 = animelem = 11
anim = 8100
sprpriority = 4
postype = p1
pos = -20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[Statedef 3149]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 3149
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3175]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3125

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = -1
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 49
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 10

[State 0,ChangeState]
type = ChangeState
trigger1=p2stateno=3180
value = 3185
ctrl = 0

[Statedef 3185]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=0
value = -100
kill = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3135

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = -1
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 33
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 39
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 42
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 45
y = -0.4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 48
y = -0.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 51
y = -0.2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 54
y = -0.1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 57
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 72
y = 12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 75
y = 14
[State 0, VelSet]
type = VelSet
trigger1 = time >= 78
y = 16

[State 0,ChangeState]
type = ChangeState
trigger1=p2stateno=3190
value = 3195
ctrl = 0

[Statedef 3195]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=0
value = -100
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=20
trigger2 = time=30
value = -35
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time= 38
value = -100
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3145

[State 0, VelSet]
type = null;VelSet
trigger1 = time >= 15
x = -6

[State 0,ChangeState]
type = ChangeState
trigger1=time=40
value = 3198
ctrl = 0

[Statedef 3198]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, PalFXWiz]
type = PalFX
trigger1 = time=0
time = 50
add = 240,50,0
mul = 250,224,120
sinadd = 110,55,85,10
invertall = 0
color = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3199

[State 0, PosAdd]
type = PosAdd
trigger1 =time = 0
x = -60

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -3
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 12

;800
[State 0, VarAdd]
type = VarAdd
triggerall=var(40) = 1
trigger1 = time = 0
v = 54
value = -300
persistent = 0
[State 0, VarAdd]
type = VarAdd
triggerall=var(40) = 1
trigger1 = time = 0
v = 44
value = -300
persistent = 0

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

;====<Samurai's Revenge>=
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
pos = ceil(0 * const(size.xScale)), ceil(-80 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =730,1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 210,3]
type = ChangeState
trigger1 = time = 38
value = 3201
ctrl = 0

[Statedef 3201]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3205
juggle = 0
poweradd = 0

[State 0, VarSet]
type = VarSet
trigger1 = prevstateno = [1000,2999]
trigger1 = time = 1
v = 20
value = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0;4
x = 2
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 2;6
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4;8
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6;10
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8;12
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1=time>= 2
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3202
ctrl = 0

[Statedef 3202]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3210
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 5
value = 100,0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
anim = 8100
sprpriority = 4
postype = p1
pos = -20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
x = 0

[State 3210,HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
Triggerall = time=0
trigger1 = p2statetype != A
trigger1 = p2stateno != [150,152]
Trigger2 = p2stateno=52 || p2stateno = 0|| p2stateno = [10,12]
attr = S, HA
hitflag = MA
guardflag = -1
pause.time = 14,14
guard.pausetime = 14,14
ground.cornerpush.veloff = 0
guard.cornerpush.veloff =  0
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -6
air.velocity = -1,-8
yaccel = 0.55
guard.velocity = -6
priority = 3
sprpriority = 1
p2facing = 1
p1stateno = 3220
p2stateno = 3225
fall = 1
fall.recover = 0
getpower = 0
GivePower = 40
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -70
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 10
envshake.freq = 120
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 120
fall.envshake.ampl = 6

[State 3210,HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 3
triggerall = time = 0
trigger1 = p2statetype = A
priority = 3, Hit
attr = S,HA
hitflag = AF
guardflag = MAF
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -12
air.velocity = -3,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -15
guard.cornerpush.veloff = -15
getpower = 0,0
GivePower = 36,36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -70
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 10
envshake.freq = 120
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 120
fall.envshake.ampl = 6

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 1402
ctrl = 0

[Statedef 3220]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3220
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 4,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 4,0

[State 0, TargetBind]
type = TargetBind
trigger1 = 1
time = 1
pos = 0,0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 7

[State 0, Width]
type = null;Width
trigger1 = 1
edge = 40,0

[State 1205, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 30;10
value = 3230

[State 0,ChangeState]
type = null;ChangeState
trigger1= frontedgebodydist <= 50
trigger1 = time >= 70
value = 3230
ctrl = 0

[Statedef 3230]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3230
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 =  time = 0
trigger2 =  time = 5
trigger3 =  time = 20
value = -30
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 =  time = 0
trigger2 =  time = 5
trigger3 =  time = 20
value = 1

[State 0,Explod]
type = Explod
trigger1 = time = 4
anim = 7235
sprpriority = 0
postype = left
pos = -60,-60
bindtime = 1
facing = 1
pausemovetime = 0
removetime = 16
scale = 2,2
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 0, BGPalFX]
type = null;BGPalFX
trigger1 = time = 3
time = 16
add = 256,0,0
mul = 255,255,255
;sinadd = 0,0,0,10
;invertall = 0
color = 256
;ignorehitpause =
;persistent =

[State 0, PalFX]
type = PalFX
trigger1 = time = 3
time = 16
add = 0,0,0
mul = 0,0,0
invertall = 0
color = 256

[State 0,Explod]
type = Explod
trigger1 = time = 4
anim = 7225
sprpriority = 4
postype = p1
pos = 100,-80
bindtime = 1
facing = -1
pausemovetime = 0
removetime = -2
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 14
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 20
value = 2,8

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 820,2

[State 0, Width]
type = Width
trigger1 = 1
edge = 100,0
player = 0,0

[State 7784,bird ]						;explode when Guard Rolling
type = Explod
trigger1 = animtime = 0
anim = 3243
ID = 3243
sprpriority = 7
postype = p2
pos = 0,-80
bindtime = -1
pausemovetime = 0
removetime = -1
ignorehitpause = 1
scale = 1,1
ownpal = 1
facing=-1

[State 7784,bird ]						;explode when Guard Rolling
type = null;Explod
trigger1 = animelem = 2
anim = 7205+(random%3)
sprpriority = 6
postype = p1
pos = 80,-80
bindtime = -1
pausemovetime = 0
removetime =  -2
ignorehitpause = 1
scale = 1,1
ownpal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
time = 15
freq = 120
ampl = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3240
ctrl = 0

[Statedef 3240]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3240
juggle = 0
poweradd = 0

[State 0,Explod]
type = Explod
trigger1 = time = 0
anim = 7225
sprpriority = 4
postype = p2
pos = 0,-80
bindtime = 1
facing = 1
pausemovetime = 0
removetime = -2
scale = 1.3, 0.6
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = time = 0
value = 5,5

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -1
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1 = time >= 11
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3241
ctrl = 0

[Statedef 3241]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3241
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 16
value = 190,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 25
value = 196,0

;52 add landing smoke
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 8102
sprpriority = -2
postype = p1
pos = 0,0
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3250
ctrl = 0

[Statedef 3250]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3250
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = -15
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = 1

[State 0,Explod]
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 17
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 100,-65
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 6
trigger2 = animelem = 13
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 80,-80
bindtime = 1
removetime = -2
scale = 1.2,1.2
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 10
trigger2 = animelem = 22
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 90,-30
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1
vel = -0.5,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 13
trigger4 = animelem = 17
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
trigger2 = animelem = 17
trigger3 = animelem = 22
value = 2,8

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
time = 5
freq = 110
ampl = 5

[State 3250, Hit Spark]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 17
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-65 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 6
trigger2 = animelem = 13
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 10
trigger2 = animelem = 22
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-30 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, Width]
type = Width
trigger1 = 1
edge = 100,0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 6
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3251
ctrl = 0

[Statedef 3251]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3251
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = -15
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = 1

[State 0,Explod]
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 17
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 100,-65
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 6
trigger2 = animelem = 13
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 80,-80
bindtime = 1
removetime = -2
scale = 1.2,1.2
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 10
trigger2 = animelem = 22
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 90,-30
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1
vel = -0.5,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 13
trigger4 = animelem = 17
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
trigger2 = animelem = 17
trigger3 = animelem = 22
value = 2,8

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
time = 5
freq = 110
ampl = 5

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 17
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-65 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 6
trigger2 = animelem = 13
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 10
trigger2 = animelem = 22
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-30 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3259
ctrl = 0

[Statedef 3259]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3251
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = -15
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = 1

[State 0,Explod]
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 17
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 100,-65
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 6
trigger2 = animelem = 13
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 80,-80
bindtime = 1
removetime = -2
scale = 1.2,1.2
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 10
trigger2 = animelem = 22
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 90,-30
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1
vel = -0.5,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 13
trigger4 = animelem = 17
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
trigger2 = animelem = 17
trigger3 = animelem = 22
value = 2,8

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
time = 5
freq = 110
ampl = 5

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 17
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-65 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 6
trigger2 = animelem = 13
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 10
trigger2 = animelem = 22
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-30 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3253
ctrl = 0

[Statedef 3253]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3253
juggle = 0
poweradd = 0
[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 40,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 40,0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = -18
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 12

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 5
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3254
ctrl = 0

[Statedef 3254]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3252
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 3
trigger2 = time = 7
trigger3 = time = 11
value = -15
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = time = 3
trigger2 = time = 7
trigger3 = time = 11
value = 1

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, Width]
type = Width
trigger1 =  1
edge = 100,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 3
anim = 7205+(random%3)
sprpriority = 4
postype = p1
pos = 80,-40
bindtime = 1
removetime = -2
scale = 1,1
ownpal = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0,Explod]
type = Explod
trigger1 = time = 2
anim = 7231+(random%2)
sprpriority = 4
postype = p1
pos = 80,-40
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
[State 0,Explod]
type = Explod
trigger1 = time = 10
anim = 7231+(random%2)
sprpriority = 4
postype = p1
pos = 40,-40
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,8

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 7
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 11
value = 2,8

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 15
freq = 120
ampl = 5

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3255
ctrl = 0

[Statedef 3255]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3253
juggle = 0
poweradd = 0

[State 0, landing explode]
type = Explod
trigger1 = time = 0
anim = 8100
sprpriority = 4
postype = p1
pos = -10,10
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.2 ,1.2
ownpal = 1
ignorehitpause =1
persistent = 0

[State 40, 6]
type = PlaySnd
trigger1 = Time = 0
value = 40,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 40,0

[State 0, PlaySnd]
type = null;PlaySnd
trigger1 = animelem = 4
value = 40,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -4
y = -16
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1 = time >= 3
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3256
ctrl = 0

[Statedef 3256]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3254
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

;52 add landing smoke
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 102,0

[State 0, landing explode]
type = Explod
trigger1 = time = 12
anim = 8100
sprpriority = 4
postype = p1
pos = 60,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 1.2 ,1.2
ownpal = 1
ignorehitpause =1
persistent = 0

[State 0, landing explode]
type = Explod
trigger1 = time = 8
anim = 8100
sprpriority = 4
postype = p1
pos = 20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.9 ,0.9
ownpal = 1
ignorehitpause =1
persistent = 0

[State 0, landing explode]
type = Explod
trigger1 = time = 4
anim = 8100
sprpriority = 4
postype = p1
pos = -20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.7,0.7
ownpal = 1
ignorehitpause =1
persistent = 0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 8102
sprpriority = -2
postype = p1
pos = 0,0
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 8100
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 5
x = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
x = -3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
x = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 25
x = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 30
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 730,1

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3257
ctrl = 0

[Statedef 3257]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3255
juggle = 0
poweradd = 0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 4
anim = 8100
sprpriority = 4
postype = p1
pos = -20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 3
value = 100,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 4

[State 0, Width]
type = null;Width
trigger1 = 1
edge = 120,0

[State 0,ChangeState]
type = ChangeState
trigger1= frontedgebodydist <= 135
value = 3258
ctrl = 0

[Statedef 3258]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3256
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 4
trigger2 = time = 9
trigger3 = time = 14
trigger4 = time = 19
trigger5 = time = 24
value = -15
kill = 0
[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 29
value = -20
kill = 1

[State 0, HitAdd]
type = HitAdd
trigger1 = time = 4
trigger2 = time = 9
trigger3 = time = 14
trigger4 = time = 19
trigger5 = time = 24
trigger6 = time = 29
value = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 30
id =  3243

[State 0, EnvShake]
type = EnvShake
trigger1 = time = 4
time = 30
freq = 120
ampl = 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 4
trigger2 = time = 9
trigger3 = time = 14
trigger4 = time = 19
trigger5 = time = 24
trigger6 = time = 29
value = 2,9

[State 0,Explod]
type = Explod
trigger1 = time = 4
trigger2 = time = 14
trigger3 = time = 24
anim = 7230+(random%2)
sprpriority = 4
postype = p1
pos = 100,-60
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1
vel = -2,-2
[State 0,Explod]
type = Explod
trigger1 = time = 9
trigger2 = time = 19
trigger3 = time = 29
anim = 7230+(random%2)
sprpriority = 4
postype = p1
pos = 100,-60
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1
vel = -2,2

[State 0,Explod]
type = Explod
trigger1 = time = 4
trigger2 = time = 14
trigger3 = time = 24
anim = 7230+(random%2)
sprpriority = 4
postype = p1
pos = 100,-60
bindtime = 1
removetime = -2
scale = 3,3
ownpal = 1
vel = -4,-2
[State 0,Explod]
type = Explod
trigger1 = time = 9
trigger2 = time = 19
trigger3 = time = 29
anim = 7230+(random%2)
sprpriority = 4
postype = p1
pos = 100,-60
bindtime = 1
removetime = -2
scale = 3,3
ownpal = 1
vel = -4,2

[State 871, Hit Spark]
type = Helper
trigger1 = time = 4
trigger2 = time = 9
trigger3 = time = 14
trigger4 = time = 19
trigger5 = time = 24
trigger6 = time = 29
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-60 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
x = 0

[State 0, ChangeState]
type = null;ChangeState
trigger1 =  time = 50
value = 3260
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 70
value = 3270
ctrl = 0

[Statedef 3260]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3260
juggle = 0
poweradd = 0

[State 750, 4]
type = Explod
trigger1 = Time = 0
anim = 6020
sprpriority = 4
postype = p1
pos = 0,20
bindtime = 1
pausemovetime = 22
removetime = -2
ignorehitpause = 1
scale = 0.6,0.3
ownpal = 1

[State 40, 6]
type = PlaySnd
trigger1 = Time = 0
value = 40,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 40,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -2.5
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 10

[State 0,ChangeState]
type = ChangeState
trigger1 = time >= 3
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3270
ctrl = 0

[Statedef 3270]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 3270
juggle = 0
poweradd = 0

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = -2
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 8100
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3225]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3225

[State 0, ChangeState]
type = ChangeState
trigger1 = p2stateno = 3230
value = 3235
ctrl = 0

[Statedef 3235]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, PalFX]
type = PalFX
trigger1 = time = 3
time = 16
add = 0,0,0
mul = 0,0,0
invertall = 0
color = 256

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3235
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 23
value = 3237
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 180
value = 3238
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 270
value = 3239
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 306
value = 3237

[State 0, PosSet]
type = Posadd
trigger1 = time = 23
x = -130

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 474
value = 3245
ctrl = 0

[Statedef 3245]
type = A
movetype= H
physics = N
velset = 0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(5052)
value = 5052
persistent = 0
[State 1028, Anim 5050] ;Self falling animation
type = ChangeAnim
trigger1 = time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050
persistent = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -3
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 44
y = 10

[State 0, SelfState]
type = SelfState
trigger1 = time > 10 && pos Y >= 0 && vel Y > 0
value = 5100

;====<Final Samurai>=
[StateDef 3300]
type = S
physics = N
moveType = A
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

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1]
type = NotHitBy
trigger1 = Animelemtime(3) < 0
value = SCA

[State 3, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 181,0
channel = 0

[State 3300, ReversalDef]
type = ReversalDef
trigger1 = !var(16) && var(15) < 1
trigger1 = time = 0
attr = S,HT
reversal.attr = SCA,AA
sparkxy = -1
sparkno = -1
pausetime = 1,1
p1getp2facing = -1
p2facing = 1
hitsound = S2,2
p1stateno = 3310
p2stateno = 3315
ID = 3300

[State 800,TargetBind]
type = TargetBind
trigger1 = NumTarget(3300)
pos = ceil(60*const(size.xscale)),0
ID = 3300
IgnoreHitPause = 1
Persistent = 0

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 3310]
type = S
movetype = A
physics = U
anim = 3310

[State 810, Width]
type = Width
trigger1 = 1
value = 64,64

[State 3000,00]
type = allPalfx
trigger1 = time = 0
add = 250,250,250
mul = 250,250,250
time = 5
color = 0

[State 3000,00]
type = allPalfx
trigger1 = time = 90;
mul = 255,0,0
time = 2
invertall = 1

[State 1000,Pause]
type = Pause
trigger1 = Animelem = 1
time = 90;
movetime = 90

[State 810,TargetState]
type = TargetState
trigger1 = time = 0
value = 3315

[State 810, posadd]
type = posadd
trigger1 = AnimElem =1
x = 180

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElem =1
pos = ceil(-120*const(size.xscale)),ceil(0*const(size.yscale))
postype = P1
time = 1

[State 810,TargetState]
type = TargetState
trigger1 = time = 91;
value = 3316

[State 871, Hit Spark]
type = Helper
trigger1 = Animelem = 1
trigger1 = time = 0
trigger2 = time = 90
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P2
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = Animelem = 1
trigger1 = time = 0
trigger2 = time = 90
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P2
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3300,Explod]
type = Explod
trigger1 = time = 90
anim = 7232
sprpriority = 2
postype = p1
pos = -50,-45
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 810, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 90;
value = Ceil(ifElse(250 * fvar(11) < 7, -7, -250 * fvar(11))*(const(data.attack)*0.01))

[State 5120, 4]
type = HitAdd
trigger1 = time = 90;
value = 1

[State 810, 4]
type = PlaySnd
trigger1 = Animelem = 1
value = 1,7

[State 810, 4]
type = PlaySnd
trigger1 = time = 90;
value = 2,7

[State 3000, 3]
type = EnvShake
trigger1 = time = 0
time = 90
freq = 10
ampl = -2
phase = 2

[State 3000, 3]
type = EnvShake
trigger1 = time = 90;
time = 20
freq = 120
ampl = -32
phase = 240

[State 3, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 182,0
channel = 0

[State 810, 4]
type = PlaySnd
trigger1 = animelem = 5
value = 190,2

[State 810, PlaySnd]
type = ChangeState
trigger1 = time >= 200
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3315]
type = S
movetype = H
velset = 0,0

[State 810, Width]
type = Width
trigger1 = 1
value = 64,64

[State 10000, ScreenBound]
type = ScreenBound
trigger1 = 1
movecamera = 0,0

[Statedef 3316]
type = L
movetype = H
physics = N
facep2 = 1

[State 810, ]
type = posset
trigger1=AnimElem = 1
y = 0

[State 5]
type = veladd
trigger1 = time >= 8
y = 0.4

[State 1000, 3]
type = VelSet
trigger1=time = 0
x = 0
y = -15

[State 811, ChangeAnim]
type = ChangeAnim
Trigger1 = time = 0
value = 5050

[state 821,self]
type = selfstate
Trigger1 = vel y >= 0&& pos Y >= 0
value = 5100

[State 10000, ScreenBound]
type = ScreenBound
trigger1 = 1
movecamera = 0,0

;====<Max Final Samurai>=
[StateDef 3350]
type = S
physics = N
moveType = A
anim = 3350
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

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1]
type = NotHitBy
trigger1 = Animelemtime(3) < 0
value = SCA

[State 3, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 181,0
channel = 0

[State 3300, ReversalDef]
type = ReversalDef
trigger1 = !var(16) && var(15) < 1
trigger1 = time = 0
attr = S,HT
reversal.attr = SCA,AA
sparkxy = -1
sparkno = -1
pausetime = 1,1
p1getp2facing = -1
p2facing = 1
hitsound = S2,2
p1stateno = 3360
p2stateno = 3365
ID = 3350

[State 800,TargetBind]
type = TargetBind
trigger1 = NumTarget(3350)
pos = ceil(60*const(size.xscale)),0
ID = 3350
IgnoreHitPause = 1
Persistent = 0

[State 200, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[Statedef 3360]
type = S
movetype = A
physics = U
anim = 3310

[State 810, Width]
type = Width
trigger1 = 1
value = 64,64

[State 3000,00]
type = allPalfx
trigger1 = time = 0
add = 250,250,250
mul = 250,250,250
time = 5
color = 0

[State 3000,00]
type = allPalfx
trigger1 = time = 90;
mul = 255,0,0
time = 2
invertall = 1

[State 1000,Pause]
type = Pause
trigger1 = Animelem = 1
time = 90;
movetime = 90

[State 810,TargetState]
type = TargetState
trigger1 = time = 0
value = 3365

[State 810, posadd]
type = posadd
trigger1 = AnimElem =1
x = 180

[State 810, TargetBind]
type = TargetBind
trigger1 = AnimElem =1
pos = ceil(-120*const(size.xscale)),ceil(0*const(size.yscale))
postype = P1
time = 1

[State 810,TargetState]
type = TargetState
trigger1 = time = 91;
value = 3366

[State 871, Hit Spark]
type = Helper
trigger1 = Animelem = 1
trigger1 = time = 0
trigger2 = time = 90
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P2
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = Animelem = 1
trigger1 = time = 0
trigger2 = time = 90
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P2
pos = ceil(0 * const(size.xScale)), ceil(-55 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3350,Explod]
type = Explod
trigger1 = time = 90
anim = 7232
sprpriority = 2
postype = p1
pos = -50,-45
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 810, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 90;
value = Ceil(ifElse(350 * fvar(11) < 7, -7, -350 * fvar(11))*(const(data.attack)*0.01))

[State 5120, 4]
type = HitAdd
trigger1 = time = 90;
value = 1

[State 810, 4]
type = PlaySnd
trigger1 = Animelem = 1
value = 1,7

[State 810, 4]
type = PlaySnd
trigger1 = time = 90;
value = 2,7

[State 3000, 3]
type = EnvShake
trigger1 = time = 0
time = 90
freq = 10
ampl = -2
phase = 2

[State 3000, 3]
type = EnvShake
trigger1 = time = 90;
time = 20
freq = 120
ampl = -32
phase = 240

[State 3, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 182,0
channel = 0

[State 810, 4]
type = PlaySnd
trigger1 = animelem = 5
value = 190,2

[State 810, PlaySnd]
type = ChangeState
trigger1 = time >= 200
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 3365]
type = S
movetype = H
velset = 0,0

[State 810, Width]
type = Width
trigger1 = 1
value = 64,64

[State 10000, ScreenBound]
type = ScreenBound
trigger1 = 1
movecamera = 0,0

[Statedef 3366]
type = L
movetype = H
physics = N
facep2 = 1

[State 810, ]
type = posset
trigger1=AnimElem = 1
y = 0

[State 5]
type = veladd
trigger1 = time >= 8
y = 0.4

[State 1000, 3]
type = VelSet
trigger1=time = 0
x = 0
y = -15

[State 811, ChangeAnim]
type = ChangeAnim
Trigger1 = time = 0
value = 5050

[state 821,self]
type = selfstate
Trigger1 = vel y >= 0&& pos Y >= 0
value = 5100

[State 10000, ScreenBound]
type = ScreenBound
trigger1 = 1
movecamera = 0,0

;====<Slasher Attack>=
[StateDef 3400]
type = S
physics = N
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -1000
faceP2 = 1

[State 3400, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

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

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3400, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3400, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3400]
type = turn
trigger1 = time = 0
trigger1 = p2dist X <= -10
persistent = 0

[State 3400, a]
type = Width
trigger1 = 1
value = 20, 0

[State 3400, 1]
type = PlaySnd
trigger1 = time = 0
value = 730, 1

[State 3400, 3]
type = NotHitBy
trigger1 = time = 2
value = SCA
time = 16

[State 3400, a]
type = Width
trigger1 = 1
value = 15, 0

[State 3400, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0

[State 3400, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 7

[State 3400, 3]
type = VelSet
trigger1 = AnimElem = 3
x = 4

[State 3400, 3]
type = VelSet
trigger1 = hitcount = 1
x = 8

[State 3400, Dust Helper]
type = Helper
trigger1 = animelem = 5
helperType = Normal
stateNo = 8103
pos = 50,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3400, 4]
type = HitDef
trigger1 = TIME=0
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 83 < 7, 7, fvar(11) * 83)), 7
pausetime = 0, 12
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
guard.sparkNo = -1 + 0*(var(34) := 8001)
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 10
ground.hittime = 49
ground.velocity = 10
air.velocity = 8, -1
guard.slidetime = 19
guard.hittime = 12
guard.velocity = -8
givepower = 10

[State 3400, Explod]
type = Explod
trigger1 = animelem=3
anim = 1003
ID = 1003
pos = 25,-5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3400, 5]
type = ChangeState
trigger1 = hitcount = 1 && AnimTime = 0
value = 3401
ctrl = 0

[State 3400, 5]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

; Jab Jigouku Scrape
[Statedef 3401]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1000
Juggle = 4

[State 3401, PlaySnd]
type = PlaySnd
trigger1 = TIME=0
value = S1,8
volume = 255

[State 3401, ScreenBound]
type = ScreenBound
triggerall = 1
trigger1 = time
value = -1
movecamera = 0,0

[State 3401, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3401]
type = turn
trigger1 = time = 0
trigger1 = p2dist X <= -10
persistent = 0

[State 3401, a]
type = Width
trigger1 = 1
value = 20, 0

[State 3401, 1]
type = PlaySnd
trigger1 = time = 0
value = 730, 1

[State 3401, a]
type = Width
trigger1 = 1
value = 15, 0

[State 3401, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0

[State 3401, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 7

[State 3401, 3]
type = VelSet
trigger1 = AnimElem = 3
x = 44

[State 3401, 4]
type = HitDef
trigger1 = TIME=0
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 83 < 7, 7, fvar(11) * 83)), 7
pausetime = 0, 12
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
guard.sparkNo = -1 + 0*(var(34) := 8001)
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 8
ground.hittime = 49
ground.velocity = 10
air.velocity = -2, -1
guard.slidetime = 19
guard.hittime = 12
guard.velocity = -8
givepower = 10

[State 3401, Explod]
type = Explod
trigger1 = animelem=3
anim = 1003
ID = 1003
pos = 25,-5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3401, Dust Helper]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8103
pos = 50,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3401, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 3402
ctrl = 0

; Fierce Jigouku Scrape
[Statedef 3402]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1002
Juggle = 4

[State 3402, PlaySnd]
type = PlaySnd
trigger1 = TIME=0
value = S1,8
volume = 255

[State 3402, ScreenBound]
type = ScreenBound
triggerall = 1
trigger1 = time
value = -1
movecamera = 0,0

[State 3402]
type = turn
trigger1 = time = 0
trigger1 = p2dist X <= -10
persistent = 0

[State 3402, a]
type = Width
trigger1 = 1
value = 20, 0

[State 3402, 1]
type = PlaySnd
trigger1 = time = 0
value = 730, 1

[State 3402, a]
type = Width
trigger1 = 1
value = 15, 0

[State 3402, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0

[State 3402, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 8

[State 3402, 3]
type = VelSet
trigger1 = AnimElem = 2
x = 44

[State 3402, 4]
type = HitDef
trigger1 = TIME=0
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Back
damage = ceil(ifElse(fvar(11) * 83 < 7, 7, fvar(11) * 83)), 7
pausetime = 11, 11
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
guard.sparkNo = -1 + 0*(var(34) := 8001)
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -20, -5
fall = 1
air.velocity = -20, -6
guard.slidetime = 19
guard.hittime = 19
guard.velocity = -9
givepower = 45
FALL=1

[State 3402, Dust Helper]
type = Helper
trigger1 = animelem = 5
helperType = Normal
stateNo = 8103
pos = 50,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3402, Explod]
type = Explod
trigger1 = animelem=3
anim = 1005
ID = 1005
pos = -25,-5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3402, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<Max Slasher Attack>=
[StateDef 3450]
type = S
physics = N
moveType = A
anim = 3400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3450, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

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

[State 3450, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3450, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3450, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3450]
type = turn
trigger1 = time = 0
trigger1 = p2dist X <= -10
persistent = 0

[State 3450, a]
type = Width
trigger1 = 1
value = 20, 0

[State 3450, 1]
type = PlaySnd
trigger1 = time = 0
value = 730, 1

[State 3450, 3]
type = NotHitBy
trigger1 = time = 2
value = SCA
time = 16

[State 3450, a]
type = Width
trigger1 = 1
value = 15, 0

[State 3450, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0

[State 3450, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 7

[State 3450, 3]
type = VelSet
trigger1 = AnimElem = 3
x = 8

[State 3450, 3]
type = VelSet
trigger1 = hitcount = 1
x = 8

[State 3450, Dust Helper]
type = Helper
trigger1 = animelem = 5
helperType = Normal
stateNo = 8103
pos = 50,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3450, 4]
type = HitDef
trigger1 = TIME=0
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
pausetime = 0, 12
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
guard.sparkNo = -1 + 0*(var(34) := 8001)
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 10
ground.hittime = 49
ground.velocity = 10
air.velocity = 8, -1
guard.slidetime = 19
guard.hittime = 12
guard.velocity = -8
givepower = 10

[State 3450, Explod]
type = Explod
trigger1 = animelem=3
anim = 1003
ID = 1003
pos = 25,-5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3450, 5]
type = ChangeState
trigger1 = hitcount = 1 && AnimTime = 0
value = 3451
ctrl = 0

[State 3450, 5]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

; Jab Jigouku Scrape
[Statedef 3451]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1000
Juggle = 4

[State 3451, PlaySnd]
type = PlaySnd
trigger1 = TIME=0
value = S1,8
volume = 255

[State 3451, ScreenBound]
type = ScreenBound
triggerall = 1
trigger1 = time
value = -1
movecamera = 0,0

[State 3451, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3451]
type = turn
trigger1 = time = 0
trigger1 = p2dist X <= -10
persistent = 0

[State 3451, a]
type = Width
trigger1 = 1
value = 20, 0

[State 3451, 1]
type = PlaySnd
trigger1 = time = 0
value = 730, 1

[State 3451, a]
type = Width
trigger1 = 1
value = 15, 0

[State 3451, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0

[State 3451, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 7

[State 3451, 3]
type = VelSet
trigger1 = AnimElem = 3
x = 44

[State 3451, 4]
type = HitDef
trigger1 = TIME=0
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
pausetime = 0, 12
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
guard.sparkNo = -1 + 0*(var(34) := 8001)
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 8
ground.hittime = 49
ground.velocity = 10
air.velocity = -2, -1
guard.slidetime = 19
guard.hittime = 12
guard.velocity = -8
givepower = 10

[State 3451, Explod]
type = Explod
trigger1 = animelem=3
anim = 1003
ID = 1003
pos = 25,-5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3451, Dust Helper]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8103
pos = 50,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3451, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 3452
ctrl = 0

; Jab Jigouku Scrape
[Statedef 3452]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1000
Juggle = 4

[State 3452, PlaySnd]
type = PlaySnd
trigger1 = TIME=0
value = S1,8
volume = 255

[State 3452, ScreenBound]
type = ScreenBound
triggerall = 1
trigger1 = time
value = -1
movecamera = 0,0

[State 3452, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3452]
type = turn
trigger1 = time = 0
trigger1 = p2dist X <= -10
persistent = 0

[State 3452, a]
type = Width
trigger1 = 1
value = 20, 0

[State 3452, 1]
type = PlaySnd
trigger1 = time = 0
value = 730, 1

[State 3452, a]
type = Width
trigger1 = 1
value = 15, 0

[State 3452, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0

[State 3452, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 7

[State 3452, 3]
type = VelSet
trigger1 = AnimElem = 3
x = 48

[State 3452, 4]
type = HitDef
trigger1 = TIME=0
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
pausetime = 0, 12
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
guard.sparkNo = -1 + 0*(var(34) := 8001)
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 8
ground.hittime = 49
ground.velocity = 10
air.velocity = -2, -1
guard.slidetime = 19
guard.hittime = 12
guard.velocity = -8
givepower = 10

[State 3452, Explod]
type = Explod
trigger1 = animelem=3
anim = 1003
ID = 1003
pos = 25,-5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3452, Dust Helper]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8103
pos = 50,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3452, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 3453
ctrl = 0

; Jab Jigouku Scrape
[Statedef 3453]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1000
Juggle = 4

[State 3453, PlaySnd]
type = PlaySnd
trigger1 = TIME=0
value = S1,8
volume = 255

[State 3453, ScreenBound]
type = ScreenBound
triggerall = 1
trigger1 = time
value = -1
movecamera = 0,0

[State 3453, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3453]
type = turn
trigger1 = time = 0
trigger1 = p2dist X <= -10
persistent = 0

[State 3453, a]
type = Width
trigger1 = 1
value = 20, 0

[State 3453, 1]
type = PlaySnd
trigger1 = time = 0
value = 730, 1

[State 3453, a]
type = Width
trigger1 = 1
value = 15, 0

[State 3453, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0

[State 3453, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 7

[State 3453, 3]
type = VelSet
trigger1 = AnimElem = 3
x = 44

[State 3453, 4]
type = HitDef
trigger1 = TIME=0
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
pausetime = 0, 12
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
guard.sparkNo = -1 + 0*(var(34) := 8001)
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 8
ground.hittime = 49
ground.velocity = 10
air.velocity = -2, -1
guard.slidetime = 19
guard.hittime = 12
guard.velocity = -8
givepower = 10

[State 3453, Explod]
type = Explod
trigger1 = animelem=3
anim = 1003
ID = 1003
pos = 25,-5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3453, Dust Helper]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8103
pos = 50,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3453, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 3454
ctrl = 0

; Jab Jigouku Scrape
[Statedef 3454]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1000
Juggle = 4

[State 3454, PlaySnd]
type = PlaySnd
trigger1 = TIME=0
value = S1,8
volume = 255

[State 3454, ScreenBound]
type = ScreenBound
triggerall = 1
trigger1 = time
value = -1
movecamera = 0,0

[State 3454, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3454]
type = turn
trigger1 = time = 0
trigger1 = p2dist X <= -10
persistent = 0

[State 3454, a]
type = Width
trigger1 = 1
value = 20, 0

[State 3454, 1]
type = PlaySnd
trigger1 = time = 0
value = 730, 1

[State 3454, a]
type = Width
trigger1 = 1
value = 15, 0

[State 3454, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0

[State 3454, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 7

[State 3454, 3]
type = VelSet
trigger1 = AnimElem = 3
x = 48

[State 3454, 4]
type = HitDef
trigger1 = TIME=0
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
pausetime = 0, 12
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
guard.sparkNo = -1 + 0*(var(34) := 8001)
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 8
ground.hittime = 49
ground.velocity = 10
air.velocity = -2, -1
guard.slidetime = 19
guard.hittime = 12
guard.velocity = -8
givepower = 10

[State 3454, Explod]
type = Explod
trigger1 = animelem=3
anim = 1003
ID = 1003
pos = 25,-5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3454, Dust Helper]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8103
pos = 50,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3454, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 3455
ctrl = 0

; Fierce Jigouku Scrape
[Statedef 3455]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1002
Juggle = 4

[State 3455, PlaySnd]
type = PlaySnd
trigger1 = TIME=0
value = S1,8
volume = 255

[State 3455, ScreenBound]
type = ScreenBound
triggerall = 1
trigger1 = time
value = -1
movecamera = 0,0

[State 3455]
type = turn
trigger1 = time = 0
trigger1 = p2dist X <= -10
persistent = 0

[State 3455, a]
type = Width
trigger1 = 1
value = 20, 0

[State 3455, 1]
type = PlaySnd
trigger1 = time = 0
value = 730, 1

[State 3455, a]
type = Width
trigger1 = 1
value = 15, 0

[State 3455, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0

[State 3455, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1, 8

[State 3455, 3]
type = VelSet
trigger1 = AnimElem = 2
x = 44

[State 3455, 4]
type = HitDef
trigger1 = TIME=0
attr = S, SA
hitflag = MAF
guardflag = MA
animtype = Back
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
pausetime = 11, 11
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
guard.sparkNo = -1 + 0*(var(34) := 8001)
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = High
ground.slidetime = 19
ground.hittime = 19
ground.velocity = -20, -5
fall = 1
air.velocity = -20, -6
guard.slidetime = 19
guard.hittime = 19
guard.velocity = -9
givepower = 45
FALL=1

[State 3455, Dust Helper]
type = Helper
trigger1 = animelem = 5
helperType = Normal
stateNo = 8103
pos = 50,5
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3455, Explod]
type = Explod
trigger1 = animelem=3
anim = 1005
ID = 1005
pos = -25,-5
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
ownpal = 1
sprpriority = 8

[State 3455, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<Sodom's Revenge>=
[StateDef 3500]
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
pos = ceil(0 * const(size.xScale)), ceil(-80 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 800,SND]
type = PlaySnd
trigger1 = time = 0
value =730,1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 210,3]
type = ChangeState
trigger1 = time = 38
value = 3501
ctrl = 0

[Statedef 3501]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 3205
juggle = 0
poweradd = 0

[State 0, VarSet]
type = VarSet
trigger1 = prevstateno = [1000,2999]
trigger1 = time = 1
v = 20
value = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0;4
x = 2
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 2;6
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4;8
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6;10
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8;12
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1=time>= 2
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3502
ctrl = 0

[Statedef 3502]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3210
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 5
value = 100,0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
anim = 8100
sprpriority = 4
postype = p1
pos = -20,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
x = 0

[State 3210,HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
Triggerall = time=0
trigger1 = p2statetype != A
trigger1 = p2stateno != [150,152]
Trigger2 = p2stateno=52 || p2stateno = 0|| p2stateno = [10,12]
attr = S, HA
hitflag = MA
guardflag = -1
pause.time = 14,14
guard.pausetime = 14,14
ground.cornerpush.veloff = 0
guard.cornerpush.veloff =  0
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -6
air.velocity = -1,-8
yaccel = 0.55
guard.velocity = -6
priority = 3
sprpriority = 1
p2facing = 1
p1stateno = 3530
p2stateno = 3535
fall = 0
fall.recover = 0
getpower = 0
GivePower = 40
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -70
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 10
envshake.freq = 120
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 120
fall.envshake.ampl = 6

[State 3210,HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 3
triggerall = time = 0
trigger1 = p2statetype = A
priority = 3, Hit
attr = S,HA
hitflag = AF
guardflag = MAF
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
pausetime = 10,10
guard.pausetime = 10,10
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -12
air.velocity = -3,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff = -15
guard.cornerpush.veloff = -15
getpower = 0,0
GivePower = 36,36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -70
guard.sparkNo = -1 + 0*(var(34) := 8001)
envshake.time = 10
envshake.freq = 120
envshake.ampl = 5
fall.envshake.time = 10
fall.envshake.freq = 120
fall.envshake.ampl = 6

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 1402
ctrl = 0

[Statedef 3530]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3230
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 =  time = 0
trigger2 =  time = 5
trigger3 =  time = 20
value = -30
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 =  time = 0
trigger2 =  time = 5
trigger3 =  time = 20
value = 1

[State 0,Explod]
type = Explod
trigger1 = time = 4
anim = 7235
sprpriority = 0
postype = left
pos = -60,-60
bindtime = 1
facing = 1
pausemovetime = 0
removetime = 16
scale = 2,2
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 0, BGPalFX]
type = null;BGPalFX
trigger1 = time = 3
time = 16
add = 256,0,0
mul = 255,255,255
;sinadd = 0,0,0,10
;invertall = 0
color = 256
;ignorehitpause =
;persistent =

[State 0, PalFX]
type = PalFX
trigger1 = time = 3
time = 16
add = 0,0,0
mul = 0,0,0
invertall = 0
color = 256

[State 3250, Hit Spark]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0,Explod]
type = Explod
trigger1 = time = 4
anim = 7225
sprpriority = 4
postype = p1
pos = 100,-80
bindtime = 1
facing = -1
pausemovetime = 0
removetime = -2
scale = 1,1
vel = 0,0
ownpal = 1
supermove = 0
removeongethit = 0
ignorehitpause = 1
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 14
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 20
value = 2,8

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 820,2

[State 0, Width]
type = Width
trigger1 = 1
edge = 100,0
player = 0,0

[State 7784,bird ]						;explode when Guard Rolling
type = null;Explod
trigger1 = animelem = 2
anim = 7205+(random%3)
sprpriority = 6
postype = p1
pos = 80,-80
bindtime = -1
pausemovetime = 0
removetime =  -2
ignorehitpause = 1
scale = 1,1
ownpal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
time = 15
freq = 120
ampl = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3550
ctrl = 0

[Statedef 3535]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, PalFX]
type = PalFX
trigger1 = time = 3
time = 16
add = 0,0,0
mul = 0,0,0
invertall = 0
color = 256

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3505

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 24
value = 3538

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 122
value = 3505

[State 0, ChangeState]
type = ChangeState
trigger1 =  time = 144
trigger1 = Pos X >= -155
value = 3557
ctrl = 0

[Statedef 3550]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3250
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = -20
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = 1

[State 0,Explod]
type = Explod
trigger1 = animelem = 7
trigger2 = animelem = 22
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 100,-65
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 11
trigger2 = animelem = 18
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 80,-80
bindtime = 1
removetime = -2
scale = 1.2,1.2
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 15
trigger2 = animelem = 27
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 90,-30
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1
vel = -0.5,0

[State 3250, Hit Spark]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 17
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-65 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 6
trigger2 = animelem = 13
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 10
trigger2 = animelem = 22
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-30 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
trigger2 = animelem = 11
trigger3 = animelem = 18
trigger4 = animelem = 22
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 15
trigger2 = animelem = 22
trigger3 = animelem = 27
value = 2,8

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 7
trigger2 = animelem = 11
trigger3 = animelem = 15
trigger4 = animelem = 18
trigger5 = animelem = 22
trigger6 = animelem = 27
time = 5
freq = 110
ampl = 5

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, Width]
type = Width
trigger1 = 1
edge = 100,0

[State 0, VelSet]
type = VelSet
trigger1 = time>= 0
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = time>= 3
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3551
ctrl = 0

[Statedef 3551]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3251
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = -20
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = 1

[State 0,Explod]
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 17
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 100,-65
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 6
trigger2 = animelem = 13
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 80,-80
bindtime = 1
removetime = -2
scale = 1.2,1.2
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 10
trigger2 = animelem = 22
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 90,-30
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1
vel = -0.5,0

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 17
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-65 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 6
trigger2 = animelem = 13
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 10
trigger2 = animelem = 22
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-30 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 13
trigger4 = animelem = 17
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
trigger2 = animelem = 17
trigger3 = animelem = 22
value = 2,8

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
time = 5
freq = 110
ampl = 5

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3559
ctrl = 0

[Statedef 3559]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3251
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = -20
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
value = 1

[State 0,Explod]
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 17
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 100,-65
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 6
trigger2 = animelem = 13
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 80,-80
bindtime = 1
removetime = -2
scale = 1.2,1.2
ownpal = 1
vel = -0.5,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 10
trigger2 = animelem = 22
anim = 7231+(random%2)
sprpriority = 2
postype = p1
pos = 90,-30
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1
vel = -0.5,0

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 2
trigger2 = animelem = 17
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(100 * const(size.xScale)), ceil(-65 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 6
trigger2 = animelem = 13
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-80 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 10
trigger2 = animelem = 22
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(90 * const(size.xScale)), ceil(-30 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 13
trigger4 = animelem = 17
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
trigger2 = animelem = 17
trigger3 = animelem = 22
value = 2,8

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 2
trigger2 = animelem = 6
trigger3 = animelem = 10
trigger4 = animelem = 13
trigger5 = animelem = 17
trigger6 = animelem = 22
time = 5
freq = 110
ampl = 5

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3553
ctrl = 0

[Statedef 3553]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1300
juggle = 0
poweradd = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1305,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 1000, 0
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
x = 5
y = -7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = -5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = 7

[State 0,ChangeState]
type = ChangeState
trigger1=time>16
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3554
ctrl = 0

[StateDef 3554]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1310
velSet = 0,0

[State 1305,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 100, 0

[State 1305,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 2, 800

[State 1305,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 800, 0
channel = 0

[State 1301, End]
type = ChangeState
trigger1 = animelem = 1
value = 3555
ctrl = 1

;
[Statedef 3555]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1320
juggle = 0
poweradd = 0

[State 0, Width]
type = Width
trigger1 = time = 0
edge = 80,0
player = 0,0

[State 0, TargetBind]
type = TargetBind
trigger1 = time=0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 730,1
Channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = 1300,0
Channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = 1
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 49
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 14

[State 0,ChangeState]
type = ChangeState
trigger1=time>=60
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3556
ctrl = 0

[Statedef 3556]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3552
juggle = 0
poweradd = 0

[State 0, HitAdd]
type = HitAdd
trigger1 =  time = 0
trigger2 =  time = 35
trigger3 =  time = 65
value = 1

[State 0,Explod]
type = Explod
trigger1 =  time = 0
trigger2 =  time = 35
trigger3 =  time = 65
anim = 7205+(random%3)
sprpriority = 4
postype = p1
pos = 80,-40
bindtime = 1
removetime = -2
scale = 1,1
ownpal = 1

[State 871, Hit Spark]
type = Helper
trigger1 =  time = 0
trigger2 =  time = 35
trigger3 =  time = 65
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0,Explod]
type = Explod
trigger1 =  time = 0
trigger2 =  time = 35
trigger3 =  time = 65
anim = 7231+(random%2)
sprpriority = 4
postype = p1
pos = 80,-40
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  time = 0
trigger2 =  time = 35
trigger3 =  time = 65
value = 2,8

[State 0, PlaySnd]
type = PlaySnd
trigger1 =  time = 0
trigger2 =  time = 35
trigger3 =  time = 65
value = 1,9

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
trigger1 = time <= 14
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 820,2

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = 15
freq = 120
ampl = 6

[State 1305, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 40, 5
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8103
pos = 60,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0,ChangeState]
type = ChangeState
trigger1=time>=90
value = 3560
ctrl = 0

[Statedef 3557]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1336

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
x = -1
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 43
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 46
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 49
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 52
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 58
y = -0.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 14

[State 0,ChangeState]
type = ChangeState
trigger1=p2stateno= 3556
value = 3558
ctrl = 0

[Statedef 3558]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=0
value = -10
kill = 1

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=35
value = -10
kill = 1

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=70
value = -15
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 3554

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 16
value = 3555

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 31
value = 3554

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 46
value = 3555

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 61
value = 3554

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 76
value = 3555

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 124
value = 1306
ctrl = 0

[Statedef 3560]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3253
juggle = 0
poweradd = 0
[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 40,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 40,0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = -18
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 9
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 12

[State 0, ChangeState]
type = ChangeState
trigger1 = time >= 5
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 3561
ctrl = 0

[Statedef 3561]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 3252
juggle = 0
poweradd = 0

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = time = 7
value = -15
kill = 0

[State 0, HitAdd]
type = HitAdd
trigger1 = time = 7
value = 1

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, Width]
type = Width
trigger1 =  1
edge = 100,0

[State 0,Explod]
type = Explod
trigger1 = animelem = 3
anim = 7205+(random%3)
sprpriority = 4
postype = p1
pos = 80,-40
bindtime = 1
removetime = -2
scale = 1,1
ownpal = 1

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 3
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(80 * const(size.xScale)), ceil(-40 * const(size.yScale))
size.xscale = 0.5
size.yscale = 0.5
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0,Explod]
type = Explod
trigger1 = time = 2
anim = 7231+(random%2)
sprpriority = 4
postype = p1
pos = 80,-40
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
[State 0,Explod]
type = Explod
trigger1 = time = 10
anim = 7231+(random%2)
sprpriority = 4
postype = p1
pos = 40,-40
bindtime = 1
removetime = -2
scale = 2,2
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 3
value = 2,8

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 7
value = 2,9

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 11
value = 2,8

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 15
freq = 120
ampl = 5

[State 0, ChangeState]
type = ChangeState
trigger1 =  animtime = 0
value = 3562
ctrl = 0

[Statedef 3562]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 3270
juggle = 0
poweradd = 0

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 52,0

;52 add landing smoke
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 7215
sprpriority = -2
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1
[State 0, landing explode]
type = Explod
trigger1 = Time = 0
anim = 8100
sprpriority = 4
postype = p1
pos = 0,5
bindtime = 1
pausemovetime = 0
removetime = -2
ignorehitpause = 0
scale = 0.6,0.6
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1
