; _________________________________________
;| CVS Choi Bounge by Falcon Rapper        |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<NORMAL MOVES>====
;==

;---------------------------------------------------------------------------
; Standing Light Punch
[Statedef 200]
type = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 0
facep2 = 1

[State 200, Anim]
type=changeanim
trigger1=!time
value=200

[State 200,Posset]
type=posset
trigger1=!time
y=0

[State 200, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,0
channel=0

[State 200, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = !Time
forcenofall = !var(20)
attr = S, NA
hitflag = MAF
guardflag = M
damage = 21,0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2 * var(9)
ground.slidetime = 12 + 2 * var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity =Ifelse(var(20),-1.5,-3)
guard.velocity = Ifelse(var(20),-1.5,-3)
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.velocity = -4.31, -7.36
air.cornerPush.velOff = 0
yAccel = 0.4
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,7
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 90), var(36) := -33
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 200, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Punch
[Statedef 210]
type = S
physics = S
movetype= A
ctrl = 0
velset = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 210, Anim]
type=changeanim
trigger1=!time
value=210

[State 210,Posset]
type=posset
trigger1=!time
y=0

[State 210, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,0
channel=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2
value=1,1
channel=1

[State 210, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = Ifelse(var(55),38,53),0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = Ifelse(var(20),-2.5,-5)
guard.velocity = Ifelse(var(20),-2.5,-5)
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.velocity = -3.24, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-51
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Far Strong Punch
[Statedef 220]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 220, Anim]
type=changeanim
trigger1=!time
value=220+5*(p2bodydist x <= (const(size.xscale) * 19))

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220,2]
type=PosAdd
trigger1=Anim=220&&AnimElem=4
x=19

[State 220, Snd]
type=playsnd
trigger1= !time
value= 4,1
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1=Anim=220&&!Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = Ifelse(var(55),62,78),0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.cornerPush.velOff = 0
ground.velocity = Ifelse(var(20),-4.5,-9)
guard.velocity = Ifelse(var(20),-4.5,-9)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-32
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 225, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1=Anim=225&&!Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = Ifelse(var(55),62,78),0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.cornerPush.velOff = 0
ground.velocity = Ifelse(var(20),-4.5,-9)
guard.velocity = Ifelse(var(20),-4.5,-9)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-48
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 200, Type]
type=statetypeset
trigger1= Anim=220&&animelemtime(5)>=0
trigger2= Anim=225&&animelemtime(4)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Dodge Strong Punch/Z-Counter Punch
[Statedef 221]
type   =S
movetype= A
physics=S
poweradd= ifElse(PrevStateNo=750, 0, 30 * !var(20))
ctrl=0
velset=0,0
anim=ifElse(PrevStateNo=750, 250,221)
sprpriority=2
facep2=1

[State 221, Swing Snd]
type=playsnd
trigger1=animelem=2
value=1,2
channel=1

[State 221, Muteki: Z-Counter]
type=Nothitby
trigger1=PrevStateNo=750 && AnimElemTime(5)<0
time=1
value=SCA

[State 221, HitDef]
type=HitDef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1=!Time && PrevStateNo != 750
attr=S,NA        
hitflag=MAF       
guardflag=M         
animtype=Hard         
priority=4, Hit   
damage = Ifelse(var(55),75,96), 0
;ID = 200*!var(20)
getpower=30 * !var(20), 0
givepower=30, 30
pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
guard.pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
sparkNo=-1 + 0 * (var(33) := 8020)
guard.sparkNo=-1 + 0 * (var(34) := 8000)
sparkXY=-10 + 0 * (var(35) := 80), var(36) := -54
hitsound=S2,9
guardsound=s3,0
air.animType=Back
fall.animType=Back
ground.type=High      
air.type=Low
ground.slidetime=18 + 4*var(9)
ground.hittime=18 + 4*var(9)
guard.hittime=18
air.hittime=120
ground.velocity=Ifelse(var(20),-4,-8), -2.5
guard.velocity=Ifelse(var(20),-5,-10)
air.velocity=Ifelse(var(20),-4,-8),-3
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=1
fall.recover=0
fall.recovertime=120
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time=12
envshake.ampl=Ifelse(random<=500,-3,3)

