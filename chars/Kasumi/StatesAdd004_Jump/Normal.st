; _________________________________________
;| Kasumi Todoh by Falcon Rapper              |
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
value=200+5*(p2bodydist x <= (const(size.xscale) * 19))

[State 200,Posset]
type=posset
trigger1=!time
y=0

[State 200, Snd]
type=playsnd
trigger1= !time && random<200
value= 4,0
channel=0

[State 200, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1=anim=200&&!Time
attr=S, NA
damage = Ifelse(var(55),20,32), 0
guardflag=M
hitflag=MAF
ID = 200*!var(20)
getpower=10 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime =Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
guard.pausetime = Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
animType=Light
air.animType=Back
fall.animType=Back
ground.type=High
air.type=Low
ground.slidetime=12 + 2 * var(9)
ground.hittime =12 + 2 * var(9)
guard.hittime=12
ground.velocity=ceil(Ifelse(var(55),-3,-4.49)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-3,-4.49)*(ifelse(!var(20),1,.5)))
air.velocity=-4.21,-7.36
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
air.hittime=120
yaccel=.58
fall=0
fall.recover=1
fall.recoverTime=120
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY=-10 + 0 * (var(35) := 90), var(36) := -63
hitsound = S2+10*var(44), 0
guardsound = s3,0
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1=anim=205&&!Time
attr=S, NA
damage = Ifelse(var(55),20,32), 0
guardflag=M
hitflag=MAF
ID = 200*!var(20)
getpower=10 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime =Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
guard.pausetime = Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
animType=Light
air.animType=Back
fall.animType=Back
ground.type=High
air.type=Low
ground.slidetime=12 + 2 * var(9)
ground.hittime =12 + 2 * var(9)
guard.hittime=12
ground.velocity=ceil(Ifelse(var(55),-3,-5.49)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-3,-5.49)*(ifelse(!var(20),1,.5)))
air.velocity=-4.21,-7.36
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
air.hittime=120
yaccel=.58
fall=0
fall.recover=1
fall.recoverTime=120
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY=-10 + 0 * (var(35) := 90), var(36) := -75
hitsound = S2+10*var(44), 0
guardsound = s3,0
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(4)>=0
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
value=210+5*(p2bodydist x <= (const(size.xscale) * 19))

[State 210,Posset]
type=posset
trigger1=!time
y=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2 && random<350
value= 4,1
channel=0

[State 210, Snd]
type=playsnd
trigger1= animelem=2
value=1,1
channel=1

[State 210, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= anim=210&&!Time
attr=S,NA        
hitflag=MAF       
guardflag=M         
priority=4 ,Hit   
damage = Ifelse(var(55),40,60), 0
ID = 200*!var(20)
getpower=20 * !var(20), 0
givepower=30, 30
pausetime =Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
guard.pausetime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType=Medium
air.animType=Back
fall.animType=Back
ground.type=High
air.type=Low
ground.slidetime=15 + 3*var(9)
ground.hittime=15 + 3*var(9)
guard.hittime=15
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
air.velocity=-3.24, -7.73
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recoverTime=120
hitsound = S2+10*var(44), 1
guardsound = s3, 0
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -71
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-2,2)

[State 210, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= anim=215&&!Time
attr=S,NA        
hitflag=MAF       
guardflag=M         
priority=4 ,Hit   
damage = Ifelse(var(55),40,60), 0
ID = 200*!var(20)
getpower=20 * !var(20), 0
givepower=30, 30
pausetime =Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
guard.pausetime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType=Medium
air.animType=Back
fall.animType=Back
ground.type=High
air.type=Low
ground.slidetime=15 + 3*var(9)
ground.hittime=15 + 3*var(9)
guard.hittime=15
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
air.velocity=-3.24, -7.73
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recoverTime=120
hitsound = S2+10*var(44), 1
guardsound = s3, 0
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -85
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-2,2)

