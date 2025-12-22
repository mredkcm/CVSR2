; _________________________________________
;| Ryo Sakazaki by CrazyKoopa & Jmorphman  |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>====
;==

;---------------------------------------------------------------------------
;Ko'ouken
[Statedef 1000]
type=S
physics=N
movetype=A
anim=1000
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

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
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1
channel = 1

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = ifElse(var(10) = 0, 1004, ifElse(var(10) = 1, 1014, 1024))
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5,0.5
ownpal = 1
removeongethit = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 4
helpertype = normal
stateno = 1005
ID =1005
name = "Ko'oken"
postype = p1
pos = 65,-73
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;EX Ko'ouken
[Statedef 1030]
type=S
physics=N
movetype=A
anim=1030
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1420, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 31

[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -15, -78
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1
channel = 3

[State 1011, 0]
type = velset
trigger1 = animelem = 3
x = 12
[State 1011, 0]
type = velset
trigger1 = animelem = 4
x = 0

[State 1011, 0]
type = posadd
trigger1 = animelem = 5
trigger2 = animelem = 6
x = 4

[State 0, Explod]
type = Explod
trigger1 = !Time
anim = 1034
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5,0.5
ownpal = 1
removeongethit = 1

[State 0, Helper]
type = Helper
trigger1 = animelem = 4
helpertype = normal
stateno = 1005
ID =1005
name = "EX Ko'oken"
postype = p1
pos = 65,-73
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 1000, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;Aerial Ko'oken
[Statedef 1050]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
sprpriority = 1
poweradd = 72 * !var(20)

[State 1050, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))

[State 1050, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 333, 2, ifelse(random < 500, 1, 0))

