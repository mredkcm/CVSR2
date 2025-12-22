;                          ____________________
;=|Terry Bogard by Memo|=
;                          ｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯ
;==
;===< HELPER STATES >====
;==

;--------------------------------------------------------------------------------------
;Pal Select
[Statedef 256]
physics = N
anim = 256
velset=0,0
sprpriority=99999
 
[State 256, PosSet]
type = PosSet
trigger1 =!time 
x = root,facing*-90
y = 20
ignorehitpause = 1

[State 256, AS]
type=assertspecial
trigger1=1
flag=intro
flag2=noshadow
[State 256, Reset]
type=varset
trigger1=!time
var(29)=200
[State 256, Pal]
type=varset
trigger1=!time
var(40)=root,palno

[State 256, Varset]
type=varset
trigger1=var(40)<1||var(40)>101
var(40)=1+(var(40)<1)*100

[State 256, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S256,0
volumescale = 50
channel = 20
[State 256, PlaySnd]
type = PlaySnd
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2=var(29)<=5
value = S256,1
volumescale = 50
channel = 20
persistent =0 

[State 256, Countdown]
type = VarAdd
trigger1 =1 
var(29)=-1
[State 256, Countdown]
type = VarAdd
trigger1=!var(10)&&var(29)<150
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(29)=25

[State 256, Varadd]
type=varadd
trigger1=!var(10)
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(40)=1-(root,command="holddown"||root,command="holdback"&&facing=1||root,command="holdfwd"&&facing=-1)*2

[State 256, Varadd]
type=varadd
trigger1=(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
var(10)=1

[State 256, Varset]
type=varset
trigger1=!time||var(10)>=17
var(10)=0

[State 256, End]
type=destroyself
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2=var(29)<=0
trigger3=root,AILevel
;---------------------------------------------------------------------------
;Empty
[Statedef 258]
physics = N
velset = 0,0
ctrl = 0
anim = 9999
[State 258, End]
type=destroyself
trigger1=Roundstate>=2

;------------------------------------------------
;P1 Zoom FX
[Statedef 259]
type = S
velset = 0,0
anim = 9999
sprpriority = 4

[State 259, Explode]
type = Explod
triggerall = NumExplod(259) = 0
trigger1 = time = 0
anim = parent, var(52)
ID = 259
pos = 0,0
ontop = 1
removetime = 30
scale = .01*(var(51)),.01*(var(51))
sprpriority = 4
removeongethit = 0 
ownpal = 0
supermove = 1

[State 259, Modify Explod]
type = ModifyExplod
trigger1 = time > 0
ID = 259
scale = .01*(var(51)),.01*(var(51))
removetime = 30
supermove = 1

[State 259, VarSet]
type = Varset
trigger1 = !time
v =  51
value = 200

[State 259, VarAdd]
type = VarAdd
triggerall = Var(51) > 100
trigger1 = timemod = 1,0
v =  51
value = -5

[State 259, VarSet]
type = Varset
trigger1 = Var(51) <= 100
v =  51
value = 100

[State 259, Remove Explode]
type = RemoveExplod
trigger1 = time = 20
ID = 5301

[State 259, Destroy Self]
type = DestroySelf
trigger1 = time = 20

;-------------------------------------------------------------------------------
;Power Wave
[Statedef 1001]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1005
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 1005
value = 1005

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 225074, Vel]
type=velset
trigger1= !Time
x= ifelse(var(10)=2, 7.5, ifelse(var(10)=1, 5, 4.5))
y= 0

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Projectile Flag On]
type = ParentVarSet
trigger1 = !Time
var(39) = 1

[State 1005, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, Fire Trail]
type=explod
trigger1= random%250
anim=7180
ID=7180
sprpriority=3
postype=p1
vel=0,0
pos= -20,0
random=20,5
scale=.1,.1
ownpal=1

[State 1005, HitDef]
type = HitDef
trigger1= !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = 1
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)))), 7
getPower = ifElse(!(Root, var(13)), 144, 72) * !(Root, var(20)), 36 * !(Root, var(20))
givePower = 36, 36
pausetime = 0, 10
guard.pausetime = 0, 12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = High
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -10.52, 0
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 22 + ifElse(Root, var(20), 6, 12)
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -32
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveContact
value = 1006
ignoreHitPause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1007
ignoreHitPause = 1

[State 1005, Projectile Flag Off]
type = ParentVarSet
trigger1 = pos x != [-300,300]
var(39) = 0

[State 1005, End]
type = DestroySelf
trigger1 = pos x != [-300,300]



;-------------------------------------------------------------------------------
;EX Power Wave
[Statedef 1002]
type = S
physics = N
moveType = A
ctrl = 0
anim = 1031;1005
sprPriority = 3

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1009
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 7015, Anim]
type=changeanim
trigger1= anim!=1032
value=1032
[State 7015, Anim]
type=explod
trigger1= !(time%1);(time%1)
anim=1031
sprpriority=3
postype=p1
scale=.3,.3
ownpal=1

[State 7015, Vel]
type=velset
trigger1= !time
x= 9.78348267
y= 0
[State 7015, Vel]
type=veladd
trigger1= vel x>0
x= -.2
y= 0

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Projectile Flag On]
type = ParentVarSet
trigger1 = !Time
var(39) = 1

[State 1005, Miss]
type = HitDef
trigger1 = 1
attr = S,SP
hitFlag =
sparkXY = -10,0

[State 1005, HitDef]
type = HitDef
;trigger1= !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
;trigger1 = 1
trigger1= !(movecontact%6)&& root,var(15)<1;
trigger1= !(movecontact%3)
attr = S,SP
hitFlag = MAF
guardFlag = MA
priority = 4, Hit
damage = 18,2
getPower = 0,0
givePower = 16, 16
pausetime = 0, 3
guard.pausetime = 0, 3
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 60
airGuard.ctrlTime = 16
ground.velocity = -8, -2
ground.cornerPush.velOff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = -8,-3
air.cornerPush.velOff = 0
airGuard.velocity = -5, 0
airGuard.cornerPush.velOff = 0
yAccel = 0.49
fall = 1
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1
sparkNo = -1
guard.SparkNo = -1
sparkXY = -10, -20
persistent = 1
envShake.time = 8
envShake.ampl = 4
envShake.freq = 120

[State 1056, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = 10,-20;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1056, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = 10,-20;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1005, Projectile Flag Off]
type = ParentVarSet
trigger1 = pos x != [-240,240]
var(39) = 0

[State 1009, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 1002, End]
type=changestate
trigger1= vel x<=0
trigger2= pos x!=[-240,240]
value=1009

;-------------------------------------------------------------------------------
;Round Wave
[Statedef 1003]
type = S
movetype = A
physics = N
ctrl = 0
anim =3008
sprpriority = 3
poweradd = 0

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 1005, Button Detect]
type = VarSet
trigger1= !Time && !PrevStateNo
var(10) = Root, var(10)

[State 225044, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 225044, Explod]
type = Explod
trigger1 = time = 0
anim =3008
ID =3008
pos = 0,0
postype = p1
bindtime = 1
removetime = -1
ownpal = 1
ignorehitpause = 0
scale = .5,.5
sprpriority = 3
removeongethit =1

