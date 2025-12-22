; ________________________________________________
;| Dan by Phantom.of.the.Server and Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===< HELPER STATES >====
;==

;====< PALETTE SELECTOR >=
;Palette Selector
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
fvar(0)=root,fvar(0)

[State 256, Varset]
type=varset
trigger1=fvar(0)<1||fvar(0)>40
fvar(0)=1+(fvar(0)<1)*39

[State 256, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S256,0
volumescale = 50
channel = 20
[State 256, PlaySnd]
type = PlaySnd
triggerall=ishelper(256)
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="start"||roundstate=2
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
fvar(0)=1-(root,command="holddown"||root,command="holdback"&&facing=1||root,command="holdfwd"&&facing=-1)*2

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
trigger1=root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="start"||roundstate=2
trigger2=var(29)<=0
trigger3=root,AILevel


;====< GADOU KEN >=
; Gadouken
[Statedef 1005]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1007
ignorehitpause = 1
[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 1005, timevar]
type = varadd
trigger1 = time && var(1) < 60
var(1) = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3))
y = 0

[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(70 * (root, fvar(12))), 7
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -3, -3
air.fall = 1
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
fall.recover = 1
fall.recovertime = 22

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(59))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1005, End]
type = changestate
trigger1 = var(1) >= ifelse(var(10) = 3, 8, ifelse(var(10) = 2, 12, 16)) * ifelse(root, var(1)>1,1.5,1)
value = 1006
ignorehitpause = 1
[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1007
ignorehitpause = 1
[State 1005, End]
type = destroyself
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]

[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 1006, Vel]
type = velmul
trigger1 = 1
x = 0.8
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1000, Snd]
type = playsnd
trigger1 = time = 10
value = 5, 15
[State 1006, End]
type = destroyself
trigger1 = !animtime

[Statedef 1007]
type = A
physics = N
movetype = I
anim = 1007
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1

[State 1007, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 1260, ExFX]
type = explod
trigger1 = !time
anim = 1007
sprpriority = 4
postype = p1
pos = 0,0
scale = 0.5, 0.5
pausemovetime = 0
supermovetime = 0
ownpal = 0

[State 1007, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1007, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1007, End]
type = destroyself
trigger1 = !animtime


;====< SAIKYO GADOU KEN >=
; Saikyo Gadouken
[Statedef 1015]
type = S
physics = N
movetype = A
anim = 1015
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1015, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 2, 1015, 1017)
ignorehitpause = 1
[State 1015, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1015, Strength]
type = varset
trigger1 = !time
var(10) = 4
[State 1015, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 1005, timevar]
type = varadd
trigger1 = time
var(1) = 1
ignorehitpause = 0

[State 1015, Vel]
type = velset
trigger1 = 1
x = 7
y = 0

[State 1015, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1015, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 2
length = 5
palbright = 40, 20, 0
palmul = 0.75, 0.6, 0.5
palcontrast = 220, 140, 80
trans = add

[State 1015, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 1015, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse(var(2) < 2, 35, 70) * (root, fvar(12))), 7
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = ifelse(var(2) < 2, 3,0), 12
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -3
ground.cornerpush.veloff = 0
air.velocity = -6, -3
guard.velocity = -10.52
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 1
fall.recovertime = 20
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(59))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1015, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1005, End]
type = changestate
trigger1 = var(1) >= 12 * ifelse(root, var(1)>1,1.5,1) && time
value = 1016
ignorehitpause = 1
[State 1015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 2, 1015, 1017)
ignorehitpause = 1
[State 1015, End]
type = destroyself
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]

;====< SHAKUNETSU GADOU KEN >=
; Shakunetsu
[Statedef 1025]
type = S
physics = N
movetype = A
anim = 1015
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1015, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 2, 1025, 1017)
ignorehitpause = 1
[State 1015, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1005, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1015, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 1005, timevar]
type = varadd
trigger1 = time
var(1) = 1
ignorehitpause = 0

[State 1015, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3))
y = 0

[State 1015, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1015, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 2
length = 5
palbright = 40, 20, 0
palmul = 0.75, 0.6, 0.5
palcontrast = 220, 140, 80
trans = add

[State 1015, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 1015, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = 70* (root, fvar(12)), 14
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -3*(time <= 12)
ground.cornerpush.veloff = 0
air.velocity = -6, -3
guard.velocity = -10.52
getpower = 0
givepower = 36, 36
fall = (time <= 12)
fall.recover = 1
fall.recovertime = 20
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 32
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(59))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1015, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1015, End]
type = changestate
trigger1 = var(1) >= ifelse(var(10) = 3, 12, ifelse(var(10) = 2, 18, 24)) * ifelse(root, var(1)>1,1.5,1)
value = 1016
ignorehitpause = 1
[State 1015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 2 && target, ishelper = 1, 1015, 1017)
ignorehitpause = 1
[State 1015, End]
type = destroyself
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]

[Statedef 1016]
type = A
physics = N
movetype = I
anim = 1016
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 1016, Vel]
type = velmul
trigger1 = 1
x = 0.8
[State 1016, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1016, End]
type = destroyself
trigger1 = !animtime

[Statedef 1017]
type = A
physics = N
movetype = I
anim = 1017
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 1017, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1017, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1017, End]
type = destroyself
trigger1 = !animtime


;====< PREMIUM SIGN >=
; Premium Sign
[Statedef 1305]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 1305, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1306
ignorehitpause = 1
[State 1305, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1305, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1305, Anim]
type = changeanim
trigger1 = (anim != [1305, 1307])
value = 1304 + var(10)

[State 1305, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1305, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 3, 5, ifelse(var(10) = 2, 4.5, 4))
y = ifelse(var(10) = 3, 3, ifelse(var(10) = 2, -2, -1))
[State 1305, Accel]
type = veladd
trigger1 = vel y = [ -10, 10]
y = ifelse(var(10) = 3, -.25, ifelse(var(10) = 2, 0.13, 0.25))

[State 1305, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 4-moveguarded*4
persistent = 0
ignorehitpause = 1

[State 1305, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = ceil(40 * (root, fvar(12))), 15
animtype = Medium
hitflag = MAF
guardflag = H
pausetime = 0, 8
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7.51, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
sprpriority = 3
ID = 1305
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(59))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1305, End]
type = changestate
trigger1 = movecontact
value = 1306
ignorehitpause = 1
[State 1305, End]
type = changestate
trigger1 = pos y >= 0
value = 1307
[State 1305, End]
type = destroyself
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]

[Statedef 1306]
type = A
physics = N
movetype = I
velset = -vel x, vel y
ctrl = 0
sprpriority = 3
movehitpersist = 1

[State 1306, custom]
type = targetstate
triggerall = movecontact && numtarget
triggerall = !(target, ishelper) && !(target, alive)
trigger1 = (target, prevstateno = [5000, 5011])
trigger2 = (target, prevstateno = [130, 131]) || (target, prevstateno = [140, 141]) || (target, prevstateno = [150, 153])
value = 1111305
ID = 1305
ignorehitpause = 1

[State 1306, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -12.8 * time), ceil(12.8 * time)
[State 1306, Pos]
type = posset
trigger1 = pos y >= 0
y = 0
[State 1306, Vel]
type = velset
trigger1 = pos y >= 0
x = 0
y = 0
[State 1306, Anim]
type = changeanim
trigger1 = pos y >= 0
value = anim
elem = animelemno(0)
[State 1306, End]
type = destroyself
trigger1 = time >= 20

[Statedef 1307]
type = A
physics = N
movetype = I
velset = 0, 0
ctrl = 0
sprpriority = 3
movehitpersist = 1
[State 1307, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
[State 1307, Anim]
type = changeanim
trigger1 = 1
value = anim
elem = animelemno(0)
[State 1307, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -12.8 * time), ceil(12.8 * time)
[State 1307, Pos]
type = posset
trigger1 = 1
y = 0
[State 1307, End]
type = destroyself
trigger1 = time >= 20


;====< PROJECTILE NULIFIER >=
;Projectile Nulifier
[Statedef 1315]
type=A
physics=N
movetype=I
anim=1315
ctrl=0
velset=0,0

[State 1250, HitOverride]
type=hitoverride
trigger1= 1
attr=SCA,AA,AP,AT
time=-1
stateno=1315
ignorehitpause=1

[State 1250, NHB]
type=nothitby
trigger1= 1
time=-1
value=SCA
ignorehitpause=1

[State 1155, HB]
type=hitby
trigger1= 1
value=SCA,NP,SP,HP
time=-1
ignorehitpause=1

[State 1155, Bind]
type=bindtoroot
trigger1= 1
pos = 0,0
facing=1

[State 1155, End]
type=destroyself
trigger1= root, stateno!=1300 && root, stateno != 1310
trigger2= root,anim=1300 && root,animelemtime(6)>=0
trigger3= root,anim=1301 && root,animelemtime(12)>=0
trigger4= root,anim=1302 && root,animelemtime(20)>=0
trigger5= root,anim=1310 && root,animelemtime(9)>=0


;====< GADOU SHOUKOU KEN >=
; Gadou Shoukouken
[Statedef 1405]
type = S
physics = N
movetype = A
anim = 1405
ctrl = 0
velset = 0, 0
sprpriority = 4
juggle = 5

[State 1405, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1407
ignorehitpause = 1
[State 1405, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1405, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1405, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 1405, timevar]
type = varadd
trigger1 = time
var(1) = 1

[State 1405, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3.5, 3))
y = 0

[State 1405, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1405, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 2
length = 5
palcontrast = 75, 20, 0
palmul = 0.75, 0.5, 0.25
trans = add

[State 1405, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
persistent = 0
ignorehitpause = 1

[State 1405, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, SP
damage = ceil(94 * (root, fvar(12))), 7
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -6
ground.cornerpush.veloff = 0
air.velocity = -6, -6
guard.velocity = -10.52
fall = 1
fall.recover = 1
fall.recovertime = 20
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 30
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(59))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1405, End]
type = changestate
trigger1 = var(1) >= ifelse(var(10) = 3, 18, ifelse(var(10) = 2, 14, 10)) * ifelse(root, var(1)>1,1.5,1)
value = 1406
ignorehitpause = 1
[State 1405, End]
type = changestate
trigger1 = movecontact
value = 1407
ignorehitpause = 1
[State 1405, End]
type = destroyself
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]

[Statedef 1406]
type = A
physics = N
movetype = I
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 1406, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
[State 1406, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1406, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 -floor(time * 16), 256
[State 1406, Shrink]
type = angledraw
trigger1 = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
[State 1406, End]
type = destroyself
trigger1 = time > 16

[Statedef 1407]
type = A
physics = N
movetype = I
anim = 1407
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 1407, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1407, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1407, End]
type = destroyself
trigger1 = !animtime


;====< SHINKUU GADOU KEN >=
; Shinkuu Gadouken
[Statedef 3005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 5, 3005, 3007)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3005

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time
var(1) = 1

[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 6)
y = 0

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = ceil(30 * (root, fvar(12))), 7
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 4 * (var(2) < 5), 6
sparkno = -1
sparkxy = 0, 0
guard.sparkno = -1; = s7001
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
ground.cornerpush.veloff = 0
air.velocity = -6, -4
guard.velocity = -10.52
fall = (var(2) >= 5)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(59))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 3005, End]
type = changestate
trigger1 = var(1) >= 12 * ifelse(root, var(1)>1,1.5,1) && time
value = 3006
ignorehitpause = 1
[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 5, 3005, 3007)
ignorehitpause = 1
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]

[Statedef 3006]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 3006, Vel]
type = velmul
trigger1 = 1
x = 0.8
[State 3006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, End]
type = destroyself
trigger1 = !animtime

