; _______________________________________
;| Dudley by Dick Buckus & Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;=< HYPER STATES >=
;====

; Corkscrew Blow
[Statedef 3000]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
anim = 3000
ctrl = 0
facep2 = 1
sprpriority = 2

[State 0, Explod]
type = Explod
trigger1 = animelemtime(13) = 0 || animelemtime(13) = 5 || animelemtime(13) = 10
anim = 6028
ID = 6028
pos = 20,0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = 0.125,0.125
sprpriority = 5

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[200,699])
value = 1

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[1000,2999])
value = .8

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [0,46]
value = SCA;,NA,SA,HA,NP,SP,HP,NT,ST,HT

[State 3000, Super A]
type = SuperPause
trigger1 = AnimElem = 1
time=43
movetime=43
pos = 25, -57
anim = -1
darken = 0
unhittable = 1
poweradd = -1000

[State 3000, Helper]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "Super Charge"
ID = 8500
stateno = 8500
pos = -12,-52
postype = p1
size.xscale = 1
size.yscale = 1
sprpriority = 2
facing = 1
ownpal = 1
supermovetime=300

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S3000,0
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = S3000,1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 12
value = S1,3

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 13
x = 8.8

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 17
x = 0

[State 0, Explod]
type = Explod
trigger1 = animelem = 13
anim = 3001
ID = 3001
pos = -20*const(size.xscale),1*const(size.yscale)
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
scale = 0.5*const(size.xscale),0.5*const(size.yscale)
sprpriority = 5
ownpal = 1
ignorehitpause = 0
removeongethit = 0
;[State 0, Explod]
;type = Explod
;trigger1 = animelem = 13
;anim = 3002
;ID = 3002
;pos = -20,1
;postype = p1  ;p2,front,back,left,right
;bindtime = -1
;removetime = -2
;scale = 0.5*const(size.xscale),0.5*const(size.yscale)
;sprpriority = 4
;ownpal = 1
;removeongethit = 0

[State 3000, 5]
type = HitDef
trigger1 = animelem=13||animelem=14||animelem=15||animelem=16
attr = S, HA
animtype = Hard
damage = 45,10
getpower = 0
priority = 6
guardflag = MA
hitflag = MAF
pausetime = 4,16
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-60
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 30
ground.hittime = 30
ground.velocity = -3, -3
air.velocity = -3,-1
p2facing = 1
envshake.time=16
envshake.freq=60
envshake.ampl=4
fall = 1
fall.recover = 0

[State 3000, 5]
type = HitDef
trigger1 = animelem=17
attr = S, HA
animtype = Hard
damage = 46,10
getpower = 0
priority = 6
guardflag = MA
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-60
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 30
ground.hittime = 30
ground.velocity = -9, -4
air.velocity = -8.7,-2
p2facing = 1
envshake.time=16
envshake.freq=60
envshake.ampl=4
fall = 1
fall.recover = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(18)>=0
movetype=I

[State 3000, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;--------------------------------------------------------------------------------
; Rocket Uppercut
[Statedef 3010]
type = S
movetype= A
physics = N
velset = 0, 0
juggle = 0
anim = 3010
ctrl = 0
facep2 = 1

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[200,699])
value = 1

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[1000,2999])
value = .8

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3010
trigger1 = time = [0,46]
value = SCA;,NA,SA,HA,NP,SP,HP,NT,ST,HT

[State 3000, Super A]
type = SuperPause
triggerall = anim = 3010
trigger1 = AnimElem = 1
time=43
movetime=43
pos = 25, -57
anim = -1
darken = 0
unhittable = 1
poweradd = -1000

[State 3000, Helper]
type = Helper
triggerall = anim = 3010
trigger1 = animelem = 1
helpertype = normal ;player
name = "Super Charge"
ID = 8500
stateno = 8500
pos = 52,-38
postype = p1
size.xscale = 1
size.yscale = 1
sprpriority = 2
facing = 1
ownpal = 1
supermovetime=300

[State 0, Width]
type = Width
trigger1 = 1
edge = 20,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S3010,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,3
channel = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem=2||animelem=3||animelem=7
x = 10

[State 3011, VelSet]
type = StatetypeSet
trigger1 = AnimElemtime(7)>=0 && animelemtime(14)<0
trigger2 = AnimElemtime(20)>=0 && animelemtime(29)<0
trigger3 = AnimElemtime(35)>=0
statetype=A
physics = N

[State 0, PosSet]
type = StateTypeSet
trigger1= animelemtime(14)>=0 && animelemtime(20)<0
trigger2= animelemtime(29)>=0 && animelemtime(35)<0
statetype=S
physics = N

[State 3011, VelSet]
type = VelSet
triggerall = anim = 3010
trigger1 = AnimElem = 7
x = 1
y = -5;-var(1)*2.5
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = animelem = 7
stateno = 8100
pos = 0, 0
sprpriority = -1
[State 3011, VelAdd]
type = VelAdd
triggerall = anim = 3010
trigger1 = AnimElemtime(7)>0 && animelemtime(14)<0
y = .5

[State 0, Explod]
type = helper
triggerall = anim = 3010
trigger1 = animelem = 35
helpertype = normal
ID = 3015
stateno = 3015
postype = p1
pos = 0, 0
size.xscale = 1
size.yscale = 1

[State 1051, 2]
type = HitDef
triggerall = anim = 3010
trigger1 = animelem = 6
attr = S, HA
animtype = Up
damage = 19, 4
getpower = 25,25
priority=4,Hit
guardflag = MA
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-69
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-9.3
guard.velocity = -6
air.velocity = -1,-9.3
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 1051, 3]
type = HitDef
triggerall = anim = 3010
trigger1 = AnimElem >= 7
attr = A, HA
animtype = Up
damage = 19, 4
getpower = 0
priority=4,Hit
guardflag = MA
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-7
guard.velocity = -6
air.velocity = -1,-6.3
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 3100, Anim]
type=changeanim
triggerall= vel y>0 && pos y>=-10;ceil(vel y)
trigger1= animelemtime(13)>=0 && animelemtime(14)<0
trigger2= animelemtime(28)>=0 && animelemtime(29)<0
value=3010
elem=animelemno(0)+1

[State 0, PosSet]
type = PosSet
trigger1= animelemtime(14)>=0 && animelemtime(20)<0
trigger2= animelemtime(29)>=0 && animelemtime(35)<0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(14)>0 && animelemtime(20)<0
trigger2= animelemtime(29)>=0 && animelemtime(35)<0
x = 0
y = 0

[State 0, VelSet]
type = VelAdd
trigger1 = animelemtime(14)>0 && animelemtime(20)<0
trigger2= animelemtime(29)>=0 && animelemtime(35)<0
x = 0
y = 0

[State 0, Width]
type = Width
trigger1= animelemtime(14)>=0 ;&& animelemtime(16)<0
edge = 20,0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem=15||animelem=16||animelem=20
x = 10

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 17
value = S3011,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 18
value = S1,3
channel = 1

