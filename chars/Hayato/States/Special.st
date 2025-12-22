; _________________________________________
;| Hayato by varo_hades                    |
; ｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯ
;==
;====<SPECIAL MOVES>===
;==

;=<Flash Sword>==
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

[State 1000, ChangeAnim]
type = ChangeAnim
Trigger1 = Time = 0
value = ifelse(var(10) = 0, 1000, ifelse(var(10) = 1, 1010, 1020))

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 220, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 1
trigger2 = AnimElemTime(10) = 4
x = 15+(8.5*var(10))

[State 1100, Velocity]
type = VelMul
trigger1 = 1
x = .85

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 16
x = 0

[State 105, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 0
channel = 0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 12
value = 4, 2
channel = 0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 12
value = 3000, 1

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElemTime(10) = 4
value = 200, 0
channel = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 15
movetype = I

[State 3000, AfterImage]
type = AfterImage
trigger1 = time = 1
time = 22
TimeGap = 3
FrameGap = 4
length = 10
PalColor = 64
PalBright = 1,1,1
PalContrast = 256,256,256
PalAdd = 0,0,0
PalMul = 1,1,1
trans = add1

[State 52, RemoveAfterImage]
type = AfterImageTime
trigger1 = AnimElem = 18
time = 0

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
animtype = Hard
air.animtype = Back
fall.animtype = Back
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 55, ifElse(var(10), 55, 55)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 55, ifElse(var(10), 55, 55)))), 15
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 15)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -44
ground.type = Low
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.36, -4.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
air.fall = 1
fall.recover = 1
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
persistent = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 13
attr = S, SA
animtype = Hard
air.animtype = Back
fall.animtype = Back
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 45, ifElse(var(10), 45, 45)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 45, ifElse(var(10), 45, 45)))), 15
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -50
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -2.36, -4), -8
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), -2.36, -4), -8
air.cornerPush.velOff = 0
yAccel = ifElse(var(20),.5,.6)
fall = 1
fall.recover = 1
envshake.time = 10
envshake.ampl = 3
persistent = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<EX Flash Sword>=
[StateDef 1030]
type = S
physics = N
moveType = A
anim = 1020
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -500)
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
var(25) = 65

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

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

[State 8900, Effect]
type = Helper
trigger1 = !time
name = "EX Effect"
stateno = 8900
ID = 8900
pos = 0,0
keyctrl = 0
postype = p1
supermovetime = 99999999
pausemovetime = 99999999
ownpal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 220, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 1
trigger2 = AnimElemTime(10) = 4
x = 12+(6.5*var(10))

[State 1100, Velocity]
type = VelMul
trigger1 = 1
x = .85

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 16
x = 0

[State 105, Dust Helper]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 0
channel = 0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 12
value = 4, 2
channel = 0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 12
value = 3000, 1

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
trigger2 = AnimElemTime(10) = 4
value = 200, 0
channel = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 15
movetype = I

[State 3000, AfterImage]
type = AfterImage
trigger1 = time = 1
time = 22
TimeGap = 3
FrameGap = 4
length = 10
PalColor = 64
PalBright = 1,1,1
PalContrast = 256,256,256
PalAdd = 0,0,0
PalMul = 1,1,1
trans = add1

[State 52, RemoveAfterImage]
type = AfterImageTime
trigger1 = AnimElem = 18
time = 0

[State 1030, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
attr = S, SA
animtype = Hard
air.animtype = Back
fall.animtype = Back
damage = ceil(ifElse(fvar(11) * 55 < 7, 7, fvar(11) * 55)), 15
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 15)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -44
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
air.fall = 1
fall.recover = 1
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
persistent = 0
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1030, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1 = AnimElem = 13
attr = S, SA
animtype = diagup
air.animtype = diagup
fall.animtype = diagup
damage = ceil(ifElse(fvar(11) * 45 < 7, 7, fvar(11) * 45)), 15
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -50
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = .6
fall = 1
fall.recover = 1
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
persistent = 0
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Crimson Sword>=
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

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1120, ifElse(var(10) = 1, 1110, 1100))

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 10
movetype = I

[State 220, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,0
channel = 0

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && !var(10)
trigger2 = AnimElem = 3 && var(10)
value = 1100, 1

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
value = 41, 0

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 1
x = 6*(var(10))

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 6
x = .5*(var(10))
y = -10-(var(10)*2)

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1100, Gravity]
type = VelMul
trigger1 = 1
x = .95

