; _________________________________________
;| Sodom by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<Jigoku Scrape>==
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

[State 1001, Varset]
type = VarSet
trigger1 = Time = 0
var(10) = ifelse((command="y"),1,ifelse((command="z"),2,0))
IgnoreHitPause = 1
Persistent = 1

[State 1000, Voice 1]
type = PlaySnd
trigger1 = var(10) = 0
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1000, Voice 2]
type = PlaySnd
trigger1 = var(10) = 1
trigger1 = AnimElem = 2
value = 4,0
channel = 0

[State 1000, Voice 3]
type = PlaySnd
trigger1 = var(10) = 2
trigger1 = AnimElem = 2
value = 1000,1
channel = 0

[State 1000, Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,7
channel = 1

[State 40, 3]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse(var(10)=1,1001,ifelse(var(10)=2,1002,1000))

[State 4, 3]
type = VelSet
trigger1 = Animelem = 3
x = ifElse(var(20), 4.86, 12)

[State 11000, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 0
trigger1 = time = 0
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 110)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 105, Dust Helper]
type = Helper
trigger1 = time = 12
trigger1 = var(10) = 0
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

[State 0, Explod]
type = Explod
trigger1 = animelem=2
trigger1 = var(10) = 0
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
sprpriority = 8

[State 1000,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 0
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

[State 11000, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 1
trigger1 = time = 0
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 120)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 105, Dust Helper]
type = Helper
trigger1 = time = 12
trigger1 = var(10) = 1
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

[State 0, Explod]
type = Explod
trigger1 = animelem=2
trigger1 = var(10) = 1
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
sprpriority = 0

[State 1000,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 1
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

[State 450, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 2
trigger1 = time = 0
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 130)), 0
getPower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 3, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -5.5, -7
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -13)
guard.cornerPush.velOff = 0
air.velocity = -3.49, -4.59
air.cornerPush.velOff = 0
yAccel = 0.55
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinadd= -255, -255, -255, 48

[State 105, Dust Helper]
type = Helper
trigger1 = time = 20
trigger1 = var(10) = 2
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

[State 0, Explod]
type = Explod
trigger1 = animelem=2
trigger1 = var(10) = 2
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
sprpriority = 8