[State 225044, ModifyExplod]
type = ModifyExplod
trigger1 = time >26
ID =3008
scale = .5,.5
trans = addalpha
alpha = 256-((time-26)*40),256

[State 225044, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 225044, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 225044, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 60
ampl = -4


[State 225044, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
attr = S, SP
priority = 4,hit
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 70, ifElse(var(10), 63, 56)))), 7
animtype = heavy
hitflag = MA
guardflag = MA
pausetime = 0,10
sparkNo = -1
guard.sparkNo = -1
hitsound = S40,20
guardsound = S50,6
ground.type = High
air.type = High
ground.slidetime = 88
ground.hittime = 88
air.hittime = 88
guard.ctrltime = 18
ground.velocity = -4, -9.5
guard.velocity = -14.90625
air.velocity = -4.5, -7
yaccel = .58
fall = 1
fall.recover = 0
air.fall = 1
;air.recover = 0
envshake.time = 15
envshake.ampl = 5
fall.envshake.time = 15
fall.envshake.ampl = 5
getpower = 36,36
givepower = 24, 24
forcestand = 1
persistent = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 1056, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = 10,-15;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1056, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 225044, RemoveExplod]
type = RemoveExplod
trigger1 = time >=26;animtime = 0
trigger2 = root,movetype = h

[State 225044, ChangeState]
type = destroyself
trigger1 = time >=26
trigger2 = root,movetype = h

;-------------------------------------------------------------------------------
;EX Round Wave
[Statedef 1005]
type = S
movetype = A
physics = N
ctrl = 0
anim =3008
sprpriority = 3
poweradd = 0

[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
time = -1
stateno = 1007
ignoreHitPause = 1

[State 1005, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NP,SP,HP
time = -1
ignoreHitPause = 1

[State 1005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 1005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 225044, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 225044, Explod]
type = Explod
trigger1 = time = 0
anim =3008
ID =3008
pos = 0,0
postype = p1
bindtime = 1
removetime = -1
ownpal = 1
ignorehitpause = 0
scale = .6,.6
sprpriority = 3
removeongethit =1

[State 225044, ModifyExplod]
type = ModifyExplod
trigger1 = time >26
ID =3008
scale = .5,.5
trans = addalpha
alpha = 256-((time-26)*40),256

[State 225044, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 225044, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 225044, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 60
ampl = -4


[State 225044, HitDef]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
trigger1 = 1
p2stateno = 1125;===wall bounce state
attr = S, SP
priority = 7,hit
damage=40,5
animtype = heavy
hitflag = MA
guardflag = MA
pausetime = 0,10
sparkNo = -1
guard.sparkNo = -1
hitsound = S40,20
guardsound = S50,6
ground.type = Low
ground.slidetime = 88
ground.hittime = 88
air.hittime = 88
guard.ctrltime = 18
ground.velocity = -5, -9.5
guard.velocity = -14.90625
air.velocity = -5, -8
yaccel = .58
fall = 1
fall.recover = 0
air.fall = 1
;air.recover = 0
envshake.time = 15
envshake.ampl = 5
fall.envshake.time = 15
fall.envshake.ampl = 5
getpower = 0,0
givepower = 24, 24
forcestand = 1
persistent = 0
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
down.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 1056, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = 10,-15;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1056, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 225044, RemoveExplod]
type = RemoveExplod
trigger1 = time >=26;animtime = 0
trigger2 = root,movetype = h

[State 225044, ChangeState]
type = destroyself
trigger1 = time >=26
trigger2 = root,movetype = h

;---------------------------------
;Hit Pause
[StateDef 1006]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 3
moveHitPersist = 1

[State 1006, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = 5,-20;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1006, ProjContact]
type = VarSet
trigger1 = MoveContact && NumTarget
var(18) = 1

[State 1006, ProjContact]
type = ParentVarSet
trigger1 = MoveContact && NumTarget
trigger1 = Root, StateNo = [1000,1030]
var(18) = 1

[State 1006, End]
type = ChangeState
trigger1 = Time >= 0
value = 1007


;Disappear
[StateDef 1007]
type = A
physics = N
moveType = A
anim = 1007
ctrl = 0
velSet = 0,0
sprPriority = 3
moveHitPersist = 1

[State 1007, Projectile Flag Off]
type = ParentVarSet
trigger1 = !Time
var(39) = 0

[State 1007, PlaySnd]
type = PlaySnd
trigger1 = !Time
value = 2,6
channel = 2
volumescale = -128
lowPriority = 1

[State 1007, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 1007, End]
type = ChangeState
trigger1 = !AnimTime
value = 1008


;Wait
[StateDef 1008]
type = A
physics = N
moveType = I
anim = 9741
ctrl = 0
velSet = 0,0

[State 1008, End]
type = DestroySelf
trigger1 = !NumTarget
trigger2 = NumTarget
trigger2 = Target, Time <= 1 && !(Target, HitShakeOver)

;-------------------------------------------------------------------------------
[Statedef 1009]
type=A
physics=N
movetype=I
anim=9741
ctrl=0
velset=0,0

[State 1009, End]
type=destroyself
trigger1= !numtarget
trigger2= numtarget
trigger2= target,time<=1 && !(target,hitshakeover)

;-------------------------------------------------------------------------------
;Power Geyser
[Statedef 3005]
type = S
moveType = A
anim=3005
ctrl = 0
sprPriority = 3

[State 3005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 3005, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateNo = 3005
ignoreHitPause = 1

[State 3005, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 3005, Power Geyser]
type = Explod
trigger1 = !Time
anim =3005
ID =3005
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =1

[State 3005, ModifyExplod]
type = ModifyExplod
trigger1 = time >6
ID =3005
scale = .5,.5
trans = addalpha
alpha = 256-((time-6)*40),256

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 65
ampl = -4

[State 3005, Hit]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5)
trigger1 = !Time
attr = S, HA
animtype = up
hitflag = MAF
guardflag = M
priority = 7, Hit
damage = 195,15
getPower = 0,0
givePower = 36, 36
pauseTime = 0,10
guard.pauseTime = 0,10
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.5, -7.5
ground.cornerPush.velOff = 0
guard.velocity = -10
guard.cornerPush.velOff = 0
air.velocity = -2.5, -7.5
air.cornerPush.velOff = 0
yaccel = .3
fall = 1
fall.recover = 0
air.fall = 1
;fall.recoverTime = 120
;forceStand = 0
hitsound = -1 ;+ 0 * (var(31) := 7)
guardsound = -1; + 0 * (var(32) := 0)
sparkno = -1 ;+ 0 * (var(33) := 8014)
guard.sparkno = -1 ;+ 0 * (var(34) := 8001)
sparkxy = -10,-32
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 60,-80;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, HitCount]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(13)=1
ignorehitpause = 1
persistent=0
[State 3005, Juggle]
type=parentvaradd
trigger1= movecontact=1 && numtarget
var(15)=1
ignorehitpause = 1
persistent=0

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, RemoveExplod]
type = RemoveExplod
trigger1 = time >=24;animtime = 0
trigger2 = root,movetype = h

