; _________________________________________
;| CVS Choi Bounge by Falcon Rapper        |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SPECIAL MOVES>====
;==

;---------------------------------------------------------------------------
; Tatsumaki Shippuzan
[Statedef 1000]
type=A
movetype=A
physics=N
velset=0,0
anim=1000
ctrl=0
poweradd=72 * !var(20)

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = !var(10) && time = 20 || var(10) && time = 30
value = 1001
ignorehitpause = 1

[State 1100, VarSet]
type = VarSet
triggerall = prevstateno != 750
triggerall = AILevel<1
trigger1 = !Time
var(10) = ifelse((Command = "Tatsumaki Shippuzan1"),0, ifelse(Command = "Tatsumaki Shippuzan2", 1, 2))
[State 1100, VarSet]
type = VarSet
triggerall = prevstateno != 750
triggerall = AILevel
trigger1 = !Time
var(10) = 2
[State 1100, VarSet]
type = VarSet
triggerall = prevstateno = 750
triggerall = AILevel<1
trigger1 = !Time
var(10) = 2
[State 1100, VarSet]
type = VarSet
triggerall = prevstateno = 750
triggerall = AILevel
trigger1 = !Time
var(10) = 2

[State 100, Helper]
type = Helper
triggerall = !numhelper(1005)
trigger1=AnimElem=2
id = 1005
stateno=1005
pos = 10, 5
postype = p1
keyctrl = 0
ownpal = 1
size.xScale=.5
size.yScale=.5
ignorehitpause = 0

[State 1000,2]
type=PlaySnd
trigger1 = !time
value=S1000,0
channel=0

[State 1000,2]
type=PlaySnd
triggerall = time > 2
trigger1 = time%5=0
value=S1000,1
channel = 11
[State 0, StopSnd]
type = StopSnd
trigger1 = anim=1001&&time > 5
channel = 11

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 3
y = -3 - (var(10) * 1)
[State 1100, Velocity]
type = VelSet
trigger1 = time < 4
x = 0 + (var(10) * 8)
[State 1100, Velocity]
type = VelSet
trigger1 = time >= 4
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = anim = 1001
y = 0

[State 102, Dust]
type = helper
trigger1 = !time
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1
[State 102, Dust]
type = helper
trigger1 = !time
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000,1]
type=HitDef
trigger1=Time>4
trigger1=UniqHitCount<ifelse(var(10) = 0,3,ifelse(var(10) = 1,5,7))
damage = IfElse(var(10) = 2,46/(2**UniqHitCount),IfElse(var(10) = 1,44/(2**UniqHitCount),46/(2**UniqHitCount))),3
persistent=4
attr=A,SA
animtype=Light
hitflag=MAF
guardflag=MA
priority=4,Hit
pausetime=4,5
guard.pausetime=5,5
ground.slidetime=9
guard.slidetime=12
ground.hittime=9
air.hittime=12
ground.type=Low
ground.velocity=-4,-6
guard.velocity=-8
airguard.velocity=-8,-1
air.velocity=-2,-6
yaccel=Ifelse(var(20),.4,.5)
getpower=ifElse(PrevStateNo=750, 0, 20 * !var(20)),ifElse(PrevStateNo=750, 0, 20 * !var(20))
givepower=10,5
fall=1
fall.recover=0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=120), var(36):=-33
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1000,End]
type=ChangeState
trigger1 =anim=1001&&!animtime
value=1001

[Statedef 1001]
type = A
physics = N
movetype = I
sprpriority = 1
anim = 1002

[State 0, StopSnd]
type = StopSnd
trigger1 = 1
channel = 11

[State 0, VelSet]
type = VelSet
trigger1 = 1 
x = 0

[State 50, No Guard]
type = assertspecial
trigger1 = var(3) = [1, 2]
flag = noairguard
ignoreHitPause = 1

[State 50, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 40
value = 1

[State 50, Accel]
type = gravity
trigger1 = time >= 1 || prevstateno != 40

[State 50, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52
;---------------------------------------------------------------------------
; EX Tatsumaki Shippuzan
[Statedef 1050]
type=S
movetype=A
physics=N
velset=0,0
anim=1000
ctrl=0
poweradd=-500

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1=Time=3
anim=8210
sprPriority=3
posType=p1
pos=0,-38
scale=0.5,0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = time = 35
value = 1001
ignorehitpause = 1

[State 100, Helper]
type = Helper
triggerall = !numhelper(1005)
trigger1=AnimElem=2
id = 1005
stateno=1005
pos = 10, 5
postype = p1
keyctrl = 0
ownpal = 1
size.xScale=.5
size.yScale=.5
ignorehitpause = 0

[State 1000,2]
type=PlaySnd
trigger1 = !time
value=S1000,0
channel=0

[State 1000,2]
type=PlaySnd
triggerall = time > 2
trigger1 = time%5=0
value=S1000,1
channel = 11
[State 0, StopSnd]
type = StopSnd
trigger1 = anim=1001&&time > 5
channel = 11

[State 1100, Velocity]
type = VelSet
trigger1 = AnimElem = 3
y = -6
[State 1100, Velocity]
type = VelSet
trigger1 = time < 4
x = 12
[State 1100, Velocity]
type = VelSet
trigger1 = time >= 4
x = 0
[State 0, VelSet]
type = VelSet
trigger1 = anim = 1001
y = 0

[State 102, Dust]
type = helper
trigger1 = !time
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1
[State 102, Dust]
type = helper
trigger1 = !time
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1000,1]
type=HitDef
trigger1=Time>1
trigger1=UniqHitCount<9
damage=Ifelse(!movecontact,94,2),4
persistent=4
attr=A,SA
animtype=Light
hitflag=MAF
guardflag=MA
priority=4,Hit
pausetime=4,4
guard.pausetime=5,5
ground.slidetime=9
guard.slidetime=12
ground.hittime=9
air.hittime=12
ground.type=Low
ground.velocity=-1.5,-6
guard.velocity=-8
airguard.velocity=-8,-1
air.velocity=-1.5,-7
yaccel=Ifelse(var(20),.4,.6)
getpower=0,0
givepower=10,5
fall=1
fall.recover=0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=120), var(36):=-33
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1000,End]
type=ChangeState
trigger1 =anim=1001&&!animtime
value=1001