[State 1000,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
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

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Ex Jigoku Scrape>=
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
var(25) = 44

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

[State 1000, Voice 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,0
channel = 0

[State 1000, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 4,0
channel = 1

[State 1000, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1000,1
channel = 2

[State 1000, Sound 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,7
channel = 1

[State 1000, Sound 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1,7
channel = 1

[State 1000, Sound 3]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1,7
channel = 1

[State 4, 3]
type = VelSet
trigger1 = Animelem = 3
x = 15

[State 4, 3]
type = VelSet
trigger1 = Animelem = 5
x = 0

[State 4, 3]
type = VelSet
trigger1 = Animelem = 6
x = 7

[State 4, 3]
type = VelSet
trigger1 = Animelem = 10
x = 0

[State 4, 3]
type = VelSet
trigger1 = Animelem = 11
x = 7

[State 11000, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Animelem = 3
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 55)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 105, Dust Helper]
type = Helper
trigger1 = time = 12
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

[State 0, Explod]
type = Explod
trigger1 = animelem=2
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

[State 1030,Explod]
type = Explod
trigger1 = movehit
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

[State 11000, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Animelem = 8
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 55)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 105, Dust Helper]
type = Helper
trigger1 = time = 20
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

[State 0, Explod]
type = Explod
trigger1 = animelem=6
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

[State 1030,Explod]
type = Explod
trigger1 = movehit
trigger1 = Animelem = 8
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

[State 450, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Animelem = 12
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 50 < 7, 7, fvar(11) * 55)), 0
getPower = 0,0
givepower = 36, 36
pauseTime = ifElse(var(20), 3, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 3, 8), ifElse(var(20), 4, 8)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 15 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = -5.5, -7
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -13)
guard.cornerPush.velOff = 0
air.velocity = -3.49, -4.59
air.cornerPush.velOff = 0
yAccel = 0.55
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinadd= -255, -255, -255, 48

[State 105, Dust Helper]
type = Helper
trigger1 = time = 50
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

[State 0, Explod]
type = Explod
trigger1 = animelem=11
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

[State 1030,Explod]
type = Explod
trigger1 = movehit
trigger1 = Animelem = 12
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

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Shiraha Catch>=
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

[State 1001, Varset]
type = VarSet
trigger1 = Time = 0
var(10) = ifelse(command="c",2,ifelse(command="b",1,0))
IgnoreHitPause = 1
Persistent = 1

[State 1]
type = NotHitBy
trigger1 = animelem = 2,<= 0
value = SCA

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,0
channel = 0

[State 600, 4]
type = ReversalDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 7
Trigger1 = var(10)=0
attr = S,AT
reversal.attr = SA,SA,AA
sparkNo = -1 + 0 * (var(33) := 0)
sparkxy = -1
pausetime = 3,3
hitSound = -1 + 0 * (var(31) := 800)
p1stateno = 1101
p2stateno = 1102
Time = 24

[State 600, 4]
type = ReversalDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 7
Trigger1 = var(10)=1
attr = S,AT
reversal.attr = SA,SA,AA
sparkNo = -1 + 0 * (var(33) := 0)
sparkxy = -1
pausetime = 3,3
hitSound = -1 + 0 * (var(31) := 800)
p1stateno = 1101
p2stateno = 1103
Time = 27

[State 600, 4]
type = ReversalDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 7
Trigger1 = var(10)=2
attr = S,AT
reversal.attr = SA,SA,AA
sparkno = -1
sparkxy = -1
pausetime = 3,3
hitsound = S2,800
p1stateno = 1101
p2stateno = 1104
Time = 30

[State 1100,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 800, 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

;Landing
[StateDef 1101]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1101
velSet = 0,0

[State 810,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 6
value = 4, 1
channel = 0

[State 810, Woosh Sound]
type = PlaySnd
trigger1= AnimElem = 6
value = 1,5
channel = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = time=1
time = 1
pos = 0,0

[State 1101, End]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

[Statedef 1102]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=45
value = -120
kill = 1

[State 0, SprPriority]
type = SprPriority
trigger1 = time>=0
value = -2
[State 0, SprPriority]
type = SprPriority
trigger1 = time>=33
value = 5

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1102

[State 0, PosAdd]
type = PosAdd
trigger1 = time=45
x = -60

[State 0, 0]
type = Velset
trigger1 = time>=46
x = -4
y = -10
[State 0, 0]
type = Velset
trigger1 = time>=50
y = -8
[State 0, 0]
type = Velset
trigger1 = time>=54
y = -4
[State 0, 0]
type = Velset
trigger1 = time>=58
y = -1
[State 0, 0]
type = Velset
trigger1 = time>=62
y = 1
[State 0, 0]
type = Velset
trigger1 = time>=66
y = 4
[State 0, 0]
type = Velset
trigger1 = time>=70
y = 8
[State 0, 0]
type = Velset
trigger1 = time>=74
y = 10

[State 825, Break Fall Air]
Type = SelfState
triggerall = time > 65
TriggerAll = Pos Y < -30 && Alive && CanRecover
Trigger1 = Command = "recovery"
Value = 5210

[State 825, Break Fall Ground]
Type = SelfState
triggerall = time > 65
TriggerAll = Pos Y >= -30 && Alive && CanRecover
Trigger1 = Command = "recovery"
Value = 5200

[State 210,3]
type = selfstate
trigger1 = time>48
trigger1 = vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
ctrl = 0

[Statedef 1103]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=45
value = -130
kill = 1

[State 0, SprPriority]
type = SprPriority
trigger1 = time>=0
value = -2
[State 0, SprPriority]
type = SprPriority
trigger1 = time>=33
value = 5

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1102

[State 0, PosAdd]
type = PosAdd
trigger1 = time=45
x = -63

[State 0, 0]
type = Velset
trigger1 = time>=46
x = -4
y = -10
[State 0, 0]
type = Velset
trigger1 = time>=50
y = -8
[State 0, 0]
type = Velset
trigger1 = time>=54
y = -4
[State 0, 0]
type = Velset
trigger1 = time>=58
y = -1
[State 0, 0]
type = Velset
trigger1 = time>=62
y = 1
[State 0, 0]
type = Velset
trigger1 = time>=66
y = 4
[State 0, 0]
type = Velset
trigger1 = time>=70
y = 8
[State 0, 0]
type = Velset
trigger1 = time>=74
y = 10

[State 825, Break Fall Air]
Type = SelfState
triggerall = time > 65
TriggerAll = Pos Y < -30 && Alive && CanRecover
Trigger1 = Command = "recovery"
Value = 5210

[State 825, Break Fall Ground]
Type = SelfState
triggerall = time > 65
TriggerAll = Pos Y >= -30 && Alive && CanRecover
Trigger1 = Command = "recovery"
Value = 5200

[State 210,3]
type = selfstate
trigger1 = time>48
trigger1 = vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
ctrl = 0

[Statedef 1104]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=45
value = -140
kill = 1

[State 0, SprPriority]
type = SprPriority
trigger1 = time>=0
value = -2
[State 0, SprPriority]
type = SprPriority
trigger1 = time>=33
value = 5

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1102

[State 0, PosAdd]
type = PosAdd
trigger1 = time=45
x = -65

[State 0, 0]
type = Velset
trigger1 = time>=46
x = -4
y = -10
[State 0, 0]
type = Velset
trigger1 = time>=50
y = -8
[State 0, 0]
type = Velset
trigger1 = time>=54
y = -4
[State 0, 0]
type = Velset
trigger1 = time>=58
y = -1
[State 0, 0]
type = Velset
trigger1 = time>=62
y = 1
[State 0, 0]
type = Velset
trigger1 = time>=66
y = 4
[State 0, 0]
type = Velset
trigger1 = time>=70
y = 8
[State 0, 0]
type = Velset
trigger1 = time>=74
y = 10

[State 825, Break Fall Air]
Type = SelfState
triggerall = time > 65
TriggerAll = Pos Y < -30 && Alive && CanRecover
Trigger1 = Command = "recovery"
Value = 5210

[State 825, Break Fall Ground]
Type = SelfState
triggerall = time > 65
TriggerAll = Pos Y >= -30 && Alive && CanRecover
Trigger1 = Command = "recovery"
Value = 5200

[State 210,3]
type = selfstate
trigger1 = time>48
trigger1 = vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
ctrl = 0

;====<Ex Shiraha Catch>=
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
var(25) = 45

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

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1]
type = NotHitBy
trigger1 = animelem = 2,<= 0
value = SCA

[State 1130, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,0
channel = 0

[State 600, 4]
type = ReversalDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = time = 7
attr = S,AT
reversal.attr = SA,SA,AA
sparkNo = -1 + 0 * (var(33) := 0)
sparkxy = -1
pausetime = 3,3
hitSound = -1 + 0 * (var(31) := 800)
p1stateno = 1131
p2stateno = 1132
Time = 34

[State 1130,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 800, 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

;Landing
[StateDef 1131]
type = S
movetype = A
physics = N
ctrl = 0
anim = 1101
velSet = 0,0

[State 810,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 6
value = 4, 1
channel = 0

[State 810, Woosh Sound]
type = PlaySnd
trigger1= AnimElem = 6
value = 1,5
channel = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 115

[State 0, TargetBind]
type = TargetBind
trigger1 = time=1
time = 1
pos = 0,0

[State 1101, End]
type = ChangeState
trigger1 = animtime = 0
value =0
ctrl = 1

[Statedef 1132]
type = A
physics = N
movetype = H
ctrl = 0
velset = 0,0
juggle = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=45
value = -155
kill = 1

[State 0, SprPriority]
type = SprPriority
trigger1 = time>=0
value = -2
[State 0, SprPriority]
type = SprPriority
trigger1 = time>=33
value = 5

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1102

[State 0, PosAdd]
type = PosAdd
trigger1 = time=45
x = -68

[State 0, 0]
type = Velset
trigger1 = time>=46
x = -4
y = -10
[State 0, 0]
type = Velset
trigger1 = time>=50
y = -8
[State 0, 0]
type = Velset
trigger1 = time>=54
y = -4
[State 0, 0]
type = Velset
trigger1 = time>=58
y = -1
[State 0, 0]
type = Velset
trigger1 = time>=62
y = 1
[State 0, 0]
type = Velset
trigger1 = time>=66
y = 4
[State 0, 0]
type = Velset
trigger1 = time>=70
y = 8
[State 0, 0]
type = Velset
trigger1 = time>=74
y = 10

[State 825, Break Fall Air]
Type = SelfState
triggerall = time > 65
TriggerAll = Pos Y < -30 && Alive && CanRecover
Trigger1 = Command = "recovery"
Value = 5210

[State 825, Break Fall Ground]
Type = SelfState
triggerall = time > 65
TriggerAll = Pos Y >= -30 && Alive && CanRecover
Trigger1 = Command = "recovery"
Value = 5200

[State 210,3]
type = selfstate
trigger1 = time>48
trigger1 = vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
ctrl = 0

;=<Jigoku Scrape>==
[StateDef 1200]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1001, Varset]
type = VarSet
trigger1 = Time = 0
var(10) = ifelse((command="b"),1,ifelse((command="c"),2,0))
IgnoreHitPause = 1
Persistent = 1

[State 1000, Sound]
type = PlaySnd
trigger1 = animelem = 1
value = 1,9
channel = 0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000,1
channel = 1

[State 1]
type = NotHitBy
trigger1 = animelem = 5,<= 0
value = C,AA

[State 40, 3]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse(var(10)=1,1202,ifelse(var(10)=2,1203,1201))

[State 4, 3]
type = VelSet
trigger1 = Animelem = 5 || Animelem = 8
trigger1 = var(10) = 0
x = ifElse(var(20), 4.86, 6)

[State 4, 4]
type = VelSet
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14
trigger1 = var(10) = 1
x = ifElse(var(20), 4.86, 8)

[State 4, 5]
type = VelSet
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14 || Animelem = 17 || Animelem = 20
trigger1 = var(10) = 2
x = ifElse(var(20), 4.86, 10)

[State 1000, Voice 1]
type = PlaySnd
trigger1 = var(10) = 0
trigger1 = Animelem = 5 || Animelem = 8
value = 4,0
channel = 2

[State 1000, Voice 2]
type = PlaySnd
trigger1 = var(10) = 1
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14
value = 4,0
channel = 2

[State 1000, Voice 3]
type = PlaySnd
trigger1 = var(10) = 2
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14 || Animelem = 17 || Animelem = 20
value = 4,0
channel = 2

[State 11000, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 0
trigger1 = Animelem = 5 || Animelem = 8
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 55)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1201
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1201
trigger1 = Animelem = 8
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 11000, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 1
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 45)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1202
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1202
trigger1 = Animelem = 8
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1202
trigger1 = Animelem = 11
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1202
trigger1 = Animelem = 14
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 11000, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 2
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14 || Animelem = 17 || Animelem = 20
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 37)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1203
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1203
trigger1 = Animelem = 8
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1203
trigger1 = Animelem = 11
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1203
trigger1 = Animelem = 14
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1203
trigger1 = Animelem = 17
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Anim = 1203
trigger1 = Animelem = 20
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<Jigoku Scrape>==
[StateDef 1201]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1001, Varset]
type = VarSet
trigger1 = Time = 0
var(10) = ifelse((command="b"),1,ifelse((command="c"),2,0))
IgnoreHitPause = 1
Persistent = 1

[State 1000, Sound 1]
type = PlaySnd
trigger1 = animelem = 4
value = 1,9
channel = 0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1000,1
channel = 1

[State 1200, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Anim = 1200
trigger1 = var(10) = 0
attr = S, SA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 75)), 7
hitflag = LFD
guardflag = M
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = L
ground.slidetime = 10
ground.hittime = 30
ground.velocity = ifElse(var(20), -7.5, -15), 0
air.velocity = -5,-4
envshake.time = 20
envshake.freq = 120
envshake.ampl = -4
envshake.phase = 160
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36

[State 1200, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Anim = 1200
trigger1 = var(10) = 1
attr = S, SA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 95)), 7
hitflag = LFD
guardflag = M
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = L
ground.slidetime = 10
ground.hittime = 30
ground.velocity = ifElse(var(20), -7.5, -15), 0
air.velocity = -5,-4
envshake.time = 20
envshake.freq = 120
envshake.ampl = -4
envshake.phase = 160
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36