[State 200, Type]
type=statetypeset
trigger1= anim=210&&animelemtime(3)>=0
trigger2= anim=215&&animelemtime(5)>=0
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
value=220

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220, Snd]
type=playsnd
trigger1= animelem=2 && random<500
value= 4,2
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time
attr=S,NA        
hitflag=MAF       
guardflag=M         
animtype=Hard         
priority=4, Hit   
damage = Ifelse(var(55),65,88), 0
ID = 200*!var(20)
getpower=30 * !var(20), 0
givepower=30, 30
pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
guard.pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
air.animType=Back
fall.animType=Back
ground.type=Low   
air.type=Low
ground.slidetime=25 + 4*var(9)
ground.hittime=25 + 4*var(9)
guard.hittime=25
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-9,-10.52)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-9,-10.52)*(ifelse(!var(20),1,.5)))
air.velocity=-5.39, -5.65
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recovertime=120
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-60
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Dodge Strong Punch/Z-Counter Punch
[Statedef 221]
type   =S
movetype= A
physics=S
poweradd= ifElse(PrevStateNo=750, 0, 30 * !var(20))
ctrl=0
velset=0,0
sprpriority=2
facep2=1

[State 200, Anim]
type=changeanim
trigger1=!time
value=ifelse(prevstateno=700,221,220)

[State 1100]
type = velset
trigger1 = AnimElemtime(2) > 0 && AnimElemtime(4) < 0
x = 2

[State 1100]
type = velset
trigger1 = AnimElemtime(4) > 0
x = 0

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
trigger1=anim=221&&!Time
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
sparkNo=-1 + 0 * (var(33) := 8012)
guard.sparkNo=-1 + 0 * (var(34) := 8000)
sparkXY=-10 + 0 * (var(35) := 80), var(36) := -70
hitsound=S2+10*var(44),2
guardsound=s130, 0
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
trigger1=anim=220&&!Time
attr=S,NA        
hitflag=MAF       
guardflag=M         
animtype=Hard         
priority=6, Hit   ;Higher priority for counters
damage=105, 0
;ID = 200*!var(20)
getpower=0, 0
givepower=30, 30
pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
guard.pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
sparkNo=-1 + 0 * (var(33) := 8012)
guard.sparkNo=-1 + 0 * (var(34) := 8000)
sparkXY=-10 + 0 * (var(35) := 80), var(36) := -70
hitsound=S2+10*var(44),2
guardsound=s130, 0
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
trigger1 = anim=220&&AnimElemTime(6) = 0
trigger2 = anim=221&&AnimElemTime(5) = 0
moveType=I

[State 221, End]
type=ChangeState
trigger1=!AnimTime
value=0
ctrl=1

;---------------------------------------------------------------------------
; Hiji Ate
[Statedef 228]
type = S
physics = S
moveType = A
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
facep2 = 1

[State 208]
type = PosAdd
trigger1 = AnimElemTime(3) = 0
x = 10
[State 208]
type = PosAdd
trigger1 = AnimElemTime(4) = 0
trigger2 = AnimElemTime(5) = 0
trigger3 = AnimElemTime(6) = 0
x = 5

[State 220, Anim]
type=changeanim
trigger1=!time
value=228

[State 220,Posset]
type=posset
trigger1=!time
y=0

[State 220, Snd]
type=playsnd
trigger1= animelem=5
value= 228,0
channel=0

[State 220, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 220, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1 = AnimElem = 6 || AnimElem = 8
attr = S,NA
hitflag = MAF
guardflag = M
damage = Ifelse(var(55),22,26),0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 22 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = ifElse(var(20), -1, -3), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -1, -3)
guard.cornerPush.velOff = 0
air.velocity = -5.39, -5.65
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -15 + 0*(var(35):=160), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

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
value=230

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
trigger1= !Time
attr=S,NA        
hitflag=MAF       
guardflag=M         
animtype=Light         
priority=4,Hit   
damage = Ifelse(var(55),21,28), 0
ID = 200*!var(20)
getpower=10 * !var(20), 0
givepower=30, 30
pausetime =Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
guard.pausetime = Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
air.animType=Back
fall.animType=Back
ground.type=High    
air.type=Low
ground.slidetime=16 + 2*var(9)
ground.hittime=16 + 2*var(9)
guard.hittime=16
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-3,-4.49)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-3,-4.49)*(ifelse(!var(20),1,.5)))
air.velocity=-6.46,-5.25
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recovertime=120
hitsound = S2+10*var(44),3
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=90), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 200, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
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

[State 235]
type = PosAdd
trigger1 = AnimElemTime(1) = 0
x = 23

[State 240,Posset]
type=posset
trigger1=!time
y=0