[State 3005, ChangeState]
type = destroyself
trigger1 = time >=24
trigger2 = root,movetype = h

;-------------------------------------------------------------------------------
;MAX Over Heat Geyser Projectile
[Statedef 3055]
type = S
moveType = A
anim=3005
ctrl = 0
sprPriority = 3

[State 3055, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 3055, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3055, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateNo = 3055
ignoreHitPause = 1

[State 3055, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 3005, Power Geyser]
type = Explod
trigger1 = !Time
anim =3005
ID =3005
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =1

[State 3005, ModifyExplod]
type = ModifyExplod
trigger1 = time >6
ID =3005
scale = .5,.5
trans = addalpha
alpha = 256-((time-6)*40),256

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 65
ampl = -4

[State 3005, Hit]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5)
trigger1 = !Time
id = 3055
attr = S, HA
animtype = up
hitflag = MAF
guardflag = M
priority = 7, Hit
damage = 108,8
getPower = 0,0
givePower = 36, 36
pauseTime = 0,10
guard.pauseTime = 0,10
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 22
ground.velocity = -2.5, -7.5
ground.cornerPush.velOff = 0
guard.velocity = -15
guard.cornerPush.velOff = 0
air.velocity = -2.5, -7.5
air.cornerPush.velOff = 0
yaccel = .3
fall = 1
fall.recover = 0
air.fall = 1
fall.recoverTime = 120
forceStand = 0
hitsound = -1 ;+ 0 * (var(31) := 7)
guardsound = -1; + 0 * (var(32) := 0)
sparkno = -1 ;+ 0 * (var(33) := 8014)
guard.sparkno = -1 ;+ 0 * (var(34) := 8001)
sparkxy = -10,-32
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 60,-80;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, HitCount]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(13)=1
ignorehitpause = 1
persistent=1
[State 3005, Juggle]
type=parentvaradd
trigger1= movecontact=1 && numtarget
var(15)=1
ignorehitpause = 1
persistent=1

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, RemoveExplod]
type = RemoveExplod
trigger1 = time >=24;animtime = 0
trigger2 = root,movetype = h

[State 3005, ChangeState]
type = destroyself
trigger1 = time >=24
trigger2 = root,movetype = h

;-------------------------------------------------------------------------------
;MAX Over Heat Geyser Projectile 2
[Statedef 3056]
type = S
moveType = A
anim=3051
ctrl = 0
sprPriority = 3

[State 3005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 3005, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateNo = 3056
ignoreHitPause = 1

[State 3005, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 3005, Power Geyser]
type = Explod
trigger1 = !Time
anim =3051
ID =3051
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =1

[State 3005, ModifyExplod]
type = ModifyExplod
trigger1 = time >6
ID =3051
scale = .5,.5
trans = addalpha
alpha = 256-((time-6)*40),256

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 65
ampl = -4

[State 3005, Hit]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5)
trigger1 = !Time
id = 3056
attr = S, HA
animtype = up
hitflag = MAF
guardflag = M
priority = 7, Hit
damage = 108,8
getPower = 0,0
givePower = 36, 36
pauseTime = 0,10
guard.pauseTime = 0,10
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 22
ground.velocity = -3, -12.5
ground.cornerPush.velOff = 0
guard.velocity = -15
guard.cornerPush.velOff = 0
air.velocity = -3, -15
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
fall.recover = 0
air.fall = 1
fall.recoverTime = 120
forceStand = 0
hitsound = -1 ;+ 0 * (var(31) := 7)
guardsound = -1; + 0 * (var(32) := 0)
sparkno = -1 ;+ 0 * (var(33) := 8014)
guard.sparkno = -1 ;+ 0 * (var(34) := 8001)
sparkxy = -10,-32
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 60,-80;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, HitCount]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(13)=1
ignorehitpause = 1
persistent=1
[State 3005, Juggle]
type=parentvaradd
trigger1= movecontact=1 && numtarget
var(15)=1
ignorehitpause = 1
persistent=1

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, RemoveExplod]
type = RemoveExplod
trigger1 = time >=24;animtime = 0
trigger2 = root,movetype = h

[State 3005, ChangeState]
type = destroyself
trigger1 = time >=24
trigger2 = root,movetype = h

;-------------------------------------------------------------------------------
;MAX Over Heat Geyser Projectile
[Statedef 3065]
type = S
moveType = A
anim=3005
ctrl = 0
sprPriority = 3

[State 3055, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 3055, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3055, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateNo = 3055
ignoreHitPause = 1

[State 3055, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 3005, Power Geyser]
type = Explod
trigger1 = !Time
anim =3005
ID =3005
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =1

[State 3005, ModifyExplod]
type = ModifyExplod
trigger1 = time >6
ID =3005
scale = .5,.5
trans = addalpha
alpha = 256-((time-6)*40),256

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 65
ampl = -4

[State 3005, Hit]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5)
trigger1 = !Time
id = 3055
attr = S, HA
animtype = up
hitflag = MAF
guardflag = M
priority = 7, Hit
damage = 81,8
getPower = 0,0
givePower = 36, 36
pauseTime = 0,10
guard.pauseTime = 0,10
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 22
ground.velocity = -2.5, -7.5
ground.cornerPush.velOff = 0
guard.velocity = -15
guard.cornerPush.velOff = 0
air.velocity = -2.5, -7.5
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
fall.recover = 0
air.fall = 1
fall.recoverTime = 120
forceStand = 0
hitsound = -1 ;+ 0 * (var(31) := 7)
guardsound = -1; + 0 * (var(32) := 0)
sparkno = -1 ;+ 0 * (var(33) := 8014)
guard.sparkno = -1 ;+ 0 * (var(34) := 8001)
sparkxy = -10,-32
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 60,-80;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, HitCount]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(13)=1
ignorehitpause = 1
persistent=1
[State 3005, Juggle]
type=parentvaradd
trigger1= movecontact=1 && numtarget
var(15)=1
ignorehitpause = 1
persistent=1

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, RemoveExplod]
type = RemoveExplod
trigger1 = time >=24;animtime = 0
trigger2 = root,movetype = h

[State 3005, ChangeState]
type = destroyself
trigger1 = time >=24
trigger2 = root,movetype = h

;-------------------------------------------------------------------------------
;MAX Over Heat Geyser Projectile 2
[Statedef 3066]
type = S
moveType = A
anim=3051
ctrl = 0
sprPriority = 3