[State 1050, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 1050, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1000,1
channel = 1

[State 1050, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 24,0

[State 1050, Explod]
type = Explod
trigger1 = !Time
anim = 1054
id = 1054
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5,0.5
ownpal = 1
removeongethit = 1

[State 1050, Air Ko'oken]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 1055
ID = 1055
name = "Aerial Ko'oken"
postype = p1
pos = 68,-30
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 920, 0]
type = Posfreeze
trigger1 = AnimElemTime(6) < 0

[State 1300, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I

[State 920, 0]
type = VelAdd
trigger1 = AnimElemTime(6) >= 0
y = .47

[State 1300, End]
type = changestate
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(4) > 0
value = 1051


;--- Land ---
[Statedef 1051]
type = S
physics = N
movetype = I
anim = 1051
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1301, Pos]
type = posset
trigger1 = 1
y = 0

[State 1301, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 1301, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1054
ignorehitpause = 1

[State 1301, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;EX Aerial Ko'oken
[Statedef 1080]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
sprpriority = 1
poweradd = -500

[State 1050, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = 3

[State 1080, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1080, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1080, ExFX]
type = varset
trigger1 = !time
var(25) = 16

[State 1080, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -30, -108
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1080, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1050, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 1050, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1000,1
channel = 3

[State 1050, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 24,0

[State 1050, Explod]
type = Explod
trigger1 = !Time
anim = 1054
id = 1054
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5,0.5
ownpal = 1
removeongethit = 1

[State 1050, Air Ko'oken]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 1055
ID = 1055
name = "EX Aerial Ko'oken"
postype = p1
pos = 68,-30
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1300, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I

[State 920, 0]
type = VelAdd
trigger1 = 1
y = .47

[State 1300, End]
type = changestate
trigger1 = pos y > -vel y
value = 1051


;---------------------------------------------------------------------------
;Koho
[Statedef 1100]
type = S
physics = N
moveType = A
anim = 1100
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1100, Button]
type=varset
trigger1= !time && !AILevel
var(10)= ifelse((command="z" || command="rlsz"), 2, ifelse((command="y" || command="rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1100, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0 && !var(10)
trigger2 = AnimElemTime(4) < 0 && var(10)
value = SCA
time = 1

[State 1100, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1120, ifelse(var(10)=1, 1110, 1100))

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 1

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 3

[State 1100, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
statetype = A
physics = N

[State 40, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 280, go]
type = VelSet
trigger1 = animelem = 4
x = ifElse(var(10) = 2, 5.12493896484375, ifElse(var(10) = 1, 3.309860229492188, 1.494781494140625))
y = ifElse(var(10) = 2, -8.5, ifElse(var(10) = 1, -7.25, -6))

[State 1030, 1]
type = Velmul
trigger1 = animelemtime(4) > 0
x= 0.85415773463179600253159388334252

[State 1030, 1]
type = VelAdd
trigger1 = animelemtime(4) > 0
Y = 0.5

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=3
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 119, ifElse(var(10), 112, 105)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 119, ifElse(var(10), 112, 105)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=19), var(36):=-89
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1200, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 && !MoveContact && !MoveReversed
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 84, ifElse(var(10), 77, 70)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 84, ifElse(var(10), 77, 70)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=5), var(36):=-137
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 110, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101


;Land
[Statedef 1101]
type=S
physics=N
movetype=I
anim=1101
ctrl=0
velset=0,0
sprpriority=1

[State 40, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 52, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;EX Koho
[Statedef 1130]
type=S
physics=N
movetype=A
anim=1130
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1130, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1130, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1130, ExFX]
type = varset
trigger1 = !time
var(25) = 23

[State 1130, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -6, -71
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(5) < 3
value = SCA
time = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1,2
channel = 3

[State 1100, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 4

[State 1100, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
statetype = A
physics = N

[State 40, Dust]
type = helper
trigger1 = animelem = 4
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 280, go]
type = VelSet
trigger1 = animelem = 4
x = 7.940017700195313
y = -9.75

[State 1030, 1]
type = Velmul
trigger1 = animelemtime(4) > 0
x= 0.85415773463179600253159388334252

[State 1030, 1]
type = VelAdd
trigger1 = animelemtime(4) > 0
Y = 0.5

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=3
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 126 < 7, 7, fvar(11) * 126)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 18,18
guard.pausetime = 18,18
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=19), var(36):=-89
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
forcestand = 1

[State 1200, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4 && !MoveContact && !MoveReversed
attr = A, SA
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 18,18
guard.pauseTime = 18,18
animType = Back
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -2.16, -8.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2.16, -8.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=5), var(36):=-137
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
forcestand = 1

[State 1130, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1130, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
value = 1101



;---------------------------------------------------------------------------
;Hien Shippukyaku
[Statedef 1200]
type=S
physics=N
movetype=A
anim=1200
ctrl=0
velset=0,0
sprpriority=1
powerAdd = 72 * !var(20)
facep2=1

[State 1100, Button]
type=varset
trigger1= !time
var(10) = ifElse((command = "c" || command = "rlsc"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[State 40, Snd]
type = playsnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 40, Snd]
type = playsnd
trigger1 = AnimElemTime(2) = 6
value = 1200,1
channel = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(2) = 6
StateType = A
physics = N

[State 1400, Dust Helper (Sliding)]
type = Helper
trigger1 = AnimElemTime(2) = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Hien Shippukyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElemTime(2) = 6
x = ifElse(var(10) = 2, 8.5, ifElse(var(10) = 1, 7, 5.5))
y = ifElse(var(10) = 2, -3.1, ifElse(var(10) = 1, -2.95, -2.8))

[State 1100, Gravity]
type = Veladd
trigger1 = AnimElemTime(2) > 6
y = .25

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= AnimElem = 3
ID = 1200
attr = A,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 28, ifElse(var(10), 105, 98)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 28, ifElse(var(10), 105, 98)))), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 9 - var(10)
air.hittime = 120
ground.velocity = -4.32, ifElse(var(10) = 2, 0, -6.91)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, ifElse(var(10) = 2, -2.91, -6.91)
air.cornerpush.veloff = 0
yaccel = 0.58
fall = ifElse(var(10) = 2, 0, 1)
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=60), var(36):=-59
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = NumTarget(1200) && MoveHit && var(10) = 2
value = 1221
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(4) > 0
value = 1201


;Land
[Statedef 1201]
type=S
physics=N
movetype=I
anim=1201
ctrl=0

[State 0, PosSet]
type = PosSet
trigger1 = AnimElem = 2
y = 0

[State 52, 2]
type = VelSet
trigger1 = AnimElem = 2
y = 0

[State 52, 2]
type = VelMul
trigger1 = !Time
x = .92

[State 40, Snd]
type = playsnd
trigger1 = AnimElem = 2
value = 52,0

[State 52, Dust]
type = explod
trigger1 = AnimElem = 2
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;HK Second Hit
[Statedef 1221]
type=A
physics=N
movetype=A
anim=1221
ctrl=0
sprpriority=1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 3

[State 1100, VarSet]
type = VarSet
trigger1 = !Time
fvar(0) = vel Y

[State 1100, Velocity]
type = VelSet
trigger1 = !time
x = 4
y = 0

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElemTime(4) = 1
y = fvar(0)

[State 1100, Gravity]
type = Veladd
trigger1 = AnimElemTime(4) > 1
y = .25

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<2 || var(20))
trigger1= AnimElem = 4
attr = A,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*84<7, 7, fvar(11)*84)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32, -6.91
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -6.91
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=64), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1221, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(4) > 1
value = 1201



;---------------------------------------------------------------------------
;EX Hien Shippukyaku
[Statedef 1230]
type=S
physics=N
movetype=A
anim=1230
ctrl=0
velset=0,0
sprpriority=1
powerAdd = -500
facep2=1

[State 1130, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1130, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1130, ExFX]
type = varset
trigger1 = !time
var(25) = 28

[State 1130, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -4, -71
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 40, Snd]
type = playsnd
trigger1 = !Time
value = 1200,0
channel = 0

[State 40, Snd]
type = playsnd
trigger1 = AnimElemTime(2) = 6
value = 1200,1
channel = 3

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElemTime(2) = 6
StateType = A
physics = N

[State 1400, Dust Helper (Sliding)]
type = Helper
trigger1 = AnimElemTime(2) = 6
helperType = Normal
stateNo = 8103
ID = 8100
name = "Hien Shippukyaku Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElemTime(2) = 6
x = 11.5
y = -2.8

[State 1100, Gravity]
type = Veladd
trigger1 = AnimElemTime(2) > 6
y = .25

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= AnimElem = 3
ID = 1230
attr = A,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getPower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -4.32, -2.91
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=60), var(36):=-59
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = NumTarget(1230) && MoveHit
value = 1231
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(4) > 0
value = 1201


;Follow-up
[Statedef 1231]
type=A
physics=N
movetype=A
anim=1231
ctrl=0
sprpriority=1

[State 1130, ExFX]
type = varset
trigger1 = !time
var(25) = 14

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,5
channel = 3

[State 1100, Velocity]
type = VelSet
trigger1 = !time
x = 4
y = 0

[State 1100, Gravity]
type = Veladd
trigger1 = AnimElemTime(4) > 1
y = .25

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<2 || var(20))
trigger1= AnimElem = 4
ID = 1231
attr = A,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*77<7, 7, fvar(11)*77)), 0
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -1.12, -9.91
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -1.12, -9.91
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=64), var(36):=-80
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1430, Juggle Reset]
type = VarSet
trigger1 = MoveHit && !var(11)
var(15) = 0

