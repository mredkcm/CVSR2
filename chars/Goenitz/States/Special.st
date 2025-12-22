; _________________________________________
;| Goenitz by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>===
;==

;=<YONOKAZE>==
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
var(10) = ifElse((command = "x" || command = "rlsx" || command = "a" || command = "rlsa"), 0, ifElse((command = "y" || command = "rlsy" || command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 1000,0
Channel = 1

[State 1000, Gou Hadouken FX sound]
type = PlaySnd
trigger1 = AnimElem = 7, = 1
value = 1000,1
Channel = 3

[State 1000, Projectile]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 7, = 1
helperType = Normal
stateNo = 1005
ID = 1005
name = "Yonokaze Projectile"
posType = P1
pos = 70, 0
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Projectile]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 7, = 1
helperType = Normal
stateNo = 1005
ID = 1005
name = "Yonokaze Projectile"
posType = P1
pos = 140, 0
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, Projectile]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 7, = 1
helperType = Normal
stateNo = 1005
ID = 1005
name = "Yonokaze Projectile"
posType = P1
pos = 210, 0
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX YONOKAZE>=
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

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 4,4
Channel = 2

[State 1000, Gou Hadouken FX sound]
type = PlaySnd
trigger1 = AnimElem = 7, = 1
value = 1000,1
Channel = 3

[State 1000, Projectile]
type = Helper
trigger1 = AnimElem = 7, = 1
helperType = Normal
stateNo = 1035
ID = 1005
name = "EX Yonokaze Projectile"
posType = P1
pos = ceil(P2BodyDist X * const(size.yScale)), 0
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 1000, 9]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<YANPYOU TOKOBUSE>=
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
trigger1 = PrevStateNo = 751
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 1, ifElse((command = "y" || command = "rlsy"), 1, 1))

[State 1100, Button Detect]
type = VarSet
trigger1 = PrevStateNo != 751
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1000, Power Set]
Type = ChangeAnim
Trigger1 = !Time
value = 1100+var(10)

[State 1000, Power Set]
Type = ChangeAnim
Trigger1 = !Time
Trigger1 = 1
value = anim+20

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 1, = 1
value = 1100, 0
Channel = 0

[State -3, Snap Sound]
type = PlaySnd
Trigger1 = AnimElem = 8
Value = 1100,1
Channel = 1
IgnoreHitPause = 1

[State 200, blade 1]
Type = Explod
Trigger1 = AnimElem = 10
Trigger2 = AnimElem = 13
anim = 1150
Pos = 30+20*(var(10) = 1)-20*(var(10) = 2),ifelse(var(10) = 1, -95, ifelse(var(10) = 2,-125,-50))
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10
Velocity = 2+5*(var(1) = 3),-1.5

[State 200, blade 2]
Type = Explod
Trigger1 = AnimElem = 12
Trigger2 = AnimElem = 15
anim = 1151
Pos = 30+20*(var(10) = 1)-20*(var(10) = 2),ifelse(var(10) = 1, -95, ifelse(var(10) = 2,-125,-50))
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10
Velocity = 2+5*(var(1) = 3),1.5

[State 200, blade 3]
Type = Explod
Trigger1 = AnimElem = 14
Trigger2 = AnimElem = 9, = 1
anim = 1152
Pos = 30+20*(var(10) = 1)-20*(var(10) = 2),ifelse(var(10) = 1, -95, ifelse(var(10) = 2,-125,-50))
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10
Velocity = 2+6*(var(1) = 3)

[State -3, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 10
Value = 1100,2
Channel = 3
IgnoreHitPause = 1

[State -3, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 12
Value = 1100,2
Channel = 4
IgnoreHitPause = 1

[State -3, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 14
Value = 1100,2
Channel = 5
IgnoreHitPause = 1

[State 1100, Upper Hit]
Type = HitDef
trigger1 = !var(16) && (var(15) < 12 || var(20))
Trigger1 = AnimElem = 10
attr = S, SA
damage = ceil(ifElse(fvar(11) * 6 < 7, 7, fvar(11) * 6)), 2
animtype = Light
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = M
hitflag = MAF
pausetime = 2,6
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifelse(var(10) = 1, -100, ifelse(var(10) = 2,-125,-55))
ground.type = High
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 60
ground.velocity = ifElse(var(20), -1.36, -2.5), -11
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -1.36, -2.5), -11
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
Fall = 1
Fall.Recover = 1
Mindist = 20+25*(var(10) = 1),-50+ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,0))
Maxdist = 90+20*(var(10) = 1),ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,-0))
ID = 1100

