;---------------------------------------------------------------------------
;Manchester Black
[Statedef 1000]
type = S
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 1000
poweradd = 72 * !var(20)
sprpriority = 2

[State 1000, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = ifelse(var(10),1.5,0)

[State 1000,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=2
trigger2 = AnimElem=6
trigger3 = AnimElem=10
trigger4 = AnimElem=14
trigger5 = AnimElem=18
trigger6 = AnimElem=22
trigger7 = AnimElem=26
value = S1,1
channel = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S5,3

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifelse(var(10) = 2, 102, ifelse(var(10) = 1, 98, 88)) < 7, 7, fvar(11) * ifelse(var(10) = 2, 102, ifelse(var(10) = 1, 98, 88)))), 7
getpower = 72 * !var(20), 36 * !var(20)
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
ground.velocity = -4.32, -7.36
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7 && !movecontact && !movereversed
trigger2 = AnimElem = 11 && !movecontact && !movereversed
trigger3 = AnimElem = 13 && !movecontact && !movereversed
trigger4 = AnimElem = 15 && !movecontact && !movereversed
trigger5 = AnimElem = 19 && !movecontact && !movereversed
trigger6 = AnimElem = 21 && !movecontact && !movereversed
trigger7 = AnimElem = 23 && !movecontact && !movereversed
trigger8 = AnimElem = 27 && !movecontact && !movereversed
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifelse(var(10) = 2, 102, ifelse(var(10) = 1, 98, 88)) < 7, 7, fvar(11) * ifelse(var(10) = 2, 102, ifelse(var(10) = 1, 98, 88)))), 7
getpower = 72 * !var(20), 36 * !var(20)
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
ground.velocity = -4.32, -7.36
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 77), var(36) := -92
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
trigger2 = var(10) = 0 && animelem = 12
trigger3 = var(10) = 1 && animelem = 20
value = 1001

;---------------------------------------------------------------------------
;Done
[Statedef 1001]
type = S
movetype= I
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 1001
poweradd = 0
sprpriority = 2

[State 0, Explod]
type = Explod
trigger1 = !time && prevstateno = 1050
anim = 3006
ID = 3006
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = 0
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Manchester Black
[Statedef 1050]
type = S
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 1050
poweradd = -500
sprpriority = 2

[State 1060, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1
[State 1060, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1060, ExFX]
type = varset
trigger1 = !time
var(25) = 30
[State 1060, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1060, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -22, -78
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 3005
ID = 3005
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
pausemovetime = 0
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1000,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=2
trigger2 = AnimElem=6
trigger3 = AnimElem=10
trigger4 = AnimElem=14
trigger5 = AnimElem=18
trigger6 = AnimElem=22
trigger7 = AnimElem=26
value = S1,1
channel = 2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 2

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getpower = 0
givepower = 36, 36
pausetime = 5,0
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
ground.velocity = -4.32, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = hitcount < 2
trigger1 = AnimElem = 7
trigger2 = AnimElem = 11
trigger3 = AnimElem = 13
trigger4 = AnimElem = 15
trigger5 = AnimElem = 19
trigger6 = AnimElem = 21
trigger7 = AnimElem = 23
trigger8 = AnimElem = 27
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getpower = 0
givepower = 36, 36
pausetime = 5,0
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
ground.velocity = -4.32, 0
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 77), var(36) := -92
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = hitcount >= 2
trigger1 = AnimElem = 7
trigger2 = AnimElem = 11
trigger3 = AnimElem = 13
trigger4 = AnimElem = 15
trigger5 = AnimElem = 19
trigger6 = AnimElem = 21
trigger7 = AnimElem = 23
trigger8 = AnimElem = 27
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 34 < 7, 7, fvar(11) * 34)), 7
getpower = 0
givepower = 36, 36
pausetime = 12,12
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
ground.velocity = -4.32, -7.36
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 77), var(36) := -92
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !animtime
id = 3005
[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 1001

;---------------------------------------------------------------------------
;Canterbury Blue
[Statedef 1100]
type = S
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 1100
poweradd = 72 * !var(20)
sprpriority = 2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S1,3
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S4,9

[State 1000, Button]
type = varset
trigger1 = !time
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1102, ifelse(var(10) = 1, 1101, 1100))

[State 0, ChangeState]
type = varset
trigger1 = AnimElem = 2
var(14) = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimElem = 2
value = 1101