[State 1200, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Anim = 1200
trigger1 = var(10) = 2
attr = S, SA
animtype = Hard
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 115)), 7
hitflag = LFD
guardflag = M
pauseTime = ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
ground.type = L
ground.slidetime = 10
ground.hittime = 30
ground.velocity = ifElse(var(20), -7.5, -15), 0
air.velocity = -5,-4
envshake.time = 20
envshake.freq = 120
envshake.ampl = -4
envshake.phase = 160
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36

[State 1201,Explod]
type = Explod
trigger1 = movehit
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1]
type = NotHitBy
trigger1 = animelem = 5,<= 0
value = C,AA

[State 1000, End]
type = ChangeState
trigger1 = command = "YR"
value = 1202
ctrl = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

[StateDef 1202]
type = S
physics = S
moveType = A
anim = 0
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 40, 3]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse(var(10)=1,1202,ifelse(var(10)=2,1203,1201))

[State 4, 3]
type = VelSet
trigger1 = Animelem = 5 || Animelem = 8
trigger1 = var(10) = 0
x = ifElse(var(20), 4.86, 6)

[State 4, 4]
type = VelSet
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14
trigger1 = var(10) = 1
x = ifElse(var(20), 4.86, 8)

[State 4, 5]
type = VelSet
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14 || Animelem = 17 || Animelem = 20
trigger1 = var(10) = 2
x = ifElse(var(20), 4.86, 10)

[State 1000, Voice 1]
type = PlaySnd
trigger1 = var(10) = 0
trigger1 = Animelem = 5 || Animelem = 8
value = 4,0
channel = 2

[State 1000, Voice 2]
type = PlaySnd
trigger1 = var(10) = 1
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14
value = 4,0
channel = 2

[State 1000, Voice 3]
type = PlaySnd
trigger1 = var(10) = 2
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14 || Animelem = 17 || Animelem = 20
value = 4,0
channel = 2

[State 11000, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 0
trigger1 = Animelem = 5 || Animelem = 8
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 55)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 0
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 0
trigger1 = Animelem = 8
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 11000, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 1
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 45)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 1
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 1
trigger1 = Animelem = 8
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 1
trigger1 = Animelem = 11
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 1
trigger1 = Animelem = 14
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 11000, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 2
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14 || Animelem = 17 || Animelem = 20
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 37)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
trigger1 = Animelem = 8
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
trigger1 = Animelem = 11
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
trigger1 = Animelem = 14
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
trigger1 = Animelem = 17
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
trigger1 = Animelem = 20
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<Ex Jigoku Scrape>==
[StateDef 1230]
type = S
physics = S
moveType = A
anim = 1204
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
var(25) = 64

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

[State 1000, Sound 1]
type = PlaySnd
trigger1 = animelem = 1
value = 1,9
channel = 1

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000,1
channel = 2

[State 1]
type = NotHitBy
trigger1 = animelem = 5,<= 0
value = C,AA

[State 4, 5]
type = VelSet
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14 || Animelem = 17 || Animelem = 20 || Animelem = 23 || Animelem = 26
x = ifElse(var(20), 4.86, 10)

[State 1030, Voice]
type = PlaySnd
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14 || Animelem = 17 || Animelem = 20 || Animelem = 23 || Animelem = 26
value = 4,0
channel = 3

[State 11000, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Animelem = 5 || Animelem = 8 || Animelem = 11 || Animelem = 14 || Animelem = 17 || Animelem = 20 || Animelem = 23 || Animelem = 26
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 31)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.32, -5.405
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201,Explod]
type = Explod
trigger1 = movehit
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Animelem = 8
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Animelem = 11
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Animelem = 14
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Animelem = 17
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Animelem = 20
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Animelem = 23
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1201,Explod]
type = Explod
trigger1 = movehit
trigger1 = Animelem = 26
anim = 7232
sprpriority = 2
postype = p1
pos = 80,0
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Butsumetsu Buster>=
[StateDef 1300]
type = S
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1001, Varset]
type = VarSet
trigger1 = Time = 0
var(10) = ifelse(command="z",2,ifelse(command="y",1,0))
IgnoreHitPause = 1
Persistent = 1