[State 1100, lower Hit]
Type = HitDef
trigger1 = !var(16) && (var(15) < 12 || var(20))
Trigger1 = AnimElem = 12
attr = S, SA
damage = ceil(ifElse(fvar(11) * 6 < 7, 7, fvar(11) * 6)), 2
animtype = Light
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = M
hitflag = MAF
pausetime = 2,6
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifelse(var(10) = 1, -100, ifelse(var(10) = 2,-125,-55))
ground.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 60
ground.velocity = ifElse(var(20), -2.36, -4), -9
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -9
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
Fall = 1
Fall.Recover = 1
Mindist = 20+25*(var(10) = 1),-50+ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,0))
Maxdist = 90+20*(var(10) = 1),ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,-0))
ID = 1100

[State 1100, Middle Hit]
Type = HitDef
trigger1 = !var(16) && (var(15) < 12 || var(20))
Trigger1 = AnimElem = 14
attr = S, SA
damage = ceil(ifElse(fvar(11) * 6 < 7, 7, fvar(11) * 6)), 2
animtype = Light
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = M
hitflag = MAF
pausetime = 2,6
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifelse(var(10) = 1, -100, ifelse(var(10) = 2,-125,-55))
ground.type = High
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 60
ground.velocity = ifElse(var(20), -2.36, -4), -9
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -9
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
Fall = 1
Fall.Recover = 1
Mindist = 20+25*(var(10) = 1),-50+ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,0))
Maxdist = 90+20*(var(10) = 1),ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,-0))
ID = 1100

[State 1000, 9]
type = ChangeState
Trigger1 = Time > 60
value = 1110

;Wanpyou Mametsu Part 2
[Statedef 1110]
Type = S
MoveType = I
Physics = S
Anim = 1110+(var(10) = 2)
Ctrl = 0
PowerAdd = 0
VelSet = 0

[State 1000, Power Set]
Type = ChangeAnim
Trigger1 = !Time
Trigger1 = numtarget(1100)
value = anim+2

[State -3, Snap Sound]
type = PlaySnd
Trigger1 = AnimElem = 4
Trigger1 = Anim = [1112,1113]
Value = 1100,1
Channel = 3
IgnoreHitPause = 1

[State 1101, End]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;====<EX YANPYOU TOKOBUSE>=
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
var(25) = 101

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

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" && command = "y"), 2, ifElse((command = "x" && command = "z"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1000, Power Set]
Type = ChangeAnim
Trigger1 = !Time
value = 1100+var(10)

[State 1000, Power Set]
Type = ChangeAnim
Trigger1 = !Time
Trigger1 = 1
value = anim+20

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 1, = 1
value = 1100, 0
Channel = 0

[State -3, Snap Sound]
type = PlaySnd
Trigger1 = AnimElem = 8
Value = 1100,1
Channel = 1
IgnoreHitPause = 1

[State 200, blade 1]
Type = Explod
Trigger1 = AnimElem = 10
Trigger2 = AnimElem = 13
anim = 1150
Pos = 30+20*(var(10) = 1)-20*(var(10) = 2),ifelse(var(10) = 1, -95, ifelse(var(10) = 2,-125,-50))
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10
Velocity = 2+5*(var(1) = 3),-1.5

[State 200, blade 2]
Type = Explod
Trigger1 = AnimElem = 12
Trigger2 = AnimElem = 15
anim = 1151
Pos = 30+20*(var(10) = 1)-20*(var(10) = 2),ifelse(var(10) = 1, -95, ifelse(var(10) = 2,-125,-50))
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10
Velocity = 2+5*(var(1) = 3),1.5

[State 200, blade 3]
Type = Explod
Trigger1 = AnimElem = 14
Trigger2 = AnimElem = 9, = 1
anim = 1152
Pos = 30+20*(var(10) = 1)-20*(var(10) = 2),ifelse(var(10) = 1, -95, ifelse(var(10) = 2,-125,-50))
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10
Velocity = 2+6*(var(1) = 3)

[State -3, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 10
Value = 1100,2
Channel = 3
IgnoreHitPause = 1

[State -3, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 12
Value = 1100,2
Channel = 4
IgnoreHitPause = 1

[State -3, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 14
Value = 1100,2
Channel = 5
IgnoreHitPause = 1

[State 1100, Upper Hit]
Type = HitDef
trigger1 = !var(16) && (var(15) < 15 || var(20))
Trigger1 = AnimElem = 10
attr = S, SA
damage = ceil(ifElse(fvar(11) * 8 < 7, 7, fvar(11) * 8)), 2
animtype = Light
getPower = 0,0
givePower = 36, 36
guardflag = M
hitflag = MAF
pausetime = 2,6
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifelse(var(10) = 1, -100, ifelse(var(10) = 2,-125,-55))
ground.type = High
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -2.5, -11
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -11
air.cornerPush.velOff = 0
yAccel = .6
Fall = 1
Fall.Recover = 1
Mindist = 20+25*(var(10) = 1),-50+ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,0))
Maxdist = 90+20*(var(10) = 1),ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,-0))
ID = 1100

