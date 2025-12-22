; _______________________
;| Ingrid by DeathScythe |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

;---------------------------------------------------------------------------
; Sunshot
[Statedef 1000]
type=S
physics=S
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
value = 1000
;value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,0
channel = 0

[State 1000, FX]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1

[State 1000, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 1007
ID = 1007
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 39
ignorehitpause = 1

[State 1000, Sunshot]
type = helper
trigger1 = AnimElem = 5
stateno = 1005
ID = 1005
name = "Sunshot"
postype = p1
pos = 20, -67
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Sunshot
[Statedef 1050]
type=S
physics=S
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
pos = -31, -86
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
triggerall = var(57)
trigger1 = !Time
time = 2
timegap = 1
framegap = 1
length = 8
palcontrast = 128, 112, 0
palmul = 0.65, 0.65, 0.65
trans = add

[State 1050, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,0
channel = 0

[State 1050, FX]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1

[State 1050, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 1007
ID = 1007
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 39
ignorehitpause = 1

[State 1050, EX Sunshot]
type = helper
trigger1 = AnimElem = 5
stateno = 1055
ID = 1005
name = "EX Sunshot"
postype = p1
pos = 20, -67
size.xscale = 0.6
size.yscale = 0.6
ownpal = 1

[State 1050, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Sun Arch
[Statedef 1100]
type=S
physics=S
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
;value = ifElse(var(10) = 0, 1100, ifElse(var(10) = 1, 1110, 1120))

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1100, FX]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,1

[State 1100, Explod]
type = Explod
trigger1 = AnimElem = 1
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

[State 1100, Explod]
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

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 2.5
y = ifelse(var(10)=2,-7,ifelse(var(10)=1,-6.25,-5.5))

[State 1100, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2)>0
y = .34

[State 1100, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A
physics = N

[State 1100, Snd]
type = playsnd
trigger1 = AnimElem = 2
value = 40, 0

[State 1100, Dust]
type = helper
trigger1 = AnimElem = 2
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1100, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1100
attr = A,SA
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
ground.velocity = ifelse(var(20), -2.61, -4.89), -7
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.61, -4.89)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -2.61, -4.89), -7
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=25), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1100, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1101

;---------------------------------------------------------------------------
; Sun Arch Landing
[Statedef 1101]
type = S
physics = S
ctrl = 0
anim = 1101
velset = 0,0

[State 1101, Snd]
type = playsnd
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

[State 1101, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1101, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Sun Arch
[Statedef 1150]
type=S
physics=S
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
pos = -31, -86
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
triggerall = var(57)
trigger1 = !Time
time = 2
timegap = 1
framegap = 1
length = 8
palcontrast = 128, 112, 0
palmul = 0.65, 0.65, 0.65
trans = add

[State 1150, NotHitBy]
type = NotHitBy
trigger1 = !Time
value = SCA
time = 11

[State 1150, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1150, FX]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,1

[State 1150, Explod]
type = Explod
trigger1 = AnimElem = 1
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

[State 1150, Explod]
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

[State 1150, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 2.5
y = -7.5

[State 1150, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2)>0
y = .34

[State 1150, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A
physics = N

[State 1150, Snd]
type = playsnd
trigger1 = AnimElem = 2
value = 40, 0

[State 1150, Dust]
type = helper
trigger1 = AnimElem = 2
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1150, Hit]
type=hitdef
triggerall = !var(16) && (var(15)<2 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
ID = 1150
attr = A,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -1.2, -2.4), -7
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -1.2, -2.4)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -1.2, -2.4), -7
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=25), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, Hit]
type=hitdef
trigger1 = !var(16) && (var(15)<4 || var(20))
trigger1 = AnimElem = 4
ID = 1151
attr = A,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2, -4), -7
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2, -4)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -2, -4), -7
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=25), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1150, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1150, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1101

;---------------------------------------------------------------------------
; Sunrise
[Statedef 1200]
type=S
physics=S
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

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1200
;value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 1200, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,0
channel = 0