;always twirling, twirling, twirling towards freedom
[Statedef 1101]

[State 0, timer]
type = varadd
trigger1 = 1
var(14) = 1

[State 1100, Autoguarder]
type = Helper
trigger1 = !NumHelper(101100)
helperType = Normal
stateNo = 101100
ID = 101100
name = "Autoguarder"
posType = P1
ownPal = 1
persistent = 0

[State -3, Autoguard pause]
type = ChangeState
trigger1 = NumHelper(101100)
trigger1 = Helper(101100), StateNo = 101101
value = 1102
ignoreHitPause = 1

[State 0, ChangeState]
type = ChangeState
trigger1 = (!animtime && command != "holdx" && command != "holdy" && command != "holdz") || var(14) >= 61
value = 1105


;Autoguard pause
[StateDef 1102]

[State 1102, HitBy]
type = HitBy
trigger1 = Time < 1
value =
time = 1

[State 1102, Pause]
type = Pause
trigger1 = !Time
time = 12
endCmdBufTime = 12
pauseBg = 0

[State 1102, Stop]
type = PosFreeze
trigger1 = 1
value = 1

[State 1102, EnvShake]
type = EnvShake
trigger1 = !Time
time = 0
ampl = 0

[State 1102, Reversal Spark]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8020
ID = 101101
name = "Spark"
postype = P1
pos = 30, (-90+(var(10)*28))
facing = -1
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = s0, 750
channel = 2
ignorehitpause = 1

[State 0, timer]
type = varadd
trigger1 = 1
var(14) = 1

[State 0, End]
type = ChangeState
trigger1 = (!animtime && command != "holdx" && command != "holdy" && command != "holdz") || var(14) >= 61
value = 1105

[State 1102, ChangeState]
type = ChangeState
trigger1 = Time >= 1
value = 1101



;---------------------------------------------------------------------------
;Attack
[Statedef 1105]
type = S
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 1105
poweradd = 0
sprpriority = 2

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1107, ifelse(var(10) = 1, 1106, 1105))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S1,2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S4,1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
triggerall = anim = 1105
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 7
getpower = 72 * !var(20), 36 * !var(20)
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
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 97), var(36) := -112
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
triggerall = anim = 1106
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 7
getpower = 72 * !var(20), 36 * !var(20)
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
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 94), var(36) := -57
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
triggerall = anim = 1107
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 7
getpower = 72 * !var(20), 36 * !var(20)
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
ground.velocity = ifelse(var(20), -6.83, -12.64), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 84), var(36) := -14
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Oxford Red
[Statedef 1200]
type = S
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 1200
poweradd = 72 * !var(20)
sprpriority = 2

[State 1000, Button]
type = varset
trigger1 = !time
var(10) = ifelse((command = "c" || command = "rlsc"), 2, ifelse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1202, ifelse(var(10) = 1, 1201, 1200))

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem =3
x = (5.0+var(10)*2.5)

[State 1030, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "EX Oxford Red Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem =7
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S4,0

[State 1000,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 13
trigger3 = AnimElem = 16
trigger4 = AnimElem = 19
trigger5 = AnimElem = 22 && var(10)
trigger6 = AnimElem = 25 && var(10)
trigger7 = AnimElem = 28 && var(10) = 2
trigger8 = AnimElem = 31 && var(10) = 2
value = 5,0

[State 1000,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=6
trigger2 = AnimElem=10
trigger3 = AnimElem=13
trigger4 = AnimElem=16
trigger5 = AnimElem=19 && var(10)
trigger6 = AnimElem=22 && var(10)
trigger7 = AnimElem=25 && var(10)=2
trigger8 = AnimElem=28 && var(10)=2
value = 1,1
channel = 1

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 19 && !var(10)
trigger2 = AnimElem = 25 && var(10)=1
trigger3 = AnimElem = 31 && var(10)=2
value = 1,2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 7
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 22
ground.slidetime = 22
guard.hittime = 22
air.hittime = 120
ground.velocity = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 101), var(36) := -56
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 11
trigger2 = animelem = 23
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 22
ground.slidetime = 22
guard.hittime = 22
air.hittime = 120
ground.velocity = -3.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -56
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 14
trigger2 = animelem = 26
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 22
ground.slidetime = 22
guard.hittime = 22
air.hittime = 120
ground.velocity = -3.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -39
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 17
trigger2 = animelem = 29
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 22
ground.slidetime = 22
guard.hittime = 22
air.hittime = 120
ground.velocity = -3.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 110), var(36) := -71
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 20
trigger2 = animelem = 32
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 22
ground.slidetime = 22
guard.hittime = 22
air.hittime = 120
ground.velocity = -3.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 109), var(36) := -23
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;====<EX OXFORD RED>=
[StateDef 1230]
type = S
physics = N
moveType = A
anim = 1230
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1230, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1230, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1230, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 94