[State 1100, lower Hit]
Type = HitDef
trigger1 = !var(16) && (var(15) < 15 || var(20))
Trigger1 = AnimElem = 12
attr = S, SA
damage = ceil(ifElse(fvar(11) * 8 < 7, 7, fvar(11) * 8)), 2
animtype = Light
getPower = 0,0
givePower = 36, 36
guardflag = M
hitflag = MAF
pausetime = 2,6
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifelse(var(10) = 1, -100, ifelse(var(10) = 2,-125,-55))
ground.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4, -9
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = .6
Fall = 1
Fall.Recover = 1
Mindist = 20+25*(var(10) = 1),-50+ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,0))
Maxdist = 90+20*(var(10) = 1),ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,-0))
ID = 1100

[State 1100, Middle Hit]
Type = HitDef
trigger1 = !var(16) && (var(15) < 15 || var(20))
Trigger1 = AnimElem = 14
attr = S, SA
damage = ceil(ifElse(fvar(11) * 8 < 7, 7, fvar(11) * 8)), 2
animtype = Light
getPower = 0,0
givePower = 36, 36
guardflag = M
hitflag = MAF
pausetime = 2,6
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 143), var(36) := ifelse(var(10) = 1, -100, ifelse(var(10) = 2,-125,-55))
ground.type = High
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 60
ground.velocity = -4, -9
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -9
air.cornerPush.velOff = 0
yAccel = .6
Fall = 1
Fall.Recover = 1
Mindist = 20+25*(var(10) = 1),-50+ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,0))
Maxdist = 90+20*(var(10) = 1),ifelse(var(10) = 1, -20, ifelse(var(10) = 2,-50,-0))
ID = 1100

[State 1000, 9]
type = ChangeState
Trigger1 = Time > 80
value = 1110

;=<HYOUGA>==
[StateDef 1200]
type = S
physics = N
moveType = I
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, Power Set]
Type = varSet
Trigger1 = !Time
Trigger1 = var(11)
var(10) = ifelse(p2dist x < 160, 0,1)

[State 1000, Power Set]
Type = varSet
Trigger1 = !Time
Trigger1 = var(11)
Trigger1 = p2dist x > 90
Trigger1 = p2movetype = A
var(10) = 2

[State 1000, Power Set]
Type = ChangeAnim
Trigger1 = !Time
value = 1200+(var(10) = 2)

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 1, = 1
value = 1200, 0
Channel = 1

[State 200, Wind]
Type = Explod
Trigger1 = AnimElem = 2, = 1
anim = 1250
Pos = 30, -15*(var(10) = 2)
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 4
ignorehitpause = 1
PauseMoveTime = 15

[State 1000, Wind FX]
type = PlaySnd
Trigger1 = AnimElem = 2, = 1
value = 1200,1
Channel = 2

[State 1000, Invincibility]
type = NotHitBy
Trigger1 = AnimElem = 12, < 0
value = SCA
IgnoreHitPause = 1

[State 1000, Pass trough]
type = PlayerPush
Trigger1 = AnimElem = 12, < 0
value = 0
IgnoreHitPause = 1

[State 1200, Speed]
Type = StateTypeSet
Trigger1 = AnimElem = 2, = 18
Trigger1 = var(10) = 2
StateType = A

[State 1200, Speed]
Type = VelSet
Trigger1 = AnimElem = 2, = 18
Trigger1 = var(10) != 2
x = 7+4*var(10)

[State 1200, Speed]
Type = VelSet
Trigger1 = AnimElem = 2, = 18
Trigger1 = var(10) = 2
x = 7.5
y = -6.5

[State 1200, Speed]
Type = Gravity
Trigger1 = AnimElem = 2, > 18
Trigger1 = var(10) = 2

[State 1200, Speed]
Type = VelSet
Trigger1 = AnimElem = 13
Trigger1 = var(10) != 2
x = 0

[State 1200, End]
type = ChangeState
Trigger1 = !AnimTime
Trigger1 = var(10) != 2
value = 0
Ctrl = 1

[State 1200, End]
type = ChangeState
Trigger1 = Pos y >= 0
Trigger1 = Vel y > 0
Trigger1 = var(10) = 2
value = 1201

;Hyouga Landing
[Statedef 1201]
Type = S
MoveType = I
Physics = N
Anim = 1202
Ctrl = 0
PowerAdd = 0
VelSet = 0,0

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

[State 1000, 9]
type = Posset
Trigger1 = !Time
y = 0

[State 1000, 9]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;=<SHIN AOI HANA: SEIRAN>==
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

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, Power Set]
Type = varSet
Trigger1 = !Time
Trigger1 = var(11)
var(10) = 2

[State 1000, Power Set]
Type = varSet
TriggerAll = !Time
TriggerAll = var(11)
Trigger1 = prevstateno = [200,210]
Trigger2 = prevstateno = [400,410]
var(10) = 0

[State 1000, Power Set]
Type = varSet
TriggerAll = !Time
TriggerAll = var(11)
Trigger1 = prevstateno = [220,230]
Trigger2 = prevstateno = [420,430]
var(10) = 1