[State 1305,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 1000, 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
trigger1 = var(10) = 0
x = 4
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
trigger1 = var(10) = 0
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
trigger1 = var(10) = 0
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
trigger1 = var(10) = 0
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
trigger1 = var(10) = 0
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
trigger1 = var(10) = 0
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
trigger1 = var(10) = 0
y = 6

[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
trigger1 = var(10) = 1
x = 4.3
y = -6.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
trigger1 = var(10) = 1
y = -4.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
trigger1 = var(10) = 1
y = -1.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
trigger1 = var(10) = 1
y = 1.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
trigger1 = var(10) = 1
y = 2.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
trigger1 = var(10) = 1
y = 6.3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
trigger1 = var(10) = 1
y = 6.3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
trigger1 = var(10) = 2
x = 4.6
y = -6.6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
trigger1 = var(10) = 2
y = -4.6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
trigger1 = var(10) = 2
y = -1.6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
trigger1 = var(10) = 2
y = 1.6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
trigger1 = var(10) = 2
y = 2.6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
trigger1 = var(10) = 2
y = 6.6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
trigger1 = var(10) = 2
y = 6.6

[State 0,ChangeState]
type = ChangeState
trigger1=time>16
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1301
ctrl = 0

;Landing
[StateDef 1301]
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

[State 800, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
Trigger1 = var(10) = 0
attr = S, NA
hitflag = MAF
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 4
p2facing = 1
p1stateno = 1302
p2stateno = 1304
fall = 1
air.fall = 1
fall.recover = 1

[State 800, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
Trigger1 = var(10) = 1
attr = S, NA
hitflag = MAF
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 4
p2facing = 1
p1stateno = 1307
p2stateno = 1309
fall = 1
air.fall = 1
fall.recover = 1

[State 800, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
Trigger1 = var(10) = 2
attr = S, NA
hitflag = MAF
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 4
p2facing = 1
p1stateno = 1312
p2stateno = 1314
fall = 1
air.fall = 1
fall.recover = 1

[State 1305,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 800, 0
channel = 0

[State 1301, End]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 1302]
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
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 50
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 57
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 59
y = 10

[State 0,ChangeState]
type = ChangeState
trigger1=time>=60
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1303
ctrl = 0

[Statedef 1303]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1330
juggle = 0
poweradd = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
trigger1 = time <= 14
time = 1
pos = 0,0

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

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0,ChangeState]
type = Posadd
trigger1 = time = 15
x = -10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = -3
y = -7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 23
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 29
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 35
y = 8

[State 0, Width]
type = Width
trigger1 = time = 0
edge = 60,0
player = 0,0

[State 0,ChangeState]
type = ChangeState
trigger1=time>=11
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 0
ctrl = 1

[Statedef 1304]
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
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 50
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 55
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 57
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 59
y = 10

[State 0,ChangeState]
type = ChangeState
trigger1=p2stateno=1303
value = 1305
ctrl = 0

[Statedef 1305]
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
value = -200
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1335

[State 0, VelSet]
type = VelSet
trigger1 = time = 15
x = -6
[State 0, PosAdd]
type = PosAdd
trigger1 = time = 15
x = -60

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 15
value = 1306
ctrl = 0

[Statedef 1306]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

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

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1337

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0
[State 0, PosSet]
type = Posadd
trigger1 = time = 0
x = -18

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -3.5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
x = -3

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -8
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
y = -1
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
y = 7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 27
y = 9

[State 0, SelfState]
type = SelfState
trigger1 = time >= 2
trigger1 = pos Y >= 0 && vel Y > 0
value = 5100

;
[Statedef 1307]
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
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
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
value = 1308
ctrl = 0

[Statedef 1308]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1330
juggle = 0
poweradd = 0

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
type = Posset
trigger1 = time = 0
y = 0

[State 0,ChangeState]
type = Posadd
trigger1 = time = 15
x = -10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = -3
y = -7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 23
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 29
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 35
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1=time>=33
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1316
ctrl = 0

[Statedef 1309]
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
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 63
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 66
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 69
y = 12
[State 0, VelSet]
type = VelSet
trigger1 = time >= 70
y = 14

[State 0,ChangeState]
type = ChangeState
trigger1=p2stateno= 1308
value = 1310
ctrl = 0

[Statedef 1310]
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
value = -215
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1335

[State 0, VelSet]
type = VelSet
trigger1 = time = 15
x = -6
[State 0, PosAdd]
type = PosAdd
trigger1 = time = 15
x = -60

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 15
value = 1306
ctrl = 0

;
[Statedef 1312]
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
value = 1313
ctrl = 0

[Statedef 1313]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1330
juggle = 0
poweradd = 0

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
type = Posset
trigger1 = time = 0
y = 0

[State 0,ChangeState]
type = Posadd
trigger1 = time = 15
x = -10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = -3
y = -7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 23
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 29
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 35
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1=time>=33
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1316
ctrl = 0

[Statedef 1314]
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
trigger1=p2stateno= 1313
value = 1315
ctrl = 0

[Statedef 1315]
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
value = -235
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1335

[State 0, VelSet]
type = VelSet
trigger1 = time = 15
x = -6
[State 0, PosAdd]
type = PosAdd
trigger1 = time = 15
x = -60

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 15
value = 1306
ctrl = 0

[Statedef 1316]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 1338
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 50,0

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;====<Ex Butsumetsu Buster>=
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

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 45

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

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

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
value = 1331
ctrl = 0

;Landing
[StateDef 1331]
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

[State 800, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
attr = S, NA
hitflag = MAF
priority = 1, Miss
sparkNo = -1 + 0 * (var(33) := 0)
hitSound = -1 + 0 * (var(31) := 800)
sprpriority = 4
p2facing = 1
p1stateno = 1332
p2stateno = 1334
fall = 1
air.fall = 1
fall.recover = 1

[State 1305,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 800, 0
channel = 0

[State 1301, End]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;
[Statedef 1332]
type = A
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1320
juggle = 0
poweradd = 0

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 95

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
value = 1333
ctrl = 0

[Statedef 1333]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1330
juggle = 0
poweradd = 0

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
type = Posset
trigger1 = time = 0
y = 0

[State 0,ChangeState]
type = Posadd
trigger1 = time = 15
x = -10

[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = -3
y = -7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 21
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 23
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 26
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 29
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 35
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1=time>=33
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1316
ctrl = 0

[Statedef 1334]
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
trigger1=p2stateno= 1333
value = 1335
ctrl = 0

[Statedef 1335]
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
value = -250
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1335

[State 0, VelSet]
type = VelSet
trigger1 = time = 15
x = -6
[State 0, PosAdd]
type = PosAdd
trigger1 = time = 15
x = -60

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 15
value = 1306
ctrl = 0

[Statedef 1336]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 1338
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 50,0

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;=<Daikyou Burning>==
[StateDef 1400]
type = S
physics = S
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1001, Varset]
type = VarSet
trigger1 = Time = 0
var(10) = ifelse((command="b"),1,ifelse((command="c"),2,0))
IgnoreHitPause = 1
Persistent = 1

[State 1400,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0
channel = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = 3
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -2
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
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1=time>= 5
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1401
ctrl = 0

[Statedef 1401]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1410
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 4
trigger3 = animelem = 7
value = 100,0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
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
trigger1 = var(10) = 0
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
trigger1 = var(10) = 0
x = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
trigger1 = var(10) = 0
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 18
trigger1 = var(10) = 0
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
trigger1 = var(10) = 1
x = 7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
trigger1 = var(10) = 1
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
trigger1 = var(10) = 1
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
trigger1 = var(10) = 1
x = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 22
trigger1 = var(10) = 1
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
trigger1 = var(10) = 2
x = 8.2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
trigger1 = var(10) = 2
x = 7.6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
trigger1 = var(10) = 2
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
trigger1 = var(10) = 2
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
trigger1 = var(10) = 2
x = 0

[State 1400, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = var(10) = 0
trigger1 = p2statetype != A
attr = S, SA
hitflag = M
guardflag = M
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff =  0
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = ifElse(var(20), -3, -6), 0
air.velocity = -1,-8
yaccel = 0.55
guard.velocity = -6
priority = 3
sprpriority = 1
p2facing = 1
p1stateno = 1406
p2stateno = 1407
fall = 1
fall.recover = 1
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -61
sparkNo = -1 + 0 * (var(33) := 8015)

[State 1400, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = var(10) = 0
trigger1 = p2statetype = A
priority = 3, Hit
attr = S,NA
hitflag = AF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = ifElse(var(20), -6, -12), 0
air.velocity = -3,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff =  ifelse ( var(20) > 0,-5, -15)
guard.cornerpush.veloff =  ifelse ( var(20) > 0,-5, -15)
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -61
sparkNo = -1 + 0 * (var(33) := 8015)

[State 1400, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = var(10) = 1
trigger1 = p2statetype != A
attr = S, SA
hitflag = M
guardflag = M
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff =  0
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = ifElse(var(20), -3, -6), 0
air.velocity = -1,-8
yaccel = 0.55
guard.velocity = -6
priority = 3
sprpriority = 1
p2facing = 1
p1stateno = 1408
p2stateno = 1409
fall = 1
fall.recover = 1
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -61
sparkNo = -1 + 0 * (var(33) := 8015)

[State 1400, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = var(10) = 1
trigger1 = p2statetype = A
priority = 3, Hit
attr = S,NA
hitflag = AF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = ifElse(var(20), -6, -12), 0
air.velocity = -3,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff =  ifelse ( var(20) > 0,-5, -15)
guard.cornerpush.veloff =  ifelse ( var(20) > 0,-5, -15)
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -61
sparkNo = -1 + 0 * (var(33) := 8015)

[State 1400, HitDef 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = var(10) = 2
trigger1 = p2statetype != A
attr = S, SA
hitflag = M
guardflag = M
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff =  0
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = ifElse(var(20), -3, -6), 0
air.velocity = -1,-8
yaccel = 0.55
guard.velocity = -6
priority = 3
sprpriority = 1
p2facing = 1
p1stateno = 1410
p2stateno = 1411
fall = 1
fall.recover = 1
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -61
sparkNo = -1 + 0 * (var(33) := 8015)

[State 1400, HitDef 6]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = var(10) = 2
trigger1 = p2statetype = A
priority = 3, Hit
attr = S,NA
hitflag = AF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -12
air.velocity = -3,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff =  ifelse ( var(20) > 0,-5, -15)
guard.cornerpush.veloff =  ifelse ( var(20) > 0,-5, -15)
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -61
sparkNo = -1 + 0 * (var(33) := 8015)

[State 1401,Explod]
type = Explod
trigger1 = movehit
Trigger1 = Anim = 1410
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-56
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = time = 20
trigger1 = var(10) = 0
value = 1402
ctrl = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = time = 25
trigger1 = var(10) = 1
value = 1402
ctrl = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = time = 31
trigger1 = var(10) = 2
value = 1402
ctrl = 0

[Statedef 1402]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 1420
juggle = 0
poweradd = 0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
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

[State 1402,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 800, 0
channel = 0

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 1408]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1430
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 =animelem = 7
trigger2 =animelem = 10
trigger3 =animelem = 13
trigger4 =animelem = 16
value = 4,0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 7
trigger2 = animelem = 9
trigger3 = animelem = 11
trigger4 = animelem = 13
trigger5 = animelem = 15
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

[State 1408,Explod]
type = Explod
trigger1 = Animelem = 1
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-56
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 820,2

[State 1305, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 60, 5
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 6
helperType = Normal
stateNo = 8103
pos = 80,10
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
trigger1 = animelem = 6
helperType = Normal
stateNo = 8103
pos = 80,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = time=0
time = 10
freq = 120
ampl = 6

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 6
time = 15
freq = 120
ampl = 6

[State 3330,Width]
type = Width
trigger1=time>=0
trigger1 = FrontEdgeDist < 100 && AnimElemNo(0) = 1
edge = 100,20

[State 0, PlaySnd]
type = hitadd
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 16
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 16
value = 102,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 17
value = 190,0

[State 0, Explod1]
type = Explod
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 16
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
trigger3 = animelem = 17
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
trigger1 = animelem = 17
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
trigger1 = time=63
time = 60
freq = 120
ampl = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
x = 4
;
[State 0, VelSet]
type = VelSet
trigger1 = time >= 115
x = -3
y=-8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 118
y=-6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 121
y=-4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 124
y=-2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 127
y=-1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 130
y=0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 133
y=2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 136
y=4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 139
y=6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 142
y=8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 145
y=10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 148
y=12

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 60
time = 52
pos = 0,0

[State 0, Width]
type = Width
trigger1 = 1
edge = 85,0
player = 0,0

[State 0,ChangeState]
type = ChangeState
trigger1 = time = 111
value = 1403
ctrl = 0

[Statedef 1409]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, PalFXWiz]
type = PalFX
trigger1 = time=60
time = 50
add = 240,50,0
mul = 250,224,120
sinadd = 110,55,85,10
invertall = 0
color = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=0
value = -50
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=59
trigger2 = time=73
trigger3 = time=89
trigger4 = time=105
value = -25
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=112
value = -50
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1435

[State 0,ChangeState]
type = ChangeState
trigger1=time=115
value = 1405
ctrl = 0

[Statedef 1405]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

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
trigger1 = SelfAnimExist(5052)
value = 5052
persistent = 0
[State 1028, Anim 5050]
type = ChangeAnim2
trigger1 =time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 =time = 0
trigger1 = SelfAnimExist(5052)
value = 5052
persistent = 0
[State 1028, Anim 5050] ;Self falling animation
type = ChangeAnim
trigger1 =time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 =time = 0
x = -60

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -5
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 12

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

[Statedef 1406]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1460
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 =animelem = 7
trigger2 =animelem = 10
trigger3 =animelem = 13
value = 4,0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 7
trigger2 = animelem = 9
trigger3 = animelem = 11
trigger4 = animelem = 13
trigger5 = animelem = 15
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

[State 1406,Explod]
type = Explod
trigger1 = Animelem = 1
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-56
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 820,2

[State 1305, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 60, 5
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 6
helperType = Normal
stateNo = 8103
pos = 80,10
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
trigger1 = animelem = 6
helperType = Normal
stateNo = 8103
pos = 80,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = time=0
time = 10
freq = 120
ampl = 6

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 6
time = 15
freq = 120
ampl = 6

[State 3330,Width]
type = Width
trigger1=time>=0
trigger1 = FrontEdgeDist < 100 && AnimElemNo(0) = 1
edge = 100,20

[State 0, PlaySnd]
type = hitadd
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
value = 102,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 17
value = 190,0

[State 0, Explod1]
type = Explod
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
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
trigger3 = animelem = 17
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
trigger1 = animelem = 17
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
trigger1 = time=63
time = 60
freq = 120
ampl = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
x = 4
;
[State 0, VelSet]
type = VelSet
trigger1 = time >= 97
x = -3
y=-8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 100
y=-6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 103
y=-4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 106
y=-2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 109
y=-1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 112
y=0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 115
y=2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 118
y=4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 121
y=6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 124
y=8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 127
y=10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 130
y=12

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 60
time = 36
pos = 0,0

[State 0, Width]
type = Width
trigger1 = 1
edge = 85,0
player = 0,0

[State 0,ChangeState]
type = ChangeState
trigger1 = time = 95
value = 1403
ctrl = 0

[Statedef 1407]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 3660,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 0, PalFXWiz]
type = PalFX
trigger1 = time=60
time = 50
add = 240,50,0
mul = 250,224,120
sinadd = 110,55,85,10
invertall = 0
color = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=0
value = -50
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=59
trigger2 = time=73
trigger3 = time=89
value = -25
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time = 96
value = -50
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1465

[State 0,ChangeState]
type = ChangeState
trigger1=time= 96
value = 1405
ctrl = 0

[Statedef 1410]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1480
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 =animelem = 7
trigger2 =animelem = 10
trigger3 =animelem = 13
trigger4 =animelem = 16
trigger5 =animelem = 19
value = 4,0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 7
trigger2 = animelem = 9
trigger3 = animelem = 11
trigger4 = animelem = 13
trigger5 = animelem = 15
trigger6 = animelem = 17
trigger7 = animelem = 19
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

[State 1410,Explod]
type = Explod
trigger1 = Animelem = 1
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-56
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 820,2

[State 1305, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 60, 5
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 6
helperType = Normal
stateNo = 8103
pos = 80,10
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
trigger1 = animelem = 6
helperType = Normal
stateNo = 8103
pos = 80,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = time=0
time = 10
freq = 120
ampl = 6

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 6
time = 15
freq = 120
ampl = 6

[State 3330,Width]
type = null;Width
trigger1=time>=0
trigger1 = FrontEdgeDist < 100 && AnimElemNo(0) = 1
edge = 100,20

[State 0, PlaySnd]
type = hitadd
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 16
trigger5 = animelem = 19
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 16
trigger5 = animelem = 19
value = 102,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 17
value = 190,0

[State 0, Explod1]
type = Explod
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 16
trigger5 = animelem = 19
trigger6 = animelem = 22
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
trigger3 = animelem = 14
trigger4 = animelem = 17
trigger5 = animelem = 20
trigger6 = animelem = 23
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
trigger1 = animelem = 19
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
trigger1 = time=63
time = 60
freq = 120
ampl = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
x = 4
;
[State 0, VelSet]
type = VelSet
trigger1 = time >= 128
x = -3
y=-8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 131
y=-6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 134
y=-4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 137
y=-2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 140
y=-1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 143
y=0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 146
y=2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 149
y=4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 152
y=6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 155
y=8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 158
y=10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 161
y=12

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 60
time = 68
pos = 0,0

[State 0, Width]
type = Width
trigger1 = 1
edge = 85,0
player = 0,0

[State 0,ChangeState]
type = ChangeState
trigger1 = time = 127
value = 1403
ctrl = 0

[Statedef 1411]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, PalFXWiz]
type = PalFX
trigger1 = time=60
time = 66
add = 240,50,0
mul = 250,224,120
sinadd = 110,55,85,10
invertall = 0
color = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=0
value = -50
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=59
trigger2 = time=73
trigger3 = time=89
trigger4 = time=105
trigger5 = time=120
value = -25
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=128
value = -50
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1485

[State 0,ChangeState]
type = ChangeState
trigger1=time=129
value = 1405
ctrl = 0

[Statedef 1403]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1498
juggle = 0
poweradd = 0

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -3
y = -7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 7
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 11
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 17
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1=time>= 6
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1404
ctrl = 0

[StateDef 1404]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1499
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 52,0

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0
x = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 1
trigger1 = command != "holddown"
value = 0
ctrl = 1
[State 0, ChangeState]
type = ChangeState
trigger1 = time = 1
trigger1 = command = "holddown"
value = 11
ctrl = 1

;=<Ex Daikyou Burning>==
[StateDef 1430]
type = S
physics = S
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1430, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1430, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1430, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 184

[State 1430, EX FX]
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

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1400,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 0
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
x = 3
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -2
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
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1=time>= 5
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1431
ctrl = 0

[Statedef 1431]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1410
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 4
trigger3 = animelem = 7
value = 100,0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
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
trigger1 = var(10) = 3
x = 9.2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 10
trigger1 = var(10) = 3
x = 8.6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
trigger1 = var(10) = 3
x = 5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
trigger1 = var(10) = 3
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
trigger1 = var(10) = 3
x = 0

[State 1430, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = var(10) = 3
trigger1 = p2statetype != A
attr = S, SA
hitflag = M
guardflag = M
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff =  0
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = ifElse(var(20), -3, -6), 0
air.velocity = -1,-8
yaccel = 0.55
guard.velocity = -6
priority = 3
sprpriority = 1
p2facing = 1
p1stateno = 1440
p2stateno = 1441
fall = 1
fall.recover = 1
getPower = 0,0
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -61
sparkNo = -1 + 0 * (var(33) := 8015)

[State 1430, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = Time = 0
trigger1 = var(10) = 3
trigger1 = p2statetype = A
priority = 3, Hit
attr = S,NA
hitflag = AF
guardflag = MA
animtype = hard
air.animtype = hard
ground.type = high
damage = ceil(ifElse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 5, 10)
ground.slidetime = 20
ground.hittime = 20
air.hittime = 40
guard.hittime = 17
guard.ctrltime =17
ground.velocity = -12
air.velocity = -3,-8
yaccel = 0.55
guard.velocity = -12
ground.cornerpush.veloff =  ifelse ( var(20) > 0,-5, -15)
guard.cornerpush.veloff =  ifelse ( var(20) > 0,-5, -15)
getPower = 0,0
givePower = 36, 36
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -61
sparkNo = -1 + 0 * (var(33) := 8015)

[State 1431,Explod]
type = Explod
trigger1 = movehit
Trigger1 = Anim = 1410
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-56
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = time = 31
trigger1 = var(10) = 3
value = 1432
ctrl = 0

[Statedef 1432]
type = S
movetype = I
physics = N
velset = 0, 0
ctrl = 0
anim = 1420
juggle = 0
poweradd = 0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
trigger4 = animelem = 7
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

[State 1402,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 800, 0
channel = 0

[State 0,ChangeState]
type = Posset
trigger1 = time >= 0
y = 0

[State 0,ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 1435]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

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
trigger1 = SelfAnimExist(5052)
value = 5052
persistent = 0
[State 1028, Anim 5050]
type = ChangeAnim2
trigger1 =time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050
persistent = 0

[State 0, ChangeAnim2]
type = ChangeAnim
trigger1 =time = 0
trigger1 = SelfAnimExist(5052)
value = 5052
persistent = 0
[State 1028, Anim 5050] ;Self falling animation
type = ChangeAnim
trigger1 =time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 =time = 0
x = -60

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -5
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 4
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 12
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 16
y = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 24
y = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 28
y = 8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 32
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 36
y = 10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 40
y = 12

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100
ctrl = 0

[Statedef 1440]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1490
juggle = 0
poweradd = 0

[State 0, landing explode]
type = Explod
trigger1 = animelem = 7
trigger2 = animelem = 9
trigger3 = animelem = 11
trigger4 = animelem = 13
trigger5 = animelem = 15
trigger6 = animelem = 17
trigger7 = animelem = 19
trigger8 = animelem = 21
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
trigger1 =animelem = 7
trigger2 =animelem = 10
trigger3 =animelem = 13
trigger4 =animelem = 16
trigger5 =animelem = 19
trigger6 =animelem = 22
value = 4,0

[State 1440,Explod]
type = Explod
trigger1 = Animelem = 1
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-56
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 0
time = 1
pos = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = 820,2

[State 1305, Impact Dust]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
posType = P1
pos = 60, 5
ownPal = 1

[State 105, Dust Helper]
type = Helper
trigger1 = animelem = 6
helperType = Normal
stateNo = 8103
pos = 80,10
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
trigger1 = animelem = 6
helperType = Normal
stateNo = 8103
pos = 80,10
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = -1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = time=0
time = 10
freq = 120
ampl = 6

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 6
time = 15
freq = 120
ampl = 6

[State 3330,Width]
type = null;Width
trigger1=time>=0
trigger1 = FrontEdgeDist < 100 && AnimElemNo(0) = 1
edge = 100,20

[State 0, PlaySnd]
type = hitadd
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 16
trigger5 = animelem = 19
trigger6 = animelem = 22
value = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 16
trigger5 = animelem = 19
trigger6 = animelem = 22
value = 102,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 17
value = 190,0

[State 0, Explod1]
type = Explod
trigger1 = animelem = 7
trigger2 = animelem = 10
trigger3 = animelem = 13
trigger4 = animelem = 16
trigger5 = animelem = 19
trigger6 = animelem = 22
trigger7 = animelem = 25
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
trigger3 = animelem = 14
trigger4 = animelem = 17
trigger5 = animelem = 20
trigger6 = animelem = 23
trigger7 = animelem = 26
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
trigger1 = animelem = 19
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
trigger1 = time=63
time = 60
freq = 120
ampl = 4

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 60
x = 4
;
[State 0, VelSet]
type = VelSet
trigger1 = time >= 144
x = -3
y=-8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 147
y=-6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 150
y=-4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 153
y=-2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 156
y=-1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 159
y=0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 162
y=2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 165
y=4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 168
y=6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 171
y=8
[State 0, VelSet]
type = VelSet
trigger1 = time >= 174
y=10
[State 0, VelSet]
type = VelSet
trigger1 = time >= 177
y=12

[State 0, TargetBind]
type = TargetBind
trigger1 = time = 60
time = 82
pos = 0,0

[State 0, Width]
type = Width
trigger1 = 1
edge = 85,0
player = 0,0

[State 0,ChangeState]
type = ChangeState
trigger1 = time = 143
value = 1433
ctrl = 0

[Statedef 1441]
type = A
movetype = H
physics = N
velset = 0, 0
ctrl = 0
juggle = 0
poweradd = 0

[State 0, PalFXWiz]
type = PalFX
trigger1 = time=60
time = 86
add = 240,50,0
mul = 250,224,120
sinadd = 110,55,85,10
invertall = 0
color = 0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=0
value = -50
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=59
trigger2 = time=73
trigger3 = time=89
trigger4 = time=105
trigger5 = time=120
trigger6 = time=136
value = -25
kill = 0
[State 0, LifeAdd]
type = LifeAdd
trigger1 = time=144
value = -50
kill = 1

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 =time = 0
value = 1495

[State 0,ChangeState]
type = ChangeState
trigger1=time=145
value = 1435
ctrl = 0

[Statedef 1433]
type = S
movetype = A
physics = N
velset = 0, 0
ctrl = 0
anim = 1498
juggle = 0
poweradd = 0

[State 0,ChangeState]
type = Posset
trigger1 = time = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = -3
y = -7
[State 0, VelSet]
type = VelSet
trigger1 = time >= 3
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 6
y = -2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 7
y = -1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 11
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = time >= 14
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = time >= 17
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = time >= 20
y = 8

[State 0,ChangeState]
type = ChangeState
trigger1=time>= 6
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 1434
ctrl = 0

[StateDef 1434]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1499
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 52,0

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0
x = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 1
trigger1 = command != "holddown"
value = 0
ctrl = 1
[State 0, ChangeState]
type = ChangeState
trigger1 = time = 1
trigger1 = command = "holddown"
value = 11
ctrl = 1

;=<Shokattoken>==
[StateDef 1500]
type = S
physics = S
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1001, Varset]
type = VarSet
trigger1 = Time = 0
var(10) = ifelse((command="y"),1,ifelse((command="z"),2,0))
IgnoreHitPause = 1
Persistent = 1

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000,0
channel = 0

[State 1500, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = var(10) = 2
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 32.5 < 7, 7, fvar(11) * 32.5)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 7, 14), ifElse(var(20), 7, 14)
guard.pausetime = ifElse(var(20), 7, 14), ifElse(var(20), 7, 14)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1, -2), 0
yaccel = 0.55
guard.velocity = -4
air.velocity = -1.5 , -6
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 6
envshake.freq = 110
envshake.ampl = 4
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1500,Explod]
type = Explod
trigger1 = movehit
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-45
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger2 = movecontact
value = 1501
ctrl = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 4
x = 4

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 4
x = 6

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 4
x = 8

;
[StateDef 1501]
type = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1510
sprpriority = 2
juggle = 0
poweradd = 0

[State 210,3]
type = PlaySnd
trigger1 = animelem = 2
value = 40,0

[State 210,3]
type = PlaySnd
trigger1 = animelem = 1
value = 1000,1

[State 210,3]
type = PlaySnd
trigger1 = animelem = 1
value = 1,7

[State 750, 4]
type = Explod
trigger1 = Time = 0
anim = 6020		;F36
sprpriority = 4
postype = p1
pos = 0,10
bindtime = 1
pausemovetime = 22
removetime = -2
ignorehitpause = 1
scale = 0.6,0.3
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem=1
anim = 201
pos = 30,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 6,-16
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .3,.45
sprpriority = 3
ignorehitpause=1

[State 1501,HitDef 1]
type = HitDef
trigger1 = var(10) = 0
trigger1 = animelem = 2
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pausetime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1, -2), 0
yaccel = 0.55
guard.velocity = -11
air.velocity = -4.5 , -6
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -80
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 2
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1501,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 0
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-75
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501,HitDef 2]
type = HitDef
trigger1 = var(10) = 0
trigger1 = animelem = 3
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 9, 18), ifElse(var(20), 9, 18)
guard.pausetime = ifElse(var(20), 9, 18), ifElse(var(20), 9, 18)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1, -2), 0
yaccel = 0.6
guard.velocity = -11
air.velocity = -4.5 , -8
ground.cornerpush.veloff = -15
guard.cornerpush.veloff = -15
air.cornerpush.veloff = -15
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 20
envshake.freq = 110
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1501,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 0
trigger1 = animelem = 3
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-85
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501 ,HitDef 3]
type = HitDef
trigger1 = var(10) = 1
trigger1 = animelem = 1
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pausetime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1, -2), 0
yaccel = 0.55
guard.velocity = -11
air.velocity = -4.5 , -6
ground.cornerpush.veloff =0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 2
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1501,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 1
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-85
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501,HitDef 4]
type = HitDef
trigger1 = var(10) = 1
trigger1 = animelem = 2
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pausetime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1, -2), 0
yaccel = 0.55
guard.velocity = -11
air.velocity = -4.5 , -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -110
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 2
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1501,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 1
trigger1 = animelem = 2
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-105
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501,HitDef 5]
type = HitDef
trigger1 = var(10) = 1
trigger1 = animelem = 3
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 40 < 7, 7, fvar(11) * 40)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 9, 18), ifElse(var(20), 9, 18)
guard.pausetime = ifElse(var(20), 9, 18), ifElse(var(20), 9, 18)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -4, -8), 0
yaccel = 0.6
guard.velocity = -11
air.velocity = -4.5 , -8
ground.cornerpush.veloff = -15
guard.cornerpush.veloff = -15
air.cornerpush.veloff = -15
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -110
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 20
envshake.freq = 110
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1501,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 1
trigger1 = animelem = 3
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-85
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501 ,HitDef 6]
type = HitDef
trigger1 = var(10) = 2
trigger1 = animelem = 1
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 32.5 < 7, 7, fvar(11) * 32.5)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pausetime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1, -2), 0
yaccel = 0.55
guard.velocity = -11
air.velocity = -2.5 , -6
ground.cornerpush.veloff =0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -90
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 2
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1501,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
trigger1 = animelem = 1
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-85
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501,HitDef 7]
type = HitDef
trigger1 = var(10) = 2
trigger1 = animelem = 2
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 32.5 < 7, 7, fvar(11) * 32.5)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pausetime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1, -2), 0
yaccel = 0.55
guard.velocity = -11
air.velocity = -3.5 , -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -110
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 2
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1501,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
trigger1 = animelem = 2
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-105
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501,HitDef 8]
type = HitDef
trigger1 = var(10) = 2
trigger1 = animelem = 3
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 32.5 < 7, 7, fvar(11) * 32.5)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 9, 18), ifElse(var(20), 9, 18)
guard.pausetime = ifElse(var(20), 9, 18), ifElse(var(20), 9, 18)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -4, -8), 0
yaccel = 0.6
guard.velocity = -11
air.velocity = -4.5 , -8
ground.cornerpush.veloff = -15
guard.cornerpush.veloff = -15
air.cornerpush.veloff = -15
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -110
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 20
envshake.freq = 110
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1501,Explod]
type = Explod
trigger1 = movehit
trigger1 = var(10) = 2
trigger1 = animelem = 3
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-105
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 =  time = 0
x = 20