[State 240, Snd]
type=playsnd
trigger1= animelem=3 && random<350
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
attr=S,NA        
hitflag=MAF       
guardflag=M         
animtype=Medium         
priority=4,Hit   
damage = Ifelse(var(55),52,63), 0
ID = 200*!var(20)
getpower=20 * !var(20), 0
givepower=30, 30
pausetime =Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
guard.pausetime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
air.animType=Back
fall.animType=Back
ground.type=High
air.type=Low
ground.slidetime=15 + 3*var(9)
ground.hittime=15 + 3*var(9)
guard.hittime=15
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
air.velocity=-6.46,-5.25
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recovertime=120
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time=10
envshake.ampl=Ifelse(random<=500,-2,2)
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-72
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-2,2)

[State 200, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 240, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


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
trigger1=!time && prevstateno != 700
value=250+5*(p2bodydist x <= (const(size.xscale) * 19))

[State 250, Anim]
type=changeanim
trigger1=!time && prevstateno = 700
value=250

[State 245]
type = PosAdd
trigger1 = Anim=250&&AnimElemTime(2) = 0
x = 20
[State 245]
type = PosAdd
trigger1 = Anim=250&&AnimElemTime(3) = 0
trigger2 = Anim=250&&AnimElemTime(4) = 0
x = 15

[State 250,Posset]
type=posset
trigger1=!time
y=0

[State 250, Snd]
type=playsnd
trigger1= animelem=3 && random<500
value= 4,2
channel=0

[State 250, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= anim=250&&!Time
attr=S,NA        
hitflag=MAF       
guardflag=M         
animtype=Hard         
priority=4,Hit   
damage = Ifelse(var(55),65,86), 0
ID = 200*!var(20)
getpower=30 * !var(20), 0
givepower=30, 30
pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
guard.pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
air.animType=Back
fall.animType=Back
ground.type=Low      
air.type=Low
ground.slidetime=22 + 4*var(9)
ground.hittime=22 + 4*var(9)
guard.hittime=22
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-9,-10.52)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-9,-10.52)*(ifelse(!var(20),1,.5)))
air.velocity=-6.46,-5.25
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recovertime=120
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time=12
envshake.ampl=Ifelse(random<=500,-3,3)
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-74
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-2,2)

[State 250, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= anim=255&&!Time
attr=S,NA        
hitflag=MAF       
guardflag=M         
animtype=Hard         
priority=4,Hit   
damage = Ifelse(var(55),65,86), 0
ID = 200*!var(20)
getpower=30 * !var(20), 0
givepower=30, 30
pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
guard.pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
air.animType=Back
fall.animType=Back
ground.type=Low      
air.type=Low
ground.slidetime=18 + 4*var(9)
ground.hittime=18 + 4*var(9)
guard.hittime=18
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-9,-10.52)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-9,-10.52)*(ifelse(!var(20),1,.5)))
air.velocity=-6.46,-5.25
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recovertime=120
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time=12
envshake.ampl=Ifelse(random<=500,-3,3)
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-70
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-2,2)

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
trigger1= !Time && random<200
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
attr=C,NA        
hitflag=MAF       
guardflag=M         
ID = 200*!var(20)
getpower=10 * !var(20), 0
givepower=30,30
animtype=Light         
priority=4,Hit   
damage = 21, 0
pausetime =Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
guard.pausetime = Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
air.animType=Back
fall.animType=Back
ground.type=Low      
air.type=Low
ground.slidetime=16 + 2*var(9)
ground.hittime=16 + 2*var(9)
guard.hittime=16
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-3,-4.49)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-3,-4.49)*(ifelse(!var(20),1,.5)))
air.velocity=-4.21,-7.36
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recovertime=120
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY=-10 + 0 * (var(35) := 90), var(36) := -45
hitsound = S2+10*var(44), 0
guardsound = s3,0
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
trigger1= !time && random<350
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
attr = C,NA
hitflag=MAF       
guardflag=M         
priority=4 ,Hit   
damage = Ifelse(var(55),38,53),0
ID = 200*!var(20)
getpower=20 * !var(20), 0
givepower=30, 30
pausetime =Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
guard.pausetime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
animType=Medium
air.animType=Back
fall.animType=Back
ground.type=High
air.type=Low
ground.slidetime=15 + 3*var(9)
ground.hittime=15 + 3*var(9)
guard.hittime=15
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
air.velocity=-3.24, -7.73
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recoverTime=120
hitsound = S2+10*var(44), 1
guardsound = s3, 0
hitsound = S2+10*var(44), 1
guardsound = s3, 0
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -52
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-2,2)

