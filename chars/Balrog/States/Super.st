; _________________________________________
;| Character by Author Name                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER MOVES>====
;==

;==<CRAZY BUFFALO>===
[Statedef 3000]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3000
poweradd = -1000
sprpriority = 2
facep2 = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = time <= 55
time = 1
value = SCA

[State 3000, No Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3000, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 50

[State 3000, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = (PrevStateNo = [1000,2999]) && var(6)

[State 3000, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(7)

[State 3000, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3000, Super Cancel Juggle Reset]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3000, SuperPause FX]
type = Helper
trigger1 = anim = 3000 && Time = 3
helperType = Normal
stateNo = 8500
ID = 8500
name = "Superpause FX"
posType = P1
pos = 32,-79
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = anim = 3000 && Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0
poweradd = 0

[State 0, VarSet]
type = VarSet
trigger1 = !time
v = 46
value = 0
[State 0, VarSet]
type = VarSet
triggerall = !AiLevel
trigger1 = command = "holda" 
trigger2 = command = "holdb" 
trigger3 = command = "holdc" 
v = 46
value = 1
[State 0, VarSet]
type = VarSet
triggerall = !AiLevel
trigger1 = command != "holda" && command = "rlsa" 
trigger2 = command != "holdb" && command = "rlsb" 
trigger3 = command != "holdc" && command = "rlsc"
v = 46
value = 0
[State 0, VarSet]
type = VarSet
triggerall = AiLevel
trigger1 = p2dist y >= 20
v = 46
value = 1

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 1200,0
channel = 5
[State 1200, PlaySnd]
type = PlaySnd
trigger1 = time = 52
value = 3000,0
channel = 5

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = animtime = 0
value = Ifelse(var(46),3002,3001)
elem = 1

[State 0, VelSet]
type = VelSet
trigger1 = anim = 3001 && animelem = 1
trigger2 = anim = 3002 && animelem = 1
x = 7

[State 1000, Dust Helper]
type = Helper
trigger1 = anim = 3001 && AnimElem = 1
trigger2 = anim = 3002 && AnimElem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Voice]
type = PlaySnd
trigger1 = anim = 3001 && AnimElem = 3
trigger2 = anim = 3002 && AnimElem = 3
value = 0,0
channel = 0

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = anim = 3001 && Animelem = 2
trigger2 = anim = 3002 && Animelem = 2
value = 1, 2

[State 1000, SFA Voice Snd]
type = PlaySnd
triggerall = anim != 3000 || anim != 3003
trigger1 = anim = 3001 && Animelem = 1
trigger2 = anim = 3002 && Animelem = 1
value = 3000, 1

[State 1000, Straight] 
type = HitDef
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = anim = 3001 && AnimElem = 3
attr = S, HA
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 54)), 8
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 10,16
guard.pausetime = 10,16
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 109), var(36) := -67
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, 0
air.velocity = -6,-5
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 1000, Upper] 
type = HitDef
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = anim = 3002 && AnimElem = 3
attr = S, HA
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 54)), 8
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 10,16
guard.pausetime = 10,16
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=56), var(36):=-77
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, 0
air.velocity = -4, -2
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 1000, Upper (Unhitten)] 
type = HitDef
triggerall = !movecontact
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = anim = 3002 && AnimElem = 4
attr = S, HA
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 54)), 8
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 10,16
guard.pausetime = 10,16
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=56), var(36):=-77
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, 0
air.velocity = -4, -2
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 72
value = 3003
ctrl = 0

;FINISH!
[Statedef 3003]
type = S
movetype = A
physics = N
anim = 3003
ctrl = 0
velset = 0,0
poweradd = 0
sprpriority = 2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 10

[State 1000, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 7
value = 1, 2

[State 1000, SFA Voice Snd]
type = PlaySnd
trigger1 = anim = 3003 && Animelem = 7
value = 3000, 1

[State 1000, Hit] 
type = HitDef
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = AnimElem = 8
attr = S, HA
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 54)), 8
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 10,10
guard.pausetime = 10,10
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 109), var(36) := -67
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, 0
air.velocity = -6,-5
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 1
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 8
physics = S         ;A,C,S,N
[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 9
movetype = I        ;I,A,H

[State 3000, End]
type = ChangeState
trigger1 = !Animtime
value = 0
ctrl = 1

;====<MAX CRAZY BUFFALO>=
[Statedef 3050]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3000
poweradd = -2000
sprpriority = 2
facep2 = 1

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = time <= 55
time = 1
value = SCA

[State 3050, No Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 50

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = (PrevStateNo = [1000,2999]) && var(6)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(7)

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle Reset]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, SuperPause FX]
type = Helper
trigger1 = anim = 3000 && Time = 3
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = P1
pos = 32,-79
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = anim = 3000 && Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0
poweradd = 0