[State 0, Width]
type = Width
trigger1 = 1
player = 5,0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 2
x = 0
y = -5
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 5
y = -4
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 8
y = -3

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 10
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 20
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 23
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 26
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 29
y = 7
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = time >= 32
y = 9

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 2
x = 0
y = -7
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 5
y = -5
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 8
y = -3

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 10
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 20
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 23
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 26
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 29
y = 7
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 1
trigger1 = time >= 32
y = 9

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 2
x = 0
y = -10
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 5
y = -6
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 8
y = -3

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 10
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 20
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 23
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 26
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 29
y = 7
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 2
trigger1 = time >= 32
y = 9

[State 0, ChangeState]
type = ChangeState
trigger1 =  pos Y >= 0 && vel Y > 0
value = 1502
ctrl = 0

[StateDef 1502]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1520
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
;trigger1 = time =  0
trigger1 = animelem = 1
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

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0
x = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time >= 3
trigger1 = command = "holddown"
value = 1521

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = command != "holddown"
value = 0
ctrl = 1
[State 0, ChangeState]
type = ChangeState
trigger1 = time = 6
trigger1 = command = "holddown"
value = 11
ctrl = 1

;=<Ex Shokattoken>==
[StateDef 1530]
type = S
physics = S
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1430, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1430, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1430, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1430, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 184