[State 221, HitDef Z-Counter]
type=HitDef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1=!Time && PrevStateNo=750
attr=S,NA        
hitflag=MAF       
guardflag=M         
animtype=Hard         
priority=6, Hit   ;Higher priority for counters
damage=75, 0
;ID = 200*!var(20)
getpower=0, 0
givepower=30, 30
pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
guard.pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-45
air.animType=Back
fall.animType=Back
ground.type=High     
air.type=Low
ground.slidetime=18 + 4*var(9)
ground.hittime=18 + 4*var(9)
guard.hittime=18
air.hittime=120
ground.velocity=Ifelse(var(20),-4,-8), -2.5
guard.velocity=Ifelse(var(20),-5,-10)
air.velocity=Ifelse(var(20),-4,-8),-3
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=1
fall.recover=0
fall.recovertime=120
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time=12
envshake.ampl=Ifelse(random<=500,-3,3)

[State 221, StateTypeSet: Idle]
type=StateTypeSet
trigger1=anim=221&&AnimElemTime(3) >= 0
trigger2=anim=250&&AnimElemTime(5) >= 0
moveType=I

[State 221, End]
type=ChangeState
trigger1=!AnimTime
value=0
ctrl=1
;---------------------------------------------------------------------------
; Standing Light Kick
[Statedef 230]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
facep2 = 1

[State 230, Anim]
type=changeanim
trigger1=!time
value=230+5*(p2bodydist x <= (const(size.xscale) * 8))

[State 230,Posset]
type=posset
trigger1=!time
y=0

[State 230, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,0
channel=0

[State 230, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 230, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Anim=230&&!Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = 25,0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2+10*var(44),3
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=90), var(36):=-26
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 235, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= Anim=235&&!Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = 25,0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2+10*var(44),3
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=90), var(36):=-46
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 230, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Medium Kick
[Statedef 240]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 240, Anim]
type=changeanim
trigger1=!time
value=240

[State 240,Posset]
type=posset
trigger1=!time
y=0

[State 240, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4,1
channel=0

[State 240, Snd]
type=playsnd
trigger1= animelem=3
value=1,4
channel=1

[State 240, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = Ifelse(var(55),38,53),0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-30
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 240, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Toorima Geri
[Statedef 300]
type = A
physics = S
moveType = A
powerAdd = 18 * !var(20)
anim = 300
ctrl = 0
velset = 0,0

[State 3000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A
physics = N

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 2,= 1
value = 4,3
channel = 0

[State -3,PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4,= 1
value = 1,3

[State 1305,VelSet]
type = VelSet
trigger1 = AnimElem = 2
x = 4.3
y = -4.5

[State 1300,HitDef]
type = HitDef
trigger1 = Time = 0
attr = A,NA
hitflag = MAF
guardflag = M
damage = Ifelse(var(55),38,53),0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-36
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 1305,Veladd]
type = Veladd
trigger1 = AnimElem = 2,> 0
y = .5

[State 1301,ChangeState]
type = ChangeState
trigger1 = AnimElem = 2,> 0
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 52
ctrl = 0

;---------------------------------------------------------------------------
; Standing Strong Kick
[Statedef 250]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 250, Anim]
type=changeanim
trigger1=!time
value=250

[State 250,Posset]
type=posset
trigger1=!time
y=0

[State 250, Snd]
type=playsnd
trigger1= animelem=3
value= 4,2
channel=0

[State 250, Snd]
type=playsnd
trigger1= animelem=4
value=1,5
channel=1

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = S,NA
hitflag = MAF
guardflag = M
damage = Ifelse(var(55),62,78),0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(PrevStateNo = 700, -6.46, ifElse(var(20), -4.86, -10.52)), ifElse(PrevStateNo = 700, -5.25, 0)
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yaccel = 0.58
fall = ifElse(PrevStateNo = 700, 1, 0)
fall.recover = 1
fall.recovertime = 120
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 250, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Punch
[Statedef 400]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 400, Anim]
type=changeanim
trigger1=!time
value=400

[State 400,Posset]
type=posset
trigger1=!time
y=0

[State 400, Snd]
type=playsnd
trigger1= animelem=1 && random<500
value= 4,0
channel=0

[State 400, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 400, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = 21,0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.cornerPush.velOff = 0
ground.velocity = Ifelse(var(20),-1.5,-3)
guard.velocity = Ifelse(var(20),-1.5,-3)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,7
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 90), var(36) := -56
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 400, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 400, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Punch
[Statedef 410]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 410, Anim]
type=changeanim
trigger1=!time
value=410