[State 1100, Gravity]
type = Veladd
trigger1 = AnimElemTime(6) > 0
y = .667

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 420, Helper]
type = Helper
triggerall = animelemtime(8) < 0
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = animelemtime(7) = 3
trigger4 = animelemtime(7) = 6
trigger5 = animelemtime(7) = 9
trigger6 = animelemtime(7) = 12
trigger7 = animelemtime(7) = 15
stateno = 7000
ownpal = 1
pos = 0,-60

[State 420, Helper]
type = Helper
triggerall = animelemtime(8) < 0
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = animelemtime(7) = 3
trigger4 = animelemtime(7) = 6
trigger5 = animelemtime(7) = 9
trigger6 = animelemtime(7) = 12
trigger7 = animelemtime(7) = 15
stateno = 7001
ownpal = 1
pos = 0,-60

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 26, 26)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 26, 26)))), 10
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -29
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = ifelse(var(20), 0, 0), -9.5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.36, -4.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), 0, 0), -9.5
air.cornerPush.velOff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
yaccel = ifelse(var(20),.5,.6)
persistent = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = AnimElem = 6
attr = A, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 26, 26)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 26, 26)))), 10
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -80
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = ifelse(var(20), 0, 0), -9.5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.36, -4.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), 0, 0), -9.5
air.cornerPush.velOff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
yaccel = ifelse(var(20),.5,.6)
persistent = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = var(10) = [1,2]
trigger1 = AnimElem = 7
attr = A, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 26, 26)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 26, ifElse(var(10), 26, 26)))), 10
priority = 7, Hit
hitflag = MAF
guardflag = MA
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -80
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = ifelse(var(20), 0, 0), -9.5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), 0, 0), -9.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerpush.veloff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
air.fall = 1
yaccel = ifelse(var(20),.5,.6)
persistent = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = var(10) = 2
trigger1 = AnimElem = 8
attr = A, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 16, ifElse(var(10), 16, 16)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 16, ifElse(var(10), 16, 16)))), 10
priority = 7, Hit
hitflag = MAF
guardflag = MA
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -70
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = ifelse(var(20), 0, 0), -9.5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), 0, 0), -9.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerpush.veloff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
air.fall = 1
yaccel = ifelse(var(20),.5,.6)
persistent = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 5 || var(20))
trigger1 = var(10) = 0 && AnimElem = 7
trigger2 = var(10) = 1 && AnimElem = 8
trigger3 = var(10) = 2 && AnimElem = 9
attr = A, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 12, ifElse(var(10), 12, 12)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 12, ifElse(var(10), 12, 12)))), 10
priority = 7, Hit
hitflag = MAF
guardflag = MA
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -88
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = ifelse(var(20), 0, 0), -9.5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.36, -6.52)
guard.cornerPush.velOff = 0
air.velocity = ifelse(var(20), 0, 0), -9.5
air.cornerPush.velOff = 0
airguard.velocity = -5, -1.5
airguard.cornerpush.veloff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
air.recover = 0
air.fall = 1
yaccel = ifelse(var(20),.5,.6)
persistent = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(6) > 0
value = 1105

;Landing
[StateDef 1105]
type = S
anim = 1105
physics = N
moveType = I
velSet = 0,0