[State 3005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 3005, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateNo = 3056
ignoreHitPause = 1

[State 3005, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 3005, Power Geyser]
type = Explod
trigger1 = !Time
anim =3051
ID =3051
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =1

[State 3005, ModifyExplod]
type = ModifyExplod
trigger1 = time >6
ID =3051
scale = .5,.5
trans = addalpha
alpha = 256-((time-6)*40),256

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 65
ampl = -4

[State 3005, Hit]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5)
trigger1 = !Time
id = 3056
attr = S, HA
animtype = up
hitflag = MAF
guardflag = M
priority = 7, Hit
damage = 108,8
getPower = 0,0
givePower = 36, 36
pauseTime = 0,10
guard.pauseTime = 0,10
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 22
ground.slideTime = 22
guard.hitTime = 22
air.hitTime = 22
ground.velocity = -3, -15.5
ground.cornerPush.velOff = 0
guard.velocity = -15
guard.cornerPush.velOff = 0
air.velocity = -3, -15
air.cornerPush.velOff = 0
yaccel = .6
fall = 1
fall.recover = 0
air.fall = 1
fall.recoverTime = 120
forceStand = 0
hitsound = -1 ;+ 0 * (var(31) := 7)
guardsound = -1; + 0 * (var(32) := 0)
sparkno = -1 ;+ 0 * (var(33) := 8014)
guard.sparkno = -1 ;+ 0 * (var(34) := 8001)
sparkxy = -10,-32
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 60,-80;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, HitCount]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(13)=1
ignorehitpause = 1
persistent=1
[State 3005, Juggle]
type=parentvaradd
trigger1= movecontact=1 && numtarget
var(15)=1
ignorehitpause = 1
persistent=1

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, RemoveExplod]
type = RemoveExplod
trigger1 = time >=24;animtime = 0
trigger2 = root,movetype = h

[State 3005, ChangeState]
type = destroyself
trigger1 = time >=24
trigger2 = root,movetype = h

;-------------------------------------------------------------------------------
;Over Heat Geyser
[Statedef 3205]
type = S
moveType = A
anim=3005
ctrl = 0
sprPriority = 3

[State 3005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 3005, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateNo = 3205
ignoreHitPause = 1

[State 3005, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 3005, Power Geyser]
type = Explod
trigger1 = !Time
anim =3005
ID =3005
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 3
removeongethit =1

[State 3005, ModifyExplod]
type = ModifyExplod
trigger1 = time >6
ID =3005
scale = .5,.5
trans = addalpha
alpha = 256-((time-6)*40),256

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 65
ampl = -4

[State 3005, Hit]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5)
trigger1 = !Time
id = 3205
attr = S, HA
animtype = up
hitflag = MAF
guardflag = M
priority = 7, Hit
damage = 150,15
getPower = 0,0
givePower = 36, 36
pauseTime = 0,10
guard.pauseTime = 0,10
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.5, -7.5
ground.cornerPush.velOff = 0
guard.velocity = -15
guard.cornerPush.velOff = 0
air.velocity = -2.5, -7.5
air.cornerPush.velOff = 0
yaccel = .3
fall = 1
fall.recover = 0
air.fall = 1
;fall.recoverTime = 120
forceStand = 0
hitsound = -1 ;+ 0 * (var(31) := 7)
guardsound = -1; + 0 * (var(32) := 0)
sparkno = -1 ;+ 0 * (var(33) := 8014)
guard.sparkno = -1 ;+ 0 * (var(34) := 8001)
sparkxy = -10,-32
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = 60,-80;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, HitCount]
type=ParentVarAdd
trigger1=Movehit=1 && NumTarget
var(13)=1
ignorehitpause = 1
persistent=0
[State 3005, Juggle]
type=parentvaradd
trigger1= movecontact=1 && numtarget
var(15)=1
ignorehitpause = 1
persistent=0

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, RemoveExplod]
type = RemoveExplod
trigger1 = time >=24;animtime = 0
trigger2 = root,movetype = h

[State 3005, ChangeState]
type = destroyself
trigger1 = time >=24
trigger2 = root,movetype = h

;-------------------------------------------------------------------------------
;Buster Wolf
[Statedef 3305]
type = S
moveType = A
anim=3303
ctrl = 0
sprPriority = 1

[State 3005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 3005, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateNo = 3305
ignoreHitPause = 1

[State 3005, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 3005, Power Geyser]
type = Explod
trigger1 = !Time
anim =3303
ID =3303
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 1
removeongethit =1

[State 3005, ModifyExplod]
type = ModifyExplod
trigger1 = time >6
ID =3305
scale = .5,.5
trans = addalpha
alpha = 256-((time-6)*40),256

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 65
ampl = -4

[State 3005, Hit]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5)
trigger1 = !Time
;trigger1 = animelemtime(3)>=0
;trigger1 = animelemtime(6)<0
id = 3305
attr = S, HA
animtype = up
hitflag = MAFD
guardflag = M
priority = 7, Hit
damage = 138,15
getPower = 0,0
givePower = 36, 36
pauseTime = 0,5
guard.pauseTime = 0,5
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = -14
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10.5
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
fall.recover = 0
air.fall = 1
;fall.recoverTime = 120
forceStand = 0
hitsound = -1 ;+ 0 * (var(31) := 7)
guardsound = -1; + 0 * (var(32) := 0)
sparkno = -1 ;+ 0 * (var(33) := 8014)
guard.sparkno = -1 ;+ 0 * (var(34) := 8001)
sparkxy = -10,-32
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = 36,-70;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, RemoveExplod]
type = RemoveExplod
trigger1 = time >=22;animtime = 0
trigger2 = root,movetype = h

[State 3005, ChangeState]
type = destroyself
trigger1 = time >=22
trigger2 = root,movetype = h

;-------------------------------------------------------------------------------
;MAX Buster Wolf
[Statedef 3306]
type = S
moveType = A
anim=3303
ctrl = 0
sprPriority = 1

[State 3005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 3005, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateNo = 3306
ignoreHitPause = 1

[State 3005, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 3005, Power Geyser]
type = Explod
trigger1 = !Time
anim =3303
ID =3303
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = 1,1
sprpriority = 1
removeongethit =1

[State 3005, ModifyExplod]
type = ModifyExplod
trigger1 = time >6
ID =3305
scale = .5,.5
trans = addalpha
alpha = 256-((time-6)*40),256

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 65
ampl = -4

[State 3005, Hit]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5)
trigger1 = animelemtime(3)>=0
trigger1 = animelemtime(6)<0
id = 3306
attr = S, HA
animtype = up
hitflag = MAFD
guardflag = M
priority = 7, Hit
damage = 88,15
getPower = 0,0
givePower = 36, 36
pauseTime = 0,10
guard.pauseTime = 0,10
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -2.5, -10.5
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -2.5, -10.5
air.cornerPush.velOff = 0
yaccel = .5
fall = 1
fall.recover = 0
air.fall = 1
;fall.recoverTime = 120
forceStand = 0
hitsound = -1 ;+ 0 * (var(31) := 7)
guardsound = -1; + 0 * (var(32) := 0)
sparkno = -1 ;+ 0 * (var(33) := 8014)
guard.sparkno = -1 ;+ 0 * (var(34) := 8001)
sparkxy = -10,-32
palfx.color=32
palfx.sinadd=80,25,0,8
palfx.mul=512,256,128
palfx.time=82
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120

[State 3005, Burn]
type=helper
trigger1= movehit && numtarget && numhelper(7180)<1
trigger1= !(target,time) && (target,movetype=H)
;helpertype=normal
stateno=7180
ID=7180
name="Burn"
postype=p2
;bindtime=1000
ownpal=1
facing=-1
size.ground.front=0
size.ground.back=0
ignorehitpause=1
persistent=0

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = 36,-70;ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, RemoveExplod]
type = RemoveExplod
trigger1 = time >=22;animtime = 0
trigger2 = root,movetype = h

