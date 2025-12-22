; _________________________________________
;| Charlie by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<SONIC BREAK>=
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
trigger1 = AnimElemTime(3) < 0
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
pos = ceil(-52 * const(size.xScale)), ceil(-75 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Anim]
type = changeanim
triggerall = (anim = [3000,3002]) && animelemtime(4) >= 0 && animelemtime(6) < 0
trigger1 = !AILevel && (command = "x" || command = "y" || command = "z")
trigger2 = AILevel
value = anim+1

[State 3000, width]
type=width
trigger1 = anim = 3000 && animelemtime(2) >= 0 && animelemtime(8) < 0
trigger2 = anim = 3001 && animelemtime(8) < 0
trigger3 = anim = 3002 && animelemtime(2) >= 0 && animelemtime(7) < 0
trigger4 = anim = 3003 && animelemtime(4) >= 0 && animelemtime(6) < 0
player = ceil(ifelse(anim = 3000,23,ifelse(anim = 3001,40,77))*const(size.xscale)),0

[State 3000, Snd]
type = playsnd
trigger1 = (anim = [3000,3002]) && animelem = 2
trigger2 = anim = 3003 && animelem = 3
value = 3200,0
channel = 0

[State 3000, FX]
type = helper
trigger1 = !numhelper(1010)
trigger1 = (anim = [3000,3002]) && animelem = 2
helpertype = normal
stateno = 1010
ID = 1010
name = "Sonic Boom FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3000, Sonic Boom]
type = helper
trigger1 = (anim = [3000,3002]) && animelem = 3
trigger2 = anim = 3003 && animelem = 4
helpertype = normal
stateno = 3005
ID = 3005
name = "Sonic Boom"
postype = p1
pos = ceil(ifelse(anim = 3000,47,ifelse(anim = 3001,64,101))*const(size.xscale)),ceil(-68*const(size.yscale))
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 3000, Snd]
type = playsnd
trigger1 = (anim = [3000,3002]) && animelem = 3
trigger2 = anim = 3003 && animelem = 4
value = 1000,1

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3003 && animelem = 8
value = 52,0

[State 3000, End]
type = changestate
trigger1 = !animtime
value = ifelse(anim = 3003,11,0)
ctrl = 1

;====<MAX SONIC BREAK>=
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
trigger1 = AnimElemTime(4) < 0
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
pos = ceil(-52 * const(size.xScale)), ceil(-75 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3050, Anim]
type = changeanim
triggerall = (anim = [3000,3002]) && animelemtime(4) >= 0 && animelemtime(6) < 0
trigger1 = !AILevel && (command = "x" || command = "y" || command = "z")
trigger2 = AILevel
value = anim+1

[State 3050, width]
type = width
trigger1 = anim = 3000 && animelemtime(2) >= 0 && animelemtime(8) < 0
trigger2 = anim = 3001 && animelemtime(8) < 0
trigger3 = anim = 3002 && animelemtime(2) >= 0 && animelemtime(7) < 0
trigger4 = anim = 3003 && animelemtime(4) >= 0 && animelemtime(6) < 0
player = ceil(ifelse(anim = 3000,23,ifelse(anim = 3001,40,77))*const(size.xscale)),0

[State 3050, Snd]
type = playsnd
trigger1 = (anim = [3000,3002]) && animelem = 2
trigger2 = anim = 3003 && animelem = 3
value = 3200,0
channel = 0

[State 3050, FX]
type = helper
trigger1 = !numhelper(1010)
trigger1 = (anim = [3000,3002]) && animelem = 2
helpertype = normal
stateno = 1010
ID = 1010
name = "Sonic Boom FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3050, Sonic Boom]
type = helper
trigger1 = (anim = [3000,3002]) && animelem = 3
trigger2 = anim=3003 && animelem = 4
helpertype = normal
stateno = 3005
ID = 3005
name = "Sonic Boom"
postype = p1
pos=ceil(ifelse(anim = 3000,47,ifelse(anim = 3001,64,101))*const(size.xscale)),ceil(-68*const(size.yscale))
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 3050, Snd]
type = playsnd
trigger1 = (anim = [3000,3002]) && animelem = 3
trigger2 = anim = 3003 && animelem = 4
value = 1000,1

