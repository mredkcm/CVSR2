; _________________________________________
;| Rugal by varo_hades                     |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER STATES>====
;==

;====<GIGANTIC PRESSURE>=
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
trigger1 = AnimElemTime(4) < 0
time = 1
value = SCA

[State 3000, SuperPause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-35 * const(size.xScale)), ceil(-92 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 100, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 3000,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 100, Effect]
type = PlaySnd
triggerall = anim = 3000
trigger1 = AnimElem = 5
trigger2 = AnimElem = 9
trigger3 = AnimElem = 13
value = 100,0
channel = 19

[State 3001, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 220, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(4) = 0
x = 11

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 4 && var(40) = 0
x = 6.5

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 4 && var(40) = 1
x = 7.5

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 1200, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = AnimElem = 4
attr = S, HA
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
hitflag = MAF
guardflag = M
priority = 7, Hit
pauseTime = 0,1
guard.pauseTime = 8,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
getpower = 0, 0
givepower = 24,24
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
guard.velocity = -1.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
ID = 3000
envshake.time = 5
envshake.ampl = 2
kill = 0

[State 901,1]
type = TargetBind
trigger1 = time > 1 && numtarget && movehit
pos = 40, 0
postype = P1
time = -1
id = 3000

[State 1200, 2]
type = ChangeState
trigger1 = time > 1 && numtarget && movehit
value = 3004
persistent = 0

[State 1200, 2]
type = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1 = AnimTime = 0
trigger2 = Frontedgebodydist <= 0
trigger3 = P2statetype = L
trigger3 = P2BodyDist X <= 0
trigger4 = moveguarded
value = 3001
ctrl = 0

;miss
[Statedef 3001]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 3001

[State 450, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2

[State 1201, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;crash wall
[Statedef 3004]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3002

[State 1400, Dust]
type = helper
trigger1 = animelem = 1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 40,0

[State 1000, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 901, Throw]
type = TargetState
trigger1 = time = 0
value = 3007

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = -25, -75
postype = P1
time = -1
id = 3000

[State 1205, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
value = 3006

[State 1510,1]
type = ChangeState
trigger1 = Pos Y >= 0 && Time > 5
value = 3005

;dash
[Statedef 3005]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3003
sprpriority = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1200,1
channel = 4

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 52,0
channel = 5

[State 0, Explod]
type = Explod
trigger1 = time =0
anim = 3092
ID = 3092
pos = -19,-80
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = time =0
anim = 8104
ID = 8104
pos = -15,-5
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1100, Velocity]
type = VelSet
trigger1 = Time = 0
x = 16

[State 901,1]
type = TargetBind
trigger1 = time%10=0
pos = -25, -75
postype = P1
time = -1
id = 3000

[State 901,1]
type = TargetBind
trigger1 = time%10=5
pos = -22, -75
postype = P1
time = -1
id = 3000

[State 1205, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
trigger2 = Time = 150
value = 3006

;crash after dash
[Statedef 3006]
type = S
movetype = A
physics = S
juggle = ifelse(target,gethitvar(fall),0,0)
velset = 0,0
ctrl = 0
anim = 3004

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  3092

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  8104

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,2

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,2

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,3

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,1

[State 0, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal
name = "calaca"
ID = 3090
stateno = 3090
pos = 30,5
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermove
pausemovetime = 99999

[State 220, Position]
type = PosSet
trigger1 = time = 0
y = 0

[State 1206, width]
type = width
trigger1 = animelem = 1
edge = 40,0

[State 1206, width]
type = width
trigger1 = animelem = 2
edge = 75,0

[State 1206, width]
type = width
trigger1 = animelem = 3
edge = 90,0

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 45, -77
Time = -1
postype = P1
id = 3000

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 95, -77
Time = -1
postype = P1
ignorehitpause=1
id = 3000

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 25

[State 1200, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 3
attr = S, HA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 167 < 7, 7, fvar(11) * 167)), 0
getpower = 0, 0
givepower = 24,24
snap = 95,0
priority = 7,Hit
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
guard.dist = 0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
chainID = 3000

[State 1205, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;p2grabbed, dashing
[Statedef 3007]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0
sprpriority = 2

[State 1, Ex Flash]
type = palfx
trigger1 = !(gametime%3)
time = 2
color = 256
mul = 100, 0, 100
ignorehitpause = 1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 1510,1]
type = changeanim2
trigger1 = time = 0
value = 1207

;====<MAX GIGANTIC PRESSURE>=
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
trigger1 = AnimElemTime(6) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(-35 * const(size.xScale)), ceil(-82 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 0
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 100, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 3000,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 100, Effect]
type = PlaySnd
triggerall = anim = 3000
trigger1 = AnimElem = 5
trigger2 = AnimElem = 9
trigger3 = AnimElem = 13
value = 100,0
channel = 19

[State 3001, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 220, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelemtime(4) = 0
x = 11

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 4 && var(40) = 0
x = 7.5

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 4 && var(40) = 1
x = 8.5

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 1200, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 = AnimElem = 4
attr = S, HA
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
hitflag = MAF
guardflag = M
priority = 7,Hit
pauseTime = 0,1
guard.pauseTime = 8,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
getpower = 0, 0
givepower = 24,24
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
guard.velocity = -1.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 0
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
ID = 3050
envshake.time = 5
envshake.ampl = 2
kill = 0

[State 901,1]
type = TargetBind
trigger1 = time > 1 && numtarget && movehit
pos = 40, 0
postype = P1
time = -1
id = 3050

[State 1200, 2]
type = ChangeState
trigger1 = time > 1 && numtarget && movehit
value = 3054
persistent = 0

[State 1200, 2]
type = ChangeState
triggerall = AnimElemTime(4) > 0
trigger1 = AnimTime = 0
trigger2 = Frontedgebodydist <= 0
trigger3 = P2statetype = L
trigger3 = P2BodyDist X <= 0
trigger4 = moveguarded
value = 3051
ctrl = 0

;miss
[Statedef 3051]
type = S
movetype = I
physics = S
velset = 0,0
ctrl = 0
anim = 3001

[State 450, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2
channel = 0

[State 1201, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;crash wall
[Statedef 3054]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3002

[State 1400, Dust]
type = helper
trigger1 = animelem=1
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4,ifElse(var(40) = 1, 10, 0)
channel = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 40,0

[State 1000, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 901, Throw]
type = TargetState
trigger1 = time = 0
value = 3057

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = -25, -75
postype = P1
time = -1

[State 1205, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
value = 3056

[State 1510,1]
type = ChangeState
trigger1 = Pos Y >= 0 && Time > 5
value = 3055

;dash
[Statedef 3055]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3003
sprpriority = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1200,1
channel = 4

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 52,0
channel = 5

[State 0, Explod]
type = Explod
trigger1 = time =0
anim = 3092
ID = 3092
pos = -19,-80
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = time =0
anim = 8104
ID = 8104
pos = -15,-5
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1100, Velocity]
type = VelSet
trigger1 = Time = 0
x = 16

[State 901,1]
type = TargetBind
trigger1 = time%10=0
pos = -25, -75
postype = P1
time = -1

[State 901,1]
type = TargetBind
trigger1 = time%10=5
pos = -22, -75
postype = P1
time = -1

[State 1205, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
trigger2 = Time = 150
value = 3056

;crash after dash
[Statedef 3056]
type = S
movetype = A
physics = S
juggle = ifelse(target,gethitvar(fall),0,0)
velset = 0,0
ctrl = 0
anim = 3054

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  3092

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  8104

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,2

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,2

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,3

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,1

[State 0, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal
name = "calaca"
ID = 3090
stateno = 3090
pos = 30,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermove
pausemovetime = 99999

[State 220, Position]
type = PosSet
trigger1 = time = 0
y = 0

[State 1206, width]
type = width
trigger1 = animelem = 1
edge = 40,0

[State 1206, width]
type = width
trigger1 = animelem = 2
edge = 75,0

[State 0, Turn]
type = Turn
trigger1 = animelemtime(9) = 0

[State 0, TargetFacing]
type = TargetFacing
trigger1 = animelemtime(9) = 0
value = -1
ID = 3050

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 45, -77
Time = -1
postype = P1

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 95, -77
Time = -1
postype = P1
ignorehitpause=1

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 9
pos = -40, -77
Time = -1
postype = P1
ignorehitpause=1

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 11
pos = -20, -77
Time = -1
postype = P1
ignorehitpause = 1

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 25

[State 1200, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 3
attr = S, HA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 127 < 7, 7, fvar(11) * 127)), 0
priority = 7,Hit
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
guard.dist = 0
ground.type = low
ground.slidetime = 0
ground.hittime = 0
guard.ctrltime = 0
ground.velocity = 0,0
air.velocity = 0,0
yaccel = 0
fall = 1
fall.recover = 0
air.recover = 0
chainID = 3050
p2stateno = 3057
getpower = 0, 0
givepower = 24,24
id = 3050
kill = 0

[State 1205, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 3058
ctrl = 0

;dash
[Statedef 3058]
type = S
movetype = A
physics = N
velset = 0,0
ctrl = 0
anim = 3003
sprpriority = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1200,1
channel = 4

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 52,0
channel = 5

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 3092
ID = 3092
pos = -19,-80
postype = p1
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = time = 0
anim = 8104
ID = 8104
pos = -15,-5
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1100, Velocity]
type = VelSet
trigger1 = Time = 0
x = 20

[State 901,1]
type = TargetBind
trigger1 = time%10=0
pos = -25, -75
postype = P1
time = -1
id = 3050

[State 901,1]
type = TargetBind
trigger1 = time%10=5
pos = -22, -75
postype = P1
time = -1
id = 3050

[State 1205, ChangeState]
type = ChangeState
trigger1 = FrontEdgeBodyDist <= 10
trigger2 = Time = 150
value = 3059

;crash after dash
[Statedef 3059]
type = S
movetype = A
physics = S
juggle = ifelse(target,gethitvar(fall),0,8)
velset = 0,0
ctrl = 0
anim = 3004

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  3092

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id =  8104

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1200,2

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 2
value = 2,2

[State 1206, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200,3

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3000,1

[State 0, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal
name = "calaca"
ID = 3090
stateno = 3090
pos = 30,5
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
supermove
pausemovetime = 99999

[State 220, Position]
type = PosSet
trigger1 = time = 0
y = 0

[State 1206, width]
type = width
trigger1 = animelem = 1
edge = 40,0

[State 1206, width]
type = width
trigger1 = animelem = 2
edge = 75,0

[State 1206, width]
type = width
trigger1 = animelem = 3
edge = 90,0

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 45, -77
Time = -1
postype = P1
id = 3050

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 95, -77
Time = -1
postype = P1
ignorehitpause = 1
id = 3050

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 25

[State 1200, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 = AnimElem = 3
attr = S, HA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 137 < 7, 7, fvar(11) * 137)), 0
snap = 95,0
priority = 7,Hit
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
guard.dist = 0
givepower = 35, 35
pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
guard.pauseTime = ifElse(var(20), 6, 8), ifElse(var(20), 6, 8)
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 0
getpower = 0, 0
givepower = 24,24
chainID = 3050

[State 1205, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;p2grabbed, dashing
[Statedef 3057]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0
sprpriority = 2

[State 1, Ex Flash]
type = palfx
trigger1 = !(gametime%3)
time = 2
color = 256
mul = 100, 0, 100
ignorehitpause = 1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 1510,1]
type = changeanim2
trigger1 = time = 0
value = 1207

;====<GENOCIDE HEAVEN>=
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3100, Super Pause FX]
type = Helper
trigger1 = Time = 5
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(36 * const(size.xScale)), ceil(-120 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3100, SuperPause]
type = SuperPause
trigger1 = Time = 5
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 105, 1]
type = StateTypeSet
trigger1 = AnimElem = 39
movetype = I

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100, ifElse(var(40) = 1, 10, 0)
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3100, ifElse(var(40) = 1, 11, 1)
channel = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 14
trigger3 = AnimElem = 23
value = 1100,1
channel = 1

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 14
trigger3 = AnimElem = 23
value = 1,5

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 23
value = 41,0

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 23
StateType = A
physics = N

[State 1100, Dust Helper]
type = Helper
trigger1 = AnimElem = 23
helperType = Normal
stateNo = 8100
ID = 8100
name = "Genocide Heaven Dust"
posType = P1
ownPal = 1

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 23
x = 4.333
y = -7.5

[State 1100, Vel X]
type = VelMul
trigger1 = AnimElemTime(23) > 0
x = .95

[State 1100, Gravity]
type = VelAdd
trigger1 = AnimElemTime(23) > 1
y = .4

[State 3001, Super]
type = Helper
trigger1 = AnimElem = 4
id = 3140
name = "heaven_1"
pos = 0,0
postype = P1
stateno = 3140
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 3001, Super]
type = Helper
trigger1 = AnimElem = 13
id = 3141
name = "heaven_2"
pos = 0,0
postype = P1
stateno = 3141
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 3001, Super]
type = Helper
trigger1 = AnimElem = 22
id = 3143
name = "heaven_3"
pos = 0,0
postype = P1
stateno = 3143
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 3100, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 22
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,8
guard.pauseTime = 10,8
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, 0
ground.cornerPush.velOff = 0
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 =  AnimElem = 22
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,8
guard.pauseTime = 10,8
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -12
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -3, -12
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 1100, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3105

;Landing
[Statedef 3105]
type = S
physics = S
ctrl = 0
anim = 3105
velset = 0,0

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

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 52, 0

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<MAX GENOCIDE HEAVEN>=
[StateDef 3150]
type = S
physics = S
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
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 5
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(36 * const(size.xScale)), ceil(-120 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 5
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3150, 1]
type = StateTypeSet
trigger1 = AnimElem = 42
movetype = I

[State 3150, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 3150, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100,0
channel = 0

[State 3150, Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3100,1
channel = 0

[State 3150, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 14
trigger3 = AnimElem = 23
trigger4 = AnimElem = 33
value = 1100,1
channel = 1

[State 3150, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 14
trigger3 = AnimElem = 23
trigger4 = AnimElem = 33
value = 1,5

[State 3150, Effect]
type = PlaySnd
trigger1 = AnimElem = 23
trigger2 = AnimElem = 33
value = 41,0

[State 3150, StateType]
type = StateTypeSet
trigger1 = AnimElem = 23
StateType = A
physics = N

[State 3150, Dust Helper]
type = Helper
trigger1 = AnimElem = 23
helperType = Normal
stateNo = 8100
ID = 8100
name = "Genocide Heaven Dust"
posType = P1
ownPal = 1

[State 3150, Velocity]
type = VelSet
trigger1 = AnimElem = 23
x = 1.333
y = -8

[State 3150, Vel X]
type = VelMul
trigger1 = var(5) && AnimElemTime(33) > 0
x = .95

[State 3150, Gravity]
type = VelAdd
trigger1 = AnimElemTime(23) > 0
y = .4

[State 3150, Velocity]
type = VelSet
trigger1 = AnimElem = 33
x = 2.333
y = -5.333

[State 3150, Super]
type = Helper
trigger1 = AnimElem = 4
id = 3190
name = "heaven_1"
pos = 0,0
postype = P1
stateno = 3190
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 3150, Super]
type = Helper
trigger1 = AnimElem = 13
id = 3191
name = "heaven_2"
pos = 0,0
postype = P1
stateno = 3191
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 3150, Super]
type = Helper
trigger1 = AnimElem = 22
id = 3193
name = "heaven_3"
pos = 0,0
postype = P1
stateno = 3193
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 3150, Super]
type = Helper
trigger1 = AnimElem = 35
id = 3194
name = "heaven_4"
pos = 0,0
postype = P1
stateno = 3194
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 3150, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
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
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
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
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 183), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
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
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
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
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 =  AnimElem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -10
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -2, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 =  AnimElem = 23
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -10
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -2, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, HitDef 7]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 =  AnimElem = 36
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -10
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -3, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3105

;====<MAX GOD RUGAL GENOCIDE HEAVEN>=
[StateDef 3160]
type = S
physics = S
moveType = A
anim = 3160
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -2000
faceP2 = 1

[State 3160, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3160, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3160, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3160, Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3160, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 43

[State 3160, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3160, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3160, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3160, Super Pause FX]
type = Helper
trigger1 = Time = 5
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(36 * const(size.xScale)), ceil(-120 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3160, Super Pause]
type = SuperPause
trigger1 = Time = 5
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3160, 1]
type = StateTypeSet
trigger1 = AnimElem = 52
movetype = I

[State 3160, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 3160, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3100,10
channel = 0

[State 3160, Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3100,11
channel = 0

[State 3160, Effect]
type = PlaySnd
trigger1 = AnimElem = 51
value = 3000,10
channel = 0

[State 3160, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 14
trigger3 = AnimElem = 23
trigger4 = AnimElem = 33
trigger5 = AnimElem = 51
value = 1100,1
channel = 1

[State 3160, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 14
trigger3 = AnimElem = 23
trigger4 = AnimElem = 33
trigger5 = AnimElem = 51
value = 1,5

[State 3160, Effect]
type = PlaySnd
trigger1 = AnimElem = 23
trigger2 = AnimElem = 33
trigger3 = AnimElem = 51
value = 41,0

[State 3160, StateType]
type = StateTypeSet
trigger1 = AnimElem = 23
StateType = A
physics = N

[State 3160, Dust Helper]
type = Helper
trigger1 = AnimElem = 23
helperType = Normal
stateNo = 8100
ID = 8100
name = "Genocide Heaven Dust"
posType = P1
ownPal = 1

[State 3160, Velocity]
type = VelSet
trigger1 = AnimElem = 23
x = 1.5
y = -8

[State 3160, Vel X]
type = VelMul
trigger1 = var(5) && AnimElemTime(33) > 0
x = .9

[State 3160, Gravity]
type = VelAdd
trigger1 = AnimElemTime(23) > 0
y = .5

[State 3160, Velocity]
type = VelSet
trigger1 = AnimElem = 33
x = 3.5
y = -7.5

[State 3160, Gravity]]
type = VelSet
trigger1 = AnimElem = 53
x = -2.5
y = -8

[State 3160, 5]
type = PosFreeze
trigger1 = AnimElemTime(44) >= 0
trigger1 = AnimElemTime(53) <= 0

[State 3160, Super]
type = Helper
trigger1 = AnimElem = 4
id = 31900
name = "heaven_1"
pos = 0,0
postype = P1
stateno = 31900
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 3160, Super]
type = Helper
trigger1 = AnimElem = 13
id = 31910
name = "heaven_2"
pos = 0,0
postype = P1
stateno = 31910
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 3160, Super]
type = Helper
trigger1 = AnimElem = 22
id = 31930
name = "heaven_3"
pos = 0,0
postype = P1
stateno = 31930
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 3160, Super]
type = Helper
trigger1 = AnimElem = 35
id = 31940
name = "heaven_4"
pos = 0,0
postype = P1
stateno = 31940
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 3160, Super]
type = Helper
trigger1 = AnimElem = 50
id = 31950
name = "heaven_5"
pos = 0,0
postype = P1
stateno = 31950
size.xscale = .5
size.yscale = .5
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 99999999999999
supermovetime = 99999999999999

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 3160, HitDef 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 =  AnimElem = 5
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
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
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 164), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, HitDef 2]
type = HitDef
trigger1 = !var(16) && var(15) < 3
trigger1 =  AnimElem = 7
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
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
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 183), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, HitDef 3]
type = HitDef
trigger1 = !var(16) && var(15) < 4
trigger1 =  AnimElem = 13
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
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
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -80
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, HitDef 4]
type = HitDef
trigger1 = !var(16) && var(15) < 5
trigger1 =  AnimElem = 15
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 5,12
guard.pauseTime = 5,12
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
guard.velocity = -2.52
guard.cornerPush.velOff = 0
air.velocity = -1.5, -7
air.cornerPush.velOff = 0
yAccel = 0.6
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -40
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, HitDef 5]
type = HitDef
trigger1 = !var(16) && var(15) < 6
trigger1 =  AnimElem = 22
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -10
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -2, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, HitDef 6]
type = HitDef
trigger1 = !var(16) && var(15) < 7
trigger1 =  AnimElem = 24
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -10
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -2, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -85
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, HitDef 7]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 =  AnimElem = 36
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 10,10
guard.pauseTime = 10,10
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2, -10
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -2, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, HitDef 8]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 =  AnimElem = 51
attr = A, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
getPower = 0,0
givePower = 36, 36
pauseTime = 15,15
guard.pauseTime = 15,15
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 17
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -3, -10
ground.cornerPush.velOff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = -3, -10
air.cornerPush.velOff = 0
yAccel = 0.6
fall = 1
fall.recover = 1
fall.recoverTime = 120
air.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 165), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3160, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3105