;---------------------------------------------------------------------------
;Senpuu Hien Sashi
[Statedef 1100]
type = S
movetype=A
physics=N
poweradd=72 * !var(20)
velset = 0,0
anim = 1100
ctrl = 0
sprpriority = 2

[State 1100, VarSet]
type = VarSet
triggerall = AILevel<1
trigger1 = !Time
var(10)=ifelse(command="Senpuu Hien Sashi1",0,ifelse(command="Senpuu Hien Sashi2",1,2))
[State 1100, VarSet]
type = VarSet
triggerall = AILevel
trigger1 = !Time
var(10) = 2

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1100,0
channel = 0

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
var(2) = 0

[State 102, Dust]
type = helper
trigger1 = !animtime
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1050, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 1101

;------------------------UŒ‚“®ì
[Statedef 1101]
type = A
movetype= A
physics = N
velset = 9,ifelse(prevstateno=1203,-1,-4)
anim = ifelse(prevstateno = 1203 && fvar(3)=3,1130,1160)

[State 1051, 1]
type = VelSet
triggerall = prevstateno = 1203 && fvar(3)=3
trigger1 = Time = 0
x = 7
y = 4

[State 1000,2]
type=PlaySnd
trigger1 = time%5=0
value=S1000,1
channel = 11
[State 0, StopSnd]
type = StopSnd
trigger1 = time > 20
channel = 11

[State 1051, 1]
type = VelAdd
trigger1 = 1
y = .25

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
fvar(3) = 0

[State 861,VarAdd]
type = VarAdd
trigger1 = Time = 0
var(2) = 1

[State 1300,HitDef]
type = HitDef 
triggerall = (var(15)<5 || var(20))
trigger1 = Time = 0
attr = A, SA
animtype = Hard
damage = IfElse(var(10) = 0,40,IfElse(var(10) = 1,45,50)),3
getpower = ifelse(p2movetype=H,32,64) * !var(20),36 * !var(20)
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11
air.velocity = -4,-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-27
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 861,VarSet]
type = VarSet
triggerall = var(2) < 4 && fvar(3) = 0
trigger1 = (Command = "Direction Change_6" || Command = "Direction Change_9" || Command = "Direction Change_8" || Command = "Direction Change_7")
fvar(3) = IfElse(Command = "Direction Change_6",6,IfElse(Command = "Direction Change_9",9,IfElse(Command = "Direction Change_8",8,7)))

[State 861,VarSet]
type = VarSet
triggerall = var(2) < 4 && fvar(3) = 0
trigger1 = (Command = "Direction Change_4" || Command = "Direction Change_1" || Command = "Direction Change_2" || Command = "Direction Change_3")
fvar(3) = IfElse(Command = "Direction Change_4",4,IfElse(Command = "Direction Change_1",1,IfElse(Command = "Direction Change_2",2,3)))

[State 1051, 3]
type = ChangeState
trigger1 = fvar(3) != 0 && HitShakeOver = 1
value = 1105

[State 1051, 3]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1102

;------------------------’…’n
[Statedef 1102]
type = S
movetype= I
physics = S
anim = 1103
sprpriority = 1
velset = 0,0

[State 0, StopSnd]
type = StopSnd
trigger1 = 1
channel = 11

[State 1052, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1052, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------
; 
[Statedef 1105]
type = A
movetype = I
physics = N
anim = 1105
ctrl = 0
velset = 0,0

[State 0, StopSnd]
type = StopSnd
trigger1 = 1
channel = 11

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1100,1
channel = 0

[State 1305,PosFreeze]
type = PosFreeze
trigger1 = 1

[State 1052, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 1106
ctrl = 0

;------------------------“Ëi
[Statedef 1106]
type = A
movetype= A
physics = N
velset = 0,0
anim = 1100+floor(fvar(3)*10)
poweradd= ifelse((prevstateno = 1203 || prevstateno = 1213),ifelse(fvar(0) != 0,0,48),0)

[State 1000,2]
type=PlaySnd
trigger1 = time%5=0
value=S1000,1
channel = 11
[State 0, StopSnd]
type = StopSnd
trigger1 = time > 20
channel = 11

[State 1051, 1]
type = VelSet
trigger1 = Time = 0
x = IfElse((fvar(3)=3||fvar(3)=9),7,IfElse((fvar(3)=7||fvar(3)=1),-7,IfElse((fvar(3)=4),-9,IfElse(fvar(3)=6,9,0))))
y = IfElse((fvar(3)=[1,3]),6,IfElse((fvar(3)=[7,9]),-6,0))

[State 1051, 1]
type = VelAdd
triggerall = Time >= 10
trigger1 = anim = 1140 || anim = 1160
y = .25

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
sysvar(1) = IfElse((fvar(3)=1||fvar(3)=4||fvar(3)=7),-1,IfElse((fvar(3)=8||fvar(3)=2),0,1))

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
var(17) = floor(fvar(3))

[State 1051, 1]
type = VelAdd
trigger1 = anim = 1170 || anim = 1180 || anim = 1190
y = .08

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
fvar(3) = 0

[State 861,VarAdd]
type = VarAdd
trigger1 = Time = 0
var(2) = 1

[State 861,VarSet]
type = VarSet
triggerall = var(2) < 4 && fvar(3) = 0
trigger1 = (Command = "Direction Change_6" || Command = "Direction Change_9" || Command = "Direction Change_8" || Command = "Direction Change_7")
fvar(3) = IfElse(Command = "Direction Change_6",6,IfElse(Command = "Direction Change_9",9,IfElse(Command = "Direction Change_8",8,7)))

[State 861,VarSet]
type = VarSet
triggerall = var(2) < 4 && fvar(3) = 0
trigger1 = (Command = "Direction Change_4" || Command = "Direction Change_1" || Command = "Direction Change_2" || Command = "Direction Change_3")
fvar(3) = IfElse(Command = "Direction Change_4",4,IfElse(Command = "Direction Change_1",1,IfElse(Command = "Direction Change_2",2,3)))

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1110 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,12+2*var(10),60+2*var(10)),3
getpower = ifelse(p2movetype=H,32,64) * !var(20),36 * !var(20)
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-12
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1120 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,12+2*var(10),60+2*var(10)),3
getpower = ifelse(p2movetype=H,32,64) * !var(20),36 * !var(20)
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=0
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1130 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,12+2*var(10),60+2*var(10)),3
getpower = ifelse(p2movetype=H,32,64) * !var(20),36 * !var(20)
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-5
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1140 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,12+2*var(10),60+2*var(10)),3
getpower = ifelse(p2movetype=H,32,64) * !var(20),36 * !var(20)
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-27
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1160 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,12+2*var(10),60+2*var(10)),3
getpower = ifelse(p2movetype=H,32,64) * !var(20),36 * !var(20)
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-27
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1170 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,12+2*var(10),60+2*var(10)),3
getpower = ifelse(p2movetype=H,32,64) * !var(20),36 * !var(20)
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-59
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1180 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,12+2*var(10),60+2*var(10)),3
getpower = ifelse(p2movetype=H,32,64) * !var(20),36 * !var(20)
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-78
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1190 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,12+2*var(10),60+2*var(10)),3
getpower = ifelse(p2movetype=H,32,64) * !var(20),36 * !var(20)
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-58
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1051, 3]
type = ChangeState
trigger1 = fvar(3) != 0 && HitShakeOver = 1
value = 1105