[State 1230, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(16 * const(size.xScale)), ceil(-63 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1230, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1230, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem = 3
x = 14.2857143

[State 1030, Dust Helper]
type = Helper
trigger1 = AnimElem = 3
helperType = Normal
stateNo = 8103
ID = 8100
name = "EX Oxford Red Dust"
posType = P1
pauseMoveTime = 255
superMoveTime = 255
ownPal = 1

[State 1200, VelSet]
type = VelSet
trigger1 = AnimElem =7
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S4,0

[State 1000,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 13
trigger3 = AnimElem = 16
trigger4 = AnimElem = 19
trigger5 = AnimElem = 22
trigger6 = AnimElem = 25
trigger7 = AnimElem = 28
trigger8 = AnimElem = 31
trigger9 = AnimElem = 34
trigger10 = AnimElem = 37
trigger11 = AnimElem = 40
trigger12 = AnimElem = 43
value = 5,0
channel = 0

[State 1000,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=6
trigger2 = AnimElem=10
trigger3 = AnimElem=13
trigger4 = AnimElem=16
trigger5 = AnimElem=19
trigger6 = AnimElem=22
trigger7 = AnimElem=25
trigger8 = AnimElem=28
trigger9 = AnimElem = 34
trigger10 = AnimElem = 37
trigger11 = AnimElem = 40
value = 1,1
channel = 1

[State 1000,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 43
value = 1,2
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 7
ID = 1230
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = 0
ground.cornerpush.veloff = 0
guard.velocity = -6.83
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 101), var(36) := -56
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1230, TargetBind]
type = TargetBind
trigger1 = NumTarget(1230)
trigger1 = movehit = 1 && Target, Alive && target, statetype = s
id = 1230
pos = 60,0
ignorehitpause = 1
persistent = 0

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 11
trigger2 = animelem = 23
trigger3 = animelem = 35
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givepower = 36, 36
pausetime = 2,2
guard.pausetime = 2,2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = -1.75
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -56
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 14
trigger2 = animelem = 26
trigger3 = animelem = 38
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givepower = 36, 36
pausetime = 2,2
guard.pausetime = 2,2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = -1.75
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -39
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 17
trigger2 = animelem = 29
trigger3 = animelem = 41
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givepower = 36, 36
pausetime = 2,2
guard.pausetime = 2,2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = -1.75
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 110), var(36) := -71
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 20
trigger2 = animelem = 32
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givepower = 36, 36
pausetime = 2,2
guard.pausetime = 2,2
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = -1.75
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 109), var(36) := -23
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 44
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givepower = 36, 36
pausetime = 4,4
guard.pausetime = 4,4
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = -2.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 109), var(36) := -23
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(45) >= 0
moveType = I

[State 1230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;Liverpool White
[Statedef 1300]
type = S
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 1300
poweradd = 72 * !var(20)
sprpriority = 2

[State 1000, Button]
type = varset
trigger1 = !time
var(10) = ifelse((command = "c" || command = "rlsc"), 2, ifelse((command = "b" || command = "rlsb"), 1, 0))

[State 1100, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 2, 1302, ifelse(var(10) = 1, 1301, 1300))

[State 40, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 40

[State 40, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, Snd]
type = playsnd
trigger1 = !time
value = 5, 1

[State 1000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem=3
statetype = A
physics = N

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem=3
x = (4.0+var(10))
y = -(5.25+var(10)*.125)*1.75

[State 1000, VelSet]
type = VelAdd
trigger1 = AnimElemTime(3)>0 && AnimElemTime(9)<0
y = .875

[State 1100]
type = StatetypeSet
trigger1 = AnimElem=9
statetype = S
physics = N

[State 1000, VelSet]
type = PosSet
trigger1 = AnimElem=9
y = 0

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem=9
x = 0
y = 0

[State 40, Snd]
type = playsnd
trigger1 = animelem = 9
value = 1, 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 10
attr = S, SA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * ifelse(var(10) = 2, 109, ifelse(var(10) = 1, 102, 98)) < 7, 7, fvar(11) * ifelse(var(10) = 2, 102, ifelse(var(10) = 1, 98, 88)))), 7
getpower = 72 * !var(20), 36 * !var(20)
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
ground.velocity = -4.32, -7.36
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 107), var(36) := -76
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;====<EX LIVERPOOL WHITE>=
[StateDef 1330]
type = S
physics = N
moveType = A
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1330, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1330, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1330, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 31