[State 410, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
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
trigger1= !time && random<500
value= 4,2
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
attr = C,NA     
hitflag = MAF      
guardflag = MA    
animtype = Hard       
priority = 4,Hit  
damage = Ifelse(var(55),62,78),0
ID = 200*!var(20)
getpower = 30 * !var(20), 0
givepower = 30, 30
pausetime=ceil(12*(ifelse(!var(20),1,.5))),ceil(12*(ifelse(!var(20),1,.5)))
air.animType = Back
fall.animType = Back
ground.type =High     ;Low,Trip,None
air.type = Low
ground.slidetime = 18 + 4*var(9)
ground.hittime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = Ifelse(var(55)=2,30,120)
ground.velocity = Ifelse(var(55)=2,-1,Ifelse(var(20),-1.5,-9)),Ifelse(var(55)=2,-9,0)
guard.velocity = Ifelse(var(20),-4.5,-9)
air.velocity = Ifelse(var(55)=2,-1,Ifelse(var(20),-1.5,-5)),Ifelse(var(55)=2,-9,-3)
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yaccel =  Ifelse(var(55)=2,.4,.65)
fall = 0
fall.recover = 1
fall.recovertime = Ifelse(var(55)=2,20,120)
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-74
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)
forceStand = 1

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
trigger1= !time && random<200
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
attr = C,NA
hitflag=MAF       
guardflag=M         
animtype=Light         
priority=4,Hit   
damage = Ifelse(var(55),21,28), 0
ID = 200*!var(20)
getpower=10 * !var(20), 0
givepower=30, 30
pausetime =Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
guard.pausetime = Ifelse(var(20), 4, 8), Ifelse(var(20), 4, 8)
air.animType=Back
fall.animType=Back
ground.type=High    
air.type=Low
ground.slidetime=16 + 2*var(9)
ground.hittime=16 + 2*var(9)
guard.hittime=16
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-3,-4.49)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-3,-4.49)*(ifelse(!var(20),1,.5)))
air.velocity=-6.46,-5.25
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recovertime=120
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
trigger1= animelem=2 && random<350
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
attr = C,NA

attr=C,NA        
hitflag=MAF       
guardflag=L         
animtype=Medium         
priority=4,Hit   
damage = Ifelse(var(55),45,65), 0
ID = 200*!var(20)
getpower=10 * !var(20), 0
givepower=30, 30
pausetime =Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
guard.pausetime = Ifelse(var(20), 5, 10), Ifelse(var(20), 5, 10)
air.animType=Back
fall.animType=Back
ground.type=Low      
air.type=Low
ground.slidetime=15 + 2*var(9)
ground.hittime=15 + 2*var(9)
guard.hittime=15
air.hittime=120
ground.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
guard.velocity=ceil(Ifelse(var(55),-5,-7.51)*(ifelse(!var(20),1,.5)))
air.velocity=-6.46,-5.25
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
yaccel=.58
fall=0
fall.recover=1
fall.recovertime=120
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-10
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-2,2)

[State 440, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
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
trigger1= animelem=2 && random<500
value= 4,2
channel=0

[State 450, Snd]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 450, Hit]
type=hitdef
trigger1= !var(16) && (var(15)<1 || var(20))
trigger1= !Time && PrevStateNo != 750
attr=C,NA        
hitflag=MAF       
guardflag=L         
animtype=Hard         
priority=4,Hit   
damage = Ifelse(var(55),65,86), 0
getpower=30 * !var(20), 0
givepower=30, 30
pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
guard.pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
air.animType=Back
fall.animType=Back
ground.type=Trip     
air.type=Trip
ground.slidetime=18 + 4*var(9)
ground.hittime=18 + 4*var(9)
guard.hittime=18
air.hittime=120
fall=1
fall.recover=1
fall.recovertime=120
yaccel=.58
ground.velocity=-1.5, -6
guard.velocity=Ifelse(var(20),-3,-6)
air.velocity=-1.5, -6
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-10
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-2,2)