[State 1051, 3]
type = ChangeState
triggerall = Time >= 18
trigger1 = anim = 1170 || anim = 1180 || anim = 1190
value = 1191

[State 1051, 3]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1102

;------------------------I—¹
[Statedef 1191]
type = A
movetype= I
physics = N
anim = 43
ctrl = 0

[State 830,veladd]
type = veladd
trigger1 = 1
y = .58

[State 830,veladd]
type = velset
trigger1 = Vel X > 0 && prevstateno = 1120
trigger2 = Vel X < 0 && prevstateno = 1140
x = 3*IfElse(prevstateno = 1120,1,-1)

[State 1301,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52
ctrl = 0

;---------------------------------------------------------------------------
; Ex Senpuu Hien Sashi
[Statedef 1150]
type = S
movetype=A
physics=N
poweradd=-500
velset = 0,0
anim = 1100
ctrl = 0
sprpriority = 2

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1=Time=3
anim=8210
sprPriority=3
posType=p1
pos=0,-38
scale=0.5,0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1100,0
channel = 0

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
var(2) = 0

[State 102, Dust]
type = helper
trigger1 = !animtime
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1050, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 1151

;------------------------UŒ‚“®ì
[Statedef 1151]
type = A
movetype= A
physics = N
velset = 9,ifelse(prevstateno=1253,-1,-4)
anim = 1160

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State 1000,2]
type=PlaySnd
trigger1 = time%5=0
value=S1000,1
channel = 11
[State 0, StopSnd]
type = StopSnd
trigger1 = time > 20
channel = 11

[State 1051, 1]
type = VelAdd
trigger1 = 1
y = .25

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
fvar(3) = 0

[State 861,VarAdd]
type = VarAdd
trigger1 = Time = 0
var(2) = 1

[State 1300,HitDef]
type = HitDef 
triggerall = (var(15)<5 || var(20))
trigger1 = Time = 0
attr = A, SA
animtype = Hard
damage = 60,3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -4,-9
air.velocity = -4,-9
yaccel = .45
fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-27
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 861,VarSet]
type = VarSet
triggerall = var(2) < 4 && fvar(3) = 0
trigger1 = (Command = "Direction Change_6" || Command = "Direction Change_9" || Command = "Direction Change_8" || Command = "Direction Change_7")
fvar(3) = IfElse(Command = "Direction Change_6",6,IfElse(Command = "Direction Change_9",9,IfElse(Command = "Direction Change_8",8,7)))

[State 861,VarSet]
type = VarSet
triggerall = var(2) < 4 && fvar(3) = 0
trigger1 = (Command = "Direction Change_4" || Command = "Direction Change_1" || Command = "Direction Change_2" || Command = "Direction Change_3")
fvar(3) = IfElse(Command = "Direction Change_4",4,IfElse(Command = "Direction Change_1",1,IfElse(Command = "Direction Change_2",2,3)))

[State 1051, 3]
type = ChangeState
trigger1 = fvar(3) != 0 && HitShakeOver = 1
value = 1155

[State 1051, 3]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1102

;---------------------------------------------------------------------


;------------------------
[Statedef 1155]
type = A
movetype = I
physics = N
anim = 1105
ctrl = 0
velset = 0,0

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State 0, StopSnd]
type = StopSnd
trigger1 = 1
channel = 11

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1100,1
channel = 0

[State 1305,PosFreeze]
type = PosFreeze
trigger1 = 1

[State 1052, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 1156
ctrl = 0

;------------------------“Ëi
[Statedef 1156]
type = A
movetype= A
physics = N
velset = 0,0
anim = 1100+floor(fvar(3)*10)
poweradd= ifelse((prevstateno = 1203 || prevstateno = 1213),ifelse(fvar(0) != 0,0,48),0)

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State 1000,2]
type=PlaySnd
trigger1 = time%5=0
value=S1000,1
channel = 11
[State 0, StopSnd]
type = StopSnd
trigger1 = time > 20
channel = 11

[State 1051, 1]
type = VelSet
trigger1 = Time = 0
x = IfElse((fvar(3)=3||fvar(3)=9),7,IfElse((fvar(3)=7||fvar(3)=1),-7,IfElse((fvar(3)=4),-9,IfElse(fvar(3)=6,9,0))))
y = IfElse((fvar(3)=[1,3]),6,IfElse((fvar(3)=[7,9]),-6,0))

[State 1051, 1]
type = VelAdd
triggerall = Time >= 10
trigger1 = anim = 1140 || anim = 1160
y = .25

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
sysvar(1) = IfElse((fvar(3)=1||fvar(3)=4||fvar(3)=7),-1,IfElse((fvar(3)=8||fvar(3)=2),0,1))

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
var(17) = floor(fvar(3))

[State 1051, 1]
type = VelAdd
trigger1 = anim = 1170 || anim = 1180 || anim = 1190
y = .08

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
fvar(3) = 0

[State 861,VarAdd]
type = VarAdd
trigger1 = Time = 0
var(2) = 1

