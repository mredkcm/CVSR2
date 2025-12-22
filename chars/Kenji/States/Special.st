; _________________________________________
;|Kenji by K6666orochi
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>====
;==

;---------------------------------------------------------------------------
;Projectile
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
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1000, 1000))

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1000,0
channel = 0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1
channel = 1


[State -3,Super]
type = Helper
trigger1 = var(10) = 0
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-74*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 0
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-66*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 0
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-58*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 1
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-74*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 1
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-66*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 1
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-58*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 2
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-74*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 2
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-66*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1


[State -3,Super]
type = Helper
trigger1 = var(10) = 2
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-58*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Width]
type = null;Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;EX Projectile
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

[State 1030, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -5, -45
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
trigger2 = animelem = 9
value = 1000,0
channel = 0

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
trigger2 = animelem = 10
value = 1000,1


[State -3,Super]
type = Helper
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-74*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-66*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1= AnimElem=3
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-58*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1= AnimElem=9
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-74*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1= AnimElem=9
id = 1001
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-66*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1= AnimElem=9
id = 1001
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-58*const(size.yscale))
postype = P1
stateno = 1001
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1030, Width]
type = Width
trigger1 = AnimElemTime(4) = 0
value = 30,0

[State 1030, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Special 1
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

[State 1100, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1100, ifelse(var(10)=1, 1100, 1100))

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1600,1
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1600,0
channel = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist > 130
trigger1 = var(10) = 0
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = 130*const(size.xscale),const(size.yscale)
postype = p1
stateno = 1101
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 130 && facing = 1
trigger1 = var(10) = 0
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = -25*const(size.xscale),const(size.yscale)
postype = right
stateno = 1101
helpertype = normal
facing = 1
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 130 && facing = -1
trigger1 = var(10) = 0
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = 25*const(size.xscale),const(size.yscale)
postype = left
stateno = 1101
helpertype = normal
facing = -1
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist > 200
trigger1= AnimElem=7
trigger1 = var(10) = 1
id = 1101
name = "firecolumn"
pos = 220*const(size.xscale),const(size.yscale)
postype = p1
stateno = 1101
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 200 && facing = 1
trigger1= AnimElem=7
trigger1 = var(10) = 1
id = 1101
name = "firecolumn"
pos = -25*const(size.xscale),const(size.yscale)
postype = right
stateno = 1101
helpertype = normal
facing = 1
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 200 && facing = -1
trigger1= AnimElem=7
trigger1 = var(10) = 1
id = 1101
name = "firecolumn"
pos = 25*const(size.xscale),const(size.yscale)
postype = left
stateno = 1101
helpertype = normal
facing = -1
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist > 260
trigger1= AnimElem=7
trigger1 = var(10) = 2
id = 1101
name = "firecolumn"
pos = 310*const(size.xscale),const(size.yscale)
postype = p1
stateno = 1101
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 260 && facing = 1
trigger1= AnimElem=7
trigger1 = var(10) = 2
id = 1101
name = "firecolumn"
pos = -25*const(size.xscale),const(size.yscale)
postype = right
stateno = 1101
helpertype = normal
keyctrl = 0
facing = 1
ownpal = 1
persistent = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 260 && facing = -1
trigger1= AnimElem=7
trigger1 = var(10) = 2
id = 1101
name = "firecolumn"
pos = 25*const(size.xscale),const(size.yscale)
postype = left
stateno = 1101
facing = -1
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 1

[State 1030, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;------------------------------------
;Special 1 (Land)
[Statedef 1101]
type = S
movetype = A
physics = N
ctrl = 0
juggle = 15
velset = 0,0
anim = 1101
sprpriority = 4

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 3100,1
channel = 1

[State 210, 2]
type = HitDef
triggerall = hitcount <3
Trigger1= Movecontact!=[1,1]
Trigger1=hitcount<3
attr = S, SP
animtype = Heavy
damage = 50,3
hitflag = MAF
guardflag = MA
pausetime = 5,6
sparkno = S27004
sparkxy = 0,-60
hitsound = S5,8
guardsound = S6,0
ground.type = High
ground.slidetime = 10
ground.hittime = 10
cornerpush = 0
guard.slidetime = 10
guard.hittime = 10
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 13
ground.velocity = -1,-10
guard.velocity = -3
airguard.velocity = -3,-3
air.type = Low
air.velocity = -1,-9
yaccel = .38
air.fall = 1
fall = 1
fall.recover = 0
air.recover = 0
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 1234, AngleDraw]
type = AngleDraw
trigger1 = Time >= 35
scale = 1-(0.05*(time-34)),1


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time = 55



;---------------------------------------------------------------------------
;EX Special 1
[Statedef 1130]
type=S
physics=N
movetype=A
anim=1100
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
var(25) = 49

[State 1130, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 0, -73
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1130, NotHitBy]
type = NotHitBy
trigger1 =animelemtime(5)<0
value = SCA,NA,SA,NP,SP,NT,ST
time = 1

[State 1130, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1600,1
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1600,0
channel = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist > 130
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = 130*const(size.xscale),const(size.yscale)
postype = p1
stateno = 1101
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 130 && facing = 1
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = -25*const(size.xscale),const(size.yscale)
postype = right
stateno = 1101
helpertype = normal
facing = 1
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 130 && facing = -1
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = 25*const(size.xscale),const(size.yscale)
postype = left
stateno = 1101
helpertype = normal
facing = -1
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist > 200
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = 220*const(size.xscale),const(size.yscale)
postype = p1
stateno = 1101
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 200 && facing = 1
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = -25*const(size.xscale),const(size.yscale)
postype = right
stateno = 1101
helpertype = normal
facing = 1
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 200 && facing = -1
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = 25*const(size.xscale),const(size.yscale)
postype = left
stateno = 1101
helpertype = normal
facing = -1
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist > 260
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = 310*const(size.xscale),const(size.yscale)
postype = p1
stateno = 1101
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 260 && facing = 1
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = -25*const(size.xscale),const(size.yscale)
postype = right
stateno = 1101
helpertype = normal
keyctrl = 0
facing = 1
ownpal = 1
persistent = 1

[State -3,Super]
type = Helper
triggerall = frontedgebodydist <= 260 && facing = -1
trigger1= AnimElem=7
id = 1101
name = "firecolumn"
pos = 25*const(size.xscale),const(size.yscale)
postype = left
stateno = 1101
facing = -1
helpertype = normal
keyctrl = 0
ownpal = 1
persistent = 1

[State 1030, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;Special 2
[Statedef 1200]
type = S
movetype = A
physics = S
anim=1200
ctrl=0
velset=0,0
sprpriority=1
powerAdd = 72 * !var(20)
facep2=1

[State 1200, Button]
type=varset
trigger1= !time
var(10) = ifElse((command = "x" || command = "rlsx"), 2, ifElse((command = "y" || command = "rlsy"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[State 1100, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1200, ifelse(var(10)=1, 1210, 1220))

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1300,0
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1300,1
channel = 16

[State 0, StopSnd]
type = StopSnd
trigger1= var (10) = 2
trigger1 = time= 60 
channel = 16

[State 0, StopSnd]
type = StopSnd
trigger1= var (10) = 1
trigger1 = time= 72 
channel = 16

[State 0, StopSnd]
type = StopSnd
trigger1= var (10) = 0
trigger1 = time= 84 
channel = 16

[State -3,Super]
type = Helper
trigger1= var (10) = 2
trigger1= AnimElem=1
id = 1201
name = "tsumuji"
pos = const(size.xscale),const(size.yscale)
postype = P1
stateno = 1201
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1= var (10) = 1
trigger1= AnimElem=1
id = 1201
name = "tsumuji"
pos = const(size.xscale),const(size.yscale)
postype = P1
stateno = 1202
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1= var (10) = 0
trigger1= AnimElem=1
id = 1201
name = "tsumuji"
pos = const(size.xscale),const(size.yscale)
postype = P1
stateno = 1203
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1201, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX special 2
[Statedef 1230]
type = S
movetype = A
physics = S
anim=1200
ctrl=0
velset=0,0
sprpriority=1
powerAdd = 72 * !var(20)
facep2=1

[State 1230, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1300,0
channel = 1

[State 1230, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1300,1
channel = 16

[State 1230, StopSnd]
type = null; StopSnd
trigger1 = time= 84 
trigger1 = stateno= 1203 
channel = 16

[State 1230, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1230, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1230, ExFX]
type = varset
trigger1 = !time
var(25) = 28

[State 1230, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 13, -66
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State -3,Super]
type = Helper
trigger1= AnimElem=1
id = 1201
name = "tsumuji"
pos = const(size.xscale),const(size.yscale)
postype = P1
stateno = 1203
;scale = 2.5,2.5
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1201, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1
;-----------------------------------------------

;---------------------------------------------------------------------------
;Special 4
[Statedef 1300]
type=S
physics=N
movetype=A
anim=1300
ctrl=0
velset=0,0
sprpriority=1
powerAdd = 72 * !var(20)
facep2=1

[State 1200, Button]
type=varset
trigger1= !time
var(10) = ifElse((command = "a" || command = "rlsa"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[State 1100, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1300, ifelse(var(10)=1, 1310, 1320))

[State 1200, Snd]
type = playsnd
trigger1 = Animelem = 8
value = 1200,0
channel = 0

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 37
value = 2, 15
channel = 2

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 17
value = 2, 14
channel = 4

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 21
value = 2, 14
channel = 3

[State 1200, Hit]
type=null;hitdef
trigger1= !var(16) && (var(15)<15 || var(20))
trigger1= !Time
ID = 1200
;Guard.Dist = 80
attr = A,SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10), 85, 68)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 105, ifElse(var(10), 85, 68)))), 7
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
ground.velocity = -7.81851892471313, ifElse(var(10) = 2, -4.1004527587891, -3.7484527587891)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -7.81851892471313, ifElse(var(10) = 2, -4.1004527587891, -3.7484527587891)
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
air.fall = 1
fall.recover = 0
fall.recovertime = 120
forcestand = 1
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-77
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 210, 2]
type = HitDef
trigger1 = Animelem = 17
attr = S, SA
animtype = Heavy
damage = 45,5
guardflag = MA
pausetime = 12,12
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=100), var(36):=-50
ground.type = Low
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -5.5
air.velocity = -5.5,-4
forcenofall = 1
sprpriority = 1

[State 210, 2]
type = HitDef
trigger1 = Animelem = 21
attr = S, NA
animtype = Heavy
damage = 45,5
guardflag = MA
pausetime = 12,12
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=100), var(36):=-50
ground.type = High
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -5.5
air.velocity = -5.5,-4
forcenofall = 1
sprpriority = 1

[State -3,Super]
type = Helper
trigger1= AnimElem=23
id = 1301
name = "blade wave"
pos = const(size.xscale),const(size.yscale)
postype = p1
stateno = 1301
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1201, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;blade wave
[statedef 1301]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 1331
sprpriority = 1

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 210, 2]
type = HitDef
trigger1 = animelem =1
attr = S, SP
animtype = Heavy
damage = 30,5
guardflag = MA
pausetime = 12,12
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
hitsound = S2,9
guardsound = S6,0
ground.type = High
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -3
air.velocity = -3,-4
forcenofall = 1
sprpriority = 1

[State 210, 2]
type = HitDef
trigger1 = animelem =2
attr = S, SP
animtype = Heavy
damage = 30,5
guardflag = MA
pausetime = 12,12
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
hitsound = S2,9
guardsound = S3,0
ground.type = High
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -3
air.velocity = -3,-4
forcenofall = 1
sprpriority = 1


[State 210, 2]
type = HitDef
;triggerall = movehit < 3
trigger1 = Animelem = 3
attr = S, SP
animtype = Heavy
damage = 30,5
guardflag = MA
pausetime = 12,12
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
hitsound = S2,9
guardsound = S3,0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -3
air.velocity = -3,-4
fall = 1
sprpriority = 1

[State 210, 2]
type = HitDef
triggerall = movehit < 1
trigger1 = Animelem = 4
attr = S, SP
animtype = Heavy
damage = 30,5
guardflag = MA
pausetime = 12,12
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
hitsound = S2,9
guardsound = S3,0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -3
air.velocity = -3,-4
fall = 1
sprpriority = 1

[State 210, 2]
type = HitDef
triggerall = movehit < 1
trigger1 = Animelem = 5
attr = S, SP
animtype = Heavy
damage = 30,5
guardflag = MA
pausetime = 12,12
sparkno = -1 + 0 * (var(33) := 8015)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -82
hitsound = S2,9
guardsound = S3,0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -3
air.velocity = -3,-4
fall = 1
sprpriority = 1

[State 3306, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8015)
ID = 8000
name = "Spark"
posType = P2
pos = ifElse(P2Dist X < 0, 0, ifElse(P2Dist X < 0, ceil(P2Dist X), 0)), ceil(P2Dist Y - 50)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1


[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = Animelem = 7
physics = S
;ignorehitpause = 
;persistent = 

[State 0, VelSet]
type = VelSet
triggerall = parent,anim = 1300
trigger1 = time = 0
x = 2

[State 0, VelSet]
type = VelSet
triggerall = parent,anim = 1310
trigger1 = time = 0
x = 4

[State 0, VelSet]
type = VelSet
triggerall = parent,anim = 1320
trigger1 = time = 0
x = 6

[State 0, VelSet]
type = VelSet
triggerall = parent,stateno = 1330
trigger1 = time = 0
x = 3

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Animtime = 0

;---------------------------------------------------------------------------
;EX Special 4
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

[State 1030, Button Detect]
type = VarSet
trigger1 = !Time
var(10) = 3

[State 1030, Custom Combo Juggle Points Reset]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1030, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -50, -40
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1200, Snd]
type = playsnd
trigger1 = Animelem = 8
value = 1200,0
channel = 0

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 38
value = 2, 15
channel = 2

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 17
value = 2, 14
channel = 4

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 21
value = 2, 14
channel = 3

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 28
value = 2, 14
channel = 5

[State 210, 2]
type = HitDef
trigger1 = Animelem = 17
attr = S, SA
animtype = Heavy
damage = 45,5
guardflag = MA
pausetime = 12,12
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=100), var(36):=-50
ground.type = Low
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -5.5
air.velocity = -5.5,-4
forcenofall = 1
sprpriority = 1

