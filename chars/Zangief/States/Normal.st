; _________________________________________
;| Zangief by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<NORMAL MOVES==
;==

;STANDING LIGHT PUNCH
[StateDef 200]
type = S
movetype = A
physics = S
juggle = 8
anim = 200
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 200, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 200, Woosh]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 1,0
channel = 1

[State 200, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 0
value = 5, ifElse(Random < 500, 2, 3)
channel = 0

[State 200, Woosh]
type = PlaySnd
trigger1 = !Time && var(40) != 0
value = 6,1
channel = 1

[State 200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 2
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
guard.pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -3, -6), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.5, -5)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -4,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 111), var(36):= -128
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 200, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
guard.pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -3, -6), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.5, -5)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -4,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 111), var(36):= -93
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 200, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;STANDING FAR MEDIUM PUNCH
[StateDef 210]
type = S
movetype = A
physics = S
juggle = 8
anim = 210
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 210, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 210, Woosh]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 1,1
channel = 1

[State 210, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 210, Woosh]
type = PlaySnd
trigger1 = !Time && var(40) != 0
value = 6,2
channel = 1

[State 210, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
guard.pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -4, -8), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.4, -6.8)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -5.33,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -79
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 210, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 210, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;STANDING FAR HEAVY PUNCH
[StateDef 220]
type = S
movetype = A
physics = S
juggle = 8
anim = 220
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 220, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) != 1
value = 1,2
channel = 1

[State 220, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 220, Woosh]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) != 0
value = 6,5
channel = 1

[State 220, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 220, Position]
type = PosAdd
trigger1 = AnimElem = 2
x = 8

[State 220, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElemTime(4) = 2
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animtype = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(PrevStateNo = 700, -6.46, ifElse(var(20), -5, -10)), ifElse(PrevStateNo = 700, -5.25, 0)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.25, -8.5)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = ifElse(PrevStateNo = 700, 1, 0)
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 169), var(36) := -83
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 220, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
movetype = I

[State 220, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;STANDING LIGHT KICK
[StateDef 230]
type = S
movetype = A
physics = S
juggle = 8
anim = 230
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 230, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,3
channel = 1

[State 230, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 2, 3)
channel = 0

[State 230, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,1
channel = 1

[State 230, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getPower = 72 * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
guard.pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -3, -6), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.5, -5)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -4,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 119), var(36) := -41
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 230, StateTypeSet: Idle]
type = StateTypeSet
trigger1= AnimElemTime(4) >= 0
moveType = I

[State 230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;STANDING FAR MEDIUM KICK
[StateDef 240]
type = S
movetype = A
physics = S
juggle = 8
anim = 240
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 240, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 240, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,4
channel = 1

[State 240, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 240, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,2
channel = 1

[State 240, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
guard.pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -4, -8), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.4, -6.8)
guard.cornerPush.velOff = 0
air.velocity = -6.4,-4.8
airguard.velocity = -5.33,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -71
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 240, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 240, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;STANDING FAR HEAVY KICK
[StateDef 250]
type = S
movetype = A
physics = S
juggle = 8
anim = 250
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 250, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,5
channel = 1

[State 250, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 250, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,5
channel = 1

[State 250, VelSet]
type = VelSet
trigger1 = !Time
x = 7

[State 250, Dust Helper]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8100
ID = 8100
name = "Standing Far Heavy Kick Dust"
posType = P1
ownPal = 1

[State 250, VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 0

[State 250, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 7 && var(40) != 1
value = 52,0
channel = 3

[State 250, Landing Sound]
type = PlaySnd
trigger1 = AnimElem = 7 && var(40) != 0
value = 820,2
channel = 3

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 7
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 250, Landing Dust Expod]
type = Explod
trigger1 = AnimElem = 7
anim = 8102
sprPriority = -3
posType = P1
pos = ceil(10 * const(size.xScale)),0
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 250, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElemTime(4) = 2
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = M
priority = 4,Hit
damage = ceil(ifElse(fvar(11) * 105 < 7, 7, fvar(11) * 105)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animtype = Heavy
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -5, -10),0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.25, -8.5)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 113), var(36) := -98
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 250, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 250, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;STANDING FAR HEAVY PUNCH
[StateDef 300]
type = S
movetype = A
physics = S
juggle = 8
anim = 300
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Position]
type = PosSet
trigger1 = AnimElem = 1
y = 0

[State 901,1]
type = posadd
trigger1 = AnimElem = 5
trigger2 = AnimElem = 6
x = 16

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 6
value = 6, 5
channel = 1

[State 210, Voice]
type = PlaySnd
trigger1 = AnimElem = 6
value = 5, 1+(random%2)
channel = 0

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 7
value = 820, 3
channel = 2

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 7
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 7
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(56*const(size.xscale)), 5
postype = p1
facing = 1
ownPal = 1
[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 7
value = 5100, 1

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 7
time = 20

[State 220, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 7
forceNoFall = !var(20)
attr = S, NA
hitFlag = MAF
guardFlag = H
priority = 5, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animtype = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 17 + 4 * var(9)
ground.slideTime = 17 + 4 * var(9)
guard.hitTime = 17
air.hitTime = 120
ground.velocity = ifElse(var(20), -1.25, -2.5), 10
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.5, -9.5)
guard.cornerPush.velOff = 0
air.velocity = -2.5, 10
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
yAccel = 0.5
persistent = 0
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 119), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 220, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
movetype = I

[State 220, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;CROUCHING LIGHT PUNCH
[StateDef 400]
type = C
movetype = A
physics = C
juggle = 8
anim = 400
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 400, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 400, Woosh Sound]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 1,0
channel = 1