[State 861,VarSet]
type = VarSet
triggerall = var(2) < 4 && fvar(3) = 0
trigger1 = (Command = "Direction Change_6" || Command = "Direction Change_9" || Command = "Direction Change_8" || Command = "Direction Change_7")
fvar(3) = IfElse(Command = "Direction Change_6",6,IfElse(Command = "Direction Change_9",9,IfElse(Command = "Direction Change_8",8,7)))

[State 861,VarSet]
type = VarSet
triggerall = var(2) < 4 && fvar(3) = 0
trigger1 = (Command = "Direction Change_4" || Command = "Direction Change_1" || Command = "Direction Change_2" || Command = "Direction Change_3")
fvar(3) = IfElse(Command = "Direction Change_4",4,IfElse(Command = "Direction Change_1",1,IfElse(Command = "Direction Change_2",2,3)))

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1110 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,20,60),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-12
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1120 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,20,60),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=0
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1130 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,20,60),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-5
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1140 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,20,60),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-27
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1160 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,20,60),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-27
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1170 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,20,60),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-59
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1180 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,20,60),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-78
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = anim= 1190 && !Time
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,20,60),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 12,18
guard.pausetime = 11,11
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4*var(9)
ground.velocity = -11*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1)
air.velocity = -4*ifelse((Facing =enemynear,Facing&&Var(17)!=9&&Var(17)!=6&&Var(17)!=3),-1,1),-9
yaccel = .45
air.fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-58
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1051, 3]
type = ChangeState
trigger1 = fvar(3) != 0 && HitShakeOver = 1
value = 1155

[State 1051, 3]
type = ChangeState
triggerall = Time >= 18
trigger1 = anim = 1170 || anim = 1180 || anim = 1190
value = 1191

[State 1051, 3]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1102

;---------------------------------------------------------------------
; Hishou Kuuretsu Zan
[Statedef 1200]
type = S
movetype= I
physics = S
poweradd=72 * !var(20)
velset = 0,0
anim = 1200
ctrl = 0

[State 1100, VarSet]
type = VarSet
triggerall = AILevel<1
trigger1 = !Time
var(10)=ifelse(command="Hishou Kuuretsu Zan1",0,ifelse(command="Hishou Kuuretsu Zan2",1,2))
[State 1100, VarSet]
type = VarSet
triggerall = AILevel
trigger1 = !Time
var(10) = 2

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1100, 0
channel = 0

[State 861,VarSet]
type = VarSet
triggerall = var(10) = 0
trigger1 = Command = "Hishou Kuuretsu Zan Adjust"
fvar(3) = 3

[State 861,VarSet]
type = VarSet
triggerall = var(10)
trigger1 = Command = "Hishou Kuuretsu Zan Adjust"
fvar(3) = 6

[State 861,VarSet]
type = VarSet
trigger1 = Command != "Hishou Kuuretsu Zan Adjust"
fvar(3) = 0

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
var(2) = 0