[State 1330, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(19 * const(size.xScale)), ceil(-64 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1330, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 3

[State 1330, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) >= 0
trigger1 = AnimElemTime(8) < 0
value = SCA
time = 1

[State 40, Snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 40
channel = 1

[State 40, Dust]
type = helper
trigger1 = animelem = 3
helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
channel = 0

[State 1000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem=3
statetype = A
physics = N

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem=3
x = p2dist x / 28
y = -(5.25)*1.75

[State 1000, VelSet]
type = VelAdd
trigger1 = AnimElemTime(3)>0 && AnimElemTime(9)<0
y = .875

[State 1100]
type = StatetypeSet
trigger1 = AnimElem=9
statetype = S
physics = N

[State 1000, VelSet]
type = PosSet
trigger1 = AnimElem=9
y = 0

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem=9
x = 0
y = 0

[State 40, Snd]
type = playsnd
trigger1 = animelem = 9
value = 1, 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 10
attr = S, SA
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 126 < 7, 7, fvar(11) * 126)), 7
getpower = 0,0
givepower = 0,0
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32, -7.36
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 107), var(36) := -76
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1230, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(11) >= 0
moveType = I

[State 1230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;St. Andrews Green
[Statedef 1400]
type = S
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 1400
poweradd = 72 * !var(20)
sprpriority = 2

[State 1000, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse((command = "z" || command = "rlsz"), 2, ifelse((command = "y" || command = "rlsy"), 1, 0))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1,2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S4,0
channel = 0

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim =  1405
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5,0.5
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(6) < 0
value = SCA,NP,SP
time = 1
ignorehitpause = 1

[State 1100, Projectile Reflector (Low)]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 1401
ID = 1403
name = "Projectile Reflector (Low)"
posType = P1
ownPal = 1

[State 1100, Projectile Reflector]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 1401
ID = 1401
name = "Projectile Reflector"
posType = P1
ownPal = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 88 < 7, 7, fvar(11) * 88)), 7
getpower = 72 * !var(20), 36 * !var(20)
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
ground.velocity = -4.32, ifelse(var(10)=0, -8.36, ifelse(var(10)=1, -6.36,-5))
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 63), var(36) := -27
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, PlaySnd]
type = PlaySnd
trigger1 = numhelper(1415)
value = S5,2
channel = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1



;---------------------------------------------------------------------------
;EX St. Andrews Green
[Statedef 1430]
type = S
movetype= A
physics = N
juggle = 0
velset = 0,0
ctrl = 0
anim = 1430
poweradd = -500
sprpriority = 2

[State 1060, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1
[State 1060, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1060, ExFX]
type = varset
trigger1 = !time
var(25) = 12
[State 1060, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
[State 1060, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 18, -116
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1,2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S4,0
channel = 0

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim =  1405
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5,0.5
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(6) < 0
value = SCA,NP,SP
time = 1
ignorehitpause = 1

[State 1100, Projectile Reflector (Low)]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 1401
ID = 1403
name = "Projectile Reflector (Low)"
posType = P1
ownPal = 1

[State 1100, Projectile Reflector]
type = Helper
trigger1 = animelem = 2
helperType = Normal
stateNo = 1401
ID = 1401
name = "Projectile Reflector"
posType = P1
ownPal = 1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 105 < 7, 7, fvar(11) * 105)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.5, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.5, -8.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 63), var(36) := -27
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, PlaySnd]
type = PlaySnd
trigger1 = numhelper(1445)
value = S5,2
channel = 0
persistent = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

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

[State 2900, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 2
channel = 0
[State 2900, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 2
channel = 1

[State 2900, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 4
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
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -53
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 2900, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
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

[State 2910, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4, 2
channel = 0
[State 2910, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 2910, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 5
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
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -48
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 2910, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 2910, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
