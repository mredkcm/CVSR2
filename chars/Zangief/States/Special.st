; _________________________________________
;| Zangief by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES=
;==

;Lariat
[StateDef 1000]
type = S
movetype = A
physics = N
juggle = 8
anim = 1000
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 220, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 20, 1]
type = VelSet
trigger1 = animelemtime(5) > 0
trigger1 = animelemtime(18) < 0
x = (command = "holdfwd")-(command = "holdback")
persistent = 1

[State 20, 1]
type = VelSet
trigger1 = AnimElem = 18
x = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1000, 0
channel = 0

[State 1100, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 5
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
trigger5 = AnimElem = 17
value = 1,4

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 1000, 1
channel = 0

[State 1100, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 5
trigger2 = AnimElem = 7
trigger3 = AnimElem = 10
trigger4 = AnimElem = 13
trigger5 = AnimElem = 17
value = 6,5

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 18
movetype = I

[State 1000,Super]
type = Helper
trigger1 = AnimElem = 2
id = 7000
name = "dust"
pos = 0,0
postype = P1
stateno = 7000
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -95
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 105 < 7, 7, fvar(11) * 105)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 8
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 11
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 5]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 14
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 6]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 17
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Air Lariat
[StateDef 1050]
type = A
movetype = A
physics = N
juggle = 8
anim = 1050
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 20, 1]
type = VelSet
trigger1 = AnimElem = 1
x = 2.5
y = -2.5

[State 20, 1]
type = VelSet
trigger1 = animelemtime(3) >= 0
x = 2.5+(command = "holdfwd")-(command = "holdback")
persistent = 1

[State 105, 1]
type = VelAdd
trigger1 = animelemtime(3) >= 0
y = .5

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 1000, 1
channel = 0

[State 1100, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
value = 6,5

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
trigger2 = AnimElem = 7
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4*ifelse(p2dist x>=0,1,-1),-6.5
guard.velocity = -8*ifelse(p2dist x>=0,1,-1)
air.velocity = -4*ifelse(p2dist x>=0,1,-1),-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -94
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, End]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1055

;End lariat
[Statedef 1055]
type = S
physics = S
ctrl = 0
anim = 1055
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = !time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Quick Lariat
[StateDef 1100]
type = S
movetype = A
physics = N
juggle = 8
anim = 1100
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 220, Position]
type = PosSet
trigger1 = Time = 0
y = 0

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 20, 1]
type = VelSet
trigger1 = animelemtime(5) > 0
trigger1 = animelemtime(12) < 0
x = (command = "holdfwd")-(command = "holdback")
persistent = 1

[State 20, 1]
type = VelSet
trigger1 = AnimElem = 12
x = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1100, 0
channel = 0

[State 1100, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
trigger3 = AnimElem = 8
trigger5 = AnimElem = 11
value = 1,4

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 1000, 1
channel = 0

[State 1100, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 2
trigger2 = AnimElem = 5
trigger3 = AnimElem = 8
trigger5 = AnimElem = 11
value = 6,5

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 12
movetype = I

[State 1000,Super]
type = Helper
trigger1 = AnimElem = 2
id = 7000
name = "dust"
pos = 0,0
postype = P1
stateno = 7000
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -60
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 3]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 8
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 4]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 11
attr = S, SA
animtype = Heavy
air.animtype = Back
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
hitflag = MAF
guardflag = M
animType = Back
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 20
ground.slideTime = 20
guard.hitTime = 20
air.hitTime = 120
ground.velocity = -4,-6.5
guard.velocity = -8
air.velocity = -4,-6.5
airguard.velocity = -6.67,-1
ground.cornerPush.velOff = 0
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -86
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Banishing Flat
[StateDef 1200]
type = S
movetype = A
physics = S
juggle = 8
anim = 1200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 8

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 4
x = 24

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 6
x = 8*(var(10)+1)

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1220, ifElse(var(10) = 1, 1210, 1200))

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1200, 0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, 0
channel = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200, 1
channel = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 5
movetype = I

[State 3001, Super]
type = Helper
trigger1 = AnimElem = 2
id = 7100
name = "flat_1"
pos = 0,0
postype = P1
stateno = 7100
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
supermovetime = 99999999999999

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = A, SA
hitflag = MAFP
guardflag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 120, ifElse(var(10), 110, 100)))), 7
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animtype = Heavy
air.animtype = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
air.hitTime = 120
ground.velocity = -8,0
guard.velocity = -8
air.velocity = -4,-5.5
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = -11.2
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 0
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;EX Banishing Flat
[StateDef 1230]
type = S
movetype = A
physics = S
juggle = 8
anim = 1230
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1130, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1130, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1130, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 35

