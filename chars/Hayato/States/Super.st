; _________________________________________
;| Hayato by varo_hades                    |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<Hyper Flash Sword>=
[StateDef 3000]
type = S
physics = N
moveType = A
anim = 3000
ctrl = 0
juggle = 8
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -1000)
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
trigger1 = AnimElemTime(7) < 0
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
pos = ceil(4 * const(size.xScale)), ceil(-74 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 8700]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8700
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8710]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8710
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1100, Velocity]
type = VelMul
triggerall = statetype = S
trigger1 = 1
x = .88

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 5
trigger2 = AnimElem = 12
trigger3 = AnimElem = 19
trigger4 = AnimElem = 25
trigger5 = AnimElem = 33
trigger6 = AnimElem = 40
trigger7 = AnimElem = 47
x = 10

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 14
value = 4,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 28
value = 4,1
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 59
value = 3000,2
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 12
trigger3 = AnimElem = 19
trigger4 = AnimElem = 25
trigger5 = AnimElem = 33
trigger6 = AnimElem = 40
trigger7 = AnimElem = 47
value = 3000,1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 12
trigger3 = AnimElem = 19
trigger4 = AnimElem = 25
trigger5 = AnimElem = 33
trigger6 = AnimElem = 40
trigger7 = AnimElem = 47
trigger8 = AnimElem = 59
value = 200,0
channel = 1

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -59
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -32
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 21
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -49
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 29
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -29
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 36
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 43
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -81
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 7]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 50
attr = S, HA
animtype = diagup
air.animtype = diagup
fall.animType = diagup
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = .00000001
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -51
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;====<MAX Hyper Flash Sword>=
[StateDef 3050]
type = S
physics = N
moveType = A
anim = 3050
ctrl = 0
juggle = 8
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -2000)
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

[State 3050, SuperPause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(4 * const(size.xScale)), ceil(-74 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 8700]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8700
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8710]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8710
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8800]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [3000,3900]
anim = 8800
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8810]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [3000,3900]
anim = 8810
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 105, 1]
type = statetypeset
trigger1 = anim = 3050 && AnimElem = 65
movetype = I

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 59
StateType = A
physics = N

[State 170, 1]
type = NotHitBy
trigger1 = anim = 3050 && AnimElemTime(59) >= 0
trigger1 = anim = 3050 && AnimElemTime(71) < 0
value = SCA

[State 1100, Velocity]
type = VelMul
triggerall = statetype = S
trigger1 = anim = 3050 && AnimElemTime(56) < 0
x = .85

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 5
trigger2 = AnimElem = 12
trigger3 = AnimElem = 19
trigger4 = AnimElem = 25
trigger5 = AnimElem = 33
trigger6 = AnimElem = 40
trigger7 = AnimElem = 47
x = 10

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 54
x = 8

[State 1100, Velocity]
type = VelSet
trigger1 = anim = 3050 && AnimElem = 61
x = 3
y = -12.5

[State 1100, Velocity]
type = VelSet
trigger1 = anim = 3050 && AnimElem = 66
x = 0

[State 1100, Gravity]
type = VelMul
trigger1 = anim = 3050 && AnimElemTime(56) > 0
x = .92

[State 1100, Gravity]
type = VelAdd
trigger1 = anim = 3050 && AnimElemTime(61) > 0
y = .667

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 14
value = 4,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 28
value = 4,1
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 42
value = 4,2
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = anim = 3050 && AnimElem = 61
value = 4,4
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 12
trigger3 = AnimElem = 19
trigger4 = AnimElem = 25
trigger5 = AnimElem = 33
trigger6 = AnimElem = 40
trigger7 = AnimElem = 47
trigger8 = AnimElem = 52
value = 3000,1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 56
value = 1100,1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 12
trigger3 = AnimElem = 19
trigger4 = AnimElem = 25
trigger5 = AnimElem = 33
trigger6 = AnimElem = 40
trigger7 = AnimElem = 47
trigger8 = AnimElem = 52
value = 200,0
channel = 1

[State 105, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8103
ID = 8100
name = "Dash Dust"
posType = P1
facing = 1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 59
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 420, Helper]
type = Helper
triggerall = anim = 3050
triggerall = animelemtime(65) < 0
trigger1 = AnimElem = 61
trigger2 = AnimElem = 62
trigger3 = AnimElem = 63
trigger4 = AnimElem = 64
trigger5 = animelemtime(64) = 3
trigger6 = animelemtime(64) = 6
trigger7 = animelemtime(64) = 9
trigger8 = animelemtime(64) = 12
stateno = 7000
ownpal = 1
pos = 0,-60