[Statedef 3007]
type = A
physics = N
movetype = I
anim = 3007
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 3007, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3007, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 3007, End]
type = destroyself
trigger1 = !animtime


;====< SHINKUU GADOU KEN >=
; MAX Shinku Gadoken
[Statedef 3405]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3405, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1
[State 3405, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3405, 3407)
ignorehitpause = 1

[State 3405, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 6
[State 3405, Anim]
type = changeanim
trigger1 = anim != 3405
value = 3405

[State 3405, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3405, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3405, timevar]
type = varadd
trigger1 = time
var(1) = 1

[State 3405, Vel]
type = velset
trigger1 = 1
x = 1.5
y = 0

[State 3405, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3405, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3405, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = ceil(30 * (root, fvar(12))), 5
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 12 * (var(2) < 8), 4
guard.pausetime = 4 * (var(2) < 8), 6
sparkno = -1
sparkxy = 0, 0
guard.sparkno = -1; = s7001
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2dist x >= 0, -1, -2), -4
ground.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x >= 0, -1, -2), -4
guard.velocity = -10.52
fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
forcestand = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(59))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 3405, End]
type = changestate
trigger1 = var(1) >= 90 * ifelse(root, var(1)>1,1.5,1) && time
value = 3406
ignorehitpause = 1
[State 3405, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 8, 3405, 3407)
ignorehitpause = 1
[State 3405, End]
type = destroyself
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]

[Statedef 3406]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 3406, Vel]
type = velmul
trigger1 = 1
x = 0.8
[State 3406, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1000, Snd]
type = playsnd
trigger1 = time = 15
value = 5, 15
[State 3406, End]
type = destroyself
trigger1 = !animtime

[Statedef 3407]
type = A
physics = N
movetype = I
anim = 3007
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 3407, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3407, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 3407, End]
type = destroyself
trigger1 = !animtime


;==< OYAJI BLAST >=
; Oyaji Blast
[Statedef 3750]
type = S
physics = S
movetype = A
anim = 3750
ctrl = 0
velset = 0, 0
poweradd = 0
sprpriority = 5
[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1
ignorehitpause = 1
persistent = 1
[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1;anim = 3750
value = ifelse(p2dist x<=0,0,1);ifelse(time<=2,0,1)
ignorehitpause = 1
persistent = 1
;
;[State -3, Lv2 Shadows]
;type = afterimage
;trigger1 = time = 17
;time = 2
;timegap = 1
;framegap = 10
;length = 21
;paladd = 0, 0, 0
;palmul = 0.75, 0.75, 0.75
;palcontrast = 32, 32, 160
;palpostbright = 0, 0, 0
;trans = add1
;
;[State -3, AfterImagePersist]
;type = afterimagetime
;trigger1 = 1
;time = 2

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 16
value = 0
scale = 1.5-(0.03125*time), 1.5-(0.03125*time)
;
;[State 3000, Super Pause FX]
;type = helper
;trigger1 = !time
;helpertype = normal
;stateno = 3751
;ID = 3751
;name = "Gou ''Oyaji'' Hibiki"
;postype = p1
;pos = 0,4
;ownpal = 1
;persistent = 0
;supermovetime = 43

[State 0, RemapPal]
type = RemapPal
trigger1 = !time
source = 3,0
dest = 3,ifelse(palno=2||palno=8,1,ifelse(palno=3||palno=9,2,ifelse(palno=5||palno=11,3,ifelse(palno=6||palno=12,4,0))))
[State 0, RemapPal]
type = RemapPal
trigger1= !time
source = 3,100
dest = 3,100+ifelse(palno=2||palno=8,1,ifelse(palno=3||palno=9,2,ifelse(palno=5||palno=11,3,ifelse(palno=6||palno=12,4,0))))

[State 52, Dust]
type = explod
;trigger1 = !time || time = 15 || time = 30
trigger1 = time = 16
anim = 8105
ID = 7102
sprpriority = -4
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 3760
ID = 3750
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
trans = Sub
sprpriority = 0
ownpal = 0
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = anim = 3751 && animelemtime(1)=10
anim = 3752
ID = 3751
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
trans = Add
sprpriority = 2
ownpal = 1
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 3765
ID = 3751
pos = 1,-2
postype = p1  ;p2,front,back,left,right
facing = 1
;trans = Add
sprpriority = 3
ownpal = 1
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 3766
ID = 3751
pos = 1,-2
postype = p1  ;p2,front,back,left,right
facing = 1
;trans = Sub
sprpriority = -2
ownpal = 1
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, PalFX]
type = PalFX
trigger1 = 1
time = 1
;mul = 128,128,128
mul = ifelse(time<=16,time*10,160),ifelse(time<=16,time*10,160),ifelse(time<=16,time*10,160)
;mul = 160,160,160
;mul = 192,192,192

[State 0, AngleDraw]
type = modifyexplod
trigger1 = time <= 16
ID = 3750
scale = (1.5-(0.03125*time))*const(size.xscale), (1.5-(0.03125*time))*const(size.yscale)
;
[State 0, AngleDraw]
type = modifyexplod
trigger1 = time <= 16
ID = 3751
ownpal = 0
scale = (1.5-(0.03125*time))*const(size.xscale), (1.5-(0.03125*time))*const(size.yscale)



[State 1000, Beam]
type = helper
triggerall = anim = 3751
trigger1 = animelemtime(2) = 0
helpertype = normal
stateno = 3705
ID = 3755
name = "Oyaji Beam"
postype = p1
pos = 77, -75
size.xscale = 0.35
size.yscale = 0.25
ownpal = 1
[State 0, BindToRoot]
type = BindToRoot
trigger1 = 1
time = 1
pos = 60,0
ignorehitpause = 1
persistent = 1
[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3055, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 0, Explod]
type = removeexplod
trigger1 = anim = 3750 && time = 43
ID = 3750

[State 1000, End]
type = changeanim
trigger1 = anim = 3750 && time = 43
value = 3751
[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1
persistent = 1

[State 0, Explod]
type = Explod
trigger1 = animelemtime(1) = 0 && anim = 3751
anim = 3761
ID = 3751
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
trans = Sub
sprpriority = 0
scale = const(size.xscale), const(size.yscale)
ownpal = 0
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = removeexplod
triggerall = anim = 3751
trigger1 = !numhelper(3755)&& animelemtime(2)>=0
trigger2 = root, stateno != 3700
ID = 3751


[State 1000, End]
type = changestate
triggerall = anim = 3751
trigger1 = !numhelper(3755)&& animelemtime(2)>=0
trigger2 = root, stateno != 3700
value = 3751

[Statedef 3751]
type = S
physics = S
movetype = A
anim = ifelse(prevstateno,ifelse(prevstateno=3750,3754,ifelse(anim=4250,4258,4252)),parent, anim)
ctrl = 0
velset = 0, 0
poweradd = 0
[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1
persistent = 1
[State 0, RemapPal]
type = RemapPal
trigger1 = !time
source = 3,0
dest = 4,6
[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1
persistent = 1
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time <= 8
value = 0
scale = 1+(0.06125*time) ,1+(0.06125*time)
[State 0, Trans]
type = Trans
trigger1 = time <= 8
trans = addalpha ;none, add, addalpha, add1, sub
alpha = 256-(32*time),256




[State 3055, Assert]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 0, DestroySelf]
type = DestroySelf
trigger1 = time>=8
ignorehitpause = 1
persistent = 1


;====< OYAJI BEAM >=
;== Oyaji Beam ==
[Statedef 3705]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 0, Explod]
type = Explod
trigger1 = !time
trigger2 = !(gametime%10)
anim = 6028
ID = 6028
pos = 30,-ceil(pos y)
postype = p1  ;p2,front,back,left,right
ignorehitpause = 1
removetime = -2
scale = 0.25,0.125
sprpriority = 5

[State 0, AngleDraw]
type = AngleDraw
trigger1 = 1
scale = 1/camerazoom, 1
ignorehitpause = 1
persistent = 1
[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3705
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1000, Snd]
type = playsnd
trigger1 = !time && animelemtime(1)=0
value = 5, 19
loop = 0
channel = 3
persistent = 0
[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3055, Bind]
type = bindtoroot
trigger1 = 1
pos = 77, -75

[State 3055, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3705

[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3055, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = (time%3)
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
triggerall = animelemno(0) != var(4)
trigger1 = animelem = 1 ||  animelem = 4 || animelem = 7 || animelem = 10 || animelem = 13 || animelem = 16 || animelem = 19
attr = S, HP
;damage = ceil(ifelse((root, fvar(12)) * 44 < 7, 7, (root, fvar(12)) * 44)), 8
;damage = ceil(44 * root, fvar(12)), 7
damage = ceil(40 * root, fvar(12)), 8
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = M
priority = 4, Hit
pausetime = 2, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -1
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -3, -1
down.velocity = -15, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 128
palfx.sinadd = 0+(root,var(1)=2)*64, 64-(root,var(1)=2)*64, 64, 4
palfx.mul = 0+(root,var(1)=2)*192, 96-(root,var(1)=2)*96, 192-(root,var(1)=2)*96
palfx.time = 48

[State 3055, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 22
attr = S, HP 
;damage = ceil(ifelse((root, fvar(12)) * 50 < 7, 7, (root, fvar(12)) * 50)), 8
damage = ceil(40 * root, fvar(12)), 10
animtype = Diagup
fall.animtype = Diagup
hitflag = MAF
guardflag = M
priority = 4, Hit 
pausetime = 2, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7, -9
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -7, -9
down.velocity = -7, -9
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.color = 50
palfx.sinadd = 0, 25, 80, 8
palfx.mul = 128, 256, 512
palfx.time = 48

;[State 3055, Sparks]
;type = explod
;trigger1 = movecontact = 1 && numtarget
;trigger1 = (target, movetype = H) && !(target, time)
;anim = ifelse(moveguarded, 7001, 7030 + (random % 8))
;ID = 7000
;sprpriority = 5
;postype = p2
;pos = (target, const(size.ground.front) -10), (target, const(size.mid.pos.y))
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;pausemovetime = 100
;supermovetime = 100

[State 3005, hitspark]
type = helper
trigger1 = (time%3)
trigger1 = moveContact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8017)
ID = 8000
name = "Spark"
posType = P1
pos = (target, pos x*facing - (pos x)*facing), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(29))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(8150) < 1
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
helpertype = normal
stateno = 8150
ID = 8150
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3006, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Self Hit Count]
type = VarAdd
trigger1 = MoveContact = 1 && NumTarget
var(13) = 1
[State 3006, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact = 1 && NumTarget
var(15) = 1

[State 3055, End]
type = changestate
trigger1 = !animtime || parent, anim != 3751
value = 3706

[Statedef 3706]
type = A
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 4
anim = 3706

[State 1000, Snd]
type = stopsnd
trigger1 = animelem = 2
channel = 3
persistent = 0
[State 0, AngleDraw]
type = AngleDraw
trigger1 = time
scale = 1/camerazoom, 1
ignorehitpause = 1
persistent = 1
[State 3056, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3056, End]
type = destroyself
trigger1 = !animtime



;====< METSU GADOU KEN >=
; Metsu Gadouken
[Statedef 3805]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4



[State 105, Dust]
type = helper
trigger1 = !(time%2)
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pos = 20, -pos y
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3025, particles]
type = explod
trigger1 = 1
vel = -2 -(random / 2000.0), 0
accel = 0, 0.300- (0.002*(random%300))
anim = 7181
sprpriority = -1
postype = p1
pos = -20, 0
random = 40, 20
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.25, 0.25
ownpal = 1
ignorehitpause = 1

[State 3025, particles]
type = explod
trigger1 = 1
vel = -2 -(random / 2000.0), 0
accel = 0, 0;.300- (0.002*(random%300))
anim = 8151
trans = Sub
sprpriority = 2
postype = p1
pos = -20, 0
random = 40, 20
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.125, 0.125
ownpal = 1
ignorehitpause = 1

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 8, 3805, 3007)
ignorehitpause = 1
[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3005

[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 3005, timevar]
type = varadd
trigger1 = time
var(1) = 1

[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 12)
y = 0

[State 3005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = 1
priority = 4, Hit
attr = S, HP
damage = ceil(225 * (root, fvar(12))), 60
animtype = diagup
hitflag = MAF
guardflag = M
pausetime = 0, 6
sparkno = -1
sparkxy = 0, 0
guard.sparkno = -1; = s7001
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, -6
yaccel = 0.3
ground.cornerpush.veloff = 0
air.velocity = -2, -6
guard.velocity = -10.52
fall = 1
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1
palfx.time = 48
palfx.color = 128
palfx.sinadd = 64, 0, 64, 4
palfx.mul = 96, 0, 192

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7182) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7182
ID = 7182
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(59))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 3005, End]
type = changestate
trigger1 = var(1) >= 9 * ifelse(root, var(1)>1,1.5,1) && time
value = 3006
ignorehitpause = 1
[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 8 && target, ishelper, 3805, 3007)
ignorehitpause = 1
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]