[State 1430, VarAdd]
type = VarAdd
trigger1 = MoveHit
var(11) = 1
persistent = 0

[State 1430, Juggle Flag]
type = VarSet
trigger1 = var(11) = 2
var(16) = 1

[State 1221, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 0, ChangeState]
type = ChangeState
trigger1 = pos y > -vel y
trigger1 = AnimElemTime(4) > 1
value = 1201



;---------------------------------------------------------------------------
;Zanretsuken
[Statedef 1300]
type=S
physics=N
movetype=A
anim=1300
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(((Power < 1000 && Random < 500) || Random < 333), 2, ifElse(Random < 500, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 10 || AnimElem = 13
trigger2 = AnimElem = 16 || AnimElem = 19 || AnimElem = 22 || AnimElem = 25
trigger3 = var(10)
trigger3 = AnimElem = 28 || AnimElem = 31 || AnimElem = 34 || AnimElem = 37
trigger4 = var(10) = 2
trigger4 = AnimElem = 40 || AnimElem = 43 || AnimElem = 46 || AnimElem = 49
value = 1,2

[State 1300, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(2)  >= 0 && AnimElemTime(3) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,12
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 25), (var(36) := -78)
hitSound = S3,0
numHits = 0

;First Punch (Mid level)
[State 1300, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4 || animelem = 16
trigger2 = var(10) && animelem = 28
trigger3 = var(10) && animelem = 40
ID = 1300
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0,7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = 0,ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 66), var(36) := -81
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p2Facing = 1

;Second Punch (Mid-High level)
[State 1300, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 7 || animelem = 19
trigger2 = var(10) && animelem = 31
trigger3 = var(10) && animelem = 43
ID = 1300
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0,7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = 0,ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 63), var(36) := -100
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p2Facing = 1

;Third Punch (Low level)
[State 1300, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 10 || animelem = 22
trigger2 = var(10) && animelem = 34
trigger3 = var(10) && animelem = 46
ID = 1300
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0,7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = 0,ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -53
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p2Facing = 1

;Fourth Punch (High level)
[State 1300, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 13 || animelem = 25
trigger2 = var(10) && animelem = 37
trigger3 = var(10) && animelem = 49
ID = 1300
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0,7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = 0,ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 54), var(36) := -114
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p2Facing = 1

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(27) >= 0 && !var(10)
trigger2 = AnimElemTime(39) >= 0 && var(10) = 1
trigger3 = AnimElemTime(51) >= 0 && var(10) = 2
moveType = I

[State 1300, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1300) > 1
ID = 1300
keepOne = 1
excludeID = 1300
ignoreHitPause = 1

[State 1300, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1300)
value = 1305
ID = 1300
ignoreHitPause = 1
persistent = 0

[State 1300, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(1300)
value = 1301

[State 1300, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;Zanretsuken (Success)
[Statedef 1301]
type=S
anim=1301
physics=N
movetype=A
velset=0,0

[State 1301, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1321, 1301)

[State 1301, bind]
type = targetbind
trigger1 = !time
pos = 40, 0

[State 1310, bind]
type = targetbind
trigger1 = animelemtime(41) = 1 && var(10) != 2
pos = 60, target, pos y
ignorehitpause = 1

[State 1301, Width]
type = Width
trigger1 = !Time
edge = 64,0

[State 1310, PlaySnd]
type = PlaySnd
trigger1 = !Time || animelem =  4 || animelem = 7 || animelem = 10
trigger2 = animelem = 13 || animelem = 16 || animelem = 19 || animelem = 22
trigger3 = animelem = 25 || animelem = 28 || animelem = 31 || animelem = 34
trigger4 = AnimElem = 39
value = 1,2

[State 1301, Spark XY]
type = Null
trigger1 = AnimElem = 1 || animelem = 4 || AnimElem = 7
trigger1 = var(35) := 64 || var(36) := -53
trigger2 = AnimElem = 10 || animelem = 13 || AnimElem = 16
trigger2 = var(35) := 66 || var(36) := -81
trigger3 = AnimElem = 19 || animelem = 22 || animelem = 25
trigger3 = var(35) := 63 || var(36) := -100
trigger4 = AnimElem = 28 || animelem = 31 || animelem = 34
trigger4 = var(35) := 54 || var(36) := -114

;Low
[State 1310, Hit]
type = hitdef
trigger1 = AnimElem = 1 || animelem = 4 || animelem = 7
trigger2 = animelem = 19 || animelem = 22 || animelem = 25
ID = 1301
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 0,0
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0
p2Facing = 1

;High
[State 1310, Hit]
type = hitdef
trigger1 = animelem = 10 || animelem = 13 || animelem = 16
trigger2 = animelem = 28 || animelem = 31 || animelem = 34
ID = 1301
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 0,0
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0
p2Facing = 1

[State 1301, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1301) > 1
ID = 1301
keepOne = 1
excludeID = 1301
ignoreHitPause = 1

[State 1201, TargetState]
type = TargetState
triggerAll = NumTarget(1301)
trigger1 = AnimElemtime(1) = 1 || animelemtime(4) = 1 || animelemtime(7) = 1
trigger2 = AnimElemtime(10) = 1 || animelemtime(13) = 1 || animelemtime(16) = 1
trigger3 = AnimElemtime(19) = 1 || animelemtime(22) = 1 || animelemtime(25) = 1
trigger4 = AnimElemtime(28) = 1 || animelemtime(31) = 1 || animelemtime(34) = 1
value = 1306
ID = 1301
ignorehitpause = 1

[State 220, LP/MP Finish]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=41 && var(10) != 2
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifElse(var(10), 84, 63) < 7, 7, fvar(11) * ifElse(var(10), 84, 63))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = ifelse(var(20), 6, 44), ifelse(var(20), 6, 44)
guard.pausetime = ifelse(var(20), 6, 44), ifelse(var(20), 6, 44)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.16, -4.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.16, -4.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=66), var(36):=-71
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = var(10) != 2
trigger1 = HitPauseTime <= ifelse(var(20), 3, 41)
value = 1301
elem = 42
ignoreHitPause = 1

[State 220, HP Finish]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=41 && var(10) = 2
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pausetime = ifelse(var(20), 6, 44), ifelse(var(20), 6, 44)
guard.pausetime = ifelse(var(20), 6, 44), ifelse(var(20), 6, 44)
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -4.16, -10.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -4.16, -10.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=32), var(36):=-124
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 3010, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(42) >= 0
moveType = I

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;Zanretsuken attempt P2 State
[Statedef 1305]
type=S
movetype=H
physics=N
velset=0,0

[State 1305, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1305, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 820, 2]
type = SelfState
trigger1 = time = 100
value = 5050



;Being hit by Zanretsuken
[Statedef 1306]
type = S
movetype= H
physics = N
ctrl = 0
velset = 0,0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5001, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5005 + GetHitVar(animtype) + (GetHitVar(groundtype)=2)*10

[State 1045, PosAdd]
type = PosAdd
trigger1 = !time
y = -3

[State 820, 2]
type = SelfState
trigger1 = time = 16
value = 5050



;---------------------------------------------------------------------------
;EX Zanretsuken
[Statedef 1330]
type=S
physics=N
movetype=A
anim=1330
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1330, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1330, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1330, ExFX]
type = varset
trigger1 = !time
var(25) = 157

[State 1330, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -17, -83
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1300, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 10 || AnimElem = 13
trigger2 = AnimElem = 16 || AnimElem = 19 || AnimElem = 22 || AnimElem = 25
value = 1,2

[State 1300, Auto Guard]
type = ReversalDef
trigger1 = AnimElemTime(2)  >= 0 && AnimElemTime(4) < 0
reversal.attr = SCA, NA, SA
pauseTime = 12,12
sparkNo = -1 + 0 * (var(33) := 8001)
sparkXY = -10 + 0 * (var(35) := 25), (var(36) := -78)
hitSound = S3,0
numHits = 0

;First Punch (Mid level)
[State 1300, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4 || animelem = 16
ID = 1330
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0,7
getPower = 0,0
givepower = 36, 36
pausetime = 0,ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 66), var(36) := -81
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p2Facing = 1

;Second Punch (Mid-High level)
[State 1300, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 7 || animelem = 19
ID = 1330
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0,7
getPower = 0,0
givepower = 36, 36
pausetime = 0,ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 63), var(36) := -100
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p2Facing = 1

;Third Punch (Low level)
[State 1300, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 10 || animelem = 22
ID = 1330
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0,7
getPower = 0,0
givepower = 36, 36
pausetime = 0,ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 64), var(36) := -53
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p2Facing = 1

;Fourth Punch (High level)
[State 1300, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 13 || animelem = 25
ID = 1330
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 0,7
getPower = 0,0
givepower = 36, 36
pausetime = 0,ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
ground.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 54), var(36) := -114
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p2Facing = 1

[State 1330, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(27) >= 0
moveType = I

[State 1330, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1330) > 1
ID = 1330
keepOne = 1
excludeID = 1330
ignoreHitPause = 1

[State 1330, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1330)
value = 1305
ID = 1330
ignoreHitPause = 1
persistent = 0

[State 1330, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(1330)
value = 1331

[State 1330, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;Zanretsuken (Success)
[Statedef 1331]
type=S
anim=1331
physics=N
movetype=A
velset=0,0

[State 1301, bind]
type = targetbind
trigger1 = !time
pos = 40, 0

[State 1301, Width]
type = Width
trigger1 = !Time
edge = 64,0

[State 1310, PlaySnd]
type = PlaySnd
trigger1 = !Time || animelem = 4 || animelem = 7 || animelem = 10
trigger2 = animelem = 13 || animelem = 16 || animelem = 19 || animelem = 22
trigger3 = animelem = 25 || animelem = 28 || animelem = 31 || animelem = 34
trigger4 = AnimElem = 37 || animelem = 40 || animelem = 43 || animelem = 46
trigger5 = animelem = 51 || animelem = 60
value = 1,2

[State 1331, Spark XY]
type = Null
trigger1 = AnimElem = 1 || animelem = 4 || AnimElem = 7 || AnimElem = 10
trigger1 = var(35) := 64 || var(36) := -53
trigger2 = AnimElem = 13 || AnimElem = 16 || animelem = 19 || AnimElem = 22
trigger2 = var(35) := 66 || var(36) := -81
trigger3 = AnimElem = 25 || AnimElem = 28 || AnimElem = 31 || animelem = 34
trigger3 = var(35) := 63 || var(36) := -100
trigger4 = AnimElem = 37 || AnimElem = 40 || AnimElem = 43 || AnimElem = 46
trigger4 = var(35) := 54 || var(36) := -114

;Low
[State 1310, Hit]
type = hitdef
trigger1 = AnimElem = 1 || animelem = 4 || AnimElem = 7 || AnimElem = 10
trigger2 = AnimElem = 25 || AnimElem = 28 || AnimElem = 31 || animelem = 34
ID = 1331
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 0,0
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

;High
[State 1310, Hit]
type = hitdef
trigger1 = AnimElem = 13 || AnimElem = 16 || animelem = 19 || AnimElem = 22
trigger2 = AnimElem = 37 || AnimElem = 40 || AnimElem = 43 || AnimElem = 46
ID = 1331
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 4, fvar(11) * 7)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 0,0
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = 0,0
air.cornerpush.veloff = 0
yaccel = 0.58
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 1500, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1331) > 1
ID = 1331
keepOne = 1
excludeID = 1331
ignoreHitPause = 1

[State 1201, TargetState]
type = TargetState
triggerAll = NumTarget(1331)
trigger1 = AnimElemtime(1) = 1 || animelemtime(4) = 1 || AnimElemtime(7) = 1 || AnimElemtime(10) = 1
trigger2 = AnimElemtime(13) = 1 || AnimElemtime(16) = 1 || animelemtime(19) = 1 || AnimElemtime(22) = 1
trigger3 = AnimElemtime(25) = 1 || AnimElemtime(28) = 1 || AnimElemtime(31) = 1 || animelemtime(34) = 1
trigger4 = AnimElemtime(37) = 1 || AnimElemtime(40) = 1 || AnimElemtime(43) = 1 || AnimElemtime(46) = 1
value = 1306
ID = 1331
ignorehitpause = 1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=53
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getPower = 0,0
givePower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -0.76, -5.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -0.76, -5.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) :=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=30), var(36):=-115
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 220, Finish]
type=hitdef
trigger1= !var(16) && (var(15)<2 || var(20))
trigger1= animelem=62
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 105 < 7, 7, fvar(11) * 105)), 7
getPower = 0,0
givePower = 36, 36
pausetime = ifelse(var(20), 22, 44), ifelse(var(20), 22, 44)
guard.pausetime = ifelse(var(20), 22, 44), ifelse(var(20), 22, 44)
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -6.16, -4.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -6.16, -4.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 0
forceStand = 1
hitSound = -1 + 0 * (var(31) := 7)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=66), var(36):=-71
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, ChangeAnimElem]
type = ChangeAnim
trigger1 = MoveContact = 1 && HitPauseTime
trigger1 = AnimElemTime(62) >= 0
trigger1 = HitPauseTime <= ifelse(var(20), 3, 41)
value = 1331
elem = 63
ignoreHitPause = 1

