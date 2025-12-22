; _________________________________________
;| B. B. Hood by varo_hades                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<APPLE FOR YOU>=
[StateDef 3000]
type = S
physics = N
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
trigger1 = animelem = 1
value = sca
ignorehitpause = 1

[State 3000, SuperPause FX]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(32 * const(size.xScale)), ceil(-60 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000]
type = PlaySnd
trigger1 = animelem = 2
value = 3000,0
channel = 0
volume = 200

[State 3000]
type = PlaySnd
trigger1 = animelem = 5
value = 810,1
channel = 0
volume = 200

[State 3000, THIS ISN'T A BOMB, IT'S AN APPLE]
type = Explod
trigger1 = animelem =2
anim = 3002
pos = 0, 0
ontop = 1
ownpal = 1
removeongethit=1
ignorehitpause = 0
bindtime = -1
scale=Const(size.xscale),1
ID = 3000

[State 3000, 1]
type = HitDef
Triggerall = (p2stateno != [120, 155]) || p2movetype != h
Trigger1 = Time = 0
attr = S, HT
hitflag = M-
priority = 1, Miss
sparkno = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3001
p2stateno = 3002
guard.dist = 0
getpower = 0
givepower = 0,0
fall = 1
ID = 3000

[State 3000, 10]
type = ChangeState
Trigger1 = !animtime
value = 0
ctrl = 1

;Apple For You (Success)
[Statedef 3001]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
sprpriority = 2
poweradd = 0
juggle = 10
anim = 3001

[State 3001]
type = PlaySnd
Trigger1 = time = 15
value = 3000,1
loop = 1
channel = 16

[State 3001]
type = StopSnd
Trigger1 = time = 62
channel = 16

[State 3001, THIS ISN'T A BOMB, IT'S AN APPLE]
type = Explod
trigger1 = animelem = 1
anim = 3003
pos = Const(size.mid.pos.x),Const(size.mid.pos.y)-10
ontop = 1
ownpal = 1
postype = p2
ignorehitpause = 0
bindtime = -1
scale = Const(size.xscale),1

[State 1006, HitSound]
type = PlaySnd
trigger1 = Time = 62
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = Time = 62
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = 10,-54
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3001, remove fx]
type = RemoveExplod
trigger1 = 1
ID = 3000

[State 3001, go]
type = VelSet
trigger1 = animelem = 2
x = -5

[State 3001, go]
type = VelSet
trigger1 = animelem = 13
x = 0

[State 3001, 10]
type = ChangeState
Trigger1 = !animtime
value = 0
ctrl = 1

[StateDef 3002]
Type = S
MoveType = H
Ctrl = 0
velset = 0,0
physics = S

[State 3002, Anim]
Type = ChangeAnim2
Trigger1 = !Time
Value = 3005

[State 3002, 10]
type = ChangeState
Trigger1 = time = 63
value = 3003

[StateDef 3003]
Type = S
MoveType = H
Ctrl = 0
velset = 0,0
physics = N

[State -2, EXFlash]
type = palfx
trigger1 = 1
time =  30
add = 220,100,90
mul = 150,120,100
SinAdd = 130,100,90,8
color = 0
ignorehitpause = 1

[State 3003, Damage]
Type = LifeAdd
trigger1 = time = 0
value = -250

[State 3003, Vel Y]
type = VelSet
trigger1 = !Time
y = -6.8
x = -5

[State 3003, Gravity]
type = VelAdd
trigger1 = 1
y = .5

[State 3003, Anim 5050]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050

[State 3003, Anim 5052]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 3003, Anim 5060]
type = ChangeAnim
triggerall = time > 15
trigger1 = Anim = 5050
trigger1 = SelfAnimExist(5060)
persistent = 0
value = 5060

[State 3003, Anim 5062]
type = ChangeAnim
triggerall = time > 15
trigger1 = Anim = 5052
trigger1 = SelfAnimExist(5062)
persistent = 0
value = 5062