[State 450, HitDef: Z-Counter]
type=HitDef
trigger1 = !var(16) && (var(15)<1 || var(20))
trigger1=!Time && PrevStateNo=750
attr=C,NA        
hitflag=MAF       
guardflag=L         
animtype=Diagup         
priority=6,Hit   ;Higher value due to it being a counter
damage=80, 0
getpower=0, 0
givepower=30, 30
pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
guard.pausetime = Ifelse(var(20), 6, 12), Ifelse(var(20), 6, 12)
air.animType=Diagup
fall.animType=Diagup
ground.type=Low     
air.type=Low
ground.slidetime=18 + 4*var(9)
ground.hittime=18 + 4*var(9)
guard.hittime=18
air.hittime=120
fall=1
fall.recover=0
yaccel=.58
ground.velocity=Ifelse(var(20),-3,-6), -5.5
guard.velocity=Ifelse(var(20),-3,-6)
air.velocity=Ifelse(var(20),-3,-6), -5.5
ground.cornerPush.velOff=0
guard.cornerPush.velOff=0
air.cornerPush.velOff=0
palFX.time=12 * var(9)
palFX.add=255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time=12
envshake.ampl=Ifelse(random<=500,-3,3)
fall.envshake.time=12
fall.envshake.ampl=Ifelse(random<=500,-5,5)
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-10
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-2,2)

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
trigger1= animelem=2 && random<200
value= 4,0
channel=0

[State 600, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 600, Hit]
type=hitdef
triggerall = (fvar(8)<3 && var(15)<15 || var(20))
trigger1 = !Time
attr=A, NA
damage = Ifelse(var(55),25,35), 0
animtype=Light
guardflag=HA
hitflag=MAF
ID = 200*!var(20)
getpower=10 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime = Ifelse(var(20), 4,Ifelse(var(55)=2, 12, 8)), Ifelse(var(20), 4,Ifelse(var(55)=2, 12, 8))
ground.type=High
ground.slidetime=12 + 2*var(9)
ground.hittime =12 + 2*var(9)
guard.hittime =12
ground.velocity=Ifelse(var(20),-2,-4)
guard.velocity=Ifelse(var(20),-2,-4)
airguard.ctrlTime=16
air.animType = Back
fall.animType = Back
air.type = High
air.velocity = Ifelse(var(20)||var(55)=2,-1,-3),-7
airguard.velocity = -4.75, -0.5
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.hittime = 12
yaccel = Ifelse(var(55)=2,.45,.58)
fall = 0
fall.recover = 1
fall.recovertime = 120
sparkNo = -1 + 0 * (var(33) := 8010)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY=-10 + 0 * (var(35) := 90), var(36) := -58
hitsound = S2+10*var(44), 0
guardsound = s3,0
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 8
envshake.ampl = Ifelse(random<=500,-2,2)

[State 620, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
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
trigger1= animelem=3 && random<350
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
trigger1=!Time
attr=A, NA
damage = Ifelse(var(55),38,53),0
animtype=Medium
guardflag=HA
hitflag=MAF
ID = 200*!var(20)
getpower=20 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime = Ifelse(var(20), 5,Ifelse(var(55)=2, 12, 10)),Ifelse(var(20), 5,Ifelse(var(55)=2, 12, 10))
ground.type=High
ground.slidetime=12 + 3*var(9)
ground.hittime =12 + 3*var(9)
guard.hittime =15
ground.velocity=Ifelse(var(20),-2,-4)
guard.velocity=Ifelse(var(20),-2,-4)
air.animType=Back
fall.animType=Back
air.type=High
air.velocity = Ifelse(var(20)||var(55)=2,-1,-3),-7
airguard.velocity = -5.5, -1
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.hittime = 12
airguard.ctrlTime = 16
yaccel = Ifelse(var(55)=2,.45,.58)
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2+10*var(44), 1
guardsound = s3, 0
sparkNo = -1 + 0 * (var(33) := 8011)
guard.sparkNo = -1 + 0 * (var(34) := 8000)
sparkXY = -10 + 0 * (var(35) := 100), var(36) := -45
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-2,2)