[State 1000, Power Set]
Type = ChangeAnim
Trigger1 = !Time
value = 1300+var(10)

[State 200, Move FX]
Type = PlaySnD
Trigger1 = AnimElem = 3
Value = 1,1
Channel = 5

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 2
value = 4,0
Channel = 1

[State 1300, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 6
Value = 1100,2
Channel = 0
IgnoreHitPause = 1

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 2
x = 8.5+var(10)

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 6
x = 0

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 7, = 8
x = .15

[State 1300, Vel]
Type = VelMul
Trigger1 = 1
x = .95

[State 1300, FX Snd]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 1, 1
Channel = 2

[State 200, blade]
Type = Explod
Trigger1 = AnimElem = 6, = 1
anim = 1350
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10

[State 1300, HidDef]
Type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = AnimElem = 6
attr = S, SA
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
animtype = Hard
air.animType = Back
fall.animType = Back
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = M
hitflag = MAF
pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = Low
ground.slidetime = 17
ground.hittime = 21
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.36, -8.52), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
Air.Fall = 1
Fall.Recover = 1
ID = 1300
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, End]
type = ChangeState
TriggerAll = AnimElem = 6, >= 0
TriggerAll = AnimElem = 8, <= 0
Trigger1 = Command = "ShinAoiHana:Seiran"
trigger2 = AILevel
trigger2 = MoveContact && Random %8
value = 1310

[State 1200, End]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;Shin Aoi Hana: Seiran 2nd hit
[Statedef 1310]
Type = S
MoveType = A
Physics = N
Anim = 1310
Velset = 7+var(10),0
Ctrl = 0

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 2
value = 4,1
Channel = 1

[State 200, Move FX]
Type = PlaySnD
Trigger1 = AnimElem = 3
Value = 1,1
Channel = 5

[State 1310, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 5
Value = 1100,2
Channel = 0
IgnoreHitPause = 1

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 5
x = 0

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 6, = 7
x = .15

[State 1300, Vel]
Type = VelMul
Trigger1 = 1
x = .95

[State 1300, FX Snd]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 1, 1
Channel = 2

[State 200, blade]
Type = Explod
Trigger1 = AnimElem = 5, = 1
anim = 1351
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10

[State 1300, HidDef]
Type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
Trigger1 = AnimElem = 5
attr = S, SA
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
animtype = Hard
air.animType = Back
fall.animType = Back
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = M
hitflag = MAF
pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 17
ground.hittime = 21
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.36, -8.52), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
Air.Fall = 1
Fall.Recover = 1
ID = 1310
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, End]
type = ChangeState
TriggerAll = AnimElem = 5, >= 0
TriggerAll = AnimElem = 7, <= 0
Trigger1 = Command = "ShinAoiHana:Seiran"
trigger2 = AILevel
trigger2 = MoveHit && Random %8
value = 1320

[State 200, Over]
Type = ChangeState
Trigger1 = !AnimTime
Value = 0
Ctrl = 1

;Shin Aoi Hana: Seiran last hit
[Statedef 1320]
Type = S
MoveType = A
Physics = N
Anim = 1320
Velset = 7+var(10),0
Ctrl = 0

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 2
value = 1300,0
Channel = 1

[State 200, Move FX]
Type = PlaySnD
Trigger1 = AnimElem = 3
Value = 1,2
Channel = 5

[State 1320, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 8
Value = 1100,2
Channel = 0
IgnoreHitPause = 1

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 8
x = 0

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 9, = 10
x = .15

[State 1300, Vel]
Type = VelMul
Trigger1 = 1
x = .95

[State 1300, FX Snd]
Type = PlaySnd
Trigger1 = AnimElem = 4
Value = 1, 1
Channel = 2

[State 200, blade]
Type = Explod
Trigger1 = AnimElem = 8
anim = 1352
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10

[State 1300, HidDef]
Type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
Trigger1 = AnimElem = 8
attr = S, SA
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 10
animtype = Hard
air.animType = Back
fall.animType = Back
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = M
hitflag = MAF
pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.36, -4), -8
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -4.36, -8.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
Fall = 1
Fall.Recover = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 200, Over]
Type = ChangeState
Trigger1 = !AnimTime
Value = 0
Ctrl = 1

;====<EX SHIN AOI HANA: SEIRAN>=
[StateDef 1330]
type = S
physics = N
moveType = A
anim = 1330
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
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
var(25) = 91

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
time = 1
value = SCA

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 200, Move FX]
Type = PlaySnD
Trigger1 = AnimElem = 3
Value = 1,1
Channel = 5

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 2
value = 4,0
Channel = 2

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 2
x = 13+var(10)

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 6
x = 0

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 7, = 8
x = .15

[State 1300, Vel]
Type = VelMul
Trigger1 = 1
x = .95

[State 1300, FX Snd]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 1, 1
Channel = 2