[State 420, Helper]
type = Helper
triggerall = anim = 3050
triggerall = animelemtime(65) < 0
trigger1 = AnimElem = 61
trigger2 = AnimElem = 62
trigger3 = AnimElem = 63
trigger4 = AnimElem = 64
trigger5 = animelemtime(64) = 3
trigger6 = animelemtime(64) = 6
trigger7 = animelemtime(64) = 9
trigger8 = animelemtime(64) = 12
stateno = 7001
ownpal = 1
pos = 0,-60

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -59
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 43), var(36) := -32
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 21
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -49
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 29
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -29
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 36
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 43
attr = S, HA
animtype = Hard
air.animtype = Back
fall.animType = Back
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -81
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 7]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 =  AnimElem = 50
attr = S, HA
animtype = Hard
air.animtype = Back
fall.animType = Back
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 4,12
guard.pauseTime = 4,12
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.52, 0
guard.velocity = -6.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -81
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 8]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 58
attr = S, HA
animtype = Up
air.animtype = Up
fall.animType = Up
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 11,11
guard.pauseTime = 10,12
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -9.5
guard.velocity = -6.52
air.velocity = 0, -9.5
ground.cornerpush.veloff = 0
guard.cornerPush.velOff = -10
air.cornerPush.velOff = 0
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -35
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 9]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 61
attr = A, HA
animtype = Up
air.animtype = Up
fall.animType = Up
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 11,11
guard.pauseTime = 10,12
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -9.5
guard.velocity = -6.52
air.velocity = 0, -9.5
ground.cornerpush.veloff = 0
guard.cornerPush.velOff = -10
air.cornerPush.velOff = 0
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 10]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 62
attr = A, HA
animtype = Up
air.animtype = Up
fall.animType = Up
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 11,11
guard.pauseTime = 10,12
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -9.5
guard.velocity = -6.52
air.velocity = 0, -9.5
ground.cornerpush.veloff = 0
guard.cornerPush.velOff = -10
air.cornerPush.velOff = 0
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 11]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 63
attr = A, HA
animtype = Up
air.animtype = Up
fall.animType = Up
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 11,11
guard.pauseTime = 10,12
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -9.5
guard.velocity = -6.52
air.velocity = 0, -9.5
ground.cornerpush.veloff = 0
guard.cornerPush.velOff = -10
air.cornerPush.velOff = 0
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3000, HitDef 12]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 64
attr = A, HA
animtype = Up
air.animtype = Up
fall.animType = Up
hitFlag = MAF
guardFlag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 8
getPower = 0,0
givePower = 36, 36
pauseTime = 11,11
guard.pauseTime = 10,12
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -9.5
guard.velocity = -6.52
air.velocity = 0, -9.5
ground.cornerpush.veloff = 0
guard.cornerPush.velOff = -10
air.cornerPush.velOff = 0
fall = 1
fall.recover = 1
yaccel = .6
persistent = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 80), var(36) := -84
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3050, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(71) > 0
value = 3051

;Final Kick
[StateDef 3051]
type = S
anim = 3055
physics = S
velSet = 0,0

[State 3002, EX Flash Off]
type = VarSet
trigger1 = !Time
var(25) = 0

[State 3002, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3002, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 420, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000, 1
channel = 1

[State 420, Effect]
type = PlaySnd
trigger1 = AnimElem = 8
value = 3000, 2
channel = 0

[State 3002, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 3002, End]
type = null;ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 3002, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Scimitar>=
[StateDef 3100]
type = S
physics = N
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -1000)
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
trigger1 = AnimElemTime(6) < 0
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
pos = ceil(-18 * const(size.xScale)), ceil(-75 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 8700]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8700
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8710]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8710
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

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

[State 1500,2]
type = Helper
trigger1 = Time = 57
pos = 70,0
stateno = 3105
sprpriority = 4
ownpal = 1
id = 3105
helpertype = normal
keyctrl = 0
supermovetime = 9999

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3100,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElemTime(5) = 12
value = 3100,1

[State 1500,2]
type = Helper
trigger1 = Time = 63
pos = 130,0
stateno = 3105
sprpriority = 4
ownpal = 1
id = 3105
helpertype = normal
keyctrl = 0
supermovetime = 9999

[State 1500,2]
type = Helper
trigger1 = Time = 69
pos = 190,0
stateno = 3105
sprpriority = 4
ownpal = 1
id = 3105
helpertype = normal
keyctrl = 0
supermovetime = 9999

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<MAX Scimitar>=
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 3100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -2000)
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
pos = ceil(-18 * const(size.xScale)), ceil(-75 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 8700]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8700
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8710]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8710
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8800]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [3000,3900]
anim = 8800
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8810]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [3000,3900]
anim = 8810
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3100,0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElemTime(5) = 12
value = 3100,1