[State 3010, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(63) >= 0
moveType = I

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;Kyokugenryu Renbuken
[Statedef 1400]
type=S
physics=S
movetype=A
anim=1400
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 64, 2, ifElse(P2Dist x > 46, 1, 0))

[State 1400, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1420, ifelse(var(10)=1, 1410, 1400))

[State 1400, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 4,0
channel = 0

[State 1400, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 1400, Velocity]
type = VelSet
trigger1 = !Time && var(10)
x = ifelse(var(10) = 1, 4, 5)

[State 1400, Velocity]
type = VelSet
trigger1 = var(10) = 1 && AnimElem = 2
trigger2 = var(10) = 2 && AnimElem = 3
x = 0

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=3
ID = 1400
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*14<7, 7, fvar(11)*14)), 7
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Low
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
air.fall = 1
fall.recover = 1
forceStand = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=54), var(36):=-72
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1330, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(1400) && AnimElemTime(5) = 0
value = 1401

[State 3010, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;Kyokugenryu Renbuken (Sucess)
[Statedef 1401]
type=S
anim=1401
physics=N
movetype=A
velset=0,0

[State 1030, ExFX]
type = varset
trigger1 = !time && PrevStateNo = 1430
var(25) = 27

[State 810, EX HitCount]
type = VarAdd
trigger1 = !time && PrevStateNo = 1430
var(13) = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 4,1
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
value = 1100,0
channel = 0

[State 1401, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3
trigger2 = AnimElem = 8
value = 1,2
channel = 1

[State 220, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1= animelem=4
ID = 1400
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*14<7, 7, fvar(11)*14)), 7
getpower = ifElse(PrevStateNo = 1430, 0, 12) * !var(20), ifElse(PrevStateNo = 1430, 0, 12) * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -4.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 1
fall.recovertime = 120
forceStand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkXY = -10 + 0*(var(35):=40), var(36):=-72
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 220, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1= animelem=9
ID = 1400
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*14<7, 7, fvar(11)*14)), 7
getpower = ifElse(PrevStateNo = 1430, 0, 12) * !var(20), ifElse(PrevStateNo = 1430, 0, 12) * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -4.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 1
fall.recovertime = 120
forceStand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=23), var(36):=-63
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 220, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1= animelem=11
ID = 1401
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2 || PrevStateNo = 1430, 42, ifElse(var(10), 35, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2 || PrevStateNo = 1430, 42, ifElse(var(10), 35, 28)))), 7
getpower = ifElse(PrevStateNo = 1430, 0, 12) * !var(20), ifElse(PrevStateNo = 1430, 0, 12) * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -1.16, -9.81
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.16, -7.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=30), var(36):=-115
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1401, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(12) >= 0
moveType = I

