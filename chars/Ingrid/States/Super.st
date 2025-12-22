; _______________________
;| Ingrid by DeathScythe |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;---------------------------------------------------------------------------
; Sunburst
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
trigger1 = Time = 3
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
trigger1 = Time = 3
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 12, -82
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3000, Voice]
type = PlaySnd
trigger1 = !Time
value = 3000,0
channel = 0

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3000, Helper]
type = Helper
trigger1 = AnimElem = 7
stateno = 3005
ID = 3005
name = "Sunburst"
postype = p1
pos = 10, -74
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 3000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3000,1

[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;MAX Sunburst
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
value=3000

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
pos = 12, -82
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
trigger1 = !Time
value = 3000,0
channel = 0

[State 3050, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(7) < 0
time = 1
value = SCA

[State 3050, Helper]
type = Helper
trigger1 = AnimElem = 7
stateno = 3055
ID = 3055
name = "Sunburst"
postype = p1
pos = 10, -74
size.xscale = .5
size.yscale = .5
ownpal = 1

[State 3050, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 7
value = 3000,1

[State 3050, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Sunshine
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

[State 3100, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 3100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

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
trigger1 = Time = 3
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
trigger1 = Time = 3
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -2, -34
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Superpause]
type = superpause
trigger1 = Time = 3
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3100, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3100, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 6 || AnimElem = 9
trigger2 = AnimElem = 12 || AnimElem = 15 || AnimElem = 18
value = 1,5

[State 3100, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 3100, Explod]
type = Explod
trigger1 = Time > 43
trigger1 = Time%10 = 0
anim = 1110+(random%4)
ID = 1110
postype = p1
pos = 8, -64
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 1

[State 3100, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 4

[State 3100, Hit]
type=hitdef
triggerall = !var(16) && var(15)<1
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
trigger5 = AnimElem = 16
trigger6 = AnimElem = 19
ID = 3100
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 4,4
guard.pausetime = 4,4
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
guard.velocity = -4
guard.cornerpush.veloff = 0
air.velocity = -4, -6
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=45), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3100, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3101

;---------------------------------------------------------------------------
; Sunshine Last Hit
[Statedef 3101]
type = S
physics = N
moveType = A
ctrl = 0
;velSet = 0,0
sprPriority = 1
poweradd = 0
faceP2 = 0

[State 3101, Anim]
type=changeanim
trigger1=!time
value=242

[State 3101,Posset]
type=posset
trigger1=!time
y=0

[State 3101, Explod]
type = Explod
trigger1 = Time%10 = 0
anim = 1110+(random%4)
ID = 1110
postype = p1
pos = 8, -64
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 1

[State 3101, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 4
y = -6

[State 3101, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 3101, Snd]
type = playsnd
trigger1 = AnimElem = 3
value = 40, 0

[State 3101, Dust]
type = helper
trigger1 = AnimElem = 3
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3101, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3)>0
y = .51

[State 3101, Hit]
type=hitdef
trigger1= !var(16) && var(15)<1
trigger1= !Time
attr = A,HA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*70<7, 7, fvar(11)*70)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -5, -7
ground.cornerPush.velOff = 0
guard.velocity = -5
guard.cornerPush.velOff = 0
air.velocity = -5, -7
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=50), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3101, Type]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 3101, End]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 243

;---------------------------------------------------------------------------
;MAX Sunshine
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
value=3150

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

[State 3150, Unguardable]
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
pos = -2, -34
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

[State 3150, Voice]
type = PlaySnd
trigger1 = !Time
value = 3100,0
channel = 0

[State 3150, Woosh]
type = PlaySnd
trigger1 = AnimElem = 3 || AnimElem = 6 || AnimElem = 9 || AnimElem = 12 || AnimElem = 15
trigger2 = AnimElem = 18 ||AnimElem = 21 || AnimElem = 24 || AnimElem = 27 || AnimElem = 30
value = 1,5