[State 1430, EX FX]
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

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1000,0
channel = 1

[State 1500, HitDef]
type = HitDef
trigger1 = var(10) = 3
trigger1 = time = 0
priority = 4, Hit
attr = S,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 7, 14), ifElse(var(20), 7, 14)
guard.pausetime = ifElse(var(20), 7, 14), ifElse(var(20), 7, 14)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1.5, -1.5), 0
yaccel = 0.55
guard.velocity = -4
air.velocity = -1.5 , -7
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -50
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 0
air.fall = 1
fall.recover = 0
envshake.time = 6
envshake.freq = 110
envshake.ampl = 4
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1500,Explod]
type = Explod
trigger1 = movehit
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-45
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger2 = movecontact
value = 1531
ctrl = 0

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 4
x = 10

;
[StateDef 1531]
type = A
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1530
sprpriority = 2
juggle = 0
poweradd = 0

[State 210,3]
type = PlaySnd
trigger1 = animelem = 2
value = 40,0

[State 210,3]
type = PlaySnd
trigger1 = animelem = 1
value = 1000,1

[State 210,3]
type = PlaySnd
trigger1 = animelem = 1
value = 1,7

[State 750, 4]
type = Explod
trigger1 = Time = 0
anim = 6020		;F36
sprpriority = 4
postype = p1
pos = 0,10
bindtime = 1
pausemovetime = 22
removetime = -2
ignorehitpause = 1
scale = 0.6,0.3
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem=1
anim = 201
pos = 30,5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 6,-16
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .3,.45
ownpal = 1
sprpriority = 3
ignorehitpause=1

