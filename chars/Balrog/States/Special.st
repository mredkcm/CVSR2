; _________________________________________
;| Character by Author Name                |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>====
;==

;---------------------------------------------------------------------------
;DASH STRAIGHT
[Statedef 1000]
type=S
physics=N
movetype=A
ctrl=0
anim = 1000
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
triggerall = anim = 1000
trigger1=!time
y=0

[State 1000, Dust Helper]
type = Helper
triggerall = anim = 1000
trigger1 = AnimElem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1000
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 0, VelSet]
type = VelSet
triggerall = anim = 1000
trigger1 = animelem = 2
x = 10

[State 0, Attack]
type = ChangeAnim
triggerall = anim = 1000 && animelemtime(2)>=0
trigger1 = P2BodyDist X < 30
trigger2 = time = ifelse(var(10)=2, 14, ifelse(var(10)=1, 9, 4))
value = 1001

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = anim = 1001
trigger1 = animelem = 1
statetype = S       ;S,A,C,L
movetype = A        ;I,A,H
physics = S         ;A,C,S,N

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1001
trigger1 = animelem = 1
value = 1,5
channel = 1

[State 1200, PlaySnd]
type = PlaySnd
triggerall = anim = 1001
trigger1 = animelem = 1
value = 1000,1
channel = 5

[State 1200, Straight]
type=hitdef
triggerall = anim = 1001
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 2
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 95)), 7
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
ground.velocity = ifelse(var(20), -3.61, -6.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -4, -1
air.cornerPush.velOff = 0
yaccel = .45
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=130), var(36):=-66
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1000, Idle]
type = StateTypeSet
triggerall = anim = 1001
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;DASH LOW STRAIGHT
[Statedef 1002]
type=S
physics=N
movetype=A
ctrl=0
anim = 1000
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
triggerall = anim = 1000
trigger1=!time
y=0

[State 1000, Dust Helper]
type = Helper
triggerall = anim = 1000
trigger1 = AnimElem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1000
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 0, VelSet]
type = VelSet
triggerall = anim = 1000
trigger1 = animelem = 2
x = 10

[State 0, Attack]
type = ChangeAnim
triggerall = anim = 1000 && animelemtime(2)>=0
trigger1 = P2BodyDist X < 30
trigger2 = time = ifelse(var(10)=2, 14, ifelse(var(10)=1, 9, 4))
value = Ifelse((command = "holddown" && command = "holdfwd" && (command = "holdx" || command = "holdy" || command = "holdz")), 1003, 1002)

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = anim = 1002 || anim = 1003
trigger1 = animelem = 1
statetype = S       ;S,A,C,L
movetype = A        ;I,A,H
physics = S         ;A,C,S,N

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1002
trigger1 = animelem = 1
value = 1,5
channel = 1

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1003
trigger1 = animelem = 3
value = 1,5
channel = 1

[State 1200, PlaySnd]
type = PlaySnd
triggerall = anim = 1002 || anim = 1003
trigger1 = animelem = 1
value = 1100,1
channel = 5

[State 1200, Low Straight]
type=hitdef
triggerall = anim = 1002
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 2
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = L
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 95)), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Trip
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -3.61, -6.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -3, -2
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
sparkxy = -10 + 0*(var(35):=97), var(36):=-21
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Swing Blow]
type=hitdef
triggerall = anim = 1003
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 4
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = H
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 95)), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = back
fall.animtype = back
ground.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -1, -2), 5
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -3, 4
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
sparkxy = -10 + 0*(var(35):=83), var(36):=-35
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
snap = 83, 0

[State 1101, Landing Dust Explod]
type = Explod
triggerall = anim = 1003
trigger1= animelem = 5
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
pos = 57, 0

[State 1000, Idle]
type = StateTypeSet
triggerall = anim = 1002
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 1000, Idle]
type = StateTypeSet
triggerall = anim = 1003
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX DASH STRAIGHT
[Statedef 1050]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
anim = 1000
sprpriority=1
poweradd=-500
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

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
triggerall = anim = 1000
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
triggerall = anim = 1000
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
triggerall = anim = 1000
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 30, -89
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
triggerall = anim = 1000
trigger1 = !time
value = 0, 1000
channel = 3

[State 1000, Dust Helper]
type = Helper
triggerall = anim = 1000
trigger1 = AnimElem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1000
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 0, VelSet]
type = VelSet
triggerall = anim = 1000
trigger1 = animelem = 2
x = 12

[State 0, Dash Straight]
type = ChangeAnim
triggerall = anim = 1000 && animelemtime(2)>=0
trigger1 = P2BodyDist X < 30
trigger2 = time = 14
value = 1001

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = anim = 1001
trigger1 = animelem = 1
statetype = S       ;S,A,C,L
movetype = A        ;I,A,H
physics = S         ;A,C,S,N

[State 1200, PlaySnd]
type = PlaySnd
triggerall = anim = 1001
trigger1 = animelem = 1
value = 1000,1
channel = 5

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1001
trigger1 = animelem = 1
value = 1,5
channel = 1