[State 410,Posset]
type=posset
trigger1=!time
y=0

[State 410, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,1
channel=0

[State 410, Snd]
type=playsnd
trigger1= !time
value=1,1
channel=1

[State 410, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = Ifelse(var(55),38,53),0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.cornerPush.velOff = 0
ground.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 100), var(36) := -34
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 410, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Strong Punch
[Statedef 420]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 420, Anim]
type=changeanim
trigger1=!time
value=420

[State 420,Posset]
type=posset
trigger1=!time
y=0

[State 420, Snd]
type=playsnd
trigger1= !time
value= 4,1
channel=0

[State 420, Snd]
type=playsnd
trigger1= !time
value=1,2
channel=1

[State 420, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = M
damage = Ifelse(var(55),62,78),0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = Ifelse(var(55)=2,-1,Ifelse(var(20),-4.5,-9)),Ifelse(var(55)=2,-9,0)
guard.velocity = Ifelse(var(20),-4.5,-9)
air.velocity = Ifelse(var(55)=2,-1,Ifelse(var(20),-2.5,-5)),Ifelse(var(55)=2,-9.5,-3)
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 100), var(36) := -75
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 420, ChangeState]
type = ChangeState
trigger1 = animelemtime(4)>=1 && movehit
trigger1 = var(55)=2 && command="holdup"
value = 123
ctrl = 0
ignorehitpause = 1

[State 420, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 420, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Kick
[Statedef 430]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 0
faceP2 = 1

[State 430, Anim]
type=changeanim
trigger1=!time
value=430

[State 430,Posset]
type=posset
trigger1=!time
y=0

[State 430, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,0
channel=0

[State 430, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 430, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1=  !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
damage = 25,0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2+10*var(44),3
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=90), var(36):=-5
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 430, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 430, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Crouching Medium Kick
[Statedef 440]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 440, Anim]
type=changeanim
trigger1=!time
value=440

[State 440,Posset]
type=posset
trigger1=!time
y=0

[State 440, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,1
channel=0

[State 440, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 440, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
forcenofall = !var(20)
attr = C,NA
hitflag = MAF
guardflag = L
damage = Ifelse(var(55),38,53),0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3*var(9)
ground.slidetime = 15 + 3*var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = ifElse(var(20), -3.66, -7.51), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = -6.46, -5.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=100), var(36):=-7
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
movetype = I

[State 440, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 450]
type = C
physics = C
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 450, Anim]
type=changeanim
trigger1=!time
value=450

[State 450,Posset]
type=posset
trigger1=!time
y=0

[State 450, Snd]
type=playsnd
trigger1= !time
value= 4,1
channel=0

[State 450, Snd]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 450, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
ID = 450
attr = C,NA
hitflag = MAF
guardflag = L
damage = Ifelse(var(55),62,78),0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
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
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-7
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 450, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(450)
value = 455
ID = 450
ignoreHitPause = 1
persistent = 0

[State 450, StateTypeSet: Idle]
type = StateTypeset
trigger1= AnimElemTime(5) >= 0
moveType = I

[State 450, 5]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; Tripped get-hit (shaking)
[Statedef 455]
type = A
movetype= H
physics = N
velset = 0,0

[State 5070, 1]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 456

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140


; Tripped get-hit (knocked away)
[Statedef 456]
type = A
movetype= H
physics = N

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 5071, 3] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.trip.groundlevel)
type = SelfState
value = 5110


;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 600]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 600, Anim]
type=changeanim
trigger1=!time
value=600

[State 600, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,0
channel=0

[State 600, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 600, Hit]
type=hitdef
triggerall = (fvar(8)<3 && var(15)<16 || var(20))
trigger1 = AnimElem = 2
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = 21,0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2, -4), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = Ifelse(var(20)||var(55)=2,-1,-3),-7
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2,7
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 90), var(36) := -44
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 620, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 600, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Medium Punch
[Statedef 610]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 610, Anim]
type=changeanim
trigger1=!time
value=610

