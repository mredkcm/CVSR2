; _________________________________________
;|Kenji by K6666orochi
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER MOVES>====
;==

;---------------------------------------------------------------------------
;Super 1
[Statedef 3000]
type=S
physics=N
movetype=A
anim=3000
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(15) < 0
time = 1
value = SCA

[State 3000, Superpause FX]
type = helper
trigger1 = Time = 3
;helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 8, -50
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 1
time = 52
movetime = 52
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Pause]
type = Pause
trigger1 = time=1 && !fvar(11)
time = 52;+var(1)*2
movetime = 52


[State -3,Super]
type = Helper
trigger1= time = 53
id = 3002
name = "fire"
pos = 42*const(size.xscale),const(size.yscale)
postype = P1
stateno = 3002
helpertype = normal
keyctrl = 0
ownpal = 1

[State 3000, Width]
type = Width
trigger1 = AnimElem = 6
value = 32,0

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = time = 172
value = 3001
ctrl = 1

;Fire Super
[statedef 3001]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 3001

[State 0, ChangeState]
type = ChangeState
trigger1 = Animtime = 0
value = 300
ctrl = 1

;FIre
[Statedef 3002]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3004
sprpriority = 4

[State 0, SuperPause]
type = PLaysnd
trigger1 = Animelem = 1
volumescale = 255
value = 3000,2

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 210, 2]
type = HitDef
Trigger1= Movecontact!=[1,10]
Trigger1=Hitcount<5
attr = S, SP
animtype = Heavy
damage = 40,5
guardflag = MA
pausetime = 0,5
sparkno = S27004
sparkxy = 0,-70
hitsound = S3000,1
guardsound = S3,0
ground.type = High
ground.slidetime = 10
ground.hittime = 10
cornerpush = 0
guard.slidetime = 10
guard.hittime = 30
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 30
ground.velocity = -5,-3
guard.velocity = -3
airguard.velocity = -3
air.type = Low
air.velocity = -3,-3
yaccel = .38
fall.recover = 0
air.recover = 0
forcestand=1
fall.recover = 0
air.recover = 0
palfx.time = 25
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1
fall = 1

[State 3306, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(P2Dist X < 0, 0, ifElse(P2Dist X < 0, ceil(P2Dist X), 0)), ceil(P2Dist Y - 64)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3306, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P2
pos = ifElse(P2Dist X < 0, 0, ifElse(P2Dist X < 0, ceil(P2Dist X), 0)), ceil(P2Dist Y - 64)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, DestroySelf]
type = changestate
trigger1 = animtime = 0
value = 3003

[State 0, ChangeState]
type = destroyself
trigger1 = parent, movetype = H

;FIre
[Statedef 3003]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3003
sprpriority = 4

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;MAX Super 2
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

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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
trigger1 = AnimElemTime(15) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 1
;helpertype = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 8, -50
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 53
moveTime = 53
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State -3,Super]
type = Helper
trigger1= time = 53
id = 3052
name = "fire"
pos = 42*const(size.xscale),const(size.yscale)
postype = P1
stateno = 3052
helpertype = normal
keyctrl = 0
ownpal = 1

[State 3000, Width]
type = Width
trigger1 = AnimElem = 17
value = 32,0

[State 3000, ChangeState]
type = ChangeState
trigger1 = time = 172
value = 3001
ctrl = 1

;FIre
[Statedef 3052]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3002
sprpriority = 4

[State 0, SuperPause]
type = PLaysnd
trigger1 = Animelem = 1
value = 3000,2

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 210, 2]
type = HitDef
Trigger1= Movecontact!=[1,10]
Trigger1=Hitcount<5
attr = S, SP
animtype = Heavy
damage = 60,5
guardflag = MA
pausetime = 0,5
sparkno = S27004
sparkxy = 0,-70
hitsound = S3000,1
guardsound = S3,0
ground.type = High
ground.slidetime = 10
ground.hittime = 10
cornerpush = 0
guard.slidetime = 10
guard.hittime = 30
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 30
ground.velocity = -5,-3
guard.velocity = -3
airguard.velocity = -3
air.type = Low
air.velocity = -3,-3
yaccel = .38
fall.recover = 0
air.recover = 0
forcestand=1
fall.recover = 0
air.recover = 0
palfx.time = 25
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1
fall = 1