;====<KAISER PHOENIX>=
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
trigger1 = 1
value = SCA
time = 1

[State 3200, Super Pause FX]
type = Helper
trigger1 = animelem = 23
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(-73 * const(size.xScale)), ceil(-63 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = animelem = 23
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0

[State 3200, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1300,1
channel = 0

[State 3200, Effect]
type = PlaySnd
trigger1 = AnimElem = 6
value = 3200,1
channel = 1

[State 3200, Explod]
type = Explod
trigger1 = AnimElem = 6
anim = 6260
ID = 6260
pos = -65,-88
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = .5*const(size.xscale),.5*const(size.yscale)
sprpriority = 2
ownpal = 1
removeongethit = 1

[State 3200, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 11

[State 3200, Explod]
type = Explod
trigger1 = AnimElem = 11
anim = 3260
ID = 3260
pos = -66,-73
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = .5*const(size.xscale),.5*const(size.yscale)
sprpriority = 2
ownpal = 1
removeongethit = 1

[State 3200, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 12

[State 3200, Explod]
type = Explod
trigger1 = AnimElem = 12
anim = 3260
ID = 3260
pos = -73,-63
postype = p1
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = .5*const(size.xscale),.5*const(size.yscale)
sprpriority = 2
ownpal = 1
removeongethit = 1

[State 3200, RemoveExplod]
type = RemoveExplod
trigger1 = AnimElem = 16

[State 3200, Helper]
type = Helper
trigger1 = !NumHelper(6071) && AnimElem = 16
helpertype = normal
name = "Charge FX"
ID = 3241
stateno = 3241
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 3200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3210
ctrl = 0

;====<KAISER PHOENIX>=
[Statedef 3210]
type = S
physics = N
movetype = A
anim = 3210
ctrl = 0
velset = 0,0
sprpriority = 1

[State 3210, strengthvar]
type = varset
trigger1 = !time && PrevStateNo = 3200
var(51) = 12

[State 3210, strengthvarAI]
type = varset
trigger1 = !time
var(51) = var(51)- (IfElse(random<333,1,2))

[State 3210, VarSet]
type = VarSet
trigger1 = !Time && PrevStateNo = 3200
var(52) = 3

[State 3210, Reppuken]
type = helper
triggerall = animelem = 2
trigger1 = (var(52) = 1 && Random > 500|| var(52) = 2 && random > 500) && PrevStateNo != 3200
trigger2 = Random<333 && PrevStateNo = 3200
helpertype = normal
stateno = 3260
ID = 3260
name = "Kaiser Phoenix"
postype = p1
pos = 50,-70
ownpal = 1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)

[State 3210, Reppuken]
type = helper
triggerall = animelem = 2
trigger1 = (var(52) = 0 && Random > 500|| var(52) = 2 && !NumHelper(3260)) && PrevStateNo != 3200
trigger2 = Random<500 && !NumHelper(3260) && PrevStateNo = 3200
helpertype = normal
stateno = 3261
ID = 3261
name = "Kaiser Phoenix"
postype = p1
pos = 50,-70
ownpal = 1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)

[State 3210, Reppuken]
type = helper
triggerall = animelem = 2
trigger1 = (var(52) = 0 && !NumHelper(3261)|| var(52) = 1 && !NumHelper(3260)) && PrevStateNo != 3200
trigger2 = !NumHelper(3261) && !NumHelper(3260) && PrevStateNo = 3200
helpertype=normal
stateno = 3262
ID = 3262
name = "Kaiser Phoenix"
postype = p1
pos = 50,-70
ownpal = 1
size.xscale = .5*const(size.xscale)
size.yscale = .5*const(size.yscale)

[State 3210, VarSet]
type = VarSet
trigger1 = AnimElem = 2
var(52) = IfElse(NumHelper(3260),0,IfElse(NumHelper(3262),2,1))

[State 3210, Effect]
type = PlaySnd
trigger1 = animelem = 2
value = 1300,4

[State 3210, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2
time = 10
freq = 50
ampl = -4
phase = 90
ignorehitpause = 1

[State 3210, End]
type = changestate
trigger1 = AnimElem = 6 && var(51) <= 0
trigger2 = WinKo
value = 3220

[State 3210, End]
type = changestate
trigger1 = !animtime
value = 3210

;====<KAISER PHOENIX>=
[Statedef 3220]
type = S
physics = N
movetype = A
anim = 3220
ctrl = 0
velset = 0,0
sprpriority = 1

[State 3220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;====<DESTRUCTION OMEGA>=
[StateDef 3300]
type = S
physics = S
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
trigger1 = AnimElemTime(5) < 0
time = 1
value = SCA

[State 3300, Super Pause FX]
type = Helper
trigger1 = Time = 1
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(26 * const(size.xScale)), ceil(-72 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3300, SuperPause]
type = SuperPause
trigger1 = Time = 0
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Voice]
type = PlaySnd
trigger1 = time = 46
value = 810,ifElse(var(40) = 1, 11, 1)
channel = 0

[State 3300, Effect]
type = PlaySnd
trigger1 = time = 46
value = 1,2

[State 3300, Width]
type = Width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(2) < 1
edge = 20,0
player = 20,0

[State 3300, Width]
type = Width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 1
edge = 20,0
player = 30,0

[State 3300, Width]
type = Width
trigger1 = animelemtime(5) >= 0
trigger1 = animelemtime(6) < 1
edge = 20,0
player = 40,0

[State 3300, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 3300, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 3300, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 3300, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 6
attr = S, HA
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
hitflag = MAF
guardflag = M
priority = 7, Hit
pausetime = 6,12
guard.pausetime = 6,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
guard.dist = 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 17
guard.ctrltime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yaccel = .5
kill = 0
forcestand = 1
fall = 0
air.fall = 0
fall.recover = 0
air.recover = 0
getpower = 0, 0
givepower = 24,24
id = 3300
nochainID = 3300
p2getp1state = 1

[State 3300, 2]
type = ChangeState
trigger1 = (time > 1) && numtarget && movehit
value = 3301
persistent = 0

[State 3300, 1]
type = statetypeset
trigger1 = AnimElem = 7
movetype = I

[State 3300, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;SUCCESS
[Statedef 3301]
type = S
movetype = A
physics = N
anim = 3301
poweradd = 0
velset = 0,0
sprpriority = 2

[State 3301, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 3301, PosSet]
type = PosSet
trigger1 = animelem=4
y = 0

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 60,0

[State 3301, Throw]
type = TargetState
trigger1 = Time = 0
value = 3320

[State 3301, 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 110, 0
postype = P1
time = -1

[State 3301, 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 90, 0
postype = P1
time = -1

[State 3301, 1]
type = TargetBind
trigger1 = AnimElem = 3
pos = 50, -100
postype = P1
time = -1

[State 3301, 1]
type = TargetBind
trigger1 = AnimElem = 4
pos = 50, -105
postype = P1
time = -1

[State 3301, 1]
type = TargetBind
trigger1 = AnimElem = 5
pos = 45, -110
postype = P1
time = -1

[State 3301, 1]
type = TargetBind
trigger1 = AnimElem = 6
pos = 40, -115
postype = P1
time = -1

[State 3301, Throw]
type = TargetState
trigger1 = AnimTime = 0
value = 3321

[State 3301, 1]
type = TargetBind
trigger1 = AnimTime = 0
pos = 65, -115
postype = P1
time = -1

[State 3301, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3302
ctrl = 0

;=<SUCCESS COMBO>=
[Statedef 3302]
type = S
movetype = A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 3302
poweradd = 0
sprpriority = 2

[State 3302, Explod]
type = Explod
trigger1 = animelem = 47
anim = 1190
ID = 3390
pos = 18,-81
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3302, Dust]
type = helper
trigger1 = animelem = 47
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3302, Voice]
type = PlaySnd
trigger1 = time = 1
value = 1100,ifElse(var(40) = 1, 11, 2)
channel = 0

[State 3302, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 9
trigger3 = animelem = 18
trigger4 = animelem = 27
trigger5 = animelem = 38
trigger6 = animelem = 45
trigger7 = animelem = 56
value = 1,2

[State 3302, Hit 1]
type = Hitdef
trigger1 = !var(16) && var(15) < 3
trigger1 = animelem = 3
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -90
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
persistent = 0
envshake.time = 9
envshake.ampl = 2
getpower = 0, 0
givepower = 24,24
yaccel = .5
kill = 0
p2stateno = 3322

[State 3302, Hit 2]
type = Hitdef
trigger1 = !var(16) && var(15) < 4
trigger1 = animelem = 11
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -71
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0 -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 3
yaccel = .5
kill = 0
p2stateno = 3323

[State 3302, Hit 3]
type = Hitdef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 20
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -15
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 2
yaccel = .5
kill = 0
p2stateno = 3323

[State 3302, Hit 4]
type = Hitdef
trigger1 = !var(16) && var(15) < 6
trigger1 = animelem = 29
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -79
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 3
yaccel = .5
kill = 0
p2stateno = 3322

[State 3302, Hit 5]
type = Hitdef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 40
attr = S, HA
damage = ceil(ifElse(fvar(11) * 17 < 7, 7, fvar(11) * 17)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -100
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 3
yaccel = .5
kill = 0
p2stateno = 3323

[State 3302, Hit 6]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 47
attr = S, HA
damage = ceil(ifElse(fvar(11) * 17 < 7, 7, fvar(11) * 17)), 10
hitflag = MAF
guardflag = M
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
priority = 7, Hit
pausetime = 10,10
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -68
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -2, -11
guard.velocity = -8.52
air.velocity =  -2, -11
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 2
fall = 1
fall.recover = 0
yaccel = .6

[State 3302, Hit 7]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 = AnimElem = 48
attr = S, HA
damage = ceil(ifElse(fvar(11) * 17 < 7, 7, fvar(11) * 17)), 10
hitflag = MAF
guardflag = M
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
priority = 7, Hit
pausetime = 10,10
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 157), var(36) := -115
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -3,-11
guard.velocity = -8.52
air.velocity =  -3,-11
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 2
fall = 1
fall.recover = 1
fall.recoverTime = 120
envshake.time = 10
envshake.ampl = 3
yaccel = .6

[State 3302, Effect]
type = PlaySnd
trigger1 = AnimElemTime(46) = 1
value = 1100, 1
channel = 1

[State 3302, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(47) = 2
StateType = A
physics = N

[State 3302, Velocity]
type = VelSet
trigger1 = AnimElemTime(47) = 2
x = 4.5
y = -9

[State 3302, Gravity]
type = Veladd
trigger1 = AnimElemTime(47) >= 2
y = .4

[State 3302, Velocity]
type = VelMul
trigger1 = AnimElemTime(47) >= 2
x = .9

[State 3302, 1]
type = statetypeset
trigger1 = AnimElem = 51
movetype = I

[State 3302, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(47) >= 2
value = 1105

;p2state
[Statedef 3320]
type = A
movetype = H
physics = N
velset = 0,0
SprPriority =1

[State 3320, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0

[State 3320, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3320, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3320, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3320

;p2stateno combo
[Statedef 3321]
type = S
movetype = H
physics = S
velset = 0,0
SprPriority =1

[State -3, StateTypeSet]
type = StateTypeSet
trigger1 = 1
statetype = S
physics = S

[State 3321, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 3321, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3321, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0

[State 3321, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3321

[State 3321, SelfState]
type = SelfState
trigger1 =time>=15
value = 5000

;Hit high
[Statedef 3322]
type = S
movetype = H
physics = N
velset = 0,0

[State 3322, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 3322, 0]
type = HitFallSet
trigger1 = time = 0
value = 0

[State 3322, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim2
trigger1 = Time = 0
value = 3322

[State 3322, 6]
type = ChangeState
trigger1 = HitShakeOver
value = 3324 ;HITG_SLIDE

;Hit low
[Statedef 3323]
type = S
movetype = H
physics = N
velset = 0,0

[State 3323, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 3323, 0]
type = HitFallSet
trigger1 = time = 0
value = 0

[State 3323, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim2
trigger1 = Time = 0
value = 3323

[State 3323, 6]
type = ChangeState
trigger1 = HitShakeOver
value = 3325 ;HITG_SLIDE

;Recover high
[Statedef 3324]
type = S
movetype = H
physics = S

[State 3324, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 3324, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5007

[State 3324, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 3324, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 3324, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3324, 6]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1

;Recover low
[Statedef 3325]
type = S
movetype = H
physics = S

[State 3325, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 3325, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5017

[State 3325, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 3325, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 3325, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3325, 6]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1

;====<MAX DESTRUCTION OMEGA>=
[StateDef 3350]
type = S
physics = S
moveType = A
anim = 3300
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
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 3350, Super Pause FX]
type = Helper
trigger1 = Time = 1
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = ceil(26 * const(size.xScale)), ceil(-72 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3350, Super Pause]
type = SuperPause
trigger1 = Time = 0
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3350, Width]
type = Width
trigger1 = animelemtime(2) >= 0
trigger1 = animelemtime(2) < 1
edge = 20,0
player = 20,0

[State 3350, Width]
type = Width
trigger1 = animelemtime(3) >= 0
trigger1 = animelemtime(4) < 1
edge = 20,0
player = 30,0

[State 3350, Width]
type = Width
trigger1 = animelemtime(5) >= 0
trigger1 = animelemtime(6) < 1
edge = 20,0
player = 40,0

[State 3350, Voice]
type = PlaySnd
trigger1 = time = 46
value = 810,ifElse(var(40) = 1, 11, 1)
channel = 0

[State 3350, Effect]
type = PlaySnd
trigger1 = time = 46
value = 1,2

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 3350, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 6
attr = S, HA
damage = ceil(ifElse(fvar(11) * 0 < 7, 7, fvar(11) * 0)), 0
hitflag = MAF
guardflag = M
priority = 7, Hit
pausetime = 6,12
guard.pausetime = 6,12
hitSound = -1 + 0 * (var(31) := 800)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
guard.dist = 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 17
guard.ctrltime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yaccel = .5
kill = 0
forcestand = 1
fall = 0
air.fall = 0
fall.recover = 0
air.recover = 0
getpower = 0, 0
givepower = 24,24
id = 3350
nochainID = 3350
p2getp1state = 1

[State 3350, 2]
type = ChangeState
trigger1 = (time > 1) && numtarget && movehit
value = 3351
persistent = 0

[State 3350, 1]
type = statetypeset
trigger1 = AnimElem = 7
movetype = I

[State 3350, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;SUCCESS
[Statedef 3351]
type = S
movetype = A
physics = N
anim = 3301
poweradd = 0
velset = 0,0
sprpriority = 2

[State 3351, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 3351, PosSet]
type = PosSet
trigger1 = animelem = 4
y = 0

[State 3351, Width]
type = Width
trigger1 = Time = 0
edge = 60,0

[State 3351, Throw]
type = TargetState
trigger1 = Time = 0
value = 3320

[State 3351, 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 110, 0
postype = P1
time = -1

[State 3351, 1]
type = TargetBind
trigger1 = AnimElem = 2
pos = 90, 0
postype = P1
time = -1

[State 3351, 1]
type = TargetBind
trigger1 = AnimElem = 3
pos = 50, -100
postype = P1
time = -1

[State 3351, 1]
type = TargetBind
trigger1 = AnimElem = 4
pos = 50, -105
postype = P1
time = -1

[State 3351, 1]
type = TargetBind
trigger1 = AnimElem = 5
pos = 45, -110
postype = P1
time = -1

[State 3351, 1]
type = TargetBind
trigger1 = AnimElem = 6
pos = 40, -115
postype = P1
time = -1

[State 3351, Throw]
type = TargetState
trigger1 = AnimTime = 0
value = 3321

[State 3351, 1]
type = TargetBind
trigger1 = AnimTime = 0
pos = 65, -115
postype = P1
time = -1

[State 3351, End]
type = ChangeState
trigger1 = AnimTime = 0
value = 3352
ctrl = 0

;====<MAX DESTRUCTION OMEGA>=
[Statedef 3352]
type = S
movetype = A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 3302
poweradd = 0
sprpriority = 2

[State 3352, Explod]
type = Explod
trigger1 = animelem = 47
anim = 1190
ID = 3390
pos = 18,-81
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3352, Dust]
type = helper
trigger1 = animelem = 47
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3352, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 1100,ifElse(var(40) = 1, 11, 2)
channel = 1

[State 3352, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 9
trigger3 = animelem = 18
trigger4 = animelem = 27
trigger5 = animelem = 38
trigger6 = animelem = 45
trigger7 = animelem = 56
value = 1,2

[State 3352, Hit 1]
type = Hitdef
trigger1 = !var(16) && var(15) < 3
trigger1 = animelem = 3
attr = S, HA
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -90
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
persistent = 0
envshake.time = 9
envshake.ampl = 2
getpower = 0, 0
givepower = 24,24
yaccel = .5
kill = 0
p2stateno = 3322

[State 3352, Hit 2]
type = Hitdef
trigger1 = !var(16) && var(15) < 4
trigger1 = animelem = 11
attr = S, HA
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -71
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
persistent = 0
envshake.time = 9
envshake.ampl = 2
getpower = 0, 0
givepower = 24,24
yaccel = .5
kill = 0
p2stateno = 3323

[State 3352, Hit 3]
type = Hitdef
trigger1 = !var(16) && var(15) < 5
trigger1 = animelem = 20
attr = S, HA
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -15
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
persistent = 0
envshake.time = 9
envshake.ampl = 2
getpower = 0, 0
givepower = 24,24
yaccel = .5
kill = 0
p2stateno = 3323

[State 3352, Hit 4]
type = Hitdef
trigger1 = !var(16) && var(15) < 6
trigger1 = animelem = 29
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -79
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
persistent = 0
envshake.time = 9
envshake.ampl = 2
getpower = 0, 0
givepower = 24,24
yaccel = .5
kill = 0
p2stateno = 3322

[State 3352, Hit 5]
type = Hitdef
trigger1 = !var(16) && var(15) < 7
trigger1 = animelem = 40
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animtype = Hard
air.animtype = Back
fall.animtype = Back
priority = 7, Hit
pausetime = 4,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -100
ground.type = Low
air.type = Low
ground.slidetime = 17
ground.hittime = 30
air.hittime = 17
guard.ctrltime = 18
ground.velocity = 0
guard.velocity = -6.52
air.velocity = 0, -8
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
persistent = 0
envshake.time = 9
envshake.ampl = 2
getpower = 0, 0
givepower = 24,24
yaccel = .5
kill = 0
p2stateno = 3323

[State 3352, Hit 6]
type = HitDef
trigger1 = !var(16) && var(15) < 8
trigger1 = AnimElem = 47
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
priority = 7, Hit
pausetime = 10,10
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -68
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -2, -9
guard.velocity = -8.52
air.velocity =  -2, -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 2
fall = 1
fall.recover = 0
yaccel = .6
kill = 0

[State 3352, Hit 7]
type = HitDef
trigger1 = !var(16) && var(15) < 9
trigger1 = AnimElem = 48
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
priority = 7, Hit
pausetime = 10,10
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -115
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -2, -9
guard.velocity = -8.52
air.velocity =  -2, -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 2
fall = 1
fall.recover = 0
yaccel = .6
kill = 0

[State 3352, ChangeState]
type = ChangeState
trigger1 = animelemtime(45) = 0
value = 3353
ctrl = 0

[State 3352, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(47) >= 2
value = 1105

;====<MAX DESTRUCTION OMEGA>=
[Statedef 3353]
type = S
movetype = A
physics = S
juggle = 0
ctrl = 0
poweradd = 0
velset = 0,0
anim = 3353

[State 3353, Width]
type = Width
trigger1 = 1
edge = 1,0

[State 3353, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3353, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1,2

[State 3353, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0

[State 3353, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 10
value = 1100,1
channel = 1

[State 3353, Effect]
type = PlaySnd
trigger1 = AnimElem = 23
value = 1100,1
channel = 1

[State 3353, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(3) = 2
StateType = A
physics = N

[State 3353, Velocity]
type = VelSet
trigger1 = AnimElemTime(3) = 2
trigger2 = AnimElemTime(11) = 2
x = 4.5
y = -7.5

[State 3353, PosFreeze]
type = PosFreeze
trigger1 = AnimElemTime(20) >= 0
trigger1 = AnimElemTime(29) <= 1
value = 1

[State 3353, Velocity]
type = VelSet
trigger1 = AnimElemTime(29) = 2
x = -7.5
y = -8.5

[State 3353, Velocity]
type = VelSet
trigger1 = AnimElemTime(3) = 2
trigger2 = AnimElemTime(11) = 2
x = 4.5
y = -6.5

[State 3353, Gravity]
type = Veladd
trigger1 = AnimElemTime(3) >= 2
y = .45

[State 3353, Velocity]
type = VelMul
trigger1 = AnimElemTime(3) >= 2
x = .9

[State 3353, Explod]
type = Explod
trigger1 = animelem = 3
anim = 1195
ID = 1195
pos = 18,-72
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .6,.6
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3353, Explod]
type = Explod
trigger1 = animelem = 26
anim = 1191
ID = 3191
pos = 28,-82
postype = p1
vfacing = -1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .6,.6
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3353, Explod]
type = Explod
trigger1 = animelem = 13
anim = 1195
ID = 1195
pos = 18,-72
postype = p1
bindtime = -1
removetime = -2
supermove
pausemove
scale = .6,.6
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3353, Dust]
type = helper
trigger1= animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3353, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 10
trigger1 = AnimElem = 3
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
priority = 7, Hit
pausetime = 10,10
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -68
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -2, -9
guard.velocity = -8.52
air.velocity =  -2, -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 2
fall = 1
fall.recover = 0
yaccel = .6
kill = 0

[State 3353, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 11
trigger1 = AnimElem = 4
attr = S, HA
damage = ceil(ifElse(fvar(11) * 27 < 7, 7, fvar(11) * 27)), 10
hitflag = MAF
guardflag = M
animType = Diagup
air.animType = Diagup
fall.animType = Diagup
priority = 7, Hit
pausetime = 10,10
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -105
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -2, -9
guard.velocity = -8.52
air.velocity =  -2, -9
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 2
fall = 1
fall.recover = 0
yaccel = .6
kill = 0

[State 3353, Hit 3]
type = HitDef
trigger1 = !var(16) && var(15) < 12
trigger1 = AnimElem = 12
trigger2 = AnimElem = 13
attr = A, HA
damage = ceil(ifElse(fvar(11) * 17 < 7, 7, fvar(11) * 17)), 10
hitflag = MAF
guardflag = M
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
priority = 7, Hit
pausetime = 10,10
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -138
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -2, -10
guard.velocity = -8.52
air.velocity =  -2, -10
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 2
fall = 1
fall.recover = 0
yaccel = .6
kill = 0

[State 3353, Hit 4]
type = HitDef
trigger1 = !var(16) && var(15) < 13
trigger1 = AnimElem = 27
attr = A, HA
damage = ceil(ifElse(fvar(11) * 17 < 7, 7, fvar(11) * 17)), 10
hitflag = MAF
guardflag = M
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
priority = 7, Hit
pausetime = 10,10
hitSound = -1 + 0 * (var(31) := 9)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -35
ground.type = High
air.type = Low
ground.slidetime = 17
ground.hittime = 18
guard.ctrltime = 18
ground.velocity = -3, -11
guard.velocity = -8.52
air.velocity =  -3, -11
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = 0, 0
givepower = 24,24
persistent = 0
envshake.time = 9
envshake.ampl = 2
fall = 1
fall.recover = 1
fall.recoverTime = 120
yaccel = .6

[State 3353, 1]
type = statetypeset
trigger1 = AnimElem = 29
movetype = I

[State 3353, ChangeState]
type = ChangeState
triggerall = Pos Y >= 0 && Vel Y > 0
trigger1 = AnimElemTime(3) >= 2
value = 1105

;====<DEAD END SCREAMER>=
[StateDef 3400]
type = A
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
trigger1 = 1
fvar(5) = 0

[State 3400, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 33

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

[State 3400, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3400, Super Pause FX]
type = Helper
trigger1 = Time = 1
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(15 * const(size.xScale)), ceil(-88 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3400, Super Pause]
type = SuperPause
trigger1 = Time = 0
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3400, Voice]
type = PlaySnd
trigger1 = time = 46
value = 4,ifElse(var(40) = 1, 11, 1)
channel = 0

[State 3400, Effect]
type = PlaySnd
trigger1 = time = 46
value = 1,5

[State 3400, VelSet]
type = VelSet
trigger1 = animelemtime(2) = 0
x = 9
y = 7

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 52, FX Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1692
ignorehitpause = 1

[State 3400, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 2
attr = A, HA
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 0
hitflag = MAF
guardflag = M
priority = 7, Hit
pausetime = 12,12
guard.pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -5
guard.dist = 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 17
guard.ctrltime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yaccel = .5
kill = 0
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
air.recover = 0
getpower = 0, 0
givepower = 24,24
envshake.time = 5
envshake.ampl = 5
id = 3400
nochainID = 3400

[State 3400, BindToTarget]
type = BindToTarget
trigger1 = (time > 1) && numtarget && movehit
time = 1
ID = 3400
pos = 5,0, Head

[State 3400, 2]
type = ChangeState
trigger1 = (time > 1) && numtarget && movehit
value = 3401
persistent = 0

[State 3400, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3410

;====<DEAD END SCREAMER>=
[Statedef 3410]
type = S
physics = S
ctrl = 0
anim = 3410

[State 3410, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 101,0

[State 3410, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3410, VelSet]
type = VelSet
trigger1 = 1
y = 0

[State 3410, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<DEAD END SCREAMER>=
[Statedef 3401]
type = S
movetype = A
physics = N
anim = 3401
poweradd = 0
velset = 0,0
sprpriority = 2

[State 3401, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3401, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 3401, Explod]
type = Explod
trigger1 = animelemtime(4) = 0
anim = 3494
ID = 3494
pos = 20,3
postype = p1
bindtime = 1
removetime = -2
scale = .5,.4
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3401, Explod]
type = Explod
trigger1 = animelemtime(4) = 0
anim = 3494
ID = 3494
pos = -20,3
facing = -1
postype = p1
bindtime = 1
removetime = -2
scale = .5,.4
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3401, Explod]
type = Explod
trigger1 = animelemtime(9) = 0
anim = 3490
ID = 3490
pos = -7,-1
facing = 1
postype = p1
bindtime = 1
removetime =-2
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3401, EnvShake]
type = EnvShake
trigger1 = animelemtime(4) = 0
time = 10
ampl = -4

[State 3401, Effect]
type = PlaySnd
trigger1 = animelemtime(4) = 0
value = 820,2

[State 3401, Voice]
type = PlaySnd
trigger1 = animelemtime(9) = 0
value = 1100,ifElse(var(40) = 1, 11, 2)
channel = 0

[State 3401, Effect]
type = PlaySnd
trigger1 = animelemtime(9) = 0
trigger2 = animelemtime(17) = 0
trigger3 = animelemtime(25) = 0
trigger4 = animelemtime(35) = 0
trigger5 = animelemtime(43) = 0
trigger6 = animelemtime(51) = 0
trigger7 = animelemtime(58) = 0
value = 1,0

[State 3401, Effect]
type = PlaySnd
trigger1 = animelemtime(9) = 0
trigger2 = animelemtime(17) = 0
trigger3 = animelemtime(25) = 0
trigger4 = animelemtime(35) = 0
trigger5 = animelemtime(43) = 0
trigger6 = animelemtime(51) = 0
trigger7 = animelemtime(58) = 0
value = 2,6

[State 3401, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelemtime(9) = 0
trigger2 = animelemtime(17) = 0
trigger3 = animelemtime(25) = 0
trigger4 = animelemtime(35) = 0
trigger5 = animelemtime(43) = 0
trigger6 = animelemtime(51) = 0
trigger7 = animelemtime(13) = 0
trigger8 = animelemtime(22) = 0
trigger9 = animelemtime(30) = 0
trigger10 = animelemtime(40) = 0
trigger11 = animelemtime(48) = 0
trigger12 = animelemtime(56) = 0
value = floor(ifElse(10 * fvar(11) < 7, -7, -10 * fvar(11)))
ID = 3400
kill = 0
absolute = 1

[State 3401, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelemtime(57) = 0
value = floor(ifElse(12 * fvar(11) < 7, -7, -12 * fvar(11)))
ID = 3400
kill = 1
absolute = 1

[State 3401, EnvShake]
type = EnvShake
trigger1 = animelemtime(9) = 0
time = 50
ampl = -2
freq = 120

[State 3401, EnvShake]
type = EnvShake
trigger1 = animelemtime(57) = 0
time = 15
ampl = -6

[State 3401, BindToTarget]
type = BindToTarget
trigger1 = animelem = 2
time = 1
ID = 3400
pos = 8,0,mid

[State 3401, BindToTarget]
type = BindToTarget
trigger1 = animelem = 3
time = 1
ID = 3400
pos = 8,0,foot

[State 3401, PosSet]
type = PosSet
trigger1 = animelem = 4
y = 0

[State 3401, Width]
type = Width
trigger1 = Time = 0
edge = 80,0

[State 3401, Throw]
type = TargetState
trigger1 = Time = 0
value = 3420

[State 3401, Throw]
type = TargetState
trigger1 = animelemtime(58) = 1
value = 3421

[State 3401, 1]
type = statetypeset
trigger1 = AnimElem = 58
movetype = I

[State 3401, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;p2state
[Statedef 3420]
type = A
movetype = H
physics = N
velset = 0,0
SprPriority = -1

[State 3420, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3420, 0]
type = HitFallSet
trigger1 = time = 0
value = 1

[State 3420, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3420, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3420, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3420

[State 3420, AngleDraw]
type = AngleDraw
trigger1 = time >= 52
value = 90
scale = 1,1

;p2state
[Statedef 3421]
type = A
movetype = H
physics = N
velset = -5, -6
SprPriority = 3

[State 3421, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 3421, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3421, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3421

[State 3421, SelfState]
type = SelfState
trigger1 = time = 1
value = 5050

;====<MAX DEAD END SCREAMER>=
[StateDef 3450]
type = A
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
trigger1 = 1
fvar(5) = 0

[State 3450, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 33

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

[State 3400, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3450, Super Pause FX]
type = Helper
trigger1 = Time = 1
helperType = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(15 * const(size.xScale)), ceil(-88 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3450, Super Pause]
type = SuperPause
trigger1 = Time = 0
time = 45
moveTime = 45
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,1
darken = 0

[State 3450, Voice]
type = PlaySnd
trigger1 = time = 46
value = 4,ifElse(var(40) = 1, 11, 1)
channel = 0

[State 3450, Effect]
type = PlaySnd
trigger1 = time = 46
value = 1,5

[State 3450, VelSet]
type = VelSet
trigger1 = animelemtime(2) = 0
x = 11
y = 7

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1190
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1490
ignorehitpause = 1

[State 52, Blade Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1491
ignorehitpause = 1

[State 52, FX Remove]
type = RemoveExplod
trigger1 = Time = 0
ID = 1692
ignorehitpause = 1

[State 3450, 1]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 2
attr = A, HA
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 0
hitflag = MAF
guardflag = M
priority = 7, Hit
pausetime = 12,12
guard.pausetime = 12,12
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -5
guard.dist = 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 17
guard.ctrltime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -4.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yaccel = .5
kill = 0
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
air.recover = 0
getpower = 0, 0
givepower = 24,24
envshake.time = 5
envshake.ampl = 5
id = 3450
nochainID = 3450

[State 3450, BindToTarget]
type = BindToTarget
trigger1 = (time > 1) && numtarget && movehit
time = 1
ID = 3450
pos = 5,0, Head

[State 3450, 2]
type = ChangeState
trigger1 = (time > 1) && numtarget && movehit
value = 3461
persistent = 0

[State 3450, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3460

;====<MAX DEAD END SCREAMER>=
[Statedef 3460]
type = S
physics = S
ctrl = 0
anim = 3410

[State 3460, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 101,0

[State 3460, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3460, VelSet]
type = VelSet
trigger1 = 1
y = 0

[State 3460, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<MAX DEAD END SCREAMER>=
[Statedef 3461]
type = S
movetype = A
physics = N
anim = 3451
poweradd = 0
velset = 0,0
sprpriority = 2

[State 3461, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 3461, 0]
type = TargetFacing
trigger1 = time = 0
value = -1

[State 3461, Explod]
type = Explod
trigger1 = animelemtime(4) = 0
anim = 3494
ID = 3494
pos = 20,3
postype = p1
bindtime = 1
removetime = -2
scale = .5,.4
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3461, Explod]
type = Explod
trigger1 = animelemtime(4) = 0
anim = 3494
ID = 3494
pos = -20,3
facing = -1
postype = p1
bindtime = 1
removetime = -2
scale = .5,.4
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3461, Explod]
type = Explod
trigger1 = animelemtime(9) = 0
anim = 3490
ID = 3490
pos = -7,-1
facing = 1
postype = p1
bindtime = 1
removetime =-2
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 3461, EnvShake]
type = EnvShake
trigger1 = animelemtime(4) = 0
time = 10
ampl = -4

[State 3461, Effect]
type = PlaySnd
trigger1 = animelemtime(4) = 0
value = 820,2

[State 3461, Voice]
type = PlaySnd
trigger1 = animelemtime(9) = 0
value = 1100,ifElse(var(40) = 1, 11, 2)
channel = 0

[State 3461, Effect]
type = PlaySnd
trigger1 = animelemtime(9) = 0
trigger2 = animelemtime(17) = 0
trigger3 = animelemtime(25) = 0
trigger4 = animelemtime(35) = 0
trigger5 = animelemtime(43) = 0
trigger6 = animelemtime(51) = 0
trigger7 = animelemtime(58) = 0
trigger8 = animelemtime(64) = 0
trigger9 = animelemtime(77) = 0
trigger10 = animelemtime(85) = 0
trigger11 = animelemtime(91) = 0
value = 1,0

[State 3461, Effect]
type = PlaySnd
trigger1 = animelemtime(9) = 0
trigger2 = animelemtime(17) = 0
trigger3 = animelemtime(25) = 0
trigger4 = animelemtime(35) = 0
trigger5 = animelemtime(43) = 0
trigger6 = animelemtime(51) = 0
trigger7 = animelemtime(58) = 0
trigger8 = animelemtime(64) = 0
trigger9 = animelemtime(77) = 0
trigger10 = animelemtime(85) = 0
trigger11 = animelemtime(91) = 0
value = 2,6

[State 3461, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelemtime(9) = 0
trigger2 = animelemtime(17) = 0
trigger3 = animelemtime(25) = 0
trigger4 = animelemtime(35) = 0
trigger5 = animelemtime(43) = 0
trigger6 = animelemtime(51) = 0
trigger7 = animelemtime(13) = 0
trigger8 = animelemtime(22) = 0
trigger9 = animelemtime(30) = 0
trigger10 = animelemtime(40) = 0
trigger11 = animelemtime(48) = 0
trigger12 = animelemtime(56) = 0
trigger13 = animelemtime(64) = 0
trigger14 = animelemtime(77) = 0
trigger15 = animelemtime(85) = 0
trigger16 = animelemtime(91) = 0
value = floor(ifElse(12 * fvar(11) < 7, -7, -12 * fvar(11)))
ID = 3450
kill = 0
absolute = 1

[State 3461, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelemtime(93) = 0
value = floor(ifElse(15 * fvar(11) < 7, -7, -15 * fvar(11)))
ID = 3450
kill = 1
absolute = 1

[State 3461, EnvShake]
type = EnvShake
trigger1 = animelemtime(9) = 0
time = 50
ampl = -2
freq = 120

[State 3461, EnvShake]
type = EnvShake
trigger1 = animelemtime(93) = 0
time = 15
ampl = -6

[State 3461, BindToTarget]
type = BindToTarget
trigger1 = animelem = 2
time = 1
ID = 3450
pos = 8,0,mid

[State 3461, BindToTarget]
type = BindToTarget
trigger1 = animelem = 3
time = 1
ID = 3450
pos = 8,0,foot

[State 3461, PosSet]
type = PosSet
trigger1 = animelem = 4
y = 0

[State 3461, Width]
type = Width
trigger1 = Time = 0
edge = 80,0

[State 3461, Throw]
type = TargetState
trigger1 = Time = 0
value = 3470

[State 3461, Throw]
type = TargetState
trigger1 = animelemtime(94) = 1
value = 3471

[State 3461, 1]
type = statetypeset
trigger1 = AnimElem = 94
movetype = I

[State 3461, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;p2state
[Statedef 3470]
type = A
movetype = H
physics = N
velset = 0,0
SprPriority = -1

[State 3470, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3470, 0]
type = HitFallSet
trigger1 = time = 0
value = 1

[State 3470, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3470, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3470, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3420

[State 3470, AngleDraw]
type = AngleDraw
trigger1 = time >= 52
value = 90
scale = 1,1

;p2state
[Statedef 3471]
type = A
movetype = H
physics = N
velset = -5, -6
SprPriority = 3

[State 3471, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 3471, 1]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3471, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3421

[State 3471, SelfState]
type = SelfState
trigger1 = time = 1
value = 5050

;====<LAST JUDGEMENT>=
[StateDef 3500]
type = S
physics = N
moveType = A
anim = 3500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3500, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3500, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 50

[State 3500, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3500, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 2
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(10 * const(size.xScale)), ceil(-104 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = Time = 4
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0

[State 3500, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 3500, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3500, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) <= 10
time = 1
value = SCA

[State 3500, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 4.85

[State 3500, Voice]
type = playsnd
trigger1 = AnimElem = 2
value = 3500,0
channel = 0

[State 3500, Snd]
type = playsnd
trigger1 = AnimElem = 1
value = 1900,0

[State 3500, HitDef: Throw]
type = HitDef
trigger1 = Time
trigger1 = !var(38)
trigger1 = P2Dist x >= 0 && P2BodyDist x <= 12
attr = S,HT
hitflag = M-
priority = 4, Miss
getPower = 0,0
givePower = 0,0
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 3501
p2stateno = 3505
p2getp1state = 1
hitsound = s2,800
fall = 1
fall.recover = 0

[State 3500, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;--- SUCCESS ---
[Statedef 3501]
type = S
movetype = A
physics = N
anim = 3501
velset = 0, 0
poweradd = 0
sprpriority = 1

[State 3501, Safety]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 3501, More Safety]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3501, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3505

[State 3501, Target Facing]
type = TargetFacing
trigger1 = Time <= 1
value = -1

[State 3501, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3501, Pause]
type = Pause
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(17) < 0
Time = 2
moveTime = 2

[State 3501, AllPalFX: Black]
type = AllPalFX
trigger1 = AnimElemTime(2) = -16
Time = 16
sinadd = -255, -255, -255, 64

[State 3501, EnvColor: Black]
type = EnvColor
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(17) < 0
Time = 4
value = 0, 0, 0

[State 3501, AssertSpecial]
type = AssertSpecial
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(17) < 0
flag = NoBarDisplay
flag2 = noFG

[State 3501, Bind]
type = TargetBind
trigger1 = AnimElemTime(17) < 0
pos = ceil(42 * const(size.xScale)), ceil(0 * const(size.yScale))

[State 3501, HitAdd]
type = HitAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 1

[State 3501, Damage]
type = TargetLifeAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15
value = floor(ifElse(27 * fvar(11) < 7, -7, -27 * fvar(11)))
kill = 0

[State 3501, Damage]
type = TargetLifeAdd
trigger1 = AnimElem = 16
value = floor(ifElse(28 * fvar(11) < 7, -7, -28 * fvar(11)))
kill = 1

[State 3501, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
value = 35

[State 3501, VarAdd]
type = VarAdd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
var(13) = 1

[State 3501, EnvShake]
type = EnvShake
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
time = 6
freq = 120
ampl = -4

[State 3501, Hit Sound]
type = PlaySnd
trigger1 = (Time = [32,89]) && !(Time % 5)
value = 2,2

[State 3501, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 3000,10
channel = 0

[State 3501, Voice]
type = PlaySnd
trigger1 = !WinKo
trigger1 = AnimElemTime(16) = 3
value = 1100,11
channel = 0

[State 3501, Final Hit Snd]
type = PlaySnd
trigger1 = AnimElem = 16
value = 2,10

[State 3501, TargetState]
type = TargetState
trigger1 = AnimElem = 16 && NumTarget
value = 3506

[State 3501, End(Win)]
type = ChangeState
trigger1 = AnimElemTime(16) >= 0 && WinKo
value = 187

[State 3501, Sparks]
type = Helper
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4 || AnimElem = 5 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 9
trigger2 = AnimElem = 10 || AnimElem = 11 || AnimElem = 12 || AnimElem = 13 || AnimElem = 14 || AnimElem = 15 || AnimElem = 16
helperType = Normal
StateNo = 8018
ID = 8000
name = "Spark"
posType = P2
pos = 0, (Target,Const(size.mid.pos.y))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
sprpriority = 5

[State 3501, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---TARGET---
[Statedef 3505]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 3505, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3505

[State 3505, On Ground]
type = PosSet
trigger1 = !Time
y = 0

[State 3505, Screenbound]
type = ScreenBound
Trigger1 = 1
value = 1
movecamera = 0,0

[State 3505, Safety]
type = SelfState
trigger1 = !gethitvar(isbound)
trigger1 = Time > 160
value = 5050

;---TARGET---
[Statedef 3506]
type = A
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 3506, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3506

[State 3506, On Ground]
type = PosSet
trigger1 = !Time
y = 0

[State 3506, SelfState]
type = SelfState
trigger1 = !AnimTime && Anim = 3506
value = IfElse(Alive,5120,5150)

;====<GOD END>=
[StateDef 3600]
type = S
physics = N
moveType = A
anim = 3600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3600, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3600, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3600, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3600, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3600, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 33

[State 3600, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3600, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3600, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3600, Super Pause FX]
type = Helper
trigger1 = animelem = 1
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(-11 * const(size.xScale)), ceil(-80 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3600, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,2
darken = 0

[State 3600, Position]
type = PosSet
trigger1 = !Time
y = 0

[State 3600, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 730,11

[State 3600, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,12

[State 3600, Hitdef]
type = HitDef
trigger1 = !var(16) && var(15) < 2
trigger1 = AnimElem = 3
attr = S, HT
damage = ceil(ifElse(fvar(11) * 37 < 7, 7, fvar(11) * 37)), 0
hitflag = MAF
guardflag = M
priority = 7, Hit
pausetime = 1,1
guard.pausetime = 12,12
hitSound = s198,1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8017)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 57), var(36) := -66
guard.dist = 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 17
guard.ctrltime = 18
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -8.52
guard.cornerPush.velOff = 0
air.velocity = 0, 0
air.cornerPush.velOff = 0
yaccel = .5
kill = 0
forcestand = 1
fall = 0
air.fall = 1
fall.recover = 0
air.recover = 0
getpower = 0, 0
givepower = 35,0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
ID = 3600
p1stateno = 3610

[State 3600, 1]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<G End Connect>==
[Statedef 3610]
type = S
movetype = A
physics = S
velset = 0,0
ctrl = 0
anim = 3610
sprpriority = 1
facep2 = 1

[State 3610, Width]
type = Width
trigger1 = 1
edge = 0,0
player = 0,0
ignorehitpause=1

[State 3610, VarSet]
type = VarSet
trigger1 = !Time
fvar(6) = 1

[State 3610, VarSet]
type = VarSet
trigger1 = Target(3600),Name="Gouki" || Target(3600),Name="Akuma" || Target(3600),Name="MechGouki"
trigger2 = Target(3600),Name="Mech Gouki" || Target(3600),Name="CyberAkuma" || Target(3600),Name="Cyber Akuma"
trigger2 = Target(3600),Name="Geese" || Target(3600),Name="Geese Howard" || Target(3600),Name="cvsgeese"
fvar(6) = 1.23

[State 3610, VarSet]
type = VarSet
trigger1 = Target(3600),Name="Rugal"||Target(3600),Name="MechRugal"||Target(3600),Name="Mech Rugal"||Target(3600),Name="Mech-Rugal"
trigger2 = Target(3600),Name="Rugal Bernstein"||Target(3600),Name="OmegaRugal"||Target(3600),Name="Rugal2k2"
trigger3 = Target(3600),Name="cvsrugal"||Target, Name="cvsrugal_ex"||Target,Name="cvs_grugal"||Target, name="GodRugal"||Target, name="God Rugal"
trigger4 = Target(3600),name="GRugal"||Target, Name="cvsgodrugal"||Target(3600),Name="Orochi"||Target(3600),name="Orochi97"
fvar(6) = .801

[State 3610, VarSet]
type = VarSet
trigger1 = Target(3600),Name="ShinGouki" || Target(3600),Name="ShinAkuma" || Target(3600),Name="Shin Gouki" || Target(3600),Name="Shin Akuma"
trigger2 = Target(3600),Name="S.Gouki" || Target(3600),Name="S.Akuma" || Target(3600),Name="S. Gouki" || Target(3600),Name="S. Akuma" ||Target(3600),Name="cvsgouki_ex"|| Target(3600),Name="Iori"
trigger3 = Target(3600),Name="Iori Yagami" || Target(3600),Name="IoriYagami" || Target(3600),Name="O.Iori"|| Target(3600),Name="cvs2_iori"
trigger4 = Target(3600),Name="cvs2_iori_ex" || Target(3600),Name="Orochi Iori" || Target(3600),Name="Leona"|| Target(3600),Name="O.Leona"
trigger5 = Target(3600),Name="Orochi Leona" || Target(3600),Name="Wild Leona" || Target(3600),Name="Mature"|| Target(3600),Name="Vice"
trigger6 = Target(3600),Name="cvsvice" || Target(3600),Name="O.Chris"|| Target(3600),Name="O. Chris" || Target(3600),Name="O.Shermie"
trigger7 = Target(3600),Name="O. Shermie" || Target(3600),Name="Orochi Shermie" || Target(3600),Name="OrochiShermie"|| Target(3600),Name="O.Yashiro"
trigger8 = Target(3600),Name="O. Yashiro" || Target(3600),Name="Orochi Yashiro" || Target(3600),Name="OrochiYashiro"|| Target(3600),Name="Goenitz"
fvar(6) = .92

[State 3610, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 185,0
channel = 0

[State 3610, TargetState]
type = TargetState
trigger1 = !Time
value = 3620
ID = 3600

[State 3610, 1]
type = TargetBind
trigger1 = AnimElemTime(5)<0
pos = 87,-65
time = 1
ID = 3600

[State 3610, 1]
type = TargetBind
trigger1 = AnimElem = 5
pos = 76,-84
time = 10
ID = 3600

[State 3610, 1]
type = TargetBind
trigger1 = AnimElem = 6
pos = 78,-92
time = 10
ID = 3600

[State 3610, 1]
type = TargetBind
trigger1 = AnimElem = 7
pos = 71,-114
time = 10
ID = 3600

[State 3610, 1]
type = TargetBind
trigger1 = AnimElem = 8
pos = 38, -154
time = 10
ID = 3600

[State 3610, 1]
type = TargetBind
trigger1 = AnimElem = 9
pos = 41, -148
time = 10
ID = 3600

[State 3610, 1]
type = TargetBind
trigger1 = AnimElem = 10
pos = 39, -145
time = 30
ID = 3600

[State 3610, 1]
type = TargetBind
trigger1 = AnimElem = 11
trigger2 = AnimElem = 13
trigger3 = AnimElem = 15
trigger4 = AnimElem = 17
trigger5 = AnimElem = 19
trigger6 = AnimElem = 21
trigger7 = AnimElem = 23
trigger8 = AnimElem = 25
trigger9 = AnimElem = 27
trigger10 = AnimElem = 29
trigger11 = AnimElem = 31
trigger12 = AnimElem = 33
pos = 39, -154
time = 3
ID = 3600

[State 3610, 1]
type = TargetBind
trigger1 = AnimElem = 12
trigger2 = AnimElem = 14
trigger3 = AnimElem = 16
trigger4 = AnimElem = 18
trigger5 = AnimElem = 20
trigger6 = AnimElem = 22
trigger7 = AnimElem = 24
trigger8 = AnimElem = 26
trigger9 = AnimElem = 28
trigger10 = AnimElem = 30
trigger11 = AnimElem = 32
trigger12 = AnimElem = 34
pos = 39, -145
time = 15
ID = 3600

[State 3610, VarSet]
type = VarSet
trigger1 = AnimElem = 10
trigger2 = AnimElem = 14
trigger3 = AnimElem = 18
trigger4 = AnimElem = 22
trigger5 = AnimElem = 26
trigger6 = AnimElem = 30
var(43) = 1

[State 3610, VarSet]
type = VarSet
trigger1 = AnimElem = 12
trigger2 = AnimElem = 16
trigger3 = AnimElem = 20
trigger4 = AnimElem = 24
trigger5 = AnimElem = 28
trigger6 = AnimElem = 32
var(43) = 2

[State 3610, VarSet]
type = VarSet
trigger1 = AnimElem = 34
var(43) = 3

[State 3610, Reppuken]
type = Helper
trigger1 = AnimElemTime(10) = 22
trigger2 = AnimElemTime(12) = 7
trigger3 = AnimElemTime(14) = 7
trigger4 = AnimElemTime(16) = 7
trigger5 = AnimElemTime(18) = 7
trigger6 = AnimElemTime(20) = 7
trigger7 = AnimElemTime(22) = 7
trigger8 = AnimElemTime(24) = 7
trigger9 = AnimElemTime(26) = 7
trigger10 = AnimElemTime(28) = 7
trigger11 = AnimElemTime(30) = 7
trigger12 = AnimElemTime(32) = 7
trigger13 = AnimElemTime(34) = 7
helpertype = normal
stateno = 6191
ID = 6191
name = "OrochiSkull"
postype = p1
pos = 25,0
ownpal = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

[State 3610, Reppuken]
type = Helper
trigger1 = AnimElemTime(10) = 22
trigger2 = AnimElemTime(12) = 7
trigger3 = AnimElemTime(14) = 7
trigger4 = AnimElemTime(16) = 7
trigger5 = AnimElemTime(18) = 7
trigger6 = AnimElemTime(20) = 7
trigger7 = AnimElemTime(22) = 7
trigger8 = AnimElemTime(24) = 7
trigger9 = AnimElemTime(26) = 7
trigger10 = AnimElemTime(28) = 7
trigger11 = AnimElemTime(30) = 7
trigger12 = AnimElemTime(32) = 7
trigger13 = AnimElemTime(34) = 7
helpertype = normal
stateno = 7060
ID = 7060
name = "FloorFX"
postype = p1
pos = 30,0
ownpal = 1
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)

[State 3610, HitAdd]
type = HitAdd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 13
trigger3 = AnimElem = 15
trigger4 = AnimElem = 17
trigger5 = AnimElem = 19
trigger6 = AnimElem = 21
trigger7 = AnimElem = 23
trigger8 = AnimElem = 25
trigger9 = AnimElem = 27
trigger10 = AnimElem = 29
trigger11 = AnimElem = 31
trigger12 = AnimElem = 33
trigger13 = AnimElem = 35
value = 1

[State 3610, PlaySnd]
type = PlaySnd
trigger1 = AnimElemTime(10) = 25
trigger2 = AnimElemTime(12) = 10
trigger3 = AnimElemTime(14) = 10
trigger4 = AnimElemTime(16) = 10
trigger5 = AnimElemTime(18) = 10
trigger6 = AnimElemTime(20) = 10
trigger7 = AnimElemTime(22) = 10
trigger8 = AnimElemTime(24) = 10
trigger9 = AnimElemTime(26) = 10
trigger10 = AnimElemTime(28) = 10
trigger11 = AnimElemTime(30) = 10
trigger12 = AnimElemTime(32) = 10
trigger13 = AnimElemTime(34) = 10
value = 3000,1

[State 3610, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 19
trigger3 = AnimElem = 27
trigger4 = AnimElem = 35
value = 1100,11
channel = 0

[State 3610, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(10) = 25
trigger2 = AnimElemTime(12) = 10
trigger3 = AnimElemTime(14) = 10
trigger4 = AnimElemTime(16) = 10
trigger5 = AnimElemTime(18) = 10
trigger6 = AnimElemTime(20) = 10
trigger7 = AnimElemTime(22) = 10
trigger8 = AnimElemTime(24) = 10
trigger9 = AnimElemTime(26) = 10
trigger10 = AnimElemTime(28) = 10
trigger11 = AnimElemTime(30) = 10
trigger12 = AnimElemTime(32) = 10
trigger13 = AnimElemTime(34) = 10
time = 10
freq = 60
ampl = -4
phase = 90

[State 3610, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 11
trigger2 = AnimElem = 13
trigger3 = AnimElem = 15
trigger4 = AnimElem = 17
trigger5 = AnimElem = 19
trigger6 = AnimElem = 21
trigger7 = AnimElem = 23
trigger8 = AnimElem = 25
trigger9 = AnimElem = 27
trigger10 = AnimElem = 29
trigger11 = AnimElem = 31
trigger12 = AnimElem = 33
value = ceil(-25*fvar(6))
ID = 3600
kill = 0
absolute = 0

[State 3610, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = AnimElem = 35
value = ceil(-95*fvar(6))
ID = 3600
kill = 1
absolute = 0

[State 3610, End]
type = ChangeState
trigger1 = animelemtime(35) = 1 && winko
value = 188

[State 3610, TargetState]
type = TargetState
trigger1 = AnimElem = 35 && !winko
value = 3630
ID = 3600

[State 3610, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;=<G Emd P2 State 1>==
[Statedef 3620]
type = S
movetype = H
physics = N
velset = 0,0

[State 3620, Width]
type = Width
trigger1 = 1
edge = 0,0
player = 0,0
ignorehitpause = 1

[State 3620, Turn]
type = Turn
trigger1 = Enemynear, Facing = Facing && StateType = S
ignorehitpause = 1

[State 3620, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A

[State 3620, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignorehitpause = 1

[State 3620, SprPriority]
type = SprPriority
trigger1 = 1
value = 2

[State 3620, ChangeAnim]
type = ChangeAnim2
trigger1 = !Time
value = 3620

[State 3620, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3620, Rotate]
type = angleset
trigger1 = AnimElem = 5
trigger2 = AnimElem = 7
trigger3 = AnimElem = 9
trigger4 = AnimElem = 11
trigger5 = AnimElem = 13
trigger6 = AnimElem = 15
trigger7 = AnimElem = 17
trigger8 = AnimElem = 19
trigger9 = AnimElem = 21
trigger10 = AnimElem = 23
trigger11 = AnimElem = 25
trigger12 = AnimElem = 27
trigger13 = AnimElem = 29
value = -90

[State 3620, Rotate]
type = angleset
trigger1 = AnimElem = 6
trigger2 = AnimElem = 8
trigger3 = AnimElem = 10
trigger4 = AnimElem = 12
trigger5 = AnimElem = 14
trigger6 = AnimElem = 16
trigger7 = AnimElem = 18
trigger8 = AnimElem = 20
trigger9 = AnimElem = 22
trigger10 = AnimElem = 24
trigger11 = AnimElem = 26
trigger12 = AnimElem = 28
trigger13 = AnimElem = 30
value = 0

[State 3620, AngleDraw]
type = AngleDraw
trigger1 = AnimElemTime(5) >= 0
scale = 1,1
ignorehitpause = 1

;=<G Emd P2 State 1>==
[Statedef 3630]
type = A
movetype = H
physics = N
velset = -4,-15

[State 3630, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0
ignorehitpause = 1

[State 3630, SprPriority]
type = SprPriority
trigger1 = 1
value = 2

[State 3630, ChangeAnim]
type = ChangeAnim2
trigger1 = !Time
value = 3630

[State 3630, VelAdd]
type = VelAdd
trigger1 = 1
x = 0
y = .5

[State 3630, CtrlSet]
type = CtrlSet
trigger1 = 1
value = 0

[State 3630, EnvShake]
type = EnvShake
trigger1 = vel y > 0
trigger1 = pos y > -vel y
time = 20
freq = 50
ampl = -7
phase = 60

[State 3630, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100
