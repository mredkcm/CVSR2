; _________________________________________
;| B. B. Hood by varo_hades                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>====
;==

;====<SHYNESS & STRIKE>=
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, 1]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 6
trigger3 = animelem = 8
trigger4 = animelem = 10
trigger5 = animelem = 12
trigger6 = animelem = 14
trigger7 = animelem = 16
trigger8 = animelem = 18
trigger9 = animelem = 20
trigger10 = animelem = 22
trigger11 = animelem = 24
trigger12 = animelem = 26
trigger13 = animelem = 28
trigger14 = animelem = 30
trigger15 = animelem = 32
trigger16 = animelem = 34
trigger17 = animelem = 36
trigger18 = animelem = 38
ignorehitpause=1
value = 1, 5

[State 1000, 7]
type = ChangeState
triggerall = animelem = 3, >= 0 && animelem = 15, < 0
trigger1 = command != "holdx" && var(10)= 0
trigger2 = command != "holdy" && var(10)= 1
trigger3 = command != "holdz" && var(10)= 2
value = 1001

[State 1000, 7]
type = ChangeState
triggerall = animelem = 15, >= 0 && animelem = 27, < 0
trigger1 = command != "holdx" && var(10)= 0
trigger2 = command != "holdy" && var(10)= 1
trigger3 = command != "holdz" && var(10)= 2
value = 1002

[State 1000, 7]
type = ChangeState
triggerall = animelem = 27, >= 0
trigger1 = command != "holdx" && var(10)= 0
trigger2 = command != "holdy" && var(10)= 1
trigger3 = command != "holdz" && var(10)= 2
trigger4 = AnimTime = 0
value = 1003

;Shyness & Strike Small
[Statedef 1001]
type = S
movetype = A
physics = S
juggle = 10
velset = 7.5,0
ctrl = 0
anim = 1001
poweradd = 0
sprpriority = 2