[State 1330, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 6
Value = 1100,2
Channel = 0
IgnoreHitPause = 1

[State 200, blade]
Type = Explod
Trigger1 = AnimElem = 6, = 1
anim = 1350
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10

[State 1300, HidDef]
Type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = AnimElem = 6
attr = S, SA
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 10
animtype = Hard
air.animType = Back
fall.animType = Back
getPower = 0,0
givePower = 36, 36
guardflag = M
hitflag = MAF
pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = Low
ground.slidetime = 17
ground.hittime = 21
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.52
ground.cornerpush.veloff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 9
x = 12+var(10)

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 10
value = 4,1
Channel = 1

[State 200, Move FX]
Type = PlaySnD
Trigger1 = AnimElem = 11
Value = 1,1
Channel = 5

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 13
x = 0

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 14, = 15
x = .15

[State 1300, Vel]
Type = VelMul
Trigger1 = 1
x = .95

[State 1300, FX Snd]
Type = PlaySnd
Trigger1 = AnimElem = 11
Value = 1, 1
Channel = 2

[State 1330, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 13
Value = 1100,2
Channel = 0
IgnoreHitPause = 1

[State 200, blade]
Type = Explod
Trigger1 = AnimElem = 13, = 9
anim = 1351
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10

[State 1300, HidDef]
Type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
Trigger1 = AnimElem = 13
attr = S, SA
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
animtype = Hard
air.animType = Back
fall.animType = Back
getPower = 0,0
givePower = 36, 36
guardflag = M
hitflag = MAF
pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 17
ground.hittime = 21
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.52
ground.cornerpush.veloff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Air.Fall = 1
Fall.Recover = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1300, Vel]
Type = VelSet
Trigger1 = AnimElem = 15
x = 12+var(10)

[State 1000, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 16
value = 1300,0
Channel = 1

[State 200, Move FX]
Type = PlaySnD
Trigger1 = AnimElem = 17
Value = 1,2
Channel = 5

[State 1300, Vel]
Type = VelMul
Trigger1 = 1
x = .95

[State 1300, FX Snd]
Type = PlaySnd
Trigger1 = AnimElem = 18
Value = 1, 1
Channel = 2

[State 1330, Blade Sound]
type = PlaySnd
Trigger1 = AnimElem = 22
Value = 1100,2
Channel = 0
IgnoreHitPause =

[State 200, blade]
Type = Explod
Trigger1 = AnimElem = 22
anim = 1352
PosType = p1
ownpal = 1
bindtime = 1
sprpriority = 5
ignorehitpause = 1
pausemovetime = 10

[State 1300, HidDef]
Type = HitDef
trigger1 = !var(16) && (var(15) < 3 || var(20))
Trigger1 = AnimElem = 22
attr = S, SA
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 10
animtype = Diagup
air.animType = Diagup
fall.animType = Diagup
getPower = 0,0
givePower = 36, 36
guardflag = M
hitflag = MAF
pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 6), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -65
ground.type = High
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerpush.veloff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
Fall = 1
Fall.Recover = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 200, Over]
Type = ChangeState
Trigger1 = !AnimTime
Value = 0
Ctrl = 1

;====<SOUGA>=
[Statedef 1400]
type = S
physics = N
moveType = A
anim = 1400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1400, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1400, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 4,0
Channel = 2

[State 1400, FX Sound]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 1400,1
Channel = 3

[State 1400, 0]
type = MakeDust
trigger1 = AnimElem = 3

[State 1400, 1]
type = Veladd
trigger1 = AnimElemtime(3) >= 0 && AnimElemtime(14) < 0
x = -.1

[State 1400, 2]
type = Velset
trigger1 = AnimElemtime(3) >= 0 && AnimElemtime(12) < 0
x = 7

[State 1400, 3]
type = Velset
trigger1 = AnimElem = 14
x = 0

[State 1400, 4]
type = ChangeState
trigger1 = AnimElemtime(3) >= 0 && AnimElemtime(12) < 0
trigger1 = p2bodydist X < 50
value = 1405