[State 1100,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = IfElse(Command = "holdupfwd",1202,1201)

;
[Statedef 1201]
type = A
movetype= I
physics = N
velset = -8,-7
anim = 1201
ctrl = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 3
value = 1100,2
persistent = 0

[State 1051, 1]
type = VelAdd
trigger1 = 1
y = .25

[State 1051, 1]
type = VelAdd
trigger1 = 1
x = -.25

[State 861,VarSet]
type = VarSet
trigger1 = Command != "Hishou Kuuretsu Zan Adjust"
fvar(3) = 0

[State 1201,ChangeState]
type = ChangeState
Trigger1 = Backedgebodydist <= 10
value = 1203

[State 1201,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1205

;------------------ã¸i‘O•ûj
[Statedef 1202]
type = A
movetype= I
physics = N
velset = 8,-7
anim = 1201
ctrl = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 3
value = 1100,2
persistent = 0

[State 1051, 1]
type = VelAdd
trigger1 = 1
y = .25

[State 1051, 1]
type = VelAdd
trigger1 = 1
x = .25

[State 861,VarSet]
type = VarSet
trigger1 = Command != "Hishou Kuuretsu Zan Adjust"
fvar(3) = 0

[State 1201,ChangeState]
type = ChangeState
Trigger1 = Frontedgebodydist <= 10
value = 1203

[State 1201,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1205

;------------------- ‰æ–Ê‚Í‚µ’£‚è•t‚«
[Statedef 1203]
type = A
movetype= I
physics = N
ctrl = 0
velset = 0,0
anim = 1202

[State 61, Jump Sound]
type = PlaySnd
trigger1 = !Time
value = 52,0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1100,2
persistent = 0

[State 1201,ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 870,Turn]
type = Turn
trigger1 = prevstateno = 1212 && Time = 0

[State 1202,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = Time = 7 && fvar(3) = 6
value = IfElse(fvar(3) >= 3,1101,1204)

;------------------‰º~
[Statedef 1204]
type = A
movetype= I
physics = N
velset = 0,2
anim = 1203

[State 1051, 1]
type = VelAdd
trigger1 = 1
y = .45

[State 1201,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1205

;------------------------’…’n
[Statedef 1205]
type = S
movetype= I
physics = S
anim = 47
sprpriority = 1
velset = 0,0

[State 1052, 1]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1052, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------
; EX Hishou Kuuretsu Zan
[Statedef 1250]
type = S
movetype=A
physics=N
poweradd=-500
velset = 0,0
anim = 1200
ctrl = 0

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1=!Time
anim=8210
sprPriority=3
posType=p1
pos=0,-38
scale=0.5,0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1100, 0
channel = 0

[State 861,VarSet]
type = VarSet
trigger1 = Command = "Hishou Kuuretsu Zan Adjust"
fvar(3) = 6

[State 861,VarSet]
type = VarSet
trigger1 = Command != "Hishou Kuuretsu Zan Adjust"
fvar(3) = 0

[State 861,VarSet]
type = VarSet
trigger1 = Time = 0
var(2) = 0

[State 1100,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = IfElse(Command = "holdupfwd",1252,1251)

;
[Statedef 1251]
type = A
movetype= I
physics = N
velset = -8,-7
anim = 1201
ctrl = 0

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 3
value = 1100,2
persistent = 0

[State 1051, 1]
type = VelAdd
trigger1 = 1
y = .25

[State 1051, 1]
type = VelAdd
trigger1 = 1
x = -.25

[State 861,VarSet]
type = VarSet
trigger1 = Command != "Hishou Kuuretsu Zan Adjust"
fvar(3) = 0

[State 1201,ChangeState]
type = ChangeState
Trigger1 = Backedgebodydist <= 10
value = 1253

[State 1201,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1205

;------------------ã¸i‘O•ûj
[Statedef 1252]
type = A
movetype= I
physics = N
velset = 8,-7
anim = 1201
ctrl = 0

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 3
value = 1100,2
persistent = 0

[State 1051, 1]
type = VelAdd
trigger1 = 1
y = .25

[State 1051, 1]
type = VelAdd
trigger1 = 1
x = .25

[State 861,VarSet]
type = VarSet
trigger1 = Command != "Hishou Kuuretsu Zan Adjust"
fvar(3) = 0

[State 1201,ChangeState]
type = ChangeState
Trigger1 = Frontedgebodydist <= 10
value = 1253

[State 1201,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1255

;------------------- ‰æ–Ê‚Í‚µ’£‚è•t‚«
[Statedef 1253]
type = A
movetype= I
physics = N
ctrl = 0
velset = 0,0
anim = 1202

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1100,2
persistent = 0

[State 1201,ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,0

[State 870,Turn]
type = Turn
trigger1 = prevstateno = 1212 && Time = 0

[State 1202,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
trigger2 = Time = 7 && fvar(3) = 6
value = IfElse(fvar(3) = 6,1151,1204)

;---------------------------------------------------------------------
;Kaiten Hienzan
[Statedef 1300]
type = S
movetype= A
physics = S
poweradd=72 * !var(20)
velset = 0,0
anim = 1300
ctrl = 0

[State 1100, VarSet]
type = VarSet
triggerall = AILevel<1
trigger1 = !Time
var(10)=ifelse(command="Kaiten Hienzan1",0,ifelse(command="Kaiten Hienzan2",1,2))
[State 1100, VarSet]
type = VarSet
triggerall = AILevel
trigger1 = !Time
var(10) = 2

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1300,0
channel = 0

[State 1305,Posadd]
type = Posadd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4
x = 8

[State 1305,Posadd]
type = Posadd
trigger1 = AnimElem = 5
x = 3

[State 102, Dust]
type = helper
trigger1 = AnimElem = 4
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 1301

;------------------------‰ñ“]
[Statedef 1301]
type = S
movetype= A
physics = N
velset = 1.5 + (var(10) * 1),0
anim = 1301
ctrl = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 1300,HitDef]
type = HitDef 
trigger1 = Time = 0
attr = A, SA
animtype = Hard
damage = IfElse(var(10) = 2,25/(2**UniqHitCount),IfElse(var(10) = 1,23/(2**UniqHitCount),20/(2**UniqHitCount))),3
getpower = ifelse(fvar(0) != 0,0,16),ifelse(fvar(0) != 0,0,16)
guardflag = MA
hitflag = M
pausetime = 2,4
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.velocity = -3.5,-6
yaccel = .45
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-21
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1100,ChangeState]
type = ChangeState
trigger1 = Command = "x" || Command = "y"  || Command = "z" && !MoveContact
value = 1310

[State 1100,ChangeState]
type = ChangeState
trigger1 = MoveContact || Time = 33
value = IfElse(MoveContact=1,1302,1304)

;------------------------‰ñ“]ã¸
[Statedef 1302]
type = A
movetype= A
physics = N
velset = 0,-2
ctrl = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 820,ChangeAnim]
type = ChangeAnim
trigger1 = anim != 1301
value = 1301

[State 861,VelSet]
type = VelSet
trigger1 = 1
x = 1.8

[State 1300,HitDef]
type = HitDef 
triggerall = (var(15)<5 || var(20))
trigger1 = UniqHitCount<ifelse(var(10) = 0,4,ifelse(var(10) = 1,6,8)) && TimeMod = 8, 0
attr = A, SA
animtype = Hard
damage = IfElse(var(10) = 2,26/(2**UniqHitCount),IfElse(var(10) = 1,23/(2**UniqHitCount),20/(2**UniqHitCount))),3
getpower = ifelse(fvar(0) != 0,0,16),ifelse(fvar(0) != 0,0,16)
guardflag = M
hitflag = MAF
pausetime = 2,1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -2
air.velocity = -3.5,-6
yaccel = .45
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-21
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = UniqHitCount < 8 && TimeMod = 8, 4
attr = A, SA
animtype = Hard
damage = Ceil(40 / (2 ** HitCount)),5
getpower = IfElse(var(39)=1,16,2),2
guardflag = M
hitflag = MAF
pausetime = 2,1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.velocity = -3.5,-6
yaccel = .45
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-21
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1100,ChangeState]
type = ChangeState
trigger1 = Time = 25
value = 1303

;------------------ƒWƒƒƒ“ƒv
[Statedef 1303]
type = A
movetype= I
physics = N
velset = -2.6,-9.5
anim = 43

[State 1051, 1]
type = VelAdd
trigger1 = 1
y = .58

[State 1201,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;------------------------I—¹
[Statedef 1304]
type = S
movetype= A
physics = S
velset = 0,0
anim = 40
ctrl = 0

[State 1305,PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 52,0

[State 1100,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;------------------------ŠJŽn“®ì
[Statedef 1310]
type = A
movetype= A
physics = N
velset = 6,-3
anim = 1310

[State -3, EX Flash]
type=PalFX
trigger1=var(10)=3&&!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 2
value = 1300,1
channel = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2,=0
value = 1100,2
persistent = 0

[State 1051, 1]
type = VelAdd
trigger1 = 1
y = .3

[State 1300,HitDef]
type = HitDef 
trigger1 = Time = 0
attr = A, SA
animtype = Hard
damage = 72 + (var(10) * 6),19
getpower = ifelse(fvar(0) != 0,0,96),ifelse(fvar(0) != 0,0,96)
guardflag = M
hitflag = MAF
pausetime = 10,12
guard.pausetime = 11,11
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -2.7,-6
guard.velocity = -6
air.velocity = -2.7,-6
yaccel = .45
fall = 1
fall.recover = 1
air.cornerpush.veloff = 0
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-43
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1201,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

;---------------------------------------------------------------------
; EX Kaiten Hienzan
[Statedef 1350]
type = S
movetype= A
physics = S
poweradd=-500
velset = 0,0
anim = 1300
ctrl = 0

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1=Time=3
anim=8210
sprPriority=3
posType=p1
pos=0,-38
scale=0.5,0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1300,0
channel = 0

[State 1305,Posadd]
type = Posadd
trigger1 = AnimElem = 2 || AnimElem = 3 || AnimElem = 4
x = 8

[State 1305,Posadd]
type = Posadd
trigger1 = AnimElem = 5
x = 3

[State 102, Dust]
type = helper
trigger1 = AnimElem = 4
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 1351

;------------------------‰ñ“]
[Statedef 1351]
type = S
movetype= A
physics = N
velset = 2.5,0
anim = 1301
ctrl = 0

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 1300,HitDef]
type = HitDef 
trigger1 = Time = 0
attr = A, SA
animtype = Hard
damage = 30/(2 ** HitCount),3
getpower = 0,0
guardflag = MA
hitflag = M
pausetime = 2,4
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.velocity = -3.5,-6
yaccel = .45
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-21
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1100,ChangeState]
type = ChangeState
trigger1 = Command = "x" || Command = "y"  || Command = "z" && !MoveContact
value = 1310

[State 1100,ChangeState]
type = ChangeState
trigger1 = MoveContact || Time = 33
value = IfElse(MoveContact=1,1352,1304)

;------------------------‰ñ“]ã¸
[Statedef 1352]
type = A
movetype= A
physics = N
velset = 0,-2
ctrl = 0

[State -3, EX Flash]
type=PalFX
trigger1=!(GameTime % 2)
time=1
color=0
mul=256, 224, 0
add=128, 128, 128
ignoreHitPause=1

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000,1
channel = 1

[State 820,ChangeAnim]
type = ChangeAnim
trigger1 = anim != 1301
value = 1301

[State 861,VelSet]
type = VelSet
trigger1 = 1
x = 1.8

[State 1300,HitDef]
type = HitDef 
triggerall = (var(15)<5 || var(20))
trigger1 = UniqHitCount < 9 && TimeMod = 8, 0
attr = A, SA
animtype = Hard
damage = 30/(2 ** HitCount),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 2,1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -2
air.velocity = -3.5,-6
yaccel = .45
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-21
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1 = UniqHitCount < 9 && TimeMod = 8, 4
attr = A, SA
animtype = Hard
damage = Ceil(40 / (2 ** HitCount)),5
getpower = IfElse(var(39)=1,16,2),2
guardflag = M
hitflag = MAF
pausetime = 2,1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.velocity = -3.5,-6
yaccel = .45
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=70), var(36):=-21
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1100,ChangeState]
type = ChangeState
trigger1 = Time = 36
value = 1303

;Hishou Kyaku
[Statedef 1400]
type = A
movetype= A
physics = N
velset = 0,0
poweradd=72 * !var(20)
anim = 1400
ctrl = 0

[State 1100, VarSet]
type = VarSet
triggerall = AILevel<1
trigger1 = !Time
var(10)=ifelse(command="Hishou Kyaku1",0,ifelse(command="Hishou Kyaku2",1,2))
[State 1100, VarSet]
type = VarSet
triggerall = AILevel
trigger1 = !Time
var(10) = 2

[State 1100,ChangeState]
type = Changeanim
trigger1 = !Animtime
value = 1401

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1400,0
channel = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 =AnimElem = 2
value = 1,4

[State 830,veladd]
type = VelSet
trigger1 =anim = 1401&&AnimElem = 1
x = 2 + (var(10) * 2)
y = 9 - (var(10) * 2)

[State 1300,HitDef]
type = HitDef 
trigger1 = (AnimElem = 2 || AnimElem = 4) && anim = 1401
attr = A, SA
animtype = Hard
damage = IfElse(var(10) = 2,46/(2**UniqHitCount),IfElse(var(10) = 1,44/(2**UniqHitCount),43/(2**UniqHitCount))),3
getpower = ifelse(fvar(0) != 0,0,16),ifelse(fvar(0) != 0,0,16)
guardflag = M
hitflag = MAF
pausetime = 4,4
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4 - (var(10) * 2)
air.velocity = -3,-6
yaccel = .45
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33) := 8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=100), var(36):=-22
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1201,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

