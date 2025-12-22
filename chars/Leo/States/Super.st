; _________________________________________
;| Leo by K6666orochi                      |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SUPER MOVES>====
;==

;---------------------------------------------------------------------------
;Hercules Rush
[Statedef 3000]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
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
trigger1 = Time = 3
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -60, -70
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 3
time = 38
movetime = 38
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1250,]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 3001
postype = P1
pos = -10,0
bindtime = -1
scale = 0.8,0.8
removeongethit = 1
ownpal = 1
sprpriority = 3

[State 3000, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = 32*const(size.xscale)

[State 3000, VelSet]
type = VelSet
trigger1 = animelemno(0) = [5, 10]
x = 10

[State 3000, VelSet]
type = VelSet
trigger1 = animelemno(0) > 10
x = 0

[State 3000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 0,19
channel = 0

[State 3000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 16
value = 0,20
channel = 1

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 7
value = 101,0

[State 3000, Dust]
type = helper
trigger1 = animelem = 7
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3000, 1]
type = HitDef
trigger1 = animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(40.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(13.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=50), var(36):=-50
ground.type = High
ground.velocity = -6 - 3*(var(0)%3)
ground.hittime = 20
ground.slidetime = 20
ground.cornerpush.veloff = -6 - 3*(var(0)%3)
guard.hittime = 10
air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -3, -6.43
airguard.velocity = -3, -6.43
yaccel = .536

[State 3000, 1]
type = HitDef
trigger1 = animelem = 17
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
animtype = HARD
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
;getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
guardflag = MA
hitflag = MA
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8017)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=170), var(36):=-60
ground.type = high
ground.velocity = -5.58 - 3*(var(0)%3)
ground.hittime = 20
ground.slidetime = 20
ground.cornerpush.veloff = -6 - 3*(var(0)%3)
guard.hittime = 19
air.hittime = 999
airguard.ctrltime = 999
air.type = high
air.velocity = -5.50,-8
airguard.velocity = -4,-6
air.fall = 1
fall=1
fall.recover = 1
fall.animtype = back
air.juggle = 8
yaccel = .6


[State 3000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(18) >= 0
moveType = I

[State 3000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Heracles Rush (part 1)
[StateDef 3050]
type=S
movetype=A
physics=S
poweradd=-2000
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
pos = -60, -70
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

[State 1250,]
type = Explod
trigger1 = AnimElem = 5
persistent = 0
anim = 3001
postype = P1
pos = -10,0
bindtime = -1
scale = 0.8,0.8
removeongethit = 1
ownpal = 1
sprpriority = 3

[State 3050, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = 32*const(size.xscale)

[State 3050, VelSet]
type = VelSet
trigger1 = animelemno(0) = [5, 10]
x = 15

[State 3050, VelSet]
type = VelSet
trigger1 = animelemno(0) > 10
x = 0

[State 3050, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 0,19
channel = 0

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 7
value = 101,0

[State 3050, PlaySnd]
type = PlaySnd
trigger1 = animelem = 16
value = 1000, 9

[State 3050, PlaySnd]
type = PlaySnd
trigger1 = animelem = 16
trigger1 = movehit
value = 0, 16
channel = 0

[State 3050, Dust]
type = helper
trigger1 = animelem = 7
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3050, 1]
type = HitDef
trigger1 = animelem = 5 || animelem = 6 || animelem = 7 
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(40.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(13.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=50), var(36):=-50
ground.type = High
ground.velocity = -6 - 3*(var(0)%3)
ground.hittime = 20
ground.slidetime = 20
ground.cornerpush.veloff = -6 - 3*(var(0)%3)
guard.hittime = 10
air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -3, -6.43
airguard.velocity = -3, -6.43
yaccel = .536

[State 3050, 2]
type = HitDef
trigger1 = animelem = 16
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(40.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(13.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=4)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-70
ground.type = High
ground.velocity = -6 - 3*(var(0)%3)
ground.hittime = 20
ground.slidetime = 20
ground.cornerpush.veloff = -6 - 3*(var(0)%3)
guard.hittime = 10
air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -3, -6.43
airguard.velocity = -3, -6.43
yaccel = .536

[State 3050, 5]
type = ChangeState
trigger1 = animelem = 19
trigger1 = movehit
value = 3055

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------
;---------------------------------------------------------------------------
;Heracles Rush (part 2)
[StateDef 3055]
type=S
movetype=A
physics=S
ctrl=0
velset=0,0
sprpriority=1
facep2=1

[State 3055, Anim]
type=changeanim
trigger1=!time
value=3055

[State 3055, VarSet]
type = VarSet
trigger1 = 1
fvar(6) = 1.4

[State 3055, Width]
type = Width
trigger1 = animelemno(0) = 5 || animelemno(0) = 10
player = floor(16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 3055, Width]
type = Width
trigger1 = animelemno(0) = [6, 9]
player = floor(32*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 3055, Width]
type = Width
trigger1 = animelemno(0) = [42, 44]
player = floor(16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 3055, PosAdd]
type = PosAdd
trigger1 = animelem = 10
trigger2 = animelem = 42
x = 16*const(size.xscale)

[State 3055, PosAdd]
type = PosAdd
trigger1 = animelem = 16
x = 16*const(size.xscale)

[State 3055, PosAdd]
type = PosAdd
trigger1 = animelem = 33
trigger2 = animelem = 43
trigger3 = animelem = 44
x = 32*const(size.xscale)

[State 3055, PosAdd]
type = PosAdd
trigger1 = animelem = 53
trigger2 = animelem = 54
x = -32*const(size.xscale)

[State 3055, PosAdd]
type = PosAdd
trigger1 = animelem = 55
x = -16*const(size.xscale)

[State 3055, PlaySnd]
type = PlaySnd
trigger1 = animelem = 34
value = 0, 19
channel = 0

[State 3055, PlaySnd]
type = PlaySnd
trigger1 = animelem = 44
value = 0, 20
channel = 0

[State 3055, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
trigger2 = animelem = 11
trigger3 = animelem = 19
trigger4 = animelem = 19
trigger5 = animelem = 27
trigger6 = animelem = 32
trigger7 = animelem = 35
trigger8 = animelem = 44, = -1
value = 1000, 9


[State 3055, 1]
type = HitDef
trigger1 = animelem = 6 || animelem = 29 || animelem = 35 || animelem = 44
trigger1 = var(6) := floor(fvar(12)*fvar(8)*400) || 1
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, HA
damage = ceil(60.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(60.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
getpower = 0
kill = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 10, 10
sparkno = s17002
guard.sparkno = s17006 + 2*(numenemy = 1 && var(8) - var(6) < 1)
sparkxy = ifelse(p2bodydist x < 40, ifelse(p2bodydist x < 0, -60, ceil(p2bodydist x - 60)), -20), floor(-55.5*const(size.yscale))
hitsound = s5,6
guardsound = s6,0 + 2*(numenemy = 1 && var(8) - var(6) < 1)
ground.type = High
ground.velocity = -6 *(var(0)%3)
ground.hittime = 20
ground.slidetime = 2
ground.cornerpush.veloff = -4.5 *(var(0)%3)
guard.hittime = 19
guard.kill = 0
air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -3, -6.43
airguard.velocity = -3, -6.43
yaccel = .536
envshake.time = 5
envshake.freq = 50
envshake.ampl = 8

[State 3055, 2]
type = HitDef
trigger1 = animelem = 12 
trigger1 = var(6) := floor(fvar(12)*fvar(8)*500) || 1
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, HA
damage = ceil(58.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(58.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
getpower = 0
kill = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 13, 13
sparkno = s17002
guard.sparkno = s17006 + 2*(numenemy = 1 && var(8) - var(6) < 1)
sparkxy = ifelse(p2bodydist x < 20, ifelse(p2bodydist x < 0, -40, ceil(p2bodydist x - 40)), -20), floor(-38*const(size.yscale))
hitsound = s5,7
guardsound = s6,0 + 2*(numenemy = 1 && var(8) - var(6) < 1)
ground.type = Low
ground.velocity = 0 *(var(0)%3)
ground.hittime = 20
ground.slidetime = 20
ground.cornerpush.veloff = 0 *(var(0)%3)
guard.hittime = 19
guard.kill = 0
air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -3, -6.43
airguard.velocity = -3, -6.43
yaccel = .536
envshake.time = 5
envshake.freq = 50
envshake.ampl = 8

[State 3055, 3]
type = HitDef
trigger1 = animelem = 21 || animelem = 33 || animelem= 36 
trigger1 = var(6) := floor(fvar(12)*fvar(8)*300) || 1
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = C, HA
damage = ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
getpower = 0
kill = 0
animtype = Medium
guardflag = MA
hitflag = MAF
pausetime = 13, 20
sparkno = s17001
guard.sparkno = s17006 + 2*(numenemy = 1 && var(8) - var(6) < 1)
sparkxy = -20, floor(-37.5*const(size.yscale))
hitsound = s5,5
guardsound = s6,0 + 2*(numenemy = 1 && var(8) - var(6) < 1)
ground.type = Low
ground.velocity = 0 *(var(0)%3)
ground.hittime = 11
ground.slidetime = 2
ground.cornerpush.veloff = 0 *(var(0)%3)
guard.hittime = 10
guard.kill = 0
air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -3, -6.43
airguard.velocity = -3, -6.43
yaccel = .536
envshake.time = 5
envshake.freq = 50
envshake.ampl = 6

[State 3055, 4]
type = null
trigger1 = animelem = 29
trigger1 = var(6) := floor(fvar(12)*fvar(8)*500) || 1
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = C, HA
damage = ceil(32.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(32.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
getpower = 0
kill = 0
animtype = Back
guardflag = LA
hitflag = MAF
pausetime = 6, 6
guard.pausetime = 6, 6
sparkno = s17001
guard.sparkno = s17006 + 2*(numenemy = 1 && var(8) - var(6) < 1)
sparkxy = ifelse(p2bodydist x < 40, ifelse(p2bodydist x < 0, -60, ceil(p2bodydist x - 60)), -20), floor(-12*const(size.yscale))
hitsound = s5,7
guardsound = s6,0 + 2*(numenemy = 1 && var(8) - var(6) < 1)
ground.type = Trip
ground.velocity = 1.25, -7.5 *(var(0)%3)
ground.hittime = 20
ground.slidetime = 20
ground.cornerpush.veloff = 0 *(var(0)%3)
guard.velocity = -2.5
guard.hittime = 19
guard.cornerpush.veloff = -3.25
guard.kill = 0
;air.hittime = 999
airguard.ctrltime = 999
air.type = Trip
air.velocity = 1.25, -7.5
airguard.velocity = -3, -6.43
yaccel = .536
fall = 1
fall.recover = 0
envshake.time = 5
envshake.freq = 50
envshake.ampl = 8

[State 3055, 5]
type = null
trigger1 = animelem = 33
trigger1 = var(6) := floor(fvar(12)*fvar(8)*500) || 1
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, HA
damage = ceil(80.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(80.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
getpower = 0
kill = 0
animtype = Back
guardflag = MA
hitflag = MAFD
pausetime = 10, 11
sparkno = s17002
guard.sparkno = s17006 + 2*(numenemy = 1 && var(8) - var(6) < 1)
sparkxy = -20, floor(-75*const(size.yscale))
hitsound = s5,6
guardsound = s6,0 + 2*(numenemy = 1 && var(8) - var(6) < 1)
ground.type = Low
ground.velocity = -0.83, -20 *(var(0)%3)
ground.hittime = 16
ground.slidetime = 16
ground.cornerpush.veloff = 0 *(var(0)%3)
guard.velocity = -10
guard.hittime = 15
guard.cornerpush.veloff = -13
guard.kill = 0
;air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -0.83, -16.25
fall = 1
fall.recover = 0
fall.yvelocity = -4
fall.animtype = Heavy
airguard.velocity = -3, -6.43
yaccel = .536
envshake.time = 5
envshake.freq = 50
envshake.ampl = 10
maxdist = 9999, -24

[State 3055, 6]
type = HitDef
trigger1 = animelem = 37 
trigger1 = var(6) := floor(fvar(12)*fvar(8)*500) || 1
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, HA
damage = ceil(64.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(64.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
getpower = 0
kill = 0
animtype = Up
guardflag = MA
hitflag = MAF
pausetime = 11, 10
guard.pausetime = 6, 6
sparkno = s17002
guard.sparkno = s17006 + 2*(numenemy = 1 && var(8) - var(6) < 1)
sparkxy = -20, floor(-128.5*const(size.yscale))
hitsound = s5,6
guardsound = s6,0 + 2*(numenemy = 1 && var(8) - var(6) < 1)
ground.type = Low
ground.velocity = -0.83, -15 *(var(0)%3)
ground.hittime = 16
ground.slidetime = 16
ground.cornerpush.veloff = 0 *(var(0)%3)
guard.velocity = -10
guard.hittime = 15
guard.cornerpush.veloff = -13
guard.kill = 0
;air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -0.83, -15
fall = 1
fall.recover = 0
fall.yvelocity = -4
airguard.velocity = -3, -6.43
yaccel = .536
envshake.time = 5
envshake.freq = 50
envshake.ampl = 8
maxdist = 9999, -72

[State 3055, 7]
type = HitDef
trigger1 =   animelem = 46
trigger1 = var(6) := floor(fvar(12)*fvar(8)*(200 + var(0)*50)) || 1
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10)*(var(0) := var(14)) + var(14)
attr = S, HA
damage = ceil(100.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(70.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Back
getpower = 0
guardflag = 
hitflag = MAFD
pausetime = 14, 15
sparkno = -1
guard.sparkno = s17006 + 2*(numenemy = 1 && var(8) - var(6) < 1)
;sparkxy = ifelse(p2bodydist x < 20, ifelse(p2bodydist x < 0, -70, ceil(p2bodydist x - 70)), -50), 5
sparkxy = ifelse(p2bodydist x < 20, ifelse(p2bodydist x < 0, -40, ceil(p2bodydist x - 40)), -20), floor(-100*const(size.yscale))
;sparkxy = -25, floor(-30*const(size.yscale))
hitsound = s5,6
guardsound = s6,0 + 2*(numenemy = 1 && var(8) - var(6) < 1)
ground.type = High
ground.velocity = 0, 7.5
ground.hittime = 24
ground.slidetime = 24
ground.cornerpush.veloff = 0
guard.velocity = -12.5
guard.hittime = 23
guard.cornerpush.veloff = -16.25
;air.hittime = 999
airguard.ctrltime = 999
air.velocity = 0, 7.5
airguard.velocity = -5, -6.43
yaccel = .536
fall = 1
fall.recover = 0
mindist = floor(160*const(size.xscale)), -9999
maxdist = floor(192*const(size.xscale)), 9999
envshake.time = 15
envshake.freq = 50
envshake.ampl = 15

[State 3055, PlaySnd]
type = PlaySnd
trigger1 = animelem = 44 || animelem = 45 || animelem = 46
trigger1 = movehit = 1
pan = floor(160*const(size.xscale))
value = 820, 1
ignorehitpause = 1
persistent = 0

[State 3055, PlaySnd]
type = PlaySnd
trigger1 = animelem = 44 || animelem = 45 || animelem = 46
trigger1 = movehit = 1
pan = floor(160*const(size.xscale))
value = 2, 2
ignorehitpause = 1
persistent = 0

[State 3055, TargetState]
type = TargetState
trigger1 = animelem = 44 || animelem = 45 || animelem = 46
trigger1 = movehit = 1
id = var(0)
value = 3056
ignorehitpause = 1
persistent = 0

[State 3050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------

[Statedef 3056]
type = L
physics = N
movetype = H
ctrl = 0
velset = 0,0

[State AntiHelper]
type = DestroySelf
trigger1 = ishelper
ignorehitpause = 1

[State 2212, SelfState]
type = SelfState
trigger1 = hitshakeover
value = 5081
ignorehitpause = 1

[State 2212, VelSet]
type = VelSet
trigger1 = 1
y = 0
ignorehitpause = 1

[State 2212, PosSet]
type = PosSet
trigger1 = 1
y = 0
ignorehitpause = 1

[State 2212, PosFreeze]
type = PosFreeze
trigger1 = 1
ignorehitpause = 1

[State 2212, HitAnim]
type = ChangeAnim
trigger1 = 1
value = 5080
ignorehitpause = 1

[State 2212, Explod]
type = Explod
trigger1 = time = 1
anim = F61
pos = 0, 0
sprpriority = -4
ownpal = 1
ignorehitpause = 1

;---------------------------------------------------------------------------
;Gigas Driver (part 1)
[Statedef 3100]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 3000, Anim]
type=changeanim
trigger1=!time
value=3100

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
trigger1 = Time = 0
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = 0, -50
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Superpause]
type = superpause
trigger1 = Time = 0
time = 40
movetime = 40
p2defmul = 1
unhittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 5000, 0
channel = 0

[State 1300, 1]
type = HitDef
trigger1 = animelem = 3, -1
trigger1 = p2bodydist x < const(size.xscale)*(75 + 10*var(0) - const(size.ground.front))
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, ST      
hitflag = M-        
;getpower = 70 + var(0)*10 + ceil(0.7*(192.0 + 16*var(0))*const(data.attack)/100.0)
;givepower = ceil(0.6*(192.0 + 16*var(0))*const(data.attack)/100.0)
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1          ;No spark
hitsound = s8, 0
sprpriority = 2     
p2facing = 1          
p1stateno = 3151      
p2stateno = 1305      
guard.dist = 0        
ground.velocity = 0
fall = 1              
fall.recover = 0
fall.xvelocity = -4.12
fall.yvelocity = -7.5
yaccel = .536

[State 1200, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------
[Statedef 3151]
type = S
movetype= A
physics = N
anim = 1301
ctrl = 0

[State 1201, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 0, 6
channel = 0

[State 1201, Bind 1]
type = VarSet
trigger1 = animelem = 1
fvar(0) = facing*(target, pos x - pos x)*0.5 + 40*const(size.xscale)

[State 1201, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 1
pos = fvar(0), 0

[State 1201, Bind 2]
type = TargetBind
trigger1 = animelemno(0) = 2
pos = 80*const(size.xscale), 0

[State 1201, Bind 3]
type = TargetBind
trigger1 = animelemno(0) = 3
pos = 80*const(size.xscale), 0

[State 1201, TargetState]
type = TargetState
trigger1 = animtime = 0
;id = var(14)
value = 1306

[State 1201, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3152

[Statedef 3152] 
type = A 
movetype= A 
physics = N
anim = 1302
ctrl = 0
velset = 0,0

[State 1202, VelSet]
type = VelSet
trigger1 = time = 0
x = (-pos x*facing - 48*const(size.xscale))/30.0
y = -45

[State 1202, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 48*const(size.xscale)

[State 1202, ChangeState]
type = ChangeState
trigger1 = time = 62
value = 3153

[State 1202, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.536

[State 1202, VelAdd]
type = VelAdd
trigger1 = vel y > 0
y = 1.0714

[State 1202, VelMul]
type = VelMul
trigger1 = time > 21
trigger1 = var(10) = 0
trigger2 = time > 25
trigger3 = time > 30
x = 0.8

[State 1202, PlaySnd]
type = PlaySnd
trigger1 = !var(10)
trigger1 = animelem = 2
trigger2 = var(10)
trigger2 = animelem = 3
value = 1, 1

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 1
pos = 25*const(size.xscale), -40*const(size.yscale)

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 2
pos = -5*const(size.xscale), -40*const(size.yscale)

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 3
pos = -35*const(size.xscale), -40*const(size.yscale)

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 4
pos = 15*const(size.xscale), -40*const(size.yscale)

[State 1202, SprPriority]
type = SprPriority
trigger1 = animelemno(0) != 4
value = (var(13) := 2) + 1

[State 1202, SprPriority]
type = SprPriority
trigger1 = animelemno(0) = 4
;value = (var(13) := -(teamside = 1))

[Statedef 3153]
type = A
movetype= A
physics = N
anim = 1303
sprpriority = (var(13) := 2) + 1
ctrl = 0

[State 1203, TargetState]
type = TargetState
trigger1 = time = 0
;id = var(14)
value = 1307

[State 1203, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = pos y >= 0
value = ceil(-(250.0 + 16*var(10))*(ifelse(var(21)%10 = 5 || var(9) = 5, ifelse(var(20), 1.25, 1.4), 0.95 + 0.05*(var(21)%10)))*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)
persistent = 0

[State 1203, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = pos y >= 0
value = ceil(0.6*(150.0 + 16*var(10))*(ifelse(var(21)%10 = 5 || var(9) = 5, ifelse(var(20), 1.25, 1.4), 0.95 + 0.05*(var(21)%10)))*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)
persistent = 0

[State 1203, PowerAdd]
type = null
trigger1 = pos y >= 0
value = 70 + var(10)*10 + ceil(0.7*(192.0 + 16*var(10))*(ifelse(var(21)%10 = 5 || var(9) = 5, ifelse(var(20), 1.25, 1.4), 0.95 + 0.05*(var(21)%10)))*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)
persistent = 0

[State XP Add]
type = VarAdd
trigger1 = pos y >= 0
var(19) = ifelse(!var(10), 700, ifelse(var(10) = 1, 900, 1000))
persistent = 0

[State 1203, EnvShake]
type = EnvShake
trigger1 = pos y + vel y > -16*const(size.yscale)
time = 10 + 1*var(10)
freq = 50
ampl = 5 + 3*var(10)
phase = 270
persistent = 0

[State 1203, Explod]
type = Explod
triggerall = !var(22)
trigger1 = pos y + vel y > -16*const(size.yscale)
postype = p1
anim = 3120
scale = 0.5,0.5
bindtime = 1
facing = -1
pos = floor(32*const(size.xscale)), floor(-pos y - vel y)
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
persistent = 0
ownpal = 1

[State 1203, Explod]
type = Explod
;triggerall = var(22)
trigger1 = pos y + vel y > -16*const(size.yscale)
postype = p1
anim = 3130
scale = 0.5,0.5
bindtime = 1
pos = floor(32*const(size.xscale)), floor(-pos y - vel y)
sprpriority = -5
pausemovetime = 99999
supermovetime = 99999
persistent = 0
ownpal = 1

[State 1203, Explod]
type = Explod
;triggerall = var(22)
trigger1 = pos y + vel y > -16*const(size.yscale)
postype = p1
anim = 3140
bindtime = 1
scale = 0.5,0.5
pos = floor(32*const(size.xscale)), floor(-pos y - vel y)
sprpriority = 6
pausemovetime = 99999
supermovetime = 99999
persistent = 0
ownpal = 1


[State 1203, PlaySnd]
type = PlaySnd
trigger1 = pos y + vel y > -16*const(size.yscale)
pan = floor(32*const(size.xscale))
value = 2, 8
persistent = 0

[State 1203, PlaySnd]
type = PlaySnd
trigger1 = pos y + vel y > -16*const(size.yscale)
pan = floor(32*const(size.xscale))
value = 820, 1
persistent = 0

[State 1203, ChangeState]
type = ChangeState
trigger1 = animelem = 4
value = 1304

[State 1203, VelAdd]
type = VelAdd
trigger1 = pos y < 0
y = 0.536

[State 1203, VelAdd]
type = VelAdd
trigger1 = animelem = 1, < 2
trigger1 = vel y > 0
y = 1.0714

[State 1203, ChangeAnim]
type = ChangeAnim
trigger1 = animelem = 1, < 2
trigger1 = pos y + vel y < 0
value = 1303

[State 1203, PosSet]
type = PosSet
trigger1 = pos y + vel y >= 0
y = 0

[State 1203, VelSet]
type = VelSet
trigger1 = pos y + vel y >= 0
x = 0
y = 0

[State 1203, Bind 1]
type = TargetBind
trigger1 = 1
pos = 16*const(size.xscale), ifelse(pos y + vel y > -16*const(size.yscale), -pos y - vel y, 16*const(size.yscale))

;---------------------------------------------------------------------------
; Gigas Driver
[Statedef 2100] 
type = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
sprpriority = 1
powerAdd = -2000
faceP2 = 1

[State 3500, Anim]
type=changeanim
trigger1=!time
value=3100

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
trigger1 = time = 0
stateNo = 8510
ID = 8500
name = "Superpause FX"
posType = p1
pos = 11, -63
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = time = 0
time = 40
moveTime = 40
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 1300, 1]
type = HitDef
trigger1 = animelem = 3, -1
trigger1 = p2bodydist x < const(size.xscale)*(75 + 10*var(0) - const(size.ground.front))
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, ST      
hitflag = M-        
;getpower = 70 + var(0)*10 + ceil(0.7*(192.0 + 16*var(0))*const(data.attack)/100.0)
;givepower = ceil(0.6*(192.0 + 16*var(0))*const(data.attack)/100.0)
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1          ;No spark
hitsound = s8, 0
sprpriority = 2     
p2facing = 1          
p1stateno = 2101       
p2stateno = 2105       
guard.dist = 0        
ground.velocity = 0
fall = 1              
fall.recover = 0
fall.xvelocity = -4.12
fall.yvelocity = -7.5
yaccel = .536

[State 2100, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 5000, 0
channel = 0

[State Idle Anim]
type = StateTypeSet
trigger1 = animelem = 3
movetype = I

[State 2100, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State Weapon Layer]
type = Null
trigger1 = animelemno(0) = 4
trigger1 = var(11) := 0

[State Shield Layer]
type = Null
trigger1 = animelemno(0) = [3, 4]
trigger1 = var(12) := 1

[Statedef 2101]
type = S
movetype= A
physics = N
anim = 1301
ctrl = 0

[State 2101, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 200, 2
channel = 0

[State 2101, Bind 1]
type = VarSet
trigger1 = animelem = 1
fvar(0) = facing*(target, pos x - pos x)*0.5 + 40*const(size.xscale)

[State 2101, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 1
pos = fvar(0), 0

[State 2101, Bind 2]
type = TargetBind
trigger1 = animelemno(0) = 2
pos = 80*const(size.xscale), 0

[State 2101, Bind 3]
type = TargetBind
trigger1 = animelemno(0) = 3
pos = 80*const(size.xscale), 0

[State 2101, TargetState]
type = TargetState
trigger1 = animtime = 0
id = var(14)
value = 1306

[State 2101, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 2102

[Statedef 2102] ;freeze at 22, changestate time = 28 + 7 = 35 ticks
type = A ;freeze at 30, changestate time = 46 + 3 = 49 ticks
movetype= A ;freeze at ??, changestate time = 52 + 2 = 54 ticks
physics = N
anim = 1302
ctrl = 0
velset = 0,0

[State 2102, PlaySnd]
type = PlaySnd
trigger1 = time = 0
trigger1 = prevstateno != 2101
value = 200, 2
channel = 0

[State 2102, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = var(0) = 0
x = (-pos x*facing - 48*const(size.xscale))*0.04545
y = -12.5
persistent = 0

[State 2102, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = var(0) = 1
y = -17.5

[State 2102, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = var(0) = 2
y = -28.5

[State 2102, PosAdd]
type = PosAdd
trigger1 = time = 0
;trigger1 = prevstateno = 2101
x = ifelse(prevstateno = 2101, 48, 16)*const(size.xscale)

[State 2102, ChangeState]
type = ChangeState
trigger1 = var(0) = 0
trigger1 = time = 28
trigger2 = var(0) = 1
trigger2 = time = 46
trigger3 = var(0) = 2
trigger3 = time = 52
value = 2103

[State 2102, VelAdd]
type = VelAdd
trigger1 = 1
y = ifelse(var(0) = 2, 0.8, 0.536)

[State 2102, VelAdd]
type = VelAdd
trigger1 = vel y > 0
y = ifelse(var(0) = 2, 1.6, 1.0714)

[State 2102, VelMul]
type = VelMul
trigger1 = time > 18
x = 0.8

[State 2102, PlaySnd]
type = PlaySnd
trigger1 = !var(0)
trigger1 = animelem = 2
trigger2 = var(0)
trigger2 = animelem = 3
value = 20, 1

[State 2102, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 1
pos = 25*const(size.xscale), -50*const(size.yscale)

[State 2102, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 2
pos = -5*const(size.xscale), -50*const(size.yscale)

[State 2102, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 3
pos = -35*const(size.xscale), -50*const(size.yscale)

[State 2102, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 4
pos = 15*const(size.xscale), -50*const(size.yscale)

[State 2102, SprPriority]
type = SprPriority
trigger1 = animelemno(0) != 4
value = (var(13) := 2) + 1

[State 2102, SprPriority]
type = SprPriority
trigger1 = animelemno(0) = 4
value = (var(13) := -(teamside = 1))

[Statedef 2103]
type = A
movetype= A
physics = N
anim = 3110
sprpriority = (var(13) := 2) + 1
ctrl = 0

[State 2103, TargetState]
type = TargetState
trigger1 = time = 0
id = var(14)
value = ifelse(var(0) = 2, 1307, 2107)

[State 2103, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = pos y >= 0
trigger1 = target, life > 1
value = ceil(0.7*(92.0*(1+0.5*var(0)))*(ifelse(var(21)%10 = 5 || var(9) = 5, ifelse(var(20), 1.25, 1.4), 0.95 + 0.05*(var(21)%10)))*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)
persistent = 0

[State 2103, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = pos y >= 0
value = ceil(-(92.0*(1+0.5*var(0)))*(ifelse(var(21)%10 = 5 || var(9) = 5, ifelse(var(20), 1.25, 1.4), 0.95 + 0.05*(var(21)%10)))*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)
persistent = 0
kill = var(0) = 2

[State XP Add]
type = VarAdd
trigger1 = pos y >= 0
var(19) = ifelse(!var(0), 500, ifelse(var(0) = 1, 900, 1000))
persistent = 0

[State 2103, EnvShake]
type = EnvShake
trigger1 = pos y + vel y > -16*const(size.yscale)
time = 10 + 2*var(0)
freq = 50
ampl = 5 + 5*var(0)
phase = 270
persistent = 0

[State 2103, Explod]
type = Explod
triggerall = var(22)
trigger1 = pos y + vel y > -16*const(size.yscale)
postype = p1
anim = 17005
facing = -facing
bindtime = 1
pos = floor(32*const(size.xscale)), floor(-pos y - vel y + 5)
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
persistent = 0
ownpal = 1

[State 2103, Explod]
type = Explod
triggerall = var(22)
trigger1 = pos y + vel y > -16*const(size.yscale)
postype = p1
anim = F61
bindtime = 1
pos = floor(32*const(size.xscale)), floor(-pos y - vel y)
sprpriority = -5
pausemovetime = 99999
supermovetime = 99999
persistent = 0
ownpal = 1

[State 2103, Explod]
type = Explod
triggerall = !var(22)
trigger1 = pos y + vel y > -16*const(size.yscale)
postype = p1
anim = F62
bindtime = 1
facing = -facing
pos = floor(32*const(size.xscale)), floor(-pos y - vel y)
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
persistent = 0
ownpal = 1

[State 2103, PlaySnd]
type = PlaySnd
trigger1 = pos y + vel y > -16*const(size.yscale)
pan = floor(32*const(size.xscale))
value = 8, 2
persistent = 0

[State 2103, PlaySnd]
type = PlaySnd
trigger1 = pos y + vel y > -16*const(size.yscale)
pan = floor(32*const(size.xscale))
value = 810, 0
persistent = 0

[State 2103, ChangeState]
type = ChangeState
trigger1 = animelem = 4
value = ifelse(var(0) = 2, 1304, 2104)

[State 2103, VelAdd]
type = VelAdd
trigger1 = pos y < 0
y = 0.536

[State 2103, VelAdd]
type = VelAdd
trigger1 = animelem = 1, < 2
trigger1 = vel y > 0
y = 1.0714

[State 2103, ChangeAnim]
type = ChangeAnim
trigger1 = animelem = 1, < 2
trigger1 = pos y + vel y < 0
value = ifelse(var(0) = 2, 1303, 3103)

[State 2103, PosSet]
type = PosSet
trigger1 = pos y + vel y >= 0
y = 0

[State 2103, VelSet]
type = VelSet
trigger1 = pos y + vel y >= 0
x = 0
y = 0

[State 2103, Bind 1]
type = TargetBind
trigger1 = 1
pos = 16*const(size.xscale), ifelse(pos y + vel y > -16*const(size.yscale), -pos y - vel y, 16*const(size.yscale))

[Statedef 2104]
type = A
movetype= A
physics = N
velset = 0, 0
ctrl = 0

[State 2104, PosAdd]
type = PosAdd
trigger1 = time = 0
;trigger1 = prevstateno = 2101
x = -16*const(size.xscale)

[State 2104, TargetState]
type = TargetState
trigger1 = animtime = 0
id = var(14)
value = 1306

[State 2104, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
trigger1 = var(0) := var(0) + 1
value = 2102

[State 2104, Bind 1]
type = TargetBind
trigger1 = 1
pos = 32*const(size.xscale), 0

[Statedef 2105]
type = A
movetype= H
physics = N
velset = 0,0

[State 2105, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3115

[State 2105, ScreenBound]
type = ScreenBound
trigger1 = animtime = 0
value = 0
movecamera = 0, 0

[State 2105, 1]
type = SelfState
Trigger1 = time > 60
value = 5050

[Statedef 2107]
type = A
movetype= H
physics = N
velset = 0,0

[State 2107, 3]
type = ChangeAnim2
trigger1 = Time = 0
value = 1307

[State 2107, 4]
type = ChangeAnim
trigger1 = gethitvar(isbound)
trigger1 = pos y >= 0
trigger1 = anim != 5080
value = 5080

[State 2107, ScreenBound]
type = ScreenBound
trigger1 = gethitvar(isbound)
value = 0
movecamera = 0, 0

[State 2107, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

;-----------------------------------------------
;Elemental Rage
[StateDef 3500]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprpriority = 1
powerAdd = -3000
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
trigger1 = animelem = 4
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = 70, -90
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3500, Super Pause]
type = SuperPause
trigger1 = animelem = 4
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 1
anim = -1
sound = s8500,0
darken = 0

[State 3300, Hyper Chain Drive Projectile]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 3305
ID = 3305
name = "Hyper Chain Drive"
posType = P1
pos = 5, 0
size.xScale = 0.5
size.yScale = 0.5
ownPal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 0
anim = 3520
sprpriority = 3
postype = p1
pos = -25, 0
scale = 0.10, 0.10
pausemovetime = -1
supermovetime = -1
ownpal = 1
removetime = 3

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 3
anim = 3520
sprpriority = 3
postype = p1
pos = -35 , 0
scale = 0.15, 0.15
pausemovetime = -1
supermovetime = -1
ownpal = 1
removetime = 3

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 6
anim = 3520
sprpriority = 3
postype = p1
pos = -55, 0
scale = 0.25, 0.25
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 110
anim = 3525
sprpriority = 3
postype = p1
pos = -60, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 0
anim = 3520
sprpriority = 3
postype = p1
pos = 50 , 0
scale = 0.10, 0.10
pausemovetime = -1
supermovetime = -1
removetime = 3
ownpal = 1
facing = -1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 3
anim = 3520
sprpriority = 3
postype = p1
pos = 60 , 0
scale = 0.15, 0.15
pausemovetime = -1
supermovetime = -1
removetime = 3
ownpal = 1
facing = -1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 6
anim = 3520
sprpriority = 3
postype = p1
pos = 80, 0
scale = 0.25, 0.25
pausemovetime = -1
supermovetime = -1
ownpal = 1
facing = -1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 110
anim = 3525
sprpriority = -1
postype = p1
pos = 85, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
facing = -1

[State 1050, ExFX]
type = null
trigger1 = animelem = 9
anim = 3510
sprpriority = 3
postype = p1
pos = 5, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 0 || animelemtime (9) = 25 || animelemtime (9) = 50
anim = 3515
sprpriority = 11
postype = p1
pos = 0, -5
scale = 0.6, 0.6
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 5 || animelemtime (9) = 15 || animelemtime (9) = 30
anim = 3515
sprpriority = -1
postype = p1
pos = 20, -5
scale = 0.4, 0.4
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 20 || animelemtime (9) = 40 || animelemtime (9) = 60
anim = 3515
sprpriority = -1
postype = p1
pos = -20, -5
scale = 0.4, 0.4
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 10 || animelemtime (9) = 30 || animelemtime (9) = 50
anim = 3515
sprpriority = 10
postype = p1
pos = 80, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 15 || animelemtime (9) = 70 || animelemtime (9) = 100
anim = 3515
sprpriority = 10
postype = p1
pos = -80, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 30 || animelemtime (9) = 55 || animelemtime (9) = 85
anim = 3515
sprpriority = 11
postype = p1
pos = 40, -5
scale = 0.6, 0.6
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = explod
trigger1 = animelemtime (9) = 25 || animelemtime (9) = 65 || animelemtime (9) = 95
anim = 3515
sprpriority = 11
postype = p1
pos = -40, -5
scale = 0.6, 0.6
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelemtime (5) = 0
value = 0,17

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelemtime (9) = 0
value = 1000,6

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelemtime (9) = 0
value = 1000,5

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelemtime (9) = 5 || animelemtime (9) = 30
trigger2 = animelemtime (9) = 20 || animelemtime (9) = 40 || animelemtime (9) = 60
trigger3 = animelemtime (9) = 10 || animelemtime (9) = 50
trigger4 = animelemtime (9) = 70 || animelemtime (9) = 100
trigger5 = animelemtime (9) = 80
trigger6 = animelemtime (9) = 90
value = 1000,10
channel = 0

[State 3500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1