[State 1400, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Souga Attack Success
[Statedef 1405]
type = S
movetype = A
physics = S
anim = 1405
ctrl = 0
sprpriority = 3
powerAdd = 72 * !var(20)

[State 1405, 0]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2

[State 1405, 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1400,2

[State 1405, 2]
type = Posadd
trigger1 = AnimElem = 4 | AnimElem = 5 | AnimElem = 6 | AnimElem = 8
trigger2 = AnimElem = 9
x = 10

[State 1405, 3]
type = Velset
trigger1 = AnimElem = 8
x = 0

[State 1405, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 15
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 21 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.36, -4.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.36, -4.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yaccel = 0.6
air.fall = 1
fall.recover = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 179), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1405, 4]
type = ChangeState
triggerall = MoveContact
trigger1 = AnimElem = 7
value = 1410

[State 1405, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Souga Grab Success
[Statedef 1410]
type = S
movetype = A
physics = S
anim = 1410
ctrl = 0
sprpriority = 3
powerAdd = 72 * !var(20)

[State 1410, 0]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2

[State 1410, 1]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 4
x = 10

[State 1410, 2]
type = Velset
trigger1 = AnimElem = 1
x = 0

[State 1410, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = !Time
attr = S, ST
damage = 0,15
animtype = Hard
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 0,0
guard.pausetime = 11,10
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
guard.velocity = -6.52
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 179), var(36) := -50
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1415
p2stateno = 1420
Fall = 1
Fall.Recover = 0
yaccel = 0.6
Kill = 0

[State 1410, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Souga Squeeze Finish
[Statedef 1415]
type = S
movetype = A
physics = N
anim = 1415

[State 1415, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1415, 1]
type = Width
trigger1 = 1
edge = 35,0

[State 1415, 2]
type = Explod
trigger1 = AnimElem = 3
anim = 1050
postype = P1
pos = 35, 0
sprpriority = 5
ownpal = 0

[State 1415, 3]
type = Helper
trigger1 = AnimElem = 3
stateNo = 8013
postype = P1
pos = 40, -110
sprpriority = 15
size.xScale = 1
size.yScale = 1
ownpal = 0

[State 1415, 4]
type = PlaySnd
Trigger1 = AnimElem = 2
value = 2,800

[State 1415, 5]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 1000,1

[State 1415, 6]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 4,4

[State 1415, 7]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 2,6

[State 1415, 8]
type = Posadd
trigger1 = AnimElem = 1
x = 10

[State 1415, 9]
type = TargetBind
Trigger1 = AnimElemtime(1) >= 0 && AnimElemtime(2) < 0
pos = 40, -95

[State 1415, 10]
type = TargetBind
Trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(3) < 0
pos = 15, -120

[State 1415, 11]
type = TargetBind
Trigger1 = AnimElemtime(3) >= 0 && AnimElemtime(3) < 10
pos = 60, -50

[State 1415, 12]
type = TargetLifeAdd
Trigger1 = AnimElem = 3
value = -48

[State 1415, 13]
type = EnvShake
trigger1 = AnimElem = 3
ampl = 3
freq = 80
time = 10

[State 1415, 14]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Being Thrown Falling
[Statedef 1420]
type = A
movetype = H
physics = N
velset = 0,0

[State 1420, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1420, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1420

[State 1420, 2]
type = VelSet
trigger1 = AnimElem = 9
x = -4
y = -8

[State 1420, 3]
type = Veladd
trigger1 = AnimElemtime(9) >= 0
y = .6

[State 1420, 4] ;Recover near ground
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER

[State 1420, 5]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;====<EX SOUGA>=
[Statedef 1430]
type = S
physics = N
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
var(25) = 85

[State 1430, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-55 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1430, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1430, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1430, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1430, Goenitz Voice]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 4,0
Channel = 2

[State 1430, FX Sound]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 1400,1
Channel = 3

[State 1430, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 1430, 0]
type = MakeDust
trigger1 = AnimElem = 3

[State 1430, 1]
type = Veladd
trigger1 = AnimElemtime(3) >= 0 && AnimElemtime(14) < 0
x = -.1

[State 1430, 2]
type = Velset
trigger1 = AnimElemtime(3) >= 0 && AnimElemtime(12) < 0
x = 9

[State 1430, 3]
type = Velset
trigger1 = AnimElem = 14
x = 0

[State 1430, 4]
type = ChangeState
trigger1 = AnimElemtime(3) >= 0 && AnimElemtime(12) < 0
trigger1 = p2bodydist X < 50
value = 1435

[State 1430, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Souga Attack Success
[Statedef 1435]
type = S
movetype = A
physics = S
anim = 1405
ctrl = 0
sprpriority = 3

[State 1435, 0]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2

[State 1435, 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1400,2

[State 1435, 2]
type = Posadd
trigger1 = AnimElem = 4 | AnimElem = 5 | AnimElem = 6 | AnimElem = 8
trigger2 = AnimElem = 9
x = 10

[State 1435, 3]
type = Velset
trigger1 = AnimElem = 8
x = 0

[State 1435, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 15
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 21 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.36, -4.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.36, -4.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yaccel = 0.6
air.fall = 1
fall.recover = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 179), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 1435, 4]
type = ChangeState
triggerall = MoveContact
trigger1 = AnimElem = 7
value = 1440

[State 1435, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Souga Grab Success
[Statedef 1440]
type = S
movetype = A
physics = S
anim = 1410
ctrl = 0
sprpriority = 3

[State 1440, 0]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2

[State 1440, 1]
type = Posadd
trigger1 = AnimElem = 1 | AnimElem = 2 | AnimElem = 4
x = 10

[State 1440, 2]
type = Velset
trigger1 = AnimElem = 1
x = 0

[State 1440, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = !Time
attr = S, ST
damage = 0,15
animtype = Hard
guardflag = M
hitflag = MAF
priority = 3, Hit
pausetime = 0,0
guard.pausetime = 11,10
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
guard.velocity = -6.52
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 179), var(36) := -50
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 1445
p2stateno = 1450
Fall = 1
Fall.Recover = 0
yaccel = 0.6
Kill = 0

[State 1440, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Souga Squeeze Finish
[Statedef 1445]
type = S
movetype = A
physics = N
anim = 1415

[State 1445, 0]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1445, 1]
type = Width
trigger1 = 1
edge = 35,0

[State 1445, 2]
type = Explod
trigger1 = AnimElem = 3
anim = 1050
postype = P1
pos = 35, 0
sprpriority = 5
ownpal = 1

[State 1445, 3]
type = Helper
trigger1 = AnimElem = 3
stateno = 8013
ID = 8000
postype = P1
pos = 40, -110
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 1445, 4]
type = PlaySnd
Trigger1 = AnimElem = 2
value = 2,800

[State 1445, 5]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 1000,1

[State 1445, 6]
type = PlaySnd
Trigger1 = AnimElem = 2
value = 4,4

[State 1445, 7]
type = PlaySnd
Trigger1 = AnimElem = 3
value = 2,6

[State 1445, 8]
type = Posadd
trigger1 = AnimElem = 1
x = 10

[State 1445, 9]
type = TargetBind
Trigger1 = AnimElemtime(1) >= 0 && AnimElemtime(2) < 0
pos = 40, -95

[State 1445, 10]
type = TargetBind
Trigger1 = AnimElemtime(2) >= 0 && AnimElemtime(3) < 0
pos = 15, -120

[State 1445, 11]
type = TargetBind
Trigger1 = AnimElemtime(3) >= 0 && AnimElemtime(3) < 10
pos = 60, -50

[State 1445, 12]
type = TargetLifeAdd
Trigger1 = AnimElem = 3
value = -68

[State 1445, 13]
type = EnvShake
trigger1 = AnimElem = 3
ampl = 3
freq = 80
time = 10

[State 1445, 14]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Being Thrown Falling
[Statedef 1450]
type = A
movetype = H
physics = N
velset = 0,0

[State 1450, 0]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 1450, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1420

[State 1450, 2]
type = VelSet
trigger1 = AnimElem = 9
x = -1.5
y = -10

[State 1450, 3]
type = Veladd
trigger1 = AnimElemtime(9) >= 0
y = .6

[State 1450, 4] ;Recover near ground
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER

[State 1450, 5]
type = SelfState
trigger1 = Pos Y >= 0
trigger1 = Vel Y > 0
value = 5100

;====<CUTTING WIND>=
[Statedef 1500]
type = S
physics = N
moveType = A
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1500, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 1500, Blade Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1100,2

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,2
channel = 0

[State 1500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2
channel = 1

[State 1500, Pos]
type = Posadd
trigger1 = var(10) = 0
trigger1 = AnimElem = 4 | AnimElem = 5 | AnimElem = 6
x = 8

[State 1500, Pos]
type = Posadd
trigger1 = var(10) = 1
trigger1 = AnimElem = 4 | AnimElem = 5 | AnimElem = 6
x = 10

[State 1500, Pos]
type = Posadd
trigger1 = var(10) = 2
trigger1 = AnimElem = 4 | AnimElem = 5 | AnimElem = 6
x = 12

[State 1500, Velset]
type = Velset
trigger1 = AnimElem = 3
x = 2

[State 1500, Velset]
type = Velset
trigger1 = AnimElem = 7
x = 0

[State 1500, Blade FX]
type = Explod
trigger1 = animelem = 5
anim = 1505
postype = p1
pos = 0,-130
sprpriority = 5
ownpal = 1

[State 1500, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = AnimElem = 5
attr = S, SA
damage = ceil(ifElse(fvar(11) * 48 < 7, 7, fvar(11) * 48)), 15
animtype = Hard
air.animType = Back
fall.animType = Back
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = M
hitflag = MAF
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -1.36, -1.5), -11.5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -1.36, -1.5), -11.5
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
Fall = 1
Fall.Recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1500, 0]
type = ChangeState
trigger1 = AnimElem = 7
trigger1 = MoveHit
value = 1501

[State 1500, 1]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 15

[State 1500, End]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;Cutting Wind Final Part
[Statedef 1501]
type = A
moveType = A
physics = N
anim = 1510
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1501, Wind FX]
type = Explod
trigger1 = time = 0
anim = 1501
postype = p1
pos = -20,-5
sprpriority = 5
ownpal = 1

[State 1501, Wind SND]
type = playsnd
trigger1 = AnimElem = 1
value = 1200,1

[State 1501, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1500, 0
channel = 0

[State 1501, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2
channel = 1

[State 1501, Blade FX]
type = Explod
trigger1 = animelem = 5
anim = 1506
postype = p1
pos = 20,0
sprpriority = 5
ownpal = 1

[State 1501, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
Trigger1 = AnimElem = 5
attr = S, SA
damage = ceil(ifElse(fvar(11) * 38 < 7, 7, fvar(11) * 38)), 15
animtype = Hard
air.animType = Back
fall.animType = Back
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = H
hitflag = MAF
pauseTime = ifElse(var(20), 6, 20), ifElse(var(20), 6, 20)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = 10 + 0 * (var(35) := 157), var(36) := -70
ground.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.36, -5), 9
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifElse(var(20), -4.36, -5), 9
air.cornerPush.velOff = 0
yAccel = ifelse(var(20),.5,.6)
Fall = 1
Fall.Recover = 1
ID = 1500
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1501, Pos]
type = posadd
trigger1 = Time = 0
x = 20
y = -93

[State 1501, Velset]
type = velset
trigger1 = animelem = 5
x = 2

[State 1501, Veladd]
type = veladd
trigger1 = animelem = 5, >= 0
y = .5

[State 1501, End]
type = changeState
trigger1 = Time > 5
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1515

;Cutting Wind Landing
[Statedef 1515]
Type = S
MoveType = I
Physics = N
Anim = 1515
Ctrl = 0
PowerAdd = 0
VelSet = 0,0

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

[State 1515, Posset]
type = Posset
Trigger1 = !Time
y = 0

[State 1515, Velset]
type = Velset
trigger1 = time = 0
y = 0

[State 1515, Velset]
type = Velset
trigger1 = time = 2
x = 0

[State 1515, End]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;====<EX CUTTING WIND>=
[Statedef 1530]
type = S
physics = N
moveType = A
anim = 1530
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1530, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1530, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1530, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1530, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 41

[State 1530, EX FX]
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

[State 1530, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 1530, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1530, Blade Sound]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1100,2

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, 2
channel = 2

[State 1530, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2
channel = 3

[State 1530, Pos]
type = Posadd
trigger1 = AnimElem = 4 | AnimElem = 5 | AnimElem = 6
x = 12

[State 1530, Velset]
type = Velset
trigger1 = AnimElem = 3
x = 4

[State 1530, Velset]
type = Velset
trigger1 = AnimElem = 7
x = 0

[State 1530, Blade FX]
type = Explod
trigger1 = animelem = 5
anim = 1505
postype = p1
pos = 0,-130
sprpriority = 5
ownpal = 1

[State 1530, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
Trigger1 = AnimElem = 5
attr = S, SA
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 15
animtype = Hard
air.animType = Back
fall.animType = Back
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = M
hitflag = MAF
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -70
ground.type = High
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1.5, -11.5
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -11.5
air.cornerPush.velOff = 0
yAccel = .6
Fall = 1
Fall.Recover = 0
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1530, 0]
type = ChangeState
trigger1 = animelem = 7
trigger1 = movehit
value = 1535

[State 1530, 1]
type = NotHitBy
trigger1 = time = 0
value = SCA
time = 15

[State 1530, End]
type = ChangeState
Trigger1 = !AnimTime
value = 0
Ctrl = 1

;EX Cutting Wind Final Part
[Statedef 1535]
type = A
moveType = A
physics = N
anim = 1540
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1530, Wind FX]
type = Explod
trigger1 = time = 0
anim = 1501
postype = p1
pos = -20,-5
sprpriority = 5
ownpal = 1

[State 1530, Wind SND]
type = playsnd
trigger1 = AnimElem = 1
value = 1200,1

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1500, 0
channel = 0

[State 1530, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2
channel = 1

[State 1530, Blade FX]
type = Explod
trigger1 = animelem = 5
anim = 1506
postype = p1
pos = 20,0
sprpriority = 5
ownpal = 1

[State 1530, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
Trigger1 = AnimElem = 5
attr = S, SA
damage = ceil(ifElse(fvar(11) * 58 < 7, 7, fvar(11) * 58)), 15
animtype = Diagup
air.animType = Diagup
fall.animType = Diagup
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
guardflag = H
hitflag = MAF
pauseTime = ifElse(var(20), 6, 20), ifElse(var(20), 6, 20)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = 10 + 0 * (var(35) := 157), var(36) := -70
ground.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -10
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -2, -10
air.cornerPush.velOff = 0
yAccel = .6
Fall = 1
Fall.Recover = 1
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1530, Pos]
type = posadd
trigger1 = Time = 0
x = 20
y = -93

[State 1530, Velset]
type = velset
trigger1 = animelem = 5
x = 2

[State 1530, Veladd]
type = veladd
trigger1 = animelem = 5, >= 0
y = .5

[State 1530, End]
type = changeState
trigger1 = Time > 5
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 1515

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
facep2 = 1

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, 2
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
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
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
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 185), var(36) := -95
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

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
facep2 = 1

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2910, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4, 2
channel = 0

[State 2910, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = C, SA
hitFlag = MA
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
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
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -4
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2, -4
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 196), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