[State 3003, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;====<MAX APPLE FOR YOU>=
[StateDef 3050]
type = S
physics = N
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
trigger1 = animelem = 1
value = sca
ignorehitpause = 1

[State 3050, SuperPause FX]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(32 * const(size.xScale)), ceil(-60 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3050, SuperPause]
type = SuperPause
trigger1 = Time = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050]
type = PlaySnd
trigger1 = animelem = 2
value = 3000,0
channel = 0
volume = 200

[State 3050]
type = PlaySnd
trigger1 = animelem = 5
value = 810,1
channel = 0
volume = 200

[State 3050, THIS ISN'T A BOMB, IT'S AN APPLE]
type = Explod
trigger1 = animelem =2
anim = 3002
pos = 0, 0
ontop = 1
ownpal = 1
removeongethit=1
ignorehitpause = 0
bindtime = -1
scale = Const(size.xscale),1
ID = 3000

[State 3050, 1]
type = HitDef
Triggerall = (p2stateno != [120, 155]) || p2movetype != h
Trigger1 = Time = 0
attr = S, HT
hitflag = M-
priority = 1, Miss
sparkno = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 3051
p2stateno = 3052
guard.dist = 0
getpower = 0
givepower = 0,0
fall = 1
ID = 3000

[State 3050, 10]
type = ChangeState
Trigger1 = !animtime
value = 0
ctrl = 1

;Apple For You (Success)
[Statedef 3051]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
sprpriority = 2
poweradd = 0
juggle = 10
anim = 3001

[State 3051]
type = PlaySnd
Trigger1 = time = 15
value = 3000,1
loop = 1
channel = 16

[State 3051]
type = StopSnd
Trigger1 = time = 62
channel = 16

[State 3051, THIS ISN'T A BOMB, IT'S AN APPLE]
type = Explod
trigger1 = animelem = 1
anim = 3003
pos = Const(size.mid.pos.x),Const(size.mid.pos.y)-10
ontop = 1
ownpal = 1
postype = p2
ignorehitpause = 0
bindtime = -1
scale = Const(size.xscale)*1.2,1.2

[State 1006, HitSound]
type = PlaySnd
trigger1 = Time = 62
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 3
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = Time = 62
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = 10,-54
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3051, remove fx]
type = RemoveExplod
trigger1 = 1
ID = 3000

[State 3051, go]
type = VelSet
trigger1 = animelem = 2
x = -5

[State 3051, go]
type = VelSet
trigger1 = animelem = 13
x = 0

[State 3051, 10]
type = ChangeState
Trigger1 = !animtime
value = 0
ctrl = 1

[StateDef 3052]
Type = S
MoveType = H
Ctrl = 0
velset = 0,0
physics = S

[State 3052, Anim]
Type = ChangeAnim2
Trigger1 = !Time
Value = 3005

[State 3052, 10]
type = ChangeState
Trigger1 = time = 63
value = 3053

[StateDef 3053]
Type = S
MoveType = H
Ctrl = 0
velset = 0,0
physics = N

[State -2, EXFlash]
type = palfx
trigger1 = 1
time =  30
add = 220,100,90
mul = 150,120,100
SinAdd = 130,100,90,8
color = 0
ignorehitpause = 1

[State 3053, Damage]
Type = LifeAdd
trigger1 = time = 0
value = -350

[State 3053, Vel Y]
type = VelSet
trigger1 = !Time
y = -6.8
x = -5

[State 3053, Gravity]
type = VelAdd
trigger1 = 1
y = .5

[State 3053, Anim 5050]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050

[State 3053, Anim 5052]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 3053, Anim 5060]
type = ChangeAnim
triggerall = time > 15
trigger1 = Anim = 5050
trigger1 = SelfAnimExist(5060)
persistent = 0
value = 5060

[State 3053, Anim 5062]
type = ChangeAnim
triggerall = time > 15
trigger1 = Anim = 5052
trigger1 = SelfAnimExist(5062)
persistent = 0
value = 5062