[State 1200, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 10
value = 1,5
channel = 1

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 5
y = -5

[State 1200, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3)>0
y = .51

[State 1200, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1200, Snd]
type = playsnd
trigger1 = AnimElem = 3
value = 40, 0

[State 1200, Dust]
type = helper
trigger1 = AnimElem = 3
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1200, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= AnimElem = 3 || AnimElem = 5 || AnimElem = 7 || AnimElem = 9
ID = 1200
attr = A,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2.61, -4.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.61, -4.89)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -2.61, -4.89), -4
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=20), var(36):=-52
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1200, ChangeState]
type = ChangeState
;trigger1 = Pos Y >= 0 && Vel Y > 0
trigger1 = Pos Y > -Vel Y
value = 1201

;---------------------------------------------------------------------------
; Sunrise Landing + Sun Arch
[Statedef 1201]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1100

[State 1201, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 1201, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1201, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1201, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1201, FX]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,1

[State 1201, Explod]
type = Explod
trigger1 = AnimElem = 1
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

[State 1201, Explod]
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

[State 1201, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 2.5
y = ifelse(var(10)=2,-7,ifelse(var(10)=1,-6.25,-5.5))

[State 1201, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2)>0
y = .34

[State 1201, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A
physics = N

[State 1201, Snd]
type = playsnd
trigger1 = AnimElem = 2
value = 40, 0

[State 1201, Dust]
type = helper
trigger1 = AnimElem = 2
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1201, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1100
attr = A,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 56, ifElse(var(10), 42, 28)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 56, ifElse(var(10), 42, 28)))), 7
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
ground.velocity = ifelse(var(20), -2.61, -4.89), -7
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.61, -4.89)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -2.61, -4.89), -7
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=25), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1201, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1201, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1101

;---------------------------------------------------------------------------
;EX Sunrise
[Statedef 1250]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=ifelse(var(53) > 0, 0, -500)
facep2=1

[State 1250, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1250, Anim]
type=changeanim
trigger1=!time
value=1200

[State 1250,Posset]
type=posset
trigger1=!time
y=0

[State 1250, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1250, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1250, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1250, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1250, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -31, -86
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1250, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1250, Ex AfterImage]
type = AfterImage
triggerall = var(57)
trigger1 = !Time
time = 2
timegap = 1
framegap = 1
length = 8
palcontrast = 128, 112, 0
palmul = 0.65, 0.65, 0.65
trans = add

[State 1250, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 4,0
channel = 0

[State 1250, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4 || AnimElem = 7 || AnimElem = 10
value = 1,5

[State 1250, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 6
y = -6

[State 1250, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(3)>0
y = .51

[State 1250, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1250, Snd]
type = playsnd
trigger1 = AnimElem = 3
value = 40, 0

[State 1250, Dust]
type = helper
trigger1 = AnimElem = 3
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<2 || var(20))
trigger1= AnimElem = 3 || AnimElem = 5 || AnimElem = 7 || AnimElem = 9
ID = 1250
attr = A,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2.4, -4.5), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.4, -4.5)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -2.4, -4.5), -4
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=20), var(36):=-52
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1250, ChangeState]
type = ChangeState
trigger1 = Pos Y > -Vel Y
value = 1251

;---------------------------------------------------------------------------
; EX Sunrise Landing + EX Sun Arch
[Statedef 1251]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0,0
anim = 1100

[State 1251, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1251, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 1251, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1251, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1201, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1100,0
channel = 0

[State 1251, FX]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1100,1

[State 1251, Explod]
type = Explod
trigger1 = AnimElem = 1
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

[State 1251, Explod]
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

[State 1251, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 2.5
y = -7.5

[State 1251, VelAdd]
type = VelAdd
trigger1 = AnimElemTime(2)>0
y = .34

[State 1251, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A
physics = N

[State 1251, Snd]
type = playsnd
trigger1 = AnimElem = 2
value = 40, 0

[State 1251, Dust]
type = helper
trigger1 = AnimElem = 2
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1251, Hit]
type=hitdef
triggerall = !var(16) && (var(15)<4 || var(20))
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
ID = 1151
attr = A,SA
hitflag = MAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
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
ground.velocity = ifelse(var(20), -2.61, -4.89), -7
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.61, -4.89)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -2.61, -4.89), -7
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=25), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1251, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1251, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1101

;---------------------------------------------------------------------------
; Sun Upper
[Statedef 1300]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1300, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1300, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1300, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1300