; EX Hishou Kyaku Start
[Statedef 1450]
type = A
movetype= A
physics = N
velset = 0,0
poweradd=-500
anim = 1400
ctrl = 0

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1=Time=3
anim=8210
sprPriority=3
posType=p1
pos=0,-38
scale=0.5,0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State 1100,ChangeState]
type = Changeanim
trigger1 = !Animtime
value = 1401

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1400,0
channel = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 =AnimElem = 2
value = 1,4

[State 830,veladd]
type = VelSet
trigger1 =anim = 1401&&AnimElem = 1
x = 6
y = 4

[State 1300,HitDef]
type = HitDef 
trigger1 = (AnimElem = 2 || AnimElem = 4) && anim = 1401
attr = A, SA
animtype = Hard
damage = 52/(2**UniqHitCount),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 4,4
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4 - (var(10) * 2)
air.velocity = -3,-6
yaccel = .45
air.cornerpush.veloff = 0
ground.cornerpush.veloff = 0
air.fall = 1
fall.recover = 1
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33) := 8013)
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10 + 0*(var(35):=100), var(36):=-22
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1201,ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

; Hienzan
[Statedef 1500]
type = S
movetype= A
physics = N
poweradd=72 * !var(20)
velset = 0,0
anim = 1500
ctrl = 0

[State 1100, VarSet]
type = VarSet
triggerall = AILevel<1
trigger1 = !Time
var(10)=ifelse(command="Hienzan1",0,ifelse(command="Hienzan2",1,2))
[State 1100, VarSet]
type = VarSet
triggerall = AILevel
trigger1 = !Time
var(10) = 2

[State 600, Snd]
type=playsnd
trigger1= !time
value= 4,2
channel=0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1,5
persistent = 0

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
statetype = A
physics = N