[State 3306, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(P2Dist X < 0, 0, ifElse(P2Dist X < 0, ceil(P2Dist X), 0)), ceil(P2Dist Y - 64)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3306, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P2
pos = ifElse(P2Dist X < 0, 0, ifElse(P2Dist X < 0, ceil(P2Dist X), 0)), ceil(P2Dist Y - 64)
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, AngleDraw]
Type = AngleDraw
Trigger1 = Time <= 30
Scale = (1 + (Time / 30.0))*const(size.xscale), 1*const(size.yscale);0.1 + (Time / 30.0)

[State 0, AngleDraw]
Type = AngleDraw
Trigger1 = Time > 30
Scale = 2, 1


[State 0, DestroySelf]
type = changestate
trigger1 = animtime = 0
value = 3053

[State 0, ChangeState]
type = destroyself
trigger1 = parent, movetype = H

;FIre
[Statedef 3053]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3003
sprpriority = 4



[State 0, AngleDraw]
Type = AngleDraw
Trigger1 = Time > 0
Scale = 2*const(size.xscale), 1*const(size.yscale)

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;Super 2
[Statedef 3100]
type=S
physics=N
movetype=A
anim=3100
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 0, SuperPause]
type = Playsnd
trigger1 = Animelem = 1
value = 3000,0
channel = 1

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(15) < 0
time = 1
value = SCA

[State 3000, Superpause FX]
type = helper
trigger1 = Time = 3
;helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -20, -90
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State -3,Super]
type = Helper
trigger1= Animelem = 6
id = 3117
name = "jumonjidiag"
pos = ceil(-25*const(size.xscale)),ceil(-133*const(size.yscale))
postype = P1
stateno = 3102
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime=999

[State -3,Super]
type = Helper
trigger1= Animelem = 6
id = 3113
name = "jumonjidiagrow2"
pos = ceil(-25*const(size.xscale)),ceil(-133-30*const(size.yscale))
postype = P1
stateno = 3102
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime=999

[State -3,Super]
type = Helper
trigger1= Animelem = 6
id = 3116
name = "jumonjidiag"
pos = ceil(-25+40*const(size.xscale)),ceil(-133-30*const(size.yscale))
postype = P1
stateno = 3102
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime=999

[State -3,Super]
type = Helper
trigger1= Animelem = 6
id = 3112
name = "jumonjidiagrow2"
pos = ceil(-25+40*const(size.xscale)),ceil(-133-60*const(size.yscale))
postype = P1
stateno = 3102
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime=999

[State -3,Super]
type = Helper
trigger1= Animelem = 6
id = 3115
name = "jumonjidiag"
pos = ceil(-25+80*const(size.xscale)),ceil(-133-60*const(size.yscale))
postype = P1
stateno = 3102
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime=999

[State -3,Super]
type = Helper
trigger1= Animelem = 6
id = 3111
name = "jumonjidiagrow2"
pos = ceil(-25+80*const(size.xscale)),ceil(-133-90*const(size.yscale))
postype = P1
stateno = 3102
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime=999

[State -3,Super]
type = Helper
trigger1= Animelem = 6
id = 3114
name = "jumonjidiagrow"
pos = ceil(-25+120*const(size.xscale)),ceil(-133-90*const(size.yscale))
postype = P1
stateno = 3102
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime=999

[State -3,Super]
type = Helper
trigger1= Animelem = 6
id = 3110
name = "jumonjidiagrow2"
pos = ceil(-25+120*const(size.xscale)),ceil(-133-120*const(size.yscale))
postype = P1
stateno = 3102
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime=999

[State 3000, Superpause]
type = superpause
trigger1 = Time = 1
time = 52
movetime = 52
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Pause]
type = Pause
trigger1 = time=1 && !fvar(11)
time = 52;+var(1)*2
movetime = 52

[State 3000, Width]
type = Width
trigger1 = AnimElem = 6
value = 32,0

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = time = 120
value = 3101
ctrl = 1

;Jumonji end
[statedef 3101]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 3101

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;jumonji rows ready
[Statedef 3102]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6025
sprpriority = 4

[State 1050, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SC, NP,AA, AT
time = -1

[State 1050, HitOverride]
type = HitOverride
trigger1 = 1
stateno = 1007
attr = SCA, AA, AP, AT
time = -1

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 900, 4]
type = ChangeState
triggerall = ishelper(3110)
trigger1 = time=33
value = 3103