[State 610, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,1
channel=0

[State 610, Snd]
type=playsnd
trigger1= animelem=3
value=1,1
channel=1

[State 610, Hit]
type=hitdef
triggerall = (fvar(8)<3 && var(15)<16 || var(20))
trigger1= animelem=2
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = Ifelse(var(55),38,53),0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = Ifelse(var(20)||var(55)=2,-1,-3),-7
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2,8
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 90), var(36) := -40
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
movetype = I

[State 610, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Punch
[Statedef 620]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 620, Anim]
type=changeanim
trigger1=!time
value=620

[State 620, Snd]
type=playsnd
trigger1= animelem=2
value= 4,1
channel=0

[State 620, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 620, Hit]
type=HitDef
triggerall = (fvar(8)<4 && var(15)<17 || var(20))
trigger1= animelem=2
attr=A, NA
damage = Ifelse(var(55),72,84), 0
animtype=Hard
guardflag=HA
hitflag=MAF
getpower=30 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime = Ifelse(var(20), 6,Ifelse(var(55)=2, 15, 12)), Ifelse(var(20), 6,Ifelse(var(55)=2, 15, 12))
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 120), var(36) := -48
ground.type=High
ground.slidetime=12 + 4*var(9)
ground.hittime =12 + 4*var(9)
guard.hittime =18
ground.velocity = Ifelse(var(20),-2.5,-5)
guard.velocity = Ifelse(var(20),-2.5,-5)
air.animType=Back
fall.animType=Back
air.type=High
air.velocity = Ifelse(var(55)=2,-12,Ifelse(var(20),-2,-5)),Ifelse(var(55)=2,12,Ifelse(var(20),-3,-5))
airguard.velocity = -5.5, -1
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.hittime = 22
airguard.ctrlTime = 16
yaccel = Ifelse(var(55)=2,1,.58)
fall = 0
air.fall=var(55)=2
fall.recover = 0
fall.recovertime = 120
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-4,4)
fall.envshake.time = 12
fall.envshake.ampl = Ifelse(random<=500,-5,5)

[State 620, Hit]
type=hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1= Animelem=3&&movecontact=0
attr=A, NA
damage = Ifelse(var(55),72,84), 0
animtype=Hard
guardflag=HA
hitflag=MAF
getpower=30 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime = Ifelse(var(20), 6,Ifelse(var(55)=2, 15, 12)), Ifelse(var(20), 6,Ifelse(var(55)=2, 15, 12))
hitsound = S2,9
guardsound = s3,0
sparkno = -1 + 0 * (var(33) := 8020)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 120), var(36) := -48
ground.type=High
ground.slidetime=12 + 4*var(9)
ground.hittime =12 + 4*var(9)
guard.hittime =18
ground.velocity = Ifelse(var(20),-2.5,-5)
guard.velocity = Ifelse(var(20),-2.5,-5)
air.animType=Back
fall.animType=Back
air.type=High
air.velocity = Ifelse(var(55)=2,-12,Ifelse(var(20),-2,-5)),Ifelse(var(55)=2,12,Ifelse(var(20),-3,-5))
airguard.velocity = -5.5, -1
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.hittime = 22
airguard.ctrlTime = 16
yaccel = Ifelse(var(55)=2,1,.58)
fall = 0
air.fall=var(55)=2
fall.recover = 0
fall.recovertime = 120
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-4,4)
fall.envshake.time = 12
fall.envshake.ampl = Ifelse(random<=500,-5,5)

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(6) >= 0
moveType = I

[State 620, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Light Kick
[Statedef 630]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 0

[State 630, Anim]
type=changeanim
trigger1=!time
value=630

[State 630, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,0
channel=0

[State 630, Snd]
type=playsnd
trigger1= animelem=2
value=1,3
channel=1

[State 630, Hit]
type=hitdef
triggerall = (fvar(8)<3 && var(15)<16 || var(20))
trigger1 = AnimElem = 2
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = 25,0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 2*var(9)
ground.slidetime = 12 + 2*var(9)
guard.hittime = 12
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -2.41, -4.49)
guard.cornerPush.velOff = 0
air.velocity = Ifelse(var(20)||var(55)=2,-1,-3),-7
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2+10*var(44),3
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=90), var(36):=-25
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 630, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 630, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 620, End]
type=changestate
trigger1= pos y>-vel y
value=52