[State 1200, Straight]
type=hitdef
triggerall = anim = 1001
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 2
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getpower = 0
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
ground.velocity = ifelse(var(20), -5.61, -10.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.61, -10.89)
guard.cornerpush.veloff = 0
air.velocity = -5, -3
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=10)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=130), var(36):=-66
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1000, Idle]
type = StateTypeSet
triggerall = anim = 1001
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;DASH UPPER
[Statedef 1100]
type=S
physics=N
movetype=A
ctrl=0
anim = 1100
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
triggerall = anim = 1100
trigger1=!time
y=0

[State 1000, Dust Helper]
type = Helper
triggerall = anim = 1100
trigger1 = AnimElem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1100
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 0, VelSet]
type = VelSet
triggerall = anim = 1100
trigger1 = animelem = 2
x = 10

[State 0, Dash Straight]
type = ChangeAnim
triggerall = anim = 1100 && animelemtime(2)>=0
trigger1 = P2BodyDist X < 30
trigger2 = time = ifelse(var(10)=2, 14, ifelse(var(10)=1, 9, 4))
value = 1101

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = anim = 1101
trigger1 = animelem = 1
statetype = S       ;S,A,C,L
movetype = A        ;I,A,H
physics = S         ;A,C,S,N

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1101
trigger1 = animelem = 1
value = 1,5
channel = 1

[State 1200, PlaySnd]
type = PlaySnd
triggerall = anim = 1101
trigger1 = animelem = 1
value = 1100,1
channel = 5

[State 1200, Upper]
type=hitdef
triggerall = anim = 1101
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 2
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 95)), 7
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
ground.velocity = ifelse(var(20), -3.61, -6.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -3, -4
air.cornerPush.velOff = 0
yaccel = .45
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=56), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Upper (Unhit)]
type=hitdef
triggerall = anim = 1101 && !movecontact
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 95)), 7
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
ground.velocity = ifelse(var(20), -3.61, -6.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -3, -4
air.cornerPush.velOff = 0
yaccel = .45
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=38), var(36):=-120
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1000, Idle]
type = StateTypeSet
triggerall = anim = 1101
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;DASH LOW SMASH
[Statedef 1102]
type=S
physics=N
movetype=A
ctrl=0
anim = 1100
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1000,Posset]
type=posset
triggerall = anim = 1100
trigger1=!time
y=0

[State 1000, Dust Helper]
type = Helper
triggerall = anim = 1100
trigger1 = AnimElem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "a" || command = "rlsa"), 0, ifElse((command = "b" || command = "rlsb"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1100
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 0, VelSet]
type = VelSet
triggerall = anim = 1100
trigger1 = animelem = 2
x = 10

[State 0, Dash Straight]
type = ChangeAnim
triggerall = anim = 1100 && animelemtime(2)>=0
trigger1 = P2BodyDist X < 30
trigger2 = time = ifelse(var(10)=2, 14, ifelse(var(10)=1, 9, 4))
value = 1102

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = anim = 1102
trigger1 = animelem = 1
statetype = S       ;S,A,C,L
movetype = A        ;I,A,H
physics = S         ;A,C,S,N

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1102
trigger1 = animelem = 1
value = 1,5
channel = 1

[State 1200, PlaySnd]
type = PlaySnd
triggerall = anim = 1102
trigger1 = animelem = 1
value = 1000,1
channel = 5

[State 1200, Upper]
type=hitdef
triggerall = anim = 1102
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 2
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = HA
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 95)), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Up
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -1.61, -3.89), -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -4, -2
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
sparkxy = -10 + 0*(var(35):=70), var(36):=-62
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Upper (Unhit)]
type=hitdef
triggerall = anim = 1102 && !movecontact
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = HA
damage = ceil(ifElse(fvar(11) * 12 < 7, 7, fvar(11) * 95)), 7
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
ground.velocity = ifelse(var(20), -1.61, -3.89), -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -4, -2
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
sparkxy = -10 + 0*(var(35):=53), var(36):=-121
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1000, Idle]
type = StateTypeSet
triggerall = anim = 1102
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX DASH UPPER
[Statedef 1150]
type=S
physics=N
movetype=A
ctrl=0
velset=0,0
anim = 1100
sprpriority=1
poweradd=-500
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

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
triggerall = anim = 1100
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1050, ExFX]
type = varset
triggerall = anim = 1100
trigger1 = !time
var(25) = 44

[State 1050, ExFX]
type = explod
triggerall = anim = 1100
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 43, -84
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
triggerall = anim = 1100
trigger1 = !time
value = 0, 1000
channel = 3

[State 1000, Dust Helper]
type = Helper
triggerall = anim = 1100
trigger1 = AnimElem = 1
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1100
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 0, VelSet]
type = VelSet
triggerall = anim = 1100
trigger1 = animelem = 2
x = 12

[State 0, Dash Straight]
type = ChangeAnim
triggerall = anim = 1100 && animelemtime(2)>=0
trigger1 = P2BodyDist X < 30
trigger2 = time = 14
value = 1101

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = anim = 1101
trigger1 = animelem = 1
statetype = S       ;S,A,C,L
movetype = A        ;I,A,H
physics = S         ;A,C,S,N