[State 3011, VelSet]
type = VelSet
trigger1 = AnimElem = 20
x = 1
y = -8.5;-var(1)*2.5
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = animelem = 20
stateno = 8100
pos = 0, 0
sprpriority = -1
[State 3011, VelAdd]
type = VelAdd
trigger1 = AnimElemtime(20)>0 && animelemtime(29)<0
y = 1.5

[State 3010, HitDef]
type = HitDef
trigger1 = AnimElem = 20
attr = A, HA
animtype = Heavy
air.animtype = Up
damage=19, 4
getpower = 0,0
priority = 7, Hit
hitflag = MAF
guardflag = M
pausetime = 6,6
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-78
hitsound = S2,3
guardsound = S6,0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
ground.velocity = -1,-11.2
guard.velocity = -8
air.velocity = -1,-10.6
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -12.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .5
forcestand = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem=30||animelem=31||animelem=35
x = 13

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 33
value = S3012,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=33||animelem=35||animelem=36||animelem=37||animelem=38||animelem=39||animelem=40||animelem=42||animelem=43||animelem=44||animelem=45
value = S1,3
channel = 1

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = AnimElem =31,>=1
trigger1 = p2bodydist y>=-90
value = 3010
elem = 32
persistent = 0

[State 3011, VelSet]
type = VelSet
trigger1 = AnimElem = 35
x = 1
y = -12;
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = animelem = 35
stateno = 8100
pos = 0, 0
sprpriority = -1
[State 3011, VelAdd]
type = VelAdd
trigger1 = AnimElem =35,>=0
y = .5

[State 1051, 2]
type = HitDef
trigger1 = animelem = 34
attr = S, HA
animtype = Up
damage = 19, 4
getpower = 0
priority=4,Hit
guardflag = MA
hitflag = MAF
pausetime = 4,4
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-69
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-9.3
guard.velocity = -6
air.velocity = 0,-7.3
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 1051, 3]
type = HitDef
trigger1 = AnimElem=35||animelem=37||animelem=40||animelem=41||animelem=43||animelem=44||animelem=47
attr = A, HA
animtype = Up
damage = 19, 4
getpower = 0
priority=4,Hit
guardflag = MA
hitflag = MAF
pausetime = 4,4
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-6.3
ground.cornerpush.veloff x = 0
guard.velocity = -6
air.velocity = 0,-7.3
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 1051, 3]
type = HitDef
trigger1 = animelem=48
attr = A, HA
animtype = Up
damage = 22, 4
getpower = 0
priority=4,Hit
guardflag = MA
hitflag = MAF
pausetime = 4,4
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -4,-6.3
ground.cornerpush.veloff x = -30
guard.velocity = -6
air.velocity = -4,-7.3
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0
yaccel = .5

[State AttackDone]
type=statetypeset
trigger1= animelemtime(49)>=0
movetype=I

[State 3011, 3] ;Change state when KFM is close to ground
type = ChangeState
triggerall = animelemtime(55)>0
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1052
ctrl = 0
;---------------------------------------------------------------------------
;Rolling Thunder
[Statedef 3050]
type = S
movetype = A
physics = S
anim = 3050
sprpriority = 2
juggle = 0
velset = 0,0
ctrl = 0
facep2 = 1
[State 105, Dust]
type = helper
trigger1 = time = 43
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = time = 43
stateno = 8101
pos = 0, 0
sprpriority = -1

[State 0, VarSet]
type = VarSet
triggerall = teammode = simul
trigger1 = movehit = 1 && numtarget(3050)
trigger2 = !time
fvar(8) = ifelse(!time,0,p2dist x)
ignorehitpause = 1
persistent = 1
[State 0, VarSet]
type = VarSet
triggerall = teammode = simul
trigger1 = movehit = 1 && numtarget(3050)
trigger2 = !time
fvar(9) = ifelse(!time,0,p2dist y)
ignorehitpause = 1
persistent = 1
[State 0, PlayerPush]
type = PlayerPush
trigger1 = teammode = simul
trigger1 = movehit && numtarget
value = 0
ignorehitpause = 1
persistent = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = movehit && numtarget
trigger1 = teammode = simul
trigger1 = anim != 3054 && anim != 3055
time = 1
id = 3050
pos = fvar(8),fvar(9)
ignorehitpause = 1
persistent = 1
[State 0, TargetBind]
type = TargetBind
trigger1 = movehit && numtarget
trigger1 = teammode = simul
trigger1 = anim != 3054 && anim != 3055
time = 1
id = 3051
pos = fvar(8),fvar(9)
ignorehitpause = 1
persistent = 1

[State 0, VelSet]
type = posadd
trigger1 = anim = 3050 && movehit
x = 20

[State 0, PosAdd]
type = PosAdd
trigger1 = movehit 
trigger1 = fvar(8) || fvar(9)
trigger1 = teammode = simul
trigger1 = anim != 3054 && anim != 3055
x = p2dist x - fvar(8)
;y = p2dist y + (enemynear, pos y *-1)
;ignorehitpause = 
;persistent = 



[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 43
value = s40,8

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[200,699])
value = 1

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[1000,2999])
value = .8

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [0,49]
value = SCA;,NA,SA,HA,NP,SP,HP,NT,ST,HT

[State 3000, Super A]
type = SuperPause
triggerall = anim = 3050
trigger1 = AnimElem = 1
time=43
movetime=43
pos = 25, -57
anim = -1
darken = 0
unhittable = 1
poweradd = ifelse(((partner, name = "Akuma" && partner, authorname = "Mr.Ansatsuken") && (prevstateno = 1251131 || prevstateno = 1251132)),-1000,-2000)

[State 3000, Helper]
type = Helper
triggerall = anim = 3050
trigger1 = animelem = 1
helpertype = normal ;player
name = "Super Charge"
ID = 8510
stateno = 8510
pos = 32,-81
postype = p1
size.xscale = 1
size.yscale = 1
sprpriority = 2
facing = 1
ownpal = 1
supermovetime=300

[State 3050, Width]
type = Width
triggerall = anim = 3050
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(23) < 0
value = 24, 24

[State 0, VelSet]
type = VelSet
triggerall = anim = 3050
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(6) < 0
x = ifelse(p2dist x >= 150, 36, p2dist x * 0.20)

[State 0, VelSet]
type = VelSet
triggerall = anim = 3050
trigger1 = AnimElemTime(12) > 0 && AnimElemTime(14) < 0
x = ifelse(p2dist x >= 150, 60, p2dist x * 0.3)

[State 0, VelSet]
type = VelSet
triggerall = anim = 3050
trigger1 = animelem = 7
trigger2 = animelem = 15
x = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 3050
trigger1 = animelem = 1
value = S3012,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 3050
trigger1 = animelem = 2
value = S100,0
channel = 0

[State 3050, Hit]
type = HitDef
trigger1 = Anim = 3050 && (AnimElem = 5 || AnimElem = 13)
attr = S, HA
guardflag = M
hitflag = MAF
animtype = Heavy
air.animtype = Low
priority = 6
getpower = 0
damage = 47, 12
pausetime = 8, 8
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-47
hitsound = S2,3
guardsound = S6, 0
air.type = Low
forcestand = 1
ground.type = Low
ground.slidetime = 12
ground.hittime = 14
ground.velocity = -2
ground.cornerpush.veloff = -2
air.velocity = -1, -5
air.fall = 1
ID = ifelse(fvar(8) && fvar(9),3051,3050)
fall.recover = 0
envshake.time=16
p2facing = 1
envshake.freq=60
envshake.ampl=4
yaccel = .6