[State 3150, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(4) < 0
time = 1
value = SCA

[State 3150, Explod]
type = Explod
trigger1 = Time > 43
trigger1 = Time%10 = 0
anim = 1110+(random%4)
ID = 1110
postype = p1
pos = 8, -64
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 1

[State 3150, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 4

[State 3150, Hit]
type=hitdef
triggerall = !var(16) && var(15)<1
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
trigger5 = AnimElem = 16
trigger6 = AnimElem = 19
trigger7 = AnimElem = 22
trigger8 = AnimElem = 25
trigger9 = AnimElem = 28
trigger10 = AnimElem = 31
ID = 3150
attr = S,HA
hitflag = MAF
guardflag = M
priority = 4, hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 4,4
guard.pausetime = 4,4
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
guard.velocity = -4
guard.cornerpush.veloff = 0
air.velocity = -4, -6
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=45), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3150, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 3151

;---------------------------------------------------------------------------
; MAX Sunshine 2
[Statedef 3151]
type = S
physics = N
moveType = A
ctrl = 0
;velSet = 0,0
sprPriority = 1
poweradd = 0
faceP2 = 0

[State 3151, Anim]
type=changeanim
trigger1=!time
value=3151

[State 3151,Posset]
type=posset
trigger1=!time
y=0

[State 3151, Explod]
type = Explod
trigger1 = Time%10 = 0
anim = 1110+(random%4)
ID = 1110
postype = p1
pos = 8, -64
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 1

[State 3151, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 4
y = -6

[State 3151, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 3151, Snd]
type = playsnd
trigger1 = AnimElem = 3
value = 40, 0

[State 3151, Dust]
type = helper
trigger1 = AnimElem = 3
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3151, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3)>0
y = .51

[State 3151, Hit]
type=hitdef
trigger1= !var(16) && var(15)<1
trigger1= !Time
attr = A,HA
hitflag = MAF
guardflag = M
damage = ceil(ifelse(fvar(11)*35<7, 7, fvar(11)*35)), 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = -2.5, -9.5
ground.cornerPush.velOff = 0
guard.velocity = -2.5
guard.cornerPush.velOff = 0
air.velocity = -2.5, -9.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=50), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3151, End]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 3152

;---------------------------------------------------------------------------
; MAX Sunshine 3
[Statedef 3152]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3152
velset = 0,0
poweradd = 0

