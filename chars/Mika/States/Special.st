; ________________________
;| R. Mika by DeathScythe |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;---------------------------------------------------------------------------
;Flying Peach
[Statedef 1000]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
trigger1=!time
y=0

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
trigger1 = !Time
value = 1000;ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = 1000,0
channel = 0

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = ifelse(var(10)=2, 4,ifelse(var(10)=1, 3, 2))
y = -3.5

[State 1000, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(5) < 0
y = .5

[State 1000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A

[State 1000, PosSet]
type = PosSet
trigger1 = AnimElem = 5
y = 0

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem = 5
trigger2 = Vel Y > 0 && Pos Y >= 0
x = 0
y = 0

[State 1000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
statetype = S

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 52,0

[State 1000, Dust]
type = explod
trigger1 = AnimElem = 5
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem=8
value = 40, 0

[State 1000, Dust]
type = helper
trigger1 = animelem=8
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1000, VelSet]
type = VelSet
trigger1 = animelem=8
x = ifelse(var(10)=2, 5,ifelse(var(10)=1, 4, 3))
y = ifelse(var(10)=2, -7,ifelse(var(10)=1, -6.5, -6))

[State 1000, VelAdd]
type = VelAdd
trigger1 = animelemtime(8)>0
y = .6

[State 1000, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(8)>0
statetype = A
movetype = A
physics = N

[State 1000, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1000
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)))), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -3.61, -4), -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -4)
guard.cornerpush.veloff = 0
air.velocity = -4, -6
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=55), var(36):=-65
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1000, ChangeState]
type = ChangeState
triggerall = AnimElemTime(9) >= 0
trigger1 = pos Y >= 0
trigger1 = vel Y > 0
value = 1001
ctrl = 0

;---END---
[Statedef 1001]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 1001,Posset]
type=posset
trigger1=!time
y=0

[State 1001, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1001

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

;---------------------------------------------------------------------------
;EX Flying Peach
[Statedef 1050]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=ifelse(var(53) > 0, 0, -500)
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1050

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1050, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1050, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 20, -75
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1050, Ex AfterImage]
type = AfterImage
triggerall = var(55) = 1
trigger1 = !Time
time = 2
timegap = 1
framegap = 1
length = 8
palcontrast = 128, 112, 0
palmul = 0.65, 0.65, 0.65
trans = add

[State 1050, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = 1000,0
channel = 0

[State 1050, VelSet]
type = VelSet
trigger1 = !time
x = 5

[State 1050, VelSet]
type = VelSet
trigger1 = animelem=5
x = 0

[State 1050, Snd]
type = playsnd
trigger1 = animelem=8
value = 40, 0

[State 1050, Dust]
type = helper
trigger1 = animelem=8
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1050, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(8)<0
value = SCA

[State 1050, VelSet]
type = VelSet
trigger1 = animelem=8
x = P2Dist X / 31
y = -8

[State 1050, VelAdd]
type = VelAdd
trigger1 = animelemtime(8)>0
y = .65

[State 1050, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(8)>0
statetype = A
movetype = A
physics = N

[State 1050, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1050
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*125<7, 7, fvar(11)*125)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4, -6
ground.cornerpush.veloff = 0
guard.velocity = -4
guard.cornerpush.veloff = 0
air.velocity = -4, -6
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=55), var(36):=-65
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1050, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0
trigger1 = vel Y > 0
value = 1001
ctrl = 0

;---------------------------------------------------------------------------
;Shooting Peach
[Statedef 1100]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1100,Posset]
type=posset
trigger1=!time
y=0

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1100

[State 1100, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 1100, Snd]
type = playsnd
trigger1 = animelem=2
value = 40, 0

[State 1100, Dust]
type = helper
trigger1 = animelem=2
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1100, VelSet]
type = VelSet
trigger1 = animelem=2
x = ifelse(var(10)=2, 5,ifelse(var(10)=1, 4, 3))
y = ifelse(var(10)=2, -7,ifelse(var(10)=1, -6.5, -6))

[State 1100, VelAdd]
type = VelAdd
trigger1 = animelemtime(2)>0
y = .6

