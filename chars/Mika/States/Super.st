; ________________________
;| R. Mika by DeathScythe |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;---------------------------------------------------------------------------
;Rainbow Hip Rush
[Statedef 3000]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=ifelse(var(53) > 0, 0, -1000)
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3000

[state 3000,Posset]
type=posset
trigger1=!time
y=0

;[State 3000, Button Detect]
;type = VarSet
;trigger1 = !Time && !AILevel
;var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

;[State 3000, Button Detect (AI)]
;type = VarSet
;trigger1 = !Time && AILevel
;var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

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

[State 3000, Superpause FX]
type = helper
trigger1 = !time
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -29, -80
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = !time
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = !time
value = 3000,0
channel = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = animelem = 6
trigger2 = animelem = 12
value = 4,0
channel = 0
[State 3000, Voice]
type = PlaySnd
trigger1 = animelem = 20
value = 1000,0
channel = 0

[State 3000, VelSet]
type = VelSet
trigger1 = animelem = 4
trigger2 = animelem = 10
x = ifelse(animelemtime(4)<1,3.5,7)

[State 3000, VelSet]
type = VelSet
trigger1 = animelem = 6
trigger2 = animelem = 12
x = 0

[State 3000, PlaySnd]
type = PlaySnd
trigger1 = animelem=6
trigger2 = animelem=12
value = 52,0

[State 3000, Dust]
type = explod
trigger1 = animelem=6
trigger2 = animelem=12
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
pos = 17,0

[State 3000, PosAdd]
type = PosAdd
trigger1 = animelem = 17
x = 20

[State 3000, Snd]
type = playsnd
trigger1 = animelem=20
value = 40, 0

[State 3000, Dust]
type = helper
trigger1 = animelem=20
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3000, VelSet]
type = VelSet
trigger1 = animelem=20
x = 4
y = -6

[State 3000, VelAdd]
type = VelAdd
trigger1 = animelemtime(20)>0
y = .6

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 20
statetype = A
physics = N

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(20)>0
statetype = A
movetype = A
physics = N

[State 3000, Hit]
type=hitdef
trigger1= animelem = 7
trigger2= animelem = 13
attr = S,HA
hitflag = MAF
guardflag = M
damage = 40,10
getpower = 0,0
givepower = 36,36
pausetime = 6,6
guard.pausetime = 6,6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-69
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 3000, Hit]
type=hitdef
trigger1= animelem = 21
trigger2= animelem = 22
attr = S,HA
hitflag = MAF
guardflag = M
damage = 48,12
getpower = 0,0
givepower = 36,36
pausetime = 6,6
guard.pausetime = 6,6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -4, -7
ground.cornerPush.velOff = 0
guard.velocity = -4
guard.cornerPush.velOff = 0
air.velocity = -4, -7
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-69
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 3000, ChangeState]
type = ChangeState
trigger1 = pos Y >= 30
trigger1 = vel Y > 0
value = 1101
ctrl = 0

;---------------------------------------------------------------------------
;MAX Rainbow Hip Rush
[StateDef 3050]
type=S
movetype=A
physics=N
poweradd=ifelse(var(53) > 0, -1000, -2000)
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3050, Anim]
type=changeanim
trigger1=!time
value=3050

[state 3050,Posset]
type=posset
trigger1=!time
y=0

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

[State 3050, Super Pause FX]
type = Helper
trigger1 = Time = 3
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = -29, -80
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3050, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = !time
value = 3000,0
channel = 0

[State 3050, Voice]
type = PlaySnd
trigger1 = animelem = 6
trigger2 = animelem = 12
value = 4,0
channel = 0
[State 3050, Voice]
type = PlaySnd
trigger1 = animelem = 18
value = 4,1
channel = 0
[State 3050, Voice]
type = PlaySnd
trigger1 = animelem = 26
trigger2 = animelem = 32
value = 1000,0
channel = 0

[State 3050, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 3.5
[State 3050, VelSet]
type = VelSet
trigger1 = animelem = 10
x = 7
[State 3050, VelSet]
type = VelSet
trigger1 = animelem = 16
x = 2
[State 3050, VelSet]
type = VelSet
trigger1 = animelem = 26
x = 5

[State 3050, VelSet]
type = VelSet
trigger1 = animelem = 6
trigger2 = animelem = 12
trigger3 = animelem = 22
trigger4 = animelem = 29
x = 0

[State 3050, PlaySnd]
type = PlaySnd
trigger1 = animelem=6
trigger2 = animelem=12
trigger3 = animelem=22
trigger4 = animelem=29
value = 52,0

[State 3050, Dust]
type = explod
trigger1 = animelem=6
trigger2 = animelem=12
trigger3 = animelem=22
trigger4 = animelem=29
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
pos = 0,0

[State 3050, PosAdd]
type = PosAdd
trigger1 = animelem = 23
;trigger2 = animelem = 29
x = 20

[State 3050, Snd]
type = playsnd
trigger1 = animelem=33
value = 40, 0

[State 3050, Dust]
type = helper
trigger1 = animelem=33
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3050, VelSet]
type = VelSet
trigger1 = animelem=32
x = 4
y = -6

[State 3050, VelAdd]
type = VelAdd
trigger1 = animelemtime(32)>0
y = .5

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 32
statetype = A
physics = N

[State 3050, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(32)>0
statetype = A
movetype = A
physics = N

[State 3050, Hit]
type=hitdef
trigger1= animelem = 7
trigger2= animelem = 13
attr = S,HA
hitflag = MAF
guardflag = M
damage = 40,10
getpower = 0,0
givepower = 36,36
pausetime = 6,6
guard.pausetime = 6,6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -1.5, -5.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-69
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 3050, Hit]
type=hitdef
trigger1= animelem = 19
attr = S,HA
hitflag = MAF
guardflag = M
damage = 40,10
getpower = 0,0
givepower = 36,36
pausetime = 6,6
guard.pausetime = 6,6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -4.86
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=54), var(36):=-57
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 3050, Hit]
type=hitdef
trigger1= animelem = 27
trigger2= animelem = 28
attr = S,HA
hitflag = MAF
guardflag = M
damage = 48,12
getpower = 0,0
givepower = 36,36
pausetime = 6,6
guard.pausetime = 6,6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -4
guard.cornerPush.velOff = 0
air.velocity = -2.5, -5.5
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-69
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 3050, Hit]
type=hitdef
trigger1= animelem = 33
trigger2= animelem = 34
attr = S,HA
hitflag = MAF
guardflag = M
damage = 48,12
getpower = 0,0
givepower = 36,36
pausetime = 8,8
guard.pausetime = 6,6
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -4, -8
ground.cornerPush.velOff = 0
guard.velocity = -4
guard.cornerPush.velOff = 0
air.velocity = -4, -8
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-69
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 3050, ChangeState]
type = ChangeState
trigger1 = pos Y >= 30
trigger1 = vel Y > 0
value = 1101
ctrl = 0


;---------------------------------------------------------------------------
;Heavenly Dynamite
[Statedef 3100]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=ifelse(var(53) > 0, 0, -1000)
facep2=1

[State 3100, Anim]
type=changeanim
trigger1=!time
value=3100

[state 3100,Posset]
type=posset
trigger1=!time
y=0

[State 3100, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3100, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3100, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3100, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3100, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3100, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3100, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3100, Superpause FX]
type = helper
trigger1 = !time
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -66
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Superpause]
type = superpause
trigger1 = !time
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
attr=S,HT
hitflag=M
priority = 4, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=3101