[State 1501 ,HitDef 1]
type = HitDef
trigger1 = var(10) = 3
trigger1 = animelem = 1
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pausetime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1.5, -1.5), 0
yaccel = 0.55
guard.velocity = -11
air.velocity = -2 , -8
ground.cornerpush.veloff =0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -90
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 2
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1500,Explod]
type = Explod
trigger1 = movehit
trigger1 = animelem = 1
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-85
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501,HitDef 2]
type = HitDef
trigger1 = var(10) = 3
trigger1 = animelem = 2
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pausetime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1.5, -1.5), 0
yaccel = 0.55
guard.velocity = -11
air.velocity = -2.5, -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -110
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 2
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1500,Explod]
type = Explod
trigger1 = movehit
trigger1 = animelem = 2
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-105
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501 ,HitDef 3]
type = HitDef
trigger1 = var(10) = 3
trigger1 = animelem = 3
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pausetime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -1.5, -1.5), 0
yaccel = 0.55
guard.velocity = -11
air.velocity = -2 , -10
ground.cornerpush.veloff =0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -90
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 0
envshake.freq = 110
envshake.ampl = 2
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1500,Explod]
type = Explod
trigger1 = movehit
trigger1 = animelem = 3
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-85
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1501,HitDef 4]
type = HitDef
trigger1 = var(10) = 3
trigger1 = animelem = 4
priority = 4, Hit
attr = A,SA
hitflag = MAF
guardflag = M
animtype = hard
air.animtype = back
ground.type = high
air.type = high
air.hittime = 14
damage = ceil(ifElse(fvar(11) * 33 < 7, 7, fvar(11) * 33)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = ifElse(var(20), 9, 18), ifElse(var(20), 9, 18)
guard.pausetime = ifElse(var(20), 9, 18), ifElse(var(20), 9, 18)
ground.slidetime = 12
ground.hittime = 15
guard.hittime = 15
guard.ctrltime =15
ground.velocity = ifElse(var(20), -4, -8), 0
yaccel = 0.6
guard.velocity = -11
air.velocity = -4.5 , -8
ground.cornerpush.veloff = -15
guard.cornerpush.veloff = -15
air.cornerpush.veloff = -15
sparkXY = -10 + 0 * (var(35) := 20), var(36) := -110
guardSound = -1 + 0 * (var(32) := 0)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkNo = -1 + 0 * (var(33) := 8015)
hitSound = -1 + 0 * (var(31) := 7)
fall = 1
air.fall = 1
fall.recover = 0
envshake.time = 20
envshake.freq = 110
envshake.ampl = 6
fall.envshake.time = 10
fall.envshake.freq = 110
fall.envshake.ampl = 6

[State 1500,Explod]
type = Explod
trigger1 = movehit
trigger1 = animelem = 4
anim = 7232
sprpriority = 2
postype = p1
pos = 80,-105
bindtime = 1
removetime = -2
scale = 1.5,1.5
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 0, PosAdd]
type = PosAdd
trigger1 =  time = 0
x = 20