[State 1100, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(2)>0
statetype = A
movetype = A
physics = N

[State 1100, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1100
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 112, ifElse(var(10), 105, 98)))), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -3.61, -4), -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -4)
guard.cornerpush.veloff = 0
air.velocity = -4, -6
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=55), var(36):=-65
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1100, ChangeState]
type = ChangeState
trigger1 = pos Y >= 30
trigger1 = vel Y > 0
value = 1101
ctrl = 0

;---END---
[Statedef 1101]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 1101,Posset]
type=posset
trigger1=!time
y=0

[State 1101, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1101

[State 1101, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 52,0

[State 1101, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1101, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 1000,1
channel = 0

[State 1101, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Shooting Peach
[Statedef 1150]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=ifelse(var(53) > 0, 0, -500)
facep2=1

[State 1150, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1150, Anim]
type=changeanim
trigger1=!time
value=1100

[State 1150,Posset]
type=posset
trigger1=!time
y=0

[State 1150, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1150, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1150, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1150, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1150, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1150, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1150, Ex AfterImage]
type = AfterImage
triggerall = var(55) = 1
trigger1 = !Time
time = 2
timegap = 1
framegap = 1
length = 8
palcontrast = 128, 112, 0
palmul = 0.65, 0.65, 0.65
trans = add

[State 1150, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 1150, Snd]
type = playsnd
trigger1 = animelem=2
value = 40, 0

[State 1150, Dust]
type = helper
trigger1 = animelem=2
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1150, VelSet]
type = VelSet
trigger1 = animelem=2
x = P2BodyDist X / 30
y = -8

[State 1150, VelAdd]
type = VelAdd
trigger1 = animelemtime(2)>0
y = .6

[State 1150, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(2)>0
statetype = A
movetype = A
physics = N

[State 1150, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1150
attr = S,SA
hitflag = MAFD
guardflag = M
damage = ifelse(P2StateType=L,75, ceil(ifelse(fvar(11)*119<7, 7, fvar(11)*119))), 7
getpower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4, -6
ground.cornerpush.veloff = 0
guard.velocity = -4
guard.cornerpush.veloff = 0
air.velocity = -4, -6
air.cornerPush.velOff = 0
down.velocity = 0, 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=55), var(36):=-65
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1150, ChangeState]
type = ChangeState
trigger1 = pos Y >= 30
trigger1 = vel Y > 0
value = 1101
ctrl = 0

;---------------------------------------------------------------------------
;Paradise Hold
[Statedef 1200]
type=A
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1200,Posset]
type=posset
trigger1=!time
y=0

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1200

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, VelSet]
type = VelSet
trigger1 = !Time
x = 2
y = -5

[State 1200, Velset]
type = VelSet
trigger1 = AnimElem = 5
x = ifelse(var(10)=2,3.5,ifelse(var(10)=1,3,2.5))
y = -6

[State 1200, VelAdd]
type = VelAdd
trigger1 = animelemtime(1)>0; && animelemtime(5)<0
;trigger2 = animelemtime(5)>0
y = .55

[State 1200, VelSet]
type = VelSet
trigger1 = vel Y > 0
trigger1 = pos Y >= 0
x = 0
y = 0
[State 1200, PosSet]
type = PosSet
;trigger1 = vel Y > 0
trigger1 = pos Y >= 0
y = 0

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = AnimElemTime(4) = 9
value = 52,0

[State 1200, Dust]
type = explod
;triggerall = Pos Y = 0 && !NumExplod(8102)
trigger1 = AnimElemTime(4) = 9
anim = 8102
id = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1200, Snd]
type = playsnd
trigger1 = !Time
trigger2 = AnimElem = 5
value = 40, 0

[State 1200, Dust]
type = helper
trigger1 = !Time
trigger2 = AnimElem = 5
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1200, Hit]
type=hitdef
triggerall = P2BodyDist x < 55
trigger1= animelem = 5
attr=S,ST
hitflag=M-
priority = 1, Miss
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
p1stateno=1210

[State 1200, End]
type=changestate
trigger1= animelemtime(7)>0 && pos Y>=0
value=1201
ctrl=0

;---END---
[Statedef 1201]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 1201,Posset]
type=posset
trigger1=!time
y=0