[State 3050, Sonic Boom]
type = helper
trigger1 = (anim = [3000,3002]) && animelem = 5
trigger2 = anim = 3003 && animelem = 4
helpertype = normal
stateno = 3005
ID = 3005
name = "Sonic Boom"
postype = p1
pos = ceil(ifelse(anim = 3000,47,ifelse(anim = 3001,64,101))*const(size.xscale)),ceil(ifelse(anim = 3003,-38,ifelse(anim = 3001,-88,-88))*const(size.yscale))
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3003 && animelem = 8
value = 52,0

[State 3050, End]
type = changestate
trigger1 = !animtime
value = ifelse(anim = 3003,11,0)
ctrl = 1

;==<SOMMERSAULT JUSTICE>====
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
var(17) = 33

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
trigger1 = AnimElemTime(4) < 0
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
pos = ceil(20 * const(size.xScale)), ceil(-24 * const(size.yScale))
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

[State 3100, Vel]
type = velmul
trigger1 = animelemtime(14) < 0
x = .85

[State 3100, Vel]
type = velset
trigger1 = animelem = 5
x = 6

[State 3100, Vel]
type = velmul
trigger1 = animelemtime(17) >= 0
x = .95

[State 3100, grav]
type = veladd
trigger1 = animelemtime(17) >= 0
y = .675