;---------------------------------------------------------------------------
; Jump Medium Kick
[Statedef 640]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 640, Anim]
type=changeanim
trigger1=!time
value=640

[State 640, Snd]
type=playsnd
trigger1= !time && random<500
value= 4,1
channel=0

[State 640, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1

[State 640, Hit]
type=hitdef
triggerall = (fvar(8)<3 && var(15)<16 || var(20))
trigger1 = AnimElem = 2
forcenofall = !var(20)
attr = A,NA
hitflag = MAF
guardflag = HA
damage = Ifelse(var(55),38,53),0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
guard.pausetime = ifelse(var(20), 5, 10), ifelse(var(20), 5, 10)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 12 + 3*var(9)
ground.slidetime = 12 + 3*var(9)
guard.hittime = 15
air.hittime = 120
airguard.ctrltime = 16
ground.velocity = ifElse(var(20), -2.41, -4.49), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -3.66, -7.51)
guard.cornerPush.velOff = 0
air.velocity = Ifelse(var(20)||var(55)=2,-1,-3),-7
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recoverTime = 120
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=90), var(36):=-32
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
movetype = I

[State 640, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 640, End]
type=changestate
trigger1= pos y>-vel y
value=52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 650]
type = A
physics = N
moveType = A
ctrl = 0
sprPriority = 1
powerAdd = 18 * !var(20)

[State 650, Anim]
type=changeanim
trigger1=!time
value=650

[State 650, Snd]
type=playsnd
trigger1= !time
value= 4,2
channel=0

[State 650, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 650, Hit]
type=hitdef
triggerall = (fvar(8)<3 && var(15)<17 || var(20))
trigger1=!Time
attr=A, NA
damage = Ifelse(var(55),70,96), 0
animtype=Hard
guardflag=HA
hitflag=MAF
getpower=30 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime = Ifelse(var(20), 6,Ifelse(var(55)=2, 15, 12)), Ifelse(var(20), 6,Ifelse(var(55)=2, 15, 12))
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-45
ground.type=High
ground.slidetime=12 + 4*var(9)
ground.hittime =12 + 4*var(9)
guard.hittime=18
ground.velocity=Ifelse(var(20),-2.5,-5)
guard.velocity=Ifelse(var(20),-2.5,-5)
air.type=High
airguard.ctrlTime=16
air.velocity =Ifelse(var(55)=2,-15,Ifelse(var(20),-2,-5)),Ifelse(var(55)=2,15,Ifelse(var(20),-4,-6))
airguard.velocity = -5.5, -1
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.hittime = 22
airguard.ctrlTime = 16
yaccel = Ifelse(var(55)=2,1,.58)
fall = 0
air.fall=var(55)=2
fall.recover = 0
fall.recovertime = 120
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-4,4)
fall.envshake.time = 12
fall.envshake.ampl = Ifelse(random<=500,-5,5)

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
moveType = I

[State 650, Gravity]
type = Gravity
trigger1 = Time >= 0

[State 650, End]
type=changestate
trigger1= pos y>-vel y
value=52

;===<Throw Attempt>==
[Statedef 800]
type=S
physics=S
movetype=A
ctrl=0
velset=0,0
sprpriority=1
poweradd=18*!var(20)
facep2=1

[State 800, Anim]
type=changeanim
trigger1=!time
value=800

[State 800,Posset]
type=posset
trigger1=!time
y=0

[State 800, Button]
type=varset
trigger1= !time && !AILevel
var(10)= (command="kk")

[State 800, Button AI]
type=varset
trigger1= !time && AILevel
var(10)= (random<500)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0

[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799])
var(19) = 7

[State 800, Guard Dist]
type=attackdist
trigger1= 1
value=0

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38)
attr=S,NT
hitflag=M-
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",810,815)
p2stateno=ifelse(command="holdback",822,820)

[State 800, Hit]
type=hitdef
trigger1= animelem=2
trigger1 = P2BodyDist x < 55
trigger1= !var(38) && numtarget(3200)
attr=S,NT
hitflag=M
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",810,815)
p2stateno=ifelse(command="holdback",822,820)

