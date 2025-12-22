; _________________________________________
;| Leo by K6666orochi                      |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>====
;==

;---------------------------------------------------------------------------
;Chronos Rush (part 1)
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
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1010, 1020))

[State 1000, Width]
type = Width
trigger1 = animelemno(0) = [9, 10]
player = floor(-16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 0,19
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = 0,20
channel = 1

[State 1000, PosAdd]
type = PosAdd
trigger1 = animelem = 6
x = 32*const(size.xscale)

[State 1000, VelSet]
type = VelSet
trigger1 = animelemno(-1) = 6
trigger2 = animelemno(0) = [7, 9]
x = 5 + 2.5*(var(10)%3)

[State 1000, VelMul]
type = VelMul
trigger1 = animelemno(0) = 10
x = 0.87

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 6
value = 101,0

[State 1000, Dust]
type = helper
trigger1 = animelem = 6
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, 1]
type = HitDef
triggerall = var(10) = 0
trigger1 = time = 0
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(10.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
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
id= 1000

[State 1000, 1]
type = HitDef
triggerall = var(10) = 1
trigger1 = animelem = 5 || animelem = 7
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(10.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
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
id= 1005

[State 1000, 1]
type = HitDef
triggerall = var(10) = 2
trigger1 = animelem = 5 || animelem = 6 || animelem = 7
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(10.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
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
id= 1010

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 1005

;---------------------------------------------------------------------------
;Chronos Rush (part 2)
[Statedef 1005]
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

[State 210, Width]
type = Width
trigger1 = animelemno(0) = 4
player = floor(16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1005, ifElse(var(10) = 1, 1015, 1025))

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 0,20
channel = 1

[State 1000, 1]
type = HitDef
triggerall = var(10) = 0
trigger1 = time = 0
trigger1 = var(6) := floor(fvar(12)*300) || 1
id= 1000
nochainid = 810 + id%10
attr = S, SA
animtype = HARD
damage = ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(10.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
guardflag = MA
hitflag = MA
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
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

[State 1000, 1]
type = HitDef
triggerall = var(10) = 1
trigger1 = time = 0
trigger1 = var(6) := floor(fvar(12)*300) || 1
id= 1010
nochainid = 810 + id%10
attr = S, SA
animtype = HARD
damage = ceil(37.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(11.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
guardflag = MA
hitflag = MA
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
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

[State 1000, 1]
type = HitDef
triggerall = var(10) = 2
trigger1 = time = 0
trigger1 = var(6) := floor(fvar(12)*300) || 1
id= 1020
nochainid = 810 + id%10
attr = S, SA
animtype = HARD
damage = ceil(38.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(12.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
guardflag = MA
hitflag = MA
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
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

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Chronos Rush 
[Statedef 1050]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1030

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Width]
type = Width
trigger1 = animelemno(0) = [9, 10]
player = floor(-16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

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

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 0,19
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = 0,20
channel = 1

[State 1000, PosAdd]
type = PosAdd
trigger1 = animelem = 6
x = 33*const(size.xscale)

[State 1000, VelSet]
type = VelSet
trigger1 = animelemno(-1) = 6
trigger2 = animelemno(0) = [7, 9]
x = 6 + 2.5

[State 1000, VelMul]
type = VelMul
trigger1 = animelemno(0) = 10
x = 0.87

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 6
value = 101,0

[State 1000, Dust]
type = helper
trigger1 = animelem = 6
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, 1]
type = HitDef
trigger1 = animelem = 5 || animelem = 6 || animelem = 7
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(40.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(13.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 8, 8
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

[State 1000, 1]
type = HitDef
trigger1 = animelem = 14
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
animtype = HARD
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
guardflag = MA
hitflag = MA
pausetime = 10, 10
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

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Achilles Rush (part 1)
[Statedef 1100]
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
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1100, ifElse(var(10) = 1, 1110, 1120))

[State 1000, Width]
type = Width
trigger1 = animelemno(0) = [9, 10]
player = floor(-16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 0,19
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = 0,20
channel = 1

[State 1000, PosAdd]
type = PosAdd
trigger1 = animelem = 6
x = 32*const(size.xscale)

[State 1000, VelSet]
type = VelSet
trigger1 = animelemno(-1) = 6
trigger2 = animelemno(0) = [7, 9]
x = 5 + 2.5*(var(10)%3)

[State 1000, VelMul]
type = VelMul
trigger1 = animelemno(0) = 10
x = 0.87

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 6
value = 101,0

[State 1000, Dust]
type = helper
trigger1 = animelem = 6
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, 1]
type = HitDef
triggerall = var(10) = 0
trigger1 = time = 0
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(10.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
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
id= 1100

[State 1000, 1]
type = HitDef
triggerall = var(10) = 1
trigger1 = animelem = 5 || animelem = 7
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(10.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
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
id= 1110

[State 1000, 1]
type = HitDef
triggerall = var(10) = 2
trigger1 = animelem = 5 || animelem = 6 || animelem = 7
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(10.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 11, 11
hitsound = -1 + 0*(var(31):=3)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
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
id= 1120


[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 1105

;---------------------------------------------------------------------------
;Achilles Rush (part 2)
[Statedef 1105]
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

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 210, Width]
type = Width
trigger1 = animelemno(0) = 4
player = floor(16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1105, ifElse(var(10) = 1, 1115, 1125))

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 0,20
channel = 1

[State 1000, Hit]
type=hitdef
triggerall = var(10) = 0
trigger1= time = 0
ID = 1100
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(35.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(10.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-5

[State 1100, Hit]
type=hitdef
triggerall = var(10) = 1
trigger1= time = 0
ID = 1110
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(37.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(11.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-5

[State 1100, Hit]
type=hitdef
triggerall = var(10) = 2
trigger1= time = 0
ID = 1120
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(40.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(13.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=8)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-5

[State 1000, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;EX Achilles Rush
[Statedef 1150]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1130

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Width]
type = Width
trigger1 = animelemno(0) = [9, 10]
player = floor(-16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

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

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 0,19
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = 0,20
channel = 1

[State 1000, PosAdd]
type = PosAdd
trigger1 = animelem = 6
x = 33*const(size.xscale)

[State 1000, VelSet]
type = VelSet
trigger1 = animelemno(-1) = 6
trigger2 = animelemno(0) = [7, 9]
x = 6 + 2.5

[State 1000, VelMul]
type = VelMul
trigger1 = animelemno(0) = 10
x = 0.87

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 6
value = 101,0

[State 1000, Dust]
type = helper
trigger1 = animelem = 6
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, 1]
type = HitDef
trigger1 = animelem = 5 || animelem = 6 || animelem = 7
trigger1 = var(6) := floor(fvar(12)*300) || 1
nochainid = 810 + id%10
attr = S, SA
damage = ceil(38.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(15.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MAF
pausetime = 8, 8
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

[State 1000, Hit]
type=hitdef
trigger1= animelem = 14
ID = 450
attr = C,NA
hitflag = MAF
guardflag = L
damage = ceil(ifelse(fvar(11)*91<7, 7, fvar(11)*91)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Trip
air.type = Trip
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -1, -6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -1, -8.24
air.cornerPush.velOff = 0
yAccel = 0.677
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8017)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=150), var(36):=-5
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48


[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Brontos/Artic/Mars Slash
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
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1200, ifElse(var(10) = 1, 1210, 1220))

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 0,1
channel = 0

[State 1200, PlaySnd]
type = null
trigger1 = animelem = 14
value = 0,20
channel = 1

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
;trigger2 = var(10) = 0
trigger1 = anim = 1200
value = 1000, 2
;channel = 1

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
;trigger2 = var(10) = 0
trigger1 = anim = 1210
value = 1000, 6

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
;trigger2 = var(10) = 0
trigger1 = anim = 1220
value = 1000, 4

[State 1200, PosAdd]
type = PosAdd
trigger1 = anim = 1210
trigger1 = animelem = 10
x = 8*const(size.xscale)

[State 1200, PosAdd]
type = PosAdd
trigger1 = anim = 1210
trigger1 = animelem = 11
trigger2 = animelem = 12
x = 16*const(size.xscale)

[State 1200, PosAdd]
type = PosAdd
trigger1 = anim = 1210
trigger1 = animelem = 21
trigger2 = animelem = 22
x = -16*const(size.xscale)

[State 1200, PosAdd]
type = PosAdd
trigger1 = anim = 1210
trigger1 = animelem = 23
x = -8*const(size.xscale)

[State 1200, PosAdd]
type = PosAdd
trigger1 = anim = 1220
trigger1 = animelem = 10
x = 16*const(size.xscale)

[State 1200, PosAdd]
type = PosAdd
trigger1 = anim = 1220
trigger1 = animelem = 11
trigger2 = animelem = 12
x = 32*const(size.xscale)

[State 1200, PosAdd]
type = PosAdd
trigger1 = anim = 1220
trigger1 = animelem = 21
trigger2 = animelem = 22
x = -32*const(size.xscale)

[State 1200, PosAdd]
type = PosAdd
trigger1 = anim = 1220
trigger1 = animelem = 23
x = -16*const(size.xscale)

[State 1200, 1]
type = HitDef
triggerall = var(10) = 0
trigger1 = animelem = 12
trigger1 = var(18) < animelemno(0)
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, SA
damage = ceil(43.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(12.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MA
pausetime = 14, 13
hitsound = s1000,3
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=130), var(36):=-50
ground.type = Low
ground.velocity = -10
ground.hittime = 20
ground.slidetime = 20
ground.cornerpush.veloff = -10
guard.hittime = 19
;air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -3, -6.43
air.fall = 1
air.cornerpush.veloff = 0
fall.recover = 0
airguard.velocity = -3, -6.43
yaccel = .536
palfx.time = 30
palfx.add = 10,10,10
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,3
palfx.color = 12
palfx.invertall = 1

[State 1200, 2]
type = HitDef
triggerall = var(10) = 0
trigger1 = animelem = 13
trigger1 = var(6) := floor(fvar(12)*fvar(8)*(200 + var(0)*50)) || 1
attr = S, SA
damage = ceil(43.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(12.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Back
guardflag = MA
hitflag = MA
pausetime = 14, 15
guard.pausetime = 13, 13
hitsound = s1000,3
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=140), var(36):=-5
ground.type = High
ground.velocity = -5, -7.5
ground.hittime = 24
ground.slidetime = 24
ground.cornerpush.veloff = 0
guard.velocity = -12.5
guard.hittime = 23
guard.cornerpush.veloff = -16.25
;air.hittime = 999
airguard.ctrltime = 999
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
yaccel = .536
fall = 1
fall.recover = 0
palfx.time = 30
palfx.add = 10,10,10
palfx.mul = 256,256,256
palfx.sinadd = 100,100,100,3
palfx.color = 12
palfx.invertall = 1

[State 1200, 1]
type = HitDef
triggerall = var(10) = 1
trigger1 = animelem = 12
trigger1 = var(18) < animelemno(0)
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, SA
damage = ceil(47.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(13.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MA
pausetime = 16, 13
hitsound = s1000,7
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=130), var(36):=-50
ground.type = Low
ground.velocity = -10
ground.hittime = 20
ground.slidetime = 20
ground.cornerpush.veloff = -10
guard.hittime = 19
;air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -3, -6.43
air.fall = 1
air.cornerpush.veloff = 0
fall.recover = 0
airguard.velocity = -3, -6.43
yaccel = .536
palfx.time = 40
palfx.add = 184,184,200
Palfx.mul = 220,220,255
palfx.sinadd = 64,48,48,32
palfx.color = 8
palfx.invertall = 1

[State 1200, 2]
type = HitDef
triggerall = var(10) = 1
trigger1 = animelem = 13
trigger1 = var(6) := floor(fvar(12)*fvar(8)*(200 + var(0)*50)) || 1
attr = S, SA
damage = ceil(47.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(13.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Back
guardflag = MA
hitflag = MA
pausetime = 16, 15
guard.pausetime = 13, 13
hitsound = s1000,7
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=140), var(36):=-5
ground.type = High
ground.velocity = -5, -7.5
ground.hittime = 24
ground.slidetime = 24
ground.cornerpush.veloff = 0
guard.velocity = -12.5
guard.hittime = 23
guard.cornerpush.veloff = -16.25
;air.hittime = 999
airguard.ctrltime = 999
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
yaccel = .536
fall = 1
fall.recover = 0
palfx.time = 40
palfx.add = 184,184,200
Palfx.mul = 220,220,255
palfx.sinadd = 64,48,48,32
palfx.color = 8
palfx.invertall = 1

[State 1200, 1]
type = HitDef
triggerall = var(10) = 2
trigger1 = animelem = 12
trigger1 = var(18) < animelemno(0)
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, SA
damage = ceil(50.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(14.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Heavy
guardflag = MA
hitflag = MA
pausetime = 15, 13
hitsound = s1000,5
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=130), var(36):=-50
ground.type = Low
ground.velocity = -10
ground.hittime = 20
ground.slidetime = 20
ground.cornerpush.veloff = -10
guard.hittime = 19
;air.hittime = 999
airguard.ctrltime = 999
air.type = Low
air.velocity = -3, -6.43
air.fall = 1
air.cornerpush.veloff = 0
fall.recover = 0
airguard.velocity = -3, -6.43
yaccel = .536
palfx.time = 25
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 1200, 2]
type = HitDef
triggerall = var(10) = 2
trigger1 = animelem = 13
trigger1 = var(6) := floor(fvar(12)*fvar(8)*(200 + var(0)*50)) || 1
attr = S, SA
damage = ceil(50.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(14.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Back
guardflag = MA
hitflag = MA
pausetime = 15, 15
guard.pausetime = 13, 13
hitsound = s1000,5
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=140), var(36):=-5
ground.type = High
ground.velocity = -5, -7.5
ground.hittime = 24
ground.slidetime = 24
ground.cornerpush.veloff = 0
guard.velocity = -12.5
guard.hittime = 23
guard.cornerpush.veloff = -16.25
;air.hittime = 999
airguard.ctrltime = 999
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
yaccel = .536
fall = 1
fall.recover = 0
palfx.time = 25
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 1200, Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= 0
moveType = I

[State 1200, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Warlord Slash
[Statedef 1250]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 1250, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1250, Anim]
type=changeanim
trigger1=!time
value=1230

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1050, Button Detect]
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

[State 1250,]
type = Explod
trigger1 = AnimElem = 12
persistent = 0
anim = 1231
postype = P1
pos = 10,0
ownpal = 1
sprpriority = 2

[State 1250,]
type = Explod
trigger1 = AnimElem = 13
persistent = 0
anim = 1232
postype = P1
pos = 10,0
ownpal = 1
sprpriority = 3

[State 1250]
type = Explod
trigger1 = AnimElem = 13
persistent = 0
anim = 1233
postype = P1
pos = 140,0
ownpal = 1
sprpriority = -1

[State 1250,]
type = EnvShake
trigger1 = AnimElem = 14
time = 10
ampl = 8
freq = 100

[State 1250, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1250, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 0,1
channel = 0

[State 1250, PlaySnd]
type = PlaySnd
trigger1 = animelem = 14
value = 0,20
channel = 1

[State 1250, 1]
type = HitDef
trigger1 = animelem = 12
trigger1 = var(18) < animelemno(0)
id = 0*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, SA
damage = ceil(55.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(15.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 0, 6
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8017)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=130), var(36):=-50
ground.type = High
ground.slidetime = 20
ground.hittime = 22
ground.velocity = -3,15
air.velocity = -3,15
fall = 1
fall.recover = 0

[State 1250, 2]
type = HitDef
trigger1 = animelem = 13
trigger1 = var(6) := floor(fvar(12)*fvar(8)*(200 + var(0)*50)) || 1
attr = S, SA
damage = ceil(55.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(15.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Hard
guardflag = MA
hitflag = MAFD
priority = 3, Hit
pausetime = 10, 10
guard.pausetime = 13, 13
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8017)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=130), var(36):=-50
ground.type = High
ground.slidetime = 20
ground.hittime = 22
ground.velocity = -3,15
air.velocity = -3,15
fall = 1
fall.recover = 0

[State 1250, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Gaia Driver (part 1)
[Statedef 1300]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[State 1000, Button Detect]
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
value = ifElse(var(11) = 0, 1300, ifElse(var(11) = 1, 1310, 1320))

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 5000, 0
channel = 0

[State 1300, 1]
type = HitDef
triggerall = var(11) = 0
trigger1 = time= 0
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
p1stateno = 1301      
p2stateno = 1305      
guard.dist = 0        
ground.velocity = 0
fall = 1              
fall.recover = 0
fall.xvelocity = -4.12
fall.yvelocity = -7.5
yaccel = .536

[State 1300, 1]
type = HitDef
triggerall = var(11) = 1
trigger1 = time= 0
trigger1 = p2bodydist x < const(size.xscale)*(75 + 10*var(0) - const(size.ground.front))
id = 1*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, ST      
hitflag = M-        
;getpower = 70 + var(0)*10 + ceil(0.7*(192.0 + 16*var(0))*const(data.attack)/100.0)
;givepower = ceil(0.6*(192.0 + 16*var(0))*const(data.attack)/100.0)
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1          ;No spark
hitsound = s8, 0
sprpriority = 2     
p2facing = 1          
p1stateno = 1301      
p2stateno = 1305      
guard.dist = 0        
ground.velocity = 0
fall = 1              
fall.recover = 0
fall.xvelocity = -4.12
fall.yvelocity = -7.5
yaccel = .536

[State 1300, 1]
type = HitDef
triggerall = var(11) = 2
trigger1 = time= 0
trigger1 = p2bodydist x < const(size.xscale)*(75 + 10*var(0) - const(size.ground.front))
id = 2*(var(14) := stateno + (var(18)%1000)*10000 + id%10) + var(14)
attr = S, ST      
hitflag = M-        
;getpower = 70 + var(0)*10 + ceil(0.7*(192.0 + 16*var(0))*const(data.attack)/100.0)
;givepower = ceil(0.6*(192.0 + 16*var(0))*const(data.attack)/100.0)
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1          ;No spark
hitsound = s8, 0
sprpriority = 2     
p2facing = 1          
p1stateno = 1301      
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
[Statedef 1301]
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
value = 1302

[Statedef 1302] 
type = A 
movetype= A 
physics = N
anim = 1302
ctrl = 0
velset = 0,0

[State 1202, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = var(10) = 0
x = (-pos x*facing - 48*const(size.xscale))*0.04
y = -14

[State 1202, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = var(10) = 1
x = (-pos x*facing - 48*const(size.xscale))/29.0
y = -18

[State 1202, VelSet]
type = VelSet
trigger1 = time = 0
trigger1 = var(10) = 2
x = (-pos x*facing - 48*const(size.xscale))/30.0
y = -19

[State 1202, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 48*const(size.xscale)

[State 1202, ChangeState]
type = ChangeState
trigger1 = var(10) = 0
trigger1 = time = 33
trigger2 = var(10) = 1
trigger2 = time = 45
trigger3 = var(10) = 2
trigger3 = time = 49
value = 1303

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
trigger2 = var(10) = 1
trigger3 = time > 26
trigger3 = var(10) = 2
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
pos = 25*const(size.xscale), -50*const(size.yscale)

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 2
pos = -5*const(size.xscale), -50*const(size.yscale)

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 3
pos = -35*const(size.xscale), -50*const(size.yscale)

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 4
pos = 15*const(size.xscale), -50*const(size.yscale)

[State 1202, SprPriority]
type = SprPriority
trigger1 = animelemno(0) != 4
value = (var(13) := 2) + 1

[State 1202, SprPriority]
type = SprPriority
trigger1 = animelemno(0) = 4
;value = (var(13) := -(teamside = 1))

[Statedef 1303]
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
value = ceil(-(113.0 + 16*var(10))*(ifelse(var(21)%10 = 5 || var(9) = 5, ifelse(var(20), 1.25, 1.4), 0.95 + 0.05*(var(21)%10)))*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)
persistent = 0

[State 1203, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = pos y >= 0
value = ceil(0.6*(113.0 + 16*var(10))*(ifelse(var(21)%10 = 5 || var(9) = 5, ifelse(var(20), 1.25, 1.4), 0.95 + 0.05*(var(21)%10)))*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)
persistent = 0

[State 1203, PowerAdd]
type = PowerAdd
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

[State 1203, Explod]
type = Explod
triggerall = !var(22)
trigger1 = pos y + vel y > -16*const(size.yscale)
postype = p1
anim = 3120
scale = 0.25,0.25
bindtime = 1
facing = -1
pos = floor(32*const(size.xscale)), floor(-pos y - vel y)
sprpriority = 5
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

[Statedef 1304]
type = A
movetype= I
physics = N
velset = -4.12, -10
ctrl = 0

[State 1204, VelAdd]
type = VelAdd
trigger1 = pos y < 0
y = 0.536

[State 1204, PosSet]
type = PosSet
trigger1 = vel y > 0
trigger1 = pos y >= 0
y = 0

[State 1204, PosAdd]
type = PosAdd
trigger1 = time = 0
x = -16*const(size.xscale)

[State 1204, VelSet]
type = VelSet
trigger1 = vel y > 0
trigger1 = pos y >= 0
x = 0
y = 0

[State 1204, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 1304
trigger1 = vel y = 0
trigger1 = pos y = 0
value = 1304

[State Idle Anim]
type = StateTypeSet
trigger1 = anim = 1304
trigger1 = animelem = 1
statetype = S

[State 1204, CtrlSet]
type = CtrlSet
triggerall = roundstate < 3
trigger1 = anim = 1304
trigger1 = animelem = 6
value = 1

[State Idle Anim Cancel]
type = ChangeState
triggerall = ctrl
trigger1 = var(59) < 1
trigger1 = command != "holddown" && (command = "holdfwd" || command = "holdback")
trigger1 = var(10) := 0 || 1
trigger2 = var(59) < 1
trigger2 = command = "holddown"
trigger2 = var(10) := 1
trigger3 = var(59) < 1
trigger3 = command = "holdup"
trigger3 = var(10) := 2
value = ifelse(var(0) = 2, 40, ifelse(var(0) = 1, 10, 20))
ctrl = 1

[State 1304, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = ctrl
trigger2 = p2dist x < 0
value = 0
ctrl = 1

[Statedef 1305]
type = A
movetype= H
physics = N
velset = 0,0

[State 1205, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1330

[State 1205, ScreenBound]
type = ScreenBound
trigger1 = animtime = 0
value = 0
movecamera = 0, 0

[State 1205, 1]
type = SelfState
Trigger1 = time > 60
value = 5050

[Statedef 1306]
type = A
movetype= H
physics = N
velset = 0,0

[State 1206, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 1335

[State 1206, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0, 0

[Statedef 1307]
type = A
movetype= H
physics = N
velset = 0,0

[State 1207, 2]
type = SelfState
trigger1 = animtime = 0
trigger1 = anim = 5100
trigger2 = time > 60
value = 5101

[State 1207, 1]
type = ChangeAnim
trigger1 = !gethitvar(isbound)
trigger1 = anim != 5100
value = 5100

[State 1207, 3]
type = ChangeAnim2
trigger1 = Time = 0
value = 1340

[State 1207, 4]
type = ChangeAnim
trigger1 = gethitvar(isbound)
trigger1 = pos y >= 0
trigger1 = anim != 5080
value = 5080

[State 1207, ScreenBound]
type = ScreenBound
trigger1 = gethitvar(isbound)
value = 0
movecamera = 0, 0

[State 1207, NotHitBy]
type = NotHitBy
trigger1 = gethitvar(isbound)
value = SCA

;---------------------------------------------------------------------------
;EX Gaia Driver (part 1)
[Statedef 1350]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=-1000
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

[State 1050, Anim]
type=changeanim
trigger1=!time
value=1300

[State 1050,Posset]
type=posset
trigger1=!time
y=0

[State 1000, Width]
type = Width
trigger1 = animelemno(0) = [9, 10]
player = floor(-16*const(size.xscale) + const(size.ground.front)*(const(size.xscale) - 1)), floor(const(size.ground.back)*(const(size.xscale) - 1))

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
pos = 0, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1


[State 1300, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 5000, 0
channel = 0

[State 1300, 1]
type = HitDef

trigger1 = time= 0
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
p1stateno = 1351      
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
[Statedef 1351]
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
value = 1352

[Statedef 1352] 
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
y = -25

[State 1202, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 48*const(size.xscale)

[State 1202, ChangeState]
type = ChangeState
trigger1 = time = 62
value = 1353

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
pos = 25*const(size.xscale), -50*const(size.yscale)

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 2
pos = -5*const(size.xscale), -50*const(size.yscale)

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 3
pos = -35*const(size.xscale), -50*const(size.yscale)

[State 1202, Bind 1]
type = TargetBind
trigger1 = animelemno(0) = 4
pos = 15*const(size.xscale), -50*const(size.yscale)

[State 1202, SprPriority]
type = SprPriority
trigger1 = animelemno(0) != 4
value = (var(13) := 2) + 1

[State 1202, SprPriority]
type = SprPriority
trigger1 = animelemno(0) = 4
;value = (var(13) := -(teamside = 1))

[Statedef 1353]
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
value = ceil(-(150.0 + 16*var(10))*(ifelse(var(21)%10 = 5 || var(9) = 5, ifelse(var(20), 1.25, 1.4), 0.95 + 0.05*(var(21)%10)))*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)
persistent = 0

[State 1203, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = pos y >= 0
value = ceil(0.6*(150.0 + 16*var(10))*(ifelse(var(21)%10 = 5 || var(9) = 5, ifelse(var(20), 1.25, 1.4), 0.95 + 0.05*(var(21)%10)))*const(data.attack)*ifelse(var(20), 1 + (var(20) - 1)*fvar(15), 1)/100.0)
persistent = 0

[State 1203, PowerAdd]
type = PowerAdd
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


;-------------------------------------------------------------
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
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[STATE 2900,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
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
sparkxy = -10 + 0*(var(35):=76), var(36):=-83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[STATE 2910,IDLE]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[STATE 2910,CHANGE STATE]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1