[State 3112, Combo]
type=changeanim
triggerall = anim = 3050
trigger1= animelem = 6
value=3051
persistent = 0

;[State 3050, StateChange]
;type = Changeanim
;triggerall = anim = 3050
;triggerall = !movecontact
;trigger1 = AnimTime = 0
;value = 3051
;persistent = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3051
trigger1 = animelem = 5||animelem = 15
trigger2 = anim = 3052
trigger2 = animelem = 5||animelem = 15
trigger3 = anim = 3053
trigger3 = animelem = 5||animelem = 15
value = S3050,0
channel = 0

[State 3050, Width]
type = Width
trigger1 = anim = 3051
trigger2 = anim = 3052
trigger2 = anim = 3053
value = 24, 24

[State 0, VelSet]
type = VelSet
trigger1 = anim = 3051
trigger2 = anim = 3052
trigger2 = anim = 3053
x = 0

[State 3050, Hit]
type = HitDef
trigger1 = (Anim = 3051 && (AnimElem = 7 || AnimElem = 17))
trigger2 = (Anim = 3052 && (AnimElem = 7 || AnimElem = 17))
trigger3 = (Anim = 3053 && (AnimElem = 7 || AnimElem = 17))
attr = S, HA
guardflag = M
hitflag = MAF
animtype = Heavy
air.animtype = Low
priority = 6
getpower = 0
damage = 43, 15
pausetime = 4, 10
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-47
hitsound = S2,3
guardsound = S6, 0
air.type = Low
ground.type = Low
ground.slidetime = 8
ground.hittime = 16
ground.velocity = 0,0
ground.cornerpush.veloff = 0
air.velocity =0, -2.6
ID = ifelse(fvar(8) && fvar(9),3051,3050)
fall = 0
p2facing = 1
air.fall = 1
fall.recover = 0
envshake.time=16
envshake.freq=60
envshake.ampl=4
yaccel = .5

[State 0, PlaySnd]
type = PlaySnd
triggerall = animelem = 6  || animelem = 16
trigger1 = anim = 3051
trigger2 = anim = 3052
trigger3 = anim = 3053
trigger4 = anim = 3054 || anim = 3055
value = S1,3
;[State 0, PlaySnd]
;type = PlaySnd
;triggerall = animelem = 13
;trigger1 = anim = 3050
;value = S1,3
[State 105, Dust]
type = helper
triggerall = animelem = 6  || animelem = 16
trigger1 = anim = 3051
trigger2 = anim = 3052
trigger3 = anim = 3053
helpertype = normal
stateno = 8103
ID = 8100
pos = 25, 0
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3050, Combo]
type=changeanim
triggerall = anim = 3051
trigger1= movecontact || movereversed
trigger1= var(7)<=0
trigger1= command="a"||command="b"||command="c" || command = "x" || command = "y" || command = "z"
trigger1= AnimElemTime(18)>=0
trigger2= var(7)>=1 && AnimElemTime(18)>=0 && movecontact
trigger3= movecontact || movereversed
trigger3= (prevstateno = 1251131 || prevstateno = 1251132)
trigger3= var(7)<=0
trigger3= command="holda"||command="holdb"||command="holdc" || command = "holdx" || command = "holdy" || command = "holdz"
trigger3= AnimElemTime(18)>=0
value=3052
persistent = 0

[State 3050, StateChange]
type = Changeanim
triggerall = anim = 3051
trigger1 = AnimTime = 0
value = ifelse(movehit && numtarget, 3055, 3054)
persistent = 0

[State 3050, Combo]
type=changeanim
triggerall = anim = 3052
trigger1= movecontact || movereversed
trigger1= var(7)<=0
trigger1 = command="a"||command="b"||command="c" || command = "x" || command = "y" || command = "z"
trigger1= AnimElemTime(18)>=0
trigger2= var(7)>=1 && AnimElemTime(18)>=0 && movecontact
value=3053
persistent = 0

[State 3050, StateChange]
type = Changeanim
triggerall = anim = 3052
trigger1 = AnimTime = 0
value = ifelse(movehit && numtarget, 3055, 3054)
persistent = 0

[State 3050, StateChange]
type = Changeanim
triggerall = anim = 3053
trigger1 = AnimTime = 0
value = ifelse(movehit && numtarget, 3055, 3054)
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 3054 || anim = 3055
trigger1 = animelem = 5
value = S1050,0
channel = 0

[State 3050, Hit]
type = HitDef
triggerall = anim = 3054 || anim = 3055
trigger1 = AnimElem = 7
attr = S, HA
hitflag = MAF
guardflag = M
getpower = 0
animtype = Heavy
air.animtype = Up
priority = 6
damage = 47, 12
pausetime = 7, 7
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = S2,3
guardsound = S6, 0
air.type = High
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -8, -10
air.velocity = -5, -5
fall = 1
p2facing = 1
air.fall = 1
fall.recover = 0
ID = ifelse(fvar(8) && fvar(9),3051,3050)
envshake.time=16
envshake.freq=60
envshake.ampl=4
yaccel = .6

[State AttackDone]
type=statetypeset
triggerall = anim = 3054 || anim = 3055
trigger1= animelemtime(8)>=0
movetype=I

[State 3050, StateChange]
type = ChangeState
triggerall = anim = 3054 || anim = 3055
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------------------
; MAX Rocket Uppercut
[Statedef 3100]
type = S
movetype= A
physics = N
velset = 0, 0
juggle = 0
anim = 3100
ctrl = 0
facep2 = 1

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[200,699])
value = 1

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[1000,2999])
value = .8

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 3100
trigger1 = time = [0,49]
value = SCA;,NA,SA,HA,NP,SP,HP,NT,ST,HT

[State 3000, Super A]
type = SuperPause
triggerall = anim = 3100
trigger1 = AnimElem = 1
time=43
movetime=43
pos = 25, -57
anim = -1
darken = 0
unhittable = 1
poweradd = -2000

[State 3000, Helper]
type = Helper
triggerall = anim = 3100
trigger1 = animelem = 1
helpertype = normal ;player
name = "Super Charge"
ID = 8500
stateno = 8510
pos = 52,-38
postype = p1
size.xscale = 1
size.yscale = 1
sprpriority = 2
facing = 1
ownpal = 1
supermovetime=300

[State 0, Width]
type = Width
trigger1 = 1
edge = 20,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S3010,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,3
channel = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem=2||animelem=3||animelem=7
x = 10

[State 3011, VelSet]
type = StatetypeSet
trigger1 = AnimElemtime(7)>=0 && animelemtime(14)<0
trigger2 = AnimElemtime(20)>=0 && animelemtime(29)<0
trigger3 = AnimElemtime(35)>=0
statetype=A
physics = N