[State 210, 2]
type = HitDef
trigger1 = Animelem = 21
attr = S, SA
animtype = Heavy
damage = 45,5
guardflag = MA
pausetime = 12,12
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=100), var(36):=-50
ground.type = Low
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -5.5
air.velocity = -5.5,-4
forcenofall = 1
sprpriority = 1

[State 210, 2]
type = HitDef
trigger1 = Animelem = 28
attr = S, NA
animtype = Heavy
damage = 45,5
guardflag = MA
pausetime = 12,12
hitsound = -1 + 0*(var(31):=9)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8016)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=100), var(36):=-50
ground.type = High
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -5.5
air.velocity = -5.5,-4
forcenofall = 1
sprpriority = 1

[State -3,Super]
type = Helper
trigger1= AnimElem=23
id = 1301
name = "blade wave"
pos = const(size.xscale),const(size.yscale)
postype = p1
stateno = 1301
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1030, ChangeState]
type = ChangeState
trigger1 = animtime= 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;Special 5
[Statedef 1400]
type = A
movetype = A
physics = N
anim=1400
ctrl=0
velset=0,0
sprpriority=1
powerAdd = 72 * !var(20)
facep2=1

[State 1200, Button]
type=varset
trigger1= !time
var(10) = ifElse((command = "a" || command = "rlsa"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[State 1100, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1400, ifelse(var(10)=1, 1410, 1420))

[State 1200, Snd]
type = playsnd
trigger1 = Animelem = 2
value = 1100,0
channel = 0

[State 230, 1]
type = PlaySnd
triggerall = var(10) = 2
trigger1 = AnimElem = 5
trigger2 = Animelem = 9
value = 1, 4
channel = 2

[State 230, 1]
type = PlaySnd
triggerall = var(10) = 1
trigger1 = AnimElem = 5
trigger2 = Animelem = 9
trigger3 = Animelem = 13
trigger4 = Animelem = 17
value = 1, 4
channel = 2

[State 230, 1]
type = PlaySnd
triggerall = var(10) = 0
trigger1 = AnimElem = 5
trigger2 = Animelem = 9
trigger3 = Animelem = 13
trigger4 = Animelem = 17
trigger5 = Animelem = 21
trigger6 = Animelem = 25
value = 1, 4
channel = 2

[State 1200, StateType]
type = StateTypeSet
trigger1 = AnimElem=5
StateType = A
physics = N

[State 1200, Dust]
type = helper
trigger1 = Animelem=2
;helpertype = normal
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 1100, VelSet]
type = VelSet
trigger1 = Time=0
x = 5.0
y = -4;-5.0*1.25


[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem=4 
y = 0

[State 1100, VelSet]
type = VelAdd
trigger1 = AnimElemTime(4)<0 
trigger2 = anim = 1400
trigger2 = AnimElemTime(11)>=0&&AnimElemTime(18)<0 
trigger3 = anim = 1410
trigger3 = AnimElemTime(19)>=0&&AnimElemTime(26)<0
trigger4 = anim = 1420
trigger4 = AnimElemTime(27)>=0&&AnimElemTime(35)<0
y = .38 ;.5*1.25 

[State 1100, VelSet]
type = VelSet
trigger1 = anim = 1400
Trigger1 = Vel Y>0 && Pos Y>=0 
x = 0 
y = 0 

[State 1100, VelSet]
type = VelSet
trigger1 = anim = 1410
Trigger1 = Vel Y>0 && Pos Y>=0 
x = 0 
y = 0 

[State 1100, VelSet]
type = VelSet
trigger1 = anim = 1420
Trigger1 = Vel Y>0 && Pos Y>=0 
x = 0 
y = 0 

[State 1100, VelSet]
type = PosSet
Trigger1 = Vel Y>0 && Pos Y>=0
y = 0 

[State 1200, Explod]
type = Explod
trigger1 = animelem =5
anim = 6644
ID = 6644
pos = 82,0
postype = p1
facing = 1
vfacing = 1
bindtime = 1
scale = .9,.9
sprpriority = 6
ontop = 1
ownpal = 1
removetime = 24
removeongethit = 1
ignorehitpause = 1

[State 1200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 6603
pos = 89,-76
postype = p1
ownpal = 1
bindtime = -1
removeongethit = 1
removetime = -1
ID = 6603
sprpriority = 2
scale = .5,.5


[State 1200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 6604
pos = 89,-76
postype = p1
ownpal = 1
bindtime = 1
vel = -.6,0
removeongethit = 1
pausemovetime = 255
removetime = -2
ID = 6604
sprpriority = 3
scale = .5,.5

[State 1200, Explod]
type = Explod
trigger1 = AnimElem = 5
Anim = 6186
pos = 5, 0
postype = p1
facing = 1
ownpal = 1
sprpriority = 3
supermovetime = -1
scale = .5,.5

[State 210, 2]
type = HitDef
trigger1 = AnimElem = 5
trigger2 = Animelem = 9
trigger3 = Animelem = 13
trigger4 = Animelem = 17
trigger5 = Animelem = 21
trigger6 = Animelem = 25
ID = 1400
attr = S, SA
animtype = Medium
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 23)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 23)))), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
hitflag = MA
guardflag = MA
pausetime = 15,15
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-70
ground.type = High
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -5.5
air.velocity = -2.5,-4
forcenofall = 1