[State 1201, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1201

[State 1201, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 52,0

[State 1201, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
pos = -10,0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1201, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---SUCCESS---
[Statedef 1210]
type = S
movetype= A
physics = N
velset = 0,0
anim = 1210

[State 1210, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 1210, TargetFacing]
type = TargetFacing
trigger1 = !time
value = -1

[State 1210, Width]
type = Width
trigger1 = 1
edge = 70,0

[State 1210, TargetState]
type = TargetState
trigger1 = !time && NumTarget
value = 1211

[State 1210, BindToTarget]
type = BindToTarget
trigger1 = animelem = 1
pos = 0,0,Head

[State 1210, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = 50

[State 1210, PosSet]
type = PosSet
trigger1 = animelem = 2
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 5

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 11
x = -5

[State 1210, VelSet]
type = VelSet
trigger1 = animelem = 10
trigger2 = animelem = 15
x = 0

[State 1210, TargetBind]
type = TargetBind
trigger1 = animelem = 2
trigger2 = animelem = 3
trigger3 = animelem = 4
trigger4 = animelem = 5
pos = 0,-15

[State 1210, TargetBind]
type = TargetBind
trigger1 = animelem = 6 
pos = -9,-10

[State 1210, TargetBind]
type = TargetBind
trigger1 = animelem = 7
pos = -9,-14

[State 1210, TargetBind]
type = TargetBind
trigger1 = animelem = 8
pos = -5,-32

[State 1210, TargetBind]
type = TargetBind
trigger1 = animelem = 9
pos = 0,-28

[State 1210, TargetBind]
type = TargetBind
trigger1 = animelem = 10
pos = 5,-10

[State 1210, Hurt]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 10
value = ifelse(var(10)=2,-135,ifelse(var(10)=1,-129,-123))

[State 1210, HitAdd]
type = HitAdd
trigger1 = animelem = 10
value = 1

[State 1210, EnvShake]
type = EnvShake
trigger1 = animelem = 2
trigger2 = animelem = 10
time = 20
freq = 90
ampl = -4

[State 1210, Helper]
type = Helper
trigger1 = animelem = 10
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = 50,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 1210, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 2,4
[State 1210, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
value = 2,5

[State 1210, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 4,2
channel = 0

[State 1210, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = 4,3
channel = 0

[State 1210, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---TARGET---
[Statedef 1211]
type = A
movetype = H
physics = N
velset = 0,0

[State 1211, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1211

[State 1211, Turn]
type = Turn
trigger1 = animelem = 10

[State 1211, PosAdd]
type = PosAdd
trigger1 = animelem = 11
x = 50

[State 1211, VelSet]
type = VelSet
trigger1 = animelem = 11
x = 3
y = -7

[State 1211, 1] ;Gravity
type = VelAdd
trigger1 = animelemtime(11)>0
y = .49

[State 1211, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground


;---------------------------------------------------------------------------
;Daydream Headlock
[Statedef 1300]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1300, Anim]
type=changeanim
trigger1=!time
value=800

[State 1300,Posset]
type=posset
trigger1=!time
y=0

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1300, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
attr=S,ST
hitflag=M-
priority = 1, Miss
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
p1stateno=1301

[State 1300, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 1300, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 1300, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 1300, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1

;---SUCCESS---
[Statedef 1301]
type = S
movetype = A
physics = S
anim = 1300
velset = 0, 0
poweradd = 0
sprpriority = 2

[State 1301, Safety]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 1301, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1301, TargetFacing]
type = TargetFacing
trigger1 = !time
value = -1

[State 1301, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1301, PosAdd]
type = PosAdd
trigger1 = !Time
x = 50

[State 1301, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1310

;[State 1301, AssertSpecial]
;type = AssertSpecial
;trigger1 = 1
;flag = NoAutoTurn

[State 1301, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 1301, Bind 1]
type = TargetBind
trigger1 = 1
trigger1 = NumTarget
pos = 15,0

[State 1301,ChangeState]
type = ChangeState
trigger1 = !AnimTime 
value = 1302

;---HIT---
[StateDef 1302]
type = S
physics = N
moveType = A
anim = 1301
ctrl = 0
velset = 0,0
sprpriority = 1

[State 1302, TargetState]
type = TargetState
trigger1= !Time && NumTarget
value = 1311

[State 1302, Bind]
type = TargetBind
trigger1 = animelem = 1
trigger1 = NumTarget
pos = -8,-80

[State 1302, Bind]
type = TargetBind
trigger1 = animelem = 2
trigger1 = NumTarget
pos = -9,-79

[State 1302, Bind]
type = TargetBind
trigger1 = animelem = 3
trigger1 = NumTarget
pos = -11,-78

[State 1302, Timer Start]
type = VarSet
trigger1 = !Time
var(44) = 135

[State 1302, Timer End (Round Over)]
type = VarSet
trigger1 = RoundState != 2
var(44) = 0

[State 1302, Timer Countdown]
type = VarAdd
trigger1 = HitCount
var(44) = -1

[State 1302, Timer]
type = VarAdd
triggerAll = NumTarget && HitCount
trigger1 = Target, command = "x" || Target, command = "y" || Target, command = "z"
trigger2 = Target, command = "a" || Target, command = "b" || Target, command = "c"
trigger3 = Target, command = "up" || Target, command= "down" || Target, command = "back" || Target, command = "fwd"
var(44) = -1

[State 1302, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 1302, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 1302, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = (command = "up" || command = "down" || command = "back" || command = "fwd")
var(42) = 2

[State 1302, Mashing Increment]
type = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 1302, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 1302, Anim Skip]
type = ChangeAnim
triggerall = var(44) > 0
trigger1 = AnimElemTime(AnimElemNo(0)) >= 0 && AnimElemTime(3) < 0
trigger1 = AnimElemTime(AnimElemNo(0) +1 ) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + AnimElemTime(AnimElemNo(0) + 1))
value = 1301
elem = AnimElemNo(0) + 1

[State 1302, Anim Skip]
type = ChangeAnim
triggerAll = var(44) > 0
trigger1 = AnimElemTime(3)>0
trigger1 = AnimElemTime(3)>=(8 - var(12))
trigger1 = 1 || var(12) := (var(12) + 8 - AnimElemTime(3))
value = 1301
elem = 1

[State 1302, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 72, 72, 72

[State 1302, TargetState]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElem = 1
value = 1311

[State 1302, TargetState]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElem = 2 || AnimElem = 3
value = 1312

[State 1302, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(12 * fvar(11) < 7, -7, -12 * fvar(11)))
kill = 1

[State 1302, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3
value = 30

[State 1302, PowerAdd]
type = PowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3 && !var(20)
value = 70

[State 1302, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 1302, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 1302, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(15) = 1
ignoreHitPause = 1

[State 1302, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 3
var(16) = 1
ignoreHitPause = 1

[State 1302, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,5
channel = 0

[State 1302, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 3
value = 2,10

[State 1302, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8013
ID = 8000
name = "Spark"
posType = P1
pos = -17, -80
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1302, EnvShake]
type = EnvShake
trigger1 = NumTarget && AnimElem = 3
time = 9
ampl = 3
freq = 60

[State 1302, End]
type = ChangeState
trigger1 = var(44) <= 0
trigger1 = !Animtime
trigger2 = NumTarget
trigger2 = !(Target, Alive)
trigger3 = Time >= ifelse(var(10)=2,180,ifelse(var(10)=1,135,90));Time >= 180
value = 1303


;---FINAL HIT---
[StateDef 1303]
type = S
physics = N
moveType = A
anim = 1302
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1303, TargetState]
type = TargetState
trigger1 = !time
trigger1 = NumTarget
value = 1313

[State 1303, ScreenBound]
type = ScreenBound
trigger1 = animelemtime(5)<0
value = 1
movecamera = 0,0

[State 1303, Width]
type = Width
trigger1 = animelemtime(5)<0
edge = 70, 0

[State 1303, Bind]
type = TargetBind
trigger1 = 1
trigger1 = NumTarget
pos = -10,-70

[State 1303, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1300,0
channel = 0

[State 1303, VelSet]
type = VelSet
trigger1 = animelem = 5
x = -3.5

[State 1303, VelSet]
type = VelSet
trigger1 = animelem = 6
y = ifelse(var(10)=2,-11,ifelse(var(10)=1,-9.5,-8))

[State 1303, VelAdd]
type = VelAdd
trigger1 = animelemtime(6)>0
y = .6

[State 1303, ChangeState]
type = ChangeState
trigger1 = pos Y >= 45
;trigger1 = vel Y > 0
value = 1304
ctrl = 0

;---END---
[Statedef 1304]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 1304,Posset]
type=posset
trigger1=!time
y=0

[State 1304, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1303

[State 1304, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = !time
value = 1314

[State 1304, TargetBind]
type = TargetBind
trigger1 = !time
pos = 35,0

[State 1304, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && !time
value = floor(ifElse(49 * fvar(11) < 7, -7, -49 * fvar(11)))
kill = 1

[State 1304, EnvShake]
type = EnvShake
trigger1 = !time
time = 20
freq = 90
ampl = -4

[State 1304, HitAdd]
type = HitAdd
trigger1 = NumTarget && !time
value = 1

[State 1304, Hit Count Increment]
type = varAdd
trigger1 = NumTarget && !time
var(13) = 1

[State 1304, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && !time
var(15) = 1
ignoreHitPause = 1

[State 1304, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && !time
var(16) = 1
ignoreHitPause = 1

[State 1304, PlaySnd]
type = PlaySnd
trigger1 = !time
value = 2,5

[State 1304, Helper]
type = Helper
trigger1 = !time
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = 35,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 1304, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---TARGET---
[Statedef 1310]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 1310, 1]
type = ChangeAnim2
trigger1 = !Time
value = 1310

;---TARGET HIT 1---
[StateDef 1311]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1311, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1311

[State 1311, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0

[State 1311, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 72, 72, 72

;---TARGET HIT 2---
[StateDef 1312]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1312, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 1312

[State 1312, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0

[State 1312, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 72, 72, 72


;---TARGET FINAL HIT---
[StateDef 1313]
type = A
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[State 1313, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 1313, ChangeAnim]
type = ChangeAnim2
trigger1 = !Time
value = 1313

[State 1313, ChangeState]
type = ChangeState
trigger1 = animelem = 4 && pos Y >= 0
value = 1314
ctrl = 0

;---TARGET END---
[StateDef 1314]
type = A
physics = N
moveType = H
ctrl = 0
velSet = 0,0
sprPriority = 0

[state 1314,Posset]
type=posset
trigger1=!time
y=0

[State 1314, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 1314

[State 1314, Turn]
type = Turn
trigger1 = !time

[State 1314, Gravity]
type = VelAdd
trigger1 = animelemtime(2)>0
y = .5

[State 1314, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 4
y = -8

[State 1314, Recover]
type = SelfState
trigger1 = command = "recovery"
trigger1 = Alive && CanRecover
trigger1 = vel y > -1 && pos y >= 0
value = 5200

[State 1314, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;---------------------------------------------------------------------------
;Wingless Airplane
[Statedef 1400]
type=A
physics=N
movetype=A
ctrl=0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1400, Anim]
type=changeanim
trigger1=!time
value=830

[State 1400, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1400, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
attr=S,ST
hitflag=A
priority = 1, Miss
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
p1stateno=1401

[State 1400, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 1400, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 1400, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 1400, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 1400, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---SUCCESS---
[Statedef 1401]
type = A
movetype = A
physics = S
anim = 1401
velset = 0, 0
poweradd = 0
sprpriority = 2

[State 1401, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1401, TargetFacing]
type = TargetFacing
trigger1 = !time
value = -1

[State 1401, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1401, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1410

[State 1401, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 1401, Voice]
type = PlaySnd
trigger1 = animelem = 1
value = 1400,0
channel = 0

[State 1401, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelem = 1
trigger2 = animelem = 2
pos = 14,-58

[State 1401, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelem = 3
trigger2 = animelem = 4
pos = 33,-75

[State 1401, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelem = 5
pos = -6,-75

[State 1401, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelem = 6
pos = -3,-95

[State 1401, Gravity]
type = Gravity
trigger1 = animelemtime(2)>0

[State 1401, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0
value = 1402
ctrl = 0


;---END---
[Statedef 1402]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 1402,Posset]
type=posset
trigger1=!time
y=0

[State 1402, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1402

[State 1402, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = !time
value = 1411

[State 1402, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = animelem = 1
pos = -50,-85

[State 1402, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = animelem = 2
pos = -55,-13

[State 1402, Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = animelem = 2
value = floor(ifElse(125 * fvar(11) < 7, -7, -125 * fvar(11)))

[State 1402, EnvShake]
type = EnvShake
trigger1 = animelem = 2
time = 20
freq = 90
ampl = -4

[State 1402, HitAdd]
type = HitAdd
trigger1 = NumTarget
trigger1 = animelem = 2
value = 1

[State 1402, Hit Count Increment]
type = varAdd
trigger1 = NumTarget
trigger1 = animelem = 2
var(13) = 1

[State 1402, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget
trigger1 = animelem = 2
var(15) = 1
ignoreHitPause = 1

[State 1402, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget
trigger1 = animelem = 2
var(16) = 1
ignoreHitPause = 1

[State 1402, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 2,5

[State 1402, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = -50,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 1402, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---TARGET---
[Statedef 1410]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 1410, 1]
type = ChangeAnim2
trigger1 = !Time
value = 1410

[State 1410, ChangeState]
type = ChangeState
trigger1 = animelem = 4 && pos Y >= 0
value = 1411
ctrl = 0

;---TARGET END---
[Statedef 1411]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 1411, 1]
type = ChangeAnim2
trigger1 = !Time
value = 1411

[State 1411, VelSet]
type = VelSet
trigger1 = animelemtime(2)=6
x = 4
y = -6

[State 1411, VelAdd]
type = VelAdd
trigger1 = animelemtime(2)>=7
y = .5

[State 1411, Recover]
type = SelfState
trigger1 = command = "recovery"
trigger1 = Alive && CanRecover
trigger1 = vel y > -1 && pos y >= 0
value = 5200

[State 1411, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100


;---------------------------------------------------------------------------
; EX Wingless Airplane
[Statedef 1450]
type=A
physics=N
movetype=A
ctrl=0
sprpriority=1
poweradd=ifelse(var(53) > 0, 0, -500)
facep2=1

[State 1450, Anim]
type=changeanim
trigger1=!time
value=830

[State 1450, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1450, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1450, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1450, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1450, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1450, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 20, -55
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1450, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000

[State 1450, Ex AfterImage]
type = AfterImage
triggerall = var(55) = 1
trigger1 = !Time
time = 2
timegap = 1
framegap = 1
length = 8
palcontrast = 128, 112, 0
palmul = 0.65, 0.65, 0.65
trans = add

[State 1450, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
attr=S,ST
hitflag=AF
priority = 1, Miss
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
p1stateno=1451

[State 1450, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 1450, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 1450, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 1450, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 1450, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---SUCCESS---
[Statedef 1451]
type = A
movetype = A
physics = S
anim = 1450
velset = 0, 0
poweradd = 0
sprpriority = 2

[State 1451, NHB]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1451, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 1401, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 1460

[State 1451, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 1451, Voice]
type = PlaySnd
trigger1 = animelem = 1
value = 1400,0
channel = 0

[State 1451, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelemtime(9)<0
pos = 0,-65

[State 1451, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelem = 9
trigger2 = animelem = 10
pos = 33,-75

[State 1451, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelem = 11
pos = -6,-75

[State 1451, Bind]
type = TargetBind
triggerall = NumTarget
trigger1 = animelemtime(12) >= 0
pos = -3,-95

[State 1451, Gravity]
type = Gravity
trigger1 = animelemtime(8)>0

[State 1451, ChangeState]
type = ChangeState
trigger1 = pos Y >= 0
value = 1452
ctrl = 0


;---END---
[Statedef 1452]
type=S
physics=S
movetype=I
ctrl=0
velset=0,0
sprpriority=1

[state 1452,Posset]
type=posset
trigger1=!time
y=0

[State 1452, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = 1402

[State 1452, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = !time
value = 1411

[State 1452, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = animelem = 1
pos = -50,-85

[State 1452, TargetBind]
type = TargetBind
trigger1 = NumTarget
trigger1 = animelem = 2
pos = -55,-13

[State 1452, Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = animelem = 2
value = floor(ifElse(145 * fvar(11) < 7, -7, -145 * fvar(11)))

[State 1452, EnvShake]
type = EnvShake
trigger1 = animelem = 2
time = 20
freq = 90
ampl = -4

[State 1452, HitAdd]
type = HitAdd
trigger1 = NumTarget
trigger1 = animelem = 2
value = 1

[State 1452, Hit Count Increment]
type = varAdd
trigger1 = NumTarget
trigger1 = animelem = 2
var(13) = 1

[State 1452, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget
trigger1 = animelem = 2
var(15) = 1
ignoreHitPause = 1

[State 1452, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget
trigger1 = animelem = 2
var(16) = 1
ignoreHitPause = 1

[State 1452, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 2,5

[State 1452, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal ;player
name = "Ground Impact"
ID = 8110
stateno = 8110
pos = -50,0
postype = p1    ;p2,front,back,left,right
ownpal = 1

[State 1452, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---TARGET---
[Statedef 1460]
type = A
movetype = H
physics = N
ctrl = 0
velset = 0,0

[State 1460, 1]
type = ChangeAnim2
trigger1 = !Time
value = 1460

[State 1460, ChangeState]
type = ChangeState
trigger1 = animelem = 4 && pos Y >= 0
value = 1411
ctrl = 0


;PUNCH ZERO COUNTER
[STATEDEF 2900]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0
faceP2 = 1

[STATE 2900,POSSET]
type=posset
trigger1=!time
y=0

[STATE 2900,ANIM]
type=changeanim
trigger1=!time
value=2900

[STATE 2900,DUST]
type = helper
trigger1 = Animelem=3
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[STATE 2900,WIDTH]
type = Width
trigger1 = 1
edge = 30,0

[STATE 2900,NOT HIT BY]
type = NotHitBy
trigger1 = Anim = 2900
trigger1 = AnimElemNo(0) = [1,5]
value = SCA
time = 1

[STATE 2900,HIT]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 2900
attr = S,SA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getpower = 0
givepower = 0, 0
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animtype = Heavy
air.animtype = Heavy
fall.animtype = Diagup
ground.type = hIGH
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity = -5,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4,-7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8013)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[STATE 2900,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[STATE 2900,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
 
;KICK ZERO COUNTER
[STATEDEF 2910]
type = S
physics = S
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[STATE 2910,POSSET]
type=posset
trigger1=!time
y=0

[STATE 2910,ANIM]
type=changeanim
trigger1=!time
value=2910

[STATE 2910,NOT HIT BY]
type = nothitby
trigger1 = animelemtime(6) < 0
value = SCA
time = 1
ignorehitpause = 1

[STATE 2910,WIDTH]
type = Width
trigger1 = 1
edge = 40,0

[State 2910, Snd]
type=playsnd
trigger1= animelem=3
value=101,0

[State 2910, VelSet]
type = VelSet
trigger1 = animelem=3
x = 10

[State 2910, Dust]
type = helper
trigger1 = animelem=3
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[STATE 2910,HIT]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
ID = 2910
attr = S, SA
hitFlag = MAF
guardFlag = M
damage =ceil(ifelse(fvar(11) * 100 < 7, 7, fvar(11) * 100)), 7
getPower = 0, 0
givePower = 0, 0
pausetime = ceil(13*(2-(var(20)>0))/2),ceil(13*(2-(var(20)>0))/2)
guard.pausetime = ceil(10*(2-(var(20)>0))/2),ceil(10*(2-(var(20)>0))/2)
animType = Back
air.animType = Back
fall.animType = Diagup
ground.type = High
air.type = Low
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6,-5.5
ground.cornerPush.velOff = 0
guard.velocity = -6
guard.cornerPush.velOff = 0
air.velocity = -6.46, -4.25
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = S-1 + 0*(var(33):=8013)
guard.sparkno = S-1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=76), var(36):=-23
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[STATE 2910,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[STATE 2910,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1