[State 400, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 0
value = 5, ifElse(Random < 500, 2, 3)
channel = 0

[State 400, Woosh Sound]
type = PlaySnd
trigger1 = !Time && var(40) != 0
value = 6,1
channel = 1

[State 400, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 21 < 7, 7, fvar(11) * 21)), 0
getPower = 72 * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
guard.pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -3, -6), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.5, -5)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
airguard.velocity = -4,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 111), var(36) := -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 400, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;CROUCHING MEDIUM PUNCH
[StateDef 410]
type = C
movetype = A
physics = C
juggle = 8
anim = 410
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 410, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 410, Woosh Sound]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 1,1
channel = 1

[State 410, Voice]
type = PlaySnd
trigger1 = !Time && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 410, Woosh Sound]
type = PlaySnd
trigger1 = !Time && var(40) != 0
value = 6,2
channel = 1

[State 410, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
guard.pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -4, -8), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.4, -6.8)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -5.33,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0*(var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 119), var(36) := -100
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 410, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;CROUCHING HEAVY PUNCH
[StateDef 420]
type = C
movetype = A
physics = C
juggle = 8
anim = 420
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 420, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 420, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1,2
channel = 1

[State 420, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 420, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 6,5
channel = 1

[State 420, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElemTime(4) = 2
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animtype = Heavy
air.animtype = up
fall.animtype = up
ground.type = Low
air.type = High
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = ifElse(var(20), -5, -10), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.25, -8.5)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 166), var(36) := -65
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
forceStand = 1

[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 420, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;CROUCHING LIGHT KICK
[StateDef 430]
type = C
movetype = A
physics = C
juggle = 8
anim = 430
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 430, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1,3
channel = 1

[State 430, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, ifElse(Random < 500, 2, 3)
channel = 0

[State 430, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 6,1
channel = 1

[State 430, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 28 < 7, 7, fvar(11) * 28)), 0
getPower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
guard.pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
ground.velocity = ifElse(var(20), -3, -6), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.5, -5)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -4,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinadd= -255, -255, -255, 48

[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 430, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;CROUCHING MEDIUM KICK
[StateDef 440]
type = C
movetype = A
physics = C
juggle = 8
anim = 440
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 440, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 440, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1,4
channel = 1

[State 440, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 440, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 6,2
channel = 1

[State 440, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
forceNoFall = !var(20)
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 0
getPower = ifElse(!var(13),144,72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
guard.pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 15 + 3 * var(9)
ground.slideTime = 15 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
ground.velocity = ifElse(var(20), -4, -8), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.4, -6.8)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
airguard.velocity = -5.33,-1
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -38
palFX.time = 12*var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(7) >= 0
movetype = I

[State 440, End]
type = Changestate
trigger1 = !AnimTime
value = 11
ctrl = 1

;CROUCHING HEAVY KICK
[StateDef 450]
type = C
movetype = A
physics = C
juggle = 8
anim = 450
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

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

[State 450, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
attr = C, NA
hitFlag = MAF
guardFlag = L
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 0
getpower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givepower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animtype = Heavy
air.animtype = back
fall.animtype = back
ground.type = Trip
air.type = High
ground.hitTime = 18 + 4 * var(9)
ground.slideTime = 18 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -.7,-6.25
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.25, -8.5)
guard.cornerPush.velOff = 0
air.velocity = -.7,-6.25
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 116), var(36) := -10
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(6) >= 0
moveType = I

[State 450, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;JUMPING LIGHT PUNCH
[StateDef 600]
type = A
movetype = A
physics = N
juggle = 8
anim = 600
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value= 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 600, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1,0
channel = 1

[State 600, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value= 5, ifElse(Random < 500, 2, 3)
channel = 0

[State 600, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 6,1
channel = 1

[State 600, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 49 < 7, 7, fvar(11) * 49)), 0
getPower = 72 * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20),4, 9), ifElse(var(20), 5, 9)
guard.pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -1.5, -3), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -5.33)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
airguard.velocity = -4,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 0)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -91
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 600, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 600, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;NEUTRAL JUMPING MEDIUM PUNCH
[StateDef 610]
type = A
movetype = A
physics = N
juggle = 8
anim = 610
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1,1
channel = 1

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 6,2
channel = 1

[State 610, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
guard.pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2, -4), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -5.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -5.33,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -68
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 610, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;NEUTRAL JUMPING MEDIUM PUNCH
[StateDef 615]
type = A
movetype = A
physics = N
juggle = 8
anim = 615
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,1
channel = 1

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,2
channel = 1

[State 610, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 84 < 7, 7, fvar(11) * 84)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
guard.pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2, -4), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -5.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -5.33,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -76
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 610, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;NEUTRAL JUMPING HEAVY PUNCH
[StateDef 620]
type = A
movetype = A
physics = N
juggle = 8
anim = 620
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 620, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 620, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) != 1
value = 1,2
channel = 1

[State 620, Voice]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 620, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4 && var(40) != 0
value = 6,5
channel = 1

[State 620, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animtype = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 4 * var(9)
ground.slideTime = 12 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.5, -5), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.66, -9.33)
guard.cornerPush.velOff = 0
air.velocity = -6.4, -4.8
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -52
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;ANGLED JUMPING HEAVY PUNCH
[StateDef 621]
type = A
movetype = A
physics = N
juggle = 8
anim = 621
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 621, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 4, 4
channel = 0