[State 900, 4]
type = ChangeState
triggerall = ishelper(3111)
trigger1 = time=33+4
value = 3103

[State 900, 4]
type = ChangeState
triggerall = ishelper(3112)
trigger1 = time=33+8
value = 3103

[State 900, 4]
type = ChangeState
triggerall = ishelper(3113)
trigger1 = time=33+12
value = 3103

[State 900, 4]
type = ChangeState
triggerall = ishelper(3114)
trigger1 = time=33+16
value = 3103

[State 900, 4]
type = ChangeState
triggerall = ishelper(3115)
trigger1 = time=33+24
value = 3103

[State 900, 4]
type = ChangeState
triggerall = ishelper(3116)
trigger1 = time=33+28
value = 3103

[State 900, 4]
type = ChangeState
triggerall = ishelper(3117)
trigger1 = time=33+32
value = 3103

;Jumonji go
[Statedef 3103]
type = A
movetype = A
physics = N
ctrl = 0
velset = 6,8
;anim = 6025
sprpriority = 4

[State 1050, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SC, NP,AA, AT
time = -1

[State 1050, HitOverride]
type = HitOverride
trigger1 = 1
stateno = 1007
attr = SCA, AA, AP, AT
time = -1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1600,0

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1000,Projectile]
type = hitdef
trigger1 = time = 0
attr = S, SP
damage = 55,5
animtype = Medium
guardflag = MA
hitflag = MAF
pausetime = 2,4
sparkno = s7210+random%64
guard.sparkno = s7010
sparkxy = 20, 0
hitsound = S5,0
guardsound = S6,0
ground.type = Low
ground.slidetime = 15
guard.slidetime = 15
ground.hittime = 15
guard.hittime = 15
air.hittime = 13
ground.velocity = -3
guard.velocity = -3
airguard.velocity = -4
air.type = Low
air.velocity = -4,-6
yaccel = .5
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand=1
id = 30
ignorehitpause = 1

[State 1310]
type = varset
trigger1 = numtarget(30) && movehit
var(4) = target,id
ignorehitpause = 1

[State 1001, 3]
type = Changestate
trigger1 = Movehit = 1
value = 6035
IgnoreHitpause = 1

[State 1001, 3]
type = Changestate
trigger1 = Moveguarded = 1
value = 1007
IgnoreHitpause = 1

[State 1000, Land]
type= changestate
trigger1= vel y > 0
trigger1= pos y > -vel y
value = 6045

[State 4110, DestroySelf]
type = DestroySelf
triggerall = time > 2
trigger1 = FrontEdgeDist <= -40

; shuri hit
[Statedef 6035]
type = A
movetype= I
physics = N
velset = 0,0
anim = 6035
ctrl = 0
sprpriority = 2

[State 1310, 2]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x 
ignorehitpause = 1

[State 1310, 2]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x 
ignorehitpause = 1