[State 3005, ChangeState]
type = destroyself
trigger1 = time >=22
trigger2 = root,movetype = h

;-------------------------------------------------------------------------------
;Trinity Geyser
[Statedef 3405]
type = S
moveType = A
anim=3402
ctrl = 0
sprPriority = 3

[State 3005, Projectile Health]
type = VarSet
trigger1 = !Time && !PrevStateNo
var(0) = 2

[State 3005, Projectile Health Decrement]
type = VarAdd
trigger1 = !Time && PrevStateNo
var(0) = -1
ignoreHitPause = 1
persistent = 0

[State 3005, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP, AT
time = -1
stateNo = 3405
ignoreHitPause = 1

[State 3005, HitBy]
type = HitBy
trigger1 = 1
value = SCA, NP, SP, HP
time = -1
ignoreHitPause = 1

[State 3005, Counter Flag]
type = VarSet
trigger1 = NumEnemy
trigger1 = MoveContact != 1
var(9) = (EnemyNear, MoveType = A)

[State 3005, Dampener]
type = VarSet
trigger1 = 1
fvar(11) = (Root, fvar(10)) * ifElse(var(9), 1.2, 1)

[State 3005, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 3005, Power Geyser]
type = Explod
trigger1 = !Time
anim =3402
ID =3402
pos = 0,0
postype = p1
bindtime = 1
removetime = -2
ownpal = 1
ignorehitpause = 0
scale = .575,.657
sprpriority = 3
removeongethit =1

[State 3005, ModifyExplod]
type = ModifyExplod
trigger1 = time >6
ID =3405
scale = .5,.5
trans = addalpha
alpha = 256-((time-6)*40),256

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S100,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S90,4
volumescale = -100
channel = -1
freqmul = 1.5

[State 3005, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
freq = 65
ampl = -4

[State 3005, Hit]
type = HitDef
trigger1 = !(Root, var(16)) && (Root, var(15) < 5)
trigger1 = !Time
id = 3205
attr = S, HA
animtype = up
hitflag = MAFD
guardflag = M
priority = 7, Hit
damage = 105,15
getPower = 0,0
givePower = 36, 36
pauseTime = 0,6
guard.pauseTime = 0,6
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = -10.5,-7.5
ground.cornerPush.velOff = 0
guard.velocity = -14
guard.cornerPush.velOff = 0
air.velocity = -11.5,-7.5
air.cornerPush.velOff = 0
yaccel = .6
fall = 1
fall.recover = 0
air.fall = 1
;fall.recoverTime = 120
forceStand = 0
hitsound = -1 ;+ 0 * (var(31) := 7)
guardsound = -1; + 0 * (var(32) := 0)
sparkno = -1 ;+ 0 * (var(33) := 8014)
guard.sparkno = -1 ;+ 0 * (var(34) := 8001)
sparkxy = -1;0,-32

[State 3005, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 2), ifElse(MoveGuarded, 0, 6)
channel = 2
ignorehitPause = 1

[State 3005, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && var(9)
trigger1 = !(Target, HitShakeOver)
;helpertype = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, RemoveExplod]
type = RemoveExplod
trigger1 = time >=53;animtime = 0
trigger2 = root,movetype = h

[State 3005, ChangeState]
type = destroyself
trigger1 = time >=53
trigger2 = root,movetype = h

;------------------------------------
;Rising Force FX
[Statedef 3505]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0, 0
anim = 3502
sprpriority = 4
juggle = 10

[State 3505, Pal FX]
type = PalFX
trigger1 = !time 
time = 999
add = 0,0,32
sinadd = 0,0,0,0
invertall = 0
color = 128
ignorehitpause = 1
persistent = 0

[State 3505, Vel Set]
type = VelSet
trigger1 = animelem = 5
x = 26

[State 3505, After Image]
type = AfterImage
trigger1 = AnimElem = 6, =4
time = 999
length = 16;4
timegap = 2
framegap = 1
palbright = 0,0,32
palpostbright = 0,0,0
paladd = 0,0,0
palmul = 1,1,1
palcolor = 0
trans = add1

[State 3505, Var Set]
type = VarSet
trigger1 = var(14) = 4
ignorehitpause = 1
var(14) = 0

[State 3505, Var Set]
type = VarSet
trigger1 = root, movecontact = 1
trigger1 = root, stateno = 3500
ignorehitpause = 1
var(14) = 1

[State 3505, Var Set]
type = VarAdd
trigger1 = var(14)
ignorehitpause = 1
var(14) = 1

[State 3505, Pos Freeze]
type = PosFreeze
trigger1 = var(14)
value = 1
ignorehitpause = 1
persistent = 1

[State 3505, Change Anim]
type = ChangeAnim
trigger1 = var(14)
value = anim
elem = AnimElemNo(0)

[State 3505, Display To Clipboard]
type = DisplayToClipboard
trigger1 = 1
text = "MoveHit = %d"
params = Var(14)

[State 3505, Destroy Self]
type = DestroySelf
trigger1 = root,stateno != [3500,3502]
trigger2 = Rootdist X <= 0
trigger2 = animelemtime(6) > 0

;-------------------------------------------------------------------------------
[Statedef 5319]
type=A
movetype=H
physics=N
velset=0,0
anim=5012;5012
[State 5319, grav]
type=veladd
trigger1=anim!=5030
y=gethitvar(yaccel)
[State 5319, screen]
type=screenbound
trigger1=1
value=1
movecamera=0,1
[State 5319, push]
type=playerpush
trigger1=1
value=0
[State 5319, vel]
type=hitvelset
trigger1=anim!=5030
x=1
y=1
persistent=0
[State 5319, anim]
type=changeanim
trigger1=vel y<=5
value=5012
[State 5319, anim]
type=changeanim
trigger1=vel y>5&&selfanimexist(5035)
trigger2=anim=5035&&!animtime
value=ifelse((anim=5012),5035,5050)
[State 5319, end]
type=changestate
trigger1=vel y<=5&&(backedgebodydist<=0||frontedgebodydist<=0)
value=5320
[State 5319, end]
type=selfstate
trigger1=vel y>0&&pos y>=0
value=5100

;----------2
[Statedef 5320]
type=A
movetype=H
physics=N
ctrl=0

[State -2, PlaySnd]
type =PlaySnd
trigger1 = time = 0
trigger2 = p2MoveType != H
value = 100,15

[State 5320, screen]
type=screenbound
trigger1=1
value=1
movecamera=0,1
[State 5320, push]
type=playerpush
trigger1=1
value=0
[State 5320, pos]
type=posadd;posset
trigger1=1
x=ifelse((frontedgebodydist>backedgebodydist),backedgebodydist,frontedgebodydist);-160*facing
[State 5320, freeze]
type=posfreeze
trigger1=1
value=1
[State 5320, grav]
type=veladd
trigger1=1
y=gethitvar(yaccel)
[State 5320, fx]
type=playsnd
trigger1=!time
value=f7,0
[State 5320, shake]
type=envshake
trigger1=!time
time=12
freq=90
ampl=6
[State 5320, end]
type=changestate
trigger1=!time
value=5321

;-----------3
[Statedef 5321]
type=A
movetype=H
physics=N
velset=0,0
anim=5030

[State 5321, screen]
type=screenbound
trigger1=pos x!=[-80,80]
value=1
movecamera=0,1
[State 5321, push]
type=playerpush
trigger1=1
value=0
[State 15321, anim]
type=changeanim
trigger1=anim!=5052&&selfanimexist(5052)
value=5052
[State 5321, anim]
type=changeanim
trigger1=anim=5030&&!animtime&&selfanimexist(5035)
trigger2=anim=5035&&!animtime
value=ifelse((anim=5030),5035,5050)
[State 5321, turn]
type=turn
trigger1=!time
[State 5321, grav]
type=veladd
trigger1=1
y=.35
[State 5321, vel]
type=velset
trigger1=!time
x=-3
y=-6
persistent=0
[State 5321, end]
type=selfstate
trigger1=vel y>0&&pos y>=0
value=5100

;---------------------------------------------------------------------------
;CAMERA FOCUS
[Statedef 6001]
type=S
physics =S
anim=0
ctrl=0

[state 6001,TURN]
type=turn
trigger1=ishelper(6001)
trigger1=facing!=root,facing
ignorehitpause=1

[State 6001,vel]
type=VelSet
trigger1=parent,pos X > 0
x=Ifelse(facing=1,4,-4)
[State 6001,vel]
type=VelSet
trigger1=parent,pos X < 0
x=Ifelse(facing=1,-4,4)
[State 6001,vel]
type=VelSet
trigger1=parent,pos X=[-5,5]
x=0

[State 6001, WIDTH]
type=Width
trigger1=1
value=1,1

[State 6001, NHB]
type=NotHitBy
trigger1=1
value=SCA
time=1

[State 6001,AS]
type=AssertSpecial
Trigger1=1
flag=invisible
flag2=noshadow

[State 6001,Bound]
type=ScreenBound
trigger1 =1
value =1
movecamera=320,0
[State 6001,push]
type=PlayerPush
trigger1 =1
value=0

[State 6001, Destroyself]
type=destroyself
trigger1=Time=50
trigger1=enemy, Life >= 1
trigger2=numhelper(6001)>=2

;==== BURN FX =
[Statedef 7180]
physics=N
velset=0,0
anim=9741
sprpriority=4

[State 7180, assert]
type=assertspecial
trigger1= 1
flag=noshadow
ignorehitpause=1

[State 7180, flames]
type=explod
trigger1= 1
anim=7180
ID=7180
sprpriority=3
postype=p2
vel=-.2,-.75
pos=(enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))+(ifelse((enemynear,statetype != A),-5,10))
random=40,40;40,40;50,40
removetime=-2
scale=(.3-(.001*time)),(.3-(.001*time))
ownpal=0

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1;numexplod(7180)
ID = 7180
trans=addalpha
alpha=220,256

[State 7180, pos]
type=posadd
trigger1= 1
x=ceil(p2dist x)
y=ceil(p2dist y)

[State 7180, end]
type=destroyself
trigger1= time>=(ifelse(enemynear,statetype != A ,30,120))
trigger2= enemynear,ctrl || (enemynear,movetype!=H) || (enemynear,statetype=L)
trigger3 = (root,stateno = [200,999]) && (root,movecontact)
;trigger4 = (root,stateno = [2000,2999]) && (root,movecontact)
;trigger4 = (root,stateno = [3000,3999]) && (root,movecontact)

;---------------------------------------------------------------------------
;帽子1（イントロ（対ケン））
[Statedef 7910]
type = A
physics = N
ctrl = 0
anim = 1920
sprpriority = 2
velset = 0,0

[State 1000, Voice]
type = PlaySnd
trigger1 = AnimElem = 7
value = 190, 2

[State 8200, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 7911

;---------------------------------------------------------------------------
;帽子2（イントロ（対ケン））
[Statedef 7911]
type = A
physics = N
ctrl = 0
anim = 184
sprpriority = 2

[State 220, Position]
type = PosAdd
trigger1 = Time = 0
x = 58
y = -102

[State 105, 1]
type = VelSet
trigger1 = time = 0
x = (ParentDist X-68)*.03125
y = -4.5

[State 105, 1]
type = VelAdd
trigger1 = 1
y = .3

[State 8200, DestroySelf]
type = DestroySelf
trigger1 = parent,animelem = 4

;====<SPARKS>=
;Guard Spark (Normal)
[StateDef 8000]
type = A
physics = N
moveType = I
anim = 8000
velset = 0,0
sprPriority = 5

[State 8000, Assert: No Shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8000, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.125 + (0.046875 * Time), 0.125 + (0.046875 * Time)
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8000, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8000, End]
type = DestroySelf
trigger1 = Time >= 8


;Guard Spark (Special)
[StateDef 8001]
type = A
physics = N
moveType = I
anim = 8001
velSet = 0,0
sprPriority = 5

[State 8001, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8001, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8001, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8001, End]
type = DestroySelf
trigger1 = Time >= 8


;Weak Hit Spark
[StateDef 8010]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8010, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8010, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8010, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8010, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.3 - (Time * 0.03), 0.3 - (Time * 0.03)
ignoreHitPause = 1

[State 8010, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8010, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8010, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time),256

[State 8010, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.15 + (0.009375 * Time), 0.15 + (0.009375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8010, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8010, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.3 - (0.0375 * Time), 0.3 - (0.0375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8010, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8010, End]
type = DestroySelf
trigger1 = Time >= 16


;Medium Hit Spark
[StateDef 8011]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8011, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8011, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8011, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8011, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.35 - (Time * 0.035), 0.35 - (Time * 0.035)
ignoreHitPause = 1

[State 8011, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8011, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8011, Center]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removetime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.175 + (0.0109375 * Time), 0.175 + (0.0109375 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8011, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8011, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.35 - (0.04375 * Time), 0.35 - (0.04375 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8011, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8011, End]
type = DestroySelf
trigger1 = Time >= 16


;Strong Hit Spark
[StateDef 8012]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8012, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8012, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8012, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8012, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.4 - (Time * 0.04), 0.4 - (Time * 0.04)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8012, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8012, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Streaks Explod]
type = Explod
trigger1 = !time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.2 + (0.0125 * Time), 0.2 + (0.0125 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8012, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8012, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.4 - (0.05 * Time), 0.4 - (0.05 * Time)
trans = AddAlpha
alpha = 128 - (16 * Time), 256

[State 8012, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8012, End]
type = DestroySelf
trigger1 = Time >= 16


;Special Move Hit Spark
[StateDef 8013]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8013, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8013, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8013, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8013, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.45 - (Time * 0.045), 0.45 - (Time * 0.045)
ignoreHitPause = 1

[State 8012, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8013, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8013, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.225 + (0.0140625 * Time), 0.225 + (0.0140625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8013, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = -1
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale P2 Back Explod]
type = ModifyExplod
trigger1= NumExplod(3)
ID = 3
scale = 0.4, 0.4
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8013, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(random < 500, -1, 1)
vFacing = ifElse(random < 500, -1, 1)
sprPriority=3
removeTime=8
pauseMoveTime = -1
superMoveTime = -1

[State 8013, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.45 - (0.05625 * Time), 0.45 - (0.05625 * Time)
trans = AddAlpha
alpha = 192 - (24 * Time), 256

[State 8013, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 16

[State 8013, End]
type = DestroySelf
trigger1 = Time >= 16


;Super Hit Spark
[StateDef 8014]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 8014, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8014, AngleSet]
type = AngleSet
trigger1 = !Time
value = 30 * (Random % 12)

[State 8014, AngleAdd]
type = AngleAdd
trigger1 = 1
value = 30

[State 8014, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
ignoreHitPause = 1

[State 8014, Scale]
type = AngleDraw
trigger1 = Time >= 10
scale = 0,0
ignoreHitPause = 1

[State 8014, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8014, Center Explod]
type = Explod
trigger1 = !Time
anim = 8011
ID = 1
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
trigger1 = !Time
anim = 8012
ID = 2
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = ifElse((Parent, StateNo = [3000,3999]), -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, Impact Explod]
type = Explod
trigger1 = !Time
anim = 8014
ID = 4
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16


;Reversal Spark
[StateDef 8020]
type = A
physics = N
moveType = I
anim = 8020
velSet = 0,0
sprPriority = 5

[State 8020, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8020, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.25 + (0.09375 * Time), 0.25 + (0.09375 * Time)
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time < 4
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8020, Transparency]
type = Trans
trigger1 = Time >= 4
trans = AddAlpha
alpha = 256 - 64 * (Time - 4), 256
ignoreHitPause = 1

[State 8020, End]
type = DestroySelf
trigger1 = Time >= 8



;====< DUSTS >=
;--- Jump ---
[Statedef 8100]
type = S
anim = 9741
velset = 0, 0

[State 8100, Bind]
type = bindtoroot
trigger1 = time

[State 8100, Dust]
type = explod
trigger1 = !time
anim = 8100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 8101
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8100, End]
type = destroyself
trigger1 = time >= 7


;--- Dash ---
[Statedef 8103]
type = A
anim = 9741
velset = 0, 0
sprpriority = 5

[State 8103, Pos]
type = posset
trigger1 = !time = 0
y = 0

[State 8103, Dust]
type = explod
trigger1 = time = 0 || time = 3 || time = 6
anim = 8103
ID = ifelse((time = 6), 3, ifelse((time = 3), 2, 1))
postype = p1
pos = 0, -4
random = 8, 8
vel = -3 -(random / 1000.0), -2 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
sprpriority = 3
pausemovetime = -1
supermovetime = -1

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.025 * time), 0.1 + (0.025 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.1 + (0.025 * (time -3)), 0.1 + (0.025 * (time -3))
trans = addalpha
alpha = 256 -(16 * (time -3)), 256

[State 8103, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.1 + (0.025 * (time -6)), 0.1 + (0.025 * (time -6))
trans = addalpha
alpha = 256 -(16 * (time -6)), 256

[State 8103, End]
type = removeexplod
trigger1 = time >= 22

[State 8103, End]
type = destroyself
trigger1 = !numexplod

;-----------------------------------
;Ground Impact 
[Statedef 8110]
type = A
anim = 9741
velset = 0, 0
sprpriority = 5

[State 8110, FX]
type = explod
trigger1 = !time
anim = 8110
ID = ifelse(time = 8, 3, ifelse(time = 4, 2, 1))
postype = p1
removetime = 8
sprpriority = -4
pausemovetime = -1
supermovetime = -1

[State 8110, FX]
type = explod
trigger1 = !time
anim = 8120
ID = 2
postype = p1
removetime = 8
sprpriority = -4
pausemovetime = -1
supermovetime = -1

[State 8110, Scale]
type = modifyexplod
trigger1 = 1
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = ifelse(time < 4, 256, 256 -(64 * (time -4))), 256

[State 8110, End]
type = removeexplod
trigger1 = time >= 8

[State 8110, End]
type = destroyself
trigger1 = !numexplod

;==<WALL IMPACT DUST>===
[StateDef 8111]
type = A
anim = 1
velSet = 0,0
sprPriority = 5

[State 8111, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8111
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8121
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8111, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8111, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8111, End]
type = DestroySelf
trigger1 = !NumExplod

;====< FLAMES >=
[Statedef 8150]
type = A
velset = 0, 0
anim = 9741

[State 8150, player]
type = varset
trigger1 = !time
var(0) = parent, var(43)

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8150, facing]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8150, flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 40, 40
vel = (random / 2000.0), -.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 60, 60
vel = (random / 2000.0), -.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, End]
type = destroyself
trigger1 = time >= 600
trigger2 = !playerIDexist(var(0))

[State 8150, End]
type = destroyself
triggerall = playerIDexist(var(0))
trigger1 = playerID(var(0)), ctrl
trigger2 = playerID(var(0)), movetype != H || playerID(var(0)), stateno = 5300
trigger3 = playerID(var(0)), statetype = L && (playerID(var(0)), stateno != [5080, 5081])

;====< RECOVER FX >=
[Statedef 8200]
type = A
velset = 0, 0
anim = 8200
sprpriority = 5

[State 8200, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8200, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.017 * time), 0.25 + (0.017 * time)
ignoreHitPause = 1

[State 8200, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -17.1 * time), 256
ignoreHitPause = 1

[State 8200, End]
type = destroyself
trigger1 = time >= 15


;====< COUNTER FX >=
[Statedef 8290]
type = A
physics = N
velset = 0, 0
anim = 9741

[State 8290, Circle]
type = explod
trigger1 = !numexplod(8290)
anim = 8290
ID = 8290
sprpriority = 64
postype = p1
facing = facing
removetime = 32
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8290, Scale]
type = modifyexplod
trigger1 = time < 8
ID = 8290
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 0

[State 8290, Scale]
type = modifyexplod
trigger1 = time >= 8
ID = 8290
scale = 0.5 + .0625 * (time -8), 0.5 + .0625 * (time -8)
trans = addalpha
alpha = 256 -32 * (time -8), 32 * (time -8)

[State 8290, Safety]
type = removeexplod
trigger1 = time >= 16

[State 8290, End]
type = destroyself
trigger1 = time >= 16

;-----------------------------------------------------------------
; Red BG counter
[StateDef 8300]
Anim = 9999
MoveType = I
Type = A
Physics = N
Ctrl = 0
SprPriority = 5

[State 8300, Red flash]
type = BGPalFX
trigger1 = 1
time = 1
color = 21*Time
add = 216-21*Time,0,0
mul = 256,21*Time,21*Time
ignorehitpause = 1

[State 8300, End]
Type = DestroySelf
trigger1 = Time >= 12

;====< POWER CHARGE >====
;--- MAIN FX ---
[Statedef 8330]
type = A
physics = N
movetype = I
anim = 9741
ctrl = 0
velset = 0, 0

[State 8330, Bind]
type = bindtoroot
trigger1 = (root, stateno = 730)
pos = 0,0

[State 8330, Snd]
type = playsnd
trigger1 = !time
value = 730,0
channel = 0

[State 8330, Aura]
type = explod
trigger1 = !numexplod(8330)
ID = 8330
anim = 8330
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, Dust]
type = explod
trigger1 = !(time % 6)
anim = 8105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power < 3000
ID = 8330
scale = 0.5, 0.1 + 0.4 * (root, power / 3000.0)

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power >= 3000
ID = 8330
scale = 0.5, 0.5

[State 8330, End]
type = stopsnd
trigger1 = root, stateno != 730
channel = 0

[State 8330, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8330, End]
type = destroyself
trigger1 = root, stateno != 730


;--- Particles ---
[Statedef 8331]
type = A
physics = N
movetype = I
anim = 9741
ctrl = 0
velset = 0, 0

[State 8331, Bind]
type=bindtoroot
trigger1= !(time%8)
pos=ceil(-153+(random/3.125)),ceil(82-(random/3.125))

[State 8331, Particle]
type=explod
trigger1= (time%8)=1
anim=8331
sprpriority=ifelse(random<750,5,-1)
postype=p1
vel= ((rootdist x+1)/32.0), ((rootdist y-75)/32.0)
scale= ifelse(random<500,.5,-.5), ifelse(random<500,.5,-.5)
pausemovetime=-1
supermovetime=-1
ownpal=1

[State 8331, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8331, End]
type = destroyself
trigger1 = root, stateno != 730


;====< ZERO COUNTER PAUSE >====
[Statedef 8350]
type = A
physics = N
movetype = I
anim = 9741
ctrl = 0
velset = 0, 0

[State 8350, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 8350, Circle]
type = explod
trigger1 = !time
anim = 8350
ID = 1
sprpriority = 3
postype = p1
removetime = 16
supermovetime = -1
ownpal = 1

[State 8350, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = (0.0625 * time), (0.0625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8350, Lightning]
type = explod
trigger1 = !time
anim = 8351
ID = 2
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = -1
ownpal = 1

[State 8350, End]
type = destroyself
trigger1 = time >= 16


;====< CUSTOM COMBO >=
[Statedef 8400]
type = A
physics = N
movetype = I
anim = 8400
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 8400, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8400, BG PalFX]
type = bgpalfx
trigger1 = time < 25
time = 1
mul = 128, 128, 128

[State 8400, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8400, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8400, Scale]
type = angledraw
trigger1 = time < 8
scale = (0.0625 * time), (0.0625 * time)
ignoreHitPause = 1

[State 8400, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256
ignoreHitPause = 1

[State 8400, Lines]
type = explod
trigger1 = !time
anim = 8401
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8400, Circle]
type = explod
trigger1 = time = 16
anim = 8402
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 8400, Safety]
type = removeexplod
trigger1 = time >= 26

[State 8400, End]
type = destroyself
trigger1 = time >= 26


;====< SUPERPAUSE FX >=
;--- --Level 1 -----
[Statedef 8500]
type = A
velset = 0, 0
anim = 8500
sprpriority = 5

[State 8500, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8500, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 0, 0, 256

[State 8500, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8500, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8500, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8500, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8500, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8501
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Circle]
type = explod
trigger1 = time = 24
anim = 8502
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8500, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 2 -----
[Statedef 8510]
type = A
velset = 0, 0
anim = 8510
sprpriority = 5

[State 8510, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8510, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 192, 0, 256

[State 8510, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8510, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8510, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8510, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8510, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8511
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Circle]
type = explod
trigger1 = time = 24
anim = 8512
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8510, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 3 -----
[Statedef 8520]
type = A
velset = 0, 0
anim = 8520
sprpriority = 5

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 8520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 20
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 21
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Circle]
type = explod
trigger1 = time = 24
anim = 8522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8520, End]
type = destroyself
trigger1 = time >= 40


;====< SUPER FINISH >=
[Statedef 8600]
type = A
velset = 0, 0
anim = 9741

[State 8600, Sound]
type = playsnd
trigger1 = !time
value = 8600,0
channel = 1

[State 8600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time < 16
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time = [16, 24)
time = 1
mul = 32 * (time -16), 32 * (time -16), 32 * (time -16)

[State 8600, Move Name: Custom Combo]
type = varset
trigger1 = !time && root, var(23) = 900
var(0) = 1

[State 8600, Move Name: Power Geyser]
type = varset
trigger1 = !time && (root, var(23) = [3000, 3099])
var(0) = 2

[State 8600, Move Name: Burning]
type = varset
trigger1 = !time && (root, var(23) = [3100, 3199])
var(0) = 3

[State 8600, Move Name: Over Heat Geyser]
type = varset
trigger1 = !time && (root, var(23) = [3200, 3299])
var(0) = 4

[State 8600, Move Name: MAX Triple Geyser]
type = varset
trigger1 = !time && (root, var(23) = [3050, 3099])
var(0) = 5

[State 8600, Move Name: MAX Over Heat Geyser]
type = varset
trigger1 = !time && (root, var(23) = [3252, 3299])
var(0) = 6

[State 8600, Move Name: Buster Wolf]
type = varset
trigger1 = !time && (root, var(23) = [3300, 3399])
var(0) = 7

[State 8600, Move Name: Trinity Geyser]
type = varset
trigger1 = !time && (root, var(23) = [3400, 3499])
var(0) = 8

[State 8600, Move Name: MAX Buster Wolf]
type = varset
trigger1 = !time && (root, var(23) = [3352, 3399])
var(0) = 7

[State 8600, Move Name: Rising Force]
type = varset
trigger1 = !time && (root, var(23) = [3502, 3599])
var(0) = 10

[State 8600, Move Name: MAX Burn]
type = varset
trigger1 = !time && (root, var(23) = [3150, 3199])
var(0) = 9

[State 8600, MvC]
type = explod
trigger1 = !time
anim = 8600
ID = 8600
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8600)
ID = 8600
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), 256

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 10
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 11
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), ifelse(time < 16, 0, 32 * (time -16))

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(11)
ID = 11
scale = 0.5 + (0.0625 * time), 0.5 + (0.0625 * time)
trans = addalpha
alpha = 256 - (32 * time), 32 * time

[State 8600, Circle]
type = explod
trigger1 = !time
anim = 8601
ID = 8601
under = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
bindtime = -1
removetime = 16
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8601)
ID = 8601
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8600, Assert]
type = assertspecial
trigger1 = time < 16
flag = noFG

[State 8600, Assert]
type = assertspecial
trigger1 = time < 24
flag = nobardisplay

[State 8600, End]
type = removeexplod
trigger1 = time >= 24
trigger2 = roundstate < 3

[State 8600, End]
type = destroyself
trigger1 = roundstate < 3


;====< CAMERA CONTROL >=
[Statedef 8999]
type = S
velset = 0, 0
anim = 9741

[State 8999, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
ignoreHitPause = 1

[State 8999, End]
type = destroyself
trigger1 = roundstate = 2