[State 621, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1,2
channel = 1

[State 621, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, 4
channel = 0

[State 621, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 6,5
channel = 1

[State 621, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = Time = 0
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animtype = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 4 * var(9)
ground.slideTime = 12 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.5, -5), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.66, -9.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 113), var(36) := -39
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 621, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 621, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 621, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;NEUTRAL JUMPING MEDIUM PUNCH
[StateDef 625]
type = A
movetype = A
physics = N
juggle = 8
anim = 625
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,1
channel = 1

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,2
channel = 1

[State 610, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 105 < 7, 7, fvar(11) * 105)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
guard.pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.5, -5), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -6.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -76
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 610, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;NEUTRAL JUMPING MEDIUM PUNCH
[StateDef 670]
type = A
movetype = A
physics = N
juggle = 8
anim = 670
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1,1
channel = 1

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 610, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 6,2
channel = 1

[State 610, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 5, Hit
damage = ceil(ifElse(fvar(11) * 91 < 7, 7, fvar(11) * 91)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animType = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = High
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.5, -5), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.66, -9.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 1)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 110), var(36) := -72
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 610, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;NEUTRAL JUMPING LIGHT KICK
[StateDef 630]
type = A
movetype = A
physics = N
juggle = 8
anim = 630
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 630, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 2, 3)
channel = 0

[State 630, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,3
channel = 1

[State 630, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 2, 3)
channel = 0

[State 630, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,1
channel = 1

[State 630, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getPower = 72 * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
guard.pauseTime = ifElse(var(20), 4, 9), ifElse(var(20), 5, 9)
animType = Light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 2 * var(9)
ground.slideTime = 12 + 2 * var(9)
guard.hitTime = 12
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -1.5, -3), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -5.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -4,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 3)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 117), var(36) := -74
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 630, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 630, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;NEUTRAL JUMPING MEDIUM KICK
[StateDef 635]
type = A
movetype = A
physics = N
juggle = 8
anim = 645
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 640, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,4
channel = 1

[State 640, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 640, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,2
channel = 1

[State 640, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 42 < 7, 7, fvar(11) * 42)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 9), ifElse(var(20), 4, 9)
guard.pauseTime = ifElse(var(20), 3, 9), ifElse(var(20), 4, 9)
animType = light
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -1.5, -3), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -5.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -4,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 118), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;NEUTRAL JUMPING MEDIUM KICK
[StateDef 640]
type = A
movetype = A
physics = N
juggle = 8
anim = 640
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 640, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,4
channel = 1

[State 640, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 640, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,2
channel = 1

[State 640, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 70 < 7, 7, fvar(11) * 70)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
guard.pauseTime = ifElse(var(20), 5, 11), ifElse(var(20), 6, 11)
animType = Medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2, -4), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -5.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -5.33,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 118), var(36) := -74
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;NEUTRAL JUMPING MEDIUM KICK
[StateDef 645]
type = A
movetype = A
physics = N
juggle = 8
anim = 645
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 640, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,4
channel = 1

[State 640, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 640, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,2
channel = 1

[State 640, Hit]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 75 < 7, 7, fvar(11) * 75)), 0
getPower = ifElse(!var(13), 144, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 3, 9), ifElse(var(20), 4, 9)
guard.pauseTime = ifElse(var(20), 3, 9), ifElse(var(20), 4, 9)
animType = medium
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 3 * var(9)
ground.slideTime = 12 + 3 * var(9)
guard.hitTime = 15
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -1.5, -3), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.66, -5.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -4,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 4)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 118), var(36) := -56
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;JUMPING HEAVY KICK
[StateDef 650]
type = A
movetype = A
physics = N
juggle = 8
anim = 650
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 650, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4, ifElse(Random < 500, 3, 4)
channel = 0

[State 650, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 1,5
channel = 1

[State 650, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5, ifElse(Random < 500, 3, 4)
channel = 0

[State 650, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 6,5
channel = 1

[State 650, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 3
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animtype = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 4 * var(9)
ground.slideTime = 12 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -2.5, -5), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.66, -9.33)
guard.cornerPush.velOff = 0
air.velocity = -4, -5.25
airguard.velocity = -9.33,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -64
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 52

;JUMPING HEAVY KICK
[StateDef 660]
type = A
movetype = A
physics = N
juggle = 8
anim = 660
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = 6, 5
channel = 1

[State 210, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 5, 4
channel = 0

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 3
x = 3
y = 3

[State 1100, Gravity]
type = Veladd
trigger1 = AnimElemTime(3) > 0
y = .47

[State 1100, Velocity]
type = VelMul
trigger1 = AnimElemTime(3) > 0
x = .95
persistent = 1

[State 650, HitDef]
type = HitDef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = AnimElem = 4
forceNoFall = !var(20)
attr = A, NA
hitFlag = MAF
guardFlag = HA
priority = 5, Hit
damage = ceil(ifElse(fvar(11) * 77 < 7, 7, fvar(11) * 77)), 0
getPower = ifElse(!var(13), 216, 72) * !var(20), 36 * !var(20)
givePower = 36, 36
pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
guard.pauseTime = ifElse(var(20), 6, 13), ifElse(var(20), 7, 13)
animtype = Heavy
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 12 + 4 * var(9)
ground.slideTime = 12 + 4 * var(9)
guard.hitTime = 18
air.hitTime = 120
airguard.ctrlTime = 16
ground.velocity = ifElse(var(20), -1.25, -2.5), 10
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.66, -9.33)
guard.cornerPush.velOff = 0
air.velocity = -2.5, 10
airguard.velocity = -6.67,-1
air.cornerPush.velOff = 0
airguard.cornerPush.velOff = 0
yAccel = 0.5
persistent = 0
fall = 1
air.fall = 1
fall.recover = 0
fall.recoverTime = 120
hitSound = -1 + 0 * (var(31) := 5)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8012)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 115), var(36) := -5
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 665

;Recover
[Statedef 665]
type = S
physics = S
ctrl = 0
anim = 665
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 871, Impact Dust]
type = Helper
trigger1 = Time = 0
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(56*const(size.xscale)), 0
postype = p1
facing = 1
ownPal = 1