[State 1500,2]
type = Helper
trigger1 = Time = 57
pos = 70,0
stateno = 3105
sprpriority = 4
ownpal = 1
id = 3105
helpertype = normal
keyctrl = 0
supermovetime = 9999

[State 1500,2]
type = Helper
trigger1 = Time = 63
pos = 120,0
stateno = 3105
sprpriority = 4
ownpal = 1
id = 3105
helpertype = normal
keyctrl = 0
supermovetime = 9999

[State 1500,2]
type = Helper
trigger1 = Time = 69
pos = 180,0
stateno = 3105
sprpriority = 4
ownpal = 1
id = 3105
helpertype = normal
keyctrl = 0
supermovetime = 9999

[State 1500,2]
type = Helper
trigger1 = Time = 75
pos = 240,0
stateno = 3105
sprpriority = 4
ownpal = 1
id = 3105
helpertype = normal
keyctrl = 0
supermovetime = 9999

[State 1500,2]
type = Helper
trigger1 = Time = 81
pos = 300,0
stateno = 3105
sprpriority = 4
ownpal = 1
id = 3105
helpertype = normal
keyctrl = 0
supermovetime = 9999

[State 1500,2]
type = Helper
trigger1 = Time = 87
pos = 360,0
stateno = 3105
sprpriority = 4
ownpal = 1
id = 3105
helpertype = normal
keyctrl = 0
supermovetime = 9999

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<Black Hayato>=
[StateDef 3200]
type = S
physics = N
moveType = A
anim = 3200
ctrl = 0
juggle = 8
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -3000)
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
var(17) = 33

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
pos = ceil(-13 * const(size.xScale)), ceil(-55 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = time = 3
value = 195,0
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 41,0
channel = 1

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 52, 0
channel = 20

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 10

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 6
x = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 4
movetype = I

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = S
physics = S

[State 0, HitDef]
type = HitDef
trigger1 = 1
attr = S, HA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 16
pausetime = 0,12
guard.pausetime = 10,10
priority = 7, Hit
sparkno = -1
guard.sparkno = -1
guard.kill = 0
kill = 0
sparkxy = 0,-56
sprpriority = 1
p1stateno = 3201
getPower = 0,0
givePower = 36, 36
ignorehitpause = 1
persistent = 0

[State 871, Hit Spark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1= (target,movetype=H) && !(target,time)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2  ;p2,front,back,left,right
facing = 1
pos = ceil(-10 * const(size.xScale)), ceil(-42 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;Start
[StateDef 3201]
type = S
movetype= A
physics = S
ctrl = 0
anim = 3201
velset = 0,0

[State 1000, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 901, Throw]
type = TargetState
trigger1 = AnimElem = 1
value = 3205

[State 220, Position]
type = PosSet
trigger1 = animelem = 3
x = -60*facing

[State 220, Turn]
type = Turn
trigger1 = animelem = 3

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 29
x = 12

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 32
x = 0

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 50,0

[State 901,1]
type = TargetBind
trigger1 = animelem = 1
pos = ceil(60*const(size.xscale)),0
time = 1

[State 3105, AssertSpecial]
type = AssertSpecial
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 0
flag = NoBG
flag2 = NoFG
flag3 = timerfreeze

[State 9606, EnvColor]
type = PlaySnd
trigger1 = animelemtime(3) >= 10
trigger1 = animelemtime(4) < 0
trigger1 = Time % 6 = 2
value = 2,8+(random%2)
channel = 5

[State 9606, EnvColor]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 24
trigger3 = animelem = 26
value = 2,9
channel = 5

[State 871, Hit Spark]
type = Helper
trigger1 = animelem = 1
trigger2 = animelemtime(3) >= 10
trigger2 = animelemtime(4) < 0
trigger2 = Time % 6 = 2
trigger3 = animelem = 24
trigger4 = animelem = 26
helperType = Normal
stateNo = 8017
ID = 8000
name = "Spark"
postype = p2  ;p2,front,back,left,right
facing = 1
pos = ceil(0 * const(size.xScale)), ceil(-50 * const(size.yScale))
random = 20,40
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = AnimElem = 30
value = 52, 0
channel = 20

[State 52, Landing Dust Explod]
type = Explod
trigger1 = AnimElem = 30
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = animelem = 1
trigger2 = animelemtime(3) >= 10
trigger2 = animelemtime(4) < 0
trigger2 = Time % 6 = 2
trigger3 = animelem = 24
trigger4 = animelem = 26
value = 1

[State 3105, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 1
trigger2 = animelemtime(3) >= 10
trigger2 = animelemtime(4) < 0
trigger2 = Time % 6 = 2
trigger3 = animelem = 24
value = -25
kill = 0

[State 3105, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 26
value = -20

[State 903, EnvShake]
type = EnvShake
trigger1 = animelem = 24
trigger2 = animelem = 26
time = 12
ampl = 3

[State 901, Throw]
type = TargetState
trigger1 = animelem = 27
value = 3206

[State 200, 2]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;Player 2 start
[Statedef 3205]
type = S
movetype= H
physics = N
ctrl = 0
velset = 0, 0
sprpriority = -1

[State 1000, 0]
type = HitFallSet
trigger1 = time = 0
value = 1

[State 200, 2]
type = ChangeAnim2
trigger1 = time = 0
value = 3205

[State 220, Position]
type = PosSet
trigger1 = animelem = 2
x = 0

;Player 2
[Statedef 3206]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 5050, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = Time = 0     ;If no transition anim
trigger1 = (Anim != [5051,5059]) && (Anim != [5061,5069])
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
x = -5
y = -11

[State 903, Vel]
type = veladd
trigger1 = Time > 0
y = .5

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 903, 2]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;====<Plasma Field>=
[StateDef 3300]
type = S
moveType = A
physics = N
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -1000)
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
trigger1 = AnimElemTime(4) < 0
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
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 8700]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8700
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8710]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8710
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

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

[State 3300, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 730,1
channel = 0

[State 3300, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100,1
channel = 1

[State 3300, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,0
channel = 1

[State -2, 1]
type = PalFX
trigger1 = AnimElem = 5
time = 38
color = 128
add = 96,96,192
ignorehitpause = 1

[State 3052, tremolor]
type = EnvShake
trigger1 = animelem = 5
time = 40 ;Tiempo que quieres que dure
ampl = 4 ; Amplitud que deseas que tenga
freq = 127 ; Frecuencia

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 155 < 7, 7, fvar(11) * 155)), 25
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 6,12
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
guard.velocity = -4.52
air.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 905, Custom Combo Timer]
type = VarSet
trigger1 = Movehit
var(5) = 320

[State 3052, primereffecte]
type = explod
trigger1 = AnimElem = 5
anim = 3351
postype = p1
pos = 0,-70
scale = 1.5,1
sprpriority = 0
removeongethit = 1
ownpal = 1

[State 3052, segoneffecte]
type = explod
trigger1 = AnimElem = 5
anim = 3352
postype = p1
pos = 0,-70
scale = 1,1
sprpriority = 0
removeongethit = 1
removetime = 20
trans = add
ownpal = 1

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3305
ctrl = 1

;Landing
[StateDef 3305]
type = S
moveType = I
physics = N
anim = 3305
velSet = 0,0

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

;====<MAX Plasma Field>=
[StateDef 3350]
type = S
moveType = A
physics = N
anim = 3300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = ifelse (var(5), 0, -2000)
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
var(17) = 33

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
trigger1 = AnimElemTime(5) < 0
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
pos = ceil(5 * const(size.xScale)), ceil(-65 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 8700]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8700
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8710]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [1000,1999]
anim = 8710
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8800]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [3000,3900]
anim = 8800
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 8810]
type = Explod
trigger1 = Time = 3
trigger1 = PrevStateNo = [3000,3900]
anim = 8810
pos = ifelse(Facing = 1, -320, 0), 0
ontop = 1
ownpal = 1
postype = front
bindtime = -1
supermove = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 38
moveTime = 38
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3300, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 730,1
channel = 0