[State 1401, VarAdd]
type = VarAdd
trigger1 = NumTarget(1401)
trigger1 = MoveHit
var(12) = 1
persistent = 0

[State 1401, Juggle Flag]
type = VarSet
trigger1 = var(12) = 2
var(16) = 1

[State 1401, ChangeState]
type = ChangeState
trigger1 = NumTarget(1401)
trigger1 = MoveHit
trigger1 = command = "highjump"
trigger1 = var(12) < 2
trigger1 = AnimElemTime(11) >= 0 && AnimElemTime(14) < 0
value = 1402
ignoreHitPause = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;High jump cancel
[StateDef 1402]
type = S
physics = S
moveType = I
anim = 40
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 1402, Juggle Reset]
type = VarSet
trigger1 = !Time
var(15) = 0

[State 1402, Direction]
type = VarSet
trigger1 = !Time
sysvar(1) = 0

[State 1402, Direction]
type = VarSet
trigger1 = !Time
sysvar(1) = ifElse(command = "holdfwd" || command = "rlsfwd", 1, ifElse(command = "holdback"|| command = "rlsback", -1, sysvar(1)))

[State 1402, High Jump]
type = VarSet
trigger1 = !Time
var(3) = 3

[State 1402, Jump Sound]
type = PlaySnd
trigger1 = !AnimTime
value = 41