[State 800, Hit]
type=hitdef
trigger1= animelem=2 && var(10)
trigger1= !var(38)
trigger1 = P2BodyDist x < 55
attr=S,NT
hitflag=M-
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",850,855)
p2stateno=ifelse(command="holdback",860,865)

[State 800, Hit]
type=hitdef
trigger1= animelem=2 && var(10)
trigger1= !var(38) && numtarget(3200)
trigger1 = P2BodyDist x < 55
attr=S,NT
hitflag=M
priority = 1, Miss
getpower=0,0
givepower=0,0
sparkno = -1 +0*(var(33):=0)
guard.sparkno = -1 +0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=40), var(36):=-50
hitsound = -1 +0*(var(31):=800)
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=1
numhits=0
p1stateno=ifelse(command="holdback",850,855)
p2stateno=ifelse(command="holdback",860,865)

[State 800, Snd]
type=playsnd
trigger1= animelem=3
value=4,2
channel=0

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Type]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1


;Throw
[Statedef 810]
type=A
movetype=A
physics=N
anim=810
sprpriority=-2

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 250, Snd]
type=playsnd
trigger1=!Time
value=2,800

[State 810,1]
type=BindToTarget
trigger1=AnimElem=4
time=5
pos=5,-10,head

[State 810,2]
type=Varset
trigger1=Time=0
v=46
value=100

[State 810,End]
type=ChangeState
trigger1=AnimTime=0
value=811

[Statedef 811]
type=A
movetype=A
physics=N
anim=811
sprpriority=2

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 811, Snd]
type=playsnd
trigger1= !time
value= 4,4
channel=0

[State 811,1]
type=BindToTarget
trigger1=1
time=1
pos=-3,0,head

[State 810, Hit Spark]
type = Helper
trigger1=AnimElem=2
trigger2=AnimElem=4
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = 0,0
ownPal = 1
size.xScale=.75
size.yScale=.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 811,3]
type=PlaySnd
trigger1=AnimElem=2
trigger2=AnimElem=4
value=S2,7

[State 0, EnvShake]
type = EnvShake
trigger1=AnimElem=2
trigger2=AnimElem=4
time=5
ampl= Ifelse(random<=500,-3,3)

[State 811,4]
type=VarAdd
trigger1=1
v=46
value=-1

[State 811,4]
type=VarAdd
trigger1=Command="x"
trigger2=Command="y"
trigger3=Command="z"
v=46
value=4

[State 805, Turn]
type=turn
triggerall=prevstateno=810
trigger1=Var(46)<=0

[State 811,End]
type=ChangeState
trigger1=Var(46)<=0
value=812

[Statedef 812]
type=A
physics=A
movetype=I
anim=43
velset=-4,-7

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 812,1]
type=Null
trigger1=1

[Statedef 815]
type=A
movetype=A
physics=N
anim=810
sprpriority=-2

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 250, Snd]
type=playsnd
trigger1=!Time
value=2,800

[State 810,1]
type=BindToTarget
trigger1=AnimElem=4
time=5
pos=5,-10,head

[State 810,2]
type=Varset
trigger1=Time=0
v=46
value=100

[State 810,End]
type=ChangeState
trigger1=AnimTime=0
value=811


[Statedef 820]
type=S
movetype=H
physics=N
velset=0,0

[State 805,1]
type=ChangeAnim2
trigger1=Time=0
value=820

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 805,2]
type=ChangeState
trigger1=P2Stateno=811
value=825

[Statedef 825]
type=S
movetype=H
physics=N

[State 805, Turn]
type=turn
triggerall=prevstateno!=820
trigger1=P2StateNo!=811
trigger1=time>2

[State 806,1]
type=ChangeAnim2
trigger1=Time=0
value=825

[State 806,3]
type=LifeAdd
trigger1=AnimElem=2
trigger2=AnimElem=4
value=-8

[State 806,4]
type=Velset
trigger1=P2StateNo!=811
trigger1=time>2
x=-5
y=-2

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 806,4]
type=SelfState
trigger1=P2StateNo!=811
trigger1=time>2
value=5050

[Statedef 822]
type=S
movetype=H
physics=N
velset=0,0

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 805,1]
type=ChangeAnim2
trigger1=!Time
value=820