[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

; shuri hit ground
[Statedef 6045]
type = A
movetype= I
physics = N
velset = 0,0
anim = 6035
ctrl = 0
sprpriority = 2

[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

; shuri hit
[Statedef 6036]
type = A
movetype= I
physics = N
velset = 0,0
anim = 6036
ctrl = 0
sprpriority = 2

[State 1310, 2]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x 
ignorehitpause = 1

[State 1310, 2]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x 
ignorehitpause = 1


[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

; shuri hit ground
[Statedef 6046]
type = A
movetype= I
physics = N
velset = 0,0
anim = 6036
ctrl = 0
sprpriority = 2

[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

; shuri hit
[Statedef 6037]
type = A
movetype= I
physics = N
velset = 0,0
anim = 6037
ctrl = 0
sprpriority = 2

[State 1310, 2]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x 
ignorehitpause = 1

[State 1310, 2]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x 
ignorehitpause = 1


[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

; shuri hit ground
[Statedef 6047]
type = A
movetype= I
physics = N
velset = 0,0
anim = 6037
ctrl = 0
sprpriority = 2

[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

;---------------------------------------------------------------------------
;MAX Super 2
[Statedef 3150]
type=S
physics=N
movetype=A
anim=3100
ctrl=0
velset=0,0
sprpriority=1
poweradd=-2000
facep2=1

[State 0, SuperPause]
type = Playsnd
trigger1 = Animelem = 1
value = 3000,0
channel = 1

[State 3050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
var(17) = 40

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
trigger1 = AnimElemTime(15) < 0
time = 1
value = SCA

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
;helpertype = Normal
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -20, -90
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 1
time = 52
moveTime = 52
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State -3,Super]
type = Helper
trigger1= Time=17
id = 3110
name = "jumonji"
stateno = 3110
ownpal = 1
pausemovetime=99

[State -3,Super]
type = Helper
trigger1= Time=17
id = 3111
name = "jumonji"
stateno = 3111
ownpal = 1
pausemovetime=99

[State -3,Super]
type = Helper
trigger1= Time=17
id = 3112
name = "jumonji"
stateno = 3112
ownpal = 1
pausemovetime=99

[State -3,Super]
type = Helper
trigger1= Time=17
id = 3113
name = "jumonji"
stateno = 3113
ownpal = 1
pausemovetime=99

[State -3,Super]
type = Helper
trigger1= Time=17
id = 3114
name = "jumonji"
stateno = 3114
ownpal = 1
pausemovetime=99

[State -3,Super]
type = Helper
trigger1= Time=17
id = 3115
name = "jumonji"
stateno = 3115
ownpal = 1
pausemovetime=99

[State -3,Super]
type = Helper
trigger1= Time=17
id = 3116
name = "jumonji"
stateno = 3116
ownpal = 1
pausemovetime=99

[State -3,Super]
type = Helper
trigger1= Time=17
id = 3117
name = "jumonji"
stateno = 3117
ownpal = 1
pausemovetime=99

[State 3000, Pause]
type = Pause
trigger1 = time=1 && !fvar(11)
time = 52;+var(1)*2
movetime = 52

[State 3000, Width]
type = Width
trigger1 = AnimElem = 6
value = 32,0

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = time = 120
value = 3101
ctrl = 1

;Jumonji1
[Statedef 3110]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = 4

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 0

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)*pi/180

[State 1204, Bind]
type = BindToParent
trigger1 = 1
pos = -floor(sin(fvar(0))*10), -floor(cos(fvar(0))*50)

[State 900, 4]
type = ChangeState
trigger1 = time=0
value = 3118

;Jumonji2
[Statedef 3111]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = 4

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 315

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)*pi/180

[State 1204, Bind]
type = BindToParent
trigger1 = 1
pos = -floor(sin(fvar(0))*10), -floor(cos(fvar(0))*50)

[State 900, 4]
type = ChangeState
trigger1 = time=0
value = 3118

;Jumonji3
[Statedef 3112]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = 4

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 270

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)*pi/180

[State 1204, Bind]
type = BindToParent
trigger1 = 1
pos = -floor(sin(fvar(0))*10), -floor(cos(fvar(0))*50)

[State 900, 4]
type = ChangeState
trigger1 = time=0
value = 3118

;Jumonji4
[Statedef 3113]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = 4

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 225

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)*pi/180

[State 1204, Bind]
type = BindToParent
trigger1 = 1
pos = -floor(sin(fvar(0))*10), -floor(cos(fvar(0))*50)

[State 900, 4]
type = ChangeState
trigger1 = time=0
value = 3118

;Jumonji5
[Statedef 3114]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = 4

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 180

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)*pi/180

[State 1204, Bind]
type = BindToParent
trigger1 = 1
pos = -floor(sin(fvar(0))*10), -floor(cos(fvar(0))*50)

[State 900, 4]
type = ChangeState
trigger1 = time=0
value = 3118

;Jumonji6
[Statedef 3115]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = 4

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 135

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)*pi/180

[State 1204, Bind]
type = BindToParent
trigger1 = 1
pos = -floor(sin(fvar(0))*10), -floor(cos(fvar(0))*50)

[State 900, 4]
type = ChangeState
trigger1 = time=0
value = 3118

;Jumonji7
[Statedef 3116]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 1001
sprpriority = 4

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 90

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)*pi/180

[State 1204, Bind]
type = BindToParent
trigger1 = 1
pos = -floor(sin(fvar(0))*10), -floor(cos(fvar(0))*50)

[State 900, 4]
type = ChangeState
trigger1 = time=0
value = 3118

;Jumonji8
[Statedef 3117]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 1001
sprpriority = 4

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = 45