[State 0, PosSet]
type = StateTypeSet
trigger1= animelemtime(14)>=0 && animelemtime(20)<0
trigger2= animelemtime(29)>=0 && animelemtime(35)<0
statetype=S
physics = N

[State 3011, VelSet]
type = VelSet
triggerall = anim = 3100
trigger1 = AnimElem = 7
x = ifelse(p2dist x > 80,2,1)
y = -7.5;-var(1)*2.5
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = animelem = 7
stateno = 8100
pos = 0, 0
sprpriority = -1
[State 3011, VelAdd]
type = VelAdd
triggerall = anim = 3100
trigger1 = AnimElemtime(7)>0 && animelemtime(14)<0
y = .7

[State 0, Explod]
type = helper
triggerall = anim = 3100
trigger1 = animelem = 35
helpertype = normal
ID = 3015
stateno = 3015
postype = p1
pos = 0, 0
size.xscale = 1
size.yscale = 1

[State 1051, 2]
type = HitDef
triggerall = anim = 3100
trigger1 = animelem = 6
attr = S, HA
animtype = Up
damage = 19, 4
getpower = 25,25
priority=4,Hit
guardflag = M;MA
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-69
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-12
guard.velocity = -6
air.velocity = -1,-12
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 1051, 3]
type = HitDef
triggerall = anim = 3100
trigger1 = AnimElem >= 7
attr = A, HA
animtype = Up
damage = 19, 4
getpower = 0
priority=4,Hit
guardflag = M;MA
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-9
guard.velocity = -6
air.velocity = -1,-8.5
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 3100, Anim]
type=changeanim
triggerall= vel y>0 && pos y>=-10;ceil(vel y)
trigger1= animelemtime(13)>=0 && animelemtime(14)<0
trigger2= animelemtime(28)>=0 && animelemtime(29)<0
value=3100
elem=animelemno(0)+1

[State 0, PosSet]
type = PosSet
trigger1= animelemtime(14)>=0 && animelemtime(20)<0
trigger2= animelemtime(29)>=0 && animelemtime(35)<0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(14)>0 && animelemtime(20)<0
trigger2= animelemtime(29)>=0 && animelemtime(35)<0
x = 0
y = 0

[State 0, VelSet]
type = VelAdd
trigger1 = animelemtime(14)>0 && animelemtime(20)<0
trigger2= animelemtime(29)>=0 && animelemtime(35)<0
x = 0
y = 0

[State 0, Width]
type = Width
trigger1= animelemtime(14)>=0 ;&& animelemtime(16)<0
edge = 20,0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem=15||animelem=16||animelem=20
x = 10

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 17
value = S3011,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 18
value = S1,3
channel = 1

[State 3011, VelSet]
type = VelSet
trigger1 = AnimElem = 20
x = ifelse(p2dist x > 80,2,1)
y = -12;-var(1)*2.5
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = animelem = 20
stateno = 8100
pos = 0, 0
sprpriority = -1
[State 3011, VelAdd]
type = VelAdd
trigger1 = AnimElemtime(20)>0 && animelemtime(29)<0
y = .7

[State 3100, HitDef]
type = HitDef
trigger1 = AnimElem = 19
attr = A, HA
animtype = Heavy
air.animtype = Up
damage=19, 4
getpower = 0,0
priority = 7, Hit
hitflag = MAF
guardflag = M;M
pausetime = 6,6
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-69
hitsound = S2,3
guardsound = S6,0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
ground.velocity = -1,-12.5
guard.velocity = -8
air.velocity = -1,-13
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -12.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .5
forcestand = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 3100, HitDef]
type = HitDef
trigger1 = AnimElem = 20
attr = A, HA
animtype = Heavy
air.animtype = Up
damage=19, 4
getpower = 0,0
priority = 7, Hit
hitflag = MAF
guardflag = M;M
pausetime = 6,6
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-78
hitsound = S2,3
guardsound = S6,0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
guard.ctrltime = 20
ground.velocity = -1,-12.5
guard.velocity = -8
air.velocity = -1,-13
airguard.velocity = -6.67,-1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = -12.2
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
air.fall = 1
air.recover = 0
yaccel = .5
forcestand = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem=30||animelem=31||animelem=35
x = 13

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 33
value = S3012,2
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 33
value = S3012,2
channel = 2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 33
value = S3012,2
channel = 4
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 35
value = S3012,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=33||animelem=35||animelem=36||animelem=37||animelem=38||animelem=39||animelem=40||animelem=42||animelem=43||animelem=44||animelem=45
value = S1,3
channel = 1

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = AnimElem =31,>=1
trigger1 = p2bodydist y>=-90
value = 3100
elem = 32
persistent = 0

[State 3011, VelSet]
type = VelSet
trigger1 = AnimElem = 35
x = ifelse(p2dist x > 80,2,1)
y = -17;
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = animelem = 35
stateno = 8100
pos = 0, 0
sprpriority = -1
[State 3011, VelAdd]
type = VelAdd
trigger1 = AnimElem =35,>=0
y = .6

[State 1051, 2]
type = HitDef
trigger1 = animelem = 34
attr = S, HA
animtype = Up
damage = 19, 4
getpower = 0
priority=4,Hit
guardflag = M;MA
hitflag = MAF
pausetime = 12,12
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-69
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-9.3
guard.velocity = -6
air.velocity = 0,-7.3
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 1051, 3]
type = HitDef
trigger1 = AnimElem=35||AnimElem=36||animelem=37||animelem=38||animelem=39||animelem=40||animelem=41||animelem=43||animelem=44||animelem=47
attr = A, HA
animtype = Up
damage = 24, 4
getpower = 0
priority=4,Hit
guardflag = M;MA
hitflag = MAF
pausetime = 4,4
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -1,-7.5
ground.cornerpush.veloff x = 0
guard.velocity = -6
air.velocity = 0,-9.5
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0

[State 1051, 3]
type = HitDef
trigger1 = animelem=48
attr = A, HA
animtype = Up
damage = 24, 4
getpower = 0
priority=4,Hit
guardflag = M;MA
hitflag = MAF
pausetime = 4,4
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 15
ground.hittime = 18
ground.velocity = -4,-6.3
ground.cornerpush.veloff x = -30
guard.velocity = -6
air.velocity = -4,-10
airguard.velocity = -4,-4.5
p2facing = 1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1                   ;Make p2 fall down
fall.recover = 0
yaccel = .5

[State AttackDone]
type=statetypeset
trigger1= animelemtime(49)>=0
movetype=I

[State 3011, 3] ;Change state when KFM is close to ground
type = ChangeState
triggerall = animelemtime(55)>0
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 1052
ctrl = 0

;---------------------------------------------------------------------------
;MAX Rolling Thunder
[Statedef 3200]
type = S
movetype = A
physics = S
anim = 3200
sprpriority = 2
juggle = 0
velset = 0,0
ctrl = 0
facep2 = 1
[State 105, Dust]
type = helper
trigger1 = time = 43
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = time = 43
stateno = 8101
pos = 0, 0
sprpriority = -1