[State 1305,VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 2.5
y = -6 - (var(10) * 2)

[State 1051, 1]
type = VelAdd
trigger1 = AnimElem = 5,> 0
y = .5

[State 1300,HitDef]
type = HitDef 
trigger1=var(10)=0&&AnimElem=4
trigger2=var(10)=0&&AnimElem=6&&!movecontact
attr=A, SA
damage=80,8
priority=4, hit
animtype=Hard
getpower=16* !var(20),8* !var(20)
givepower=15, 15
guardflag=MA
hitflag=MAF
hitsound = S2+10*var(44),5
guardsound = S3,0
pauseTime=ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime=ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo=-1 + 0 * (var(33) :=8013)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) := 120), var(36) := Ifelse((animelem=6||animelem=7),-75,-55)
air.animtype=Up
fall.animtype=Back
ground.type=High
air.type=Low
ground.slidetime=12
ground.hittime =12
guard.hittime=12
ground.velocity=Ifelse(var(20),-1,-3),-10
air.velocity=Ifelse(var(20),-1,-3),-8
guard.velocity=Ifelse(var(20),-2.5,-5)
airguard.velocity=Ifelse(var(20),-2.5,-5), -3
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
fall=1
yaccel=Ifelse(var(20),.4,.5)
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1=AnimElem=4&&var(10)
attr=S, SA
damage=Ifelse(!movecontact,80,4),4
priority=4, hit
animtype=Hard
getpower=16* !var(20),8* !var(20)
givepower=15, 15
guardflag=M
hitflag=MAF
hitsound = S2+10*var(44),5
guardsound = S3,0
pauseTime=ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime=ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
sparkNo=-1 + 0 * (var(33) :=8013)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=150), var(36) :=-55
air.animtype=Up
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=12
ground.velocity=Ifelse(var(20),-1,-3),-5
air.velocity=Ifelse(var(20),-1,-3),-3
guard.velocity=Ifelse(var(20),-2.5,-5)
airguard.velocity=Ifelse(var(20),-2.5,-5), -3
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
fall=1
air.fall=1
yaccel=Ifelse(var(20),.4,.5)
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1=AnimElem=5&&var(10)=2
trigger2=AnimElem=6&&var(10)
attr=A, SA
damage=Ifelse(!movecontact,80,4),4
priority=4, hit
animtype=Hard
getpower=16* !var(20),8* !var(20)
givepower=15, 15
guardflag=MA
hitflag=MAF
hitsound = S2+10*var(44),5
guardsound = S3,0
pauseTime=ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime=ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo=-1 + 0 * (var(33) :=8013)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) := 120), var(36) := Ifelse((animelem=6||animelem=7),-75,-55)
air.animtype=Up
fall.animtype=Back
ground.type=High
air.type=Low
ground.slidetime=12
ground.hittime =12
guard.hittime=12
ground.velocity=Ifelse(var(20),-1,-3),-10
air.velocity=Ifelse(var(20),-1,-3),-8
guard.velocity=Ifelse(var(20),-2.5,-5)
airguard.velocity=Ifelse(var(20),-2.5,-5), -3
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
fall=1
yaccel=Ifelse(var(20),.4,.5)
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(8) >= 0
moveType = I

[State 1201,ChangeState]
type = ChangeState
trigger1 = AnimElem = 5,> 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1505

[Statedef 1505]
type = S
movetype= I
physics = S
velset = 0,0
anim = 1505
ctrl = 0

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 52,0

[State 52, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1305,PosSet]
type = PosSet
trigger1 = Time = 0
y = 0

[State 1100,ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; EX Hienzan
[Statedef 1550]
type = S
movetype= A
physics = N
poweradd=-500
velset = 0,0
anim = 1550
ctrl = 0

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1=!Time
anim=8210
sprPriority=3
posType=p1
pos=0,-38
scale=0.5,0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State 600, Snd]
type=playsnd
trigger1= !time
value= 4,2
channel=0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = 1,5
persistent = 0

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
statetype = A
physics = N

[State 1305,VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 2.5
y = -4

[State 1051, 1]
type = VelAdd
trigger1 = AnimElem = 13,> 0
y = .5

[State 1300,HitDef]
type = HitDef 
trigger1=AnimElem=4
attr=S, SA
damage=Ifelse(!movecontact,95,5),4
priority=4, hit
animtype=Hard
getpower=0,0
givepower=15, 15
guardflag=M
hitflag=MAF
hitsound = S2+10*var(44),5
guardsound = S3,0
pauseTime=ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime=ifElse(var(20), 6, 12), ifElse(var(20), 6, 12)
sparkNo=-1 + 0 * (var(33) :=8013)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=150), var(36) :=-55
air.animtype=Up
fall.animtype=Back
ground.type=Low
air.type=Low
ground.slidetime=18
ground.hittime =18
guard.hittime=12
ground.velocity=Ifelse(var(20),-1,-3)
air.velocity=Ifelse(var(20),-1,-3),-3
guard.velocity=Ifelse(var(20),-2.5,-5)
airguard.velocity=Ifelse(var(20),-2.5,-5), -3
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
fall=0
air.fall=1
yaccel=Ifelse(var(20),.4,.5)
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1300,HitDef]
type = HitDef 
trigger1=animelem=5||animelem=6||animelem=12
attr=A, SA
damage=Ifelse(!movecontact,95,5),4
priority=4, hit
animtype=Hard
getpower=0,0
givepower=15, 15
guardflag=MA
hitflag=MAF
hitsound = S2+10*var(44),5
guardsound = S3,0
pauseTime=ifElse(var(20), 4, 8), ifElse(var(20), 4, 8)
guard.pauseTime=ifElse(var(20), 3, 6), ifElse(var(20), 3, 6)
sparkNo=-1 + 0 * (var(33) :=8013)
guard.sparkNo=-1 + 0 * (var(34) :=8001)
sparkXY=-10 + 0 * (var(35) :=160), var(36) :=-82
air.animtype=Up
fall.animtype=Back
ground.type=High
air.type=Low
ground.slidetime=12
ground.hittime =12
guard.hittime=12
ground.velocity=Ifelse(var(20),-1,-3),-10
air.velocity=Ifelse(var(20),-1,-3),-8
guard.velocity=Ifelse(var(20),-2.5,-5)
airguard.velocity=Ifelse(var(20),-2.5,-5), -3
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
fall=1
yaccel=Ifelse(var(20),.4,.5)
fall.recover=0
forcestand=1
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd=-255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(14) >= 0
moveType = I