[State 1000, PlaySnd]
type = PlaySnd
triggerall = anim = 1101
trigger1 = animelem = 1
value = 1,5
channel = 1

[State 1200, PlaySnd]
type = PlaySnd
triggerall = anim = 1101
trigger1 = animelem = 1
value = 1100,1
channel = 5

[State 1200, Upper]
type=hitdef
triggerall = anim = 1101
trigger1= !var(16) && (var(15)<15 || var(20)) && var(19)<=2
trigger1= animelem = 2
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = H
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Up
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -1.61, -2.89), -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.61, -10.89)
guard.cornerpush.veloff = 0
air.velocity = -4, -2
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=10)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=61), var(36):=-75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Upper (Unhit)]
type=hitdef
triggerall = anim = 1101 && !movecontact
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = H
damage = ceil(ifElse(fvar(11) * 112 < 7, 7, fvar(11) * 112)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Up
air.animtype = back
fall.animtype = back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = ifelse(var(20), -1.61, -2.89), -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -5.61, -10.89)
guard.cornerpush.veloff = 0
air.velocity = -4, -2
air.cornerPush.velOff = 0
yaccel = .45
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=10)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=38), var(36):=-121
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1000, Idle]
type = StateTypeSet
triggerall = anim = 1001
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;BUFFALO HEAD
[Statedef 1200]
type=S
physics=N
movetype=A
ctrl=0
anim = 1200
velset=0,0
sprpriority=1
poweradd=72*!var(20)
facep2=1

[state 1200,Posset]
type=posset
trigger1=!time
y=0

[State 1200, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1200,0
channel = 3

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = (6.5+(Var(10)*2))*(5.0/4.0)
y = -12;*(5.0/4.0)

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A       ;S,A,C,L
;physics = A         ;A,C,S,N

[State 1200, Head]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
ID = 1200
attr = S,SA
hitflag = HAF
guardflag = M
damage = 98, 7
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
ground.velocity = ifelse(var(20), -3.61, -6.89), -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -3, -4
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
sparkxy = -10 + 0*(var(35):=62), var(36):=-86
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1400, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 0
y = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
physics = A         ;A,C,S,N

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1320, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201

;EX BUFFALO HEAD
[Statedef 1250]
type=S
physics=N
movetype=A
ctrl=0
anim = 1250
velset=0,0
sprpriority=1
poweradd=-500
facep2=1

[State 1050, MAX Timer Drain]
type = VarAdd
trigger1 = !Time
trigger1 = var(53) > 0
var(53) = -500

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
pos = -20, -61
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1050, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 3

[State 1200, Dust Helper]
type = Helper
trigger1 = AnimElem = 2
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,0
channel = 0

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 1200,0
channel = 5

[State 1500, VelSet]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = 9.5*(5.0/4.0)
y = -12;*(5.0/4.0)

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 3
statetype = A       ;S,A,C,L
;physics = A         ;A,C,S,N

[State 1200, Head]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 2
ID = 1200
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getpower = 0
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
ground.velocity = ifelse(var(20), -1.61, -2.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -3, -4
air.cornerPush.velOff = 0
yaccel = .45
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=48), var(36):=-63
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1200, Head]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 3
ID = 1200
attr = S,SA
hitflag = HAF
guardflag = M
damage = ceil(ifElse(fvar(11) * 56 < 7, 7, fvar(11) * 56)), 7
getpower = 0
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
ground.velocity = ifelse(var(20), -3.61, -6.89), -6
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -3, -4
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
sparkxy = -10 + 0*(var(35):=62), var(36):=-86
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1400, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 0
y = 0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 4
physics = A         ;A,C,S,N

[State 1300, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
moveType = I

[State 1320, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 1201

;LANDING
[StateDef 1201]
type = S
anim = 1201
physics = N
moveType = I
velSet = 0,0

[State 1101, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1101, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 1101, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State 1101, End]
type = ChangeState
trigger1 = AnimElemTime(2) = 2 && command = "holddown"
value = 11
ctrl = 1

[State 1101, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;====
;TURN PUNCH
[Statedef 1300]
type=S
physics=S
movetype=A
ctrl=0
anim = 1300
velset=0,0
sprpriority=0
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

[State 1020, Width]
type = Width
trigger1 = Anim = 1300 && animelem = 8
value = 30,30

[State 300, HitBy]
type = NotHitBy
trigger1 = Time <= 20
value = SCA,NT,ST,HT

[State 1050, Dust Helper]
type = Helper
trigger1 = AnimElem = 6
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1050, Swing Snd]
type = PlaySnd
trigger1 = Animelem = 7
value = 1, 2

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 20
y = 0

[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 1000,1
channel = 5

[State 1200, Straight]
type=hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= animelem = 8
ID = 1200
attr = S,SA
hitflag = MAF
guardflag = MA
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 7
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
ground.velocity = ifelse(var(20), -3.61, -6.89), 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -3.61, -6.89)
guard.cornerpush.veloff = 0
air.velocity = -4, -1
air.cornerPush.velOff = 0
yaccel = .45
fall = 0
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=2)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=130), var(36):=-66
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 1101, End]
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