;==< JUN KOKU SATSU >=
;=Jun Koku Satsu=
[Statedef 4250]
type = S
physics = S
movetype = A
anim = 4250
ctrl = 0
velset = 0, 0
;poweradd = -3000
juggle = 15
sprpriority = 1
[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1
ignorehitpause = 1
persistent = 1


[State -3, Lv3 Shadows]
type = afterimage
trigger1 = time = 21
time = 2
timegap = 1
framegap = 10
length = 21
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
trans = add1

[State -3, AfterImagePersist]
type = afterimagetime
trigger1 = time >= 21
time = 2

[State 0, AngleDraw]
type = AngleDraw
trigger1 = time = [4,20]
value = 0
scale = 1.5-(0.03125*(time-4)), 1.5-(0.03125*(time-4))

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = ifelse(time<=2,0,1)
ignorehitpause = 1
persistent = 1
[State 4250, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 52, Dust]
type = explod
;trigger1 = !time || time = 15 || time = 30
trigger1 = time = 21
anim = 8105
ID = 7102
sprpriority = -4
postype = p1
pos = -3,7
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 0, RemapPal]
type = RemapPal
trigger1 = !time
source = 3,0
dest = 3,ifelse(palno=2||palno=8,1,ifelse(palno=3||palno=9,2,ifelse(palno=5||palno=11,3,ifelse(palno=6||palno=12,4,0))))
[State 0, RemapPal]
type = RemapPal
trigger1= !time
source = 3,100
dest = 3,100+ifelse(palno=2||palno=8,1,ifelse(palno=3||palno=9,2,ifelse(palno=5||palno=11,3,ifelse(palno=6||palno=12,4,0))))



[State 0, Explod]
type = Explod
trigger1 = !time
anim = 4260
ID = 4250
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
trans = Sub
sprpriority = 0
ownpal = 0
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = time = 4
anim = 3765
ID = 4251
pos = 10,-22
postype = p1  ;p2,front,back,left,right
facing = 1
;trans = Add
sprpriority = 3
ownpal = 1
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = time = 4
anim = 3766
ID = 4251
pos = 10,-22
postype = p1  ;p2,front,back,left,right
facing = 1
;trans = Sub
sprpriority = -2
ownpal = 1
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, PalFX]
type = PalFX
trigger1 = 1
time = 1
;mul = 128,128,128
mul = ifelse(time<4,0,ifelse(time<=20,(time-4)*10,160)),ifelse(time<4,0,ifelse(time<=20,(time-4)*10,160)),ifelse(time<4,0,ifelse(time<=20,(time-4)*10,160))
;mul = 160,160,160
;mul = 192,192,192


[State 0, AngleDraw]
type = modifyexplod
trigger1 = time = [4,20]
ID = 4250
scale = (1.5-(0.03125*(time-4)))*const(size.xscale), (1.5-(0.03125*(time-4)))*const(size.yscale)
;
[State 0, AngleDraw]
type = modifyexplod
trigger1 = time = [4,20]
ID = 4251
ownpal = 0
scale = (1.5-(0.03125*(time-4)))*const(size.xscale), (1.5-(0.03125*(time-4)))*const(size.yscale)



[State 0, BindToRoot]
type = BindToRoot
trigger1 = time<=42
time = 1
pos = 40,0
ignorehitpause = 1
persistent = 1