[State 1402, Dust Helper]
type = Helper
trigger1 = !AnimTime
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 1402, VelSet]
type = VelSet
trigger1 = !AnimTime
x = ifElse(!sysvar(1), const(velocity.jump.neu.x), ifElse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifElse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 1402, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1


;---------------------------------------------------------------------------
;EX Kyokugen Renbuken
[Statedef 1430]
type=S
physics=N
movetype=A
anim=1430
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

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

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 12

[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 10, -75
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1400, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1400,0
channel = 0

[State 1400, Woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 3

[State 1400, Velocity]
type = VelSet
trigger1 = !Time
x = 6

[State 1400, Velocity]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = AnimElem = 3 && !var(43)
ID = 1430
attr = S,ST
hitflag = M
priority = 4, Miss
damage = ceil(ifelse(fvar(11)*42<7, 7, fvar(11)*42)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Low
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 1
forceStand = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=54), var(36):=-72
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1330, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget(1430)
value = 1431

[State 3010, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;EX Kyokugenryu Renbuken (Sucess)
[Statedef 1431]
type=S
anim=1431
physics=N
movetype=A
velset=0,0

[State 1030, ExFX]
type = varset
trigger1 = !time && PrevStateNo = 1430
var(25) = 27

[State 810, EX HitCount]
type = VarAdd
trigger1 = !time && PrevStateNo = 1430
var(13) = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 11
value = 1400,0
channel = 0

[State 1401, Woosh]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 12
value = 1,2
channel = 1

[State 220, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 2 || var(20))
trigger1= animelem=6
ID = 1400
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*14<7, 7, fvar(11)*14)), 7
getpower = ifElse(PrevStateNo = 1430, 0, 12) * !var(20), ifElse(PrevStateNo = 1430, 0, 12) * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -4.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 1
fall.recovertime = 120
forceStand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkXY = -10 + 0*(var(35):=40), var(36):=-72
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 220, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 3 || var(20))
trigger1= animelem=13
ID = 1400
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*14<7, 7, fvar(11)*14)), 7
getpower = ifElse(PrevStateNo = 1430, 0, 12) * !var(20), ifElse(PrevStateNo = 1430, 0, 12) * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -4.36
air.cornerpush.veloff = 0
yaccel = .58
fall = 0
fall.recover = 1
fall.recovertime = 120
forceStand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=23), var(36):=-63
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 220, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 4 || var(20))
trigger1= animelem=14
ID = 1401
attr = S,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*56<7, 7, fvar(11)*56)), 7
getpower = ifElse(PrevStateNo = 1430, 0, 12) * !var(20), ifElse(PrevStateNo = 1430, 0, 12) * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Back
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -1.16, -11.41
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -1.16, -7.81
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=30), var(36):=-115
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1401, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(15) >= 0
moveType = I

[State 1430, Juggle Reset]
type = VarSet
trigger1 = NumTarget(1401)
trigger1 = MoveHit && !var(12)
var(15) = 0
persistent = 0