[State 1201, ChangeState]
type = ChangeState
trigger1 = AnimTime=0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;EX Special 5
[Statedef 1430]
type = A
movetype = A
physics = N
anim=1430
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

[State 1030, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1030, ExFX]
type = varset
trigger1 = !time
var(25) = 44

[State 1030, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = 0, -90
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1030, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1030, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1100,0
channel = 0

[State 230, 1]
type = PlaySnd
trigger1 = AnimElem = 5
trigger2 = Animelem = 9
trigger3 = Animelem = 13
trigger4 = Animelem = 17
trigger5 = Animelem = 21
trigger6 = Animelem = 25
value = 1, 4
channel = 2

[State 1100, VelSet]
type = VelSet
trigger1 = Time=0
y = -4;-5.0*1.25

[State 1100, VelSet]
type = VelSet
trigger1 = AnimElem=4 
y = 0

[State 1100, VelSet]
type = VelAdd
trigger1 = AnimElemTime(4)<0 
trigger2 = AnimElemTime(31)>=0&&AnimElemTime(39)<0 
y = .38 ;.5*1.25 

[State 1100, VelSet]
type = VelSet
Trigger1 = Vel Y>0 && Pos Y>=0 
x = 0 
y = 0 

[State 1100, VelSet]
type = PosSet
Trigger1 = Vel Y>0 && Pos Y>=0
y = 0 

[State 3200, width]
type =width
trigger1 = anim = 1430 && movehit
edge = 50, 35

[State 3200, Push]
type = playerpush
trigger1 = anim = 1430
value = 0
ignorehitpause = 1

[State 3200, Hit]
type = hitdef
trigger1 = anim = 1430 &&  (animelem = 5 || animelem = 9 || animelem = 13 || animelem = 17 || animelem = 21 || animelem = 25 || animelem = 29)
attr = S, HA
damage = ceil(30.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(7.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=92), var(36):=-70
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = 1
ground.velocity = ifelse((p2dist x != [ -30, 30]), 20, 15), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse((p2dist x != [ -30, 30]), 6, 5), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 45, -1, -4)
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.fall = 1
fall.recover = 0
sprpriority = -1
forcestand = 1
yaccel = 0.5
forcestand = 1

[State 3200, Hit]
type = hitdef
trigger1 = anim = 1430 && (animelem = 7 || animelem = 11 || animelem = 15 || animelem = 19 || animelem = 23 || animelem = 27)
attr = S, HA
damage = ceil(30.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(7.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=-20), var(36):=-70
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = ifelse((p2dist x != [ -30, 30]), -20, -15), 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = ifelse((p2dist x != [ -30, 30]), -6, -5), ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 45, -1, -4)
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
air.fall = 1
fall.recover = 0
sprpriority = 1
forcestand = 1
yaccel = 0.5
forcestand = 1

[State 3200, hitfinal]
type = hitdef
trigger1 = anim = 1430 &&  animelem = 31
attr = S, HA
damage = ceil(47.0*(2 - fvar(11))/(1.0 + 0.4*hitcount)), ceil(7.0*(2 - fvar(11))/(1.0 + 0.4*hitcount))
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 5, 0
hitsound = -1 + 0*(var(31):=5)
guardsound = -1 + 0*(var(32):=0)
sparkno = -1 + 0*(var(33):=8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=-20), var(36):=-70
ground.type = High
ground.slidetime = 16
ground.hittime = 16
p2facing = -1
ground.velocity = -6, -4
air.type = Low
air.velocity = -6, -4
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
sprpriority = 1
yaccel = 0.5
forcestand = 1

[State 1030, ChangeState]
type = ChangeState
trigger1 = animtime= 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Special 7
[Statedef 1600]
type = S
movetype = I
physics = S
anim=1600
ctrl=0
velset=0,0
sprpriority=1
powerAdd = 72 * !var(20)
facep2=1

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 8
value = 1600, 0
channel = 3

[State 1200, Button]
type=varset
trigger1= !time
var(10) = ifElse((command = "a" || command = "rlsa"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[State 1100, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=2, 1600, ifelse(var(10)=1, 1600, 1600))


[State 1200, StateType]
type = StateTypeSet
trigger1 = AnimElem=5
StateType = A
physics = N

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=8
Anim = 1603
id = 1603
pos = 0, 0
postype = p1
ownpal = 1
sprpriority = 5
bindtime = 1
ignorehitpause=0
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 50-48, -80
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 60-48, -70
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 0-48, -80
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 10-48, -30
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 20-48, -40
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 20-48, -60
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 60-48, -20
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 50-48, -40
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1100,Change]
type = ChangeState
trigger1 = animTime=0
value = 1601

;-------------------------
[Statedef 1601]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1610

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 1
value = 1600, 0
channel = 3

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[state 9000, VelSetFwd]
type = VelSet
triggerall = AnimElemTime(3)>=1
trigger1 = command = "holdfwd"
x = 3

[state 9000, VelSetBack]
type = VelSet
triggerall = AnimElemTime(3)>=1
trigger1 = command = "holdback"
x = -3

[State 0, PalFX]
type = PalFX
trigger1 = time = 0
time = 15
add = -256,-256,-256
;mul = 256,256,256
sinadd = 256,256,256,50
invertall = 0
color = 256
;ignorehitpause = 
;persistent = 

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=1
Anim = 1601
id = 1601
pos = 0, 0
postype = p1
ownpal = 1
sprpriority = 5
bindtime = 1
ignorehitpause=0
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 50-9, -80
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 60-11, -70
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 0, -80
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 10-20, -30
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 20-20, -40
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 20-20, -60
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 60-47-20, -20
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 50-3-20, -40
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 0, CtrlSet]
type = CtrlSet
trigger1 = animelem = 2
value = 1
ignorehitpause = 1
persistent = 1

[state 1000,exit]
type = PosSet
triggerall = var(10) = 2 && facing = 1
trigger1 = Time=0 ;&& var(1)>2
x =-120+enemynear,pos X
y = -120

[state 1000,exit]
type = PosSet
triggerall = var(10) = 2 && facing = -1
trigger1 = Time=0 ;&& var(1)>2
x =120+enemynear,pos X
y = -120

[state 1000,exit]
type = PosSet
triggerall = var(10) = 1
trigger1 = Time=0 ;&& var(1)>2
x =enemynear,pos X
y = -120

[state 1000,exit]
type = PosSet
triggerall = var(10) = 0 && facing = 1
trigger1 = Time=0 ;&& var(1)>2
x =100+enemynear,pos X
y = -120

[state 1000,exit]
type = PosSet
triggerall = var(10) = 0 && facing = -1
trigger1 = Time=0 ;&& var(1)>2
x =-100+enemynear,pos X
y = -120

[state 1000,exit]
type = turn
triggerall = var(10) = 0 ;&& facing = -1
trigger1 = Time=0 ;&& var(1)>2

[state 1000,exit]
type = Gravity
trigger1 = AnimElemTime(3)>=1

[state 1000,exit]
type = ChangeState
trigger1 = Vel Y>0 && Pos Y>=-Vel Y
value = 52

;---------------------------------------------------------------------------
;EX special 7
[Statedef 1630]
type = S
movetype = I
physics = S
anim=1630
ctrl=0
velset=0,0
sprpriority=1
powerAdd = -500
facep2=1

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 8
value = 1600, 0
channel = 3

[State 1230, CC Juggle]
type = varset
trigger1 = !time && var(20)
var(15) = 0
ignorehitpause = 1

[State 1230, CC Reset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1

[State 1230, ExFX]
type = varset
trigger1 = !time
var(25) = 28

[State 1230, ExFX]
type = explod
trigger1 = !time
anim = 8210
sprpriority = 3
postype = p1
pos = -45, -50
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1230, ExFX]
type = playsnd
trigger1 = !time
value = 0, 1000
channel = 1

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=8
Anim = 1603
id = 1603
pos = 0, 0
postype = p1
ownpal = 1
sprpriority = 5
bindtime = 1
ignorehitpause=0
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 50-48, -80
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 60-48, -70
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 0-48, -80
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 10-48, -30
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 20-48, -40
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 20-48, -60
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 60-48, -20
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=15
Anim = 1602
id = 1602
pos = 50-48, -40
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1100,Change]
type = ChangeState
trigger1 = animTime=0
value = 1631
;-------------------------
[Statedef 1631]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1610

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 1
value = 1600, 0
channel = 3

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[state 9000, VelSetFwd]
type = VelSet
triggerall = AnimElemTime(3)>=1
trigger1 = command = "holdfwd"
x = 3