[State 805,2]
type=ChangeState
trigger1=P2Stateno=811
value=825

[Statedef 823]
type=S
movetype=H
physics=N

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,0

[State 805, Turn]
type=turn
trigger1=P2StateNo!=811
trigger1=time>2

[State 806,1]
type=ChangeAnim2
trigger1=Time=0
value=825

[State 806,3]
type=LifeAdd
trigger1=AnimElem=2
trigger2=AnimElem=4
value=-8

[State 806,4]
type=Velset
trigger1=P2StateNo!=811
trigger1=time>2
x=-5
y=-2

[State 806,4]
type=SelfState
trigger1=P2StateNo!=811
trigger1=time>2
value=5050


;Throw
[Statedef 850]
type=S
movetype=A
physics=N
anim=850
sprpriority=-2

[State 250, Snd]
type=playsnd
trigger1=!Time
value=2,800

[State 710, Snd]
type = playsnd
trigger1=AnimElem=3
value = 4,0
channel = 0

[State 710, Snd]
type = playsnd
trigger1=AnimElem=3
value = 110,0
channel = 1

[State 851,1]
type=Velset
trigger1=AnimElem=3
x=4

[State 851,2]
type=TargetBind
trigger1=Time=0
pos=-5,0
time=1

[State 851,End]
type=ChangeState
trigger1=AnimTime=0
value=851

[Statedef 851]
type=S
movetype=A
physics=N
anim=851+5*(prevstateno=855)
velset=0,0

[State 0, SprPriority]
type = SprPriority
triggerall=prevstateno!=855
trigger1=1
value = -2

[State 852,1]
type=Turn
triggerall=prevstateno!=855
trigger1=AnimElem=4

[State 852,2]
type=TargetBind
trigger1=AnimElem=9
pos=56,0
time=1

[State 852,3]
type=PosAdd
trigger1=AnimElem=11
x=25

[State 811, Snd]
type=playsnd
trigger1=AnimElem=9
value= 4,3
channel=0

[State 810, Hit Spark]
type = Helper
trigger1=AnimElem=9
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
posType = P1
pos = 33,-42
ownPal = 1
size.xScale=.75
size.yScale=.75
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 0, EnvShake]
type = EnvShake
trigger1=AnimElem=9
time=10
ampl= Ifelse(random<=500,-3,3)


[State 852,5]
type=PlaySnd
trigger1=AnimElem=9,=1
value=S2,9

[State 852,6]
type=PlaySnd
trigger1=AnimElem=9
value=S200,2

[State 852,End]
type=ChangeState
trigger1=AnimTime=0
value=11
ctrl=1

;Throw
[Statedef 855]
type=S
movetype=A
physics=N
anim=855

[State 250, Snd]
type=playsnd
trigger1=!Time
value=2,800

[State 710, Snd]
type = playsnd
trigger1=AnimElem=3
value = 4,0
channel = 0

[State 710, Snd]
type = playsnd
trigger1=AnimElem=3
value = 110,0
channel = 1

[State 851,End]
type=ChangeState
trigger1=!AnimTime
value=851


[Statedef 860]
type=S
movetype=H
physics=N
velset=0,0

[State 855,1]
type=ChangeAnim2
trigger1=Time=0
value=860

[State 855,End]
type=ChangeState
trigger1=P2Stateno=851
value=861

[Statedef 861]
type=S
movetype=H
physics=N
velset=0,0

[State 856,1]
type=ChangeAnim2
trigger1=Time=0
value=861

[State 856,3]
type=LifeAdd
trigger1=AnimElem=2
value=-76

[State 856,4]
type=Velset
triggerall=prevstateno!=865
trigger1=AnimTime=0
x=5.5
y=-5

[State 856,4]
type=Velset
triggerall=prevstateno=865
trigger1=AnimTime=0
x=-5.5
y=-5

[State 856,4]
type=SelfState
trigger1=AnimTime=0
value=5050


[Statedef 865]
type=S
movetype=H
physics=N
velset=0,0

[State 855,1]
type=ChangeAnim2
trigger1=Time=0
value=860

[State 855,End]
type=ChangeState
trigger1=P2Stateno=851
value=861

;---PLAYER TURNS---
[Statedef 805]
type=S
movetype=A
physics=S
ctrl=0
sprpriority=0