[State 3300, Voice 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100,1
channel = 1

[State 3300, Voice 3]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1100,0
channel = 1

[State -2, 1]
type = PalFX
trigger1 = AnimElem = 5
time = 38
color = 128
add = 96,96,192
ignorehitpause = 1

[State 3052, tremolor]
type = EnvShake
trigger1 = animelem = 5
time = 40 ;Tiempo que quieres que dure
ampl = 4 ; Amplitud que deseas que tenga
freq = 127 ; Frecuencia

[State 3000, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 198 < 7, 7, fvar(11) * 198)), 25
getPower = 0,0
givePower = 36, 36
pauseTime = 10,12
guard.pauseTime = 6,12
animType = diagup
air.animType = diagup
fall.animType = diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -1, -15
guard.velocity = -4.52
air.velocity = -1, -15
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
fall = 1
fall.recover = 1
yaccel = .6
forceStand = 1
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 120), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 905, Custom Combo Timer]
type = VarSet
trigger1 = Movehit
var(5) = 620

[State 3052, primereffecte]
type = explod
trigger1 = AnimElem = 5
anim = 3351
postype = p1
pos = 0,-70
scale = 1.5,1
sprpriority = 0
removeongethit = 1
ownpal = 1

[State 3052, segoneffecte]
type = explod
trigger1 = AnimElem = 5
anim = 3352
postype = p1
pos = 0,-70
scale = 1,1
sprpriority = 0
removeongethit = 1
removetime = 20
trans = add
ownpal = 1

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3305
ctrl = 1