[State 1101, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;紅蓮（エフェクト）（表）
[Statedef 7000]
type = A
movetype = I
physics = N
anim = 7000
ctrl = 0
sprpriority = 3

[State 20000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 20000, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;紅蓮（エフェクト）（・）
[Statedef 7001]
type = A
movetype = I
physics = N
anim = 7001
ctrl = 0
sprpriority = 1

[State 20000, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 20000, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;====<EX Crimson Sword>=
[StateDef 1130]
type = S
physics = N
moveType = A
anim = 1130
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -500)
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
var(25) = 35

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

[State 8900, Effect]
type = Helper
trigger1 = !time
name = "EX Effect"
stateno = 8900
ID = 8900
pos = 0,0
keyctrl = 0
postype = p1
supermovetime = 99999999
pausemovetime = 99999999
ownpal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 11
movetype = I

[State 220, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,0
channel = 0

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && !var(10)
trigger2 = AnimElem = 3 && var(10)
value = 1100, 1

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
value = 41, 0

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 1
x = 7*(var(10))

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 6
x = .5*(var(10))
y = -9-(var(10)*2)

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 8
x = 0

[State 1100, Gravity]
type = VelMul
trigger1 = 1
x = .95

[State 1100, Gravity]
type = Veladd
trigger1 = AnimElemTime(6) > 0
y = .667

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 420, Helper]
type = Helper
triggerall = animelemtime(8) < 0
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = animelemtime(7) = 3
trigger4 = animelemtime(7) = 6
trigger5 = animelemtime(7) = 9
trigger6 = animelemtime(7) = 12
trigger7 = animelemtime(7) = 15
stateno = 7000
ownpal = 1
pos = 0,-60

[State 420, Helper]
type = Helper
triggerall = animelemtime(8) < 0
trigger1 = AnimElem = 6
trigger2 = AnimElem = 7
trigger3 = animelemtime(7) = 3
trigger4 = animelemtime(7) = 6
trigger5 = animelemtime(7) = 9
trigger6 = animelemtime(7) = 12
trigger7 = animelemtime(7) = 15
stateno = 7001
ownpal = 1
pos = 0,-60

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * 26 < 7, 7, fvar(11) * 26)), 10
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -29
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = 0, -10.
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, -10.5
air.cornerPush.velOff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 6
attr = S, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * 26 < 7, 7, fvar(11) * 26)), 10
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -29
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = 0, -10.5
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, -10.5
air.cornerPush.velOff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 7
attr = A, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 10
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -60
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = 0, -10.5
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, -10.5
air.cornerPush.velOff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 8
attr = A, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 10
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -60
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = 0, -10.5
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, -10.5
air.cornerPush.velOff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 9
attr = A, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * 16 < 7, 7, fvar(11) * 16)), 10
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -60
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = 0, -10.5
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, -10.5
air.cornerPush.velOff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 6 || var(20))
trigger1 = AnimElem = 10
attr = A, SA
animtype = Up
air.animtype = Up
fall.animtype = Up
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 12)), 10
priority = 7, Hit
hitflag = MAF
guardflag = M
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 10)
guard.pauseTime = ifElse(var(20), 5, 10), ifElse(var(20), 6, 12)
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -68
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = 0, -10.5
ground.cornerpush.veloff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = 0, -10.5
air.cornerPush.velOff = 0
envshake.time = 10
envshake.ampl = 3
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
getPower = 0,0
givePower = 36, 36
palFX.time = 12 * var(9)
palfx.add = 255,255,255
palfx.mul = 128,128,128
forcestand = 1

[State 1100, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(6) > 0
value = 1105

;=<Grab Launcher>==
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
var(10) = ifElse((command = "a"), 0, ifElse((command = "b"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 220, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 900, 1]
type = HitDef
triggerall = var(20)
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 2
attr = S, ST
hitflag = MAFD
priority = 3, Miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 1201
p2stateno = 1209
guard.dist = 0
getpower = 0,0
givepower = 35
fall = 1
air.fall = 1
fall.recover = 1
numhits = 0

[State 900, 1]
type = HitDef
triggerall = !var(20)
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 2
attr = S, ST
hitflag = M-
priority = 3, Miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 1201
p2stateno = 1209
guard.dist = 0
getpower = 0,0
givepower = 35
fall = 1
air.fall = 1
fall.recover = 1
numhits = 0

[State 900, 1]
type = HitDef
triggerall = !var(20)
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 2
attr = S, ST
hitflag = MF
priority = 3, Miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 1201
p2stateno = 1209
guard.dist = 0
getpower = 0,0
givepower = 35
fall = 1
air.fall = 1
fall.recover = 1
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 1
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 3
movetype = I

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Continue
[Statedef 1201]
type = S
movetype = A
physics = N
velset = 0,0
anim = 1201

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1205

[State 901, Throw]
type = TargetState
trigger1 = AnimElem = 5
value = 1206

[State 3001, Width]
type = Width
trigger1 = 1
edge = 40,0

[State 52, 2]
type = PosAdd
trigger1 = AnimElem = 3
x = 48

[State 52, 2]
type = PosAdd
trigger1 = AnimElem = 4
x = 16

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 2,800

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 2,2

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,0
channel = 0

[State 871, Hit Spark]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = ceil(63 * const(size.xScale)), ceil(-79 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 901,1]
type = TargetBind
trigger1 = animelem = 1
pos = ceil(48*const(size.xscale)),ceil(-85*const(size.yscale))
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 2
pos = ceil(62*const(size.xscale)),ceil(-66*const(size.yscale))
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 3
pos = ceil(23*const(size.xscale)),ceil(-62*const(size.yscale))
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 4
pos = ceil(67*const(size.xscale)),ceil(-85*const(size.yscale))
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 5
pos = ceil(48*const(size.xscale)),ceil(-24*const(size.yscale))
time = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = AnimElem = 4
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = AnimElem = 4
value = -68

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = AnimElem = 4
value = -68

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = AnimElem = 4
value = -68

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = AnimElem = 4
value = 35

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 12
ampl = 4

[State 901, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 1205]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -2

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1205

[State 903, 2]
type = SelfState
trigger1 = Time > 60
value = 5100

;Player 2
[Statedef 1206]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 320,0

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5050)
value = 5050

[State 5050, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = Time = 0     ;If no transition anim
trigger1 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5050

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 903, Vel]
type = VelSet
trigger1 = Time = 0
x = -4
y = -7

[State 903, Vel]
type = VelSet
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
x = -4

[State 903, Vel]
type = veladd
trigger1 = Time > 0
y = .6

[State 5200, 1] ;Recover Near Ground
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_GROUND RECOVER

[State 903, 2]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2
[Statedef 1207]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1
movecamera = 320,0

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5061)
value = 5061

[State 5050, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = Time = 0     ;If no transition anim
trigger1 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5050

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 903, Vel]
type = VelSet
trigger1 = Time = 0
x = -1.5
y = -12

[State 903, Vel]
type = VelSet
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
x = -3

[State 903, Vel]
type = veladd
trigger1 = Time > 0
y = .5

[State 5200, 1] ;Recover Near Ground
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_GROUND RECOVER

[State 5210, 2] ;Recover In Air
type = SelfState
triggerall = Vel Y > 0
triggerall = Pos y < -20
triggerall = alive
triggerall = power >= 2000
trigger1 = Command = "recovery"
value = 5210 ;HITFALL_AIR RECOVER

[State 903, 2]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2
[Statedef 1209]
type = S
movetype = H
physics = S
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

;=<EX Grab Launcher>==
[StateDef 1230]
type = S
physics = S
moveType = A
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -500)
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