[State 3100, Snd]
type=playsnd
trigger1= animelem=3
value=800,0
channel=0

[State 3100, Snd]
type=playsnd
trigger1= animelem=3
value=1,0
channel=1

[State 3100, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 3100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---SUCCESS---
[Statedef 3101]
type = S
movetype= A
physics = N
velset = 0,0
anim = 3101

[State 3101, ChangeState]
type = ChangeState
trigger1 = !time && !numtarget
value = 0
ctrl = 1

[State 3101, TargetFacing]
type = TargetFacing
trigger1 = !time
value = -1

[State 3101, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3101, TargetState]
type = TargetState
trigger1= !Time && NumTarget
value = 855

[State 3101, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = 1
pos = 20,0

[State 3101, Timer Start]
type = VarSet
trigger1 = !Time
var(44) = 135

[State 3101, Timer End (Round Over)]
type = VarSet
trigger1 = RoundState != 2
var(44) = 0

[State 3101, Timer Countdown]
type = VarAdd
trigger1 = HitCount
var(44) = -1

[State 3101, Timer]
type = VarAdd
triggerAll = NumTarget && HitCount
trigger1 = Target, command = "x" || Target, command = "y" || Target, command = "z"
trigger2 = Target, command = "a" || Target, command = "b" || Target, command = "c"
trigger3 = Target, command = "up" || Target, command= "down" || Target, command = "back" || Target, command = "fwd"
var(44) = -1

[State 3101, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 3101, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 3101, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = (command = "up" || command = "down" || command = "back" || command = "fwd")
var(42) = 2

[State 3101, Mashing Increment]
type = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 3101, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 3101, Anim Skip]
type = ChangeAnim
triggerall = var(44) > 0
trigger1 = AnimElemTime(AnimElemNo(0)) >= 0 && AnimElemTime(3) < 0
trigger1 = AnimElemTime(AnimElemNo(0) +1 ) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + AnimElemTime(AnimElemNo(0) + 1))
value = 3101
elem = AnimElemNo(0) + 1

[State 3101, Anim Skip]
type = ChangeAnim
triggerAll = var(44) > 0
trigger1 = AnimElemTime(3)>0
trigger1 = AnimElemTime(3)>=(8 - var(12))
trigger1 = 1 || var(12) := (var(12) + 8 - AnimElemTime(3))
value = 3101
elem = 1

[State 3101, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 72, 72, 72

[State 3101, TargetState]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElem = 3
value = 856

[State 3101, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(12 * fvar(11) < 7, -7, -12 * fvar(11)))
kill = 0

[State 3101, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3
value = 36

[State 3101, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 3101, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 3101, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,5
channel = 0

[State 3101, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 3
value = 2,2

[State 3101, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = 18, -73
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3101, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 3
time = 18
ampl = 6
freq = 120

[State 3101, End]
type = ChangeState
trigger1 = var(44) <= 0
trigger1 = !Animtime
trigger2 = NumTarget
trigger2 = !(Target, Alive)
trigger3 = Time >= 100
value = 3102


;---2---
[StateDef 3102]
type = S
physics = N
moveType = A
anim = 3102
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3102, SprPriority]
type = SprPriority
trigger1 = !time
value = -1

[State 3102, Width]
type = Width
trigger1 = 1
edge = 40, 0

[State 3102, Bind]
type = TargetBind
trigger1 = AnimElemTime(4) < 0 
trigger1 = NumTarget
pos = 40,0

[State 3102, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 4
value = floor(ifElse(36 * fvar(11) < 7, -7, -36 * fvar(11)))
kill = 0

[State 3102, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4 
time = 18
ampl = 6
freq = 120

[State 3102, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 4
value = 1

[State 3102, TargetState]
type = TargetState
trigger1 = NumTarget && AnimElem = 4
value = 3110

[State 3102, Helper];Dizzy FX
type = Helper
trigger1 = NumTarget && EnemyNear,Anim = 5300 && NumHelper(3111)<1
stateno = 3111
ID = 3111
postype = p2
ignorehitpause = 1

[State 3102, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,4
channel = 0

[State 3102, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 3102, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 4
value = 2,2
channel = 2

[State 3102, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 4
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = 64,-68
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3102, PosAdd]
type = PosAdd
trigger1 = animelem = 12
x = 70

[State 3102, TargetState]
type = TargetState
trigger1 = animelem = 12
trigger1 = NumTarget
value = 1313

[State 3102, SprPriority]
type = SprPriority
trigger1 = animelem = 12
value = 1

[State 3102, Bind]
type = TargetBind
trigger1 = animelemtime(12)>=0
trigger1 = NumTarget
pos = -10,-70

[State 3102, Voice]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1300,0
channel = 0

[State 3102, VelSet]
type = VelSet
trigger1 = animelem = 16
x = -3.5

[State 3102, VelSet]
type = VelSet
trigger1 = animelem = 17
y = -10

[State 3102, VelAdd]
type = VelAdd
trigger1 = animelemtime(17)>0
y = .53

[State 3102, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 17
statetype = A
physics = N

[State 3102, ChangeState]
type = ChangeState
trigger1 = pos Y >= 45
;trigger1 = vel Y > 0
value = 3103
ctrl = 0

;---END---
[Statedef 3103]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 3103,Posset]
type=posset
trigger1=!time
y=0

[State 3103, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 3103

[State 3103, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = !time
value = 1314

[State 3103, TargetBind]
type = TargetBind
trigger1 = !time
pos = 35,0

[State 3103, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !time
value = floor(ifElse(48 * fvar(11) < 7, -7, -48 * fvar(11)))
kill = 1

[State 3103, EnvShake]
type = EnvShake
trigger1 = !time
time = 18
ampl = 6
freq = 120

[State 3103, HitAdd]
type = HitAdd
trigger1 = NumTarget && !time
value = 1

[State 3103, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 2,5

[State 3103, Helper]
type = Helper
trigger1 = !time
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = 35,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 3103, Voice]
type = PlaySnd
trigger1 = animelem = 7
value = 4,4
channel = 0

[State 3103, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---TARGET DIZZY---
[Statedef 3110]
type = S
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 3110, 1]
type = ChangeAnim2
trigger1 = !Time
value = 856

[State 3110, VelSet]
type = VelSet
trigger1 = !time
x = -7

[State 3110, VelAdd]
type = VelAdd
trigger1 = vel X<0
x = .5

[State 3110, ChangeAnim]
type = ChangeAnim
trigger1 = time = 12
value = 5300

[State 3110, Safety]
type=selfstate
trigger1= time>=120
value= ifelse(pos y<0, 5040, 0)
ctrl=1


;-----------------------------------------------
; MAX Heavenly Dynamite
[StateDef 3150]
type=S
movetype=A
physics=N
poweradd=ifelse(var(53) > 0, -1000, -2000)
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3150, Anim]
type=changeanim
trigger1=!time
value=3100

[state 3150,Posset]
type=posset
trigger1=!time
y=0

[State 3150, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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

[State 3050, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

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

[State 3150, Super Pause FX]
type = Helper
trigger1 = Time = 3
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 0, -66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3150, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3150, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
attr=S,HT
hitflag=M
priority = 5, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=3151

[State 3150, Snd]
type=playsnd
trigger1= animelem=3
value=800,0
channel=0

[State 3150, Snd]
type=playsnd
trigger1= animelem=3
value=1,0
channel=1

[State 3150, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 3150, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---SUCCESS---
[Statedef 3151]
type = S
movetype= A
physics = N
velset = 0,0
anim = 3101

[State 3151, ChangeState]
type = ChangeState
trigger1 = !time && !numtarget
value = 0
ctrl = 1

[State 3151, TargetFacing]
type = TargetFacing
trigger1 = !time
value = -1

[State 3151, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3151, TargetState]
type = TargetState
trigger1= !Time && NumTarget
value = 855

[State 3151, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = 1
pos = 20,0

[State 3151, Timer Start]
type = VarSet
trigger1 = !Time
var(44) = 135

[State 3151, Timer End (Round Over)]
type = VarSet
trigger1 = RoundState != 2
var(44) = 0

[State 3151, Timer Countdown]
type = VarAdd
trigger1 = HitCount
var(44) = -1

[State 3151, Timer]
type = VarAdd
triggerAll = NumTarget && HitCount
trigger1 = Target, command = "x" || Target, command = "y" || Target, command = "z"
trigger2 = Target, command = "a" || Target, command = "b" || Target, command = "c"
trigger3 = Target, command = "up" || Target, command= "down" || Target, command = "back" || Target, command = "fwd"
var(44) = -1

[State 3151, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 3151, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 3151, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = (command = "up" || command = "down" || command = "back" || command = "fwd")
var(42) = 2

[State 3151, Mashing Increment]
type = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 3151, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 3151, Anim Skip]
type = ChangeAnim
triggerall = var(44) > 0
trigger1 = AnimElemTime(AnimElemNo(0)) >= 0 && AnimElemTime(3) < 0
trigger1 = AnimElemTime(AnimElemNo(0) +1 ) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + AnimElemTime(AnimElemNo(0) + 1))
value = 3101
elem = AnimElemNo(0) + 1

[State 3151, Anim Skip]
type = ChangeAnim
triggerAll = var(44) > 0
trigger1 = AnimElemTime(3)>0
trigger1 = AnimElemTime(3)>=(8 - var(12))
trigger1 = 1 || var(12) := (var(12) + 8 - AnimElemTime(3))
value = 3101
elem = 1

[State 3151, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 72, 72, 72

[State 3151, TargetState]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElem = 3
value = 856

[State 3151, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(18 * fvar(11) < 7, -7, -18 * fvar(11)))
kill = 0

[State 3151, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3
value = 36

[State 3151, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 3151, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 3151, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,5
channel = 0

[State 3151, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 3
value = 2,2

[State 3151, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = 18, -73
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3151, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 3
time = 18
ampl = 6
freq = 120

[State 3151, End]
type = ChangeState
trigger1 = var(44) <= 0
trigger1 = !Animtime
trigger2 = NumTarget
trigger2 = !(Target, Alive)
trigger3 = Time >= 150
value = 3152


;---2---
[StateDef 3152]
type = S
physics = N
moveType = A
anim = 3152
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 3152, SprPriority]
type = SprPriority
trigger1 = !time
value = -1

[State 3152, Width]
type = Width
trigger1 = 1
edge = 40, 0

[State 3152, Bind]
type = TargetBind
trigger1 = AnimElemTime(4) < 0 
trigger1 = NumTarget
pos = 40,0

[State 3152, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 4
value = floor(ifElse(42 * fvar(11) < 7, -7, -42 * fvar(11)))
kill = 0

[State 3152, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4 
time = 18
ampl = 6
freq = 120

[State 3152, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 4
value = 1

[State 3152, TargetState]
type = TargetState
trigger1 = NumTarget && AnimElem = 4
value = 3110

[State 3102, Helper];Dizzy FX
type = Helper
trigger1 = NumTarget && EnemyNear,Anim = 5300 && NumHelper(3111)<1
stateno = 3111
ID = 3111
postype = p2
ignorehitpause = 1

[State 3152, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,4
channel = 0

[State 3152, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 3152, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 4
value = 2,2
channel = 2

[State 3152, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 4
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = 64,-68
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3152, PosAdd]
type = PosAdd
trigger1 = animelem = 12
x = 70

[State 3152, TargetState]
type = TargetState
trigger1 = animelem = 12
trigger1 = NumTarget
value = 1313

[State 3152, SprPriority]
type = SprPriority
trigger1 = animelem = 12
value = 1

[State 3152, Bind]
type = TargetBind
trigger1 = animelemtime(12)>=0
trigger1 = NumTarget
pos = -10,-70

[State 3152, Voice]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1300,0
channel = 0

[State 3152, VelSet]
type = VelSet
trigger1 = animelem = 16
x = -3.5

[State 3152, VelSet]
type = VelSet
trigger1 = animelem = 17
x = -BackEdgeBodyDist / 14
y = -10

[State 3152, ScreenBound]
type = ScreenBound
trigger1 = animelemtime(17)>=0
value = 0
movecamera = 0,0

[State 3152, VelAdd]
type = VelAdd
trigger1 = animelemtime(17)>0
y = .53

[State 3152, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 17
statetype = A
physics = N

[State 3152, ChangeState]
type = ChangeState
trigger1 = BackEdgeBodyDist <= -10
value = 3153
ctrl = 0

;---RING---
[Statedef 3153]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1

[State 3153, Helper]
type = Helper
trigger1 = !time
ID = 3171
stateno = 3171
pos = -80,0
postype = left
facing = 1

[State 3153, Helper]
type = Helper
trigger1 = !time
ID = 3171
stateno = 3172
pos = 80,0
postype = right
facing = -1

[state 3153,Posset]
type = PosSet
trigger1= !Time
y = -34
x = BackEdgeDist-320*facing

[State 3153, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 3153

[State 3153, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = !time
value = 3160

[State 3153, TargetBind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelemtime(1)>=0 && animelemtime(2)<0
pos = 8,-94

[State 3153, TargetBind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelemtime(2)>=0 && animelemtime(3)<0
pos = 18,-95

[State 3153, TargetBind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelemtime(3)>=0 && animelemtime(4)<0
pos = 26,-90

[State 3153, TargetBind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelemtime(4)>=0 && animelemtime(5)<0
pos = 40,-95

[State 3153, TargetBind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelemtime(5)>=0
pos = 38,-77

[State 3153, Helper]
type = Helper
trigger1 = !time
helpertype = normal ;player
name = "Ring"
ID = 3170
stateno = 3170 
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 3153, ScreenBound]
type = ScreenBound
trigger1 = time < 130
value = 0
movecamera = 0,0

[State 3153, VelSet]
type = VelSet
trigger1 = !time
x = 7.5

[State 3153, VelSet]
type = VelSet
trigger1 = BackEdgeDist >= 35 && AnimElemTime(1)<60
x = 0

[State 3153, VelSet]
type = VelSet
trigger1 = animelem = 5
x = 4.2
y = -10

[State 3153, VelAdd]
type = VelAdd
trigger1 = animelemtime(5)>0
y = .6

[State 3153, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0 && vel Y > 0
value = 3154
ctrl = 0


;---END---
[Statedef 3154]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 3154,Posset]
type=posset
trigger1=!time
y=0

[State 3154, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 3154

[State 3154, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = !time
value = 3161

[State 3154, TargetBind]
type = TargetBind
triggerall = NumTarget
trigger1 = !time
pos = 50,0

[State 3154, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !time
value = floor(ifElse(54 * fvar(11) < 7, -7, -54 * fvar(11)))
kill = 1

[State 3154, EnvShake]
type = EnvShake
trigger1 = !time
time = 18
ampl = 6
freq = 120

[State 3154, HitAdd]
type = HitAdd
trigger1 = NumTarget && !time
value = 1

[State 3154, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 2,5

[State 3154, Helper]
type = Helper
trigger1 = !time
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = 50,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 3154, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---TARGET---
[StateDef 3160]
type = A
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 3160, ScreenBound]
type = ScreenBound
trigger1 = time<130
value = 0
movecamera = 0,0

[State 3160, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 3160


;---TARGET END---
[StateDef 3161]
type = A
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[state 3161,Posset]
type=posset
trigger1=!time
y=0

[State 3161, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 3161

[State 3161, Turn]
type = Turn
trigger1 = !time

[State 3161, Gravity]
type = VelAdd
trigger1 = animelemtime(2)>0
y = .5

[State 3161, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 4
y = -8

[State 3161, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;---------------------------------------------------------------------------
; Sardine's Beach
[Statedef 3200]
type=S
physics=N
movetype=I
ctrl=0
velset=0,0
sprpriority=1
poweradd=ifelse(var(53) > 0, 0, -1000)
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3200

[state 3000,Posset]
type=posset
trigger1=!time
y=0

[State 3000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 2

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

[State 3000, Superpause FX]
type = helper
trigger1 = !time
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 14, -78
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = !time
time = 40
movetime = 0
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = !Time 
value = 1300,0
channel = 0

[State 3200, VarSet]
type = VarSet
trigger1 = !Time
var(2) = 120
ignorehitpause = 1

[State 3200, ChangeState]
type = ChangeState
trigger1 = Time > 0
value = 3201


;-----------------------------------------------
; Max Sardine's Beach
[StateDef 3250]
type=S
movetype=I
physics=N
poweradd=ifelse(var(53) > 0, -1000, -2000)
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3200, Anim]
type=changeanim
trigger1=!time
value=3200

[state 3200,Posset]
type=posset
trigger1=!time
y=0

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

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
trigger1 = !Time
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = !Time && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

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

[State 3200, Super Pause FX]
type = Helper
trigger1 = !Time
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = P1
pos = 14, -78
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = !Time
time = 40
moveTime = 0
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3200, Voice]
type = PlaySnd
trigger1 = !Time 
value = 1300,0
channel = 0

[State 3200, VarSet]
type = VarSet
trigger1 = !Time
var(2) = 180
ignorehitpause = 1

[State 3200, ChangeState]
type = ChangeState
trigger1 = Time > 0
value = 3201


;---RUNNING---
[Statedef 3201]
type=S
movetype=I
physics=N
poweradd=0
ctrl=0
velset=5,0
sprpriority=1

[State 3201, Anim]
type=changeanim
trigger1=!time
value=3200

[state 3201,Posset]
type=posset
trigger1=!time
y=0

[State 3201, Step Sound]
type = PlaySnd
triggerall = Anim = 3200
trigger1 = (AnimElem = 4 || AnimElem = 9)
value = 100, ifElse((AnimElem = 4), 0, 1)

[State 3201, VarAdd]
type = VarAdd
trigger1 = 1
v = 2
value = -1

[State 3201, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 3201, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
flag2 = nowalk

[State 3201, ChangeState]
type = ChangeState
triggerall = Time >= 1
trigger1 = !AILevel && command = "holdback" && BackEdgeDist > 60
trigger2 = FrontEdgeDist < 30
;trigger3 = AILevel && random < 20
value = 3202

[State 3201, ChangeState]
type = ChangeState
triggerall = Time >= 1
trigger1 = !AILevel && (command = "a" || command = "b" || command = "c")
trigger2 = AILevel && random < 50
trigger3 = AILevel && P2MoveType = A && random < 25
trigger4 = P2StateType != A && (P2BodyDist X = [-25,25])
value = 3210

[State 3201, ChangeState]
type = ChangeState
triggerall = Time >= 1
trigger1 = !AILevel && command = "x"
value = 3220

[State 3201, ChangeState]
type = ChangeState
triggerall = Time >= 1
trigger1 = !AILevel && command = "y"
value = 3221

[State 3201, ChangeState]
type = ChangeState
triggerall = Time >= 1
trigger1 = !AILevel && command = "z"
value = 3222

[State 0, ChangeState]
type = ChangeState
triggerall = AILevel && Time >= 1
trigger1 = P2BodyDist X < 60 && P2MoveType != H && P2StateType != L
trigger1 = P2StateType = A
value = 3220
[State 0, ChangeState]
type = ChangeState
triggerall = AILevel && Time >= 1
trigger1 = P2BodyDist X < 60 && P2MoveType != H && P2StateType != L
trigger1 = P2StateType = S
value = 3221
[State 0, ChangeState]
type = ChangeState
triggerall = AILevel && Time >= 1
trigger1 = P2BodyDist X < 60 && P2MoveType != H && P2StateType != L
trigger1 = P2StateType = C
value = 3222

[State 3201, ChangeState]
type = ChangeState
trigger1 = var(2)<1
value = 3203


;---TURN---
[Statedef 3202]
type=S
movetype=I
physics=S
poweradd=0
ctrl=0
velset=4,0
sprpriority=1

[State 3202, Anim]
type=changeanim
trigger1=!time
value=3202

[state 3202,Posset]
type=posset
trigger1=!time
y=0

[State 100, Step Sound]
type = PlaySnd
triggerall = Anim = 3205
trigger1 = AnimElem = 1
value = 100, ifElse(random<500, 0, 1)

[State 3202, VarAdd]
type = VarAdd
trigger1 = 1
v = 2
value = -1

[State 3202, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 3202, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
flag2 = nowalk

[State 3202, Turn]
type = Turn
trigger1 = !Time

[State 3202, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3201


;---STOP---
[Statedef 3203]
type=S
movetype=I
physics=S
poweradd=0
ctrl=0
sprpriority=1

[State 3203, Anim]
type=changeanim
trigger1=!time
value=3203

[state 3203,Posset]
type=posset
trigger1=!time
y=0

[State 101, Snd]
type = playsnd
trigger1 = !time
value = 101,0

[State 101, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
pos = 25, 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3203, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 3203, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
flag2 = nowalk

[State 3203, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
; Tobikoshi
[Statedef 3210]
type=A
movetype=A
physics=N
poweradd=0
ctrl=0
sprpriority=1

[State 3203, Anim]
type=changeanim
trigger1=!time
value=3210

[state 3203,Posset]
type=posset
trigger1=!time
y=0

[State 3202, VarAdd]
type = VarAdd
trigger1 = 1
v = 2
value = -1

[State 3203, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 3203, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
flag2 = nowalk

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = 2.5
y = -6.5

[State 0, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,0
channel = 0

[State 1100, Snd]
type = PlaySnd
trigger1 = !Time
value = 40, 0

[State 1100, Dust]
type = helper
trigger1 = !time
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 0, Gravity]
type = Gravity
trigger1 = pos Y < 0

[State 0, HitDef]
type = HitDef
trigger1 = !time
attr = A,HT
hitflag = M-
priority = 1, miss
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 3211
;p2stateno = 
kill = 0
numhits = 0

[State 3203, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0 && vel Y > 0
value = 3212


;---2---
[Statedef 3211]
type=A
movetype=I
physics=N
poweradd=0
ctrl=0
sprpriority=1
velset = 0,0

[State 3203, Anim]
type=changeanim
trigger1=!time
value=3211

[State 0, PosSet]
type = PosSet
trigger1 = !Time
x = ((Target,Pos X) - (facing * (Target,Const(size.head.pos.x))))
y = ((Target,Pos Y) + (Target,Const(size.head.pos.y)))

[State 3202, VarAdd]
type = VarAdd
trigger1 = 1
v = 2
value = -1

[State 3203, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 3203, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
flag2 = nowalk

[State 0, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 2.5
y = -6

[State 3203, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3201

[State 0, Gravity]
type = Gravity
trigger1 = AnimElemTime(3)>0

[State 3203, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0 && vel Y > 0
value = 3212


;---LANDING---
[Statedef 3212]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0

[state 1001,Posset]
type=posset
trigger1=!time
y=0

[State 1001, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 3212

[State 3201, VarAdd]
type = VarAdd
trigger1 = 1
v = 2
value = -1

[State 3203, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 3203, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
flag2 = nowalk

[State 1001, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 52,0

[State 1001, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1001, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3201


;-----------------------------------------------
; Dageki: J. Ocean Drop Kick
[StateDef 3220]
type = S
physics = N
moveType = A
ctrl = 0
sprpriority = 1
powerAdd = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3220

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3201, VarAdd]
type = VarAdd
trigger1 = 1
v = 2
value = -1

[State 0, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,0
channel = 0

[State 0, Woosh]
type = PlaySnd
trigger1 = !Time
value = 1,5

[State 0, VelMul]
type = VelMul
trigger1 = vel X > 0
x = .93

[State 0, HitDef]
type = HitDef
trigger1 = !Time
attr = S,HA
hitflag = MAF
guardflag = M
animtype = Back
priority = 5,Hit
damage = ifelse(var(10)=3,174,114),ifelse(var(10)=3,43,28)
pausetime = 12,12
getpower = 0,0
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -4,-3
air.velocity = -4,-3
fall = 1
fall.recover = 0
kill = 0;ifelse(var(10)=3,0,1)
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-75
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 0, TargetState]
type = TargetState
;triggerall = var(10)=3
trigger1 = NumTarget && MoveHit
value = 3260
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = ifelse(MoveHit,3230,3201)

[State 0, VarSet]
type = VarSet
trigger1 = MoveContact
var(2) = 0
ignorehitpause = 1


;-----------------------------------------------
; Dageki: Mika Sliding
[StateDef 3221]
type = C
physics = N
moveType = A
ctrl = 0
sprpriority = 1
powerAdd = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3221

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3201, VarAdd]
type = VarAdd
trigger1 = 1
v = 2
value = -1

[State 0, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,0
channel = 0

[State 0, Woosh]
type = PlaySnd
trigger1 = !Time
value = 1,5

[State 0, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 7

[State 0, VelMul]
type = VelMul
triggerall = vel X > 0
trigger1 = AnimElemTime(2) > 0
x = .93

[State 0, HitDef]
type = HitDef
trigger1 = !Time
attr = C,HA
hitflag = MAF
guardflag = L
animtype = Hard
priority = 5,Hit
damage = ifelse(var(10)=3,174,114),ifelse(var(10)=3,43,28)
pausetime = 12,12
getpower = 0,0
ground.type = Low;Trip
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -1,-5
air.velocity = -1,-5
fall = 1
fall.recover = 0
kill = 0;ifelse(var(10)=3,0,1)
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=83), var(36):=-10
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 0, TargetState]
type = TargetState
;triggerall = var(10)=3
trigger1 = NumTarget && MoveHit
value = 3270
persistent = 0
ignorehitpause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = ifelse(MoveHit,3230,3201)

[State 0, VarSet]
type = VarSet
trigger1 = MoveContact
var(2) = 0
ignorehitpause = 1


;-----------------------------------------------
; Dageki: Mika Lariat
[StateDef 3222]
type = S
physics = N
moveType = A
ctrl = 0
sprpriority = 1
powerAdd = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3222

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3201, VarAdd]
type = VarAdd
trigger1 = 1
v = 2
value = -1

[State 0, Voice]
type = PlaySnd
trigger1 = !Time
value = 4,0
channel = 0

[State 0, Woosh]
type = PlaySnd
trigger1 = !Time
value = 1,2

[State 0, VelMul]
type = VelMul
trigger1 = vel X > 0
x = .93

[State 0, HitDef]
type = HitDef
trigger1 = !Time
attr = S,HA
hitflag = MAF
guardflag = H
animtype = Back
priority = 5,Hit
damage = ifelse(var(10)=3,174,114),ifelse(var(10)=3,43,28)
pausetime = 12,12
getpower = 0,0
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -4,-1
air.velocity = -4,-1
fall = 1
fall.recover = 0
kill = 0;ifelse(var(10)=3,0,1)
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-75
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 0, TargetState]
type = TargetState
;triggerall = var(10)=3
trigger1 = MoveHit && NumTarget
value = 3260
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = ifelse(MoveHit,3230,3201)

[State 0, VarSet]
type = VarSet
trigger1 = MoveContact
var(2) = 0
ignorehitpause = 1


; ---JUMP---
[StateDef 3230]
type = A
physics = N
moveType = I
ctrl = 0
sprpriority = 2
powerAdd = 0
velset = 0,0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3230

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 3153, Helper]
type = Helper
trigger1 = !time
ID = 3241
stateno = 3241
pos = -80,0
postype = left
facing = 1

[State 3153, Helper]
type = Helper
trigger1 = !time
ID = 3242
stateno = 3242
pos = 80,0
postype = right
facing = -1

[State 3153, Helper]
type = Helper
trigger1 = !time
name = "Ring"
ID = 3240
stateno = 3240 
postype = Back
ownpal = 1
pos = -130, 0

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = -BackEdgeDist / 33
y = -9

[State 0, VelAdd]
type = VelAdd
trigger1 = Time > 0 && AnimElemTime(11) < 0
y = .51

[State 0, VelSet]
type = VelSet
trigger1 = AnimElem = 11
x = 0
y = 0

[State 0, Snd]
type = PlaySnd
trigger1 = !Time
value = 40, 0

[State 0, Dust]
type = helper
trigger1 = !time
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 0, ChangeState]
type = ChangeState
triggerall = AnimElemTime(12)>=7 && !AILevel
trigger1 = (command="a" || command="b" || command="c")
trigger2 = (command="rlsa" || command="rlsb" || command="rlsc")
trigger3 = (command="holda" || command="holdb" || command="holdc")
value = 3232

[State 0, ChangeState]
type = ChangeState
triggerall = !AILevel
trigger1 = !AnimTime
value = 3231

[State 0, ChangeState]
type = ChangeState
triggerall = AILevel
trigger1 = !AnimTime
value = ifelse(random < 500,3231,3232)


;-----------------------------------------------
; Moonsault Press
[StateDef 3231]
type = A
physics = N
moveType = A
ctrl = 0
sprpriority = 2
powerAdd = 0
velset = 0,0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3231

[State 0, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = P2BodyDist X / 30
y = -7

[State 0, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = .51

[State 0, HitDef]
type = HitDef
trigger1 = !Time
attr = S,HA
hitflag = FD
animtype = Hard
priority = 5,Hit
damage = ifelse(var(10)=3,150,90),0
pausetime = 12 ,12
getpower = 0,0
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -4,-6
air.velocity = -4,-6
down.velocity = 0,0
fall = 1
fall.recover = 0
kill = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=0), var(36):=0
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = MoveHit
trigger2 = pos Y >= 0 && vel Y > 0
value = 3235


;-----------------------------------------------
;Missile Kick
[StateDef 3232]
type = A
physics = N
moveType = A
ctrl = 0
sprpriority = 2
powerAdd = 0
velset = 0,0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3232

[State 0, Voice]
type = PlaySnd
trigger1 = !Time
value = 840,0
channel = 0

[State 0, VelSet]
type = VelSet
trigger1 = !Time
x = P2BodyDist X / 40
y = -7

[State 0, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = .51

[State 0, HitDef]
type = HitDef
trigger1 = !Time
attr = S,HA
hitflag = FD
animtype = Hard
priority = 5,Hit
damage = ifelse(var(10)=3,150,90),0
pausetime = 12 ,12
getpower = 0,0
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -4,-6
air.velocity = -4,-6
down.velocity = 0, 0
fall = 1
fall.recover = 0
kill = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=160), var(36):=-20
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = MoveHit
trigger2 = pos Y >= 20 && vel Y > 0
value = 3235


;---LANDING---
[StateDef 3235]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0

[state 1001,Posset]
type=posset
trigger1=!time
y=0

[State 1001, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = ifelse(prevstateno=3231,3235,3236)

[State 1001, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 52,0

[State 1001, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1001, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---TARGET---
[Statedef 3260]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 0, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = HitShakeOver
trigger1 = SelfAnimExist(5035)
value = 5035

[State 0, Vel]
type = VelSet
trigger1 = !Time
x = -4 ;GetHitVar(xvel)
y = -2 ;GetHitVar(yvel)

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 0, ChangeState]
type = ChangeState
trigger1 = HitOver
trigger1 = Vel Y > 0
value = 3261


;---TRANSITION---
[Statedef 3261]
type = A
movetype = H
physics = N
ctrl = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5050

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)
 
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5050
trigger1 = Vel Y >= ifelse(anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3262


;---HIT GROUND---
[Statedef 3262]
type = L
movetype= H
physics = N

[State 0, EnvShake]
type = FallEnvShake
trigger1 = !Time

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5100

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 0, VelMul]
type = VelMul
trigger1 = !Time
x = 0.75

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 0, PosFreeze]
type = PosFreeze
trigger1 = 1

[State 0, FFB]
type = ForceFeedback
trigger1 = !Time
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

[State 0, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3263


;---BOUNCE---
[Statedef 3263]
type = L
movetype= H
physics = N

[State 0, ChangeAniim] ;Coming hit ground anim (normal)
type = ChangeAnim
trigger1 = !Time
value = 5160

[State 0, Vel]
type = HitFallVel
trigger1 = !Time

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = Const(movement.down.bounce.offset.y)

[State 0, PosAdd]
type = PosAdd
trigger1 = Time = 0
x = Const(movement.down.bounce.offset.x)

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = Const(movement.down.bounce.yaccel)

[State 0, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.down.bounce.groundlevel)
value = 3290


;---TARGET TRIP---
[Statedef 3270]
type = A
movetype= H
physics = N
velset = 0,0

[State 5070, 1]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 3271

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140


;---TRIPPED---
[Statedef 3271]
type = A
movetype= H
physics = N

[State 5071, 1]
type = VelSet
trigger1 = !Time
x = -1 ;GetHitVar(xvel)
y = -5 ;GetHitVar(yvel)

[State 5071, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5071, 3]
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
type = ChangeState
value = 3290


;---LYING DOWN---
[Statedef 3290]
type = L
movetype= H
physics = N

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = !Time

[State 5110, 2]
type = ChangeAnim
trigger1 = !Time
value = 5170

[State 5110, 5]
type = PosSet
trigger1 = !Time
y = 0

[State 5110, Var] ;Get fall velocity
type = VarSet
trigger1 = !Time
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5110, 6]
type = PlaySnd
trigger1 = !Time
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 5110, 7]
type = Explod
trigger1 = !Time
trigger1 = !SysVar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 5110, 8]
type = VelSet
trigger1 = !Time
y = 0

[State 5110, 10]
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = !AnimTime
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5110, 11] ;If just died
type = ChangeState
triggerall = !alive
trigger1 = !AnimTime
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = !Time
sysvar(0) = 0

[State 5110, 13]
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14]
type = VelSet
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 5110, 15]
type = ForceFeedback
trigger1 = alive
trigger1 = !Time
time = 8
ampl = 240
waveform = sine

[State 5110, 16]
type = ForceFeedback
trigger1 = !alive
trigger1 = !Time
ampl = 200, 7, -.467
time = 30
waveform = sine

[State 0, SelfState]
type = SelfState
triggerAll = Alive
trigger1 = Time >= 90
value = 5120


;-----------------------------------------------
; Rainbow Assault
[StateDef 3500]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = ifelse(var(53) > 0, -1000, -3000)
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=3500

[state 3500,Posset]
type=posset
trigger1=!time
y=0

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
trigger1 = !Time
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 0, -66
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = !Time
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 60
attr=S,HT
hitflag=M
priority = 7, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=3501

[State 3100, Snd]
type=playsnd
trigger1= animelem=3
value=800,0
channel=0

[State 3100, Snd]
type=playsnd
trigger1= animelem=3
value=1,0
channel=1

[State 3100, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; ---SUCCESS---
[Statedef 3501]
type = S
movetype= A
physics = N
velset = 0,0
anim = 3501

[State 3501, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3501, Width]
type = Width
trigger1 = 1
edge = 40,0

[State 3501, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 3501, Turn]
type = Turn
trigger1 = !Time

[State 3501, TargetFacing]
type = TargetFacing
trigger1 = !Time
value = -1

[State 3501, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3510

[State 3501, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

;---------- Bind ----------

[State 3501, Bind 3]
type = TargetBind
trigger1 = AnimElem = 1
trigger2 = AnimElem = 2 || AnimElem = 10 || AnimElem = 18 || AnimElem = 26
pos = -40, 0

[State 3501, Bind 4]
type = TargetBind
trigger1 = AnimElem = 3 || AnimElem = 11 || AnimElem = 19 || AnimElem = 27
pos = -20, -60

[State 3501, Bind 5]
type = TargetBind
trigger1 = AnimElem = 4 || AnimElem = 12 || AnimElem = 20 || AnimElem = 28
pos = 6, -87

[State 3501, Bind 6]
type = TargetBind
trigger1 = AnimElem = 5 || AnimElem = 13 || AnimElem = 21 || AnimElem = 29
trigger2 = AnimElem = 6 || AnimElem = 14 || AnimElem = 22 || AnimElem = 30
pos = 50, -15

[State 3501, Bind 7]
type = TargetBind
trigger1 = AnimElem = 7 || AnimElem = 15 || AnimElem = 23 || AnimElem = 31
pos = 20, -28

[State 3501, Bind 8]
type = TargetBind
trigger1 = AnimElem = 8 || AnimElem = 16 || AnimElem = 24 || AnimElem = 32
pos = 8, 0

[State 3501, Bind 9]
type = TargetBind
trigger1 = AnimElem = 9 || AnimElem = 17 || AnimElem = 25 || AnimElem = 33
pos = -14, 0

;----------

[State 3501, Bind 10]
type = TargetBind
trigger1 = AnimElem = 34
pos = -25, 0

[State 3501, Bind 11]
type = TargetBind
trigger1 = AnimElem = 35
trigger2 = AnimElem = 36
pos = 0, 0

[State 3501, Bind 12]
type = TargetBind
trigger1 = AnimElem = 37
pos = 5, -100

[State 3501, Bind 13]
type = TargetBind
trigger1 = AnimElem = 38
pos = 18, -104

[State 3501, Bind 14]
type = TargetBind
trigger1 = AnimElem = 39
pos = 29, -100

[State 3501, Bind 15]
type = TargetBind
trigger1 = AnimElem = 40
pos = 39, -86

[State 3501, Bind 16]
type = TargetBind
trigger1 = AnimElem = 41
pos = 29, -64

[State 3501, Bind 17]
type = TargetBind
trigger1 = AnimElem = 42
pos = 55, 0

;----------

[State 3501, PosAdd]
type = PosAdd
trigger1 = AnimElem = 7 || AnimElem = 15 || AnimElem = 23 || AnimElem = 31
trigger2 = AnimElem = 8 || AnimElem = 16 || AnimElem = 24 || AnimElem = 32
trigger3 = AnimElem = 9 || AnimElem = 17 || AnimElem = 25 || AnimElem = 33
trigger4 = AnimElem = 10 || AnimElem = 18 || AnimElem = 26 || AnimElem = 34
x = 10

[State 3501, Hurt]
type = TargetLifeAdd
triggerAll = NumTarget
trigger1 = AnimElem = 5 || AnimElem = 13 || AnimElem = 21 || AnimElem = 29
trigger2 = AnimElem = 42
value = -72 ; 288 ; 360
kill = 0

[State 3501, HitAdd]
type = HitAdd
trigger1 = AnimElem = 5 || AnimElem = 13 || AnimElem = 21 || AnimElem = 29
trigger2 = AnimElem = 42
value = 1

[State 3501, EnvShake]
type = EnvShake
trigger1 = AnimElem = 5 || AnimElem = 13 || AnimElem = 21 || AnimElem = 29
trigger2 = AnimElem = 42
time = 20
freq = 90
ampl = -4

[State 3501, Helper]
type = Helper
trigger1 = AnimElem = 5 || AnimElem = 13 || AnimElem = 21 || AnimElem = 29
trigger2 = AnimElem = 42
helpertype = normal
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = 50,0
postype = p1
ownpal = 1

[State 3501, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5 || AnimElem = 13 || AnimElem = 21 || AnimElem = 29
trigger2 = AnimElem = 42
value = 2,5

;----------

[State 3501, Helper]
type = Helper
trigger1 = AnimElem = 52
ID = 3241
stateno = 3241
pos = -80,0
postype = left
facing = 1

[State 3501, Helper]
type = Helper
trigger1 = AnimElem = 52
ID = 3242
stateno = 3242
pos = 80,0
postype = right
facing = -1

[State 3501, Helper]
type = Helper
trigger1 = AnimElem = 52
name = "Ring"
ID = 3240
stateno = 3240 
postype = Back
ownpal = 1
pos = -130, 0
facing = 1

[State 3501, VelSet]
type = VelSet
trigger1 = AnimElem = 52
x = -BackEdgeDist / 35
y = -9

[State 3501, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(52) > 0 && AnimElemTime(62) < 0
y = .51

[State 3501, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 52
statetype = A
physics = N

[State 3501, Snd]
type = PlaySnd
trigger1 = AnimElem = 52
value = 40, 0

[State 3501, Dust]
type = helper
trigger1 = AnimElem = 52
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3501, VelSet]
type = VelSet
trigger1 = AnimElem = 62
x = 0
y = 0

[State 3501, VelSet]
type = VelSet
trigger1 = AnimElem = 64
x = P2BodyDist X / 40
y = -7

[State 3501, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(64) > 0
y = .51

[State 3501, Voice]
type = PlaySnd
trigger1 = AnimElem = 64
value = 3000,0
channel = 0

[State 3501, HitDef]
type = HitDef
trigger1 = !Time
attr = S,HA
hitflag = FD
guardflag =
animtype = Hard
priority = 7,Hit
damage = 90,0
pausetime = 15 ,15
getpower = 0,0
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -4,-6
air.velocity = -4,-6
down.velocity = 0,0
down.hittime = 30
fall = 1
fall.recover = 0
kill = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=20), var(36):=-50
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 3501, ChangeState]
type = ChangeState
trigger1 = pos Y >= 30 && vel Y > 0
value = 1101


;---TARGET---
[Statedef 3510]
type = A
movetype = H
physics = N
velset = 0,0

[State 3510, 1]
type = ChangeAnim2
trigger1 = !Time
value = 3510

[State 3510, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 31
statetype = L

[State 3510, Turn]
type = Turn
trigger1 = AnimElem = 31

[State 3510, SelfState]
type = SelfState
triggerall = Alive
trigger1 = !AnimTime
value = 5120


;-----------------------------------------------
; Rainbow Cyclone
[StateDef 3600]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = ifelse(var(53) > 0, -1000, -3000)
faceP2 = 1

[State 3600, Anim]
type=changeanim
trigger1=!time
value=3600

[state 3600,Posset]
type=posset
trigger1=!time
y=0

[State 3600, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3600, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3600, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3600, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0

[State 3600, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3600, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3600, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3600, Super Pause FX]
type = Helper
trigger1 = !Time
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 10, -72
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3600, Super Pause]
type = SuperPause
trigger1 = !Time
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3600, Hit]
type = HitDef
trigger1 = !Time
attr = S,HA
hitflag = MAF
guardflag = 
animtype = Back
priority = 5,Hit
damage = 75,0
pausetime = 12,12
getpower = 0,0
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -2,-1
air.velocity = -2,-1
fall = 1
fall.recover = 0
kill = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-75
envshake.time = 18
envshake.ampl = 6
envShake.freq = 120

[State 3600, NotHitBy]
type = NotHitBy
trigger1 = MoveHit
value = SCA
time = 17

[State 3600, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3620
persistent = 0

[State 3600, VelSet]
type = VelSet
trigger1 = AnimElem = 15
x = 8

[State 3600, VelMul]
type = VelMul
trigger1 = AnimElemTime(15)>0 && Vel X > 0
x = .97

[State 3600, PlaySnd]
type = PlaySnd
trigger1 = !Time 
value = 1300,0
channel = 0

[State 3600, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 16
value = 4,1
channel = 0

[State 3600, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1,2

[State 3600, Type]
type = statetypeset
trigger1= animelemtime(18)>=0
movetype = I

[State 3600, End]
type = ChangeState
trigger1 = !AnimTime
value = ifelse(movehit,3601,0)
ctrl = ifelse(movehit,0,1)


;-----------------------------------------------
; Part 1
[StateDef 3601]
type = S
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
poweradd = 0
faceP2 = 1

[State 3601, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3601

[State 3601, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3601, VelSet]
type = VelSet
trigger1 = AnimElem = 6
x = 2

[State 3601, VelSet]
type = VelSet
trigger1 = AnimElem = 7
x = P2BodyDist X / 20
y = -8

[State 3601, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(7) > 0
y = .5

[State 3601, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 7
statetype = A

[State 3601, Snd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 40, 0

[State 3601, Dust]
type = helper
trigger1 = AnimElem = 7
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3601, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000,0
channel = 0

[State 3601, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 20
value = 3602


;-----------------------------------------------
; Part 2
[StateDef 3602]
type = S
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
poweradd = 0

[State 3602, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3602

[State 3602, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3602, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3602, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = -75
kill = 0

[State 3602, TargetState]
type = TargetState
trigger1 = NumTarget && !Time
value = 3625
persistent = 0

[State 3602, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && !Time
value = 2,5

[State 3602, Hit Spark]
type = Helper
trigger1 = NumTarget && !Time
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = 0, -20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3602, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 18
ampl = 6
freq = 120

[State 3602, Turn]
type = Turn
trigger1 = AnimElem = 4

[State 3602, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
x = -45

[State 3602, Helper]
type = Helper
trigger1 = AnimElem = 5
name = "Zangief"
ID = 3610
stateno = 3610 
pos = 0,0
postype = Front
facing = -1
ownpal = 0

[State 3602, HitAdd]
type = HitAdd
trigger1 = Time = 56
value = 1

[State 3602, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = NumTarget && Time = 56
value = -75
kill = 0

[State 3602, TargetState]
type = TargetState
trigger1 = NumTarget && Time = 56
value = 3625
persistent = 0

[State 3602, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && Time = 56
value = 2,5

[State 3602, Hit Spark]
type = Helper
trigger1 = NumTarget && Time = 56
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P2
pos = 0, -20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3602, EnvShake]
type = EnvShake
trigger1 = NumTarget && Time = 56
time = 18
ampl = 6
freq = 120

[State 3602, ChangeState]
type = ChangeState
trigger1 = Time = 90
value = 3603


;-----------------------------------------------
; Part 3
[StateDef 3603]
type = S
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
poweradd = 0

[State 3603, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3603

[State 3603, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3603, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = P2BodyDist X / 30
y = -8

[State 3603, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = .5

[State 3603, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A

[State 3603, Snd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40, 0

[State 3603, Dust]
type = helper
trigger1 = AnimElem = 2
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3603, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 840, 0
channel = 0

[State 3603, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 30 && Vel Y > 0
value = 3604


;-----------------------------------------------
; Part 4
[StateDef 3604]
type = S
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
poweradd = 0

[State 3604, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3604

[State 3604, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3604, HitAdd]
type = HitAdd
trigger1 = !Time
value = 1

[State 3604, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = NumTarget && !Time
value = -75
kill = 0

[State 3604, TargetState]
type = TargetState
trigger1 = NumTarget && !Time
value = 3625
persistent = 0

[State 3604, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && !Time
value = 2,5

[State 3604, Hit Spark]
type = Helper
trigger1 = NumTarget && !Time
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = 0, -20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3604, EnvShake]
type = EnvShake
trigger1 = NumTarget && !Time
time = 18
ampl = 6
freq = 120

[State 3604, PosAdd]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
trigger3 = AnimElem = 6
trigger4 = AnimElem = 7
trigger5 = AnimElem = 8
x = -10

[State 3604, Voice]
type = PlaySnd
trigger1 = AnimElem = 10
value = 4, 4
channel = 0

[State 3604, HitAdd]
type = HitAdd
trigger1 = Time = 77
value = 1

[State 3604, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = NumTarget && Time = 77
value = -75
kill = 0

[State 3604, TargetState]
type = TargetState
trigger1 = NumTarget && Time = 77
value = 3625
persistent = 0

[State 3604, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && Time = 77
value = 2,2

[State 3604, Hit Spark]
type = Helper
trigger1 = NumTarget && Time = 77
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P2
pos = 0, -20
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3604, EnvShake]
type = EnvShake
trigger1 = NumTarget && Time = 77
time = 18
ampl = 6
freq = 120

[State 3604, TargetState]
type = TargetState
trigger1 = NumTarget && Time = 110
value = 3626
persistent = 0

[State 3604, ChangeState]
type = ChangeState
trigger1 = Time = 130
value = 3605


;-----------------------------------------------
; Part 5
[StateDef 3605]
type = S
physics = N
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
poweradd = 0

[State 3605, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3605

[State 3605, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3605, Helper];Dizzy FX
type = Helper
trigger1 = NumTarget && EnemyNear,Anim = 5300 && NumHelper(3111)<1
stateno = 3111
ID = 3111
postype = p2
ignorehitpause = 1

[State 3605, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 190, 0
channel = 0

[State 3605, HitAdd]
type = HitAdd
trigger1 = AnimElem = 17
value = 2

[State 3605, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 17
value = -75
kill = 1

[State 3605, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 17
value = 2,5

[State 3605, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 17
helperType = Normal
stateNo = 8014
ID = 8000
name = "Spark"
posType = P1
pos = 65, -76
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3605, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 17
time = 18
ampl = 6
freq = 120

[State 3605, TargetState]
type = TargetState
trigger1 = NumTarget && AnimElem = 17
value = 3627
persistent = 0

[State 3605, Voice]
type = PlaySnd
trigger1 = AnimElem = 23
value = 1400, 0
channel = 0

[State 3605, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;-----------------------------------------------
; Target
[Statedef 3620]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5030

[State 0, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = HitShakeOver
trigger1 = SelfAnimExist(5035)
value = 5035

[State 0, Vel]
type = VelSet
trigger1 = !Time
x = -2
y = -2

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = .5

[State 0, ChangeState]
type = ChangeState
;trigger1 = HitOver
trigger1 = Vel Y > 0
value = 3621


; Transition
[Statedef 3621]
type = A
movetype = H
physics = N
ctrl = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5050

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = .5
 
[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 5050
trigger1 = Vel Y >= ifelse(anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 3622


; Hit Ground
[Statedef 3622]
type = L
movetype= H
physics = N

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, EnvShake]
type = FallEnvShake
trigger1 = !Time

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5100

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = !Time
y = 0

[State 0, VelMul]
type = VelMul
trigger1 = !Time
x = 0.75

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 0, PosFreeze]
type = PosFreeze
trigger1 = 1

[State 0, FFB]
type = ForceFeedback
trigger1 = !Time
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

[State 0, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3623


; Bounce
[Statedef 3623]
type = L
movetype= H
physics = N

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, ChangeAniim] ;Coming hit ground anim (normal)
type = ChangeAnim
trigger1 = !Time
value = 5160

[State 0, Vel]
type = HitFallVel
trigger1 = !Time

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = Const(movement.down.bounce.offset.y)

[State 0, PosAdd]
type = PosAdd
trigger1 = Time = 0
x = Const(movement.down.bounce.offset.x)

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = Const(movement.down.bounce.yaccel)

[State 0, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.down.bounce.groundlevel)
value = 3624


; Lying
[Statedef 3624]
type = L
movetype = H
physics = N
velset = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, 1]
type = ChangeAnim
trigger1 = !Time
value = 5110

[State 0, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 0, SelfState]
type = SelfState
triggerall = Alive
trigger1 = Time >= 200
value = 5120


; Lying + Hit
[Statedef 3625]
type = L
movetype = H
physics = N
velset = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5080

[State 0, SelfState]
type = SelfState
triggerall = Alive
trigger1 = Time >= 200
value = 5120


; Getting Up + Dizzy
[Statedef 3626]
type = S
movetype = H
physics = N
velset = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5120

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5120 && !AnimTime
value = 5300

[State 0, SelfState]
type = SelfState
triggerall = Alive
trigger1 = Time >= 200
value = 0
ctrl = 1


; Final (Double Hit)
[Statedef 3627]
type = A
movetype = H
physics = N
velset = 0,0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3620

[State 0, VelSet]
type = VelSet
trigger1 = !Time
y = -11

[State 0, VelAdd]
type = VelAdd
trigger1 = Time > 0 && Pos Y < 0
y = .45

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = Vel Y > -5 && Anim != 3621
value = 3621

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 5110