[State 4250, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 43
value = S5,20
volume = 255

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 43
value = S5,20
volume = 255

[State Corner Push]	
type = varset
trigger1 = !time
fvar(5) = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
ignorehitpause = 1
persistent = 1

[State 4250, Vel]
type = velset
trigger1 = time>=43
x = 7

[State 4250, Miss]
type = hitdef
trigger1 = time
attr = S, HT
hitflag = 

[State 4250, Hit]
type = hitdef
trigger1 = time >= 43
trigger1 = root, var(38)<=0
trigger1 = p2dist x >= 0 && p2bodydist x <= 20
attr = S, HT
hitflag = M-
priority = 6, Miss
numhits = 0
sparkno = -1
p1facing = 1
p2facing = 1
p1stateno = 4251
fall = 1 
fall.recover = 0

[State 0, Explod]
type = removeexplod
trigger1 = !animtime
trigger2 = root, stateno != 4200
ID = 4250

[State 0, Explod]
type = removeexplod
trigger1 = !animtime
trigger2 = root, stateno != 4200
ID = 4251

[State 4250, End]
type = changestate
trigger1 = !animtime
trigger2 = root, stateno != 4200
value = 3751
ctrl = 0



;--- PLAYER ---
[Statedef 4251]
type = S
physics = N
movetype = A
anim = 4251
ctrl = 0
velset = 0, 0
sprpriority = 2
[State 3055, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 1,1
ignorehitpause = 1
persistent = 1

[State 0, Explod]
type = removeexplod
trigger1 = !time
ID = 4250

[State 0, Explod]
type = removeexplod
trigger1 = !time
ID = 4251

[State 0, PalFX]
type = PalFX
trigger1 = 1
time = 1
;mul = 128,128,128
;mul = ifelse(time<=16,time*10,160),ifelse(time<=16,time*10,160),ifelse(time<=16,time*10,160)
mul = 160,160,160
;mul = 192,192,192

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 4261
ID = 4250
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
trans = Sub
sprpriority = 1
ownpal = 0
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 3765
ID = 4250
pos = 19,-13
postype = p1  ;p2,front,back,left,right
facing = 1
;trans = Add
sprpriority = 3
ownpal = 1
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 3766
ID = 4250
pos = 19,-13
postype = p1  ;p2,front,back,left,right
facing = 1
;trans = Sub
sprpriority = 0
ownpal = 1
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43




[State Throw]
type = targetstate
trigger1 = !time
value = 1114002

[State 4251, Snd]
type = playsnd
trigger1 = !time
value = 5, 21
[State 4251, grabsnd]
type = playsnd
trigger1 = !time
value = 0, 800

[State 4251, vsothers]
type = varset
trigger1 = !time
var(34) = 234

[State 4701, vs Gouken / Dhalsim / Etc]
type = varset
triggerall = !time
trigger1 = target, name = "Oro" || target, name = "SFIII_Oro" || target, name = "DR_Oro" || target, name = "Oro_mx" || target, name = "Morrigan Aensland" || target, name = "CvS_Heihachi"
trigger2 = target, name = "Gouken SSF4" || target, name = "Gouken" || target, name = "Shin Gouken"  || target, name = "Dudley_mx" || target, name = "Morrigan" || target, name = "CvS_HeihachiTAG"
trigger3 = target, name = "Shen Long" || target, name = "Master Gouken" || target, name = "Pocket Shin Gouki" || target, name = "Garuda" || target, name = "Lilith"
trigger4 = target, name = "Gouken SSF4" || target, name = "GoukenTAG" || target, name = "Shin GoukenTAG" || target, name = "DudleyTAG" || target, name = "RajaaLilith"
trigger5 = target, name = "Shen LongTAG" || target, name = "Master GoukenTAG" || target, name = "Ingrid" || target, name = "Dudley" || target, name = "Master Zeku"
trigger6 = target, name = "Saisyu" || target, name = "Saisyu Kusanagi" || target, name = "Kusanagi Saisyu" || target, name = "Kenpachi" || target, name = "Kenpachi Zaraki"
trigger7 = target, name = "Dhalsim" || target, name = "RajaaDhalsim" || target, name = "cvsdhalsim" || target, name = "JinpachiMishima" || target, name = "Zaraki Kenpachi"
trigger8 = target, name = "CvS_HeihachiTAG" || target, name = "CvS_Heihachi" || target, name = "Heihachi Mishima" || target, name = "Jinpachi Mishima" || target, name = "Morrigan_Aensland"
trigger9 = target, name = "Mishima Heihachi" || target, name = "Heihachi" || target, name = "HeihachiMishima" || target, name = "CvS_Jinpachi" || target, name = "Zeku"
trigger10 = target, name = "Retsu" || target, name = "Master Retsu" || target, name = "cvsdhalsim" || target, name = "CvS_JinpachiTAG" || target, name = "Rose_mx"
trigger11 = target, name = "Takuma" || target, name = "Takuma Sakazaki" || target, name = "Sakazaki Takuma" || target, name = "cvs_takuma" || target, name = "Rose"
trigger12 = target, name = "Asura" ||  target, name = "AsuraTAG" || target, name = "Asura(AW)" || target, name = "Asura's Wrath" || target, name = "Asura (Asura's Wrath)"
trigger13 = target, name = "Gen" || target, name = "Master Gen" || target, name = "Gen_mx" || target, name = "Donovan" || target, name = "RajaaLilith" || target, name = "Q"																						 || target, name = "Chuchoryu" ;jej
trigger14 = target, name = "Gou" || target, name = "Go" || target, name = "Gou Hibiki" || target, name = "Go Hibiki" || target, name = "GoHibiki" || target, name = "GouHibiki"
trigger15 = target, name = "Mr Saikyo" || target, name = "Mr. Saikyo" || target, name = "MrSaikyo" || target, name = "Mr.Saikyo" || target, name = "Oyaji" || target, name = "Dan's Oyaji"
trigger16 = (target, name = "Ryu") && (target, authorname = "Phantom.of.the.Server")
trigger16 = target, var(1) = 3
trigger17 = (target, name = "Ken") && (target, authorname = "Phantom.of.the.Server&Jmorphman")
trigger17 = target, var(40) = 2
trigger18 = target, name = "Master Ryu" || target, name = "Master Ken" || target, name = "Hsien-Ko" || target, name = "Lei-Lei"
trigger19 = target, name = "Dan" || target, name = "Dan Hibiki" || target, name = "cvsdan" || target, name = "svcdan" || target, name = "Dan_mx" || target, name = "Marvel vs Capcom - Eternity of Heroes: Dan"; Dan>Akuma
trigger20 = target, name = "Deadpool" || target, name = "Ghost Rider" || target, name = "Hulk" || target, name = "The Hulk"; If Ghost Rider says The Hulk has no sins, then he'd be inmune to the SGS
var(34) = 15

[State -2, vs Oni]; We could say he created the Shun Goku Satsu. He IS the Satsui no Hado, after all.
type = Varset
trigger1 = target, name = "Oni" || target, name = "Oni Akuma" || target, name = "Oni Gouki" || target, name = "Ogre Akuma" || target, name = "Ogre Gouki" || target, name = "Kuroshiki Oni" || target, name = "CvS_Oni"
trigger2 = (target, name = "Akuma" && target, authorname = "Mr.Ansatsuken") && target, var(1) = 2
trigger3 = target, name = "Ogre" && target, authorname = "JUN"
trigger4 = target, name = "OniTAG" || target, name = "Oni AkumaTAG" || target, name = "Oni GoukiTAG" || target, name = "Ogre AkumaTAG" || target, name = "Ogre GoukiTAG"
trigger5 = (target, name = "AkumaTAG" && target, authorname = "Mr.Ansatsuken") && target, var(1) = 2
var(34) = 15

[State 4701, vs Mr. Karate]
type = Varset
triggerall = !time
trigger1 = target, name = "Mr. Karate" || target, name = "Mr.Karate" || target, name = "Mr Karate" || target, name = "MrKarate"
trigger2 = target, name = "CvS2_Mr.Karate" || target, name = "cvs_mr_karate" || target, name = "svckarate" || target, name = "Mr.KARATEIII"
trigger3 = target, name = "Honki ni Natta Mr. Karate" || target, name = "Shin Mr. Karate"  || target, name = "Serious Mr. Karate"
trigger4 = target, name = "Honki ni Natta Mr.Karate" ||  target, name = "Shin Mr.Karate"  ||  target, name = "Serious Mr.Karate"
trigger5 = target, name = "Honki ni Nata Mr Karate" ||  target, name = "Shin Mr Karate"  ||  target, name = "Serious Mr Karate"
trigger6 = target, name = "Honki ni Natta MrKarate" ||  target, name = "Shin MrKarate"  ||  target, name = "Serious MrKarate"
var(34) = 15

[State 4701, Vs Seth/any other soulless machine]	
type = Varset
triggerall = !time
trigger1 = target, selfanimexist(8055021)
trigger2 = target, name = "CvS_JackTAG" || target, name = "CvS_Jack" || target, name = "Jack-X" || target, name = "Tekken Jack" || target, name = "DR_Necro"
trigger3 = target, name = "Zero-Akuma" || target, name = "Z-Akuma" || target, name = "Z-Gouki" || target, name = "Zero-Gouki" || target, name = "Necro"
trigger4 = target, name = "Sentinel" || target, name = "Cyborg" || target, name = "Twelve" || target, name = "Twelve_mx" || target, name = "Necro_mx"
trigger5 = target, name = "Bane" || target, name = "Bane edit"; He might have a soul, but he's pretty big, you know.
trigger6 = target, name = "Abel"; He doesn't have a soul. At least in the UDON Comics (that's pretty sad, heh).
var(34) = 15

[State 4251, vs Gouki or Gen]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Gouki" || target, name = "Shin Gouki" || target, name = "Akuma" || target, name = "Shin Akuma"
trigger2 = target, name = "Mech Gouki" || target, name = "Cyber Akuma" || target, name = "Gen"
trigger3 = target, name = "Pocket Shin Gouki" || target, name = "cvsgouki" || target, name = "SF3Gouki"
trigger4 = target, name = "SoulGen" || target, name = "Gouki_Cota" || target, name = "Gouki CVS 3"
var(34) = 20

[State -2, vs Akuma]
type = Varset
triggerall = !time && numtarget
trigger1 = (target, name = "Akuma" || target, name = "MvC-EoH Gouki" || target, name = "CvSGouki" || target, name = "svcgouki" || target, name = "ZXAkuma" || target, name = "Gouki" || target, name = "cvsgouki_normal" || target, name = "ZXAkuma") && target, authorname != "Mr. Ansatsuken" && target, authorname !="Phantom.of.the.server"
trigger2 = (target, name = "Akuma" && target, authorname = "Mr.Ansatsuken") && target, var(1) = 1
trigger3 = (target, name = "Gouki" && target, authorname = "Phantom.of.the.Server") && target, var(1) = 0
trigger4 = target, name = "AkumaTAG" || target, name = "CvSGoukiTAG" || target, name = "Gouki" && target, authorname != "Mr. Ansatsuken"
trigger5 = (target, name = "AkumaTAG" && target, authorname = "Mr.Ansatsuken") && target, var(1) = 1
trigger6 = (target, name = "GoukiTAG" && target, authorname = "Phantom.of.the.Server") && target, var(1) = 0
var(34) = 20

[State -2, vs Shin Akuma]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(target, teammode = turns)
trigger1 = target, name = "Shin Akuma" || target, name = "Shin Gouki" || target, name = "cvsgouki_ex"
trigger2 = (target, name = "Akuma" && target, authorname = "Mr.Ansatsuken") && target, var(1) = 3
trigger3 = (target, name = "Gouki"  && target, authorname = "Phantom.of.the.Server") && target, var(1) = 1
trigger4 = target, name = "Shin AkumaTAG" || target, name = "Shin GoukiTAG"
trigger5 = (target, name = "AkumaTAG" && target, authorname = "Mr.Ansatsuken") && target, var(1) = 3
trigger6 = (target, name = "GoukiTAG" && target, authorname = "Phantom.of.the.Server") && target, var(1) = 1
var(34) = 20

[State 4251, vs Evil Ryu]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Evil Ryu" || target, name = "ERyu"
trigger2 = target, name = "Ryu" && target, authorname = "Phantom.of.the.Server" && target, var(1) != 1
trigger3 = target, name = "CVSEvilRyu" || target, name = "Destrudo Ryu"
trigger4 = target, name = "Ryu" && target, authorname = "N64Mario" && target, palno >= 7
trigger5 = target, name = "cvsryu" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger6 = target, name = "eRYU -SvsC"
var(34) = 25

[State 4251, vs Devil Gene]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "DevilJin" || target, name = "Devil Jin"
trigger2 = target, name = "DevilKazuya" || target, name = "Devil Kazuya"
trigger3 = target, name = "DevilJinpachi" || target, name = "Devil Jinpachi"
var(34) = 25

[State 4251, vs Others]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Orochi Iori" || target, name = "Violent Ken"
trigger2 = target, name = "Sakura" && target, authorname = "Phantom.of.the.Server" && target, var(1) = 2
var(34) = 40

[State 4251, vs Other Shun Goku Satsu users]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "God Rugal" || target, name = "Dark Sakura"
trigger2 = target, name = "Oyaji" && target, authorname = "Mr.Chainsaw & Phantom.of.the.Server"
trigger3 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) = 10
trigger4 = target, name = "cvsg_rugal" && target, authorname = "Warusaki3"
trigger5 = target, name = "Tin's S_Gouki" || target, name = "Blaze Agent"
var(34) = 50