[State 0, VarSet]
type = VarSet
triggerall = teammode = simul
trigger1 = movehit = 1 && numtarget(3200)
trigger2 = !time
fvar(8) = ifelse(!time,0,p2dist x)
ignorehitpause = 1
persistent = 1
[State 0, VarSet]
type = VarSet
triggerall = teammode = simul
trigger1 = movehit = 1 && numtarget(3200)
trigger2 = !time
fvar(9) = ifelse(!time,0,p2dist y)
ignorehitpause = 1
persistent = 1
[State 0, PlayerPush]
type = PlayerPush
trigger1 = teammode = simul
trigger1 = movehit && numtarget
value = 0
ignorehitpause = 1
persistent = 1

[State 0, TargetBind]
type = TargetBind
trigger1 = movehit && numtarget
trigger1 = teammode = simul
trigger1 = anim != 3204 && anim != 3207
time = 1
id = 3200
pos = fvar(8),fvar(9)
ignorehitpause = 1
persistent = 1
[State 0, TargetBind]
type = TargetBind
trigger1 = movehit && numtarget
trigger1 = teammode = simul
trigger1 = anim != 3204 && anim != 3207
time = 1
id = 3201
pos = fvar(8),fvar(9)
ignorehitpause = 1
persistent = 1

[State 0, PosAdd]
type = PosAdd
trigger1 = movehit
trigger1 = fvar(8) || fvar(9)
trigger1 = teammode = simul
trigger1 = anim != 3204 && anim != 3207
x = p2dist x - fvar(8)
;y = p2dist y + (enemynear, pos y *-1)
;ignorehitpause = 
;persistent = 



[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 43
value = s40,8

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[200,699])
value = 1

[State 0, AttackMulSet]
type = AttackMulSet
trigger1 = (prevstateno=[1000,2999])
value = .8

[State 0, NotHitBy]
type = NotHitBy
trigger1 = time = [0,53]
value = SCA;,NA,SA,HA,NP,SP,HP,NT,ST,HT

[State 3000, Super A]
type = SuperPause
triggerall = anim = 3200
trigger1 = AnimElem = 1
time=43
movetime=43
pos = 25, -57
anim = -1
darken = 0
unhittable = 1
poweradd = ifelse(((partner, name = "Akuma" && partner, authorname = "Mr.Ansatsuken") && (prevstateno = 1251131 || prevstateno = 1251132)),-2000,-3000)

[State 3000, Helper]
type = Helper
triggerall = anim = 3200
trigger1 = animelem = 1
helpertype = normal ;player
name = "Super Charge"
ID = 8520
stateno = ifelse((prevstateno = 1251131 || prevstateno = 1251132),8510,8520)
pos = 32,-81
postype = p1
size.xscale = 1
size.yscale = 1
sprpriority = 2
facing = 1
ownpal = 1
supermovetime=300

[State 3200, Width]
type = Width
triggerall = anim = 3200
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(23) < 0
value = 24, 24

[State 0, VelSet]
type = VelSet
triggerall = anim = 3200
trigger1 = AnimElemTime(2) > 0 && AnimElemTime(6) < 0
x = ifelse(p2dist x >= 150, 36, p2dist x * 0.20)

[State 0, VelSet]
type = VelSet
triggerall = anim = 3200
trigger1 = AnimElemTime(12) > 0 && AnimElemTime(14) < 0
x = ifelse(p2dist x >= 150, 60, p2dist x * 0.3)