[State 901, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 820, 3

[State 0, EnvShake]
type = EnvShake
trigger1 = !time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;THROW ATTEMPT
[StateDef 800]
type = S
physics = S
movetype = A
anim = 800
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 800, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = (command = "kk")

[State 800, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = (Random < 500)

[State 800, Tech Hit Reset]
type = VarSet
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = VarSet
trigger1 = NumEnemy
trigger1 = EnemyNear, StateType != A
trigger1 = (EnemyNear, StateNo = [0,999]) && (EnemyNear, StateNo != [100,119]) && (EnemyNear, StateNo != [200,799])
var(19) = 7

[State 800, AttackDist]
type = AttackDist
trigger1 = 1
value = 0

[State 800, HitDef: PP Throw]
type = HitDef
trigger1 = AnimElem = 2
trigger1 = !var(38)
attr = S, NT
hitFlag = M-
priority = 1, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 +0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1
fall.recover = 1
numHits = 0
p1StateNo = ifElse(command = "holdback", 830, 810)

[State 800, HitDef: KK Throw]
type = HitDef
trigger1 = AnimElem = 2 && var(10)
trigger1 = !var(38)
attr = S, NT
hitFlag = M-
priority = 1, Miss
getPower = 0,0
givePower = 0,0
sparkNo = -1 + 0 * (var(33) := 0)
guard.sparkNo = -1 +0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -50
hitSound = -1 +0 * (var(31) := 800)
guardSound = -1 +0 * (var(32) := 0)
fall = 1
fall.recover = 1
numhits = 0
p1StateNo = ifElse(command = "holdback", 805, 820)

[State 800, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 800,0
channel = 0

[State 800, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 1
value = 1,0
channel = 1

[State 800, Voice (Missed)]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 800,1
channel = 0

[State 800, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 2 && var(40) != 0
value = 6,1
channel = 1

[State 800, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;THROW SWITCHING SIDES
[StateDef 805]
type = S
moveType = A
physics = S
anim = 805
ctrl = 0
sprPriority = 0

[State 805, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 806

[State 805, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 805, Width]
type = Width
trigger1 = 1
edge = 24,24
ignoreHitPause = 1

[State 805, Turn]
type = Turn
trigger1 = AnimElem = 3

[State 805, Facing]
type = TargetFacing
trigger1 = 1
value = -1

[State 805, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 805, Tech Hit Countdown]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 805, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
pos = ceil(35 * const(size.xScale)), 0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
pos = ceil(11 * const(size.xScale)), 0

[State 805, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
value = 1

[State 805, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4)< 0
value = -1

[State 805, End]
type = ChangeState
trigger1 = !NumTarget
value = 0
ctrl = 1

[State 805, End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
value = ifElse(var(10), 840, 810)

;THROW SWITCHING SIDES (TARGET)
[StateDef 806]
type = A
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 806, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 806, ChangeAnim2]
type = ChangeAnim2
trigger1 = !Time
value = 806

[State 806, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1
ignoreHitPause = 1

[State 806, SelfState]
type = SelfState
trigger1 = Time >= 60
value = ifElse(pos y < 0, 5040, 0)
ctrl = 1

;JUDO THROW
[Statedef 810]
type = S
physics = N
moveType = A
anim = 810
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 810, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 810, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 810, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 810,TargetBind]
type = TargetBind
trigger1 = Time < 7
pos = 40, 0

[State 1201, 2]
type = Playerpush
trigger1 = 1
value = 0

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
value = 40, 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 6 && var(40) != 0
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
pos = ceil(77*const(size.xscale)),ceil(-88*const(size.yscale))
postype = P1
time = -1

[State 1100, StateType]
type = StateTypeSet
trigger1 = AnimElem = 6
StateType = A
physics = N

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 6
x = 4
y = -4

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(6) > 0
y = .49

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(6) > 0
x = .95

[State 810, Throw]
type = TargetState
trigger1 = !Time && NumTarget
value = 815

[State 810, Turn]
type = Turn
trigger1 = !AnimTime

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(6) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 811

;Part 2
[Statedef 811]
type = S
movetype = A
physics = N
velset = 0,0
anim = 811

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 816

[State 3001, Width]
type = Width
trigger1 = Time = 0
edge = 75,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 820, 2
Channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 820, 3
Channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1
value = 4, 1
channel = 1

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 1
channel = 1

[State 871, Impact Dust]
type = Helper
trigger1 = AnimElem = 1
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(80*const(size.xscale)), 5
postype = p1
facing = -1
ownPal = 1

[State 0, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = Ifelse(var(40)!=0,22,12)
ampl = Ifelse(var(40)!=0,-6,-1)
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
x = -3.5
y = -3.5

[State 903, Vel]
type = VelAdd
trigger1 = AnimElemTime(4) > 0
y = .49

[State 903, Vel]
type = VelMul
trigger1 = AnimElemTime(4) > 0
x = .95

[State 903, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 20

[State 810, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = time = 1
value = 36

[State 810, Power]
type = PowerAdd
trigger1 = time = 1 && !var(20)
value = 72

[State 810, HitAdd]
type = HitAdd
trigger1 = time = 1
value = 1

[State 810, HitCount]
type = VarAdd
trigger1 = time = 1
var(13) = 1

[State 810, Juggle]
type = VarAdd
trigger1 = time = 1
var(15) = 1
ignoreHitPause = 1

[State 810, Juggle]
type = VarSet
trigger1 = time = 1
var(16) = 1
ignoreHitPause = 1

[State 810, Damage]
type = TargetLifeAdd
trigger1 = time = 1
value = floor(ifElse(147 * fvar(11) < 7, -7, -147 * fvar(11)))

[State 901, State End]
type = ChangeState
trigger1 = AnimElemTime(4) >= 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 812

;Part 3
[Statedef 812]
type = S
physics = S
ctrl = 0
anim = 812
velset = 0,0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, Landing Sound]
type = PlaySnd
trigger1 = !Time && var(40) != 1
value = 52,0

[State 52, Landing Sound]
type = PlaySnd
trigger1 = !Time && var(40) != 0
value = 820,3

[State 0, EnvShake]
type = EnvShake
trigger1 = !time
time = Ifelse(var(40)!=0,22,0)
ampl = Ifelse(var(40)!=0,-6,0)
ignorehitpause = 1

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

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;JUDO THROW (TARGET)
;Being Thrown
[StateDef 815]
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
value = 815

[State 815, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

;After Throw
[StateDef 816]
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
y = -4.5

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

;DRAGON SUPLEX
[StateDef 820]
type = S
movetype = A
physics = S
anim = 830
ctrl = 0
velset = 0,0
sprpriority = 1

[State 820, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 820, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 820, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 901, Throw]
type = TargetState
trigger1 = !time && numtarget
value = 825

[State 901, Throw]
type = TargetState
trigger1 = AnimElem = 6
value = 826

[State 901, Throw]
type = TargetState
trigger1 = AnimElem = 5
value = 827

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3001, Width]
type = Width
trigger1 = time = 0
edge = 45,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 5
value = 820, 1
channel = 1

[State 821, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 5
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(58 * const(size.xScale)), ceil(-89 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(65*const(size.xscale)),0
time = -1

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 2
pos = ceil(45*const(size.xscale)),0
time = -1

[State 820, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 5
value = 36

[State 820, Power]
type = PowerAdd
trigger1 = AnimElem = 5 && !var(20)
value = 72

[State 820, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 5
value = 1

[State 820, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(13) = 1

[State 820, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(15) = 1
ignoreHitPause = 1

[State 820, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 5
var(16) = 1
ignoreHitPause = 1

[State 820, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 5
value = floor(ifElse(70 * fvar(11) < 7, -7, -70 * fvar(11)))
kill = 0

[State 901, State End]
type = ChangeState
trigger1 = !AnimTime
value = 821

;Conect second part
[Statedef 821]
type = S
physics = N
moveType = A
anim = 831
ctrl = 0
velset = 0,0
sprpriority = 1

[State 821, Throw]
type = TargetState
trigger1= !Time && NumTarget
value = 826

[State 821, TargetFacing]
type = TargetFacing
trigger1 = Time <= 1
value = -1

[State 821, Width]
type = Width
trigger1 = 1
edge = 40, 0

[State 821, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1 || AnimElem = 4
value = 1

[State 821, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
value = -1

[State 821, Timer Start]
type = VarSet
trigger1 = !Time
var(44) = 85

[State 821, Timer End (Round Over)]
type = VarSet
trigger1 = RoundState != 2
var(44) = 0

[State 821, Timer Countdown]
type = VarAdd
trigger1 = HitCount
var(44) = -1

[State 821, Timer]
type = VarAdd
triggerAll = NumTarget && HitCount
trigger1 = Target, command = "x" || Target, command = "y" || Target, command = "z"
trigger2 = Target, command = "a" || Target, command = "b" || Target, command = "c"
trigger3 = Target, command = "up" || Target, command= "down" || Target, command = "back" || Target, command = "fwd"
var(44) = -1

[State 821, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 821, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 821, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = (command = "up" || command = "down" || command = "back" || command = "fwd")
var(42) = 2

[State 821, Mashing Increment]
type = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 821, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 821, Anim Skip];some change ups may be needed for this
type = ChangeAnim
triggerall = var(44) > 0
trigger1 = AnimElemTime(AnimElemNo(0)) >= 0 && AnimElemTime(3) < 0
trigger1 = AnimElemTime(AnimElemNo(0) +1 ) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + AnimElemTime(AnimElemNo(0) + 1))
value = 831
elem = AnimElemNo(0) + 1

[State 821, Anim Skip];some change ups may be needed for this too
type = ChangeAnim
triggerAll = var(44) > 0
trigger1 = AnimElemTime(3)>0
trigger1 = AnimElemTime(3)>=(8 - var(12))
trigger1 = 1 || var(12) := (var(12) + 8 - AnimElemTime(3))
value = 831
elem = 1

[State 821, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

[State 821, Throw]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
value = 826

[State 821, Throw]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
value = 827

[State 821, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(14 * fvar(11) < 7, -7, -14 * fvar(11)))
kill = 1

[State 821, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3
value = 30

[State 821, PowerAdd]
type = PowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3 && !var(20)
value = 70

[State 821, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 821, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 821, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(15) = 1
ignoreHitPause = 1

[State 821, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 3
var(16) = 1
ignoreHitPause = 1

[State 821, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4,1
channel = 0

[State 821, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 1,5
channel = 1

[State 821, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5,1
channel = 0

[State 821, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 6,1
channel = 1

[State 821, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 3
value = 820,1
channel = 2

[State 821, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(58 * const(size.xScale)), ceil(-89 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 821, End]
type = ChangeState
trigger1 = var(44) <= 0
trigger1 = !Animtime
trigger2 = NumTarget
trigger2 = !(Target, Alive)
trigger3 = Time >= 180
value = 822

;Final part
[Statedef 822]
type = S
movetype = A
physics = N
velset = 0,0
anim = 832

[State 901, Throw]
type = TargetState
trigger1 = AnimElemTime(3) = 1
value = 828

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElemTime(3) = 1
value = 820, 1

[State 821, Hit Spark]
type = Helper
trigger1 = animelemtime(3) = 1
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = ceil(58 * const(size.xScale)), ceil(-89 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 820, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = animelemtime(3) = 1
value = 36

[State 820, Power]
type = PowerAdd
trigger1 = animelemtime(3) = 1 && !var(20)
value = 72

[State 820, HitAdd]
type = HitAdd
trigger1 = animelemtime(3) = 1
value = 1

[State 820, HitCount]
type = VarAdd
trigger1 = animelemtime(3) = 1
var(13) = 1

[State 820, Juggle]
type = VarAdd
trigger1 = animelemtime(3) = 1
var(15) = 1
ignoreHitPause = 1

[State 820, Juggle]
type = VarSet
trigger1 = animelemtime(3) = 1
var(16) = 1
ignoreHitPause = 1

[State 820, Damage]
type = TargetLifeAdd
trigger1 = animelemtime(3) = 1
value = floor(ifElse(14 * fvar(11) < 7, -7, -14 * fvar(11)))
kill = 0

[State 901,1]
type = TargetBind
trigger1 = AnimElemTime(3) = 1
pos = ceil(45*const(size.xscale)),0
time = 1

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;DRAGON SUPLEX (TARGET)
;Being Hit
[Statedef 825]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 815, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 902, 1]
type = ChangeAnim2
trigger1= !time
value = 835

;Second part
[Statedef 826]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 816, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = !time
value = 836

;Third part
[Statedef 827]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 816, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = !time
value = 837

;Fourth part
[Statedef 828]
type = A
movetype = H
physics = N
velset = 4,6.5
sprpriority = -1

[State 902, 1]
type = ChangeAnim2
trigger1 = !time
value = 838

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 1
x = -4
y = -6.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(1) > 0
y = .49

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(1) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(1) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Final part
[Statedef 829]
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

;DRAGON SUPLEX
[StateDef 830]
type = S
movetype = A
physics = N
anim = 820
ctrl = 0
velset = 0,0
sprpriority = 1

[State 820, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 820, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 820, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 1201, 2]
type = Playerpush
trigger1 = 1
value = 0

[State 3001, Width]
type = Width
trigger1 = animelemtime(9) < 0
edge = -60,60

[State 3001, Width]
type = Width
trigger1 = AnimElem = 9
edge = -105,105

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 1
value = 1400, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 1 && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = animelem = 6 && var(40) != 0
value = 197, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 9
value = 820, 2

[State 820, Impact Dust]
type = Helper
trigger1 = AnimElem = 9
helperType = Normal
stateNo = 8110
ID = 8110
name = "Impact Dust"
pos = ceil(-120*const(size.xscale)),5
postype = p1
facing = 1
ownPal = 1

[State 901,1]
type = targetBind
trigger1 = animelem = 1
pos = ceil(-66*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 2
pos = ceil(-45*const(size.xscale)),0
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = animelem = 3
pos = ceil(-19*const(size.xscale)),ceil(-76*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 4
pos = ceil(43*const(size.xscale)),ceil(-62*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 7
pos = ceil(35*const(size.xscale)),ceil(-109*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 8
pos = ceil(-96*const(size.xscale)),ceil(-87*const(size.yscale))
postype = P1
time = -1

[State 901,1]
type = targetBind
trigger1 = AnimElem = 9
pos = ceil(-135*const(size.xscale)),0
postype = P1
time = 1

[State 820, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 835

[State 820, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 9
value = 36

[State 820, Power]
type = PowerAdd
trigger1 = NumTarget && AnimElem = 9 && !var(20)
value = 72

[State 820, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 9
value = 1

[State 820, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 9
var(13) = 1

[State 820, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 9
var(15) = 1
ignoreHitPause = 1

[State 820, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 9
var(16) = 1
ignoreHitPause = 1

[State 820, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 9
value = floor(ifElse(147 * fvar(11) < 7, -7, -147 * fvar(11)))

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElem = 9
time = 20

[State 901, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;DRAGON SUPLEX (TARGET)
;Being Hit
[StateDef 835]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 825, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = !Time
value = 825

[State 1201, screenbound]
type = screenbound
trigger1 = AnimElemTime(9) < 0
value = 1

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 9
x = 4
y = -6.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(9) > 0
y = .49

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(9) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 1300,Turn]
type = Turn
trigger1 = AnimElemTime(9) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(9) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;Player 2
[Statedef 808]
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

;DRAGON SUPLEX
[StateDef 840]
type = S
movetype = A
physics = S
anim = 840
ctrl = 0
velset = 0,0
sprpriority = 1

[State 820, Lost Target]
type = ChangeState
trigger1 = !Time && !NumTarget
value = 0
ctrl = 1

[State 820, Tech Hit]
type = ChangeState
trigger1 = NumTarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback")
trigger1 = (Target, command = "b" || Target, command = "c" || Target, command = "y" || Target, command = "z")
value = 890

[State 820, Throw Escape]
type = VarAdd
trigger1 = var(19) > 0
var(19) = -1

[State 901, Throw]
type = TargetState
trigger1 = !time && numtarget
value = 845

[State 901, Throw]
type = TargetState
trigger1 = AnimElem = 5
value = 846

[State 901, Throw]
type = TargetState
trigger1 = AnimElem = 4
value = 847

[State 3001, Width]
type = Width
trigger1 = 1
edge = 60,0

[State 3001, Width]
type = Width
trigger1 = time = 0
edge = 45,0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 4, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElem = 1  && var(40) != 0
value = 5, 0
channel = 0

[State 901, Effect]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 5
value = 2, 800
channel = 1

[State 821, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 5
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(98 * const(size.xScale)), ceil(-66 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 1
pos = ceil(85*const(size.xscale)),0
time = -1

[State 901,1]
type = TargetBind
trigger1 = AnimElem = 2
pos = ceil(75*const(size.xscale)),0
time = -1

[State 820, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = NumTarget && AnimElem = 5
value = 36

[State 820, Power]
type = PowerAdd
trigger1 = AnimElem = 5 && !var(20)
value = 72

[State 820, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 5
value = 1

[State 820, HitCount]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(13) = 1

[State 820, Juggle]
type = VarAdd
trigger1 = NumTarget && AnimElem = 5
var(15) = 1
ignoreHitPause = 1

[State 820, Juggle]
type = VarSet
trigger1 = NumTarget && AnimElem = 5
var(16) = 1
ignoreHitPause = 1

[State 820, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 5
value = floor(ifElse(70 * fvar(11) < 7, -7, -70 * fvar(11)))
kill = 0

[State 901, State End]
type = ChangeState
trigger1 = !AnimTime
value = 841

;Conect second part
[Statedef 841]
type = S
physics = N
moveType = A
anim = 841
ctrl = 0
velset = 0,0
sprpriority = 1

[State 821, Throw]
type = TargetState
trigger1= !Time && NumTarget
value = 846

[State 821, TargetFacing]
type = TargetFacing
trigger1 = Time <= 1
value = -1

[State 821, Width]
type = Width
trigger1 = 1
edge = 40, 0

[State 821, SprPriority]
type = SprPriority
trigger1 = AnimElem = 1 || AnimElem = 4
value = 1

[State 821, SprPriority]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
value = -1

[State 821, Timer Start]
type = VarSet
trigger1 = !Time
var(44) = 85

[State 821, Timer End (Round Over)]
type = VarSet
trigger1 = RoundState != 2
var(44) = 0

[State 821, Timer Countdown]
type = VarAdd
trigger1 = HitCount
var(44) = -1

[State 821, Timer]
type = VarAdd
triggerAll = NumTarget && HitCount
trigger1 = Target, command = "x" || Target, command = "y" || Target, command = "z"
trigger2 = Target, command = "a" || Target, command = "b" || Target, command = "c"
trigger3 = Target, command = "up" || Target, command= "down" || Target, command = "back" || Target, command = "fwd"
var(44) = -1

[State 821, Mashing]
type = VarSet
trigger1 = !Time
var(42) = 0

[State 821, Mashing]
type = VarSet
trigger1 = !Time
var(12) = 0

[State 821, Mashing]
type = VarSet
triggerAll = var(42) = 0
trigger1 = (command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z")
trigger2 = (command = "up" || command = "down" || command = "back" || command = "fwd")
var(42) = 2

[State 821, Mashing Increment]
type = VarAdd
trigger1 = var(42) = 2
var(12) = 1

[State 821, Mashing Decrement]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1

[State 821, Anim Skip];some change ups may be needed for this
type = ChangeAnim
triggerall = var(44) > 0
trigger1 = AnimElemTime(AnimElemNo(0)) >= 0 && AnimElemTime(3) < 0
trigger1 = AnimElemTime(AnimElemNo(0) +1 ) >= -var(12)
trigger1 = 1 || var(12) := (var(12) + AnimElemTime(AnimElemNo(0) + 1))
value = 841
elem = AnimElemNo(0) + 1

[State 821, Anim Skip];some change ups may be needed for this too
type = ChangeAnim
triggerAll = var(44) > 0
trigger1 = AnimElemTime(3)>0
trigger1 = AnimElemTime(3)>=(8 - var(12))
trigger1 = 1 || var(12) := (var(12) + 8 - AnimElemTime(3))
value = 841
elem = 1

[State 821, PalFX Flash]
type = PalFX
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
trigger2 = command = "up" || command = "down" || command = "back" || command = "fwd"
time = 1
add = 32, 32, 32

[State 821, Throw]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(4) >= 0
value = 846

[State 821, Throw]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(4) < 0
value = 847

[State 821, Damage]
type = TargetLifeAdd
trigger1 = NumTarget && AnimElem = 3
value = floor(ifElse(14 * fvar(11) < 7, -7, -14 * fvar(11)))
kill = 1

[State 821, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3
value = 30

[State 821, PowerAdd]
type = PowerAdd
trigger1 = HitCount = 1
trigger1 = NumTarget && AnimElem = 3 && !var(20)
value = 70

[State 821, HitAdd]
type = HitAdd
trigger1 = NumTarget && AnimElem = 3
value = 1

[State 821, Hit Count Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(13) = 1

[State 821, Juggle Points Increment]
type = VarAdd
trigger1 = NumTarget && AnimElem = 3
var(15) = 1
ignoreHitPause = 1

[State 821, Juggle Flag Set]
type = VarSet
trigger1 = NumTarget && AnimElem = 3
var(16) = 1
ignoreHitPause = 1

[State 821, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 1
value = 4,1
channel = 0

[State 821, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 1
value = 1,0
channel = 1

[State 821, Voice]
type = PlaySnd
trigger1 = AnimElem = 3 && var(40) != 0
value = 5,1
channel = 0

[State 821, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 1 && var(40) != 0
value = 6,1
channel = 1

[State 821, Hit Snd]
type = PlaySnd
trigger1 = NumTarget && AnimElem = 3
value = 2,800
channel = 2

[State 821, Hit Spark]
type = Helper
trigger1 = NumTarget && AnimElem = 3
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(98 * const(size.xScale)), ceil(-66 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 821, End]
type = ChangeState
trigger1 = var(44) <= 0
trigger1 = !Animtime
trigger2 = NumTarget
trigger2 = !(Target, Alive)
trigger3 = Time >= 180
value = 842

;Final part
[Statedef 842]
type = S
movetype = A
physics = N
velset = 0,0
anim = 842

[State 901, Throw]
type = TargetState
trigger1 = AnimElemTime(3) = 1
value = 848

[State 901, Effect]
type = PlaySnd
trigger1 = AnimElemTime(3) = 1
value = 2, 800

[State 821, Hit Spark]
type = Helper
trigger1 = animelemtime(3) = 1
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = ceil(98 * const(size.xScale)), ceil(-66 * const(size.yScale))
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 820, TargetPowerAdd]
type = TargetPowerAdd
trigger1 = animelemtime(3) = 1
value = 36

[State 820, Power]
type = PowerAdd
trigger1 = animelemtime(3) = 1 && !var(20)
value = 72

[State 820, HitAdd]
type = HitAdd
trigger1 = animelemtime(3) = 1
value = 1

[State 820, HitCount]
type = VarAdd
trigger1 = animelemtime(3) = 1
var(13) = 1

[State 820, Juggle]
type = VarAdd
trigger1 = animelemtime(3) = 1
var(15) = 1
ignoreHitPause = 1

[State 820, Juggle]
type = VarSet
trigger1 = animelemtime(3) = 1
var(16) = 1
ignoreHitPause = 1

[State 820, Damage]
type = TargetLifeAdd
trigger1 = animelemtime(3) = 1
value = floor(ifElse(14 * fvar(11) < 7, -7, -14 * fvar(11)))
kill = 0

[State 901,1]
type = TargetBind
trigger1 = AnimElemTime(3) = 1
pos = ceil(45*const(size.xscale)),0
time = 1

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;DRAGON SUPLEX (TARGET)
;Being Hit
[Statedef 845]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 815, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 902, 1]
type = ChangeAnim2
trigger1= !time
value = 835

;Second part
[Statedef 846]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 816, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = !time
value = 836

;Third part
[Statedef 847]
type = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State 1201, screenbound]
type = screenbound
trigger1 = 1
value = 1

[State 816, Turn]
type = Turn
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 902, 1]
type = ChangeAnim2
trigger1 = !time
value = 837

;Fourth part
[Statedef 848]
type = A
movetype = H
physics = N
velset = 4,6.5
sprpriority = -1

[State 902, 1]
type = ChangeAnim2
trigger1 = !time
value = 838

[State 903, Vel]
type = VelSet
trigger1 = AnimElem = 1
x = -4
y = -6.5

[State 903, Vel]
type = veladd
trigger1 = AnimElemTime(1) > 0
y = .49

[State 903, EnvShake]
type = EnvShake
trigger1 = AnimElemTime(1) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 903, 2]
type = SelfState
trigger1 = AnimElemTime(1) > 0
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;THROW ESCAPED
[StateDef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0,0
sprPriority = 1

[State 890, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 0,0

[State 890, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 895

[State 890, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 890, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 890, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 890, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 890, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(6) >= 0
value = 1

[State 890, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) <= 0
value = -1

[State 890, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 890, VelSet]
type = VelSet
trigger1 = 1
x = -1.425
y = 0

[State 890, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 5000,2
channel = 0

[State 890, Escape Sound]
type = PlaySnd
trigger1= !Time
value = 760,0

[State 890, Throw Escape FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
PosType = P1
pos = 0, -68
facing = -1
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5
pauseMoveTime = 65535
superMoveTime = 65535

[State 890, End]
type = ChangeState
trigger1 = Time >= 27
value = 0
ctrl = 1


;Target Escape
[StateDef 895]
type = S
physics = N
moveType = I
ctrl = 0
velSet = 0,0
sprPriority = 1

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time
value = ifElse(SelfAnimExist(5940), 5940, 130)

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5945) && SelfAnimExist(5940)
value = 5940

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time && !SelfAnimExist(5945) && !SelfAnimExist(5940) && SelfAnimExist(5910)
value = 5910

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = Time >= 20 && Anim = 130
value = 140

[State 895, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 895, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 895, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 895, VelSet]
type = VelSet
trigger1 = 1
x = -1.425
y = 0

[State 895, End]
type = SelfState
trigger1 = Time >= 27
value = 0
ctrl = 1



;THROW ESCAPE MIDAIR
[StateDef 892]
type = A
physics = N
moveType = I
anim = 892
ctrl = 0
velSet = 0, 0
sprPriority = 1

[State 892, TargetBind]
type = TargetBind
trigger1 = !Time && NumTarget
pos = 48, 0

[State 892, TargetState]
type = TargetState
trigger1 = !Time && NumTarget
value = 897

[State 892, TargetFacing]
type = TargetFacing
trigger1 = !Time && NumTarget
value = -1

[State 892, PosAdd]
type = PosAdd
trigger1 = !Time
x = 24

[State 892, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 892, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 892, PosFreeze]
type = PosFreeze
trigger1 = Time < 18
value = 1

[State 892, VelSet]
type = VelSet
trigger1 = Time = 18
x = -2
y = -4

[State 892, VelAdd]
type = VelAdd
trigger1 = Time > 18
y = 0.5

[State 892, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 5000,2
channel = 0

[State 892, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 760,0

[State 892, Throw Escape FX]
type = Helper
trigger1 = !Time
helperType = Normal
stateNo = 8000
ID = 8000
name = "Spark"
posType = P1
pos = 24,-64
facing = -1
ownPal = 1
size.xScale = 0.5
size.yScale = 0.5
pauseMoveTime = 65535
superMoveTime = 65535

[State 892, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;Target Escape
[StateDef 897]
type = A
physics = N
moveType = I
ctrl = 0
velSet = 0, 0
sprPriority = 1

[State 897, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 152

[State 897, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 18
value = 142

[State 897, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 897, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 897, PosFreeze]
type = PosFreeze
trigger1 = Time < 18
value = 1

[State 897, VelSet]
type = VelSet
trigger1 = Time = 18
x = -2
y = -4

[State 897, VelAdd]
type = VelAdd
trigger1 = Time >= 18
y = 0.5

[State 897, SelfState]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52