[State 4251, vsCAPCOMbadguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Demitri" || target, name = "Jedah"
trigger2 = target, name = "Vega" && (target, authorname = "Phantom.of.the.Server" || target, authorname = "Messatsu")
trigger3 = target, name = "cvsvega" && (target, authorname = "Warusaki3" || target, authorname = "Gargoyle")
trigger4 = target, name = "M.Bison" && target, authorname = "N -Mario"
trigger5 = target, name = "[Necromancer's] M. Bison"
trigger6 = target, name = "M. Bison" && target, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger7 = target, name = "CvSBison" && target, authorname = "Team Kai (Saiai and Koga)"
trigger8 = target, name = "Shadow DIO" || target, name = "Gill"
trigger9 = target, name = "Jedah" || target, name = "Pyron" || target, name = "Shadow"
trigger10 = target, name = "Balrog" || target, name = "Vega" || target, name = "Bison"
trigger11 = target, name = "Vergil"
trigger12 = target, name = "DMCVergil"
trigger13 = target, name = "Wesker" || target, name = "AlbertWesker" || target, name = "Albert Wesker" || target, name = "A.Wesker" || target, name = "A. Wesker"
trigger14 = target, name = "Nash" && target, authorname = "Phantom.of.the.Server" && target, var(1) != 1
trigger15 = target, name = "Red Arremer" || target, name = "Firebrand" || target, name = "Fire brand" || target, name = "RedArremer"
trigger16 = target, name = "EvilKen" || target, name = "Evil Ken"
trigger17 = target, name = "Juri" || target, name = "JuriHan" || target, name = "Juri Han"
trigger18 = target, name = "Shadow" || target, name = "ShadowLady" || target, name = "Shadow Lady" || target, name = "Chun-Li"
trigger19 = target, name = "Chun-li" && target, authorname = "Jmorphman" && target, var(40) = 1
trigger20 = target, name = "EvilDan" || target, name = "Evil Dan" || target, name = "EvilDanHibiki" || target, name = "Evil DanHibiki" || target, name = "EvilDan Hibiki" || target, name = "Evil Dan Hibiki"
var(34) = 456

[State 4251, vsSNK badguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Geese" || target, name = "Orochi" || target, name = "Mukai" || target, name = "Ryuji Yamazaki"
trigger2 = target, name = "Geese Howard" || target, name = "Yamazaki"
trigger3 = target, name = "cvsgeese" || target, name = "DGeese" || target, name = "ORIGINAL ZERO"
trigger4 = target, name = "cvsyamazaki" || target, name = "Orochi Rebirth" || target, name = "Tin's Mukai"
trigger5 = target, name = "geese_mmx" || target, name = "Setsuna" || target, name = "Igniz" || target, name = "Krizalid"
trigger6 = target, name = "Rasetsumaru" || target, name = "cvshaohmaru_ex"
trigger6 = target, name = "Kusanagi" || target, name = "cvskyo_ex" || target, name = "Goenitz"
trigger6 = target, name = "Orochi Iori" || target, name = "OrochiIori" || target, name = "cvsiori_ex"
var(34) = 456

[State 4251, vs Rugal]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Rugal" || target, name = "Rugal Bernstein" || target, name = "Omega Rugal"
trigger2 = target, name = "Rugal94" || target, name = "Rugal94(BOSS)" || target, name = "rugal_B"
trigger3 = target, name = "Rugal_TLE" || target, name = "Omega Rugal Gb" || target, name = "Tin G_rugal"
trigger4 = target, name = "Mech Rugal" || target, name = "Tin 2002_rugal" 
trigger5 = target, name = "Rugal CvS" 
trigger6 = target, name = "cvsrugal" && target, authorname = "Warusaki3" && target, var(12) != 10
var(34) = 456

[State 4251, vs Mortal Kombat badguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Shao Kahn" || target, name = "Shang Tsung" || target, name = "Goro"
trigger2 = target, name = "Kintaro" || target, name = "Motaro"
trigger3 = target, name = "shaokahn" || target, name = "ShangTsung"
trigger4 = target, name = "Noob" || target, name = "NoobSaibot" || target, name = "Noob Saibot"
trigger5 = target, name = "Scorpion"
var(34) = 456

[State 4251, vs MARVEL badguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Dr.Doom"
trigger2 = target, name = "Dr. Doom by WhiteMagic2002"
trigger3 = target, name = "Venom"
trigger4 = target, name = "Carnage"
trigger5 = target, name = "Magneto"
trigger6 = target, name = "Dormammu"
var(34) = 456

[State 4251, vs Guilty Gear badguys]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Justice" || target, name = "Testament"
var(34) = 456

[State 4251, vs random badguys >= )]
type = varset
triggerall = !time && numtarget
trigger1 = target, name = "Sevil Nahte" || target, name = "Perfect Weapon MB -02"
trigger2 = target, name = "Jaian"; lol = D
var(34) = 456

[State 4701, Vs Final Bison] ;Uhm, he can't be Shun Goku Satsu'd, since, you know... Akuma already destroyed his soul.
type = Varset
triggerall = !time
trigger1 = target, name = "Final Bison" || target, name = "Final Vega" || target, name = "Shin Bison" || target, name = "Bison 2"
trigger2 = target, name = "Vega II" || target, name = "Bison2" || target, name = "VegaII" || target, name = "ShinBison"
trigger3 = target, name = "Final M.Bison" || target, name = "Final M. Bison" || target, name = "ShinM.Bison"
trigger4 = target, name = "FinalVega" || target, name = "FinalBison" ||  target, name = "cvsvega_ex"
trigger5 = target, name = "ShinVega" || target, name = "Shin Vega" ||  target, name = "Shin M.Bison"
trigger6 = target, name = "Vega" && target, authorname = "Froz"
trigger6 = target, var(40)=1
trigger7 = target, name = "Shin M. Bison" || target, name = "Final M. Bison" || target, name = "M. Bison 2" || target, name = "M. Bison II"
trigger8 = target, name = "M.Bison 2" || target, name = "M.Bison2" || target, name = "M.Bison II" || target, name = "M.BisonII"
trigger9 = target, name = "Final M.Bison" || target, name = "Final M. Bison" || target, name = "Shin M.Bison"
trigger10 = target, name = "Vega2" || target, name = "Vega 2" || target, name = "Bison Bison"
trigger11 = target, name = "True M.Bison" || target, name = "True M. Bison" || target, name = "TrueM.Bison"
trigger12 = target, name = "True Bison" || target, name = "True Bison" || target, name = "True Vega" || target, name = "TrueVega"
trigger13 = target, name = "Shin Dictator" || target, name = "ShinDictator" || target, name = "True Dictator" || target, name = "TrueDictator"
trigger14 = target, name = "Dictator2" || target, name = "Dictator 2" || target, name = "DictatorII" || target, name = "Dictator II"
trigger15 = target, name = "FinalDictator" || target, name = "Final Dictator" || target, name = "MBison2" || target, name = "MBison 2"
trigger16 = target, name = "MBisonII" || target, name = "MBison II" || target, name = "ShinMBison" || target, name = "Shin MBison"
trigger17 = target, name = "Final MBison" || target, name = "FinalMBison" || target, name = "TrueMBison" || target, name = "True MBison"
trigger18 = target, name = "M BisonII" || target, name = "M Bison II" || target, name = "ShinM Bison" || target, name = "Shin M Bison" || target, name = "M Bison2"
trigger19 = target, name = "Final M Bison" || target, name = "FinalM Bison" || target, name = "TrueM Bison" || target, name = "True M Bison" || target, name = "M Bison 2"
var(34) = 15

;NEED TO FINISH

[State 4251, Recover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(17) < 0
triggerall = (var(34) = [1, 99]) && numtarget
triggerall = target, life >= 0.33 * (target, lifemax)
trigger1 = (target, command = "x") || (target, command = "y") || (target, command = "z")
trigger2 = (target, command = "a") || (target, command = "b") || (target, command = "c")
trigger3 = (target, command = "up") || (target, command = "down") || (target, command = "back") || (target, command = "fwd")
var(34) = -1

[State 4251, Debug]
type = displaytoclipboard
trigger1 = var(34) < 100
text = " %d button presses to recover"
params = var(34)
[State 4251, Debug]
type = displaytoclipboard
trigger1 = var(34) = 234
text = "Normal Damage"
[State 4251, Debug]
type = displaytoclipboard
trigger1 = var(34) = 456
text = "Extra Damage"

[State 4251, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 2
movetime = 2
[State 4251, Push]
type = playerpush
trigger1 = animelemtime(17) >= 0
value = 0
[State 4251, nothitby]
type = nothitby
trigger1 = animelemtime(17) < 0
value = SCA
time = 1
[State 4251, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 4251, fadeout]
type = allpalfx
trigger1 = animelemtime(2) = -16
time = 16
sinadd = -255, -255, -255, 64
[State 4251, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
time = 4
value = 0, 0, 0

[State 4251, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(17) < 0
flag = nobardisplay
flag2 = noFG
[State 4251, Assert]
type = assertspecial
trigger1 = root, var(33)
flag = nomusic
[State 4251, spr]
type = sprpriority
trigger1 = animelemtime(17) >= 0
value = -5
[State 4251, Bind]
type = targetbind
trigger1 = animelemtime(17) < 0
pos = 45, 0

[State 4251, hitadd]
type = hitadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
value = 1

[State 4251, hitdamage]
type = targetlifeadd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
;value = ifelse((var(34) = 456), -43, -36)
value = ifelse((animelem=17), -35, -27)
kill = animelem = 17

[State 0, VarSet]
type = Varadd
trigger1 = var(34)=1
var(34) = -1
ignorehitpause = 1
persistent = 1

[State 0, VarSet]
type = VarSet
trigger1 = var(34) = 0 && target, life = 0
var(34) = 1
ignorehitpause = 1
persistent = 1

[State 4251, Pause]
type = posadd
trigger1 = animelemtime(17) = 0
x = ifelse((pos x = [-ifelse(target, life=0,70,80)/camerazoom,ifelse(target, life=0,70,80)/camerazoom]),45,(((pos x*facing*-1)+ifelse(target, life=0,115/camerazoom,125/camerazoom))))

[State 0, TargetBind]
type = TargetBind
trigger1 = animelem = 17
time = 1
pos =0,0
ignorehitpause = 1
persistent = 1



[State 4251, givepower]
type = targetpoweradd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
value = 36

;[State 4251, HitSound]
;type = playsnd
;trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
;trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
;value = 2, ifelse(!var(34), 0, ifelse((animelem = 16), 8, 3))
;channel = 2

[State 4251, HitSound]
type = playsnd
trigger1 = (Time = [32,89]) && !(Time % 5)
value = 2, 3
channel = 2

[State 4251, HitSound]
type = playsnd
trigger1 = animelem = 17
value = 2, 8
channel = 2

[State -3, Super Finish]
type = helper
triggerall = winKO
trigger1 = !numhelper(8600)
helpertype = normal
stateno = 8600 ;+ 0 * (var(0) := stateno)
ID = 8600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Super Finish]
type = helper
triggerall = winKO
trigger1 = !numhelper(7610)
helpertype = normal
stateno = 7610 ;+ 0 * (var(0) := stateno)
ID = 7610
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

;[State 4251, Sparks]
;type = explod
;trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
;trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
;anim = ifelse(!var(30), 7001, 7030 + (random % 8))
;ID = 7000
;sprpriority = 5
;postype = p2
;pos = 0, (target, const(size.mid.pos.y))
;random = 60, 60
;facing = -1
;ownpal = 1
;ontop = 1
;pausemovetime = 300
;supermovetime = 300

[State 3610, Hit Sparks]
type = Helper
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
helperType = Normal
stateNo = 8016
ID = 8000
name = "Spark"
sprPriority = 5
posType = p2
pos = 0, (target, const(size.mid.pos.y))
ownPal = 1
onTop = 1
pauseMoveTime = 300
superMoveTime = 300

[State 4251, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
time = 6
freq = 120
ampl = -4

[State 3000, ZOOM]
type = zoom
triggerall = root, var(57)
trigger1 = time<=5
scale = 1 + (0.08*time)
pos = (pos x + target, pos x) / 2, pos y;zoom
ignorehitpause = 1
[State 3000, ZOOM]
type = zoom
triggerall = root, var(57)
trigger1 = time>5
trigger1 = animelemtime(17)<=0
scale = 1.4
pos = (pos x + target, pos x) / 2, pos y;zoom
ignorehitpause = 1

[State 0, Explod]
type = removeexplod
trigger1 = animelem = 14
ID = 4250

[State -3, Kanji]
type = helper
trigger1 = animelem = 17
helpertype = normal
stateno = 7615 ;+ 0 * (var(0) := stateno)
ID = 7615
name = "Kanji"
postype = p1
facing = 1
pos = 0, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999


[State 0, Explod]
type = Explod
trigger1 = animelem = 16
anim = 4263
ID = 4250
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
trans = Sub
sprpriority = -4
ownpal = 0
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = animelem = 16
anim = 4253
ID = 4250
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
trans = Add
sprpriority = -4
ownpal = 0
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = animelem = 16
anim = 3765
ID = 4250
pos = 4,-19
postype = p1  ;p2,front,back,left,right
facing = 1
;trans = Add
sprpriority = -3
ownpal = 1
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43

[State 0, Explod]
type = Explod
trigger1 = animelem = 16
anim = 3766
ID = 4250
pos = 4,-19
postype = p1  ;p2,front,back,left,right
facing = 1
;trans = Sub
sprpriority = -6
ownpal = 1
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 43



[State 4251, Snd]
type = playsnd
trigger1 = animelemtime(17) = 10
value = 4, 100
channel = 0

[State 4251, Snd]
type = playsnd
trigger1 = animelemtime(17) = 10
value = 4, 100
channel = 9

[State 4251, throw]
type = targetstate
trigger1 = animelemtime(17) >= 0 && numtarget
value = 1114003
persistent = 0

[State 0, Explod]
type = removeexplod
trigger1 = time = ifelse(winko,185,160)
ID = 4250

[State 4251, End]
type = changestate
trigger1 = time = ifelse(winko,185,160)
value = 3751
ctrl = 0


;====< HAOH GADOU KEN >=
; Haoh Gadouken
[Statedef 4305]
type = S
physics = N
movetype = A
anim = 4325
ctrl = 0
velset = 0, 0
sprpriority = 4
juggle = 0

[State 105, Dust]
type = helper
trigger1 = !(time%2)
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pos = ifelse(var(2)>1,-30,0), -pos y
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 1100, trail]
type = explod
trigger1 = !time && !prevstateno
ID = 4315
anim = 4305
ownpal = 1
postype = p1
sprpriority = 5
scale = 0.5, 0.5
persistent = 1
pos = 0,0
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
ownpal = 0
removeongethit = 0
ignorehitpause = 1

[State 1100, trail]
type = explod
trigger1 = !time && !prevstateno
ID = 4315
anim = 4315
ownpal = 1
postype = p1
sprpriority = 4
scale = 0.5, 0.5
persistent = 1
pos = 0,0
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
ownpal = 0
removeongethit = 0
ignorehitpause = 1

[State 3015, Flames]
type = explod
trigger1 = 1
anim = 8150
sprpriority = 2
postype = p1
pos = -30, 0
random = 64, 32
vel = -(random / 250.0), 2 -(random / 250.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ignorehitpause = 1
scale = 0.5, 0.5
ownpal = 1

[State 1405, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 10, 4305, 4307)
ignorehitpause = 1
[State 1405, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1405, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1405, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 1405, timevar]
type = varadd
trigger1 = time
var(1) = 1
[State 3005, hitvar]
type = varadd
trigger1 = !time
var(2) = 1

[State 1405, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 0.5, 12)
y = 0

[State 1405, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1405, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 2
length = 5
palcontrast = 75, 20, 0
palmul = 0.75, 0.5, 0.25
trans = add

[State 1405, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
persistent = 0
ignorehitpause = 1

[State 1405, Hit]
type = hitdef
trigger1 = (var(2)<10)
priority = 4, Hit
attr = S, HP
damage = ceil(45 * (root, fvar(12))), 8
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 10), 6
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -6
ground.cornerpush.veloff = 0
air.velocity = -6, -6
guard.velocity = -10.52
fall = 1
fall.recover = 1
fall.recovertime = 20
getpower = 0, 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 50+78*(root,var(1)=2)
palfx.sinadd = 64*(root,var(1)=2), 25*(root,var(1)!=2), 80-16*(root,var(1)=2), 8-4*(root,var(1)=2)
palfx.mul = 128-32*(root,var(1)=2), 256*(root,var(1)!=2), 512-320*(root,var(1)=2)
palfx.time = 30
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1405, Hit]
type = hitdef
trigger1 = (var(2)=10)
priority = 4, Hit
animtype = Diagup
fall.animtype = Diagup
attr = S, HP
damage = ceil(45 * (root, fvar(12))), 8
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 10), 6
sparkno = -1
guard.sparkno = -1; = s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -7.5
ground.cornerpush.veloff = 0
air.velocity = -6, -7.5
guard.velocity = -10.52
fall = 1
fall.recover = 1
fall.recovertime = 20
getpower = 0, 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 50+78*(root,var(1)=2)
palfx.sinadd = 64*(root,var(1)=2), 25*(root,var(1)!=2), 80-16*(root,var(1)=2), 8-4*(root,var(1)=2)
palfx.mul = 128-32*(root,var(1)=2), 256*(root,var(1)!=2), 512-320*(root,var(1)=2)
palfx.time = 30
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1005, hitspark]
type = helper
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
posType = P1
pos = ifElse(p2dist x < 0, 0, ifelse(p2dist x < 20, ceil(p2dist x), 20)), 0
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 1006, Counter FX]
type = Helper
trigger1 = MoveContact = 1 && NumTarget && (root, var(59))
trigger1 = !(Target, HitShakeOver)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < 20, ceil(P2Dist x), 20)), 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 1
ignoreHitPause = 1

[State 1405, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(8150) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 8150
ID = 8150
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 1405, End]
type = changestate
trigger1 = var(1) >= 5 * ifelse(root, var(1)>1,1.5,1) && time
value = 4306
ignorehitpause = 1
[State 1405, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 10, 4305, 4307)
ignorehitpause = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]
id = 4315
[State 1405, End]
type = destroyself
trigger1 = pos x != [ -280/camerazoom , 280/camerazoom]

[Statedef 4306]
type = A
physics = N
movetype = I
anim = 4326
ctrl = 0
sprpriority = 4
movehitpersist = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 4315

[State 1100, trail]
type = explod
trigger1 = !time
ID = 4316
anim = 4306
ownpal = 1
postype = p1
sprpriority = 5
scale = 0.5, 0.5
persistent = 1
pos = 0,0
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
ownpal = 0
removeongethit = 0
ignorehitpause = 1

[State 1100, trail]
type = explod
trigger1 = !time
ID = 4316
anim = 4316
ownpal = 1
postype = p1
sprpriority = 4
scale = 0.5, 0.5
persistent = 1
pos = 0,0
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
ownpal = 0
removeongethit = 0
ignorehitpause = 1


[State 3006, Vel]
type = velmul
trigger1 = 1
x = 0.8
[State 3006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, End]
type = destroyself
trigger1 = !animtime

[Statedef 4307]
type = A
physics = N
movetype = I
anim = 4326
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = !time
id = 4315

[State 1100, trail]
type = explod
trigger1 = !time
ID = 4316
anim = 4306
ownpal = 1
postype = p1
sprpriority = 5
scale = 0.5, 0.5
persistent = 1
pos = 0,0
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
ownpal = 0
removeongethit = 0
ignorehitpause = 1

[State 1100, trail]
type = explod
trigger1 = !time
ID = 4316
anim = 4316
ownpal = 1
postype = p1
sprpriority = 4
scale = 0.5, 0.5
persistent = 1
pos = 0,0
facing = 1
vfacing = 1
bindtime = -1
removetime = -2
ownpal = 0
removeongethit = 0
ignorehitpause = 1

[State 3007, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3007, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 3007, End]
type = destroyself
trigger1 = !animtime


;====< SAIKYOU -RYUU BOUGYO >=
[Statedef 1505]
physics = N
velset = 0, 0
anim = 1505
[State 1505, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 3005, timevar]
type = varadd
trigger1 = time
var(1) = 1
[State 1505, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
[State 1505, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1505
ignorehitpause = 1
[State 1505, bound]
type = screenbound
trigger1 = 1
value = 0
[State 1505, Push]
type = playerpush
trigger1 = 1
value = 1
[State 1505, Vel]
type = velset
trigger1 = !time && !prevstateno
x = ifelse(var(10) = 4, 40, ifelse((var(10)=[6,7]),30,20))
[State 1505, Vel]
type = velmul
trigger1 = 1
x = 0.9
[State 1505, Snd]
type = playsnd
trigger1 = root, stateno != 3700 && root, stateno != 4200 && !time
value = 5, 2
[State 1505, Dust]
type = explod
trigger1 = root, stateno != 3700 && root, stateno != 4200 && (p2bodydist x = [ -5, 5]) && (enemynear, statetype != A) && !(time % 3)
anim = 7103
ID = 7103
sprpriority = 2
postype = p1
pos = 0, -pos y
scale = 0.5, 0.5
removetime = -2
ownpal = 1
[State 1505, End]
type = destroyself
trigger1 = var(1) >= ifelse((var(10)=[6,7]),3,20)


;====< OTOKO CHARGE >=
[Statedef 4006]
physics = N
velset = 0, 0
anim = 8500
sprpriority = 3

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -8

[State 4006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 4006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = floor(time * 2.13), 256
[State 4006, Shrink]
type = angledraw
trigger1 = 1
scale = 0.0125 * time, 0.0125 * time
[State 4006, Snd]
type = playsnd
trigger1 = !time
value = 5, 8

[State 4006, BG PalFX]
type = bgpalfx
trigger1 = root, var(33) = 0
time = 1
color = 256 -floor(2.13 * time)
mul = (256 -floor(2.13 * time)), (256 -floor(2.13 * time)), (256 -floor(0.53 * time))
[State 4006, End]
type = destroyself
trigger1 = root, animelemtime(6) >= 0
trigger2 = root, stateno != 4001 || root, movetype != A

;--- Otoko Particles ---
[Statedef 4007]
type = A
physics = N
movetype = I
anim = 9741
ctrl = 0
velset = 0, 0

[State 7243, Bind]
type = bindtoroot
trigger1 = !(time % 2)
;pos = ceil(-78 + (random / 6.25)), ceil(24 -(random / 6.25))
pos = floor(15 * (root, const(size.xscale)) -100 +(random%200)), floor(-95 * (root, const(size.yscale)) -100 +(random%200))

[State 8331, Particle]
type = explod
triggerall = time >= 12
;trigger1 = (time % (8-(ifelse(time>=13,6,time/2)))) = 1
trigger1 = (time % 2) = 1
anim = 4006
sprpriority = ifelse(random < 500, 5, -1)
postype = p1
vel = ((rootdist x + 2) / 16.0), ((rootdist y -56) / 16.0)
scale = ifelse((time % 2), 0.4, .2), ifelse((time % 2), 0.5, .25)
pausemovetime = -1
facing = ifelse(random<500,-1,1)
vfacing = ifelse(random<500,-1,1)
supermovetime = -1
ownpal = 1

[State 8331, End]
type = removeexplod
trigger1 = root, animelemtime(6)>=0
[State 8331, End]
type = destroyself
trigger1 = root, animelemtime(6)>=0



;====< OTOKO PORTRAIT >=
[Statedef 4008]
physics = N
velset = 0, 0
anim = 4008
sprpriority = -5

[State 4008, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1

[State 7610, Dan]
type = explod
trigger1 = !time
anim = 4008
ID = 4008
sprpriority = -5
postype = left
pos = 160, floor((gameheight / gamewidth) * 80) - 60
scale = 0.5 * (1.3333333 * gameheight / gamewidth), 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1

[State 4008, palfx]
type = bgpalfx
trigger1 = 1
time = 2
mul = floor(8.53 * time), floor(8.53 * time), floor(8.53 * time)

[State 4008, Trans]
type = modifyexplod
trigger1 = 1
ID = 4008
trans = addalpha
alpha = 256 -floor(time * 8.53), 256

[State 4008, End]
type = removeexplod
trigger1 = time >= 30
[State 4008, End]
type = destroyself
trigger1 = time >= 30


;====< JUMP DUST >=
[Statedef 7100]
physics = N
velset = 0, 0
anim = 9741
[State 7100, Bind]
type = bindtoroot
trigger1 = time
[State 7100, Dust]
type = explod
trigger1 = !time
anim = 8100
ID = 8100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
[State 7100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 8101
ID = 8100
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
[State 7100, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
[State 7100, End]
type = destroyself
trigger1 = time >= 7

;====< FLAMES >=
;--- ORANGE ---
[Statedef 7180]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 7180
ID = 7180
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H && (enemynear, stateno!=[1251110,1251113])|| enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120


;--- SELF---
[Statedef 7181]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7181, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7181, flames]
type = explod
trigger1 = 1
anim = 7180
ID = 7180
sprpriority = 3
postype = p1
vel = -.2, -.75
pos = (root, const(size.mid.pos.x)), ifelse((root, statetype = L), 0, (root, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7181, Pos]
type = posadd
trigger1 = 1
x = ceil(rootdist x)
y = ceil(rootdist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = root, ctrl
trigger2 = root, movetype != H || root, stateno = 5300
trigger3 = root, statetype = L && (root, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = time >= 120


;--- PURPLE---
[Statedef 7182]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 7181
ID = 7181
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H && (enemynear, stateno!=[1251110,1251113])|| enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120



;--- BLUE ---
[Statedef 8150]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 8150
ID = 8150
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H && (enemynear, stateno!=[1251110,1251113])|| enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120

;--- GREEN ---
[Statedef 8151]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 7180, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 7180, flames]
type = explod
trigger1 = 1
anim = 8151
ID = 8151
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
scale = 0.5, 0.5
ownpal = 1
[State 7180, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State End]
type = destroyself
triggerall = numenemy
trigger1 = enemynear, ctrl
trigger2 = enemynear, movetype != H && (enemynear, stateno!=[1251110,1251113])|| enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120


;====< SANDALS >=
[Statedef 6005]
type = A
physics = N
movetype = I
ctrl = 0
anim = 6005
velset = -2 + (random / 250.0), -7.5 -(random / 133.3)
sprpriority = 2
[State 6005, Vel]
type = velset
trigger1 = (vel y = (0, 2]) && pos y >= -2
y = 0
[State 6005, Pos]
type = posset
trigger1 = pos y >= 0 && !vel y
y = 0
[State 6005, Pos]
type = velmul
trigger1 = pos y >= 0 && !vel y && !pos y
x = 0.8
[State 6005, Dust]
type = explod
trigger1 = vel y > 0 && pos y >= -ceil(vel y) && time < 90
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
scale = 0.25, 0.25
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 6005, Vel]
type = veladd
trigger1 = 1
y = 0.35
[State 6005, Vel]
type = velmul
trigger1 = vel y > 0 && pos y >= -ceil(vel y)
x = -.5 + (random / 500.0)
y = -.66

[State 6005, spin]
type = angleadd
trigger1 = 1
value = -12
[State 6005, spin]
type = angledraw
trigger1 = 1
[State 6005, Fade]
type = trans
trigger1 = time >= 60
trans = addalpha
alpha = ceil(256 -4.27 * (time -60)), ceil(4.27 * (time -60))
[State 6005, End]
type = destroyself
trigger1 = time >= 120

;Shisshou B Shockwave
[Statedef 4050]
physics = N
velset = 0, 0
anim = 9741
[State 7050, palfx]
type = palfx
trigger1 = time = 5
time = 10
add = 0, 0, 0
sinadd = -255, -255, -255, 40
[State 7050, Circle]
type = explod
trigger1 = !time
anim = 4051
ID = 4051
sprpriority = 5
postype = p1
removetime = 15
pausemovetime = -1
supermovetime = -1
[State 7050, Circle]
type = explod
trigger1 = !time
anim = 4050
ID = 4050
sprpriority = 5
postype = p1
removetime = 15
pausemovetime = -1
supermovetime = -1
[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 4051
scale = 0.0375 * time, 0.0375 * time
[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 4050
scale = 0.05 * time, 0.05 * time
[State 7050, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 7050, End]
type = destroyself
trigger1 = time >= 15

[Statedef 3625]
physics = N
anim = 9741
[State 3125, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 3125, Dust]
type = explod
trigger1 = !time
anim = 3625
ID = 3625
sprpriority = -2
postype = p1
removetime = 16
[State 3125, Fade]
type = palfx
trigger1 = !time
color = 0
mul = 384, 384, 384
sinadd = -255, -255, -255, 64
time = 16
[State 3125, Shrink]
type = modifyexplod
trigger1 = 1
ID = 3625
scale = 0.2 + (0.05 * time) * const(size.xscale), 0.05 + (0.0125 * time) * const(size.yscale)
[State 3125, End]
type = destroyself
trigger1 = time >= 17



;====< KANJI B.G. >=
;=<Kanji BG>=
[Statedef 7610]
physics = N
velset = 0, 0
anim = 9741

[State 7610, Snd]
type = playsnd
trigger1 = !time
value = 7, 5

[State 7610, Snd]
type = playsnd
trigger1 = !time
value = 7, 12

[State 7610, Kanji]
type = explod
trigger1 = !time
anim = 7610
ID = 7610
sprpriority = -15
postype = left
ownpal = 0
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.24 * (1.3333333 * gameheight / gamewidth), 0.24 * (1.3333333 * gameheight / gamewidth)
bindtime = -1

[State 7610, Kanji]
type = explod
trigger1 = !time
anim = 7610
ID = 7610
sprpriority = -15
postype = left
ownpal = 0
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.24 * (1.3333333 * gameheight / gamewidth), 0.24 * (1.3333333 * gameheight / gamewidth)
bindtime = -1

[State 7610, flamebg]
type = explod
trigger1 = !time
anim = 7611
ID = 7611
sprpriority = -16
postype = left
pos = 0, floor((gameheight / gamewidth) * 80) - 60
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = 300
supermovetime = 300


[State 7610, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = nobardisplay
ignorehitpause = 1

[State 7610, black]
type = bgpalfx
trigger1 = time < 150
time = 2
add = 255, 255, 255

[State 7610, black]
type = bgpalfx
trigger1 = time = 150
time = 30
add = 255, 255, 255
sinadd = -255, -255, -255, 120

[State 6200, Fade]
type = palfx
trigger1 = time = 120
time = 30
;sinadd = -255, -255, -255, 120
sinadd = -255, -255, -255, 120

[State 7610, Assert]
type = assertspecial
trigger1 = time < 150
flag = noFG
ignorehitpause = 1

[State 7610, Safety]
type = removeexplod
trigger1 = time >= 150

[State 7610, End]
type = destroyself
trigger1 = time >= 150

; Oyaji Kanji
[Statedef 7615]
type = S
physics = N
movetype = A
anim = 9741
ctrl = 0
velset = 0, 0
sprpriority = -3

[State 0, BindToParent]
type = BindToParent
trigger1 = 1
time = 1
pos = 0,0
ignorehitpause = 1
persistent = 1
;
;[State 0, PalFX]
;type = PalFX
;trigger1 = 1
;time = 1
;;mul = 128,128,128
;;mul = ifelse(time<=16,time*10,160),ifelse(time<=16,time*10,160),ifelse(time<=16,time*10,160)
;mul = 160,160,160
;;mul = 192,192,192

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 4295-((facing=1)*5)
ID = 4250
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = facing
trans = Add
sprpriority = -2
ownpal = 0
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 0

[State 0, Explod]
type = Explod
trigger1 = !time
anim = 4296-((facing=1)*5)
ID = 4250
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = facing
trans = Sub
sprpriority = -3
ownpal = 0
scale = const(size.xscale), const(size.yscale)
removetime = -1
bindtime = -1
supermovetime = 0

[State 6200, Fade]
type = palfx
trigger1 = time = ifelse(winko,65,40)
time = 20
;sinadd = -255, -255, -255, 120
sinadd = -255, -255, -255, 80

[State 0, Explod]
type = removeexplod
trigger1 = time = ifelse(winko,85,60)

[State 0, Explod]
type = destroyself
trigger1 = time = ifelse(winko,85,60)



;====< SPARKS >=
;--- Guard Normal ---
[Statedef 8000]
type = A
physics = N
movetype = I
anim = 8000
velset = 0, 0
sprpriority = 5

[State 8000, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8000, Scale]
type = angledraw
trigger1 = 1
scale = 0.125 + (0.046875 * time), 0.125 + (0.046875 * time)
[State 8000, Trans]
type = trans
trigger1 = time < 4
trans = addalpha
alpha = 256, 256
[State 8000, Trans]
type = trans
trigger1 = time >= 4
trans = addalpha
alpha = 256 - 64 * (time -4), 256

[State 8000, End]
type = destroyself
trigger1 = time >= 8


;--- Guard Special ---
[Statedef 8001]
type = A
physics = N
movetype = I
anim = 8001
velset = 0, 0
sprpriority = 5

[State 8001, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8001, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
[State 8001, Trans]
type = trans
trigger1 = time < 4
trans = addalpha
alpha = 256, 256
[State 8001, Trans]
type = trans
trigger1 = time >= 4
trans = addalpha
alpha = 256 - 64 * (time -4), 256

[State 8001, End]
type = destroyself
trigger1 = time >= 8


;--- Weak ---
[Statedef 8010]
type = A
physics = N
movetype = I
anim = 8010
velset = 0, 0
sprpriority = 5

[State 8010, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8010, Angle]
type = angleset
trigger1 = !time
value = 30 * (random % 12)
[State 8010, Angle]
type = angleadd
trigger1 = 1
value = 30
[State 8010, Scale]
type = angledraw
trigger1 = time < 10
scale = 0.3 -(time * 0.03), 0.3 -(time * 0.03)
[State 8010, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0
[State 8010, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8010, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.15 + (0.009375 * time), 0.15 + (0.009375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8010, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.15 + (0.009375 * time), 0.15 + (0.009375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8010, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 3
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.3 -(0.0375 * time), 0.3 -(0.0375 * time)
trans = addalpha
alpha = 128 -(16 * time), 256

[State 8010, End]
type = removeexplod
trigger1 = time >= 16
[State 8010, End]
type = destroyself
trigger1 = time >= 16


;--- Medium ---
[Statedef 8011]
type = A
physics = N
movetype = I
anim = 8010
velset = 0, 0
sprpriority = 5

[State 8011, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8011, Angle]
type = angleset
trigger1 = !time
value = 30 * (random % 12)
[State 8011, Angle]
type = angleadd
trigger1 = 1
value = 30
[State 8011, Scale]
type = angledraw
trigger1 = time < 10
scale = 0.35 -(time * 0.035), 0.35 -(time * 0.035)
[State 8011, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0
[State 8011, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8011, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.175 + (0.0109375 * time), 0.175 + (0.0109375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8011, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.175 + (0.0109375 * time), 0.175 + (0.0109375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8011, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 3
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.35 -(0.04375 * time), 0.35 -(0.04375 * time)
trans = addalpha
alpha = 128 -(16 * time), 256

[State 8011, End]
type = removeexplod
trigger1 = time >= 16
[State 8011, End]
type = destroyself
trigger1 = time >= 16


;--- Strong ---
[Statedef 8012]
type = A
physics = N
movetype = I
anim = 8010
velset = 0, 0
sprpriority = 5

[State 8012, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8012, Angle]
type = angleset
trigger1 = !time
value = 30 * (random % 12)
[State 8012, Angle]
type = angleadd
trigger1 = 1
value = 30
[State 8012, Scale]
type = angledraw
trigger1 = time < 10
scale = 0.4 -(time * 0.04), 0.4 -(time * 0.04)
[State 8012, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0
[State 8012, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8012, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.2 + (0.0125 * time), 0.2 + (0.0125 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8012, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.2 + (0.0125 * time), 0.2 + (0.0125 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8012, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 3
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.4 -(0.05 * time), 0.4 -(0.05 * time)
trans = addalpha
alpha = 128 -(16 * time), 256

[State 8012, End]
type = removeexplod
trigger1 = time >= 16
[State 8012, End]
type = destroyself
trigger1 = time >= 16


;--- Special ---
[Statedef 8013]
type = A
physics = N
movetype = I
anim = 8010
velset = 0, 0
sprpriority = 5

[State 8013, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8013, Angle]
type = angleset
trigger1 = !time
value = 30 * (random % 12)
[State 8013, Angle]
type = angleadd
trigger1 = 1
value = 30
[State 8013, Scale]
type = AngleDraw
trigger1 = Time < 10
scale = 0.45 - (Time * 0.045), 0.45 - (Time * 0.045)
ignoreHitPause = 1
[State 8012, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0
[State 8013, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8013, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.225 + (0.0140625 * time), 0.225 + (0.0140625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8013, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.225 + (0.0140625 * time), 0.225 + (0.0140625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8013, P2 Back]
type = explod
trigger1 = !time
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.4, 0.4
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8013, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 3
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.45 -(0.05625 * time), 0.45 -(0.05625 * time)
trans = addalpha
alpha = 192 -(24 * time), 256

[State 8013, End]
type = removeexplod
trigger1 = time >= 16
[State 8013, End]
type = destroyself
trigger1 = time >= 16


;--- Super ---
[Statedef 8014]
type = A
physics = N
movetype = I
anim = 8010
velset = 0, 0
sprpriority = 5

[State 8014, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8014, Angle]
type = angleset
trigger1 = !time
value = 30 * (random % 12)
[State 8014, Angle]
type = angleadd
trigger1 = 1
value = 30
[State 8014, Scale]
type = angledraw
trigger1 = time < 10
scale = 0.5 -(time * 0.05), 0.5 -(time * 0.05)
[State 8012, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0
[State 8014, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8014, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.25 + (0.015625 * time), 0.25 + (0.015625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8014, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 5
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.25 + (0.015625 * time), 0.25 + (0.015625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8014, P2 Back]
type = explod
trigger1 = !time
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.5, 0.5
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8014, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
sprpriority = 3
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.5 -(0.0625 * time), 0.5 -(0.0625 * time)
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8014, End]
type = removeexplod
trigger1 = time >= 16
[State 8014, End]
type = destroyself
trigger1 = time >= 16


; --- SGS ---
[StateDef 8015]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5
ontop = 1

[State 4015, BindToRoot]
type = BindToRoot
triggerAll = (Root, StateNo = 4201) && (Root, AnimElemTime(2) > 0) && (Root, AnimElemTime(16) < 0)
trigger1 = !Time
pos = (Random % 40) * ifElse(Random % 2, -1, 1) + 26, -50 - (Random % 40) * ifElse(Random % 2, -1, 1)
facing = 1
[State 0, RemapPal]
type = RemapPal
trigger1 = !time
source = 8010,0
dest = 4050,1
;dest = 4050,3
;dest = 8510,0
;dest = 7610,0
[State 0, RemapPal]
type = RemapPal
trigger1 = !time
source = 8100,0
;dest = 4050,1
dest = 4050,3
;dest = 8510,0
;dest = 7610,0

[State 8015, Assert: NoShadow]
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
anim = 8010
ID = 10
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
trigger1 = time < 10
ID = 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

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
onTop = 1

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
onTop = 1

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
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

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
onTop = 1

[State 8014, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 0, RemapPal]
type = RemapPal
trigger1 = time >= 16
source = 8010,0
dest = 8010, 0
[State 0, RemapPal]
type = RemapPal
trigger1 = time >= 16
source = 8100,0
dest = 8100, 0

[State 8014, Remove Explods]
type = RemoveExplod
trigger1 = time >= 16

[State 8014, End]
type = DestroySelf
trigger1 = Time >= 16


; --- JKS ---
[StateDef 8016]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5
ontop = 1

[State 4015, BindToRoot]
type = BindToParent
triggerAll = (parent, stateNo = 4251) && (parent, AnimElemTime(2) > 0) && (parent, AnimElemTime(17) < 0)
trigger1 = !Time
pos = (Random % 40) * ifElse(Random % 2, -1, 1) + 26, -50 - (Random % 40) * ifElse(Random % 2, -1, 1)
facing = 1

[State 8015, Assert: NoShadow]
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
anim = 8010
ID = 10
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = 5
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
trigger1 = time < 10
ID = 10
scale = 0.5 - (Time * 0.05), 0.5 - (Time * 0.05)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

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
onTop = 1

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
onTop = 1

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
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

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
onTop = 1

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


; --- Oyaji Beam ...
[StateDef 8017]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

;[State 4015, BindToRoot]
;type = BindToRoot
;trigger1 = !Time
;pos = (Random % 40) * ifElse(Random % 2, -1, 1) + 26, -50 - (Random % 40) * ifElse(Random % 2, -1, 1)
;facing = 1

[State 8015, Assert: NoShadow]
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
triggerAll = (Root, StateNo = 4001)
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
onTop = 1

[State 8014, Scale Center Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, Streaks Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
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
onTop = 1

[State 8014, Scale Streaks Explod]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 0.25 + (0.015625 * Time), 0.25 + (0.015625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8014, P2 Back Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
trigger1 = !Time
anim = 8013
ID = 3
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
sprPriority = -3
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8014, Scale P2 Back Explod]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 0.5,0.5
trans = AddAlpha
alpha = 256 - (32 * Time), 256

[State 8014, Impact Explod]
type = Explod
triggerAll = (Root, StateNo = 4001)
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
onTop = 1

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

;--- Reversal ---
[Statedef 8020]
type = A
physics = N
movetype = I
anim = 8020
velset = 0, 0
sprpriority = 5

[State 8020, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8020, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.09375 * time), 0.25 + (0.09375 * time)
[State 8020, Trans]
type = trans
trigger1 = time < 4
trans = addalpha
alpha = 256, 256
[State 8020, Trans]
type = trans
trigger1 = time >= 4
trans = addalpha
alpha = 256 - 64 * (time -4), 256

[State 8020, End]
type = destroyself
trigger1 = time >= 8


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


;--- Impact ---
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
anim = 8111
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

[State 8200, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.017 * time), 0.25 + (0.017 * time)
[State 8200, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -17.1 * time), 256

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
trigger1 = (root, stateno = 740)
pos = 4, 0
[State 8330, Snd]
type = playsnd
trigger1 = !time
value = 7, 4
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
scale = 0.5, 0.1 + (0.4 * (root, power / 3000.0))
[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power >= 3000
ID = 8330
scale = 0.5, 0.5

[State 8330, End]
type = stopsnd
trigger1 = root, stateno != 740
channel = 0
[State 8330, End]
type = removeexplod
trigger1 = root, stateno != 740
ID = 8330
[State 8330, End]
type = destroyself
trigger1 = root, stateno != 740


;--- Particles ---
[Statedef 8331]
type = A
physics = N
movetype = I
anim = 9741
ctrl = 0
velset = 0, 0

[State 7243, Bind]
type = bindtoroot
trigger1 = !(time % 4)
pos = ceil(-78 + (random / 6.25)), ceil(24 -(random / 6.25))

[State 8331, Particle]
type = explod
trigger1 = (time % 8) = 1
anim = 8331
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x + 2) / 16.0), ((rootdist y -56) / 16.0)
scale = ifelse(random < 500, 0.5, -.5), ifelse(random < 500, 0.5, -.5)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8331, End]
type = removeexplod
trigger1 = root, stateno != 740
[State 8331, End]
type = destroyself
trigger1 = root, stateno != 740


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
[State 8400, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5
[State 8400, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256
[State 8400, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

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

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S7,0
volume = 255
channel = 0

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
[State 8500, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
[State 8500, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

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

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S7,0
;value = S7,9
volume = 255
channel = 0

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
[State 8510, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
[State 8510, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

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
[StateDef 8520]
type = A
velset = 0,0
anim = 8520
sprPriority = 5

[State 8520, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S7,10
volume = 255
channel = 0

[State 8520, Assert: NoBarDisplay, NoBG, NoFG]
type = AssertSpecial
trigger1 = Time < 40
flag = NoBarDisplay
flag2 = NoBG
flag3 = NoFG

[State 8520, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8520, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8520, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8520, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8520, Portrait 1]
type = Explod
trigger1 = !Time
anim = 8525
ID = 20
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1
;
[State 8520, Portrait 2]
type = Explod
trigger1 = !Time
anim = 8525
ID=21
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1

[State 8520, Scale Portrait 1a]
type = ModifyExplod
trigger1 = NumExplod(20) && Time < 16
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 1 - (0.03125 * Time), 1 - (0.03125 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 2a]
type = ModifyExplod
trigger1 = NumExplod(21) && Time < 16
ID = 21
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 2 - (0.09375 * Time), 2 - (0.09375 * Time)
trans = AddAlpha
alpha = (8 * Time), 256

[State 8520, Scale Portrait 1b]
type = ModifyExplod
trigger1 = NumExplod(20) && (Time = [16,32])
ID = 20
posType = Back
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5
trans = AddAlpha
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
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8521
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8520, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8520, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1-(0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8520, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8520, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8522
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1 ,1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8520, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8520, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8520, End]
type = DestroySelf
trigger1 = Time >= 40


;====<SUPER FINISH>=
[StateDef 8600]
type = A
velSet = 0,0
anim = 9741

[State 7600, Snd]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 7600, Snd]
type = assertspecial
trigger1 = var(0) = 10 && root, var(10) = 1
flag = nomusic

[State 8600, Super Finish Sound]
type = PlaySnd
trigger1 = !Time
value = 7,ifelse(parent,stateno=4251,12,7)
channel = 0

[State 8600, SndPan]
type = SndPan
trigger1 = Time <= 80
channel = 1
absPan = ceil(sin(GameTime / 20.0 * pi) * 160)

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time < 16
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = BGpalFX
trigger1 = Time = [16,24)
time = 1
mul = 32 * (Time - 16), 32 * (Time - 16), 32 * (Time - 16)

[State 8600, Move Name: Custom Combo]
type = VarSet
trigger1= !Time && Root, var(20)
var(0) = 0

[State 8600, Move Name: Chouhatsu Densetsu]
type = VarSet
trigger1 = !Time && (root, stateno =  3300)
var(0) = 1 ; = "Chouhatsu Densetsu"
;var(0) = 8 ; = "Legendary Taunt"

[State 8600, Move Name: Chouhatsu Shinwa]
type = VarSet
trigger1 = !Time && (root, var(33))
var(0) = 2 ; = "Chouhatsu Shinwa"
;var(0) = 9 ; = "Mythical Taunt"

[State 8600, Move Name: Sisshou Buraiken]
type = VarSet
trigger1 = !Time && (root, stateno =  3600)
trigger2 = !Time && (root, stateno =  3700)
var(0) = 3

[State 8600, Move Name: Haoh Gadouken]
type = VarSet
trigger1 = !Time && (numhelper(4305))
var(0) = 4

[State 8600, Move Name: Hisshou Buraiken]
type = VarSet
trigger1 = !Time && (root, stateno =  3200)
trigger2 = !Time && (root, stateno =  3500)
var(0) = 5

[State 8600, Move Name: Jun Koku Satsu]
type = VarSet
trigger1 = !Time && (root, stateno =  [4200,4209])
var(0) = 6

[State 8600, Move Name: Koryuu Rekka]
type = VarSet
trigger1 = !Time && (root, stateno =  3100)
var(0) = 7

[State 8600, Move Name: Otoko Michi]
type = VarSet
trigger1 = !Time && (root, stateno =  4001)
var(0) = 10

[State 8600, Move Name: Oyaji Blast]
type = VarSet
trigger1 = !Time && (root, stateno =  3700)
;var(0) = 15 ; = "Oyaji Burasutto"
var(0) = 16 ; = "Oyaji Blast"

[State 8600, Move Name: Shinkuu Gadouken]
type = VarSet
trigger1 = !Time && (numhelper(3005))
trigger2 = !Time && (numhelper(3405))
var(0) = 11

[State 8600, Move Name: Shun Goku Satsu]
type = VarSet
trigger1 = !Time && (root, stateno =  [4400,4409])
var(0) = 12

[State 8600, Move Name: Premium Sign]
type = VarSet
trigger1 = !Time && (root, stateno =  1300)
trigger2 = !Time && (numhelper(1305))
var(0) = 13

[State 8600, Move Name: Kyuukyoku Tenchi Gadou Zuki]
type = VarSet
trigger1 = !Time && (root, stateno =  1600) && root, var(10)=4
var(0) = 14

[State 8600, Super Finish Explod]
type = Explod
trigger1 = !Time
anim = 8600
ID = 8600
ontop = 1
postype = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Super Finish Explod Fade]
type = ModifyExplod
trigger1 = NumExplod(8600)
ID = 8600
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), 256

[State 8600, Text 1]
type = Explod
trigger1 = !Time
anim = 8610 + var(0)
ID = 10
onTop = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 2]
type = Explod
trigger1 = !Time
anim = 8610 + var(0)
ID = 11
onTop = 1
posType = left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 1 Fade]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
trans = AddAlpha
alpha = ifElse(Time < 16, 256, 256 - 32 * (Time - 16)), ifElse(Time < 16, 0, 32 * (Time - 16))

[State 8600, Text 2 Fade]
type = ModifyExplod
trigger1 = NumExplod(11)
ID = 11
scale = 0.5 + (0.0625 * Time), 0.5 + (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time), 32 * Time

[State 8600, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8601
ID = 8601
under = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
bindTime = -1
removeTime = 16
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Circle Fade]
type = ModifyExplod
trigger1 = NumExplod(8601)
ID = 8601
scale = (0.25 * Time) * (1.3333333 * GameHeight / GameWidth), (0.25 * Time) * (1.3333333 * GameHeight / GameWidth)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8600, Assert: NoFG]
type = AssertSpecial
trigger1 = Time < 16
flag = NoFG

[State 8600, Assert: NoBarDisplay]
type = AssertSpecial
trigger1 = Time < 24
flag = NoBarDisplay

[State 8600, RemoveExplod]
type = RemoveExplod
trigger1 = Time >= 24
trigger2 = RoundState < 3

[State 8600, End]
type = DestroySelf
trigger1 = RoundState < 3



;====< CAMERA CONTROL >=
[Statedef 7650]
physics = N
velset = 0, 0
anim = 9741
[State 7650, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
[State 7650, End]
type = destroyself
trigger1 = roundstate = 2