[State 1204, VarSet]
type = VarSet
trigger1 = time = 0
fvar(0) = var(0)*pi/180

[State 1204, Bind]
type = BindToParent
trigger1 = 1
pos = -floor(sin(fvar(0))*10), -floor(cos(fvar(0))*50)

[State 900, 4]
type = ChangeState
trigger1 = time=0
value = 3118

;Jumonji wait
[Statedef 3118]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 1001
sprpriority = 4

[State 1050, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SC, NP,AA, AT
time = -1

[State 1050, HitOverride]
type = HitOverride
trigger1 = 1
stateno = 1007
attr = SCA, AA, AP, AT
time = -1

[State 1208, VarSet]
type = VarSet
trigger1 = 1
var(1) = (time*360)/200 + var(0)

[State 1208, VarSet]
type = VarSet
trigger1 = 1
var(1) = var(1)%360

[State 1208, VarSet]
type = VarSet
trigger1 = 1
fvar(0) = var(1)*pi/180

[State 1208, Bind]
type = BindToParent
trigger1 = 1
pos = -floor(sin(fvar(0))*10), -floor(cos(fvar(0))*40)-65

[State 1208, SprPriority]
type = SprPriority
trigger1 = 1
value = ifelse((var(1)=[0,180]), 3, -1)

[State 900, 4]
type = ChangeState
triggerall = ishelper(3110)
trigger1 = time=33+40
value = 3119

[State 900, 4]
type = ChangeState
triggerall = ishelper(3111)
trigger1 = time=33+45
value = 3119

[State 900, 4]
type = ChangeState
triggerall = ishelper(3112)
trigger1 = time=33+10
value = 3119

[State 900, 4]
type = ChangeState
triggerall = ishelper(3113)
trigger1 = time=33+15
value = 3119

[State 900, 4]
type = ChangeState
triggerall = ishelper(3114)
trigger1 = time=33+20
value = 3119

[State 900, 4]
type = ChangeState
triggerall = ishelper(3115)
trigger1 = time=33+25
value = 3119

[State 900, 4]
type = ChangeState
triggerall = ishelper(3116)
trigger1 = time=33+30
value = 3119

[State 900, 4]
type = ChangeState
triggerall = ishelper(3117)
trigger1 = time=33+35
value = 3119

;Jumonji go
[Statedef 3119]
type = S
movetype = A
physics = N
ctrl = 0
velset = 8,0
sprpriority = 4

[State 1050, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SC, NP,AA, AT
time = -1

[State 1050, HitOverride]
type = HitOverride
trigger1 = 1
stateno = 1007
attr = SCA, AA, AP, AT
time = -1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1600,0


[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1005, HitDef]
type = null;HitDef
trigger1 = 1
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)))), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pauseTime = 0, ifElse((Root, var(20)), 6, 12)
guard.pauseTime = 0, ifElse((Root, var(20)), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
;sprPriority = 3

[State 1000,Projectile]
type = hitdef
trigger1 = time = 0
attr = S, SP
damage = 40,5
animtype = Medium
guardflag = MA
hitflag = MAF
pausetime = 2,4
sparkno = s7210+random%64
guard.sparkno = s7010
sparkxy = 20, 0
hitsound = S5,0
guardsound = S6,0
ground.type = Low
ground.slidetime = 15
guard.slidetime = 15
ground.hittime = 15
guard.hittime = 15
air.hittime = 13
ground.velocity = -3
guard.velocity = -3
airguard.velocity = -1,-3
air.type = Low
air.velocity = -1,-3
yaccel = .5
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand=1
id = 30
ignorehitpause = 1

[State 1310]
type = varset
trigger1 = numtarget(30) && movehit
var(4) = target,id
ignorehitpause = 1



[State 1001, 3]
type = Changestate
trigger1 = Movehit = 1
value = 1006
IgnoreHitpause = 1

[State 1001, 3]
type = Changestate
trigger1 = Moveguarded = 1
value = 1007
IgnoreHitpause = 1


[State 4110, DestroySelf]
type = DestroySelf
triggerall = time > 2
trigger1 = FrontEdgeDist <= -40

;---------------------------------------------------------------------------
;Super 3
[Statedef 3300]
type=S
physics=S
movetype=A
anim=3300
ctrl=0
velset=0,0
sprpriority=1
poweradd=-3000
facep2=1

[State 3300, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3300, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3300, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3300, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3300, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3300, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3300, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3300, NotHitBy]
type = NotHitBy
trigger1 = !Time
time = 50
value = SCA

[State 3300, Superpause FX]
type = helper
trigger1 = Time = 3
helpertype = normal
stateno = 8520
ID = 8520
name = "Superpause FX"
postype = p1
pos = -60, -45
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1200, Snd]
type = playsnd
trigger1 = Animelem = 1
value = 3300,0
channel = 0

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 55
value = 2, 15
channel = 2

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 45
value = 1, 8
channel = 1

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 4000, NHB]
type = nothitby
trigger1 = time < 10
time = 1
value = SCA