[State 1201,ChangeState]
type = ChangeState
trigger1 = AnimElem = 5,> 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1505

; Hishou Shissou Zan
[Statedef 1600]
type = S
movetype= A
physics = N
poweradd=72 * !var(20)
velset = 0,0
anim = 1600
ctrl = 0

[State 1100, VarSet]
type = VarSet
triggerall = AILevel<1
trigger1 = !Time
var(10)=ifelse(command="Hishou Shissou Zan1",0,ifelse(command="Hishou Shissou Zan2",1,2))
[State 1100, VarSet]
type = VarSet
triggerall = AILevel
trigger1 = !Time
var(10) = 2

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 1600,0
persistent = 0

[State 1000, 0]
type = HitBy
trigger1 = animelemno(0)<5
value = SCA,NT,ST,HT

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5,=-1
value = 1, 12

[State 1305,VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 8.5

[State 102, Snd]
type = playsnd
trigger1 = AnimElem = 4
value = 110,0
[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 6 || AnimElem = 8 || AnimElem = 10)
value = 100, ifElse((AnimElem = 8), 0, 1)

[State 102, Dust]
type = helper
trigger1 = AnimElem = 5
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1201,ChangeState]
type = ChangeState
trigger1 = Time>=26 + (var(10) * 3) || P2bodydist X < 10
value = 1601

;------------------------‹ó’†“®ì
[Statedef 1601]
type = A
movetype= A
physics = N
velset = 0,0
anim = 1601
ctrl = 0

[State 40, Snd]
type = playsnd
trigger1 = !time
value = 40, 0
[State 40, Dust]
type = helper
trigger1 = !time
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 900]
type = VelSet
trigger1 = AnimElem=2
x = 1
y = -10;ifelse(var(1)=2,-13,ifelse(var(1)=1,-11.5,-10))

[State 900]
type = VelAdd
trigger1 = AnimElemTime(2)>=0
y = .5

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
anim = 1605
id = 1605
pos = -30, 0
postype = p1
ownpal = 1
bindtime = 1
pausemovetime = -1
supermove = 1
ignorehitpause = 1
sprpriority = 3

[State 1051, 1]
type = VelAdd
trigger1 = AnimElem = 5,> 0
y = .52

[State 1300,HitDef]
type = HitDef 
trigger1 = Time = 0
attr = A, SA
animtype = Hard
damage = 76+6*var(10),3
getpower = ifelse(fvar(0) != 0,0,64),ifelse(fvar(0) != 0,0,64)
guardflag = M
hitflag = MAF
pausetime = 2,2
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.3,-7
guard.velocity = -6
air.velocity = -4.3,-7
yaccel = .45
fall = 1
fall.recover = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=100), var(36):=-51
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1201,ChangeState]
type = ChangeState
trigger1 = AnimElem = 5,> 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52

; Hishou Shissou Zan
[Statedef 1650]
type = S
movetype= A
physics = N
poweradd=-500
velset = 0,0
anim = 1600
ctrl = 0

[State 1110, VarSet]
type = VarSet
trigger1 =!time
var(10) = 3
ignorehitpause = 1
[State 1110, MAX Timer Drain]
type=VarAdd
trigger1=!Time
trigger1=var(20) > 0
var(20)=-250
[State 1110, Custom Combo Juggle Reset]
type=VarSet
trigger1=!Time && var(20)
var(15)=0
ignoreHitPause=1
[State 1110, EX Flash]
type=VarSet
trigger1=!Time
var(25)=30
[State 1110, EX FX]
type=Explod
trigger1=!Time
anim=8210
sprPriority=3
posType=p1
pos=0,-38
scale=0.5,0.5
pauseMoveTime=-1
superMoveTime=-1
bindtime = -1
ownPal=1
[State 1110, EX-SND]
type=PlaySnd
trigger1 =!time
value=0,1000
channel=3

[State -3,PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 1600,0
persistent = 0

[State 1000, 0]
type = HitBy
trigger1 = animelemno(0)<5
value = SCA,NT,ST,HT

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5,=-1
value = 1, 12

[State 1305,VelSet]
type = VelSet
trigger1 = AnimElem = 5
x = 8.5

[State 102, Snd]
type = playsnd
trigger1 = AnimElem = 4
value = 110,0
[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 6 || AnimElem = 8 || AnimElem = 10)
value = 100, ifElse((AnimElem = 8), 0, 1)


[State 102, Dust]
type = helper
trigger1 = AnimElem = 5
stateno = 8103
ID = 8100
name = "Dash Dust"
pos = 0,10
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1201,ChangeState]
type = ChangeState
trigger1 = Time>=26 + (var(10) * 3) || P2bodydist X < 10
value = 1651

;------------------------‹ó’†“®ì
[Statedef 1651]
type = S
movetype= A
physics = N
velset = 0,0
anim = 1601
ctrl = 0

[State 40, Snd]
type = playsnd
trigger1 = !time
value = 40, 0
[State 40, Dust]
type = helper
trigger1 = !time
stateno = 8100
ID = 8100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 900]
type = VelSet
trigger1 = AnimElem=2
x = 1
y = -10;ifelse(var(1)=2,-13,ifelse(var(1)=1,-11.5,-10))

[State 900]
type = VelAdd
trigger1 = AnimElemTime(2)>=0
y = .5

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
statetype = A

[State 1000, Spark]
type = Explod
trigger1 = AnimElem=2
anim = 1605
id = 1605
pos = -30, 0
postype = p1
ownpal = 1
bindtime = 1
pausemovetime = -1
supermove = 1
ignorehitpause = 1
sprpriority = 3

[State 1051, 1]
type = VelAdd
trigger1 = AnimElem = 5,> 0
y = .52

[State 1300,HitDef]
type = HitDef 
trigger1= Animelem=3||Animelem=4
attr = A, SA
animtype = Hard
damage=Ifelse(p2movetype=H,10,90),3
getpower = 0,0
guardflag = M
hitflag = MAF
pausetime = 6,6
guard.pausetime = 6,6
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.3,-7
guard.velocity = -6
air.velocity = -4.3,-7
yaccel = .45
fall = 1
fall.recover = 1
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0*(var(35):=100), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)

[State 1201,ChangeState]
type = ChangeState
trigger1 = AnimElem = 5,> 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52