[State 1430, VarAdd]
type = VarAdd
trigger1 = NumTarget(1401)
trigger1 = MoveHit
var(12) = 1
persistent = 0

[State 1430, Juggle Flag]
type = VarSet
trigger1 = var(12) = 2
var(16) = 1

[State 1401, ChangeState]
type = ChangeState
trigger1 = NumTarget(1401)
trigger1 = MoveHit
trigger1 = command = "highjump"
trigger1 = var(12) < 2
trigger1 = AnimElemTime(14) >= 0 && AnimElemTime(17) < 0
value = 1402
ignoreHitPause = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1




;---------------------------------------------------------------------------
;Mokou Raijin Satsu
[Statedef 1500]
type=S
physics=N
movetype=A
anim=1500
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1500, Button]
type=varset
trigger1= !time
var(10) = ifElse((command = "z" || command = "rlsz"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(P2Dist x > 150, 2, ifElse(P2Dist x > 120, 1, 0))

[State 1500, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1520, ifelse(var(10)=1, 1510, 1500))

[State 1500, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,2
channel = 1

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1500,0
channel = 0

[State 1500, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 3

[State 1500, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 3.2+var(10)
y = -6.8-(var(10)*.8)

[State 1500, Gravity]
type = Veladd
trigger1 = AnimElemTime(2) > 0
y = 0.7

[State 40, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1500, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 2
statetype = A
physics = N

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=8
ID = 1500
attr = A,SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 98, ifElse(var(10), 91, 84)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 98, ifElse(var(10), 91, 84)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.40, 6.24
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.40, 6.24
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=49), var(36):=-71
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1500, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1500) > 1
ID = 1500
keepOne = 1
excludeID = 1500
ignoreHitPause = 1

[State 1500, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1500)
trigger1 = !(Target(1500), Time)
value = ifElse(Target(1500), StateType = A, 5425, 5420)
ID = 1500
ignoreHitPause = 1

[State 1500, ChangeState]
type = ChangeState
trigger1 = pos y - 30 > -vel y
value = 1501


;Land
[Statedef 1501]
type=S
anim=1501
physics=N
movetype=A
velset=0,0

[State 1500, Anim]
type=changeanim
trigger1= !time
value= ifelse(prevstateno = 1530, 1531, ifelse(var(10)=2, 1521, ifelse(var(10)=1, 1511, 1501)))

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 52, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 40, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1




;====<SLAMMED AGAINST THE GROUND>=
;Being Slammed (Standing)
[StateDef 5420]
type = U
moveType = H
physics = N
velset = 0,0

[State 5420, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = ifElse(SelfAnimExist(5111) || SelfAnimExist(5112), 5012, 5070)

[State 5420, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5420 + (StateType = C))
value = 5420 + (StateType = C)

[State 5420, End]
type = SelfState
trigger1 = HitShakeOver && pos y < 0
trigger2 = StateType = L
value = 5030

[State 5420, End]
type = ChangeState
trigger1 = HitShakeOver && pos y >= 0
value = 5421


;Hitting the Ground
[StateDef 5421]
type = L
moveType = H
physics = N
velSet = 0,0

[State 5421, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5102) && PrevStateNo != 5426, 5102, ifElse(SelfAnimExist(5101) && PrevStateNo != 5426, 5101, 5100))

[State 5421, ChangeAnim]
type = ChangeAnim
triggerall = !Time && PrevStateNo != 5426
trigger1 = SelfAnimExist(5422)
value = 5422

[State 5421, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 5421, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 5421, EnvShake]
type = EnvShake
trigger1 = !Time
time = 14
ampl = -4

[State 5421, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = F7,1

[State 5421, Hitting the Floor FX]
type = Explod
trigger1 = !Time
anim = F61
posType = P1
pos = 0, 0
sprPriority = -3

[State 5421, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Anim = 5100 + (Anim % 10)
trigger2 = Time = 4
trigger2 = Anim != 5422
trigger3 = Anim = 5422
trigger3 = AnimTime = 0 || Time = 12
value = 5422


;Bouncing Off Ground
[StateDef 5422]
type = L
moveType = H
physics = N

[State 5422, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5160 + Anim % 10), 5160 + Anim % 10, 5160)

[State 5422, ChangeAnim]
type = ChangeAnim
triggerall = !Time && Anim = 5422
trigger1 = SelfAnimExist(5424)
value = 5424

[State 5422, VelSet]
type = VelSet
trigger1 = !Time
y = -3.75

[State 5422, PosSet]
type = PosSet
trigger1 = !Time
y = const(movement.down.bounce.offset.y)

[State 5422, PosAdd]
type = PosAdd
trigger1 = !Time
x = const(movement.down.bounce.offset.x)

[State 5422, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.625

[State 5422, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5424
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = ifElse(SelfAnimExist(5162), 5162, ifElse(SelfAnimExist(5161), 5161, 5160))

[State 5422, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;Aerial Being Slammed (Hitshake)
[StateDef 5425]
type = A
moveType = H
physics = N
velSet = 0,0

[State 5425, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5070

[State 5425, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 5425, ChangeAnim]
type = ChangeState
trigger1 = HitShakeOver
value = 5426


;Aerial Being Slammed (Knocked Away)
[StateDef 5426]
type = A
moveType = H
physics = N
ctrl = 0

[State 5426, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yaccel)

[State 5426, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 5426, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.trip.groundlevel)
value = 5421



;---------------------------------------------------------------------------
;EX Mokou Raijin Satsu
[Statedef 1530]
type=S
physics=N
movetype=A
anim=1530
ctrl=0
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1530, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1530, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1530, ExFX]
type = varset
trigger1 = !time
var(25) = 30

[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 7, -67
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1530, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 7
value = 1,2
channel = 3

[State 1530, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1500,0
channel = 0

[State 1530, Jump Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
channel = 4

[State 1500, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = ifElse(p2dist x / 28 > 5.2, 5.2, p2dist x / 28)
y = -8.4

[State 1500, Gravity]
type = Veladd
trigger1 = AnimElemTime(2) > 0
y = 0.7

[State 40, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1500, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 2
statetype = A
physics = N

[State 1030, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= animelem=8
ID = 1530
attr = A,SA
hitflag = MAF
guardflag = HA
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*105<7, 7, fvar(11)*105)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0,0
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.40, 3.24
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 0
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=49), var(36):=-71
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1530, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1530) > 1
ID = 1530
keepOne = 1
excludeID = 1530
ignoreHitPause = 1

[State 1500, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(1530)
trigger1 = !(Target(1530), Time)
value = ifElse(Target(1530), StateType = A, 5425, 5420)
ID = 1530
ignoreHitPause = 1

[State 1500, ChangeState]
type = ChangeState
trigger1 = pos y - 30 > -vel y
value = 1501



;---------------------------------------------------------------------------
;Kogeki
[Statedef 1600]
type=S
physics=N
movetype=A
anim=1600
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 4,2
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 1000,1
channel = 1

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 1604
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 1605
bindTime = -1
sprpriority = 3
postype = p1
pos = 55,0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownpal = 1
removeongethit = 1

[State 428, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
ID = 1600
attr = C, SA
hitFlag = MAFD
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 63 < 7, 7, fvar(11) * 63)), 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 6)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 53), var(36) := -12
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1600, TargetDrop]
type = TargetDrop
trigger1 = NumTarget(1600) > 1
ID = 1600
keepOne = 1
excludeID = 1600
ignoreHitPause = 1

[State 1600, Opponent Recover]
type = TargetState
trigger1 = NumTarget(1600)
trigger1 = Target, StateType = L
value = 1605
ID = 1600
ignoreHitPause = 1
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


;Hit by Kogeki
[Statedef 1605]
type = L
movetype= H
physics = N
velset = 0,0

[State 5080, 1] ;Set default anim
type = VarSet
trigger1 = time = 0
sysvar(2) = ifelse (GetHitVar(yvel) = 0, 5080, 5090)

[State 5080, 2]
type = VarAdd
trigger1 = time = 0
trigger1 = (anim = [5081,5089]) || (anim = [5111,5119])
trigger1 = SelfAnimExist(sysvar(2) + (anim % 10))
sysvar(2) = anim % 10

[State 5080, 3] ;If 5090 doesn't exist, default to 5030
type = VarSet
trigger1 = time = 0
trigger1 = sysvar(2) = 5090
trigger1 = !SelfAnimExist(5090)
sysvar(2) = 5030

[State 5080, 3] ;Freeze
type = ChangeAnim
trigger1 = 1
value = sysvar(2)

[State 5080, 4]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0
value = 1606

[State 5080, 5]
type = SelfState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) != 0
value = 5030 ;Air get-hit (knocked away)


;knocked back
[Statedef 1606]
type = L
movetype= H
physics = C

[State 5081, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5081, 2]
type = VelSet
trigger1 = HitOver
x = 0

[State 5081, 3] ;Don't show hit ground frame
type = VarSet
trigger1 = Time = 0
sysvar(0) = 1

[State 5081, 4]
type = ChangeState
trigger1 = HitOver && Alive
value = 1607

[State 5081, 4]
type = SelfState
trigger1 = HitOver && !Alive
value = 5150


[Statedef 1607]
type = L
movetype= H
physics = N

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5110, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5110, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5110, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5110, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5110, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56))

[State 5110, 7]
type = Explod
trigger1 = Time = 0
trigger1 = !SysVar(0)
anim = F(60 + (sysvar(1) > Const720p(20)) + (sysvar(1) > Const720p(56)))
pos = 0, 0
sprpriority = ifelse (sysvar(1) <= Const720p(56), -10, 10)

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5110, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 5110, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5110, 11] ;If just died
type = SelfState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14] ;Friction
type = VelSet
trigger1 = abs(Vel x) < Const(movement.down.friction.threshold)
persistent = 0
x = 0

[State 5081, 4]
type = SelfState
trigger1 = !Time
value = 5120



;====< PUNCH ZERO COUNTER >=
[Statedef 2900]
type = S
physics = N
movetype = A
anim = 2900
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2900, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 220, Snd]
type=playsnd
trigger1= !time
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 220, Snd]
type=playsnd
trigger1= !time
value=1,2
channel=1

[State 2900, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=63), var(36):=-69
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 2900, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 2900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;====< KICK ZERO COUNTER >=
[Statedef 2910]
type = S
physics = N
movetype = A
anim = 2910
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2910, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 450, Snd]
type=playsnd
trigger1= animelem=2
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 450, Snd]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 2910, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 3
attr = C, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=83), var(36):=-10
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 2910, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 2910, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