[State 3152, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 3152, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 3152, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3152, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 1100,0
channel = 0

[State 3152, FX]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1100,1

[State 3152, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 1105
ID = 1105
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = -1
ignorehitpause = 1

[State 3152, Explod]
type = Explod
triggerall = AnimElemTime(4)>=0
trigger1 = Time%10 = 0
anim = 1110+(random%4)
ID = 1110
postype = p1
pos = 8, -64
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 1

[State 3152, VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 2.5
y = -10

[State 3152, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(5)>0
y = .5

[State 3152, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
statetype = A
physics = N

[State 3152, Snd]
type = playsnd
trigger1 = AnimElem = 5
value = 40, 0

[State 3152, Dust]
type = helper
trigger1 = AnimElem = 5
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 3152, Hit]
type=hitdef
triggerall = !var(16) && (var(15)<4 || var(20))
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
ID = 3152
attr = A,HA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0,0
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
ground.velocity = -4.5, -8
ground.cornerpush.veloff = 0
guard.velocity = -4.5
guard.cornerpush.veloff = 0
air.velocity = -4.5, -8
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=25), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3152, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 3152, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1101

;-----------------------------------------------
; Sun Delta
[StateDef 3500]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = ifelse(var(53) > 0, -1000, -3000)
faceP2 = 1

[State 3500, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 3500, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))
var(10) = ifelse(P2BodyDist X > 200, 2, ifelse((P2BodyDist X = [120,200]),1,0))

[State 3500, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 3500, ifElse(var(10) = 1, 3510, 3520))

[state 3500,Posset]
type=posset
trigger1=!time
y=0

[State 3500, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)

[State 3500, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)

[State 3500, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3500, Corner Push]
type = varset
trigger1 = Time = 3
fvar(5) = 0

[State 3500, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 40

[State 3500, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1

[State 3500, Super Cancel Juggle]
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
pos = 12, -76
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

[State 3500, Voice]
type = PlaySnd
trigger1 = !Time
value = 3500,0
channel = 0

[State 3500, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 3505
ID = 3505
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 41

[State 3500, FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 3500,5

[State 3500, Helper]
type = Helper
trigger1 = AnimElem = 3
ID = 3506
stateno = 3506
pos = (ifelse(var(10)=2,240,ifelse(var(10)=1,160,80))),-68
postype = p1
size.xscale = .5
size.yscale = .5
supermovetime = 8

[State 3500, Hit]
type = HitDef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = animelemtime(4) >= 14 && animelemtime(4) <= 28
ID = 3500
attr = S,HP
hitflag = MAF
guardflag = 
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 0,0
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 30
ground.slidetime = 30
guard.hittime = 30
air.hittime = 120
ground.velocity = 0,0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8014)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=80+(80*var(10))), var(36):=-50
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
;p1stateno = 3501
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3500, ChangeState]
type = ChangeState
trigger1 = MoveHit && NumTarget
value = 3501
ignorehitpause = 1

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Sun Delta Success
[Statedef 3501]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
poweradd=0

[State 3501, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3501, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 3501

[State 3501, VarSet]
type = VarSet
trigger1 = animelemtime(10) < 0
fvar(17) = target,pos x

[State 3501, VarSet]
type = VarSet
trigger1 = animelemtime(10) < 0
fvar(18) = target,pos y

[State 3501, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 3530

[State 3501, Voice]
type = PlaySnd
trigger1 = !Time
value = 3500,1
channel = 0

[State 3501, Voice]
type = PlaySnd
trigger1 = AnimElem = 9
value = 4,2
channel = 0

[State 3501, Voice]
type = PlaySnd
trigger1 = AnimElem = 13
value = 3500,2
channel = 0

[State 3501, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = AnimElem = 10
value = 3531

[State 3501, Explod]
type = Explod
triggerall = NumTarget
trigger1 = Target,StateNo = 3531
trigger1 = Time%5 = 0
anim = 1110+(random%4)
ID = 1110
postype = p2
pos = 0, -64
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 1

[State 3501, Damage]
type = TargetLifeAdd
triggerall = NumTarget
trigger1 = time = 48
trigger2 = time = 56
trigger3 = time = 64
trigger4 = time = 72
value = floor(ifElse(63 * fvar(11) < 7, -7, -63 * fvar(11)))
kill = 0

[State 3501, EnvShake]
type = EnvShake
trigger1 = time = 48
trigger2 = time = 56
trigger3 = time = 64
trigger4 = time = 72
time = 18
ampl = 6
freq = 120

[State 3501, Hit Sound]
type = PlaySnd
triggerall = NumTarget
trigger1 = time = 48
trigger2 = time = 56
trigger3 = time = 64
trigger4 = time = 72
value = 2,2

[State 3501, Hit Spark]
type = Helper
triggerall = NumTarget
trigger1 = time = 48
trigger2 = time = 56
trigger3 = time = 64
trigger4 = time = 72
stateNo = 8014
ID = 8000
name = "Spark"
posType = P2
pos = 0, -50
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3501, TargetPowerAdd]
type = TargetPowerAdd
triggerall = NumTarget
trigger1 = time = 48
trigger2 = time = 56
trigger3 = time = 64
trigger4 = time = 72
value = 36

[State 3501, HitAdd]
type = HitAdd
triggerall = NumTarget
trigger1 = time = 48
trigger2 = time = 56
trigger3 = time = 64
trigger4 = time = 72
value = 1

[State 3501, Ground Impact]
type = Helper
triggerall = NumTarget
trigger1 = AnimElem = 13
stateNo = 8110
ID = 8110
name = "Ground Impact"
posType = P2
pos = 0,0
ownPal = 1

[State 3501, PlaySnd]
type = PlaySnd
triggerall = NumTarget
trigger1 = AnimElem = 13
value = 2,5

[State 3501, EnvShake]
type = EnvShake
triggerall = NumTarget
trigger1 = AnimElem = 13
time = 18
ampl = 6
freq = 120

[State 3501, Damage]
type = TargetLifeAdd
triggerall = NumTarget
trigger1 = AnimElem = 13
value = floor(ifElse(84 * fvar(11) < 7, -7, -84 * fvar(11)))
kill = 1

[State 3501, Hit Count]
type = VarAdd
triggerall = NumTarget
trigger1 = time = 48
trigger2 = time = 56
trigger3 = time = 64
trigger4 = time = 72
var(13) = 1

;[State 3501, Juggle]
;type = VarAdd
;trigger1 = NumTarget && AnimElem = 
;var(15) = 1
;ignoreHitPause = 1
;
;[State 3501, Juggle]
;type = VarSet
;trigger1 = NumTarget && AnimElem = 
;var(16) = 1
;ignoreHitPause = 1

;[State 3501, Idle]
;type = StateTypeSet
;trigger1 = AnimElemTime() >= 0
;moveType = I

[State 3501, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

; ---TARGET---
[StateDef 3530]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3530, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3530, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3530, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3530

[State 3530, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3530, VelSet]
type = VelSet
trigger1 = AnimElem = 2
y = -8

[State 3530, VelSet]
type = VelSet
trigger1 = AnimElemTime(2) = 40
y = 0

; ---TARGET 2---
[StateDef 3531]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 3531, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 3531

[State 3531, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3531, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 3531, VelSet]
type = VelSet
trigger1 = !Time
y = -Pos Y*.05

[State 3531, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,0
ignoreHitPause = 1

[State 3531, End]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 3532

; ---TARGET 3---
[Statedef 3532]
type = L
movetype= H
physics = N
velset = 0,0

[State 3532, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3532, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3532, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5100

[State 3532, VelSet]
type = VelSet
trigger1 = !Time
x = -4
y = -6

[State 3532, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = .5

[State 3532, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5100 && !AnimTime
value = 5160

[State 3532, SelfState]
type = SelfState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 5100