[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(17) >= 0
statetype = A

[State 3100, Vel]
type = velset
trigger1 = animelem = 17
x = 12
y = -12

[State 3100, Vel]
type = velset
trigger1 = animelem = 23
x = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 16
value = 3000,ifelse((animelem = 16),1,2)
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 16
value = 1100,1
freqmul = ifelse((animelem = 16),.9,1)

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 17
value = 41,0

[State 3100, Dust]
type = helper
trigger1 = animelem = 17
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3100, FX]
type = helper
trigger1 = !numhelper(1105)
trigger1 = animelem = 4 || animelem = 16
helpertype = normal
stateno = 1105
ID = 1105
name = "Sommersault FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  animelem = 4
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 32 < 7, 7, fvar(11) * 32)), 10
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
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9.5
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1= animelem = 6
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 32 < 7, 7, fvar(11) * 32)), 10
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
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9.5
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 113), var(36) := -110
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 16
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 32 < 7, 7, fvar(11) * 32)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -9.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  animelem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 32 < 7, 7, fvar(11) * 32)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -9.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := ceil(ifelse((animelem=17),-57,-84)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 19
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 4,4
guard.pauseTime = 4,4
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -3, -8.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := ceil(-110*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(21) >= 0
movetype = I

[State 3100, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 3101

;---LAND---
[Statedef 3101]
type = S
physics = S
ctrl = 0
anim = 3101
velset = 0,0
movehitpersist = 1

[State 3103, Pos]
type = posset
trigger1 = 1
y = 0

[State 3103, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 3103, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3103, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1

;====<MAX SOMMERSAULT JUSTICE>=
[StateDef 3150]
type = S
physics = N
moveType = A
anim = 3150
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
var(17) = 33

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
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(20 * const(size.xScale)), ceil(-24 * const(size.yScale))
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
sound = s8500,1
darken = 0

[State 3100, Vel]
type = velmul
trigger1 = animelemtime(26) < 0
x = .85

[State 3100, Vel]
type = velset
trigger1 = animelem = 5 || animelem = 17
x = 6

[State 3100, Vel]
type = velmul
trigger1 = animelemtime(29) >= 0
x = .95

[State 3100, grav]
type = veladd
trigger1 = animelemtime(29) >= 0
y = .675

[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(29) >= 0
statetype = A

[State 3100, Vel]
type = velset
trigger1 = animelem = 29
x = 12
y = -12

[State 3100, Vel]
type = velset
trigger1 = animelem = 35
x = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 16 || animelem = 28
value = 3000,ifelse((animelem = 28),1,2)
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 4 || animelem = 16 || animelem = 28
value = 1100,1
freqmul = ifelse((animelem = 28),.9,1)

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 29
value = 41,0

[State 3100, Dust]
type = helper
trigger1 = animelem = 29
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3100, FX]
type = helper
trigger1 = !numhelper(1105)
trigger1 = animelem = 4 || animelem = 16 || animelem = 28
helpertype = normal
stateno = 1105
ID = 1105
name = "Sommersault FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  animelem = 4 || animelem = 5 || animelem = 16 || animelem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9.5
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 64), var(36) := ceil(ifelse((animelem=5 || animelem=17),-70,-30)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1= animelem = 6 || animelem = 18
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9.5
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 113), var(36) := -110
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 28
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -9.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  animelem = 29 || animelem = 30
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.5, -9.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := ceil(ifelse((animelem=29),-57,-84)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 31
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 18 < 7, 7, fvar(11) * 18)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,6
guard.pauseTime = 6,6
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -3, -8.5
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := ceil(-110*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(33) >= 0
movetype = I

[State 3100, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 3101

;====<SONIC BLADE>=
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
var(17) = 57

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
trigger1 = AnimElemTime(23) < 0
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
pos = ceil(-24 * const(size.xScale)), ceil(-76 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 67
moveTime = 67
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0

[State 3600, width]
type = width
trigger1 = animelemtime(18) >= -1 && animelemtime(19) < -1
player = ceil(40*const(size.yscale))

[State 3600, width]
type = width
trigger1 = animelemtime(19) >= -1 && animelemtime(20) < -1
player = ceil(20*const(size.yscale))

[State 3600, width]
type = width
trigger1 = animelemtime(20) >= -1 && animelemtime(21) < -1
player = ceil(2*const(size.yscale))

[State 3600, Pos]
type = posadd
trigger1 = animelem = 18 || animelem = 19 || animelem = 20
x = ceil(ifelse((animelem = 18),40,ifelse((animelem = 19),20,2))*const(size.yscale))

[State 3600, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4,3
channel = 0

[State 3600, Snd]
type = playsnd
trigger1 = animelem = 17
value = 4,4
channel = 0

[State 3600, FX]
type = helper
trigger1 = animelem = 21
helpertype = normal
stateno = 1010
ID = 1010
name = "Sonic Boom FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3600, Snd]
type = playsnd
trigger1 = animelem = 21
value = 3200,2

[State 3600, Sonic Blade]
type = helper
trigger1 = animelem = 19
helpertype = normal
stateno = 3205
ID = 3200
name = "Sonic Blade"
postype = p1
pos = 0,-75
size.xscale = .5
size.yscale = .5
supermovetime = 5
ownpal = 1

[State 3600, Anim]
type = changeanim
triggerall = animelemtime(26) >= 0 && animelemtime(27) < 0
trigger1 = numhelper(3200)
trigger1 = helper(3200),stateno = 3205
value = 3200
elem = 24

[State 3600, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==<CROSSFIRE BLITZ>====
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
var(17) = 33

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
pos = ceil(-1 * const(size.xScale)), ceil(-82 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, shadow]
type = playsnd
trigger1 = !time && var(1)
value = 7,5

[State 3200, Vel]
type = velset
trigger1 = animelem = 2
x = 3.5

[State 3200, Vel]
type = velset
trigger1 = animelem = 22
x = 0

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 8 || animelem = 14
value = 4,1
channel = 0

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 20
value = 4,0
channel = 0

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 23
value = 4,4
channel = 0

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 8 || animelem = 14
value = 1,5
channel = 1

[State 3200, Snd]
type = playsnd
trigger1 = animelem = 20 || animelem = 23
value = 1,2
channel = 1

[State 3200, FX]
type = helper
trigger1 = !numhelper(1010) && animelem = 23
helpertype = normal
stateno = 1010
ID = 1010
name = "Sonic Boom FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3300, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 9 || animelem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
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
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := ceil(ifelse((animelem=15),-64,-86)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 4 || animelem = 20
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
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
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 180), var(36) := ceil(ifelse((animelem=20),-68,-32)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 24
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 15
getPower = 0,0
givePower = 36, 36
pauseTime = 11,12
guard.pauseTime = 11,12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 16
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 180), var(36) := -75
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3200, Type]
type = statetypeset
trigger1 = animelemtime(26) >= 0
movetype = I

[State 3200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;====<MAX CROSSFIRE BLITZ>=
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
var(17) = 45

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
trigger1 = AnimElemTime(6) < 0
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
pos = ceil(-1 * const(size.xScale)), ceil(-82 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 55
moveTime = 55
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3300, Snd]
type = playsnd
trigger1 = time = 4
value = 4,3
channel = 0

[State 3300, Vel]
type = velmul
trigger1 = animelemtime(4) >= 0
x = .9

[State 3300, Vel]
type = velset
trigger1 = animelem = 4
x = 18

[State 3300, Vel]
type = velset
trigger1 = animelem = 9
x = 0

[State 3300, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1100,1

[State 3300, Dust]
type = explod
trigger1 = animelem = 4
anim = 8103
sprpriority = 3
postype = p1
pos = 0,ceil(pos y)
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 1
trigger1 = animelem = 4
ID = 3350
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
getPower = 0,0
givePower = 36, 36
pausetime = 10,10
guard.pausetime = 10,10
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 16
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3300, p1state]
type = changestate
trigger1 = animelemtime(4) >= 0
trigger1 = movehit || movereversed
value = 3351

[State 3300, blocked]
type = changeanim
trigger1 = animelemtime(4) >= 0 && animelemtime(7) < 0
trigger1 = moveguarded
value = 3350
elem = 7

[State 3300, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State 3300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;-----CONNECTED-----
[Statedef 3351]
type = S
physics = N
movetype = A
anim = 3351
ctrl = 0
velset = 0,0
sprpriority = 1

[State 3301, p2state]
type = targetstate
trigger1 = !time && numtarget(3350)
value = 3352
ID = 3350

[State 3301, Bind]
type = targetbind
trigger1 = !time && numtarget(3350)
pos = 64,0
ID = 3350

[State 3301, Vel]
type=velset
trigger1= animelem=1
x = 4

[State 3301, Vel]
type = velset
trigger1 = animelem = 27
x = 0

[State 3301, Vel]
type = velset
trigger1 = animelem = 31
x = 4.5
y = -6

[State 3100, grav]
type = veladd
trigger1 = animelemtime(31) >= 0
y = .5

[State 3100, Type]
type = statetypeset
trigger1 = animelemtime(31) >= 0
statetype = A

[State 3301, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 4 || animelem = 7
trigger2 = animelem = 12 || animelem = 18 || animelem = 21
value = 4,(random%4)
channel = 0

[State 3301, Snd]
type = playsnd
trigger1 = animelem = 27
value = 4,5
channel = 0

[State 3301, Snd]
type = playsnd
trigger1 = animelem = 32
value = 4,4
channel = 0

[State 3301, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 4 || animelem = 18 || animelem = 21 || animelem = 27
value = 1,2
channel = 1

[State 3301, Snd]
type = playsnd
trigger1 = animelem = 7 || animelem = 12 || animelem = 32
value = 1,5
channel = 1

[State 3301, Snd]
type = playsnd
trigger1 = animelem = 25
value = 100,0

[State 3301, Dust]
type = explod
trigger1 = animelem = 25
anim = 8103
sprpriority = 3
postype = p1
pos = 0,ceil(pos y)
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3301, Snd]
type = playsnd
trigger1 = animelem = 31
value = 40,0

[State 3301, Dust]
type = helper
trigger1 = animelem = 31
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3350, HitDef 1]
type = HitDef
triggerAll = !var(16) && var(15) < 3
trigger1 = animelem = 2 || animelem = 5 || animelem = 18 || animelem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animType = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 0
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 180), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 3350, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = animelem = 8 || animelem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 6,12
guard.pauseTime = 6,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -6.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 180), var(36) := -50
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 3350, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = animelem = 27
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 8,12
guard.pausetime = 8,12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
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
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 180), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
Kill = 0

[State 3350, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = animelem = 32
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 25 < 7, 7, fvar(11) * 25)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
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
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 180), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3301, Type]
type = statetypeset
trigger1 = animelemtime(33) >= 0
movetype = I

[State 3301, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 3353

;-----TARGET-----
[Statedef 3352]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0,0

[State 3302, Pos]
type = posset
trigger1 = 1
y = 0

[State 3302, fall]
type = hitfallset
trigger1 = 1
value = 0

[State 3302, End]
type = selfstate
trigger1 = 1
value = 5000

;---LAND---
[Statedef 3353]
type = S
physics = S
ctrl = 0
anim = 3353
velset = 0,0
movehitpersist = 1

[State 3303, Pos]
type = posset
trigger1 = 1
y = 0

[State 3303, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 3303, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3303, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==<REVERSED SOMMERSAULT>====
[StateDef 3500]
type = S
physics = N
moveType = A
anim = 3500
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
var(17) = 33

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

[State 3500, NotHitBy]
type = NotHitBy
trigger1= animelemtime(4) < 0
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
pos = ceil(10 * const(size.xScale)), ceil(-82 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3500, grav]
type = velmul
trigger1 = animelemtime(18) < 0
x = .9
y = .9

[State 3500, grav]
type = veladd
trigger1 = animelemtime(18) >= 0
y = .5

[State 3500, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
statetype = A

[State 3500, Vel]
type = velset
trigger1 = animelem = 6
x = 12
y = -12

[State 3500, Vel]
type = velset
trigger1 = vel y > 0
x = 0

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 12
value = 4,ifelse((animelem = 12),2,0)
channel = 0

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 12
value = 3500,0
freqmul = ifelse((animelem = 5),1.1,1)

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 6
value = 41,0

[State 3500, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3500, FX]
type = helper
trigger1 = !numhelper(1105)
trigger1 = animelem = 5 || animelem = 12
helpertype = normal
stateno = 1105
ID = 1105
name = "Sommersault FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3500, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = 0,0
givePower = 36, 36
pausetime = 4,4
guard.pausetime = 4,4
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -10
guard.velocity = -6.52
air.velocity = -3, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := ceil(ifelse((animelem=6 || animelem=14),-60,-30)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 6 || animelem = 12 || animelem = 14
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = 0,0
givePower = 36, 36
pausetime = 4,4
guard.pausetime = 4,4
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -10
guard.velocity = -6.52
air.velocity = -3, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := ceil(ifelse((animelem=6 || animelem=14),-60,-30)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 7 || animelem = 15
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 15
getPower = 0,0
givePower = 36, 36
pausetime = 4,4
guard.pausetime = 4,4
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -10
guard.velocity = -8.52
air.velocity = -3, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := ceil(-90*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, Type]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I

[State 3500, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 3501

;---LAND---
[Statedef 3501]
type = S
physics = S
ctrl = 0
anim = 3501
velset = 0,0
movehitpersist = 1

[State 3503, Pos]
type = posset
trigger1 = 1
y = 0

[State 3503, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 3503, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3503, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1

;====<MAX REVERSED SOMMERSAULT>=
[StateDef 3550]
type = S
physics = N
moveType = A
anim = 3500
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

[State 3550, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
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
pos = ceil(10 * const(size.xScale)), ceil(-82 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3500, grav]
type = velmul
trigger1 = animelemtime(18) < 0
x = .9
y = .9

[State 3500, grav]
type = veladd
trigger1 = animelemtime(18) >= 0
y = .5

[State 3500, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
statetype = A

[State 3500, Vel]
type = velset
trigger1= animelem = 6
x = 12
y = -12

[State 3500, Vel]
type = velset
trigger1 = vel y > 0
x = 0

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 12
value = 4,ifelse((animelem = 12),2,0)
channel = 0

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 5 || animelem = 12
value = 3500,0
freqmul = ifelse((animelem = 5),1.1,1)

[State 3500, Snd]
type = playsnd
trigger1 = animelem = 6
value = 41,0

[State 3500, Dust]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3500, FX]
type = helper
trigger1 = !numhelper(1105)
trigger1 = animelem = 5 || animelem = 12
helpertype = normal
stateno = 1105
ID = 1105
name = "Sommersault FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3500, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = 0,0
givePower = 36, 36
pausetime = 6,5
guard.pausetime = 6,5
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -10
guard.velocity = -6.52
air.velocity = -3, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := ceil(ifelse((animelem=6 || animelem=14),-60,-30)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 6 || animelem = 12 || animelem = 14
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = 0,0
givePower = 36, 36
pausetime = 6,5
guard.pausetime = 6,5
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -10
guard.velocity = -6.52
air.velocity = -3, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := ceil(ifelse((animelem=6 || animelem=14),-60,-30)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 7 || animelem = 15
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 15
getPower = 0,0
givePower = 36, 36
pausetime = 6,5
guard.pausetime = 6,5
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -6
guard.velocity = -6.52
air.velocity = -3, -4
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.6
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := ceil(-90*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3500, Type]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I

[State 3500, End]
type = changestate
trigger1 = animelemtime(17) >= 0
value = 3552

[State 3500, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 3551

;---LAND---
[Statedef 3551]
type = S
physics = S
ctrl = 0
anim = 3501
velset = 0,0
movehitpersist = 1

[State 3503, Pos]
type = posset
trigger1 = 1
y = 0

[State 3503, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 3503, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3503, End]
type = changestate
trigger1 = !animtime
value = 3552
ctrl = 0

;==<MOONSAULT SLASH>=
[Statedef 3552]
type = A
physics = N
movetype = A
anim = 1230
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0

[State 3504, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 3504, grav]
type = veladd
trigger1 = animelemtime(4) >= 0
y = ifelse(vel y >= 10,.5,1)

[State 3504, Vel]
type = velset
trigger1 = animelem = 4
x = 10

[State 3504, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4,4
channel = 0

[State 3504, Snd]
type = playsnd
trigger1 = animelem = 5
value = 3500,0

[State 3504, FX]
type = helper
trigger1 = prevstateno != 3100
trigger1 = animelem = 5
helpertype = normal
stateno = 1205
ID = 1205
name = "Moonsault FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3504, FX]
type = helper
trigger1 = prevstateno = 3100
trigger1 = animelem = 5
helpertype = normal
stateno = 1205
ID = 1205
name = "Moonsault FX"
postype = p1
size.xscale = .6*const(size.xscale)
size.yscale = .6*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3504, Hit]
type = hitdef
triggerall = hitcount < 4
trigger1 = (animelem = 3||animelem = 4) && movehit = 0
trigger2 = (animelem = 5||animelem = 6)
trigger3 = (animelem >= 7)
ID = 1230
attr = A, HA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 20 < 7, 7, fvar(11) * 20)), 15
getpower = 0,0
givepower = 36,36
pausetime = 8,8
guard.pausetime = 8,12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 17
guard.hittime = 18
air.hittime = 18
ground.velocity = -6, 8
guard.velocity = -6.52
air.velocity = -6, 8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .6
fall = 1
fall.recover = 0
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -30
envshake.time = 12
envshake.ampl = 5
fall.envshake.time = 12
fall.envshake.ampl = 6
palfx.time = 32*Var(9)
palfx.add = -104,-104,-100
palfx.mul = 256,256,256
palfx.sinadd = 56,56,0,10
palfx.invertall = 0
palfx.color = 256
forcestand = 1

[State 3504, statetype]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I

[State 3504, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 3501

;==<MOONSAULT STRIKE>====
[StateDef 3600]
type = A
physics = N
moveType = A
anim = 3600
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
var(17) = 33

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

[State 3600, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(6) < 0
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
pos = ceil(-6 * const(size.xScale)), ceil(-94 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3700, Vel]
type = velset
trigger1 = animelemtime(14) < 0
x = 0
y = 0

[State 3700, grav]
type = veladd
trigger1 = animelemtime(14) >= 0
y = ifelse(vel y >= 10,.5,1)

[State 3700, Vel]
type = velset
trigger1 = animelem = 14
x = 6

[State 3700, Snd]
type = playsnd
trigger1 = animelem = 7 || animelem = 13
value = 4,ifelse((animelem = 13),4,6)
channel = 0

[State 3700, Snd]
type = playsnd
trigger1 = animelem = 7 || animelem = 15
value = 3500,0
freqmul = ifelse((animelem = 15),1.1,1)

[State 3700, Sommersault Shell]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 3605
ID = 3600
name = "Sommersault Shell"
postype = p1
pos = ceil(64*const(size.xscale)),ceil(-24*const(size.yscale))
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
ownpal = 1

[State 3700, FX]
type = helper
trigger1 = !numhelper(1205)
trigger1 = animelem = 7 || animelem = 15
helpertype = normal
stateno = 1205
ID = 1205
name = "Moonsault FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3300, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 7 || animelem = 9 || animelem = 15
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 10
getPower = 0,0
givePower = 36, 36
pausetime = 6,12
guard.pausetime = 6,12
animType = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := ceil(ifelse((animelem=9),-20,-60)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 17
ID = 3600
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 10
getPower = 0,0
givePower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -8.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3700, p2state]
type = targetstate
trigger1 = movehit && numtarget(3600)
trigger1 = !(target,time) && (target(3600),stateno = [5000,5010])
value = 7070
ID = 3600
ignorehitpause = 1

[State 3700, Type]
type = statetypeset
trigger1 = animelemtime(18) >= 0
movetype = I

[State 3700, End]
type = changestate
trigger1 = animelemtime(16) >= 0
trigger1 = vel y > 0 && pos y >= 0
value = 3601

;---LAND---
[Statedef 3601]
type = S
physics = S
ctrl = 0
anim = 3601
velset = 0,0
movehitpersist = 1

[State 3701, Pos]
type = posset
trigger1 = 1
y = 0

[State 3701, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 3701, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3701, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;====<MAX MOONSAULT STRIKE>=
[StateDef 3650]
type = A
physics = N
moveType = A
anim = 3600
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
var(17) = 33

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

[State 3650, NotHitBy]
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
pos = ceil(-6 * const(size.xScale)), ceil(-94 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3700, Vel]
type = velset
trigger1 = animelemtime(14) < 0
x = 0
y = 0

[State 3700, grav]
type = veladd
trigger1 = animelemtime(14) >= 0
y = ifelse(vel y >= 10,.5,1)

[State 3700, Vel]
type = velset
trigger1 = animelem = 14
x = 6

[State 3700, Snd]
type = playsnd
trigger1 = animelem = 7 || animelem = 13
value = 4,ifelse((animelem = 13),4,6)
channel = 0

[State 3700, Snd]
type = playsnd
trigger1 = animelem = 7 || animelem = 15
value = 3500,0
freqmul = ifelse((animelem = 15),1.1,1)

[State 3700, Sommersault Shell]
type = helper
trigger1 = animelem = 7
helpertype = normal
stateno = 3605
ID = 3600
name = "Sommersault Shell"
postype = p1
pos = ceil(64*const(size.xscale)),ceil(-24*const(size.yscale))
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
ownpal = 1

[State 3700, FX]
type = helper
trigger1 = !numhelper(1205)
trigger1 = animelem = 7 || animelem = 15
helpertype = normal
stateno = 1205
ID = 1205
name = "Moonsault FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3300, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 7 || animelem = 9 || animelem = 15
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 10
getPower = 0,0
givePower = 36, 36
pausetime = 8,12
guard.pausetime = 8,12
animType = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hitTime = 25
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := ceil(ifelse((animelem=9),-20,-60)*const(size.yscale))
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3300, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 17
ID = 3600
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 10
getPower = 0,0
givePower = 36, 36
pausetime = 8,12
guard.pausetime = 8,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hitTime = 25
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -2, -8
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -20
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3700, Type]
type = statetypeset
trigger1 = animelemtime(18) >= 0
movetype = I

[State 3700, End]
type = changestate
trigger1 = animelemtime(16) >= 0
trigger1 = vel y > 0 && pos y >= 0
value = 3651

;---LAND---
[Statedef 3651]
type = S
physics = S
ctrl = 0
anim = 3601
velset = 0,0
movehitpersist = 1

[State 3701, Pos]
type = posset
trigger1 = 1
y = 0

[State 3701, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 3701, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = .5,.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3701, End]
type = changestate
trigger1 = !animtime
value = 3620

;==<SOMMERSAULT SHELL>=
[Statedef 3620]
type = A
physics = N
movetype = A
anim = 1130
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 3720, Button]
type = varset
trigger1 = var(10) != 3
var(10) = 3

[State 3720, ECreset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 3720, nothitby]
type = nothitby
trigger1 = time <= 6
value = SCA
time = 1
ignorehitpause = 1

[State 3720, grav]
type = veladd
trigger1 = animelemtime(4) >= 0
y = .8

[State 3720, Vel]
type = velset
trigger1 = animelem = 4
x = 3
y = -13

[State 3720, Snd]
type = playsnd
trigger1 = !var(1)
trigger1 = animelem = 3
value = 1100,0
channel = 0

[State 3720, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3500,0

[State 3720, Snd]
type = playsnd
trigger1 = animelem = 4
value = 40,0

[State 3720, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3720, Sommersault Shell]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 1125
ID = 1130
name = "Sommersault Shell"
postype = p1
pos = ceil(86*const(size.xscale)),ceil(-115*const(size.yscale))
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
ownpal = 1

[State 3720, FX]
type = helper
trigger1 = !numhelper(1105) && animelem = 3
helpertype = normal
stateno = 1105
ID = 1105
name = "Sommersault FX"
postype = p1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 3720, Hit]
type = hitdef
triggerall = hitcount < 3
trigger1 = animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 24 < 7, 7, fvar(11) * 24)), 10
getpower = 0,0
givepower = 15,15
pausetime = 8,12
guard.pausetime = 8,12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 17
guard.hittime = 18
air.hittime = 18
ground.velocity = -2.5, -8
guard.velocity = -4.52
air.velocity = -2.5, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .6
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -30
envshake.time = 12
envshake.ampl =5
fall.envshake.time = 12
fall.envshake.ampl = 6
forcestand = 1
palfx.time = 22*var(1)
palfx.add = -104,-104,-100
palfx.mul = 256,256,256
palfx.sinadd = 56,56,0,10
palfx.invertall = 0
palfx.color = 256

[State 3720, Hit]
type = hitdef
trigger1 = animelem = 4
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 10
getpower = 0,0
givepower = 36,36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 17
guard.hittime = 18
air.hittime = 18
ground.velocity = -2.5, -9.5
guard.velocity = -4.52
air.velocity = -2.5, -9.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .6
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -30
envshake.time = 12
envshake.ampl =5
fall.envshake.time = 12
fall.envshake.ampl = 6
forcestand = 1
palfx.time = 22*var(1)
palfx.add = -104,-104,-100
palfx.mul = 256,256,256
palfx.sinadd = 56,56,0,10
palfx.invertall = 0
palfx.color = 256

[State 3720, Hit]
type = hitdef
trigger1 = animelem = 6
attr = A, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 10
getpower = 0,0
givepower = 36,36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 17
guard.hittime = 18
air.hittime = 18
ground.velocity = -5, -11.5
guard.velocity = -6.52
air.velocity = -5, -11.5
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = .6
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 146), var(36) := -60
envshake.time = 12
envshake.ampl = 5
fall.envshake.time = 12
fall.envshake.ampl = 6
forcestand = 1
palfx.time = 22*var(1)
palfx.add = -104,-104,-100
palfx.mul = 256,256,256
palfx.sinadd = 56,56,0,10
palfx.invertall = 0
palfx.color = 256

[State 3720, statetype]
type = statetypeset
trigger1 = (anim = [1130,1110]) && animelemtime(6) >= 0
trigger2 = anim = 1120 && animelemtime(8) >= 0
movetype = I

[State 3720, End]
type = changestate
trigger1 = vel y > 0 && pos y >= 0
value = 3501