[State 1300, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,2
channel = 0

[State 1300, FX]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,1
channel = 5

[State 1300, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 1305
ID = 1305
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = -1

[State 1300, ReversalDef]
type = ReversalDef
trigger1 = !Time
reversal.attr = SA,NA,SA,HA
pausetime = 0,0
sparkno = -1
hitsound = s3,0
p1stateno = 1301
p2stateno = 1310

[State 1300, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1300, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Sun Upper Success
[Statedef 1301]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
poweradd=72*!var(20)

[State 1301, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1301, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1301

[State 1301, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1301, FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,1

[State 1301, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1305

[State 1301, Explod]
type = Explod
trigger1 = !Time
anim = 1306
ID = 1306
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 1

[State 1301, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = AnimElem = 3
value = 1311

[State 1301, Explod]
type = Explod
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

[State 1301, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(84 * fvar(11) < 7, -7, -84 * fvar(11)))

[State 1301, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 3
value = 36

[State 1301, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 3 && !var(20)
value = 72

[State 1301, HitAdd]
type = Null;HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 1301, Hit Count]
type = Null;VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

;[State 1301, Idle]
;type = StateTypeSet
;trigger1 = AnimElemTime() >= 0
;moveType = I

[State 1301, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

; ---TARGET---
[StateDef 1310]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1310, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 1310, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 1310, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = Anim
elem = AnimElemNo(0)

[State 1310, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1
ignorehitpause = 1

[State 1310, SelfState]
type = SelfState
trigger1 = Time >= 30
value = 5000

; ---TARGET GOING UP---
[StateDef 1311]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 1311, NotHitBy]
type = NotHitBy
trigger1 = !Time
value = SCA
Time = 20

[State 1311, PlayerPush]
type = null;PlayerPush
trigger1 = 1
value = 0

[State 1311, VelSet]
type = VelSet
trigger1 = !Time
y = -12

[State 1311, ChangeAnim]
type = ChangeAnim
trigger1 = Vel Y < 0
value = Anim
elem = AnimElemNo(0)

[State 1311, ChangeAnim]
type = ChangeAnim
trigger1 = Vel Y = 0
value = 5030

[State 1311, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5030 && !AnimTime
trigger1 = SelfAnimExist(5035)
value = 5035

[State 1311, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 5050 && !AnimTime
value = 5050

[State 1311, VelAdd]
type = VelAdd
trigger1 = Time >= 15
y = .5

[State 1311, VelSet]
type = Null; VelSet
trigger1 = Vel Y > 12
y = 12

[State 1311, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 1311, EnvShake]
type = EnvShake
trigger1 = vel y > 0
trigger1 = pos y >= 0
time = 14
ampl = -4
freq = 120

[State 1311, VelSet]
type = VelSet
trigger1 = vel y > 0
trigger1 = pos y >= 0
x = -4

[State 1311, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= 0
value = 5100

;---------------------------------------------------------------------------
; Sun Lower
[Statedef 1350]
type=C
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1350, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1350, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1350, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1350, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1350

[State 1350, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,2
channel = 0

[State 1350, FX]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1300,1
channel = 5

[State 1350, Explod]
type = Explod
trigger1 = AnimElem = 1
anim = 1305
ID = 1305
postype = p1
pos = -3,27
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = -1

[State 1350, ReversalDef]
type = ReversalDef
trigger1 = !Time
reversal.attr = C,NA,SA,HA
pausetime = 0,0
sparkno = -1
hitsound = s3,0
p1stateno = 1351
p2stateno = 1310

[State 1350, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 1350, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Sun Lower Success
[Statedef 1351]
type=C
physics=S
movetype=A
ctrl=0
velset=0,0
poweradd=72*!var(20)

[State 1351, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1351, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 1351

[State 1351, Voice]
type = PlaySnd
trigger1 = !Time
value = 1300,0
channel = 0

[State 1351, FX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1000,1

[State 1351, RemoveExplod]
type = RemoveExplod
trigger1 = !Time
id = 1305

[State 1351, Explod]
type = Explod
trigger1 = !Time
anim = 1306
ID = 1306
postype = p1
pos = -3,27
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 1

[State 1351, TargetState]
type = TargetState
triggerall = NumTarget
trigger1 = AnimElem = 3
value = 1311

[State 1351, Explod]
type = Explod
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

[State 1351, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(84 * fvar(11) < 7, -7, -84 * fvar(11)))

[State 1351, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 3
value = 36

[State 1351, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 3 && !var(20)
value = 72

[State 1351, HitAdd]
type = Null;HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 1351, Hit Count]
type = Null;VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 1351, Juggle]
type = Null;VarAdd
trigger1 = NumTarget && AnimElem = 3
var(15) = 1
ignoreHitPause = 1

[State 1351, Juggle]
type = Null;VarSet
trigger1 = NumTarget && AnimElem = 3
var(16) = 1
ignoreHitPause = 1

;[State 1351, Idle]
;type = StateTypeSet
;trigger1 = AnimElemTime() >= 0
;moveType = I

[State 1351, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Sundive
[Statedef 1400]
type=A
physics=N
movetype=A
ctrl=0
;velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1400, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse(((P2StateType = S || P2StateType = C) && (P2Dist X =[-20,20])), 0, ifElse(Random < 500, 1, 0))

[State 1400, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1400, 1410)

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 4,ifelse(!var(10), 1, 2)
channel = 0

[State 1400, Woosh]
type = PlaySnd
trigger1 = !var(10) && AnimElem = 3
value = 1,3
channel = 1

[State 1400, Woosh]
type = PlaySnd
triggerall = var(10)
trigger1 = AnimElem = 3 || AnimElem = 6 || AnimElem = 9 || AnimElem = 12
value = 1,5
;channel = 1

[State 1400, Explod]
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

[State 1400, VelSet]
type = VelSet
trigger1 = !var(10) && !Time
x = 0
y = 0

[State 1400, VelSet]
type = VelSet
trigger1 = !var(10) && AnimElem = 3
y = 4

[State 1400, VelAdd]
type = VelAdd
trigger1 = var(10) && !Time
x = ifelse(vel X < 0, -1.5, ifelse(vel Y >= 0, 0, 1.5))
y = -2

[State 1400, VelAdd]
type = VelAdd
trigger1 = var(10)
y = .51

[State 1400, Hit]
type=hitdef
triggerall = Anim = 1400
triggerall = !var(16) && (var(15)<15 || var(20))
trigger1 = AnimElem = 3
trigger2 = AnimElem = 4
trigger3 = AnimElem = 5
trigger4 = AnimElem = 6
trigger5 = AnimElem = 7
trigger6 = AnimElem = 8
ID = 1400
attr = A,SA
hitflag = MAF
guardflag = HA
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 3, 6), ifelse(var(20), 3, 6)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -1.5, -3), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -1.5, -3)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -2, -4), -4
air.cornerPush.velOff = 0
yaccel = .5
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=10), var(36):=-20
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, Hit]
type=hitdef
triggerall = Anim = 1410
triggerall = !var(16) && (var(15)<15 || var(20))
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
ID = 1410
attr = A,SA
hitflag = MAF
guardflag = HA
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -2.61, -4.89), -7
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -2.61, -4.89)
guard.cornerpush.veloff = 0
air.velocity = ifelse(var(20), -2.61, -4.89), -4
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=45), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1400, ChangeState]
type = ChangeState
trigger1 = Pos Y > -Vel Y
value = 1401

;---------------------------------------------------------------------------
; Sundive Landing
[Statedef 1401]
type = S
physics = S
ctrl = 0
anim = 1401
velset = 0,0

[State 1401, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 1401, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1401, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 1401, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


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

[State 2900, FX]
type = PlaySnd
trigger1 = animelem = 4
value = 200,0

[State 2900, Explod]
type = Explod
trigger1 = AnimElem = 4
anim = 226
ID = 226
postype = p1
removetime = -2
scale = .5,.5
sprpriority = 3
ownpal = 1
removeongethit = 1
bindtime = 24
ignorehitpause = 1

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
ground.velocity = -3,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -2,-7
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
sparkxy = -10 + 0*(var(35):=60), var(36):=-69
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[STATE 2900,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[STATE 2900,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
 
;KICK ZERO COUNTER
[STATEDEF 2910]
type = S
physics = N
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
sparkxy = -10 + 0*(var(35):=41), var(36):=-30
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[STATE 2910,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[STATE 2910,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1