[State 610, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(5) >= 0
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
trigger1= animelem=2 && random<500
value= 4,2
channel=0

[State 620, Snd]
type=playsnd
trigger1= animelem=2
value=1,2
channel=1

[State 620, Hit]
type=hitdef
triggerall = (fvar(8)<4 && var(15)<17 || var(20))
trigger1=!Time
attr=A, NA
damage = Ifelse(var(55),72,84), 0
animtype=Hard
guardflag=HA
hitflag=MAF
getpower=30 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime = Ifelse(var(20), 6,Ifelse(var(55)=2, 15, 12)), Ifelse(var(20), 6,Ifelse(var(55)=2, 15, 12))
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
hitsound=S2+10*var(44),2
guardsound=s3, 0
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-67
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-3,3)
fall.envshake.time = 12
fall.envshake.ampl = Ifelse(random<=500,-5,5)

[State 620, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(4) >= 0
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
trigger1= animelem=2 && random<200
value= 4,0
channel=0

[State 630, Snd]
type=playsnd
trigger1= animelem=2
value=1,3
channel=1

[State 630, Hit]
type=hitdef
triggerall = (fvar(8)<3 && var(15)<15 || var(20))
trigger1=!Time
attr=A, NA
damage = Ifelse(var(55),25,35), 0
animtype=Light
guardflag=HA
hitflag=MAF
ID = 200*!var(20)
getpower=10 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime = Ifelse(var(20), 4,Ifelse(var(55)=2, 12, 8)), Ifelse(var(20), 4,Ifelse(var(55)=2, 12, 8))
air.animType=Back
fall.animType=Back
ground.type=High
ground.slidetime=12 + 2*var(9)
ground.hittime =12 + 2*var(9)
guard.hittime=12
ground.velocity=Ifelse(var(20),-2,-4)
guard.velocity=Ifelse(var(20),-2,-4)
air.type=High
airguard.ctrlTime = 16
air.velocity =Ifelse(var(20)||var(55)=2,-1,-3),-7
airguard.velocity = -5, -1
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.hittime = 12
yaccel = Ifelse(var(55)=2,.45,.58)
fall = 0
fall.recover = 1
fall.recovertime = 120
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 8
envshake.ampl = Ifelse(random<=500,-2,2)
hitsound = S2+10*var(44),3
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8010)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=90), var(36):=-52
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48

[State 630, Type]
type=statetypeset
trigger1= animelemtime(5)>=0
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
trigger1= animelem=2 && random<350
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
trigger1 = !time
attr=A, NA
damage = Ifelse(var(55),48,63), 0
animtype=Medium
guardflag=HA
hitflag=MAF
ID = 200*!var(20)
getpower=20 * !var(20), 0
givepower=30, 30
priority=4, Hit
pausetime = Ifelse(var(20), 5,Ifelse(var(55)=2, 12, 10)), Ifelse(var(20), 5,Ifelse(var(55)=2, 12, 10))
ground.type=High
ground.slidetime=12 + 3*var(9)
ground.hittime =12 + 3*var(9)
guard.hittime=15
ground.velocity=Ifelse(var(20),-2.5,-5)
guard.velocity=Ifelse(var(20),-2.5,-5)
air.animType=Back
fall.animType=Back
air.type=High
airguard.ctrlTime = 16
air.velocity = Ifelse(var(20)||var(55)=2,-1,-3),-7
airguard.velocity = -6,-1
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
air.hittime = 12
yaccel = Ifelse(var(55)=2,.45,.58)
fall = 0
fall.recover = 1
fall.recovertime = 120
palFX.time = 12 * var(9)
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-3,3)
hitsound = S2+10*var(44),4
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8011)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=120), var(36):=-55
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 10
envshake.ampl = Ifelse(random<=500,-2,2)

[State 640, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(10) >= 0
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
trigger1= animelem=3 && random<500
value= 4,2
channel=0

[State 650, Snd]
type=playsnd
trigger1= animelem=3
value=1,5
channel=1

[State 650, Hit]
type=hitdef
triggerall = (fvar(8)<3 && var(15)<16 || var(20))
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
fall.envshake.time = 12
fall.envshake.ampl = Ifelse(random<=500,-5,5)
hitsound = S2+10*var(44),5
guardsound = s3,0
sparkno = -1 + 0*(var(33):=8012)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=160), var(36):=-48
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
envshake.time = 12
envshake.ampl = Ifelse(random<=500,-2,2)