[State 3053, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;====<COOL HUNTING>=
[StateDef 3100]
type = S
physics = S
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
trigger1 = animelem = 1
value = sca
ignorehitpause = 1

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 1
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(1 * const(size.xScale)), ceil(-51 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3100, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100]
type = PlaySnd
trigger1 = animelem = 4
value = 3100,0
channel = 0
volume = 200

[State 3100]
type = helper
trigger1 = animelemtime(3) = 1
helpertype = normal
stateno = 3105
ID = 3105
name = "Hunters"
postype = p1
pos = 0,0
ownpal = 1
sprpriority = -1
supermovetime = 0
pausemovetime = 0
keyctrl = 0

[State 3100, 10]
type = ChangeState
Trigger1 = !animtime
value = 3102

[Statedef 3102]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
ownpal = 1
sprpriority = 2
poweradd = 0
juggle = 0
anim = 3102

[State 3102, 1]
type = PlaySnd
trigger1 = animelem =2
trigger2 = animelem =4
trigger3 = animelem =6
trigger4 = animelem =8
trigger5 = animelem =10
trigger6 = animelem =12
trigger7 = animelem =14
trigger8 = animelem =16
trigger9 = animelem =18
trigger10 = animelem =20
trigger11 = animelem =22
trigger12 = animelem =24
trigger13 = animelem =26
trigger14 = animelem =28
trigger15 = animelem =30
trigger16 = animelem =32
trigger17 = animelem =34
trigger18 = animelem =36
trigger19 = animelem =38
trigger20 = animelem =40
trigger21 = animelem =42
trigger22 = animelem =44
trigger23 = animelem =46
trigger24 = animelem =48
trigger25 = animelem =50
trigger26 = animelem =52
ignorehitpause=1
value = 1, 6

[State 3102, Flash]
type = Explod
trigger1 = animelem =2
trigger2 = animelem =4
trigger3 = animelem =6
trigger4 = animelem =8
trigger5 = animelem =10
trigger6 = animelem =12
trigger7 = animelem =14
trigger8 = animelem =16
trigger9 = animelem =18
trigger10 = animelem =20
trigger11 = animelem =22
trigger12 = animelem =24
trigger13 = animelem =26
trigger14 = animelem =28
trigger15 = animelem =30
trigger16 = animelem =32
trigger17 = animelem =34
trigger18 = animelem =36
trigger19 = animelem =38
trigger20 = animelem =40
trigger21 = animelem =42
trigger22 = animelem =44
trigger23 = animelem =46
trigger24 = animelem =48
trigger25 = animelem =50
trigger26 = animelem =52
anim = 221
pos = 54, -62
ontop = 1
ownpal = 1
removeongethit=1
ignorehitpause = 0
bindtime = -1
scale=0.5,0.5

[State 3102, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 30
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 6
trigger4 = animelem = 8
trigger5 = animelem = 10
trigger6 = animelem = 12
trigger7 = animelem = 14
trigger8 = animelem = 16
trigger9 = animelem = 18
trigger10 = animelem = 20
trigger11 = animelem = 22
trigger12 = animelem = 24
trigger13 = animelem = 26
trigger14 = animelem = 28
trigger15 = animelem = 30
trigger16 = animelem = 32
trigger17 = animelem = 34
trigger18 = animelem = 36
trigger19 = animelem = 38
trigger20 = animelem = 40
trigger21 = animelem = 42
trigger22 = animelem = 44
trigger23 = animelem = 46
trigger24 = animelem = 48
trigger25 = animelem = 50
trigger26 = animelem = 52
attr = S, HA
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 7
animtype = Hard
air.animtype = up
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pauseTime = 2,2
guard.pauseTime = 2,2
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -64
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3.8 ,-6.8
guard.velocity = -6
airguard.velocity = -11,-3
air.type = high
air.velocity = -3.8 ,-6.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getpower = 0
givepower = 0,0
yaccel = .5
p2facing = 0
fall = 1
fall.recovertime = 60
ID = 3100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48


[State 3102, 10]
type = ChangeState
Trigger1 = !animtime
value = 0
ctrl = 1

;====<MAX COOL HUNTING>=
[StateDef 3150]
type = S
physics = S
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
trigger1 = animelem = 1
value = sca
ignorehitpause = 1

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 1
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(1 * const(size.xScale)), ceil(-51 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150]
type = PlaySnd
trigger1 = animelem = 4
value = 3100,0
channel = 0
volume = 200

[State 3150]
type = helper
trigger1 = animelemtime(3) = 1
helpertype = normal
stateno = 3155
ID = 3155
name = "Hunters"
postype = p1
pos = 0,0
ownpal = 1
sprpriority = -1
supermovetime = 0
pausemovetime = 0
keyctrl = 0

[State 3150, 10]
type = ChangeState
Trigger1 = !animtime
value = 3152

[Statedef 3152]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
ownpal = 1
sprpriority = 2
poweradd = 0
juggle = 0
anim = 3102

[State 3152, 1]
type = PlaySnd
trigger1 = animelem =2
trigger2 = animelem =4
trigger3 = animelem =6
trigger4 = animelem =8
trigger5 = animelem =10
trigger6 = animelem =12
trigger7 = animelem =14
trigger8 = animelem =16
trigger9 = animelem =18
trigger10 = animelem =20
trigger11 = animelem =22
trigger12 = animelem =24
trigger13 = animelem =26
trigger14 = animelem =28
trigger15 = animelem =30
trigger16 = animelem =32
trigger17 = animelem =34
trigger18 = animelem =36
trigger19 = animelem =38
trigger20 = animelem =40
trigger21 = animelem =42
trigger22 = animelem =44
trigger23 = animelem =46
trigger24 = animelem =48
trigger25 = animelem =50
trigger26 = animelem =52
ignorehitpause=1
value = 1, 6

[State 3152, Flash]
type = Explod
trigger1 = animelem =2
trigger2 = animelem =4
trigger3 = animelem =6
trigger4 = animelem =8
trigger5 = animelem =10
trigger6 = animelem =12
trigger7 = animelem =14
trigger8 = animelem =16
trigger9 = animelem =18
trigger10 = animelem =20
trigger11 = animelem =22
trigger12 = animelem =24
trigger13 = animelem =26
trigger14 = animelem =28
trigger15 = animelem =30
trigger16 = animelem =32
trigger17 = animelem =34
trigger18 = animelem =36
trigger19 = animelem =38
trigger20 = animelem =40
trigger21 = animelem =42
trigger22 = animelem =44
trigger23 = animelem =46
trigger24 = animelem =48
trigger25 = animelem =50
trigger26 = animelem =52
anim = 221
pos = 54, -62
ontop = 1
ownpal = 1
removeongethit=1
ignorehitpause = 0
bindtime = -1
scale=0.5,0.5

[State 3152, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 30
trigger1 = animelem = 2
trigger2 = animelem = 4
trigger3 = animelem = 6
trigger4 = animelem = 8
trigger5 = animelem = 10
trigger6 = animelem = 12
trigger7 = animelem = 14
trigger8 = animelem = 16
trigger9 = animelem = 18
trigger10 = animelem = 20
trigger11 = animelem = 22
trigger12 = animelem = 24
trigger13 = animelem = 26
trigger14 = animelem = 28
trigger15 = animelem = 30
trigger16 = animelem = 32
trigger17 = animelem = 34
trigger18 = animelem = 36
trigger19 = animelem = 38
trigger20 = animelem = 40
trigger21 = animelem = 42
trigger22 = animelem = 44
trigger23 = animelem = 46
trigger24 = animelem = 48
trigger25 = animelem = 50
trigger26 = animelem = 52
attr = S, HA
damage = ceil(ifElse(fvar(11) * 10 < 7, 7, fvar(11) * 10)), 7
animtype = Hard
air.animtype = up
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pauseTime = 2,2
guard.pauseTime = 2,2
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 257), var(36) := -64
ground.type = High
ground.slidetime = 9
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3.8 ,-6.8
guard.velocity = -6
airguard.velocity = -11,-3
air.type = high
air.velocity = -3.8 ,-6.8
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getpower = 0
givepower = 0,0
yaccel = .5
p2facing = 0
fall = 1
fall.recovertime = 60
ID = 3150
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48


[State 3152, 10]
type = ChangeState
Trigger1 = !animtime
value = 0
ctrl = 1

;====<BEAUTIFUL MEMORY>=
[StateDef 3200]
type = S
physics = N
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
trigger1 = animelem = 1
value = sca
ignorehitpause = 1

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 1
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(2 * const(size.xScale)), ceil(-52 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Granny]
type = Explod
trigger1 = animelem = 5
anim = 3209
pos = 0, 0
ontop = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
scale = Const(size.xscale),1

[State 3200]
type = PlaySnd
trigger1 = animelem = 1
value = 3200,0
channel = 0
volume = 200

[State 3200, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
trigger2 = animelem = 5
attr = S, NA
damage = ceil(ifElse(fvar(11) * 43 < 7, 7, fvar(11) * 43)), 7
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MA
priority = 4, Hit
pauseTime = 4,4
guard.pauseTime = 4,4
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -67
ground.type = High
ground.slidetime = 13
ground.hittime = 13
ground.velocity = 0
guard.velocity = -6.8
guard.ctrltime = 13
air.type = high
air.velocity = -4,-5.25
airguard.velocity = -5.33,-1
air.hittime = 13
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getpower = 0
givepower = 0,0
yaccel = .5
air.fall = 0
p2facing = 1
snap = 10
id = 3200
kill = 0
p1stateno = 3204
p2stateno = 3210
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48


[State 3200, 6]
type = VelSet
trigger1 = animelem = 5
x = 7.9375

[State 3200, 6]
type = VelMul
trigger1= animelemtime(5) > 0
x = 0.99212598425196850393700787401575

[State 3200, 6]
type = VelSet
trigger1 = time = 73
x = 0

[State 3200]
type = ChangeState
trigger1 = time < 73
trigger1 = moveguarded
value = 3203

[State 3200]
type = ChangeState
trigger1 = time = 73
trigger1 = Vel X = 0
value = 3202

[Statedef 3202]
type = S
movetype = I
physics = S
ctrl = 0
velset = 0, 0
ownpal = 1
sprpriority = 2
poweradd = 0
anim = 3202

[State 3202]
type = PlaySnd
trigger1 = animelem = 3
value = 810,1

[State 3202, 10]
type = ChangeState
Trigger1 = !animtime
value = 0
ctrl = 1

;Guarded
[Statedef 3203]
type = A
movetype = I
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
sprpriority = 2
poweradd = 0
anim = 3203

[State 3203, go]
type = VelSet
trigger1 = !time
x = -3
y = -7

[State 3203, go]
type = VelMul
trigger1 = time > 0
x = 1

[State 3203, go]
type = VelAdd
trigger1 = time > 0
y = .5

[State 3203, 10]
type = ChangeState
Trigger1 = vel y > 0 && pos y >= 0
value = 277
ctrl = 1

;Beautiful Memory (Success)
[Statedef 3204]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
sprpriority = 2
poweradd = 0
juggle = 10
anim = 3204

[State 3204]
type = PlaySnd
trigger1 = animelem = 10
value = 3200,1
channel = 0
volume = 200

[State 3204, Tears]
type = Explod
trigger1 = animelem = 1
anim = 3208
pos = 0, 0
ontop = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 0
bindtime= -1
scale = Const(size.xscale),1

[State 3204, Width]
type = Width
trigger1 = 1
edge = 30

[State 3204, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 3
trigger2 = animelem = 6
attr = S, HA
damage = ceil(ifElse(fvar(11) * 43 < 7, 7, fvar(11) * 43)), 7
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MA
priority = 4, Hit
pauseTime = 4,4
guard.pauseTime = 4,4
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 13
ground.hittime = 13
ground.velocity = 0
guard.velocity = -6.8
guard.ctrltime = 13
air.type = high
air.velocity = -4,-5.25
airguard.velocity = -5.33,-1
air.hittime = 13
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getpower = 0
givepower = 0,0
yaccel = .5
air.fall = 0
p2facing = 1
id = 3205
kill = 0
p2stateno = 3210
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48


[State 3204, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 = AnimElem = 9
attr = S, HA
damage = ceil(ifElse(fvar(11) * 43 < 7, 7, fvar(11) * 43)), 7
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MA
priority = 4, Hit
pauseTime = 4,4
guard.pauseTime = 4,4
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -75
ground.type = High
ground.slidetime = 13
ground.hittime = 13
ground.velocity = 0
guard.velocity = -6.8
guard.ctrltime = 13
air.type = high
air.velocity = -4,-5.25
airguard.velocity = -5.33,-1
air.hittime = 13
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
getpower = 0
givepower = 0,0
yaccel = .5
air.fall = 0
p2facing = 1
id = 3205
kill = 0
p2stateno = 3211
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48


[State 3204, 6]
type = VelSet
trigger1 = animelem = 1
x = 1

[State 3204, 6]
type = VelMul
trigger1= animelemtime(1) > 0
x = 1

[State 3204]
type = ChangeState
trigger1 = !animtime
value = 3205

;Beautiful Memory (Grab Part)
[Statedef 3205]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
sprpriority = 2
anim = 3205

[State 3205, Flash]
type = Explod
trigger1 = animelem = 1
anim = 3207
pos = 0, 0
ontop = 1
ownpal = 1
removeongethit = 1
ignorehitpause = 0
scale = Const(size.xscale),1

[State 3205, 1]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 12
trigger3 = animelem = 19
value = 2, 2

[State 3205, Damage]
Type = TargetLifeAdd
trigger1 = animelem = 5
trigger2 = animelem = 12
trigger3 = animelem = 19
value = -20
kill = 0
ID = 3205

[State 3205, Damage]
Type = Envshake
trigger1 = animelem = 5
trigger2 = animelem = 12
trigger3 = animelem = 19
envshake.time = 10
envshake.ampl = 3
time = 10
ampl = 3

[State 3205, plus 3]
type = HitAdd
trigger1 = animelem = 5
trigger2 = animelem = 12
trigger3 = animelem = 19
value = 1

[State 1006, HitSpark]
type = Helper
trigger1 = animelem = 5
trigger2 = animelem = 12
trigger3 = animelem = 19
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = 40, -56
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3205, fly p2]
type = TargetState
trigger1 = time = 0
trigger1 = animelem = 1
value = 3212
ID = 3205

[State 3205, stay on the ground]
type = TargetBind
trigger1 = time = 0
trigger1 = (animelemno(0) = [1, 22])
ID = 3205
pos = 26, 0

[State 3205, bind]
type = TargetBind
trigger1 = animelemtime(23) >= 0 && animelemtime(24) < 0
ID = 3205
pos = 29, -106

[State 3205, bind]
type = TargetBind
trigger1 = animelemtime(24) >= 0 && animelemtime(26) < 0
ID = 3205
pos = -10, -106

[State 3205, bind]
type = TargetBind
trigger1 = animelemtime(27) >= 0 && animelemtime(28) < 0
ID = 3205
pos = -10, -93

[State 3205, bind]
type = TargetBind
trigger1 = animelemtime(28) >= 0 && animelemtime(29) < 0
ID = 3205
pos = -10, -90

[State 3205]
type = PlaySnd
trigger1 = animelem = 29
value = 1400,1
channel = 0
volume = 200

[State 3205, fly p2]
type = TargetState
trigger1 = animelem = 29
value = 3213
ID = 3205

[State 3205, 1]
type = VelSet
trigger1 = animelem = 27
y = -6

[State 3205, 1]
type = VelAdd
trigger1 = animelemtime(27) > 0
Y = 0.1875

[State 3205, stay]
type = PosFreeze
trigger1 = animelemno(0) = 28
value = 1

[State 3205, 1]
type = VelSet
trigger1 = animelem = 29
x = -3
y = -3

[State 3205, 1]
type = VelAdd
trigger1 = animelemtime(29) > 0
Y = 0.1875

[State 3205, 7]
type = ChangeState
Triggerall = animelemtime(29) > 0
trigger1 = Pos Y + Vel Y >= 0
value = 3206

;Land and Taunt
[Statedef 3206]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0, 0
ownpal = 1
sprpriority = 2
anim = 3206

[State 3206]
type = PlaySnd
trigger1 = time = 7
value = 3200,2
volume = 200

[State 3206]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 9
value = 1600,2

[State 3206]
type = PlaySnd
trigger1 = animelem = 2
value = 1600,1
channel = 0
volume = 200

[State 3206, 0]
type = PosSet
trigger1 = !time
y = 0

[State 3206, 1]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;Player 2
[StateDef 3210]
Type = S
MoveType = H
Ctrl = 0
velset = 0,0
physics = S

[State 3210, Anim]
Type = ChangeAnim
Trigger1 = !Time
Value = 5010

[State 3210, 0]
type = HitBy
trigger1 = 1
value = sca, ha
ignorehitpause = 1

[State 3210, S]
type = StateTypeSet
trigger1 = time = 0
statetype = S

[State 3210, 0]
type = PosSet
trigger1 = !time
y = 0

[State 3210, 6]
type = VelSet
trigger1 = time =0
x = 0

[State 3210, 1]
type = ChangeAnim2
trigger1 = time = 0
trigger1 = Name = "Gill"
trigger1 = Authorname = "GM"
trigger1 = Facing = -1
trigger1 = SelfAnimExist(15010)
value = 15010

[State 3210, 10]
type = SelfState
Trigger1 = time = 200
value = 5100

[StateDef 3211]
Type = S
MoveType = H
Ctrl = 0
velset = 0,0
physics = S

[State 3211, Anim]
Type = ChangeAnim
Trigger1 = !Time
Value = 5010

[State 3211, 0]
type = HitBy
trigger1 = 1
value = sca, ha
ignorehitpause = 1

[State 3211, S]
type = StateTypeSet
trigger1 = time = 0
statetype = S

[State 3211, 0]
type = PosSet
trigger1 = !time
y = 0

[State 3211, 6]
type = VelSet
trigger1 = time =0
x = 0

[State 3211, 1]
type = ChangeAnim2
trigger1 = time=0
trigger1 = Name = "Gill"
trigger1 = Authorname = "GM"
trigger1 = Facing = -1
trigger1 = SelfAnimExist(15010)
value = 15010

[State 3211, 10]
type = SelfState
Trigger1 = time = 200
value = 5100

[StateDef 3212]
Type = S
MoveType = H
Ctrl = 0
velset = 0,0
physics = S

[State 2100, Anim]
Type = ChangeAnim2
Trigger1 = !Time
Value = 3212

[State 2013, 10]
type = SelfState
Trigger1 = time = 500
value = 5100

[StateDef 3213]
Type = S
MoveType = H
Ctrl = 0
velset = -2,8
physics = S

[State 3213, go x]
type = VelAdd
trigger1 = time > 0
y = .5

[State 3213, Anim]
Type = ChangeAnim2
Trigger1 = !Time
Value = 3213

[State 3213, 10]
type = ChangeState
Trigger1 = vel y > 0 && pos y >= 0
value = 3214

[StateDef 3214]
Type = S
MoveType = H
Ctrl = 0
velset = 0,0
physics = S

[State 3214, Anim]
Type = ChangeAnim2
Trigger1 = !Time
Value = 3214

[State 3214, 10]
type = ChangeState
Trigger1 = time = 27
value = 3215

[StateDef 3215]
Type = A
MoveType = H
Ctrl = 0

[State 3215]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 3215, Damage]
Type = LifeAdd
trigger1 = time = 0
value = -200

[State 3215, Anim 5050]
type = ChangeAnim
trigger1 = Time = 0
value = 5050

[State 3215, go x]
type = VelSet
trigger1 = time = 0
x = 0
y = -15.375

[State 3215, go x]
type = VelAdd
trigger1 = time > 0
y = .5

[State 3215, 10]
type = SelfState
Triggerall = time > 5
Trigger1 = vel y > 0 && pos y >= 0
value = 5100