[State 805, Anim]
type=changeanim
trigger1=!time
value=805

[State 805,Posset]
type=posset
trigger1=!time
y=0

[State 805, Throw]
type=targetstate
trigger1= !time && numtarget
value=806

[State 805, Throw]
type=targetfacing
trigger1= !time && numtarget
value=-1

[State 805, Width]
type=width
trigger1= 1
edge=24,24
ignoreHitPause = 1

[State 805, Turn]
type=turn
trigger1 = AnimElem = 4

[State 805, facing]
type=targetfacing
trigger1= 1
value=-1

[State 805, Escape]
type=changestate
trigger1= numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" && Target, command != "holddown"
trigger1= (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value=890

[State 805, Escape]
type=varadd
trigger1= var(19)>0
var(19)=-1

[State 805, TargetBind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(2) < 0
pos = 42,0

[State 805, TargetBind 2]
type = TargetBind
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(3) < 0
trigger2 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 11,0

[State 805, TargetBind 3]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 0,0

[State 805, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(2) < 0 || AnimElemTime(5) >= 0
value = 1

[State 805, SprPriority 2]
type = SprPriority
trigger1 = AnimElemTime(2) >= 0 && AnimElemTime(5) < 0
value = -1

[State 805, End]
type=changestate
trigger1= !numtarget
value=0
ctrl=1

[State 805, End]
type=changestate
trigger1= animelemtime(5)>=0
value=ifelse(var(10),860,810)



;---TARGET---
[Statedef 806]
type = S
moveType = H
physics = N
velSet = 0,0
sprPriority = 0

[State 806, Turn]
type = Turn
trigger1 = !Time
trigger1 = NumEnemy
trigger1 = Facing = EnemyNear, Facing
ignoreHitPause = 1

[State 806, NHB]
type=nothitby
trigger1= 1
value=SCA
time=1

[State 806, Anim]
type=changeanim2
trigger1= !time
value=806

[State 806, Camera]
type=screenbound
trigger1= 1
value=0
movecamera=1,1
ignoreHitPause = 1

[State 806, Safety]
type=selfstate
trigger1= time>=60
value= ifelse(pos y<0, 5040, 0)
ctrl=1

; Wall Jump 1
[Statedef 940]
type=A
movetype=I
physics=A
ctrl=0
velset=0,0
anim=940

[State 2040]
type=ScreenBound
trigger1=Time<10&&prevstateno!=50
movecamera=0
value=1

[State 2040]
type=PosSet
trigger1=Time<10
x=-160*facing

[State 2040, 6]
type=ChangeAnim
trigger1=Time=10
value=941

[State 60, Jump Sound]
type = PlaySnd
trigger1=Time=0
value = 52,0

[State 60, Jump Dust]
type = Explod
trigger1=Time=0
anim = 8101
ID = 8101
sprPriority = 3
posType = P1
pos = -22,-33
ownPal = 1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1


[State 2040]
type=VelSet
trigger1=Time=10
x=5.5
y=-9

[State 2040]
type=CtrlSet
trigger1=Time=10
value=1

[State 2040, 6]
type=ChangeState
trigger1=AnimTime=0
value=50
ctrl=0

; Wall Jump 2
[Statedef 941]
type=A
movetype=I
physics=A
juggle=0
ctrl=0
velset=0,0
anim=940

[State 2041,Turn]
type=Turn
trigger1=Time=0

[State 2041]
type=ScreenBound
trigger1=Time<10 && prevstateno!=50
movecamera=0
value=1

[State 2041]
type=VelSet
trigger1=Time<10
x=0
y=0

[State 60, Jump Sound]
type = PlaySnd
trigger1=Time=0
value = 52,0

[State 60, Jump Dust]
type = Explod
trigger1=Time=0
anim = 8101
ID = 8101
sprPriority = 3
posType = P1
pos = -22,-33
ownPal = 1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1


[State 2041,6]
type=ChangeAnim
trigger1=Time=10
value=941

[State 2041]
type=VelSet
trigger1=Time=10
x=5.5
y=-9

[State 2041]
type=CtrlSet
trigger1=Time=10
value=1

[State 2041,6]
type=ChangeState
trigger1=AnimTime=0
value=50
ctrl=0