[State 0, VelSet]
type = VelSet
triggerall = anim = 3200
trigger1 = animelem = 7
trigger2 = animelem = 15
x = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 3200
trigger1 = animelem = 1
value = S3050,3
channel = 0
[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 3200
trigger1 = animelem = 1
value = S3050,3
channel = 2
[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 3200
trigger1 = animelem = 1
value = S3050,3
channel = 4

;[State 0, PlaySnd]
;type = PlaySnd
;triggerall = anim = 3200
;trigger1 = animelem = 2
;value = S100,0
;channel = 0

[State 3200, Hit]
type = HitDef
trigger1 = Anim = 3200 && (AnimElem = 5 || AnimElem = 13)
attr = S, HA
guardflag = H;M
hitflag = MAF
animtype = Heavy
air.animtype = Low
priority = 6
getpower = 0
damage = 47, 12
pausetime = 8, 8
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-47
hitsound = S2,3
guardsound = S6, 0
air.type = Low
forcestand = 1
ground.type = Low
ground.slidetime = 12
ground.hittime = 14
p2facing = 1
ground.velocity = -2
ground.cornerpush.veloff = -2
air.velocity = -2,0
ID = ifelse(fvar(8) && fvar(9),3201,3200)
fall.recover = 1
kill = 0
forcenofall = 1
p2stateno = 58743
forcestand = 1
envshake.time=16
envshake.freq=60
envshake.ampl=4
yaccel = .6

[State 3200, StateChange]
type = Changeanim
triggerall = anim = 3200
trigger1 = Animelem = 6
value = 3201
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = animelem = 5||animelem = 15
trigger1 = anim = 3201
trigger2 = anim = 3202
trigger3 = anim = 3203
;trigger4 = anim = 3205
;trigger5 = anim = 3206
value = S3050,0
channel = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3205
trigger1= animelem = 2
value = S3050,1
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3205
trigger1= animelem = 2
value = S3050,1
channel = 2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 3205
trigger1= animelem = 2
value = S3050,1
channel = 4
volume = -100
[State 0, PlaySnd]
type = PlaySnd
triggerall = animelem = 6
trigger1 = anim = 3207
value = S3050,2
channel = 0
[State 0, PlaySnd]
type = PlaySnd
triggerall = animelem = 6
trigger1 = anim = 3207
value = S3050,2
channel = 2
[State 0, PlaySnd]
type = PlaySnd
triggerall = animelem = 6
trigger1 = anim = 3207
value = S3050,2
channel = 4
volume = -100
[State 0, PlaySnd]
type = PlaySnd
triggerall = animelem = 2
trigger1 = anim = 3205
value = S3050,6

[State 3200, Width]
type = Width
trigger1 = anim = 3201
trigger2 = anim = 3202
trigger2 = anim = 3203
value = 24, 24

[State 0, VelSet]
type = VelSet
triggerall = animelem = 1 || animelem = 6 || animelem = 12 || animelem = 17
trigger1 = anim = 3201
trigger2 = anim = 3202
x = ifelse((animelem = 1 || animelem = 17), 0, 2)

[State 3200, Hit]
type = HitDef
trigger1 = (Anim = 3201 && (AnimElem = 7 || AnimElem = 17))
trigger2 = (Anim = 3202 && (AnimElem = 7 || AnimElem = 17))
trigger3 = (Anim = 3203 && (AnimElem = 7 || AnimElem = 17))
attr = S, HA
guardflag = H;M
hitflag = MAF
animtype = Heavy
air.animtype = Low
priority = 6
getpower = 0
p2facing = 1
damage = 43, 13
pausetime = 4, ifelse((anim=3206 && (animelem = 7 || animelem = 17)), 40, 10)
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-47
hitsound = S2,3
guardsound = S6, 0
air.type = Low
ground.type = Low
ground.slidetime = 8
ground.hittime = 30
ground.velocity = 0,0
ground.cornerpush.veloff = 0
air.velocity =0, 0
ID = ifelse(fvar(8) && fvar(9),3201,3200)
fall = 0
forcenofall = 1
fall.recover = 1
kill = 0
p2stateno = 58743
forcestand = 1
envshake.time=16
envshake.freq=60
envshake.ampl=4
yaccel = .5

[State 3200, Hit]
type = HitDef
trigger1 = (Anim = 3205 && (AnimElem = 7 || AnimElem = 17))
trigger2 = (Anim = 3206 && (AnimElem = 7 || AnimElem = 17))
attr = S, HA
guardflag = H;M
hitflag = MAF
animtype = Heavy
air.animtype = Low
priority = 6
getpower = 0
p2facing = 1
damage = 43, 13
pausetime = 14, ifelse((anim=3206 && (animelem = 7 || animelem = 17)), 40, 10)
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-47
hitsound = S2,3
guardsound = S6, 0
air.type = Low
ground.type = Low
ground.slidetime = 8
ground.hittime = 30
ground.velocity = 0,0
ground.cornerpush.veloff = 0
air.velocity =0, 0
ID = ifelse(fvar(8) && fvar(9),3201,3200)
fall = 0
forcenofall = 1
fall.recover = 1
kill = 0
p2stateno = 58743
forcestand = 1
envshake.time=16
envshake.freq=60
envshake.ampl=4
yaccel = .5

[State 0, PlaySnd]
type = PlaySnd
triggerall = animelem = 6 || animelem = 16
trigger1 = anim = 3201
trigger2 = anim = 3202
trigger3 = anim = 3203
trigger4 = anim = 3205
trigger5 = anim = 3206
value = S1,3
;[State 0, PlaySnd]
;type = PlaySnd
;triggerall = animelem = 13
;trigger1 = anim = 3200
;value = S1,3
[State 105, Dust]
type = helper
triggerall = animelem = 6  || animelem = 16
trigger1 = anim = 3201
trigger2 = anim = 3202
trigger3 = anim = 3203
trigger4 = anim = 3205
trigger5 = anim = 3206
helpertype = normal
stateno = 8103
ID = 8100
pos = 25, 0
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 3200, Combo]
type=changeanim
triggerall = anim = 3201
trigger1= AnimElemTime(18)>=0
value=3202
persistent = 0

[State 3200, Combo]
type=changeanim
triggerall = anim = 3203
trigger1= AnimElemTime(18)>=0
value=3205
persistent = 0

[State 3200, Combo]
type=changeanim
triggerall = anim = 3205
trigger1= AnimElemTime(18)>=0
value=3206
persistent = 0

[State 3200, Combo]
type=changeanim
triggerall = anim = 3203
trigger1= AnimElemTime(18)>=0
value=3205
persistent = 0

[State 3200, Combo]
type=changeanim
triggerall = anim = 3202
trigger1= movehit && numtarget && !winko
trigger1= AnimElemTime(18)>=0
value=3203
persistent = 0

[State 3200, Combo]
type=changeanim
triggerall = anim = 3202
trigger1= !animtime
value=3204
persistent = 0

[State 3200, StateChange]
type = Changeanim
triggerall = anim = 3203
trigger1 = AnimTime = 0
value = 3204
persistent = 0
[State 3200, StateChange]
type = Changeanim
triggerall = anim = 3206
trigger1 = AnimTime = 0
value = 3207
persistent = 0

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 3204
trigger1 = animelem = 5
value = S1050,0
channel = 0


[State 3200, Hit]
type = HitDef
trigger1 = Anim = 3204 && AnimElem = 7
attr = S, HA
hitflag = MAF
guardflag = H;M
getpower = 0
animtype = Heavy
air.animtype = Up
priority = 6
damage = 47, 12
pausetime = 7, 14
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = S2,3
guardsound = S6, 0
air.type = High
ground.slidetime = 12
ground.hittime = 16
p2facing = 1
ground.velocity = -2, -2
air.velocity = -5, -5
fall = 0
air.fall = 1
fall.recover = 0
ID = ifelse(fvar(8) && fvar(9),3201,3200)
envshake.time=16
envshake.freq=60
envshake.ampl=4
yaccel = .6

[State 3200, Hit]
type = HitDef
trigger1 = Anim = 3207 && AnimElem = 7
attr = S, HA
hitflag = MAF
guardflag = H;M
getpower = 0
animtype = Heavy
air.animtype = Up
priority = 6
damage = 47, 12
pausetime = 45, 45
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-110
hitsound = S4000,0
guardsound = S6, 0
air.type = High
p2facing = 1
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -.5, -17.5
air.velocity = -.5, -17.5
fall = 1
air.fall = 1
fall.recover = 0
ID = ifelse(fvar(8) && fvar(9),3201,3200)
envshake.time=16
envshake.freq=60
envshake.ampl=4
yaccel = .6


[State -2, Spark Level]
type=helper
triggerall= movecontact=1
triggerall= anim = 3207
;triggerall=!hitdefattr=SCA,AT
trigger1 = movehit = 1 && numenemy
helpertype=normal
stateno=4050
ID=8000
name="Spark"
postype=p1
pos= ifelse(p2dist x<0, 0, ifelse(p2dist x<var(12), ceil((p2dist x)+2), var(12))), var(13)
facing= -1
size.xscale = 1
size.yscale = 1
persistent = 0
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 3120, Dust]
type = helper
triggerall= movecontact=1
triggerall= anim = 3207
;triggerall=!hitdefattr=SCA,AT
trigger1 = movehit = 1 && numenemy
helpertype = normal
stateno = 3125
ID = 3125
name = "B&W Dust"
persistent = 0
postype = p1
pos= ifelse(p2dist x<0, 0, ifelse(p2dist x<var(12), ceil((p2dist x)+2), var(12))), 0
ownpal = 1
ignorehitpause = 1
size.xscale = 2
size.yscale = 2

[State AttackDone]
type=statetypeset
triggerall = anim = 3204 || anim = 3207
trigger1= animelemtime(8)>=0
movetype=I

[State 3200, StateChange]
type = ChangeState
triggerall = anim = 3204 || anim = 3207
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Target
[Statedef 58743]
type = S
movetype= H
physics = N
velset = 0,0