[State 0, Width]
type = Width
trigger1 = 1
player = 5,0

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 2
x = 0
y = -12
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 5
y = -8
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 8
y = -3

[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 10
y = 0
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 20
y = 1
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 23
y = 3
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 26
y = 5
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 29
y = 7
[State 0, VelSet]
type = VelSet
trigger1 = var(10) = 3
trigger1 = time >= 32
y = 9

[State 0, ChangeState]
type = ChangeState
trigger1 =  pos Y >= 0 && vel Y > 0
value = 1532
ctrl = 0

[StateDef 1532]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 1520
juggle = 0
poweradd = 0

[State 0, PlaySnd]
type = PlaySnd
;trigger1 = time =  0
trigger1 = animelem = 1
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

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0
x = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time >= 3
trigger1 = command = "holddown"
value = 1521

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
trigger1 = command != "holddown"
value = 0
ctrl = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 6
trigger1 = command = "holddown"
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

[State 4, 3]
type = VelSet
trigger1 = Animelem = 3
x = 4.86

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000, 0
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,7
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
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
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8015)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 127), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 105, Dust Helper]
type = Helper
trigger1 = time = 12
helperType = Normal
stateNo = 8103
pos = 80,5
scale = 1.6,1.8
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 0, Explod]
type = Explod
trigger1 = animelem=2
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
sprpriority = 0

[State 1000,Explod]
type = Explod
trigger1 = movehit
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
value = 4, 2
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 101,0
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = time >= 0
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = time >= 8
x = 6
[State 0, VelSet]
type = VelSet
trigger1 = time >= 15
x = 4
[State 0, VelSet]
type = VelSet
trigger1 = time >= 17
x = 2
[State 0, VelSet]
type = VelSet
trigger1 = time >= 19
x = 0

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
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
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -10
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