[State 1001, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1000, 0
channel = 0
volume = 200

[State 1001]
type = VelSet
trigger1 = animelem = 3
x = 0

[State 1001, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, NA
damage = ceil(ifElse(fvar(11) * 110 < 7, 7, fvar(11) * 110)), 7
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MA
priority = 4, Hit
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -71
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3.8 ,-5.8
guard.velocity = -12
airguard.velocity = -11,-3
air.type = high
air.velocity = -3.8 ,-5.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
yaccel = .5
p2facing = 1
fall = 1
fall.recovertime = 60
Id = 1000
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48


[State 1001, 1]
type = PlaySnd
trigger1 = Time = 1
value = 1, 2

[State 1001, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Shyness & Strike Medium
[Statedef 1002]
type = S
movetype = A
physics = S
juggle = 10
velset = 7.5,0
ctrl = 0
anim = 1002
poweradd = 0
sprpriority = 2

[State 1002, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1000, 0
channel = 0
volume = 200

[State 1002]
type = VelSet
trigger1 = animelem = 3
x = 0

[State 1002, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, NA
damage = ceil(ifElse(fvar(11) * 115 < 7, 7, fvar(11) * 115)), 7
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MA
priority = 4, Hit
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -71
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3.8 ,-5.8
guard.velocity = -12
airguard.velocity = -11,-3
air.type = high
air.velocity = -3.8 ,-5.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
yaccel = .5
p2facing = 1
fall = 1
fall.recovertime = 60
ID = 1000
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48


[State 1002, 1]
type = PlaySnd
trigger1 = Time = 1
value = 1, 2

[State 1002, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Shyness & Strike Large
[Statedef 1003]
type = S
movetype = A
physics = S
juggle = 10
velset = 7.5,0
ctrl = 0
anim = 1003
poweradd = 0
sprpriority = 2

[State 1003, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1000, 0
channel = 0
volume = 200

[State 1003]
type = VelSet
trigger1 = animelem = 3
x = 0

[State 1003, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, NA
damage = ceil(ifElse(fvar(11) * 120 < 7, 7, fvar(11) * 120)), 7
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MA
priority = 4, Hit
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -71
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3.8 ,-5.8
guard.velocity = -12
airguard.velocity = -11,-3
air.type = high
air.velocity = -3.8 ,-5.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
yaccel = .5
p2facing = 1
fall = 1
fall.recovertime = 60
ID = 1000
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48


[State 1003, 1]
type = PlaySnd
trigger1 = Time = 1
value = 1, 2

[State 1003, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX SHYNESS & STRIKE>=
[StateDef 1030]
type = S
physics = S
moveType = A
anim = 1000
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
var(25) = 124

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

[State 1030, 1]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 6
trigger3 = animelem = 8
trigger4 = animelem = 10
trigger5 = animelem = 12
trigger6 = animelem = 14
trigger7 = animelem = 16
trigger8 = animelem = 18
trigger9 = animelem = 20
trigger10 = animelem = 22
trigger11 = animelem = 24
trigger12 = animelem = 26
trigger13 = animelem = 28
trigger14 = animelem = 30
trigger15 = animelem = 32
trigger16 = animelem = 34
trigger17 = animelem = 36
trigger18 = animelem = 38
ignorehitpause=1
value = 1, 5

[State 1030, 7]
type = ChangeState
trigger1 = animelem = 3, >= 0 && animelem = 15, < 0
value = 1031

;EX Shyness & Strike
[Statedef 1031]
type = S
movetype = A
physics = S
juggle = 10
velset = 8.5,0
ctrl = 0
anim = 1003
poweradd = 0
sprpriority = 2

[State 1003, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1000, 0
channel = 0
volume = 200

[State 1003]
type = VelSet
trigger1 = animelem = 3
x = 0

[State 1003, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, NA
damage = ceil(ifElse(fvar(11) * 130 < 7, 7, fvar(11) * 130)), 7
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MA
priority = 4, Hit
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -71
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3.8 ,-5.8
guard.velocity = -12
airguard.velocity = -11,-3
air.type = high
air.velocity = -3.8 ,-5.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getpower = 0
givepower = 35,35
yaccel = .5
p2facing = 1
fall = 1
fall.recovertime = 60
ID = 1000
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48


[State 1003, 1]
type = PlaySnd
trigger1 = Time = 1
value = 1, 2

[State 1003, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<CHEER & FIRE>=
[StateDef 1100]
type = S
physics = S
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, Sound]
type = PlaySnd
trigger1 = animelemtime(6) = 1
value = 1100, 1

[State 1100, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1100, 0
channel = 0
volume = 200

[State 1010, FIRE]
Type = explod
Trigger1 = AnimElem = 6
Trigger2 = AnimElem = 8
Trigger3 = AnimElem = 10
Trigger4 = AnimElem = 12
anim = 1101
ID = 1100
sprpriority = 3
ownpal = 1
removeongethit = 1
pos = 28, -98
scale=0.5,0.5

[State 1010, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, sp
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAFP
priority = 4, Hit
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -100
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3.8 ,-5.8
guard.velocity = -12
airguard.velocity = -11,-3
air.type = high
air.velocity = -3.8 ,-5.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = .5
p2facing = 1
fall = 1
fall.recovertime = 60
palFX.time = 35
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
Id = 1100


[State 1100, Flame Particles]
type = Helper
trigger1 = AnimElemTime(2) > 0
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1100, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX CHEER & FIRE>=
[StateDef 1130]
type = S
physics = S
moveType = A
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 124

[State 1130, EX FX]
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

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1130, Sound]
type = PlaySnd
trigger1 = animelemtime(6) = 1
value = 1100, 1

[State 1130, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1100, 0
channel = 0
volume = 200

[State 1130, FIRE]
Type = explod
Trigger1 = AnimElem = 6
Trigger2 = AnimElem = 8
Trigger3 = AnimElem = 10
Trigger4 = AnimElem = 12
anim = 1101
ID = 1100
sprpriority = 3
ownpal = 1
removeongethit = 1
pos = 28, -98
scale=0.5,0.5

[State 1130, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 10
trigger4 = AnimElem = 12
trigger5 = AnimElem = 14
attr = S, sp
damage = ceil(ifElse(fvar(11) * 26 < 7, 7, fvar(11) * 26)), 7
getPower = 0,0
givePower = 36, 36
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAFP
priority = 4, Hit
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -100
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -0.8 ,-5.8
guard.velocity = -12
airguard.velocity = -11,-3
air.type = high
air.velocity = -0.8 ,-5.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = .5
p2facing = 1
fall = 1
fall.recovertime = 60
palFX.time = 35
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
Id = 1130


[State 1130, Flame Particles]
type = Helper
trigger1 = AnimElemTime(2) > 0
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1130, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<CHEER & FIRE 2>=
[StateDef 1150]
type = S
physics = S
moveType = A
anim = 1150
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1150, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1150, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1150, Sound]
type = PlaySnd
trigger1 = animelemtime(6) = 1
value = 1100, 1

[State 1150, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1100, 0
channel = 0
volume = 200

[State 1150, FIRE]
Type = explod
Trigger1 = AnimElem = 6
anim = 1151
ID = 1150
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 41, -50
scale=0.5,0.5

[State 1150, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, sp
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAFP
priority = 4, Hit
pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime = ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -52
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3.8 ,-5.8
guard.velocity = -12
airguard.velocity = -11,-3
air.type = high
air.velocity = -3.8 ,-5.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = .5
p2facing = 1
fall = 1
fall.recovertime = 60
palFX.time = 35
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
Id = 1150


[State 1150, Flame Particles]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElemTime(2) > 0
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1150, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX CHEER & FIRE 2>=
[StateDef 1180]
type = S
physics = S
moveType = A
anim = 1150
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1180, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1180, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1180, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1180, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1180, EX FX]
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

[State 1180, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1180, Sound]
type = PlaySnd
trigger1 = animelemtime(6) = 1
value = 1100, 1

[State 1180, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1100, 0
channel = 0
volume = 200

[State 1180, FIRE]
Type = explod
Trigger1 = AnimElem = 6
anim = 1151
ID = 1150
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 41, -50
scale=0.5,0.5

[State 1180, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 10
trigger4 = AnimElem = 12
trigger5 = AnimElem = 14
attr = S, sp
damage = ceil(ifElse(fvar(11) * 26 < 7, 7, fvar(11) * 26)), 7
getPower = 0,0
givePower = 36, 36
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAFP
priority = 4, Hit
pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
guard.pauseTime = ifElse(var(20), 1, 2), ifElse(var(20), 1, 2)
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -52
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2.8 ,-1.8
guard.velocity = -12
airguard.velocity = -11,-3
air.type = high
air.velocity = -2.8 ,-1.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = .5
p2facing = 1
fall = 1
fall.recovertime = 60
palFX.time = 35
palFX.mul = 128, 128, 128
palFX.sinAdd = 96, 96, 96, 4
Id = 1180

[State 1180, Flame Particles]
type = Helper
trigger1 = AnimElemTime(2) > 0
trigger1 = !NumHelper(8150)
trigger1 = MoveHit = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
trigger1 = var(43) := (Target, ID)
helperType = Normal
stateNo = 8150
ID = 8150
name = "Flame Particles"
posType = P2
ownPal = 1
ignoreHitPause = 1

[State 1180, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<SMILE & MISSILE>=
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

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1200, 0
channel = 0
volume = 200

[State 1200, Sound]
type = PlaySnd
trigger1 = animelemtime(8) = 1
value = 1200, 1

[State 1200, VarSet]
type = VarSet
trigger1 = !time
v = 5
value = ifElse(Command = "x",5,ifElse(Command = "y",6,7))

[State 1200: Helper]
type = Helper
trigger1 = animelemtime(8) = 1
helpertype = Normal
name = "Missile"
id = 1205
pos = 36, -60 ;50
postype = p1
facing = 1
stateno = 1205
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1200, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1223
ID = 1200
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1200, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1225
ID = 1200
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1200, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1224
ID = 1200
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX SMILE & MISSILE>=
[StateDef 1230]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1230, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(25) = 124

[State 1230, EX FX]
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

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1230, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1200, 0
channel = 0
volume = 200

[State 1230, Sound]
type = PlaySnd
trigger1 = animelemtime(8) = 1
value = 1200, 1

[State 1230, VarSet]
type = VarSet
trigger1 = !time
v = 5
value = 8

[State 1230: Helper]
type = Helper
trigger1 = animelemtime(8) = 1
helpertype = Normal
name = "Missile"
id = 1205
pos = 36, -60 ;50
postype = p1
facing = 1
stateno = 1235
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1230, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1223
ID = 1200
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1230, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1225
ID = 1200
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1230, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1224
ID = 1200
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1230, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<SMILE & MISSILE 2>=
[StateDef 1250]
type = S
physics = S
moveType = A
anim = 1250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1250, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1250, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1250, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1200, 0
channel = 0
volume = 200

[State 1250, Sound]
type = PlaySnd
trigger1 = animelemtime(8) = 1
value = 1200, 1

[State 1250, VarSet]
type = VarSet
trigger1 = !time
v = 5
value = ifElse(Command = "x",5,ifElse(Command = "y",6,7))

[State 1250: Helper]
type = Helper
trigger1 = animelemtime(8) = 1
helpertype = Normal
name = "Missile"
id = 1255
pos = 36, -20 ;50
postype = p1
facing = 1
stateno = 1255
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1250, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1223
ID = 1250
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 45
scale=0.5,0.5

[State 1250, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1225
ID = 1250
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 45
scale=0.5,0.5

[State 1250, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1224
ID = 1250
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 45
scale=0.5,0.5

[State 1250, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX SMILE & MISSILE 2>=
[StateDef 1280]
type = S
physics = S
moveType = A
anim = 1250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1280, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1280, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1280, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1280, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1280, EX FX]
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

[State 1280, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1280, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 1200, 0
channel = 0
volume = 200

[State 1280, Sound]
type = PlaySnd
trigger1 = animelemtime(8) = 1
value = 1200, 1

[State 1280, VarSet]
type = VarSet
trigger1 = !time
v = 5
value = 8

[State 1280: Helper]
type = Helper
trigger1 = animelemtime(8) = 1
helpertype = Normal
name = "Missile"
id = 1255
pos = 36, -20 ;50
postype = p1
facing = 1
stateno = 1285
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1280, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1223
ID = 1280
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 45
scale=0.5,0.5

[State 1280, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1225
ID = 1280
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 45
scale=0.5,0.5

[State 1280, FIRE]
Type = explod
Trigger1 = AnimElem = 7
anim = 1224
ID = 1280
sprpriority = 3
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 45
scale=0.5,0.5

[State 1280, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<HAPPY & MISSILE>=
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

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1300, Sound]
type = PlaySnd
trigger1 = animelem = 9
value = 1300, 0
channel = 0
volume = 200

[State 1300, Sound]
type = PlaySnd
trigger1 = animelemtime(12) = 1
value = 1200, 1

[State 1300: Helper]
type = Helper
trigger1 = animelemtime(12) = 1
helpertype = Normal
name = "Missile"
id = 1305
pos = 31, -80 ;50
postype = p1
facing = 1
stateno = 1305
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1300, VarSet]
type = VarSet
trigger1 = !time
v = 5
value = 4

[State 1300, VarSet]
type = VarSet
trigger1 = var(10) = 0
v = 11
value = 2

[State 1300, VarSet]
type = VarSet
trigger1 = var(10) = 1
v = 11
value = 3

[State 1300, VarSet]
type = VarSet
trigger1 = var(10) = 2
v = 11
value = 6

[State 1300, FIRE]
Type = explod
Trigger1 = AnimElem = 11
anim = 1301
ID = 1300
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1300, FIRE]
Type = explod
Trigger1 = AnimElem = 11
anim = 1302
ID = 1300
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1300, 1]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A

[State 1300, 1]
type = VelSet
trigger1 = animelem = 3
y = -6.5

[State 1300, 1]
type = VelAdd
trigger1 = animelemtime(3) > 0
Y = 0.25

[State 1300, 1]
type = VelSet
trigger1 = animelem = 11
y = 0

[State 1300, 1]
type = VelAdd
trigger1 = animelem = 11
Y = 0

[State 1300, stay]
type = PosFreeze
trigger1 = animelemno(0) = 11
value = 1

[State 1300, 1]
type = VelSet
trigger1 = animelem = 12
x = -2
y = -8.5

[State 1300, 1]
type = VelAdd
trigger1 = animelemtime(12) > 0
Y = 0.1875

[State 1300, 1]
type = VelMul
trigger1 = animelemtime(12) > 0
Y = 0.96875

[State 1300, 3]
type = ChangeState
triggerall = animelemtime(3) > 0
trigger1 = Pos Y + Vel Y >= 0
value = 1301

[StateDef 1301]
type = S
VelSet = 0, 0
Anim = 47
SprPriority = 2
ctrl = 0

[State 1301, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1301, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1301, 0]
type = PosSet
trigger1 = !time
y = 0

[State 1301, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX HAPPY & MISSILE>=
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

[State 1330, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" && command = "y"), 2, ifElse((command = "x" && command = "z"), 1, 0))

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
var(25) = 124

[State 1330, EX FX]
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

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1330, Sound]
type = PlaySnd
trigger1 = animelem = 9
value = 1300, 0
channel = 0
volume = 200

[State 1330, Sound]
type = PlaySnd
trigger1 = animelemtime(12) = 1
value = 1200, 1

[State 1330: Helper]
type = Helper
trigger1 = animelemtime(12) = 1
helpertype = Normal
name = "Missile"
id = 1305
pos = 31, -80 ;50
postype = p1
facing = 1
stateno = 1335
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 0

[State 1330, VarSet]
type = VarSet
trigger1 = !time
v = 5
value = 4

[State 1330, VarSet]
type = VarSet
trigger1 = var(10) = 0
v = 11
value = 2

[State 1330, VarSet]
type = VarSet
trigger1 = var(10) = 1
v = 11
value = 3

[State 1330, VarSet]
type = VarSet
trigger1 = var(10) = 2
v = 11
value = 6

[State 1330, FIRE]
Type = explod
Trigger1 = AnimElem = 11
anim = 1301
ID = 1330
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1330, FIRE]
Type = explod
Trigger1 = AnimElem = 11
anim = 1302
ID = 1330
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
pos = 0, 0
scale=0.5,0.5

[State 1330, 1]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A

[State 1330, 1]
type = VelSet
trigger1 = animelem = 3
y = -6.5

[State 1330, 1]
type = VelAdd
trigger1 = animelemtime(3) > 0
Y = 0.25

[State 1330, 1]
type = VelSet
trigger1 = animelem = 11
y = 0

[State 1330, 1]
type = VelAdd
trigger1 = animelem = 11
Y = 0

[State 1330, stay]
type = PosFreeze
trigger1 = animelemno(0) = 11
value = 1

[State 1330, 1]
type = VelSet
trigger1 = animelem = 12
x = -2
y = -8.5

[State 1330, 1]
type = VelAdd
trigger1 = animelemtime(12) > 0
Y = 0.1875

[State 1330, 1]
type = VelMul
trigger1 = animelemtime(12) > 0
Y = 0.96875

[State 1330, 3]
type = ChangeState
triggerall = animelemtime(3) > 0
trigger1 = Pos Y + Vel Y >= 0
value = 1301

;====<SENTIMENTAL TYPHOON>=
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

[State 1400, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, ST
hitflag = M-
priority = 1, Miss
sparkno = -1 + 0 * (var(33) := 0)
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1410
p2stateno = 1405
guard.dist = 0
fall = 1
ID = 1400

[State 1400, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 3
value = 800,0
channel = 0

[State 1400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 1

[State 1400, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 810,1
channel = 2

[State 1400, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

[StateDef 1410]
MoveType = A
VelSet = 0,0
Anim = 1410
SprPriority = 3
ctrl = 0

[State 1410]
type = PlaySnd
Trigger1 = AnimElem = 15
value = 1400,2

[State 1410, Evil Eye]
Type = explod
Trigger1 = AnimElem = 15
anim = 1422
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p1
pos = 0, 0
scale=Const(size.xscale),1

[State 1410]
type = PlaySnd
Trigger1 = AnimElem = 20
value = 1400,3
channel = 3

[State 1410, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 20, 0
channel = 0
volume = 200

[State 1410, Sound]
type = PlaySnd
trigger1 = animelem = 16
value = 1400, 0
channel = 0
volume = 200

[State 1410, Sound]
type = StopSnd
trigger1 = animelem = 56
channel = 0

[State 1410, Sound]
type = PlaySnd
trigger1 = animelem = 56
value = 1400, 1
channel = 2

[State 1410, 1]
type = PlaySnd
trigger1 = Time = 1
value = 2, 800

[State 1410]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1410, fat]
type = width
trigger1 = animelemtime(1) >= 0 && animelemtime(16) < 0
edge = 130

[State 1410, bind]
type = TargetBind
trigger1 = time = 0
trigger2 = animelemtime(1) >= 0 && animelemtime(56) < 0
ID = 1400
pos = 61, 0

[State 1410, Behind]
type = Sprpriority
trigger1 = animelem = 16
trigger2 = animelem = 17
trigger3 = animelem = 21
trigger4 = animelem = 22
trigger5 = animelem = 26
trigger6 = animelem = 27
trigger7 = animelem = 31
trigger8 = animelem = 32
trigger9 = animelem = 36
trigger10 = animelem = 37
trigger11 = animelem = 41
trigger12 = animelem = 44
trigger13 = animelem = 46
trigger14 = animelem = 49
trigger15 = animelem = 51
trigger16 = animelem = 54
value = -5

[State 1410, Front]
type = Sprpriority
trigger1 = animelemtime(18) >= 0 && animelemtime(19) < 0
trigger2 = animelemtime(23) >= 0 && animelemtime(24) < 0
trigger3 = animelemtime(28) >= 0 && animelemtime(29) < 0
trigger4 = animelemtime(33) >= 0 && animelemtime(34) < 0
trigger5 = animelemtime(38) >= 0 && animelemtime(39) < 0
trigger6 = animelemtime(42) >= 0 && animelemtime(43) < 0
trigger7 = animelemtime(47) >= 0 && animelemtime(48) < 0
trigger8 = animelemtime(52) >= 0 && animelemtime(53) < 0
trigger9 = animelemtime(18) >= 0 && animelemtime(19) < 0
trigger10 = animelemtime(23) >= 0 && animelemtime(24) < 0
trigger11 = animelemtime(28) >= 0 && animelemtime(29) < 0
trigger12 = animelemtime(33) >= 0 && animelemtime(34) < 0
trigger13 = animelemtime(38) >= 0 && animelemtime(39) < 0
trigger14 = animelemtime(42) >= 0 && animelemtime(43) < 0
trigger15 = animelemtime(47) >= 0 && animelemtime(48) < 0
trigger16 = animelemtime(52) >= 0 && animelemtime(53) < 0
trigger17 = animelemtime(20) >= 0 && animelemtime(21) < 0
trigger18 = animelemtime(25) >= 0 && animelemtime(26) < 0
trigger19 = animelemtime(30) >= 0 && animelemtime(31) < 0
trigger20 = animelemtime(35) >= 0 && animelemtime(36) < 0
trigger21 = animelemtime(40) >= 0 && animelemtime(41) < 0
trigger22 = animelemtime(43) >= 0 && animelemtime(44) < 0
trigger23 = animelemtime(48) >= 0 && animelemtime(49) < 0
trigger24 = animelemtime(53) >= 0 && animelemtime(54) < 0
value = 5

[State 1410, Behind Bind 1]
type = Bindtotarget
trigger1 = animelemtime(16) >= 0 && animelemtime(17) < 0
trigger2 = animelemtime(21) >= 0 && animelemtime(22) < 0
trigger3 = animelemtime(26) >= 0 && animelemtime(27) < 0
trigger4 = animelemtime(31) >= 0 && animelemtime(32) < 0
trigger5 = animelemtime(36) >= 0 && animelemtime(37) < 0
trigger6 = animelemtime(41) >= 0 && animelemtime(42) < 0
trigger7 = animelemtime(46) >= 0 && animelemtime(47) < 0
trigger8 = animelemtime(51) >= 0 && animelemtime(52) < 0
ID = 1400
pos = 14, 0, foot

[State 1410, Behind Bind 2]
type = Bindtotarget
trigger1 = animelemtime(17) >= 0 && animelemtime(18) < 0
trigger2 = animelemtime(22) >= 0 && animelemtime(23) < 0
trigger3 = animelemtime(27) >= 0 && animelemtime(28) < 0
trigger4 = animelemtime(32) >= 0 && animelemtime(33) < 0
trigger5 = animelemtime(37) >= 0 && animelemtime(38) < 0
trigger6 = animelemtime(44) >= 0 && animelemtime(45) < 0
trigger7 = animelemtime(49) >= 0 && animelemtime(50) < 0
trigger8 = animelemtime(54) >= 0 && animelemtime(55) < 0
ID = 1400
pos = -10, 0, foot

[State 1410, Right Bind]
type = Bindtotarget
trigger1 = animelemtime(18) >= 0 && animelemtime(19) < 0
trigger2 = animelemtime(23) >= 0 && animelemtime(24) < 0
trigger3 = animelemtime(28) >= 0 && animelemtime(29) < 0
trigger4 = animelemtime(33) >= 0 && animelemtime(34) < 0
trigger5 = animelemtime(38) >= 0 && animelemtime(39) < 0
trigger6 = animelemtime(42) >= 0 && animelemtime(43) < 0
trigger7 = animelemtime(47) >= 0 && animelemtime(48) < 0
trigger8 = animelemtime(52) >= 0 && animelemtime(53) < 0
ID = 1400
pos = -45, 0, foot

[State 1410, Front Bind]
type = Bindtotarget
trigger1 = animelemtime(19) >= 0 && animelemtime(20) < 0
trigger2 = animelemtime(24) >= 0 && animelemtime(25) < 0
trigger3 = animelemtime(29) >= 0 && animelemtime(30) < 0
trigger4 = animelemtime(34) >= 0 && animelemtime(35) < 0
trigger5 = animelemtime(39) >= 0 && animelemtime(40) < 0
trigger6 = animelemtime(45) >= 0 && animelemtime(46) < 0
trigger7 = animelemtime(50) >= 0 && animelemtime(51) < 0
trigger8 = animelemtime(55) >= 0 && animelemtime(55) < 0
ID = 1400
pos = 4, 0, foot

[State 1410, Left Bind]
type = Bindtotarget
trigger1 = animelemtime(20) >= 0 && animelemtime(21) < 0
trigger2 = animelemtime(25) >= 0 && animelemtime(26) < 0
trigger3 = animelemtime(30) >= 0 && animelemtime(31) < 0
trigger4 = animelemtime(35) >= 0 && animelemtime(36) < 0
trigger5 = animelemtime(40) >= 0 && animelemtime(41) < 0
trigger6 = animelemtime(43) >= 0 && animelemtime(44) < 0
trigger7 = animelemtime(48) >= 0 && animelemtime(49) < 0
trigger8 = animelemtime(53) >= 0 && animelemtime(54) < 0
ID = 1400
pos = 45, 0, foot

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1401
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, 10

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1402
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, -25

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1403
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = -10, -50
scale = .75,1

[State 1410, Tornado]
Type = null
Trigger1 = AnimElem = 17
anim = 1402
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, 0

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1404
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = -10, -85
scale = .5,1

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1404
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, -65
scale = .5,1

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1405
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, -100
scale = .75,1

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1406
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 10, -125

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1407
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, -150

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1408
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = -10, -175

[State 1410, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1409
ID = 1400
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 10, -200

[State 1410, fly p2]
type = TargetState
trigger1 = animelem = 56
value = 1406
ID = 1400

[State 1410, Damage]
Type = TargetLifeAdd
trigger1 = animelem = 55
value = floor(ifElse(150 * fvar(11) < 7, -7, -150 * fvar(11)))
ID = 1400

[State 1410, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && animtime = 55
value = 36

[State 1410, Power]
type = PowerAdd
trigger1 = NumTarget && animtime = 55 && !var(20)
value = 72

[State 1410, HitAdd]
type = HitAdd
trigger1 = NumTarget && animtime = 55
value = 1

[State 1410, HitCount]
type = VarAdd
trigger1 = NumTarget && animtime = 55
var(13) = 1

[State 1410, Juggle]
type = VarAdd
trigger1 = NumTarget && animtime = 55
var(15) = 1
ignoreHitPause = 1

[State 1410, Juggle]
type = VarSet
trigger1 = NumTarget && animtime = 55
var(16) = 1
ignoreHitPause = 1

[State 1410, go x]
type = VelSet
trigger1 = animelem = 56
x = -4
y = -6.375

[State 1410, go x]
type = VelAdd
trigger1 = animelemtime(56) > 0
y = .3275

[State 1410, 10]
type = ChangeState
Trigger1 = vel y > 0 && pos y >= 0
value = 52
ctrl = 1

[StateDef 1405]
Type = A
MoveType =  H
VelSet = 0, 0
Ctrl = 0

[State 1405]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1405, Anim]
Type = ChangeAnim2
Trigger1 = !Time
Value = 1420

[StateDef 1406]
Type = A
MoveType =  H
Ctrl = 0

[State 1406]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1406, Anim 5050]
type = ChangeAnim
trigger1 = Time = 0
value = 5050

[State 1406, go x]
type = VelSet
trigger1 = time = 0
x = 0
y = -15.375

[State 1406, go x]
type = VelAdd
trigger1 = time > 0
y = .5

[State 1406, 10]
type = SelfState
Trigger1 = vel y > 0 && pos y >= 0
value = 5100

;====<EX HAPPY & MISSILE>=
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
var(25) = 224

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
channel = 1

[State 1430, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, ST
hitflag = M-
priority = 1, Miss
sparkno = -1 + 0 * (var(33) := 0)
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1440
p2stateno = 1405
guard.dist = 0
fall = 1
ID = 1430

[State 1430, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 3
value = 800,0
channel = 2

[State 1430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,0
channel = 3

[State 1430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 810,1
channel = 4

[State 1430, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

[StateDef 1440]
MoveType = A
VelSet = 0,0
Anim = 1410
SprPriority = 3
ctrl = 0

[State 1440]
type = PlaySnd
Trigger1 = AnimElem = 15
value = 1400,2

[State 1440, Evil Eye]
Type = explod
Trigger1 = AnimElem = 15
anim = 1422
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p1
pos = 0, 0
scale=Const(size.xscale),1

[State 1440]
type = PlaySnd
Trigger1 = AnimElem = 20
value = 1400,3
channel = 3

[State 1440, Sound]
type = PlaySnd
trigger1 = Time = 1
value = 20, 0
channel = 0
volume = 200

[State 1440, Sound]
type = PlaySnd
trigger1 = animelem = 16
value = 1400, 0
channel = 0
volume = 200

[State 1440, Sound]
type = StopSnd
trigger1 = animelem = 56
channel = 0

[State 1440, Sound]
type = PlaySnd
trigger1 = animelem = 56
value = 1400, 1
channel = 2

[State 1440, 1]
type = PlaySnd
trigger1 = Time = 1
value = 2, 800

[State 1440]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1440, fat]
type = width
trigger1 = animelemtime(1) >= 0 && animelemtime(16) < 0
edge = 130

[State 1440, bind]
type = TargetBind
trigger1 = time = 0
trigger2 = animelemtime(1) >= 0 && animelemtime(56) < 0
ID = 1430
pos = 61, 0

[State 1440, Behind]
type = Sprpriority
trigger1 = animelem = 16
trigger2 = animelem = 17
trigger3 = animelem = 21
trigger4 = animelem = 22
trigger5 = animelem = 26
trigger6 = animelem = 27
trigger7 = animelem = 31
trigger8 = animelem = 32
trigger9 = animelem = 36
trigger10 = animelem = 37
trigger11 = animelem = 41
trigger12 = animelem = 44
trigger13 = animelem = 46
trigger14 = animelem = 49
trigger15 = animelem = 51
trigger16 = animelem = 54
value = -5

[State 1440, Front]
type = Sprpriority
trigger1 = animelemtime(18) >= 0 && animelemtime(19) < 0
trigger2 = animelemtime(23) >= 0 && animelemtime(24) < 0
trigger3 = animelemtime(28) >= 0 && animelemtime(29) < 0
trigger4 = animelemtime(33) >= 0 && animelemtime(34) < 0
trigger5 = animelemtime(38) >= 0 && animelemtime(39) < 0
trigger6 = animelemtime(42) >= 0 && animelemtime(43) < 0
trigger7 = animelemtime(47) >= 0 && animelemtime(48) < 0
trigger8 = animelemtime(52) >= 0 && animelemtime(53) < 0
trigger9 = animelemtime(18) >= 0 && animelemtime(19) < 0
trigger10 = animelemtime(23) >= 0 && animelemtime(24) < 0
trigger11 = animelemtime(28) >= 0 && animelemtime(29) < 0
trigger12 = animelemtime(33) >= 0 && animelemtime(34) < 0
trigger13 = animelemtime(38) >= 0 && animelemtime(39) < 0
trigger14 = animelemtime(42) >= 0 && animelemtime(43) < 0
trigger15 = animelemtime(47) >= 0 && animelemtime(48) < 0
trigger16 = animelemtime(52) >= 0 && animelemtime(53) < 0
trigger17 = animelemtime(20) >= 0 && animelemtime(21) < 0
trigger18 = animelemtime(25) >= 0 && animelemtime(26) < 0
trigger19 = animelemtime(30) >= 0 && animelemtime(31) < 0
trigger20 = animelemtime(35) >= 0 && animelemtime(36) < 0
trigger21 = animelemtime(40) >= 0 && animelemtime(41) < 0
trigger22 = animelemtime(43) >= 0 && animelemtime(44) < 0
trigger23 = animelemtime(48) >= 0 && animelemtime(49) < 0
trigger24 = animelemtime(53) >= 0 && animelemtime(54) < 0
value = 5

[State 1440, Behind Bind 1]
type = Bindtotarget
trigger1 = animelemtime(16) >= 0 && animelemtime(17) < 0
trigger2 = animelemtime(21) >= 0 && animelemtime(22) < 0
trigger3 = animelemtime(26) >= 0 && animelemtime(27) < 0
trigger4 = animelemtime(31) >= 0 && animelemtime(32) < 0
trigger5 = animelemtime(36) >= 0 && animelemtime(37) < 0
trigger6 = animelemtime(41) >= 0 && animelemtime(42) < 0
trigger7 = animelemtime(46) >= 0 && animelemtime(47) < 0
trigger8 = animelemtime(51) >= 0 && animelemtime(52) < 0
ID = 1430
pos = 14, 0, foot

[State 1440, Behind Bind 2]
type = Bindtotarget
trigger1 = animelemtime(17) >= 0 && animelemtime(18) < 0
trigger2 = animelemtime(22) >= 0 && animelemtime(23) < 0
trigger3 = animelemtime(27) >= 0 && animelemtime(28) < 0
trigger4 = animelemtime(32) >= 0 && animelemtime(33) < 0
trigger5 = animelemtime(37) >= 0 && animelemtime(38) < 0
trigger6 = animelemtime(44) >= 0 && animelemtime(45) < 0
trigger7 = animelemtime(49) >= 0 && animelemtime(50) < 0
trigger8 = animelemtime(54) >= 0 && animelemtime(55) < 0
ID = 1430
pos = -10, 0, foot

[State 1440, Right Bind]
type = Bindtotarget
trigger1 = animelemtime(18) >= 0 && animelemtime(19) < 0
trigger2 = animelemtime(23) >= 0 && animelemtime(24) < 0
trigger3 = animelemtime(28) >= 0 && animelemtime(29) < 0
trigger4 = animelemtime(33) >= 0 && animelemtime(34) < 0
trigger5 = animelemtime(38) >= 0 && animelemtime(39) < 0
trigger6 = animelemtime(42) >= 0 && animelemtime(43) < 0
trigger7 = animelemtime(47) >= 0 && animelemtime(48) < 0
trigger8 = animelemtime(52) >= 0 && animelemtime(53) < 0
ID = 1430
pos = -45, 0, foot

[State 1440, Front Bind]
type = Bindtotarget
trigger1 = animelemtime(19) >= 0 && animelemtime(20) < 0
trigger2 = animelemtime(24) >= 0 && animelemtime(25) < 0
trigger3 = animelemtime(29) >= 0 && animelemtime(30) < 0
trigger4 = animelemtime(34) >= 0 && animelemtime(35) < 0
trigger5 = animelemtime(39) >= 0 && animelemtime(40) < 0
trigger6 = animelemtime(45) >= 0 && animelemtime(46) < 0
trigger7 = animelemtime(50) >= 0 && animelemtime(51) < 0
trigger8 = animelemtime(55) >= 0 && animelemtime(55) < 0
ID = 1430
pos = 4, 0, foot

[State 1440, Left Bind]
type = Bindtotarget
trigger1 = animelemtime(20) >= 0 && animelemtime(21) < 0
trigger2 = animelemtime(25) >= 0 && animelemtime(26) < 0
trigger3 = animelemtime(30) >= 0 && animelemtime(31) < 0
trigger4 = animelemtime(35) >= 0 && animelemtime(36) < 0
trigger5 = animelemtime(40) >= 0 && animelemtime(41) < 0
trigger6 = animelemtime(43) >= 0 && animelemtime(44) < 0
trigger7 = animelemtime(48) >= 0 && animelemtime(49) < 0
trigger8 = animelemtime(53) >= 0 && animelemtime(54) < 0
ID = 1430
pos = 45, 0, foot

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1401
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, 10

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1402
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, -25

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1403
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = -10, -50
scale = .75,1

[State 1440, Tornado]
Type = null
Trigger1 = AnimElem = 17
anim = 1402
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, 0

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1404
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = -10, -85
scale = .5,1

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1404
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, -65
scale = .5,1

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1405
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, -100
scale = .75,1

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1406
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 10, -125

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1407
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 0, -150

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1408
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = -10, -175

[State 1440, Tornado]
Type = explod
Trigger1 = AnimElem = 17
anim = 1409
ID = 1430
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
postype = p2
pos = 10, -200

[State 1440, fly p2]
type = TargetState
trigger1 = animelem = 56
value = 1406
ID = 1430

[State 1440, Damage]
Type = TargetLifeAdd
trigger1 = animelem = 55
value = floor(ifElse(165 * fvar(11) < 7, -7, -165 * fvar(11)))
ID = 1430

[State 1440, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && animtime = 55
value = 36

[State 1440, Power]
type = PowerAdd
trigger1 = NumTarget && animtime = 55 && !var(20)
value = 0

[State 1440, HitAdd]
type = HitAdd
trigger1 = NumTarget && animtime = 55
value = 1

[State 1440, HitCount]
type = VarAdd
trigger1 = NumTarget && animtime = 55
var(13) = 1

[State 1440, Juggle]
type = VarAdd
trigger1 = NumTarget && animtime = 55
var(15) = 1
ignoreHitPause = 1

[State 1440, Juggle]
type = VarSet
trigger1 = NumTarget && animtime = 55
var(16) = 1
ignoreHitPause = 1

[State 1440, go x]
type = VelSet
trigger1 = animelem = 56
x = -4
y = -6.375

[State 1440, go x]
type = VelAdd
trigger1 = animelemtime(56) > 0
y = .3275

[State 1440, 10]
type = ChangeState
Trigger1 = vel y > 0 && pos y >= 0
value = 52
ctrl = 1

;====<JEALOUSY AND FAKE>=
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

[State 1500, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1,1

[State 1500, Dust]
Type = explod
trigger1 = animelem = 3
anim = 8100
ID = 8100
sprpriority = 4
ownpal = 1
removeongethit = 1
ignorehitpause = 0
scale = 2,2
postype = p1

[State 1500]
type = PosAdd
trigger1 = animelem = 3
x = (P2dist X)+90

[State 1500, 0]
type = Turn
trigger1 = animelem = 3 && p2dist X < -5

[State 1500, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;=<LAW OF THE BULLET>==
[StateDef 1600]
type = S
physics = N
moveType = A
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1600, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1600, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1600, 1]
type = PlayerPush
trigger1 = 1
value = 0

[State 1600, 2]
type = velset
trigger1 = AnimElem = 2
x = p2dist x / 16

[State 1600, 3]
type = veladd
trigger1 = Time = [6, 13]
y = -1.2

[State 1600, 4]
type = StateTypeSet
trigger1 = AnimElem = 2
value = A

[State 1600, 5]
type = velset
trigger1 = AnimElem = 10
x = 0
y = 3

[State 1600, 6]
type = veladd
trigger1 = Time >= 22
y = 1.9

[State 1600, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = A, SA
hitFlag = FD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 80, ifElse(var(10), 70, 60)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 80, ifElse(var(10), 70, 60)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p1stateno = 1601
p2stateno = 1605
id = 1600

[State 1600, 8]
type = PlaySnd
trigger1 = Time = 5
value = 4, 0

[State 1600, 9]
type = ChangeState
trigger1 = (Pos Y >= -5) && (Vel Y >0)
value = 1301

;HIT
[Statedef 1601]
type = A
movetype = A
physics = N
anim = 1610
velset = 0,0
sprpriority = 2

[State 1600, bind]
type = TargetBind
trigger1 = animelem = 1
ID = 1600
pos = 0, 0
ignorehitpause = 1

[State 1710, 6]
type = ChangeState
trigger1 = Animelem = 1
value = 1610

[Statedef 1610]
type = S
movetype = A
physics = N
ctrl = 0
ownpal = 1
sprpriority = 2
poweradd= 0
juggle = 0
anim = 1610

[State 1610, bind]
type = TargetBind
trigger1 = animelem = 1
ID = 1600
pos = 0, 0
ignorehitpause = 1

[State 1610, fat]
type = Width
trigger1 = 1
edge = 60

[State 1610, 1]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = AnimElem = 8
trigger4 = AnimElem = 9
trigger5 = AnimElem = 10
trigger7 = AnimElem = 11
ignorehitpause=1
value = 1, 6

[State 1610]
type = PosAdd
trigger1 = animelem = 1
x = (P2dist X)-1

[State 1610, go]
type = VelSet
trigger1 = animelem = 4
x = 0
y = -5

[State 1610, 1]
type = VelAdd
trigger1 = animelemtime(5) > 0
Y = 0.1875

[State 1610, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = AnimElem = 8
trigger4 = AnimElem = 9
attr = S, HA
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = FD
priority = 4, Hit
pausetime = 0,0
guard.pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := 0
ground.type = High
ground.slidetime = 13
ground.hittime = 13
ground.velocity = 0
down.velocity = 0
guard.velocity = 0
guard.ctrltime = 13
air.type = high
air.velocity = 0,0
airguard.velocity = 0,0
air.hittime = 13
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
yaccel = .5
air.fall = 0
p2facing = 1
id = 1600
kill = 0
p2stateno = 1605

[State 1610, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 10
attr = S, HA
damage = ceil(ifElse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = FD
priority = 4, Hit
pausetime = 0,0
guard.pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := 0
ground.type = High
ground.slidetime = 13
ground.hittime = 13
ground.velocity = 0
down.velocity = 0
guard.velocity = 0
guard.ctrltime = 13
air.type = high
air.velocity = 0,0
airguard.velocity = 0,0
air.hittime = 13
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
yaccel = .5
air.fall = 0
p2facing = 1
id = 1600
kill = 1
p2stateno = 1605

[State 1610, 10]
type = ChangeState
trigger1 = !Animtime
value = 1611

;Shikabanenui (HIT)
[Statedef 1611]
type = A
movetype = A
physics = N
anim = 1601
velset = 0,0
sprpriority = 2

[State 1611, 3]
type = posset
trigger1 = Time = 0
y = -10

[State 1611, 4]
type = velset
trigger1 = AnimElem = 1
x = -4.5
y = -7.8

[State 1611, 5]
type = veladd
trigger1 = AnimElemTime(1) >= 0
y = .45

[State 1611, 6]
type = ChangeState
trigger1 = (Pos Y >= -10) && (Vel Y >0)
value = 52

;Player 2
[Statedef 1605]
type = L
movetype = H
physics = S
velset = 0,0

[State 1605, 1]
type = posset
Trigger1 = Time = 0
y = 0

[State 1605, 2]
type = SelfState
Trigger1 = Time = 0
value = 5080

;=<EX LAW OF THE BULLET>==
[StateDef 1630]
type = S
physics = N
moveType = A
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1630, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1630, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1630, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1630, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1630, EX FX]
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

[State 1630, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1630, 1]
type = PlayerPush
trigger1 = 1
value = 0

[State 1630, 2]
type = velset
trigger1 = AnimElem = 2
x = p2dist x / 16

[State 1630, 3]
type = veladd
trigger1 = Time = [6, 13]
y = -1.2

[State 1630, 4]
type = StateTypeSet
trigger1 = AnimElem = 2
value = A

[State 1630, 5]
type = velset
trigger1 = AnimElem = 10
x = 0
y = 3

[State 1630, 6]
type = veladd
trigger1 = Time >= 22
y = 1.9

[State 1630, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = A, SA
hitFlag = FD
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 60 < 7, 7, fvar(11) * 60)), 0
getPower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
p1stateno = 1631
p2stateno = 1605
id = 1630

[State 1630, 8]
type = PlaySnd
trigger1 = Time = 5
value = 4, 0

[State 1630, 9]
type = ChangeState
trigger1 = (Pos Y >= -5) && (Vel Y >0)
value = 1301

;HIT
[Statedef 1631]
type = A
movetype = A
physics = N
anim = 1610
velset = 0,0
sprpriority = 2

[State 1600, bind]
type = TargetBind
trigger1 = animelem = 1
ID = 1630
pos = 0, 0
ignorehitpause = 1

[State 1710, 6]
type = ChangeState
trigger1 = Animelem = 1
value = 1640

[Statedef 1640]
type = S
movetype = A
physics = N
ctrl = 0
ownpal = 1
sprpriority = 2
poweradd= 0
juggle = 0
anim = 1630

[State 1640, bind]
type = TargetBind
trigger1 = animelem = 1
ID = 1630
pos = 0, 0
ignorehitpause = 1

[State 1640, fat]
type = Width
trigger1 = 1
edge = 60

[State 1640, 1]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = AnimElem = 8
trigger4 = AnimElem = 9
trigger5 = AnimElem = 10
trigger7 = AnimElem = 11
ignorehitpause=1
value = 1, 6

[State 1640]
type = PosAdd
trigger1 = animelem = 1
x = (P2dist X)-1

[State 1640, go]
type = VelSet
trigger1 = animelem = 4
x = 0
y = -5

[State 1640, 1]
type = VelAdd
trigger1 = animelemtime(5) > 0
Y = 0.1875

[State 1640, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = AnimElem = 8
trigger4 = AnimElem = 9
trigger5 = AnimElem = 10
trigger7 = AnimElem = 11
attr = S, HA
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 7
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = FD
priority = 4, Hit
pausetime = 0,0
guard.pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := 0
ground.type = High
ground.slidetime = 13
ground.hittime = 13
ground.velocity = 0
down.velocity = 0
guard.velocity = 0
guard.ctrltime = 13
air.type = high
air.velocity = 0,0
airguard.velocity = 0,0
air.hittime = 13
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getpower = 0
givepower = 0,0
yaccel = .5
air.fall = 0
p2facing = 1
id = 1630
kill = 0
p2stateno = 1606

[State 1640, 10]
type = ChangeState
triggerall = animelemtime(5) > 0
trigger1 = Pos Y + Vel Y >= 0
value = 1641

[Statedef 1641]
type = S
movetype = A
physics = N
ctrl = 0
ownpal = 1
sprpriority = 2
poweradd= 0
juggle = 0
anim = 1631
velset = 0,0

[State 1641]
type = PosAdd
trigger1 = animelem = 1
x = (P2dist X)-8

[State 1641, 0]
type = PosSet
trigger1 = !time
y = 0

[State 1641, Abayo]
type = PlaySnd
trigger1 = animelem = 13
value = 1600, 0
channel = 0
volume = 200

[State 1641, go]
type = VelSet
trigger1 = animelem = 13
x = -3
y = -7

[State 1641]
type = helper
trigger1 = animelemtime(16) = 1
helpertype = normal
stateno = 1635
ID = 1635
name = "BOMBS"
postype = p1
pos = 12,-65
ownpal = 1
sprpriority = -1
supermovetime = 0
pausemovetime = 99999999
keyctrl = 0

[State 1641, 1]
type = VelAdd
trigger1 = animelemtime(13) > 0
Y = 0.2875

[State 1641, 1]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
ignorehitpause=1
value = 1, 6

[State 210, 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 7 || var(20))
trigger1 = AnimElem = 3
trigger2 = AnimElem = 5
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
trigger5 = AnimElem = 11
attr = S, HA
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 7
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = FD
priority = 4, Hit
pausetime = 0,0
guard.pausetime = 0, 0
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := 0
ground.type = High
ground.slidetime = 13
ground.hittime = 13
ground.velocity = 0
down.velocity = 0
guard.velocity = 0
guard.ctrltime = 13
air.type = high
air.velocity = 0,0
airguard.velocity = 0,0
air.hittime = 13
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getpower = 0
givepower = 0,0
yaccel = .5
air.fall = 0
p2facing = 1
id = 1630
kill = 0
p2stateno = 1606

[State 2000, 10]
type = ChangeState
triggerall = animelemtime(13) > 0
trigger1 = Pos Y + Vel Y >= 0
value = 1642

;Land and Taunt
[Statedef 1642]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
sprpriority = 2
anim = 1632

[State 1642]
type = PlaySnd
trigger1 = animelem = 4
value = 1600,1
channel = 0
volume = 200

[State 1642, 0]
type = PosSet
trigger1 = !time
y = 0

[State 1642, 1]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;Player 2
[StateDef 1606]
Type = L
MoveType = H
Ctrl = 0
velset = 0,0
physics = N

[State 1606, go]
type = posSet
trigger1 = !Time
y = 0

[State 1606, Anim 5050]
type = ChangeAnim2
trigger1 = Time = 0
value = 1605

[State 1606, Hit ground]
type = SelfState
trigger1 = time = 200
value = 5100

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
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 2900, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,2
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 3
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
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
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
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
damage = ceil(ifElse(fvar(11) * 62 < 7, 7, fvar(11) * 62)), 0
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
sparkXY = -10 + 0 * (var(35) := 96), var(36) := -11
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(4) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