[State 1130, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = P1
pos = ceil(17 * const(size.xScale)), ceil(-85 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1

[State 1130, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 24

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 4
x = 24

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 6
x = 10

[State 3001, Width]
type = Width
trigger1 = 1
edge = 5,0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1200, 0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, 0
channel = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200, 1
channel = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 6
movetype = I

[State 3001, Super]
type = Helper
trigger1 = AnimElem = 2
id = 7100
name = "flat_1"
pos = 0,0
postype = P1
stateno = 7100
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
supermovetime = 99999999999999

[State 1100, HitDef 1]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
attr = A, SA
hitflag = MAFP
guardflag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animtype = Heavy
air.animtype = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
air.hitTime = 120
ground.velocity = -3,0
guard.velocity = -3
air.velocity = -4,-5.5
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = -11.2
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 0
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1100, HitDef 2]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 5
attr = A, SA
hitflag = MAFP
guardflag = M
priority = 7, Hit
damage = ceil(ifElse(fvar(11) * 65 < 7, 7, fvar(11) * 65)), 7
getPower = 0, 0
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
guard.pauseTime = ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
animtype = Heavy
air.animtype = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
air.hitTime = 120
ground.velocity = -4,-4
guard.velocity = -4
air.velocity = -4,-5.5
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = -11.2
guard.cornerpush.veloff = -11.2
air.cornerPush.velOff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .49
persistent = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Screw Piledriver
[StateDef 1300]
type = S
movetype = A
physics = S
juggle = 8
anim = 1300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, VarSet]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifelse(P2bodydist X > 66,0,ifelse(P2bodydist X > 56,1,2))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1320, ifElse(var(10) = 1, 1310, 1300))

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 2
movetype = I

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,ifelse(!var(10),77,ifelse(var(10)=1,66,56))]
trigger1 = AnimElem = 1
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1301
p2stateno = 1309
guard.dist = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,ifelse(!var(10),77,ifelse(var(10)=1,66,56))]
triggerall = var(16)
trigger1 = AnimElem = 1
attr = S, ST
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1301
p2stateno = 1309
guard.dist = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 1301]
type = S
movetype = A
physics = N
anim = 1301
velset = 0,0

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1305

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 1300, 0
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 1, 5

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 5, 4
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 6, 2

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(65*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(78*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(100*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(77*const(size.xscale)),ceil(-47*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
trigger2 = animelemtime(9) = 2
pos = ceil(77*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(8*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 8
pos = ceil(-30*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(24*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 7
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 8
value = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
y = -10-(var(10)*2.5)

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1302

;Part 3
[Statedef 1302]
type = S
movetype = A
physics = N
velset = 0,0
anim = 811
sprpriority = 1

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1306

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(40*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(70*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(70*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = -4.5
y = -4.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = .75

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .99

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = time = 1
value = -180

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = time = 1
value = -210

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = time = 1
value = -240

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = time = 1
value = 35

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1303

;Part 4
[Statedef 1303]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 52, 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 1305]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1305

;Player 2 part 2
[Statedef 1306]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = AnimElemTime(2) < 0
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 816

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = -4.5
y = -3.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(2) > 0
y = .4

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 part 3
[Statedef 1309]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

;EX Screw Piledriver
[StateDef 1330]
type = S
movetype = A
physics = S
juggle = 8
anim = 1320
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1100, VarSet]
type = VarSet
trigger1 = !Time && AILevel
var(10) = P2bodydist X > 76

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 2
movetype = I

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,ifelse(!var(10),77,ifelse(var(10)=3,77,56))]
trigger1 = AnimElem = 1
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1331
p2stateno = 1309
guard.dist = 0
getPower = 0,0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,ifelse(!var(10),77,ifelse(var(10)=3,77,56))]
triggerall = var(16)
trigger1 = AnimElem = 1
attr = S, ST
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1331
p2stateno = 1309
guard.dist = 0
getPower = 0,0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 1331]
type = S
movetype = A
physics = N
anim = 1301
velset = 0,0

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1305

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 1300, 0
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 1, 5

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 5, 4
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 6, 2

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(65*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(78*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(100*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(77*const(size.xscale)),ceil(-47*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
trigger2 = animelemtime(9) = 2
pos = ceil(77*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(8*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 8
pos = ceil(-30*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(24*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 7
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 8
value = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
y = -11-(var(10)*2.5)

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1332

;Part 3
[Statedef 1332]
type = S
movetype = A
physics = N
velset = 0,0
anim = 811
sprpriority = 1

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1306

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(40*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(70*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(70*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = -3.5
y = -6.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = .75

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .99

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -210

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1303

;Air Screw Piledriver
[StateDef 1350]
type = A
movetype = A
physics = N
juggle = 8
anim = 1350
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 3
movetype = I

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,ifelse(!var(10),66,ifelse(var(10)=1,56,46))]
triggerall = P2bodydist Y = [-64,-enemynear,const(size.head.pos.y)-54]
trigger1 = AnimElem = 1
attr = A, ST
hitflag = A-
priority = 3, Miss
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1351
p2stateno = 1309
guard.dist = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,ifelse(!var(10),66,ifelse(var(10)=1,56,46))]
triggerall = P2bodydist Y = [-64,-enemynear,const(size.head.pos.y)-54]
triggerall = var(16)
trigger1 = AnimElem = 1
attr = A, ST
hitflag = AF
priority = 3, Miss
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1351
p2stateno = 1309
guard.dist = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 800, 1
channel = 1

[State 52, 4]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1055

;Part 2
[Statedef 1351]
type = A
movetype = A
physics = N
anim = 1351
velset = 0,0

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1355

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 1300, 0
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 1, 5

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 5, 4
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 6, 2

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(75*const(size.xscale)),ceil(-75*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(70*const(size.xscale)),ceil(-75*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(78*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(100*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(77*const(size.xscale)),ceil(-47*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
trigger2 = animelemtime(9) = 2
pos = ceil(77*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(8*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 8
pos = ceil(-30*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(24*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 7
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 8
value = 1

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
x = 3*ifelse(frontedgedist>160,1,-1)
y = -8-(var(10)*2.5)

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1352

;Part 3
[Statedef 1352]
type = S
movetype = A
physics = N
velset = 0,0
anim = 811
sprpriority = 1

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1306

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(48*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(90*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(90*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = -5.5
y = -5.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = .75

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .99

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = time = 1
value = -140

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = time = 1
value = -161

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = time = 1
value = -189

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = time = 1
value = 35

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1303

;Player 2
[Statedef 1355]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1355

;EX Air Screw Piledriver
[StateDef 1380]
type = A
movetype = A
physics = N
juggle = 8
anim = 1350
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 3
movetype = I

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,ifelse(!var(10),66,ifelse(var(10)=3,76,46))]
triggerall = P2bodydist Y = [-64,-enemynear,const(size.head.pos.y)-54]
trigger1 = AnimElem = 1
attr = A, ST
hitflag = A-
priority = 3, Miss
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1381
p2stateno = 1309
guard.dist = 0
getPower = 0, 0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,ifelse(!var(10),66,ifelse(var(10)=3,76,46))]
triggerall = P2bodydist Y = [-64,-enemynear,const(size.head.pos.y)-54]
triggerall = var(16)
trigger1 = AnimElem = 1
attr = A, ST
hitflag = AF
priority = 3, Miss
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1381
p2stateno = 1309
guard.dist = 0
getPower = 0, 0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 800, 1
channel = 1

[State 52, 4]
type = ChangeState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 1055

;Part 2
[Statedef 1381]
type = A
movetype = A
physics = N
anim = 1351
velset = 0,0

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1355

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 1300, 0
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 1
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 1, 5

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 5, 4
channel = 0
persistent = 0

[State 901, Effect]
type = PlaySnd
triggerall = var(40) != 0
trigger1 = AnimElem = 6
trigger2 = animelemtime(9) = 2
value = 6, 2

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(75*const(size.xscale)),ceil(-75*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(70*const(size.xscale)),ceil(-75*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(78*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(100*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(77*const(size.xscale)),ceil(-47*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
trigger2 = animelemtime(9) = 2
pos = ceil(77*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(8*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 8
pos = ceil(-30*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(24*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 7
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 8
value = 1

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
x = 3*ifelse(frontedgedist>160,1,-1)
y = -10-(var(10)*2.5)

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1382

;Part 3
[Statedef 1382]
type = S
movetype = A
physics = N
velset = 0,0
anim = 811
sprpriority = 1

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1306

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(48*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(90*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(90*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 4
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = -.5
y = -5.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = .75

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .99

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -210

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1303

;Player 2
[Statedef 1355]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1355

;Flying Powerbomb
[StateDef 1400]
type = S
movetype = A
physics = N
juggle = 8
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1520, ifElse(var(10) = 1, 1510, 1500))

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 3.8

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 13 && var(10) != 2
trigger2 = AnimElem = 14 && var(10) = 2
x = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 13 && var(10) != 2
trigger2 = AnimElem = 14 && var(10) = 2
movetype = I

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=1
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 52,0

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 6,0

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 820,2

[State 0, EnvShake]
type = EnvShake
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
time = 8
ampl =  -5
ignorehitpause = 1

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
trigger1 = AnimElem = 1
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1401
p2stateno = 1409
guard.dist = 0
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
triggerall = var(16)
trigger1 = AnimElem = 1
attr = S, ST
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1401
p2stateno = 1409
guard.dist = 0
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 1401]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1401

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1405

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3001, Width]
type = Width
trigger1 = animelem = 1
edge = 90,0

[State 3001, Width]
type = Width
trigger1 = animelem = 9
edge = 105,0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 16 && var(40) != 1
value = 1400, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 1
value = 820, 2
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 16 && var(40) != 0
value = 5, 4
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 0
value = 820, 3
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 1
value = 41, 0
channel = 3

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 0
value = 6, 2
channel = 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(120*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 16
StateType = A
physics = N

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 13
x = 96

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 16
x = 3
y = -12-(var(10)*1.5)

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(16) > 0
y = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(66*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(19*const(size.xscale)),ceil(-76*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 4
trigger2 = AnimElem = 13
pos = ceil(-43*const(size.xscale)),ceil(-62*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 7
pos = ceil(-35*const(size.xscale)),ceil(-109*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 8
pos = ceil(96*const(size.xscale)),ceil(-87*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 9
pos = ceil(135*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 12
pos = ceil(72*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 16
pos = ceil(-36*const(size.xscale)),ceil(-130*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 17
pos = ceil(80*const(size.xscale)),ceil(-108*const(size.yscale))
postype = P1
time = -1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = AnimElem = 9
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = AnimElem = 9
value = -63
kill = 0

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = AnimElem = 9
value = -73
kill = 0

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = AnimElem = 9
value = -83
kill = 0

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(16) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1402

;Part 3
[Statedef 1402]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1402

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1406

[State 3001, Width]
type = Width
trigger1 = 1
edge = 30,-30

[State 3001, Width]
type = Width
trigger1 = time = 0
edge = -105,105

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3
channel = 2

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(50*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 2
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = 3
y = -10

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = .75

[State 901,1]
type = targetBind
trigger1 = AnimElem = 1
pos = ceil(50*const(size.xscale)),0
postype = P1
time = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = time = 1
value = -71

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = time = 1
value = -81

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = time = 1
value = -91

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1403

;Part 4
[Statedef 1403]
type = S
physics = S
ctrl = 0
anim = 1403
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 1300,Turn]
type = Turn
trigger1 = Time = 0

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 1405]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1405

;Player 2 part 2
[Statedef 1406]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1406

[State 1201, screenbound]
type = screenbound
trigger1 = AnimElemTime(2) < 0
value = 1

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = 4
y = -8.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(2) > 0
y = .49

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 1300,Turn]
type = Turn
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 part 3
[Statedef 1409]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

;EX Flying Powerbomb
[StateDef 1430]
type = S
movetype = A
physics = N
juggle = 8
anim = Ifelse(p2bodydist x>=50,1520,1901)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=1
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 52,0

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 6,0

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 820,2

[State 0, EnvShake]
type = EnvShake
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
time = 8
ampl =  -5
ignorehitpause = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 903, Vel]
type = VelSet
trigger1 = anim = 1520
trigger1 = AnimElem = 4
x = 5.8

[State 903, Vel]
type = VelSet
trigger1 = anim = 1520
trigger1 = AnimElem = 14
x = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 14
movetype = I

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
trigger1 = AnimElem = 1
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1431
p2stateno = 1409
guard.dist = 0
getpower = 0, 0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
triggerall = var(16)
trigger1 = AnimElem = 1
attr = S, ST
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1431
p2stateno = 1409
guard.dist = 0
getpower = 0, 0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 1431]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1401

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1405

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3001, Width]
type = Width
trigger1 = animelem = 1
edge = 90,0

[State 3001, Width]
type = Width
trigger1 = animelem = 9
edge = 105,0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 16 && var(40) != 1
value = 1400, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 1
value = 820, 2
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 16 && var(40) != 0
value = 5, 4
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9 && var(40) != 0
value = 820, 3
channel = 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 1
value = 41, 0
channel = 3

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 1
value = 6, 2
channel = 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(120*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 16
StateType = A
physics = N

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 13
x = 96

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 16
x = 3
y = -14-(var(10)*1.5)

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(16) > 0
y = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(66*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(19*const(size.xscale)),ceil(-76*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 4
trigger2 = AnimElem = 13
pos = ceil(-43*const(size.xscale)),ceil(-62*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 7
pos = ceil(-35*const(size.xscale)),ceil(-109*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 8
pos = ceil(96*const(size.xscale)),ceil(-87*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 9
pos = ceil(135*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 12
pos = ceil(72*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 16
pos = ceil(-36*const(size.xscale)),ceil(-130*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 17
pos = ceil(80*const(size.xscale)),ceil(-108*const(size.yscale))
postype = P1
time = -1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = AnimElem = 9
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 9
value = -93
kill = 0

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(16) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1432

;Part 3
[Statedef 1432]
type = S
movetype = A
physics = S
velset = 0,0
anim = 1402

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1406

[State 3001, Width]
type = Width
trigger1 = 1
edge = 30,-30

[State 3001, Width]
type = Width
trigger1 = time = 0
edge = -105,105

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(50*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 2
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = 3
y = -10

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = .75

[State 901,1]
type = targetBind
trigger1 = AnimElem = 1
pos = ceil(50*const(size.xscale)),0
postype = P1
time = 1

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -111

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1403

;Atomic Suplex
[StateDef 1500]
type = S
movetype = A
physics = N
juggle = 8
anim = 1500
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1520, ifElse(var(10) = 1, 1510, 1500))

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 3.8

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 13 && var(10) != 2
trigger2 = AnimElem = 14 && var(10) = 2
x = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 13 && var(10) != 2
trigger2 = AnimElem = 14 && var(10) = 2
movetype = I

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=1
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 52,0

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 6,0

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 820,2

[State 0, EnvShake]
type = EnvShake
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
time = 8
ampl =  -5
ignorehitpause = 1

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
trigger1 = AnimElem = 1
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1501
p2stateno = 1409
guard.dist = 0
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
triggerall = var(16)
trigger1 = AnimElem = 1
attr = S, ST
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1501
p2stateno = 1409
guard.dist = 0
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 1501]
type = S
movetype = A
physics = N
velset = 0,0
anim = 1501

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1505

[State 3001, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 1
value = 1500, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 0
value = 5, 4
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 41, 0
channel = 3

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 6, 2
channel = 3

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(65*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(78*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(100*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(65*const(size.xscale)),ceil(-74*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
pos = ceil(99*const(size.xscale)),ceil(-114*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(-20*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(85*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 10
pos = ceil(108*const(size.xscale)),ceil(-79*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 9
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 10
value = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
x = 4
y = -9.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .6

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(6) > 0
x = .98

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1502

;Part 3
[Statedef 1502]
type = S
movetype = A
physics = N
velset = 0,0
anim = 1502

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1506

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(120*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(125*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(125*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 2
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = -5
y = -9

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = .6

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = .98

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = time = 1
value = -134

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = time = 1
value = -154

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = time = 1
value = -174

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = time = 1
value = 35

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1503

;Part 4
[Statedef 1503]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 1505]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1505

;Player 2 part 2
[Statedef 1506]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = AnimElemTime(2) < 0
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 1506

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = -5.5
y = -7.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(2) > 0
y = .49

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(2) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2 part 3
[Statedef 1509]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

;EX Atomic Suplex
[StateDef 1530]
type = S
movetype = A
physics = N
juggle = 8
anim = Ifelse(p2bodydist x>=50,1520,1901)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 903, Vel]
type = VelSet
trigger1 = anim = 1520
trigger1 = AnimElem = 4
x = 5.8

[State 903, Vel]
type = VelSet
trigger1 = anim = 1520
trigger1 = AnimElem = 14
x = 0

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 14
movetype = I

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=1
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 52,0

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 6,0

[State 52, Landing Sound]
type = PlaySnd
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
value = 820,2

[State 0, EnvShake]
type = EnvShake
triggerall=var(40)!=0
trigger1 = vel x > 0 && animelem = 4 || animelem = 10
time = 8
ampl =  -5
ignorehitpause = 1

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
trigger1 = AnimElem = 1
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1531
p2stateno = 1409
guard.dist = 0
getpower = 0, 0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
triggerall = P2StateNo != [150,155]
triggerall = var(16)
trigger1 = AnimElem = 1
attr = S, ST
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1531
p2stateno = 1409
guard.dist = 0
getpower = 0, 0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 16 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[Statedef 1531]
type = S
movetype = A
physics = N
velset = 0,0
anim = 1501

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1505

[State 3001, Width]
type = Width
trigger1 = 1
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 1
value = 1500, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 0
value = 5, 4
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 41, 0
channel = 3

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 6, 2
channel = 3

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(65*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(78*const(size.xscale)),ceil(-70*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(100*const(size.xscale)),ceil(-65*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(65*const(size.xscale)),ceil(-74*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 6
pos = ceil(99*const(size.xscale)),ceil(-114*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 7
pos = ceil(-20*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 9
pos = ceil(85*const(size.xscale)),ceil(-120*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 10
pos = ceil(108*const(size.xscale)),ceil(-79*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = sprpriority
trigger1 = animelem = 9
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 10
value = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
x = 4
y = -9.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .6

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(6) > 0
x = .98

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1532

;Part 3
[Statedef 1532]
type = S
movetype = A
physics = N
velset = 0,0
anim = 1502

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1506

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(120*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(125*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(125*const(size.xscale)),0
postype = P1
time = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 2
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = -5
y = -9

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = .6

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = .98

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 3001, Add Hits!]
type = HitAdd
trigger1 = time = 1
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = time = 1
value = -204

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = time = 1
value = 35

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(2) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1503

;Vodka Fire
[StateDef 1600]
type = S
movetype = A
physics = S
anim = 1600
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3001, Width]
type = Width
trigger1 = animelemtime(8) >= 0
trigger1 = animelemtime(9) < 0
player = ceil(15*const(size.xscale)),0

[State 3001, Width]
type = Width
trigger1 = animelemtime(9) >= 0
player = ceil(30*const(size.xscale)),0

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1620, ifElse(var(10) = 1, 1610, 1600))

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 191, 0
channel = 0

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1200, 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 9
id = 1605
name = "fire"
pos = ceil(120*const(size.xscale)),ceil(-85*const(size.yscale))
postype = P1
stateno = 1605
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1.5
size.yscale = 1.5
persistent = 0

[State -3,Super]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 9
id = 1605
name = "fire"
pos = ceil(120*const(size.xscale)),ceil(-85*const(size.yscale))
postype = P1
stateno = 1615
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1.5
size.yscale = 1.5
persistent = 0

[State -3,Super]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 9
id = 1605
name = "fire"
pos = ceil(120*const(size.xscale)),ceil(-85*const(size.yscale))
postype = P1
stateno = 1625
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1.5
size.yscale = 1.5
persistent = 0

[State 1000, ChangeState]
type = ChangeState
triggerall = !NumHelper(1605) || !NumHelper(1615) || !NumHelper(1625)
trigger1 = time > 40 && !var(10)
trigger2 = time > 42 && var(10) = 1
trigger3 = time > 44 && var(10) = 2
value = 1601

;End Vodka Fire
[Statedef 1601]
type = S
movetype = I
physics = S
velset = 0,0
anim = 1601
ctrl = 0

[State 220, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;====<EX Vodka Fire>=
[StateDef 1630]
type = S
movetype = A
physics = S
anim = 1620
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 54

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 3001, Width]
type = Width
trigger1 = animelemtime(8) >= 0
trigger1 = animelemtime(9) < 0
player = ceil(15*const(size.xscale)),0

[State 3001, Width]
type = Width
trigger1 = animelemtime(9) >= 0
player = ceil(30*const(size.xscale)),0

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElem = 5
value = 191, 0
channel = 0

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElem = 9
value = 1200, 1

[State -3,Super]
type = Helper
trigger1 = AnimElem = 9
id = 1605
name = "fire"
pos = ceil(120*const(size.xscale)),ceil(-85*const(size.yscale))
postype = P1
stateno = 1635
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1.5
size.yscale = 1.5
persistent = 0

[State 1000, ChangeState]
type = ChangeState
triggerall = !NumHelper(1635) || !NumHelper(1605)
trigger1 = time > 44
value = 1601

;Vodka Fire
[StateDef 1700]
type = S
movetype = A
physics = S
anim = 1700
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 3001, Width]
type = Width
trigger1 = animelemtime(8) >= 0
trigger1 = animelemtime(9) < 0
player = ceil(15*const(size.xscale)),0

[State 3001, Width]
type = Width
trigger1 = animelemtime(9) >= 0
player = ceil(30*const(size.xscale)),0

[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 2, 1720, ifElse(var(10) = 1, 1710, 1700))

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1700, 0
channel = 0

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200, 1
channel = 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 4
id = 1605
name = "fire"
pos = ceil(120*const(size.xscale)),ceil(-85*const(size.yscale))
postype = P1
stateno = 1605
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1.5
size.yscale = 1.5
persistent = 0

[State -3,Super]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 4
id = 1605
name = "fire"
pos = ceil(120*const(size.xscale)),ceil(-85*const(size.yscale))
postype = P1
stateno = 1615
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1.5
size.yscale = 1.5
persistent = 0

[State -3,Super]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 4
id = 1605
name = "fire"
pos = ceil(120*const(size.xscale)),ceil(-85*const(size.yscale))
postype = P1
stateno = 1625
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1.5
size.yscale = 1.5
persistent = 0

[State 1000, ChangeState]
type = ChangeState
triggerall = !NumHelper(1605) || !NumHelper(1615) || !NumHelper(1625)
trigger1 = time > 30 && !var(10)
trigger2 = time > 32 && var(10) = 1
trigger3 = time > 34 && var(10) = 2
value = 1601

;====<EX Vodka Fire>=
[StateDef 1730]
type = S
movetype = A
physics = S
anim = 1720
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 54

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 3001, Width]
type = Width
trigger1 = animelemtime(8) >= 0
trigger1 = animelemtime(9) < 0
player = ceil(15*const(size.xscale)),0

[State 3001, Width]
type = Width
trigger1 = animelemtime(9) >= 0
player = ceil(30*const(size.xscale)),0

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1700, 0
channel = 0

[State 1000, Effect]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1200, 1
channel = 1

[State -3,Super]
type = Helper
trigger1 = AnimElem = 4
id = 1605
name = "fire"
pos = ceil(120*const(size.xscale)),ceil(-85*const(size.yscale))
postype = P1
stateno = 1635
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1.5
size.yscale = 1.5
persistent = 0

[State 1000, ChangeState]
type = ChangeState
triggerall = !NumHelper(1635) || !NumHelper(1605)
trigger1 = time > 34
value = 1601

;Aerial Russian Slam
[StateDef 1800]
type = S
movetype = A
physics = S
anim = 1800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 5
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 5
x = 2.5+(var(10)*2)
y = -9.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = .5

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(5) > 0
;trigger1 = AnimElemTime(6) < 0
x = .97

[State 903, Vel]
type = null;VelMul
trigger1 = AnimElem = 6
x = .75

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 3100, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 40, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 6, 2
channel = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 6
movetype = I

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,52]
triggerall = P2bodydist Y = [-80,-enemynear,const(size.head.pos.y)-66]
trigger1 = AnimElemTime(5) >= 0
trigger1 = AnimElemTime(6) < 0
attr = A, ST
hitflag = A-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1811
p2stateno = 1809
guard.dist = 0
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
fall.recover = 0
air.fall = 1
persistent = 1
numhits = 0

[State 900, 1]
type = HitDef
triggerall = var(18)
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,52]
triggerall = P2bodydist Y = [-80,-enemynear,const(size.head.pos.y)-66]
trigger1 = AnimElemTime(5) >= 0
trigger1 = AnimElemTime(6) < 0
attr = A, ST
hitflag = AF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1811
p2stateno = 1809
guard.dist = 0
getpower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
fall.recover = 0
air.fall = 1
persistent = 1
numhits = 0

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(5) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1805

;End
[Statedef 1805]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2
[Statedef 1809]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 1205, ChangeState]
type = selfstate
trigger1 = Time > 5
value = 5100

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA

;Part 2
[Statedef 1811]
type = A
movetype = A
physics = N
velset = 0,0
anim = 3111

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1815

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 3100, 1
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 40, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 6, 2
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 5, 3
channel = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(80*const(size.xscale)),ceil(-108*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(60*const(size.xscale)),ceil(-115*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(-30*const(size.xscale)),ceil(-135*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(-20*const(size.xscale)),ceil(-60*const(size.yscale))
postype = P1
time = 1

[State 901,1]
type = sprpriority
trigger1 = animelem = 2
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 5
value = 1

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 3001, Add Hits!]
type = HitAdd
trigger1 = animelem = 5
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = AnimElem = 5
value = -110

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = AnimElem = 5
value = -132

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = AnimElem = 5
value = -144

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = animelem = 5
value = 35

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1812

;Part 3
[Statedef 1812]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 1100, turn]
type = turn
trigger1 = Time = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = !Time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 1
value = 52, 0
channel = 20

[State 52, Effect]
type = PlaySnd
trigger1 = Time = 0 && var(40) != 0
value = 820, 3
channel = 20

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Player 2 part 2
[Statedef 1815]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = AnimElemTime(4) < 0
value = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 3115

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 4.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(4) > 0
y = .5

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(4) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 1100, turn]
type = turn
trigger1 = AnimElemTime(4) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(4) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;EX Aerial Russian Slam
[StateDef 1830]
type = S
movetype = A
physics = S
anim = 1800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 124

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 5
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 5
x = 3.5+(var(10)*2)
y = -9.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(5) > 0
y = .5

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(5) > 0
;trigger1 = AnimElemTime(6) < 0
x = .97

[State 903, Vel]
type = null;VelMul
trigger1 = AnimElem = 6
x = .75

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 3100, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 40, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 6, 2
channel = 1

[State 105, 1]
type = statetypeset
trigger1 = AnimElem = 6
movetype = I

[State 40, Dust Helper]
type = Helper
trigger1 = AnimElem = 5
helperType = Normal
stateNo = 8100
ID = 8100
name = "Jump Dust"
posType = P1
ownPal = 1

[State 900, 1]
type = HitDef
triggerall = P2MoveType != H
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,52]
triggerall = P2bodydist Y = [-80,-enemynear,const(size.head.pos.y)-66]
trigger1 = AnimElemTime(5) >= 0
trigger1 = AnimElemTime(6) < 0
attr = A, ST
hitflag = A-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1831
p2stateno = 1809
guard.dist = 0
getpower = 0, 0
fall = 1
fall.recover = 0
air.fall = 1
persistent = 1
numhits = 0

[State 900, 1]
type = HitDef
triggerall = var(18)
triggerall = P2StateNo != [150,155]
triggerall = P2bodydist X = [-1,52]
triggerall = P2bodydist Y = [-80,-enemynear,const(size.head.pos.y)-66]
trigger1 = AnimElemTime(5) >= 0
trigger1 = AnimElemTime(6) < 0
attr = A, ST
hitflag = AF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkno = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1831
p2stateno = 1809
guard.dist = 0
getpower = 0, 0
fall = 1
fall.recover = 0
air.fall = 1
persistent = 1
numhits = 0

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(5) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1805

;Part 2
[Statedef 1831]
type = A
movetype = A
physics = N
velset = 0,0
anim = 3111

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 1815

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 3100, 1
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 1
value = 40, 0
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 5, 3
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
value = 6, 2
channel = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(80*const(size.xscale)),ceil(-108*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(60*const(size.xscale)),ceil(-115*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 4
pos = ceil(-30*const(size.xscale)),ceil(-135*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 5
pos = ceil(-20*const(size.xscale)),ceil(-60*const(size.yscale))
postype = P1
time = 1

[State 901,1]
type = sprpriority
trigger1 = animelem = 2
value = -2

[State 901,1]
type = sprpriority
trigger1 = animelem = 5
value = 1

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .5

[State 3001, Add Hits!]
type = HitAdd
trigger1 = animelem = 5
value = 1

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 5
value = -170

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1812

;Toss Up
[StateDef 1900]
type = S
movetype = A
physics =  N
juggle = 8
anim = Ifelse(p2bodydist x>=50,1900,1901)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 72 * !var(20)
faceP2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1100, VarSet]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifelse(P2bodydist X > 66,0,ifelse(P2bodydist X > 56,1,2))

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
movetype=I

[State 100, 1]
type = VelSet
trigger1 = anim=1900&&animelem = 3
x = 4.5+1*var(10)

[State 100, 1]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,1
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
value = S6,1
channel=1

[State 900, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1901
guard.dist = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, ST
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1901
guard.dist = 0
getPower = ifElse(!var(13), 72, 36) * !var(20), 12 * !var(20)
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[statedef 1901]
type = S
movetype = A
physics =  N
velset = 0,0
sprpriority = 2
anim = 1910
ctrl = 0

[State 0, SprPriority]
type = SprPriority
trigger1 =animelem=7
value = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = S197,0
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=12
value = S196,0
channel=1

[State 0, Width]
type = Width
trigger1 = 1
value = 90,90

[State 0, TargetState]
type = TargetState
trigger1 = !time
value = 1918
[State 0, TargetState]
type = TargetState
trigger1 = animelem=7
value = 1917

[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(1)>=0&&animelemtime(2)<0
pos = 45,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(2)>=0&&animelemtime(3)<0
pos = 30,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(3)>=0&&animelemtime(4)<0
pos = 25,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(4)>=0&&animelemtime(5)<0
pos = 22,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(5)>=0&&animelemtime(6)<0
pos = 25,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(6)>=0&&animelemtime(7)<0
pos = 35,-30
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(7)=0
pos = 35,-80
time=1

[State 0, EnvShake]
type = EnvShake
trigger1 = p2stateno=5100
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 0, HitAdd]
type = HitAdd
trigger1=p2stateno=5100
value =1
persistent=0

[State 0, Dust]
type=helper
trigger1=p2stateno=5100
helpertype=normal
stateno=8110
ID=8110
name="Impact Dust"
postype=p2
pos= 10,5
ownpal=1
persistent=0

[State 901, Hurt]
type = TargetPowerAdd
trigger1 = p2stateno=5100
value = 35

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 0
trigger1 = p2stateno=5100
value = -25

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = p2stateno=5100
value = -36

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 2
trigger1 = p2stateno=5100
value = -49

[State 0, PlaySnd]
type = PlaySnd
trigger1=p2stateno=5100
value = S820,3
persistent=0

[State 0, ChangeState]
type = ChangeState
trigger1 =!animtime
value = 0
ctrl = 1

;Player 2
[Statedef 1917]
type = A
movetype= H
physics = N
juggle = 1
ctrl = 0
velset=-1,-10
poweradd = 50
sprpriority = 1

[State 0, PosAdd]
type = PosAdd
trigger1 =!time
y = -20
[State 1177, VM]
type = VelMul
trigger1 =time=10
y = .75
[State 1177, VM]
type = VelMul
trigger1 =time=20
y = .5
[State 1177, VA]
type = VelAdd
trigger1 =anim=1918
y = 1
[State 0, VelSet]
type = VelSet
trigger1 =time=60
y = 0
ignorehitpause =1

[State 0, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
movecamera=1,0

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 1917  ;<===custom animation
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = vel y>=0
value = 1918
persistent=0

[State 0, LifeAdd]
type = LifeAdd
trigger1 = Pos Y >= 0 && Vel Y > 0
value = -90
absolute = 1

[State 0, SelfState]
type = SelfState
trigger1 = Pos Y >= 0 && Vel Y > 0
value = 5100
ctrl = 0

;Player 2 part 2
[statedef 1918]
type = A
movetype = H
physics = N
velset = 0,0
ctrl = 0
sprpriority = 1
[State 0, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
movecamera = 1,0
ignorehitpause =1
[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 1918
[State 0, SelfState]
type = SelfState
trigger1 =time>=60
value = 5050
ctrl = 0

;====<EX Toss Up>=
[StateDef 1930]
type = S
movetype = A
physics =  N
juggle = 8
anim = Ifelse(p2bodydist x>=50,1900,1901)
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -500
faceP2 = 1

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = VarSet
trigger1 = !Time && var(20)
var(15) = 0
ignoreHitPause = 1

[State 1030, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = var(20) := -1
time = 1

[State 1030, EX Flash]
type = VarSet
trigger1 = !Time
var(25) = 164

[State 1030, EX FX]
type = Explod
trigger1 = !Time
anim = 8210
sprPriority = 3
posType = p1
pos = ceil(6 * const(size.xScale)), ceil(-70 * const(size.yScale))
scale = 0.5, 0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1030, EX Startup Sound]
type = PlaySnd
trigger1 = !Time
value = 0,1000
channel = 0

[State 1100, VarSet]
type = VarSet
trigger1 = !Time && AILevel
var(10) = P2bodydist X > 36

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
movetype=I

[State 100, 1]
type = VelSet
trigger1 = anim=1900&&animelem = 3
x = 4.5+1*var(10)

[State 100, 1]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S5,1
channel=1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=3
value = S6,1
channel=2

[State 900, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, ST
hitflag = M-
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1931
guard.dist = 0
getPower = 0, 0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 900, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, ST
hitflag = MF
priority = 3, Miss
hitSound = -1 + 0 * (var(31) := 800)
sparkNo = -1 + 0 * (var(33) := 0)
p1facing = 1
p2facing = 1
p1stateno = 1931
guard.dist = 0
getPower = 0, 0
fall = 1
air.fall = 1
fall.recover = 0
air.recover = 0
numhits = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 1
value = 1300, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 5 && var(40) != 0
value = 800, 1
channel = 1

[State 900, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Part 2
[statedef 1931]
type = S
movetype = A
physics =  N
velset = 0,0
sprpriority = 2
anim = 1910
ctrl = 0

[State 0, SprPriority]
type = SprPriority
trigger1 =animelem=7
value = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = S197,0
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=12
value = S196,0
channel=1

[State 0, Width]
type = Width
trigger1 = 1
value = 90,90

[State 0, TargetState]
type = TargetState
trigger1 = !time
value = 1918
[State 0, TargetState]
type = TargetState
trigger1 = animelem=7
value = 1917

[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(1)>=0&&animelemtime(2)<0
pos = 45,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(2)>=0&&animelemtime(3)<0
pos = 30,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(3)>=0&&animelemtime(4)<0
pos = 25,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(4)>=0&&animelemtime(5)<0
pos = 22,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(5)>=0&&animelemtime(6)<0
pos = 25,0
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(6)>=0&&animelemtime(7)<0
pos = 35,-30
[State 0, TargetBind]
type = TargetBind
trigger1 = animelemtime(7)=0
pos = 35,-80
time=1

[State 0, HitAdd]
type = HitAdd
trigger1=p2stateno=5100
value =1
persistent=0

[State 0, EnvShake]
type = EnvShake
trigger1 = p2stateno=5100
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 0, Dust]
type=helper
trigger1=p2stateno=5100
helpertype=normal
stateno=8110
ID=8110
name="Impact Dust"
postype=p2
pos= 10,5
ownpal=1
persistent=0

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = var(10) = 1
trigger1 = p2stateno=5100
value = -36

[State 901, Hurt]
type = TargetLifeAdd
trigger1 = p2stateno=5100
value = -59

[State 0, PlaySnd]
type = PlaySnd
trigger1=p2stateno=5100
value = S820,3
persistent=0

[State 0, ChangeState]
type = ChangeState
trigger1 =!animtime
value = 0
ctrl = 1

;====<PUNCH ZERO COUNTER>=
[StateDef 2900]
type = S
physics = N
moveType = A
anim = 2900
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2900, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(4) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1200, 0
channel = 0

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, 0
channel = 0

[State 1100, Effect]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1200, 1
channel = 1

[State 2900, Super]
type = Helper
trigger1 = AnimElem = 2
id = 7100
name = "flat_1"
pos = 0,0
postype = P1
stateno = 7100
helpertype = normal
keyctrl = 0
ownpal = 1
ignorehitpause = 1
supermovetime = 99999999999999

[State 2900, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 4
attr = S, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 0
getpower = 0,0
givePower = 36, 36
pauseTime = 12, 12
guard.pauseTime = 12, 12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 135), var(36) := -70
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2900, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 2900, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====<KICK ZERO COUNTER>=
[StateDef 2910]
type = S
physics = N
moveType = A
anim = 2910
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0

[State 2910, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(3) < 0
value = SCA
time = 1
ignoreHitPause = 1

[State 450, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 4, 4
channel = 0

[State 450, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1,5
channel = 1

[State 450, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, 4
channel = 0

[State 450, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 6,5
channel = 1

[State 2910, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = Time = 0
attr = C, SA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 0
getpower = 0,0
givepower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = Low
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.54, -5.25
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -5.54, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8013)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 2910, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(6) >= 0
moveType = I

[State 2910, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