[State 650, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(9) >= 0
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
trigger1= animelem=1
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
hitsound = S2,800
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=0
numhits=0
p1stateno=ifelse(command="holdback",805,810)
p2stateno=ifelse(command="holdback",825,820)

[State 800, Hit]
type=hitdef
trigger1= animelem=1 && var(10)
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
hitsound = S2,800
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=0
numhits=0
p1stateno=ifelse(command="holdback",850,855)
p2stateno=ifelse(command="holdback",860,865)


[State 800, Hit]
type=hitdef
trigger1= animelem=1
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
hitsound = S2,800
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=0
numhits=0
p1stateno=ifelse(command="holdback",805,810)
p2stateno=ifelse(command="holdback",825,820)

[State 800, Hit]
type=hitdef
trigger1= animelem=1 && var(10)
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
hitsound = S2,800
guardsound = -1 +0*(var(32):=0)
fall=1
fall.recover=0
numhits=0
p1stateno=ifelse(command="holdback",850,855)
p2stateno=ifelse(command="holdback",860,865)

[State 800, Snd]
type=playsnd
trigger1= animelem=4
value=800,0
channel=0

[State 800, Snd]
type=playsnd
trigger1= animelem=2
value=1,0
channel=1

[State 800, Type]
type=statetypeset
trigger1= animelemtime(2)>=0
movetype=I

[State 800, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1


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
type=targetstate
trigger1= !var(10) && animelemtime(5)>=0
value=820
[State 805, Throw]
type=targetstate
trigger1= var(10) && animelemtime(5)>=0
value=860

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
value=ifelse(var(10),850,810)



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
value=820

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

;---------------------------------------------------------------------------
;Throw 1
[Statedef 810]
type = S
movetype= A
physics = N
anim = 810
poweradd = 60

[State 810]
type = PlaySnd
trigger1 = time = 0
value = 5, 8

[State 810]
type = PlaySnd
trigger1 = AnimElem = 4
value = 4,2
channel = 0

[State 810]
type = PlaySnd
trigger1 = AnimElem = 5
value = 2+10*var(44),2

[State 810]
type = TargetBind
trigger1 = AnimElemTime(2) <= 0
pos = 17, 0

[State 810]
type = TargetBind
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(4) < 0
pos = 27, -64
[State 810]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 32, -75
[State 810]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 56, -104
[State 810]
type = TargetBind
trigger1 = AnimElemTime(6) = 0
pos = 69, -40

[State 810]
type = Width
trigger1 = AnimElemTime(6) < 0
edge = 60,0

[State 810]
type = TargetLifeAdd
trigger1 = AnimElem = 5
value = -78

[State 1210,Shake]
type=EnvShake
trigger1 = AnimElem = 5
time=16
ampl=Ifelse(random<=500,-2,2)
ignorehitpause=1

[State 1100, HitSpark]
type=Helper
trigger1 = AnimElem = 5
helperType=Normal
stateNo=8005
ID=8000
name="Spark"
pos= 50,-85
postype = p1
facing=-1
ownPal=1
size.xScale=1
size.yScale=1
pauseMoveTime=65535
superMoveTime=65535
ignoreHitPause=1
persistent=4

[State 810]
type = TargetState
trigger1 = AnimElemtime(6) = 0
value = 821

[State 810]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;@Šª‚«ã‚°‘ŠŽè
[Statedef 820]
type = A
movetype= H
physics = N
velset = 0,0


[State 1];ƒJƒƒ‰ŒÅ’è
type = screenbound
trigger1 = 1
value = 1
movecamera = 1

[State 850]
type = ChangeAnim2
Trigger1 = Time = 0
value = 820

;---------------------------------------------------------------------------
;@‘ŠŽè‰£‚ç‚êŒã
[Statedef 821]
type = A
movetype= H
physics = N
velset = -4,-4.5
poweradd = 40

[State 851]
type = VelAdd
Trigger1 = 1
y = .45

[State 851]
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200

[State 851]
type = SelfState
triggerall = Vel Y > 0
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5210

[State 851]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------
;@Šª‚«ã‚°‘ŠŽè
[Statedef 825]
type = A
movetype= H
physics = N
velset = 0,0

[State 0, Turn]
type = Turn
trigger1 = !time

[State 850]
type = ChangeAnim2
Trigger1 = Time = 0
value = 820


;---------------------------------------------------------------------------
; ‡‹C“Š‚°
[Statedef 850]
type = S
movetype= A
physics = N
anim = 850
poweradd = 60

[State 820]
type = PlaySnd
trigger1 = AnimElem = 6
value = 4,2

[State 820]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5

[State 820]
type = TargetBind
trigger1 = AnimElemTime(3) <= 0
pos = 50, 0

[State 820]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = 55, 0
[State 820]
type = TargetBind
trigger1 = AnimElemTime(5) >= 0 && AnimElemTime(6) < 0
pos = 50, 0
[State 820]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = 25, -50
[State 820]
type = TargetBind
trigger1 = AnimElemTime(7) = 0
pos = -12, 0

[State 820]
type = Width
trigger1 = AnimElemTime(6) < 0
edge = 60,0

[State 820]
type = TargetLifeAdd
trigger1 = AnimElem = 8
value = -78

[State 820]
type = PlaySnd
trigger1 = AnimElem = 7
value = 2+10*var(44),5

[State 820]
type = EnvShake
trigger1 = AnimElem = 7
time = 15

[State -2, Ground Impact Dust]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8110
ID = 8110
name = "Ground Impact Dust"
posType = P2
facing = -1
pos = 0,0
ownPal = 1
ignorehitpause=1

[State 820]
type = TargetState
trigger1 = AnimElemtime(8) = 0
value = 861

[State 1100]
type = posadd
trigger1 = AnimElemtime(10) = 0
x = 43

[State 820]
type = Turn
trigger1 = AnimElemtime(10) = 0

[State 820]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; ‡‹C“Š‚°
[Statedef 855]
type = S
movetype= A
physics = N
anim = 855
poweradd = 60

[State 820]
type = PlaySnd
trigger1 = AnimElem = 6
value = 4,2

[State 820]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1,5

[State 820]
type = TargetBind
trigger1 = AnimElemTime(3) <= 0
pos = 10, 0

[State 820]
type = TargetBind
trigger1 = AnimElemTime(4) >= 0 && AnimElemTime(5) < 0
pos = -10, 0

[State 820]
type = TargetBind
trigger1 = AnimElemTime(6) >= 0 && AnimElemTime(7) < 0
pos = -5, -50
[State 820]
type = TargetBind
trigger1 = AnimElemTime(7) = 0
pos = 32, 0

[State 820]
type = TargetLifeAdd
trigger1 = AnimElem = 8
value = -78

[State 820]
type = PlaySnd
trigger1 = AnimElem = 7
value = 2+10*var(44),5

[State 820]
type = EnvShake
trigger1 = AnimElem = 7
time = 15

[State -2, Ground Impact Dust]
type = Helper
trigger1 = AnimElem = 8
helperType = Normal
stateNo = 8110
ID = 8110
name = "Ground Impact Dust"
posType = P2
facing = -1
pos = 0,0
ownPal = 1
ignorehitpause=1

[State 820]
type = TargetState
trigger1 = AnimElemtime(8) = 0
value = 866

[State 820]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;@‡‹C“Š‚°‘ŠŽè
[Statedef 860]
type = A
movetype= H
physics = N
velset = 0,0

[State 860]
type = ChangeAnim2
Trigger1 = Time = 0
value = 860

;---------------------------------------------------------------------------
;@‘ŠŽè“Š‚°‚ç‚êŒã
[Statedef 861]
type = A
movetype= H
physics = N
velset = 4,-5
poweradd = 40

[State 861]
type = VelAdd
Trigger1 = 1
y = .45

[State 861]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;---------------------------------------------------------------------------
;@‡‹C“Š‚°‘ŠŽè
[Statedef 865]
type = A
movetype= H
physics = N
velset = 0,0

[State 860]
type = ChangeAnim2
Trigger1 = Time = 0
value = 860
;---------------------------------------------------------------------------
;@‘ŠŽè“Š‚°‚ç‚êŒã
[Statedef 866]
type = A
movetype= H
physics = N
velset = -4,-5
poweradd = 40

[State 861]
type = VelAdd
Trigger1 = 1
y = .45

[State 861]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