[State 4000, Snd]
type = playsnd
trigger1 = animelemtime(1) > 1
value = 5, 6
persistent = 0

[State 4000, Miss]
type = hitdef
trigger1 = time
attr = S, HT
hitflag = 

[State 4000, Hit]
type = hitdef
trigger1 = time
trigger1 = !var(38)
attr = S, HT
hitflag = MAF
guardflag = MA
priority = 6, Miss
hitsound = -1 + 0 * (var(31) := 10)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8017)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -50
numhits = 0
sparkno = -1
p1facing = 1
p1stateno = 4001
fall = 1 
fall.recover = 0

[State 4000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 4001]
type = S
physics = N
movetype = A
anim = 4001
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4001, throw]
type = targetstate
trigger1 = !time
value = 1114002
[State 4001, throw]
type = targetfacing
trigger1 = !time
value = -1

[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0
[State 4001, grabsound]
type = playsnd
trigger1 = !time
value = 0, 800
[State 4001, Snd]
type = playsnd
trigger1 = !time
value = 5, 8

[State 4001, vsothers]
type = varset
trigger1 = !time
var(30) = 345

;NEED TO FINISH

[State 4001, Recover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
triggerall = (var(30) = [1, 99]) && numtarget
triggerall = target, life >= 0.33 * (target, lifemax)
trigger1 = (target, command = "x") || (target, command = "y") || (target, command = "z")
trigger2 = (target, command = "a") || (target, command = "b") || (target, command = "c")
trigger3 = (target, command = "up") || (target, command = "down") || (target, command = "back") || (target, command = "fwd")
var(30) = -1

[State 4001, preventrecover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
triggerall = (var(30) = [1, 98]) && numtarget
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
var(30) = 1

[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(30) < 100
text = " %d button presses to recover"
params = var(30)
[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(30) = 345
text = "Normal Damage"
[State 4001, Debug]
type = displaytoclipboard
trigger1 = var(30) = 456
text = "Extra Damage"

[State 4001, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
time = 2
movetime = 2
[State 4001, Push]
type = playerpush
trigger1 = 1
value = 0
[State 4001, nothitby]
type = nothitby
trigger1 = animelemtime(35) < 0
value = SCA
time = 1
[State 4001, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 4001, fadeout]
type = allpalfx
trigger1 = animelemtime(1) = 10
time = 30
sinadd = -255, -255, -255, 120
[State 4001, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
time = 4
value = 0, 0, 0

[State 4001, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
flag = nobardisplay
flag2 = noFG
[State 4001, spr]
type = sprpriority
trigger1 = animelemtime(35) >= 0
value = 1
[State 4001, Bind]
type = targetbind
trigger1 = animelemtime(35) < 0
pos = 45, 0

[State 4001, hitadd]
type = hitadd
triggerall = var(30) > 0
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 1

[State 4001, hitdamage]
type = targetlifeadd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = -17 -(var(30) = 456) * 4 + (!var(30)) * 12
;-ceil(ifelse((var(30) = 456), (target, lifemax * 0.8), (target, lifemax * 0.6)) / 33)
kill = animelem = 34
absolute = 1

[State 4001, givepower]
type = targetpoweradd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 36

[State 4001, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 2, ifelse(!var(30), 0, ifelse((animelem = 34), 10, 8))
channel = 2

[State 4001, Sparks]
type = helper 
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
stateNo =  8015
helperType = Normal
ID = 7000
sprpriority = 20
postype = p2
pos = ifElse(P2Dist X < 0, 0, ifElse(P2Dist X < 0, ceil(P2Dist X), 0)), ceil(P2Dist Y - 50)
;random = 60, 60
facing = -1
ownpal = 1
ontop = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 4001, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
time = 6
freq = 120
ampl = -4

[State 4001, Kanji]
type = explod
trigger1 = animelem = 35
anim = 6013
ID = 6013
sprpriority = 2
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, 32)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4001, Snd]
type = playsnd
trigger1 = animelemtime(40) = 0
value = 2, 15
channel = 0

[State 4001, throw]
type = targetstate
trigger1 = animelemtime(34) >= 0 && numtarget
value = 1114003
persistent = 0

[State 4001, interrupt]
type = changestate
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
trigger1 = !var(30) && numtarget
trigger2 = target, stateno = 1114010
value = 4009

[State 4001, End]
type = null;changestate
trigger1 = animelemtime(34) >= 0 && winko
value = 183

[State 4001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 1114002]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0
[State 1114002, Anim]
type = changeanim2
trigger1 = !time
value = 4002

[Statedef 1114003]
type = L
physics = C
movetype = H
velset = 0, 0
ctrl = 0
[State 1114003, Anim]
type = changeanim2
trigger1 = !time
value = 4003
[State 1114003, End]
type = selfstate
trigger1 = !alive
value = 5150
[State 1114003, End]
type = selfstate
trigger1 = time >= 97 && alive
value = 5120


;--- PLAYER ---
[Statedef 4009]
type = S
physics = S
movetype = H
anim = 5910
velset = -5, 0
ctrl = 0
[State 4009, target]
type = targetstate
trigger1 = !time && numtarget
value = 1114010
[State 4009, imageoff]
type = afterimagetime
trigger1 = 1
time = 0
[State 4009, Snd]
type = playsnd
trigger1 = !time
value = 5000, 4
channel = 0
[State 4009, Anim]
type = changeanim
trigger1 = anim = 5910 && time = 45
value = 5911

[State 4009, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8
[State 4009, Snd]
type = playsnd
trigger1 = !time
value = 7, 1
[State 4009, lightning]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4012
ID = 4012
postype = p1
pos = 0, -60
ownpal = 1
persistent = 0
pausemovetime = 99
supermovetime = 99

[State 4009, End]
type = changestate
trigger1 = anim = 5911 && !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 1114010]
type = S
physics = S
movetype = H
anim = 0
velset = -5, 0
ctrl = 0
[State 1114010, Anim]
type = changeanim
trigger1 = !time && selfanimexist(150)
value = 150
[State 1114010, Anim]
type = changeanim
trigger1 = anim = 150 && selfanimexist(140) && time >= 45
value = 140
[State 1114010, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8
[State 1114010, End]
type = selfstate
trigger1 = anim = 140 && !animtime
trigger2 = anim = 0 && time >= 54
value = 0
ctrl = 1


;--------------------------------------------
;Super 3 (Miss)
[Statedef 3301]
type = S
physics = S
movetype=I
ctrl = 0
anim = 3301
velset = 0,0
sprpriority=1

[State 3301, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 6603

[State 3301, RemoveExplod]
type = RemoveExplod
trigger1 = Time = 0
ID =6158

[State 3301, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3301, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3301, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------
;Super 3 (Hit)
[Statedef 3302]
type=S
physics=N
movetype=I
ctrl = 0
anim = 3302
movehitpersist = 1

[State 3302, RemoveExplod]
type = RemoveExplod
trigger1 = time = 0
id = 6603

[State 3302, RemoveExplod]
type = RemoveExplod
trigger1 = Time = 0
ID =6158

[State 3302, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3302, VelSet]
type = VelSet
trigger1 = !Time
X = 0
Y = 0

[State 3302, Velmul]
type = Velmul
trigger1 = !Time
x = .92

[State 3302, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3302, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 15
ampl = 8

[State 3302, VelMul]
type = VelMul
trigger1 = 1
x = .85

[State 3302, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = s3300,1
channel = 1

[State 3302, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = s3300,2
channel = 2

[State 3302, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3304
ID = 3304
pos = -100,0
postype = p1
bindtime = 1
removetime = -2
scale = .5,.5
sprpriority = 4
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0
ignorehitpause = 1

[State 3202, Helper]
type = Helper
trigger1 = AnimElem = 4
id = 3305
name = "Helper"
pos = -13,0
postype = P1
stateno = 3305
;helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
persistent = 0
size.xscale = .5
size.yscale = .5

[State 3302, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1