[state 9000, VelSetBack]
type = VelSet
triggerall = AnimElemTime(3)>=1
trigger1 = command = "holdback"
x = -3

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=1
Anim = 1601
id = 1601
pos = 0, 0
postype = p1
ownpal = 1
sprpriority = 5
bindtime = 1
ignorehitpause=0
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 50-9, -80
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 60-11, -70
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 0, -80
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 10-20, -30
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 20-20, -40
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 20-20, -60
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 60-47-20, -20
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
Anim = 1602
id = 1602
pos = 50-3-20, -40
postype = p1
ownpal = 1
sprpriority = 4
vel = 0,1
bindtime = 1
ignorehitpause=1
scale = const(size.xscale),const(size.yscale)

[State 0, PalFX]
type = PalFX
trigger1 = time = 0
time = 15
add = -256,-256,-256
;mul = 256,256,256
sinadd = 256,256,256,50
invertall = 0
color = 256
;ignorehitpause = 
;persistent = 

[State 0, CtrlSet]
type = CtrlSet
trigger1 = animelem = 2
value = 1
ignorehitpause = 1
persistent = 1

[state 1000,exit]
type = PosSet
triggerall = prevstateno = 1630  && facing = 1
trigger1 = Time=0 ;&& var(1)>2
x =50+enemynear,pos X
y = -80

[state 1000,exit]
type = PosSet
triggerall = prevstateno = 1630  && facing = -1
trigger1 = Time=0 ;&& var(1)>2
x =-50+enemynear,pos X
y = -80

[state 1000,exit]
type = turn
triggerall = prevstateno = 1630 ;&& facing = -1
trigger1 = Time=0 ;&& var(1)>2

[state 1000,exit]
type = Gravity
trigger1 = AnimElemTime(3)>=1

[state 1000,exit]
type = ChangeState
trigger1 = Vel Y>0 && Pos Y>=-Vel Y
value = 52

;====< ZERO COUNTER >=
;PUNCH ZERO COUNTER
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
type=playsnd
trigger1= !time
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 2900, Snd]
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


;====< ZERO COUNTER >=
;KICK ZERO COUNTER
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
type=playsnd
trigger1= animelem=2
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 2910, Snd]
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