[State 0, VarSet]
type = VarSet
trigger1 = !time
v = 46
value = 0
[State 0, VarSet]
type = VarSet
triggerall = !AiLevel
trigger1 = command = "holda" 
trigger2 = command = "holdb" 
trigger3 = command = "holdc" 
v = 46
value = 1
[State 0, VarSet]
type = VarSet
triggerall = !AiLevel
trigger1 = command != "holda" && command = "rlsa" 
trigger2 = command != "holdb" && command = "rlsb" 
trigger3 = command != "holdc" && command = "rlsc"
v = 46
value = 0
[State 0, VarSet]
type = VarSet
triggerall = AiLevel
trigger1 = p2dist y >= 20
v = 46
value = 1

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 1200,0
channel = 5
[State 1200, PlaySnd]
type = PlaySnd
trigger1 = time = 52
value = 3000,0
channel = 5

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = animtime = 0
value = Ifelse(var(46),3002,3001)
elem = 1

[State 0, VelSet]
type = VelSet
trigger1 = anim = 3001 && animelem = 1
trigger2 = anim = 3002 && animelem = 1
x = 7

[State 1000, Dust Helper]
type = Helper
trigger1 = anim = 3001 && AnimElem = 1
trigger2 = anim = 3002 && AnimElem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Voice]
type = PlaySnd
trigger1 = anim = 3001 && AnimElem = 3
trigger2 = anim = 3002 && AnimElem = 3
value = 0,0
channel = 0

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = anim = 3001 && Animelem = 2
trigger2 = anim = 3002 && Animelem = 2
value = 1, 2

[State 1000, SFA Voice Snd]
type = PlaySnd
triggerall = anim != 3000 || anim != 3003
trigger1 = anim = 3001 && Animelem = 1
trigger2 = anim = 3002 && Animelem = 1
value = 3000, 1

[State 1000, Straight] 
type = HitDef
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = anim = 3001 && AnimElem = 3
attr = S, HA
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 54)), 8
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 10,16
guard.pausetime = 10,16
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 109), var(36) := -67
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, 0
air.velocity = -6,-5
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 1000, Upper] 
type = HitDef
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = anim = 3002 && AnimElem = 3
attr = S, HA
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 54)), 8
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 10,16
guard.pausetime = 10,16
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=56), var(36):=-77
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, 0
air.velocity = -4, -2
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 1000, Upper (Unhitten)] 
type = HitDef
triggerall = !movecontact
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = anim = 3002 && AnimElem = 4
attr = S, HA
damage = ceil(ifElse(fvar(11) * 34 < 7, 7, fvar(11) * 54)), 8
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 10,16
guard.pausetime = 10,16
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=56), var(36):=-77
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, 0
air.velocity = -4, -2
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
air.fall = 1
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 92
value = 3003
ctrl = 0

;====<GIGATON BLOW>=
[Statedef 3100]
type = S
movetype= A
physics = N
velset = 0,0
ctrl = 0
anim = 3100
poweradd = -2000
sprpriority = 2
facep2 = 1

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = anim = 3100
time = 1
value = SCA

[State 3050, No Corner Push]
type = VarSet
trigger1 = Time = 3
fvar(5) = 0

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 50

[State 3050, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = (PrevStateNo = [1000,2999]) && var(6)

[State 3050, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(7)

[State 3050, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3050, Super Cancel Juggle Reset]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3050, SuperPause FX]
type = Helper
trigger1 = anim = 3100 && Time = 3
helperType = Normal
stateNo = 8510
ID = 8510
name = "Superpause FX"
posType = P1
pos = -35,-54
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownPal = 1

[State 3000, SuperPause]
type = SuperPause
trigger1 = anim = 3100 && Time = 3
time = 50
moveTime = 50
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0
poweradd = 0

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 3100,0
channel = 5
[State 1200, PlaySnd]
type = PlaySnd
trigger1 = time = 52
value = 3100,1
channel = 5

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = time = 52
value = 200,2
channel = 6

[State 0, VelSet]
type = VelSet
trigger1 = anim = 3100 && animelem = 12
x = 15

[State 1000, Dust Helper]
type = Helper
trigger1 = anim = 3100 && animelem = 12
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Voice]
type = PlaySnd
trigger1 = anim = 3100 && animelem = 13
value = 0,0
channel = 0