[State 0, PosSet]
type = PosSet
trigger1 = !time
y = 0
ignorehitpause = 1
persistent = 1

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030
;
;[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
;type = ChangeAnim
;trigger1 = Time = 0
;trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim
[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = Anim = 5000
trigger2 = Anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = Anim = 5001
trigger2 = Anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = Anim =  5012
trigger2 = Anim = 5002
trigger3 = Anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

[State 5000, 6]
type = selfstate
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5001 ;Stand get-hit (knocked back)

[State 5000, 7]
type = selfstate
trigger1 = HitShakeOver
value = 5030


; Corkscrew Cross
[Statedef 4100]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 4100
facep2 = 1
sprpriority = 2



[State 0, Explod]
type = Explod
triggerall = anim = 4100
trigger1 = animelemtime(13) = 0 || animelemtime(13) = 5 || animelemtime(13) = 10
anim = 6028
ID = 6028
pos = 20,0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = 0.125,0.125
sprpriority = 5

[State 0, AttackMulSet]
type = AttackMulSet
triggerall = anim = 4100
trigger1 = (prevstateno=[200,699])
value = 1

[State 0, AttackMulSet]
type = AttackMulSet
triggerall = anim = 4100
trigger1 = (prevstateno=[1000,2999])
value = .8

[State 0, NotHitBy]
type = NotHitBy
triggerall = anim = 4100
trigger1 = time = [0,53]
value = SCA;,NA,SA,HA,NP,SP,HP,NT,ST,HT

[State 4100, Super A]
type = SuperPause
triggerall = anim = 4100
trigger1 = AnimElem = 1
time=43
movetime=43
pos = 25, -57
anim = -1
darken = 0
unhittable = 1
poweradd = -3000

[State 4100, Helper]
type = Helper
triggerall = anim = 4100
trigger1 = animelem = 1
helpertype = normal ;player
name = "Super Charge"
ID = 8520
stateno = 8520
pos = -12,-52
postype = p1
size.xscale = 1
size.yscale = 1
sprpriority = 2
facing = 1
ownpal = 1
supermovetime=300


[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 4100
trigger1 = animelem = 1
value = S4100,2
channel = 0
[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 4100
trigger1 = animelem = 1
value = S4100,2
channel = 2
[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 4100
trigger1 = animelem = 1
value = S4100,2
channel = 4

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 4100
trigger1 = animelem = 13
value = S3000,1
channel = 1

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 4100
trigger1 = animelem = 12
value = S1,3

[State 0, VelSet]
type = VelSet
triggerall = anim = 4100
trigger1 = animelem = 13
x = 9.4

[State 0, VelSet]
type = VelSet
triggerall = anim = 4100
trigger1 = animelem = 17
x = 0

[State 0, Explod]
type = Explod
triggerall = anim = 4100
trigger1 = animelem = 13
anim = 3001
ID = 3001
pos = -20*const(size.xscale),1*const(size.yscale)
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
scale = 0.5*const(size.xscale),0.5*const(size.yscale)
sprpriority = 5
ownpal = 1
ignorehitpause = 0
removeongethit = 0
;[State 0, Explod]
;type = Explod
;trigger1 = animelem = 13
;anim = 3002
;ID = 3002
;pos = -20,1
;postype = p1  ;p2,front,back,left,right
;bindtime = -1
;removetime = -2
;scale = 0.5*const(size.xscale),0.5*const(size.yscale)
;sprpriority = 4
;ownpal = 1
;removeongethit = 0

[State 4100, 5]
type = HitDef
triggerall = anim = 4100
trigger1 = animelem=13||animelem=14||animelem=15||animelem=16||animelem=17
attr = S, HA
animtype = Hard
damage = 20,10
getpower = 0
priority = 6
guardflag = H;MA
hitflag = MAF
pausetime = 4,32
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-60
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 30
ground.hittime = 30
p2stateno = 58743
ground.velocity = 0, 0
kill = 0
air.velocity = 0,0
fall = 0
p2facing = 1
fall.recover = 1
ID = ifelse(numtarget,4101,4100)
forcestand=1
forcenofall=1
envshake.time=16
envshake.freq=60
envshake.ampl=4


[State AttackDone]
type=statetypeset
triggerall = anim = 4100
trigger1= animelemtime(18)>=0
movetype=I
[State AttackDone]
type=statetypeset
trigger1 = anim = 4101
movetype=A

[State 4100, 7]
type = Changeanim
triggerall = anim = 4100
;trigger1 = movehit = 1 && numtargete
trigger1 = movehit && numtarget
trigger1 = !animtime && !winko
value = 4101
ctrl = 0

;[State 0, ChangeAnim]
;type = ChangeAnim
;trigger1 = anim = 4100 && !animtime
;value = 4101
;ignorehitpause = 1
;persistent = 1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 4101
trigger1 = animelem = 48
value = S1,1
[State 105, Dust]
type = helper
trigger1 = anim = 4101
trigger1 = animelem = 48
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1
[State -3, Jumping Dust]
type = Helper
trigger1 = anim = 4101
trigger1 = animelemtime(48) = 1
helpertype = normal
stateno = 8101
pos = 0, 0
sprpriority = -1

[State 0, Explod]
type = Explod
trigger1 = anim = 4100
trigger1 = animelemtime(13) = 0 || animelemtime(13) = 5 || animelemtime(13) = 10
anim = 6028
ID = 6028
pos = 20,0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = 0.125,0.125
sprpriority = 5

[State 0, VelSet]
type = VelSet
trigger1 = anim = 4100 && animelem = 17
x = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = anim = 4101
value = SCA;,NA,SA,HA,NP,SP,HP,NT,ST,HT

[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 4101 && animelemtime(1)=0
value = S4100,0
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 4101 && animelemtime(1)=0
value = S4100,0
channel = 2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 4101 && animelemtime(1)=0
value = S4100,0
channel = 4
volume = 100
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 4101 && animelemtime(1)=0
value = S4100,5
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 4101 && animelemtime(50)=0
value = S4100,1
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 4101 && animelemtime(50)=0
value = S4100,1
channel = 2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 4101 && animelemtime(50)=0
value = S4100,1
channel = 4
volume = 100

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 4101
trigger1 = animelem= 3
trigger2 = animelem= 14
trigger3 = animelem= 25
trigger4 = animelem= 33
trigger5 = animelem= 59
value = S1,3
[State 0, PlayerPush]
type = PlayerPush
trigger1 = anim = 4101
trigger1 = animelemtime(57)>=0 && animelemtime(61)<0
value = 0
ignorehitpause = 1
persistent = 1



[State 0, VelSet]
type = VelSet
triggerall = anim = 4101
trigger1 = animelem= 1
trigger2 = animelem= 11
trigger3 = animelem= 22
trigger4 = animelem= 31
trigger5 = animelem= 48
trigger6 = animelem= 58
x = ifelse((animelem=1),(p2dist x *0.25), ifelse((animelem=58),30,ifelse((animelem=48), 30, 4)))
[State 0, VelSet]
type = VelSet
triggerall = anim = 4101
trigger1 = animelem= 4
trigger2 = animelem= 15
trigger3 = animelem= 26
trigger4 = animelem= 34
trigger5 = animelem= 62
x = 0


;[State -2, Spark Level]
;type=helper
;triggerall= movecontact=1
;triggerall= anim = 4101
;;triggerall=!hitdefattr=SCA,AT
;trigger1 = animelemtime(4)>=0
;trigger1 = movehit = 1 && numenemy
;helpertype=normal
;stateno=4050
;ID=8000
;name="Spark"
;postype=p1
;pos= ifelse(p2dist x<0, 0, ifelse(p2dist x<var(12), ceil((p2dist x)+2), var(12))), var(13)
;facing= -1
;size.xscale = 1
;size.yscale = 1
;persistent = 0
;ownpal=1
;pausemovetime=65535
;supermovetime=65535
;ignorehitpause=1
;
;[State -2, Spark Level]
;type=helper
;triggerall= movecontact=1
;triggerall= anim = 4101
;;triggerall=!hitdefattr=SCA,AT
;trigger1 = animelemtime(15)>=0
;trigger1 = movehit = 1 && numenemy
;helpertype=normal
;stateno=4050
;ID=8000
;name="Spark"
;postype=p1
;pos= ifelse(p2dist x<0, 0, ifelse(p2dist x<var(12), ceil((p2dist x)+2), var(12))), var(13)
;facing= -1
;size.xscale = 1
;size.yscale = 1
;persistent = 0
;ownpal=1
;pausemovetime=65535
;supermovetime=65535
;ignorehitpause=1
;
;[State -2, Spark Level]
;type=helper
;triggerall= movecontact=1
;triggerall= anim = 4101
;;triggerall=!hitdefattr=SCA,AT
;trigger1 = animelemtime(26)>=0
;trigger1 = movehit = 1 && numenemy
;helpertype=normal
;stateno=4050
;ID=8000
;name="Spark"
;postype=p1
;pos= ifelse(p2dist x<0, 0, ifelse(p2dist x<var(12), ceil((p2dist x)+2), var(12))), var(13)
;facing= -1
;size.xscale = 1
;size.yscale = 1
;persistent = 0
;ownpal=1
;pausemovetime=65535
;supermovetime=65535
;ignorehitpause=1
;
;[State -2, Spark Level]
;type=helper
;triggerall= movecontact=1
;triggerall= anim = 4101
;;triggerall=!hitdefattr=SCA,AT
;trigger1 = animelemtime(34)>=0
;trigger1 = movehit = 1 && numenemy
;helpertype=normal
;stateno=4050
;ID=8000
;name="Spark"
;postype=p1
;pos= ifelse(p2dist x<0, 0, ifelse(p2dist x<var(12), ceil((p2dist x)+2), var(12))), var(13)
;facing= -1
;size.xscale = 1
;size.yscale = 1
;persistent = 0
;ownpal=1
;pausemovetime=65535
;supermovetime=65535
;ignorehitpause=1

[State -2, Spark Level]
type=helper
triggerall= movecontact=1
triggerall= anim = 4101
;triggerall=!hitdefattr=SCA,AT
trigger1 = animelemtime(59)>=0
trigger1 = movehit = 1 && numenemy
helpertype=normal
stateno=4050
ID=8000
name="Spark"
postype=p1
pos= ifelse(p2dist x<0, 0, ifelse(p2dist x<var(12), ceil((p2dist x)+2), var(12))), var(13)
facing= -1
size.xscale = 1
size.yscale = 1
persistent = 0
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State 230, 2]
type = HitDef
triggerall = anim = 4101
trigger1 = animelem = 4
attr = S, NA
animtype = Medium
damage = 90
getpower = 0,0
guardflag = H;MA
hitflag = MAF
pausetime = 0,10
kill = 0
priority=4,Hit
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-76
hitsound = s4000,0
guardsound = s6,0
ground.type = Low
ground.slidetime = 10
ground.hittime = 11
ground.velocity = -5
air.velocity = -2.5,-3.5


[State 211, 2]
type = HitDef
triggerall = anim = 4101
trigger1 = animelem = 15
attr = S, NA
animtype = Medium
damage = 90
getpower = 0,0
guardflag = H;MA
hitflag = MAF
pausetime = 0,10
priority=4,Hit
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-61
hitsound = s4000,0
guardsound = s6,0
ground.type = High
ground.slidetime = 12
kill = 0
ground.hittime = 13
ground.velocity = -5.5
air.velocity = -2.5,-4

[State 240, 2]
type = HitDef
triggerall = anim = 4101
trigger1 = animelem = 26
attr = S, NA
animtype = Medium
damage = 90
getpower = 0,0
guardflag = H;MA
hitflag = MAF
pausetime = 0,6
priority=4,Hit
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-64
hitsound = s4000,0
guardsound = s6,0
ground.type = High
kill = 0
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -6
air.velocity = -2.2,-3.2

[State 220, 2]
type = HitDef
triggerall = anim = 4101
trigger1 = animelem = 34
attr = S, NA
animtype = Hard
damage = 90, 0
getpower = 0,0
guardflag = H;MA
hitflag = MAF
pausetime = 0,4
priority=4,Hit
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-73
p2stateno = 4105
hitsound = s4000,0
kill = 0
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 13
ground.velocity = -5.5
air.velocity = -2.5,-4

[State 1105, Hit]
type = HitDef
triggerall = anim = 4101
trigger1 = AnimElem = 59
attr = S, HA
guardflag = H;MA
hitflag = MAF
animtype = Hard
air.animtype = Diagup
priority = 7
getpower = 0
givepower = 175
damage = 90, 0
pausetime = 1, 11
sparkno = -1 * (var(10):=8014)**0
guard.sparkno= -1 * (var(17):=8001)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-80
hitsound = S4000,0
guardsound = S6, 0
ground.type = High
guard.slidetime = 15
ground.hittime = 15
ground.velocity = 2, -15
air.velocity = 2, -15
p2facing = -1
envshake.time=16
envshake.freq=30
envshake.ampl=4
fall = 1
fall.recover = 0
yaccel = .6

[State 0, Explod]
type = Explod
trigger1 = animelem = 57
anim = 4150
ID = 4150
pos = 80*const(size.xscale),-72*const(size.yscale)
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -2
scale = 0.375*const(size.xscale),0.5*const(size.yscale)
sprpriority = 5
ownpal = 1
removeongethit = 0
;[State 0, Explod]
;type = Explod
;trigger1 = animelem = 57
;anim = 4151
;ID = 4150
;pos = 80*const(size.xscale),-72*const(size.yscale)
;postype = p1  ;p2,front,back,left,right
;bindtime = -1
;removetime = -2
;scale = 0.375*const(size.xscale),0.5*const(size.yscale)
;sprpriority = -1
;ownpal = 1
;removeongethit = 0
[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = animelemtime(57)>= 0 && animelemtime(60) <0
ID = 4150
scale = (0.1875+(animelemtime(57)*0.03125))*const(size.xscale), (0.25+(animelemtime(57)*0.0416666666666667))*const(size.yscale)


[State AttackDone]
type=statetypeset
trigger1 = anim = 4101
trigger1= animelemtime(61)>=0
movetype=I

[State 4100, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------------
;C.S.C. Opponent
[Statedef 4105]
type = S
movetype = H
physics = N
velset = 0,0

[State 0, PosSet]
type = velset
trigger1 = !time
x = -10
[State 0, PosSet]
type = velmul
trigger1 = time
x = 0.9

[State 3063, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 4105

[State 0, HitFallSet]
type = HitFallSet
trigger1 = 1
value = 0

[State 3063, SelfState]
type = SelfState
trigger1 = time = 100
value = 5150
ctrl = 0