[State 8900, Effect]
type = Helper
trigger1 = !time
name = "EX Effect"
stateno = 8900
ID = 8900
pos = 0,0
keyctrl = 0
postype = p1
supermovetime = 99999999
pausemovetime = 99999999
ownpal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 220, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 2
attr = S, ST
hitflag = M-
priority = 3, Miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 1231
p2stateno = 1209
guard.dist = 0
getpower = 0,0
givepower = 35
fall = 1
air.fall = 1
fall.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-const(size.ground.front),31]
trigger1 = AnimElem = 2
attr = S, ST
hitflag = MF
priority = 3, Miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 1231
p2stateno = 1209
guard.dist = 0
getpower = 0,0
givepower = 35
fall = 1
air.fall = 1
fall.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4, 1
channel = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 3
movetype = I

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Continue
[Statedef 1231]
type = S
movetype = A
physics = N
velset = 0,0
anim = 1201

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 66

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1205

[State 901, Throw]
type = TargetState
trigger1 = AnimElem = 5
value = 1207

[State 3001, Width]
type = Width
trigger1 = 1
edge = 40,0

[State 52, 2]
type = PosAdd
trigger1 = AnimElem = 3
x = 48

[State 52, 2]
type = PosAdd
trigger1 = AnimElem = 4
x = 16

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 2,800

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 2,2

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200,0
channel = 0

[State 871, Hit Spark]
type = Helper
trigger1 = AnimElem = 4
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = ceil(63 * const(size.xScale)), ceil(-79 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 901,1]
type = TargetBind
trigger1 = animelem = 1
pos = ceil(48*const(size.xscale)),ceil(-85*const(size.yscale))
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 2
pos = ceil(62*const(size.xscale)),ceil(-66*const(size.yscale))
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 3
pos = ceil(23*const(size.xscale)),ceil(-62*const(size.yscale))
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 4
pos = ceil(67*const(size.xscale)),ceil(-85*const(size.yscale))
time = -1

[State 901,1]
type = TargetBind
trigger1 = animelem = 5
pos = ceil(48*const(size.xscale)),ceil(-24*const(size.yscale))
time = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = AnimElem = 4
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 4
value = -78

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 12
ampl = 4

[State 901, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
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
facep2 = 1

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 2900, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 220, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 200, 0
channel = 1

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 5
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
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -32
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
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
trigger1 = AnimElem = 4
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 450, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 200, 0
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
ground.slideTime = 18
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
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8016)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -22
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