[State 1000, Swing Snd]
type = PlaySnd
trigger1 = anim = 3100 && animelem = 13
value = 1, 2

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 3100 && !animtime
value = 3101

[State 3100, Explod]
type = Explod
trigger1 = anim = 3101 && animelem = 1
anim = 3105
ID = 3105
pos = 65,-28
postype = p1
ownpal = 1
bindtime = -1
sprpriority = 3
supermovetime = -1
scale = 0.5 * Const(Size.xscale),0.5 * Const(Size.yscale)
removetime = -2
removeongethit = 1
ignorehitpause = 0
persistent = 0

[State 1000, Blow] 
type = HitDef
triggerall = anim = 3101
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = animelem = 2 || animelem = 4 || animelem = 6 || animelem = 8
attr = S, HA
damage = ceil(ifElse(fvar(11) * 17 < 7, 7, fvar(11) * 30)), 6
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 6,6
guard.pausetime = 6,6
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 109), var(36) := -67
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, 0
air.velocity = -6,-1
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 1000, Blow] 
type = HitDef
triggerall = anim = 3101
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = animelem = 1 || animelem = 3 || animelem = 5 || animelem = 7
attr = S, HA
damage = ceil(ifElse(fvar(11) * 17 < 7, 7, fvar(11) * 30)), 6
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 6,6
guard.pausetime = 6,6
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 109), var(36) := -67
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, 0
air.velocity = -6,-1
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 0
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 1000, Blow] 
type = HitDef
triggerall = anim = 3101
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = animelem = 9
attr = S, HA
damage = ceil(ifElse(fvar(11) * 17 < 7, 7, fvar(11) * 30)), 6
priority = 4, hit
animtype = Hard
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
pausetime = 6,6
guard.pausetime = 6,6
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 109), var(36) := -67
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -8, -3
air.velocity = -6,-1
guard.velocity = -10
airguard.velocity = -8, -3
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 1
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envShake.freq = 120

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 3101 && !animtime
value = 3102

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = anim = 3102
trigger1 = animelem = 1
statetype = S       ;S,A,C,L
movetype = A        ;I,A,H
physics = S         ;A,C,S,N

[State 0, ChangeState]
type = ChangeState
trigger1 = anim = 3102 && !animtime
value = 0
ctrl = 1

;-----------------------------------------------
;ULTIMATE WILD SMASH
[StateDef 3200]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
anim = 3200
powerAdd = -3000
faceP2 = 1

[state 3500,Posset]
type=posset
trigger1=!time
y=0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(9) < 0
time = 1
value = SCA

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

[State 3500, Super Pause FX]
type = Helper
trigger1 = Time = 3
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = -35,-54
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 43
moveTime = 43
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 3200,0
channel = 5
[State 1200, PlaySnd]
type = PlaySnd
trigger1 = time = 52
value = 3200,1
channel = 5

[State 0, VelAdd]
type = VelAdd
trigger1 = animelem = 7
x = 16

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = 1,5
channel = 1

[State 1000, Dust Helper]
type = Helper
trigger1 = AnimElem = 7
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, UPPAH!!!!] 
type = HitDef
trigger1 = !var(16) && (var(15)<15 || var(20))
trigger1 = animelem = 8
attr = S, HA
damage = ceil(ifElse(fvar(11) * 200 < 7, 7, fvar(11) * 420)), 32
priority = 4, hit
animtype = Up
getpower = 0
givepower = 35, 35
guardflag = MA
hitflag = MAF
hitsound = -1 + 0*(var(31):=10)
guardsound = -1 + 0*(var(32):=0)
pausetime = 32,32
guard.pausetime = 32,32
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 77), var(36) := -64
air.animtype = Up
fall.animtype = Up
ground.type = High
air.type = Low
ground.slidetime = 18
ground.hittime = 18
guard.hittime = 18
ground.velocity = -6, -16
air.velocity = -6,-5
guard.velocity = -15
airguard.velocity = -8, -6
airguard.ctrlTime = 16
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel = .58
fall = 1
air.fall = 1
fall.recover = 0
forcestand = 1
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 32
envshake.ampl = 18
envShake.freq = 120

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1