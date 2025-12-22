







;==< DODGE >==
[Statedef 710]
type = S
physics = S
movetype = I
anim = 710
velset = 0, 0
ctrl = 0
sprpriority = -1
[State 710, Snd]
type = playsnd
trigger1 = animelem = 1
value = 100, 0
channel = 0
[State 710, Push]
type = playerpush
trigger1 = 1
value = 0
[State 710, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 710, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"),1151, 1152)
[State 710, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && (p2dist x = [0, 60]) && p2movetype != A
value = ifelse(random < 500, 1151, 1152)
[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< FORWARD ROLL >==
[Statedef 720]
type = C
physics = C
movetype = I
anim = 720
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 720, Snd]
type = playsnd
trigger1 = animelem = 1
value = 100, ifelse(random<500,0,1)
channel = 0
[State 720, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(7) < 0
x = 6
[State 720, Push]
type = playerpush
trigger1 = 1
value = 0
[State 720, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1
[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< POWER CHARGE >==
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State 740, Power]
type = poweradd
triggerall = anim = 740 && power < powermax
trigger1 = !AIlevel && (command = "holdb" && command = "holdy")
trigger2 = AIlevel
value = 2 + ifelse(time < 60, 0, (time -60) / 10)

;[State 740, Snd]
;type = playsnd
;trigger1 = anim = 740 && time = 8
;value = 100, 2
;channel = 0

[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
trigger1 = !numhelper(8330)
helpertype = normal
stateno = 8330
ID = 8330
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1
[State 740, FX]
type = helper
trigger1 = anim = 740 && animelemtime(2) >= 0
trigger1 = !numhelper(8331)
helpertype = normal
stateno = 8331
ID = 8331
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, Anim]
type = changeanim
triggerall = anim != 741
trigger1 = !AIlevel && (command != "holdb" || command != "holdy")
trigger2 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger3 = AIlevel && (inguarddist || p2movetype = A || p2dist x < 160)
value = 741

[State 740, Ctrl]
type = ctrlset
trigger1 = anim = 741
value = 1

[State 740, Snd]
type = stopsnd
trigger1 = anim = 741
channel = 0
persistent = 0

[State 740, End]
type = changestate
trigger1 = anim = 741 && !animtime
value = 0
ctrl = 1


;==< ZERO COUNTER >==
[Statedef 750]
type = S
physics = S
movetype = I
anim = ifelse(AIlevel, ifelse((p2statetype = A), 750, ifelse((p2statetype = C), 751, ifelse(random < 500, 750, 751))), ifelse(command = "Counter_P", 750, 751))
ctrl = 0
velset = 0, 0
poweradd = -750
sprpriority = 2
facep2 = 1

[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8350
ID = 8350
postype = p1
pos=40,-66
ownpal = 1
persistent = 0
supermovetime = 999
[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 16
movetime = 16
anim = -1
sound = s700, 0
p2defmul = 1
darken = 0
[State 750, End]
type = changestate
trigger1 = time >= 16
value = ifelse(anim=750, 1070, 450)




[Statedef 97]
type=A
physics=A
movetype=I
anim=97
ctrl=0
sprpriority=2
poweradd=100
facep2=1

[State 97, hb]
type=hitby
trigger1=time<15
value=SCA,AT
time=1

[State 97, pause]
type=pause
trigger1=!time
time=15
movetime=15
endcmdbuftime=15
pausebg=0

[State 97, pause]
type=pause
trigger1= !time && numenemy
trigger1= (enemynear,movehit=1)
time= ifelse((enemynear,hitpausetime=[0,15]), 15-(enemynear,hitpausetime), 0)
movetime= ifelse((enemynear,hitpausetime=[0,15]), 15-(enemynear,hitpausetime), 0)
endcmdbuftime= ifelse((enemynear,hitpausetime=[0,15]), 15-(enemynear,hitpausetime), 0)
pausebg=0

[State 97, Type]
type=statetypeset
trigger1= time<15
physics=N

[State 97, stop]
type=posfreeze
trigger1= time<15
value=1

[State 97, Vel]
type=velset
trigger1= time=15
x=ifelse(vel x>2,2,ifelse(vel x<-2,-2,vel x))
y=ifelse(vel y<-2,vel y,-2)

[State 97, Type]
type=statetypeset
trigger1= time>=15
physics=A

[State 97, ctrl]
type=ctrlset
trigger1= time>=15
value=1

[State 97, blueflash]
type=palfx
trigger1= !time
add=0,64,255
sinadd=0,-64,-255,60
time=15

[State 97, PlayerSnd]
type=playsnd
trigger1= !time
value=100,0
channel=0

[State 97, ParrySnd]
type=playsnd
trigger1= !time
value=6,1

[State 97, Spark]
type=explod
trigger1= animelem=2
anim=95
ID=95
sprpriority=5
postype=p1
pos=40,-66
pausemovetime=60
ownpal=1
scale=.5,.5

[State 97, asserts]
type=assertspecial
trigger1= 1
flag=noairguard

[State 97, ctrl]
type=ctrlset
trigger1= time>10
value=1





[Statedef 98]
type=C
physics=C
movetype=I
anim=98
velset=0,0
ctrl=0
sprpriority=2
poweradd=100
facep2=1

[State 98, hb]
type=hitby
trigger1=1
value=SCA,AT
time=1

[State 98, stop]
type=posfreeze
trigger1=1
value=1

[State 98, pause]
type=pause
trigger1=!time
time=15
movetime=15
endcmdbuftime=15
pausebg=0

[State 98, pause]
type=pause
trigger1= !time && numenemy
trigger1= (enemynear,movehit=1)
time= ifelse((enemynear,hitpausetime=[0,15]), 15-(enemynear,hitpausetime), 0)
movetime= ifelse((enemynear,hitpausetime=[0,15]), 15-(enemynear,hitpausetime), 0)
endcmdbuftime= ifelse((enemynear,hitpausetime=[0,15]), 15-(enemynear,hitpausetime), 0)
pausebg=0

[State 98, blueflash]
type=palfx
trigger1= !time
add=0,50,255
sinadd=0,-50,-255,60
time=15

[State 98, PlayerSnd]
type=playsnd
trigger1= !time
value=100,0
channel=0

[State 701, ParrySnd]
type=playsnd
trigger1= !time
value=6,1

[State 98, Spark]
type=explod
trigger1= animelem=2
anim=95
ID=95
sprpriority=5
postype=p1
pos=25,-22
pausemovetime=60
ownpal=1
scale=.5,.5

[State 98, nowalk]
type=assertspecial
trigger1=1
flag=nowalk

[State 98, End]
type=changestate
trigger1= !animtime
value=11
ctrl=1



[Statedef 99]
type=S
physics=S
movetype=I
anim=99
velset=0,0
ctrl=0
sprpriority=2
poweradd=100
facep2=1

[State 99, hb]
type=hitby
trigger1=1
value=SCA,AT
time=1

[State 99, stop]
type=posfreeze
trigger1=1
value=1

[State 99, pause]
type=pause
trigger1=!time
time=15
movetime=15
endcmdbuftime=15
pausebg=0

[State 99, pause]
type=pause
trigger1= !time && numenemy
trigger1= (enemynear,movehit=1)
time= ifelse((enemynear,hitpausetime=[0,15]), 15-(enemynear,hitpausetime), 0)
movetime= ifelse((enemynear,hitpausetime=[0,15]), 15-(enemynear,hitpausetime), 0)
endcmdbuftime= ifelse((enemynear,hitpausetime=[0,15]), 15-(enemynear,hitpausetime), 0)
pausebg=0

[State 99, blueflash]
type=palfx
trigger1= !time
add=0,50,255
sinadd=0,-50,-255,60
time=15

[State 99, PlayerSnd]
type=playsnd
trigger1= !time
value=100,0
channel=0

[State 99, ParrySnd]
type=playsnd
trigger1= !time
value=6,1

[State 99, Spark]
type=explod
trigger1= animelem=2
anim=95
ID=95
sprpriority=5
postype=p1
pos=31,-69
pausemovetime=60
ownpal=1
scale=.5,.5

[State 99, nowalk]
type=assertspecial
trigger1=1
flag=nowalk

[State 99, End]
type=changestate
trigger1= !animtime
value=0
ctrl=1


[Statedef 0]
type = S
physics = S
sprpriority = 0

[State 191, intro]
type = assertspecial
triggerall = (roundstate = 1) && roundno = 1
trigger1 = ifelse(teammode=simul,(enemy(1), stateno != 0) && (enemy(2), stateno != 0),enemy, stateno!=0)
flag = nobardisplay

[State 0, Anim]
type = ChangeAnim
trigger1 = (Anim != [0,5]) || ((Anim = [0,5]) && AnimTime = 0)
value = Ifelse (((Anim = 0 || Anim = 3) && Random >= 500) || Anim = 5, 0, ifelse ((Anim = [1,2]) && (Random = [251,500]), 2, ifelse (((Anim = [1, 2]) && Random >= 501), 3, ifelse (Anim <= 2, Anim + 1, ifelse (Anim = 3 && Random <= 500, 1, 0)))))

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3]
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, 4]
type = ChangeState
trigger1 = !alive
value = 5050



[Statedef 10]
type = C
physics = C
velset = 0,0
anim = 10

[State 10, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 11



[Statedef 11]
type = C
physics = C
anim = 11
sprpriority = 0

[State 11, 1]
type = ChangeAnim
trigger1 = Anim = 6 && AnimTime = 0
value = 11



[Statedef 12]
type = S
physics = S
anim = 12

[State 12, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0



[Statedef 20]
type = S
physics = S
sprpriority = 0

[State 20, 1]
type = VelSet
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, 2]
type = VelSet
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, 3]
type = ChangeAnim
triggerall = vel x > 0
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 20

[State 20, 4]
type = ChangeAnim
triggerall = vel x < 0
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 21



[Statedef 40]
type = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1
facep2 = 1

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 5]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x)

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1



[Statedef 45]
type = A
physics = N
ctrl = 0
velset = 0,0
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = !time
stateno = 8100
pos = 0, 0
sprpriority = -1
[State 45, 1]
type = ChangeAnim
trigger1 = SelfAnimExist(44)
value = 44

[State 45, 2]
type = ChangeAnim
trigger1 = !SelfAnimExist(44)
value = 41

[State 45, 3]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 45, 4]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 45, 5]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 45, 6]
type = VelSet
trigger1 = Time = 2
x = ifelse(sysvar(1)=0, const(velocity.airjump.neu.x), ifelse(sysvar(1)=1, const(velocity.airjump.fwd.x), const(velocity.airjump.back.x)))
y = const(velocity.airjump.y)

[State 45, 7]
type = ChangeState
trigger1 = Time = 2
value = 50
ctrl = 1



[Statedef 50]
type = A
physics = A
[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = !time
stateno = 8100
pos = 0, 0
sprpriority = -1
[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43))

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3



[Statedef 51]
type = A
physics = A

[State 51, 1]
type = Null
trigger1 = 1



[Statedef 52]
type = S
physics = S
ctrl = 1
anim = 47

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, 3]
type = CtrlSet
trigger1 = Time = 3
value = 1

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


[Statedef 55]
type = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 55, 1]
type = VarSet
trigger1 = 1
sysvar(1) = 0

[State 55, 2]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 55, 3]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 55, 4]
type = VelSet
trigger1 = AnimTime = 0
x = 0
y = -.0040

[State 55, 5]
type=ChangeState
trigger1=!AnimTime
value=56
ctrl =1



[Statedef 56]
type = A
physics = A
Anim = 41
velset = 0,-10
ctrl = 1

[State -3, Jumping Dust]
type = Helper
helpertype = normal
trigger1 = !time
stateno = 8100
pos = 0, 0
sprpriority = -1




[State 56, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = S4000, 5
volume = 255
channel = 1


[State 56, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S40,7
volume = 255


[State 56, 1]
type = VelAdd
triggerall = Vel X>= - 2
trigger1 = command = "holdback"
trigger1=Anim!= 43
x = -0.2

[State 56, 2]
type = VelAdd
triggerall = Vel X<= 2.5
trigger1 = command = "holdfwd"
trigger1 =Anim!= 42
x = 0.35

[State 56, 3]
type = VelSet
trigger1 = Anim = 42
trigger1 = Time = [0,5]
x = 5

[State 56, 4]
type = VelSet
trigger1 = Anim = 43
trigger1 = Time = [0,5]
x = -3.88

[State 56, 5]
type = ChangeAnim
trigger1 = sysvar(1) = 1
trigger1 = Time = [0,4]
value=42

[State 56, 6]
type = ChangeAnim
trigger1 = sysvar(1) = -1
trigger1 = Time = [0,4]
value = 43

[State 56, 7]
type = ChangeAnim
trigger1 = sysvar(1) = 1 || sysvar(1) = -1
trigger1 = animtime = 0
value = 41
elem = 9

[state 56, VelAdd]
type = VelAdd
trigger1 = Time > 30
x = 0
y = -.20

[State 56, 10]
type = turn
trigger1 = p2dist x < -4

[state 9000, End]
type = ChangeState
trigger1 = Pos Y >= 1
value = 52
ctrl

[Statedef 100]
type=S
movetype=I
physics=S
velset=0,0
anim=102
ctrl=1
sprpriority=1
facep2 = 1
[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = 1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 220, 1]
type = PlaySnd
trigger1 = !time
value = 40, 8
[State 100, assert]
type=assertspecial
trigger1= 1
flag=nowalk
flag2=noautoturn

[State 100, vel]
type=velset
trigger1= anim=102
x= const(velocity.run.fwd.x)

[State 100, steps]
type=playsnd
trigger1= anim=102 && (animelem=3 || animelem=6)
value=40,ifelse((animelem=3),3,4)

[State 100, change]
type=changeanim
triggerall= time>7 && anim=102
trigger1= var(7)<=0 && command!="holdfwd"
trigger2= var(7)>=1 && (p2movetype=A || p2dist x<80)
value=101
persistent=0

[State 220, 1]
type = PlaySnd
trigger1 = anim = 101 && animelem = 1
value = 40, 5
[State 101, Dust]
type = explod
trigger1 = anim = 101 && animelem = 1
anim = 8104
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
[State 100, end]
type=changestate
trigger1= anim=101 && !animtime
value=0
ctrl=1

[Statedef 102]
type=S
movetype=I
physics=S
velset=0,0
anim=100
ctrl=0
facep2 = 1
sprpriority=1

[State 102, vel]
type=velset
trigger1= animelem=2
x= const(velocity.run.fwd.x)
y= const(velocity.run.fwd.y)

[State 102, snd]
type=playsnd
triggerall = anim = 101
trigger1= time=1
value=40,0

[State 102, end]
type=posset
triggerall = time>2
trigger1 = Vel Y > 0 && Pos Y >= 0
trigger2 = anim = 101
y=0

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = time>2
trigger1 = Vel Y > 0 && Pos Y >= 0
statetype = S
movetype = I
physics = N

[State 102, end]
type=changeanim
trigger1 = time = 12
value=101
persistent = 0

[State -3, Landing Dust]
type = Explod
triggerall = anim = 101
trigger1 = Vel Y > 0 && Pos Y >= 0
persistent = 0
scale = .5, .5
anim = 7102
pos = 0, 0
sprpriority = -1

[State 102, end]
type=playsnd
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
value=40,0
persistent = 0

[State 0, VelSet]
type = VelSet
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
trigger2 = anim = 101
y=0
x=0

[State 0, VelSet]
type = Veladd
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
y=0
x=0

[State 102, end]
type=changeanim
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
value=101

[State 100, Ctrl]
type = CtrlSet
trigger1 = Anim = 101 && Animelem = 3
value = 1

[State 100, end]
type=changestate
trigger1= anim=101 && !animtime
value=0
ctrl=1



[Statedef 105]
type = S
physics = S
anim = 105
ctrl = 0
sprpriority = 1
facep2 = 1
[State 105, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8103
ID = 8100
name = "Dash Dust"
postype = p1
facing = -1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 102, vel]
type=velset
trigger1= animelem=2
x= const(velocity.run.back.x)
y= const(velocity.run.back.y)

[State 0, VelAdd]
type = VelAdd
trigger1 = time>=2
y = .3

[State 102, snd]
type=playsnd
triggerall = anim = 105
trigger1= animelem=2
value=40,6

[State 102, snd]
type=playsnd
triggerall = anim = 106
trigger1= time=1
value=40,0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = time>2
statetype = A
movetype = I
physics = N

[State 102, end]
type=posset
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
trigger2 = anim = 106
y=0

[State 0, StateTypeSet]
type = StateTypeSet
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
statetype = S
movetype = I
physics = N

[State 102, end]
type=changeanim
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
value=106
persistent = 0

[State -3, Landing Dust]
type = Explod
triggerall = anim = 106
trigger1 = Vel Y > 0 && Pos Y >= 0
persistent = 0
scale = .5, .5
anim = 7102
pos = 0, 0
sprpriority = -1
postype = p1

[State 102, end]
type=playsnd
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
value=40,0
persistent = 0

[State 0, VelSet]
type = VelSet
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
trigger2 = anim = 106
y=0
x=0

[State 0, VelSet]
type = Veladd
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
y=0
x=0


[State 102, end]
type=changeanim
triggerall = time>6
trigger1 = Vel Y > 0 && Pos Y >= 0
value=106

[State 100, Ctrl]
type = CtrlSet
trigger1 = Anim = 106 && Animelem = 3
value = 1

[State 100, end]
type=changestate
trigger1= anim=106 && !animtime
value=0
ctrl=1



[Statedef 110]
type = S
physics = N

[State 110, 0]
type = CtrlSet
trigger1 = Time = 0
value = 0

[State 110, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 110

[State 110, 2]
type = HitBy
trigger1 = Time = 0
value = SCA, NT, ST, HT
time = 30

[State 110, 3]
type = VelSet
trigger1 = Time = 0
x = 0
z = -7

[State 110, 4]
type = VelMul
trigger1 = 1
z = 0.8

[State 110, 5]
type = VelSet
trigger1 = AnimTime = -8
z = 0

[State 110, 7]
type = CtrlSet
trigger1 = AnimTime = 0
value = 1

[State 110, 8]
type = ChangeState
trigger1 = AnimTime = 0
value = 0



[Statedef 115]
type = S
physics = N

[State 115, 0]
type = CtrlSet
trigger1 = Time = 0
value = 0

[State 115, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 110

[State 115, 2]
type = HitBy
trigger1 = Time = 0
value = SCA, NT, ST, HT
time = 30

[State 115, 3]
type = VelSet
trigger1 = Time = 0
x = 0
z = 7

[State 115, 4]
type = VelMul
trigger1 = 1
z = 0.8

[State 115, 5]
type = VelSet
trigger1 = AnimTime = -8
z = 0

[State 115, 7]
type = CtrlSet
trigger1 = AnimTime = 0
value = 1

[State 115, 8]
type = ChangeState
trigger1 = AnimTime = 0
value = 0



[Statedef 120]
type = U
physics = U

[State 120, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 120 + (statetype = C) + (statetype = A)*2

[State 120, 2]
type = StateTypeSet
trigger1 = Time = 0 && statetype = S
physics = S

[State 120, 3]
type = StateTypeSet
trigger1 = Time = 0 && statetype = C
physics = C

[State 120, 4]
type = StateTypeSet
trigger1 = Time = 0 && statetype = A
physics = A

[State 120, Hi to Lo]
type = StateTypeSet
trigger1 = var(7)!= 1
trigger1 = statetype = S && command = "holddown"
trigger2 = var(7)>=1
trigger2 = statetype = S && P2statetype = C
trigger3 = var(7)>=1
trigger3 = statetype = S
trigger3 = P2bodydist x > 100
statetype = C
physics = C

[State 120, Lo to Hi]
type = StateTypeSet
trigger1 = var(7)!= 1
trigger1 = statetype = C && command != "holddown"
trigger2 = var(7)>=1
trigger2 = statetype = C && P2statetype = S
trigger2 = P2bodydist x <= 100
trigger2 = random < 200
trigger3 = var(7)>=1
trigger3 = statetype = C && P2statetype = A
trigger3 = P2bodydist x <= 100
statetype = S
physics = S

[State 120, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 130 + (statetype = C) + (statetype = A)*2

[State 120, Stop Guarding]
type = ChangeState
trigger1 = var(7)!= 1
trigger1 = command != "holdback"
trigger2 = var(7)>=1
trigger2 = random < 100
trigger3 = !inguarddist
value = 140



[Statedef 130]
type = S
physics = S

[State 130, 1]
type = ChangeAnim
trigger1 = Anim != 130
value = 130

[State 130, Hi to Lo]
type = ChangeState
trigger1 = var(7)!= 1
trigger1 = command = "holddown"
trigger2 = var(7)>=1
trigger2 = P2statetype = C
trigger3 = var(7)>=1
trigger3 = statetype = S
trigger3 = P2bodydist x > 100
value = 131

[State 130, Stop Guarding]
type = ChangeState
trigger1 = var(7)!= 1
trigger1 = command != "holdback"
trigger2 = var(7)>=1
trigger2 = random < 100
trigger3 = !inguarddist
value = 140



[Statedef 131]
type = C
physics = C

[State 131, 1]
type = ChangeAnim
trigger1 = Anim != 131
value = 131

[State 131, Lo to Hi]
type = ChangeState
trigger1 = var(7)!= 1
trigger1 = command != "holddown"
trigger2 = var(7)>=1
trigger2 = P2statetype = S
trigger2 = P2bodydist x <= 100
trigger2 = random < 200
trigger3 = var(7)>=1
trigger3 = P2statetype = A
trigger3 = P2bodydist x <= 100
value = 130

[State 131, Stop Guarding]
type = ChangeState
trigger1 = var(7)!= 1
trigger1 = command != "holdback"
trigger2 = var(7)>=1
trigger2 = random < 100
trigger3 = !inguarddist
value = 140



[Statedef 132]
type = A
physics = N

[State 132, 1]
type = ChangeAnim
trigger1 = Anim != 132
value = 132

[State 132, 2]
type = VelAdd
trigger1 = 1
y = Const(movement.yaccel)

[State 132, 3]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0) && (vel y > 0)

[State 132, 4]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 132, 5]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 132, 6]
type = ChangeState
triggerall = sysvar(0)
triggerall = inguarddist
trigger1 = var(7)!= 1
trigger1 = command = "holdback"
trigger2 = var(7)>=1
value = 130

[State 132, 7]
type = ChangeState
trigger1 = sysvar(0)
value = 52

[State 132, Stop Guarding]
type = ChangeState
trigger1 = var(7)!= 1
trigger1 = command != "holdback"
trigger2 = var(7)>=1
trigger2 = random < 100
trigger3 = !inguarddist
value = 140



[Statedef 140]
type = U
physics = U
ctrl = 1

[State 140, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 140 + (statetype = C) + (statetype = A)*2

[State 140, 2]
type = StateTypeSet
trigger1 = Time = 0 && statetype = S
physics = S

[State 140, 3]
type = StateTypeSet
trigger1 = Time = 0 && statetype = C
physics = C

[State 140, 4]
type = StateTypeSet
trigger1 = Time = 0 && statetype = A
physics = A

[State 140, Hi to Lo]
type = StateTypeSet
trigger1 = var(7)!= 1
trigger1 = statetype = S && command = "holddown"
trigger2 = var(7)>=1
trigger2 = statetype = S && P2statetype = C
trigger3 = var(7)>=1
trigger3 = statetype = S
trigger3 = P2bodydist x > 100
statetype = C
physics = C

[State 140, Lo to Hi]
type = StateTypeSet
trigger1 = var(7)!= 1
trigger1 = statetype = C && command != "holddown"
trigger2 = var(7)>=1
trigger2 = statetype = C && P2statetype = S
trigger2 = P2bodydist x <= 100
trigger2 = random < 200
trigger3 = var(7)>=1
trigger3 = statetype = C && P2statetype = A
trigger3 = P2bodydist x <= 100
statetype = S
physics = S



[Statedef 150]
type = S
movetype= H
physics = N
velset = 0,0

[State 150, 1]
type = ChangeAnim
trigger1 = 1
value = 150

[State 150, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2*(command = "holddown")

[State 150, Hi to Lo]
type = StateTypeSet
trigger1 = statetype = S && command = "holddown"
statetype = C
physics = C

[State 150, Lo to Hi]
type = StateTypeSet
trigger1 = statetype = C && command != "holddown"
statetype = S
physics = S

[State 150, 3]
type = ForceFeedback
trigger1 = time = 0
waveform = square
time = 3



[Statedef 151]
type = S
movetype= H
physics = S
anim = 150

[State 151, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 151, 2]
type = VelSet
trigger1 = Time = GetHitVar(slidetime)
trigger2 = HitOver
x = 0

[State 151, 3]
type = CtrlSet
trigger1 = Time = GetHitVar(ctrltime)
value = 1

[State 151, Hi to Lo]
type = StateTypeSet
trigger1 = statetype = S && command = "holddown"
statetype = C
physics = C

[State 151, Lo to Hi]
type = StateTypeSet
trigger1 = statetype = C && command != "holddown"
statetype = S
physics = S

[State 151, 4]
type = ChangeState
trigger1 = HitOver
value = 130
ctrl = 1



[Statedef 152]
type = C
movetype= H
physics = N
velset = 0,0

[State 152, 1]
type = ChangeAnim
trigger1 = 1
value = 151

[State 152, 3]
type = ChangeState
trigger1 = HitShakeOver
value = 151 + 2*(command = "holddown")

[State 152, Hi to Lo]
type = StateTypeSet
trigger1 = statetype = S && command = "holddown"
statetype = C
physics = C

[State 152, Lo to Hi]
type = StateTypeSet
trigger1 = statetype = C && command != "holddown"
statetype = S
physics = S

[State 152, 4]
type = ForceFeedback
trigger1 = time = 0
waveform = square
time = 4



[Statedef 153]
type = C
movetype= H
physics = C
anim = 151

[State 153, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 153, 2]
type = VelSet
trigger1 = Time = GetHitVar(slidetime)
trigger2 = HitOver
x = 0

[State 153, 3]
type = CtrlSet
trigger1 = Time = GetHitVar(ctrltime)
value = 1

[State 153, Hi to Lo]
type = StateTypeSet
trigger1 = statetype = S && command = "holddown"
statetype = C
physics = C

[State 153, Lo to Hi]
type = StateTypeSet
trigger1 = statetype = C && command != "holddown"
statetype = S
physics = S

[State 153, 4]
type = ChangeState
trigger1 = HitOver
value = 131
ctrl = 1



[Statedef 154]
type = A
movetype= H
physics = N
velset = 0,0

[State 154, 1]
type = ChangeAnim
trigger1 = 1
value = 152

[State 154, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 155

[State 154, 3]
type = ForceFeedback
trigger1 = time = 0
waveform = square
time = 4



[Statedef 155]
type = A
movetype= H
physics = N
anim = 152

[State 155, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 155, 2]
type = VelAdd
trigger1 = 1
y = Const(movement.yaccel)

[State 155, 3]
type = CtrlSet
trigger1 = Time = GetHitVar(ctrltime)
value = 1

[State 155, 4]
type = VarSet
trigger1 = 1
sysvar(0) = (pos y >= 0) && (vel y > 0)

[State 155, 5]
type = VelSet
trigger1 = sysvar(0)
y = 0

[State 155, 6]
type = PosSet
trigger1 = sysvar(0)
y = 0

[State 155, 6]
type = ChangeState
trigger1 = sysvar(0)
trigger1 = command = "holdback"
trigger1 = inguarddist
value = 130

[State 155, 7]
type = ChangeState
trigger1 = sysvar(0)
value = 52



[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1



[Statedef 175]
type = S
ctrl = 0
velset = 0,0

[State 175, 1]
type = ChangeState
trigger1 = Time = 0
trigger1 = !SelfAnimExist(175)
value = 170

[State 175, 2]
type = ChangeAnim
trigger1 = Time = 0
value = 175

[State 175, 3]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[Statedef 180]
type = S
[State 0, VictoryQuote]
type = VictoryQuote
trigger1 = 1
value = ceil(0+random%30)
[State 0, Win by Corkscrew Blow / Corkscrew Cross]
type = VictoryQuote
trigger1 = (helper(8600), var(0) = 1) || (helper(8600), var(0) = 5)
value = ceil(30+random%2)
[State 0, Win by Rocket Uppercut]
type = VictoryQuote
trigger1 = (helper(8600), var(0) = 2)
value = ceil(32+random%2)
[State 0, Win by Rolling Thunder]
type = VictoryQuote
trigger1 = (helper(8600), var(0) = 3)
value = ceil(34+random%2)
[State 0, Vs. Abel]
type = VictoryQuote
trigger1 = enemy, name = "Abel" || enemy, name = "AbelTAG"
value = 36
[State 0, Vs. Adon]
type = VictoryQuote
trigger1 = enemy, name = "Adon" || enemy, name = "AdonTAG" || enemy, name = "Adon_mx"
value = 37
[State 0, Vs. Akuma]
type = VictoryQuote
trigger1 = (enemy, name = "Akuma" || enemy, name = "MvC-EoH Gouki" || enemy, name = "CvSGouki" || enemy, name = "svcgouki" || enemy, name = "ZXAkuma" || enemy, name = "Gouki" || enemy, name = "cvsgouki_normal" || enemy, name = "ZXAkuma") && enemy, authorname != "Mr. Ansatsuken" && enemy, authorname !="Phantom.of.the.server"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) != 2 && enemy, var(1) !=4
trigger3 = (enemy, name = "Gouki" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 0
trigger4 = enemy, name = "AkumaTAG" || enemy, name = "CvSGoukiTAG" || enemy, name = "Gouki" && enemy, authorname != "Mr. Ansatsuken"
trigger5 = (enemy, name = "GoukiTAG" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 0
trigger6 = enemy, name = "Shin Akuma" || enemy, name = "Shin Gouki" || enemy, name = "cvsgouki_ex"
trigger7 = (enemy, name = "Gouki"  && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 1
trigger8 = enemy, name = "Shin AkumaTAG" || enemy, name = "Shin GoukiTAG"
trigger9 = (enemy, name = "GoukiTAG" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 1
value = ceil(38+random%2)
[State 0, Vs. Alex]
type = VictoryQuote
trigger1 = enemy, name = "Alex" || enemy, name = "DR_Alex" || enemy, name = "Alex_mx"
value = ceil(40+random%2)
[State 0, Vs. Alisa]
type = VictoryQuote
trigger1 = enemy, name = "Alisa" || enemy, name = "Alisa Bosconovitch" || enemy, name = "CvS_Alisa" || enemy, name = "CFJ_Alisa"
trigger2 = enemy, name = "AlisaTAG" || enemy, name = "Alisa BosconovitchTAG" || enemy, name = "CvS_AlisaTAG" || enemy, name = "CFJ_AlisaTAG"
value = 42
[State 0, Vs. Balrog]
type = VictoryQuote
trigger1 = enemy, name = "Balrog" || enemy, name = "Boxer" || enemy, name = "Balrog (Boxer)" || enemy, name = "Balrog(Boxer)"
trigger2 = enemy, name = "BalrogTAG" || enemy, name = "Bison (Boxer)" || enemy, name = "M. Bison (Boxer)"
value = ceil(43+random%3)
[State 0, Vs. M. Bison]
type = VictoryQuote
trigger1 = enemy, name = "M. Bison" || enemy, name = "M.Bison" || enemy, name = "Bison" || enemy, name = "Dictator" || enemy, name = "cvsvega" || enemy, name = "cvsvega_normal" || enemy, name = "cvsvega_ex"
trigger2 = enemy, name = "Vega"
trigger2 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger3 = enemy, name = "True Bison" || enemy, name = "Shin Bison" || enemy, name = "Final Bison" || enemy, name = "MBison"
trigger4 = enemy, name = "M. BisonTAG" || enemy, name = "M.BisonTAG" || enemy, name = "BisonTAG" || enemy, name = "DictatorTAG"
trigger5 = enemy, name = "VegaTAG"
trigger5 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger6 = enemy, name = "True BisonTAG" || enemy, name = "Shin BisonTAG" || enemy, name = "Final BisonTAG" || enemy, name = "MBisonTAG"
trigger7 = enemy, name = "True Vega" || enemy, name = "Shin Vega" || enemy, name = "Final Vega"
trigger8 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "cvsvega" || enemy, name = "svcvega"
value = 46
[State 0, Vs. M. Bison]
type = VictoryQuote
trigger1 = enemy, name = "Final Bison" || enemy, name = "Final Vega" || enemy, name = "Shin Bison" || enemy, name = "Bison 2"
trigger2 = enemy, name = "Vega II" || enemy, name = "Bison2" || enemy, name = "VegaII" || enemy, name = "ShinBison"
trigger3 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "ShinM.Bison"
trigger4 = enemy, name = "FinalVega" || enemy, name = "FinalBison" ||  enemy, name = "cvsvega_ex"
trigger5 = enemy, name = "ShinVega" || enemy, name = "Shin Vega" ||  enemy, name = "Shin M.Bison"
trigger6 = enemy, name = "Vega" && enemy, authorname = "Froz"
trigger6 = enemy, var(40)=1
trigger7 = enemy, name = "Shin M. Bison" || enemy, name = "Final M. Bison" || enemy, name = "M. Bison 2" || enemy, name = "M. Bison II"
trigger8 = enemy, name = "M.Bison 2" || enemy, name = "M.Bison2" || enemy, name = "M.Bison II" || enemy, name = "M.BisonII"
trigger9 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "Shin M.Bison"
trigger10 = enemy, name = "Vega2" || enemy, name = "Vega 2" || enemy, name = "Bison Bison"
trigger11 = enemy, name = "True M.Bison" || enemy, name = "True M. Bison" || enemy, name = "TrueM.Bison"
trigger12 = enemy, name = "True Bison" || enemy, name = "True Bison" || enemy, name = "True Vega" || enemy, name = "TrueVega"
trigger13 = enemy, name = "Shin Dictator" || enemy, name = "ShinDictator" || enemy, name = "True Dictator" || enemy, name = "TrueDictator"
trigger14 = enemy, name = "Dictator2" || enemy, name = "Dictator 2" || enemy, name = "DictatorII" || enemy, name = "Dictator II"
trigger15 = enemy, name = "FinalDictator" || enemy, name = "Final Dictator" || enemy, name = "MBison2" || enemy, name = "MBison 2"
trigger16 = enemy, name = "MBisonII" || enemy, name = "MBison II" || enemy, name = "ShinMBison" || enemy, name = "Shin MBison"
trigger17 = enemy, name = "Final MBison" || enemy, name = "FinalMBison" || enemy, name = "TrueMBison" || enemy, name = "True MBison"
trigger18 = enemy, name = "M BisonII" || enemy, name = "M Bison II" || enemy, name = "ShinM Bison" || enemy, name = "Shin M Bison" || enemy, name = "M Bison2"
trigger19 = enemy, name = "Final M Bison" || enemy, name = "FinalM Bison" || enemy, name = "TrueM Bison" || enemy, name = "True M Bison" || enemy, name = "M Bison 2"
value = 46
[State 0, Vs. Cammy]
type = VictoryQuote
trigger1 = enemy, name = "Cammy" || enemy, name = "cvscammy" || enemy, name = "CammyTAG" || enemy, name = "Cammy_mx" || enemy, name = "Cammy White"
value = 48
[State 0, Vs. Chun-Li]
type = VictoryQuote
trigger1 = enemy, name = "Chun-Li" || enemy, name = "Chun-LiTAG" || enemy, name = "cvschunli" || enemy, name = "SF3 Chun Li" || enemy, name = "ChunLi_mx"
value = 49
[State 0, Vs. Cody]
type = VictoryQuote
trigger1 = enemy, name = "Cody" || enemy, name = "Cody Travers" || enemy, name = "Cody_mx"
trigger2 = enemy, name = "CodyTAG" || enemy, name = "Cody TraversTAG"
value = 50
[State 0, Vs. C. Viper]
type = VictoryQuote
trigger1 = enemy, name = "Crimson Viper" || enemy, name = "C. Viper" || enemy, name = "C.Viper" || enemy, name = "CFJ_C.Viper"
trigger2 = enemy, name = "Crimson ViperTAG" || enemy, name = "C. ViperTAG" || enemy, name = "C.ViperTAG" || enemy, name = "CFJ_C.ViperTAG"
value = 51
[State 0, Vs. Dan]
type = VictoryQuote
trigger1 = enemy, name = "Dan" || enemy, name = "Dan Hibiki" || enemy, name = "cvsdan" || enemy, name = "Marvel vs Capcom - Eternity of Heroes: Dan"
trigger2 = enemy, name = "DanTAG" || enemy, name = "Dan HibikiTAG" || enemy, name = "Marvel vs Capcom - Eternity of Heroes: Dan" || enemy, name = "Dan_mx"
value = 52
[State 0, Vs. Decapre]
type = VictoryQuote
trigger1 = enemy, name = "Decapre" || enemy, name = "Juni" || enemy, name = "Juli" || enemy, name = "CvS_Decapre" || enemy, name = "cvsjuni"
trigger2 = enemy, name = "DecapreTAG" || enemy, name = "JuniTAG" || enemy, name = "JuliTAG" || enemy, name = "CvS_DecapreTAG"
value = 53
[State 0, Vs. Dee Jay]
type = VictoryQuote
trigger1 = enemy, name = "Dee Jay" || enemy, name = "DeeJay_mx"
trigger2 = enemy, name = "Dee JayTAG"
value = 54
[State 0, Vs. Blanka]
type = VictoryQuote
trigger1 = enemy, name = "Dhalsim" || enemy, name = "DhalsimTAG" || enemy, name = "cvsdhalsim"
trigger2 = enemy, name = "RajaaDhalsim"
value = 55
[State 0, Vs. Dudley]
type = VictoryQuote
trigger1 = enemy, name = "Dudley" || enemy, name = "Dudley_mx"
value = ceil(56+random%3)
[State 0, Vs. El Fuerte]
type = VictoryQuote
trigger1 = enemy, name = "El Fuerte" || enemy, name = "ElFuerte" || enemy, name = "CFJ_ElFuerte"
trigger2 = enemy, name = "El FuerteTAG" || enemy, name = "ElFuerteTAG" || enemy, name = "CFJ_ElFuerteTAG"
value = 59
[State 0, Vs. Elena]
type = VictoryQuote
trigger1 = enemy, name = "Elena" || enemy, name = "Elena_mx"
trigger2 = enemy, name = "ElenaTAG"
value = ceil(60+random%2)
[State 0, Vs. Fei Long]
type = VictoryQuote
trigger1 = enemy, name = "Fei Long" || enemy, name = "FeiLong_mx"
trigger2 = enemy, name = "Fei LongTAG"
value = 62
[State 0, Vs. Gen]
type = VictoryQuote
trigger1 = enemy, name = "Gen" || enemy, name = "Master Gen" || enemy, name = "Gen_mx"
trigger2 = enemy, name = "GenTAG" || enemy, name = "Master GenTAG"
value = 63 ;ceil(60+random%2)
[State 0, Vs. Gill]
type = VictoryQuote
trigger1 = enemy, name = "Gill" || enemy, name = "Gill_mx"
value = 64 ;ceil(60+random%2)
[State 0, Vs. El Fuerte]
type = VictoryQuote
trigger1 = enemy, name = "Gouken SSF4" || enemy, name = "Gouken" || enemy, name = "Shin Gouken"
trigger2 = enemy, name = "Shen Long" || enemy, name = "Master Gouken"
trigger3 = enemy, name = "Gouken SSF4" || enemy, name = "GoukenTAG" || enemy, name = "Shin GoukenTAG"
trigger4 = enemy, name = "Shen LongTAG" || enemy, name = "Master GoukenTAG"
value = 65
[State 0, Vs. Guile]
type = VictoryQuote
trigger1 = enemy, name = "El Fuerte" || enemy, name = "ElFuerte" || enemy, name = "CFJ_ElFuerte"
trigger2 = enemy, name = "El FuerteTAG" || enemy, name = "ElFuerteTAG" || enemy, name = "CFJ_ElFuerteTAG"
value = 66
[State 0, Vs. Hakan]
type = VictoryQuote
trigger1 = enemy, name = "Hakan" || enemy, name = "CFJ_Hakan"
trigger2 = enemy, name = "HakanTAG" || enemy, name = "CFJ_HakanTAG"
value = 68
[State 0, Vs. Heihachi]
type = VictoryQuote
trigger1 = enemy, name = "CvS_Heihachi" || enemy, name = "CvS_HeihachiTAG" || enemy, name = "Heihachi" || enemy, name = "Heihachi Mishima"
value = 69
[State 0, Vs. E. Honda]
type = VictoryQuote
trigger1 = enemy, name = "Edmond Honda" || enemy, name = "E. Honda" || enemy, name = "cvshonda" || enemy, name = "Honda_mx"
trigger2 = enemy, name = "Edmond HondaTAG" || enemy, name = "E. HondaTAG" || enemy, name = "cvshondaTAG"
value = 70
[State 0, Vs. Hugo]
type = VictoryQuote
trigger1 = enemy, name = "Hugo" || enemy, name = "HugoTAG" || enemy, name = "Hugo_mx"
value = 71
[State 0, Vs. Ibuki]
type = VictoryQuote
trigger1 = enemy, name = "Ibuki" || enemy, name = "IbukiTAG" || enemy, name = "Ibuki_mx" || enemy, name = "DR_Ibuki"
value = ceil(72+random%2)
[State 0, Vs. Jin]
type = VictoryQuote
trigger1 = enemy, name = "Jin Kazama" || enemy, name = "Jin" || enemy, name = "CvS_Jin" || enemy, name = "CvS_JinTAG"
value = 74
[State 0, Vs. Juri]
type = VictoryQuote
trigger1 = enemy, name = "Juri" || enemy, name = "Juri Han" || enemy, name = "JuriHan" || enemy, name ="CFJ_JuriHan"
trigger2 = enemy, name = "JuriTAG" || enemy, name = "Juri HanTAG" || enemy, name = "JuriHanTAG" || enemy, name ="CFJ_JuriHanTAG"
value = ceil(75+random%2)
[State 0, Vs. Ken]
type = VictoryQuote
trigger1 = enemy, name = "Ken" || enemy, name = "cvsken" || enemy, name = "cvsken_normal" || enemy, name = "Ken Masters" || enemy, name = "Ken SF3trd" || enemy, name = "Street Fighter 3 Ken" || enemy, name = "Master Ken" && enemy, authorname != "Phantom.of.the.Server&Jmorphman" && enemy, authorname != "vyn"
trigger2 = enemy, name = "Ken Masters" && enemy, authorname = "Phantom.of.the.Server&Jmorphman"
value = ceil(77+random%3)
[State 0, Vs. Lili]
type = VictoryQuote
trigger1 = enemy, name = "Lili" || enemy, name = "CvS_Lili" || enemy, name = "CvS_LiliTAG" || enemy, name = "CFJ_Lili" || enemy, name = "CFJ_LiliTAG"
value = 80
[State 0, Vs. Makoto]
type = VictoryQuote
trigger1 = enemy, name = "Makoto" || enemy, name = "Makoto_mx" || enemy, name = "DR_Makoto"
trigger2 = enemy, name = "MakotoTAG"
value = 81
[State 0, Vs. Necro]
type = VictoryQuote
trigger1 = enemy, name = "Necro" || enemy, name = "Necro_mx" || enemy, name = "DR_Necro"
value = 82
[State 0, Vs. Oni]
type = VictoryQuote
trigger1 = enemy, name = "Oni" || enemy, name = "Oni Akuma" || enemy, name = "Oni Gouki" || enemy, name = "Ogre Akuma" || enemy, name = "Ogre Gouki" || enemy, name = "Kuroshiki Oni" || enemy, name = "CvS_Oni"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && (enemy, var(1) = 2 || enemy, var(1) = 4)
trigger3 = enemy, name = "Ogre" && enemy, authorname = "JUN"
trigger4 = enemy, name = "OniTAG" || enemy, name = "Oni AkumaTAG" || enemy, name = "Oni GoukiTAG" || enemy, name = "Ogre AkumaTAG" || enemy, name = "Ogre GoukiTAG"
value = 83
[State 0, Vs. Poison]
type = VictoryQuote
trigger1 = enemy, name = "Poison" || enemy, name = "PoisonTAG" || enemy, name = "CvS_Poison" || enemy, name = "CFJ_Poison"
value = 84
[State 0, Vs. Rolento]
type = VictoryQuote
trigger1 = enemy, name = "Rolento" || enemy, name = "RolentoTAG" || enemy, name = "cvsrolento" || enemy, name = "Rolento_mx"
value = 85
[State 0, Vs. Rose]
type = VictoryQuote
trigger1 = enemy, name = "Rose" || enemy, name = "RoseTAG" || enemy, name = "Rose_mx"
value = 86
[State 0, Vs. Ryu]
type = VictoryQuote
trigger1 = enemy, name = "Ryu" || enemy, name = "Ryu Hoshi" || enemy, name = "Master Ryu" && enemy, authorname != "Phantom.of.the.Server"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger3 = enemy, name = "MvC-EoH Ryu" || enemy, name = "cvsryu" || enemy, name = "cvsryu_normal" || enemy, name = "svcryu"
trigger4 = enemy, name = "RyuTAG" || enemy, name = "Ryu HoshiTAG" || enemy, name = "Master RyuTAG" && enemy, authorname != "Phantom.of.the.Server"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger6 = enemy, name = "MvC-EoH RyuTAG"
value = ceil(87+random%2)
[State 0, Vs. Oro]
type = VictoryQuote
trigger1 = enemy, name = "Oro" || enemy, name = "SFIII_Oro" || enemy, name = "DR_Oro" || enemy, name = "Oro_mx"
value = 89
[State 0, Vs. Sagat]
type = VictoryQuote
trigger1 = enemy, name = "Sagat" || enemy, name = "SagatTAG" || enemy, name = "cvssagat" || enemy, name = "Sagat_mx"
value = 90
[State 0, Vs. Sakura]
type = VictoryQuote
trigger1 = enemy, name = "Sakura" || enemy, name = "Sakura Kasugano" || enemy, name = "SakuraKasugano" || enemy, name = "cvssakura" || enemy, name = "cvssakura_normal" || enemy, name = "cvssakura_ex"
trigger2 = enemy, name = "SakuraTAG" || enemy, name = "Sakura KasuganoTAG" || enemy, name = "SakuraKasuganoTAG" || enemy, name = "Sakura_mx"
value = 91
[State 0, Vs. Sean]
type = VictoryQuote
trigger1 = enemy, name = "Sean" || enemy, name = "Sean Matsuda" || enemy, name = "Sean_mx"
value = 92
[State 0, Vs. Seth]
type = VictoryQuote
trigger1 = enemy, name = "Seth" || enemy, name = "SethTAG" || enemy, name = "SF4Seth"
value = 93
[State 0, Vs. T. Hawk]
type = VictoryQuote
trigger1 = enemy, name = "T. Hawk" || enemy, name = "T.Hawk" || enemy, name = "Thunder Hawk"
trigger2 = enemy, name = "T Hawk" || enemy, name = "ThunderHawk" || enemy, name = "THawk" || enemy, name = "T.Hawk_mx"
value = 94
[State 0, Vs. Urien]
type = VictoryQuote
trigger1 = enemy, name = "Urien" || enemy, name = "Urien_mx" || enemy, name = "SFIII_Urien"
value = 95
[State 0, Vs. Vega]
type = VictoryQuote
trigger1 = enemy, name = "Vega" || enemy, name = "Claw" || enemy, name = "Balrog_mx" || enemy, name = "Vega(Claw)" || enemy, name = "Vega (Claw)" || enemy, name = "Balrog(Claw)" || enemy, name = "Balrog (Claw)"
trigger1 = enemy, authorname != "Phantom.of.the.Server" && enemy, authorname != "Froz"
trigger2 = enemy, name = "VegaTAG" || enemy, name = "ClawTAG"
trigger2 = enemy, authorname != "Phantom.of.the.Server" && enemy, authorname != "Froz"
value = 96
[State 0, Vs. Yang]
type = VictoryQuote
trigger1 = enemy, name = "Yang" || enemy, name = "Yang_mx"
value = 97
[State 0, Vs. Yun]
type = VictoryQuote
trigger1 = enemy, name = "Yun" || enemy, name = "cvsyun"
trigger2 = enemy, name = "YunTAG" || enemy, name = "Yun_mx"
value = 98
[State 0, Vs. Zangief]
type = VictoryQuote
trigger1 = enemy, name = "Zangief" || enemy, name = "cvszangief" || enemy, name = "cvszangief_normal" || enemy, name = "cvszangief_ex"
trigger2 = enemy, name = "ZangiefTAG"
value = 99

[State 180, 1]
type = ChangeState
trigger1 = Time = 0
;value = ifelse(matchover,182,ifelse(!roundsexisted, 181, ifelse(random<500,182,181)))
value = ifelse(matchover,182,181)





[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 182, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S180, 0

[State 3000, Helper]
type = Helper
trigger1 = animelem = 4
helpertype = normal
name = "Rose"
ID = 196
stateno = 196
pos = 13,-118
postype = p1
size.xscale = 1
size.yscale = 1
sprpriority = 3
facing = 1



[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1




[Statedef 182]
type = S
ctrl = 0
anim = 182
velset = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 =  time = [0,300]
flag = RoundNotOver
persistent = 1

[State 0, Explod]
type = Explod
trigger1 = animelem = 1
anim = 183
pos = -400/camerazoom,-100/camerazoom
postype = p1
facing = 1
vfacing = 1
bindtime = 1
vel = 9/camerazoom,-2/camerazoom
accel = 0,.2/camerazoom
random = 0,0
removetime = 42
scale = 1,1
sprpriority = 5
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=2||animelem=7||animelem=11
value = S100,3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem=28
value = S180,2

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[Statedef 190]
type = S
ctrl = 0
value = 190
velset = 0,0

[State 190, 2]
type = ChangeState
trigger1 = Time = 0
value = 191





[Statedef 191]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 195, DIALOGUE]
type = helper
trigger1 = ((time = 10 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns) && gametime
helpertype = normal
stateno = 9200
ID = 9200
postype = p1
pos = 0, 0
size.xscale = 1
size.yscale = 1
ownpal = 0
persistent = 0
ignorehitpause = 1

[State 191, 1]
type = ChangeAnim
trigger1 = RoundState = 0
value = 190

[State 191, Velocity]
type = VelSet
trigger1 = (AnimElemTime(10) = 0) || (AnimElemTime(12) = 0) || (AnimElemTime(14) = 0) || (AnimElemTime(16) = 0)
y = Ifelse ((AnimElemTime(12) = 0) || (AnimElemTime(16) = 0), 0, -2)

[State 191, Gravity]
type = Veladd
trigger1 = Vel Y
y = .16

[State 191, Position]
type = PosSet
trigger1 = (AnimElemTime(12) = 0) || (AnimElemTime(16) = 0)
y = 0

[State 191, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro
flag2 = nobardisplay
[State 191, Cloth]
type = Explod
trigger1 = RoundState = 0
anim = 191
pos = 0, 0
sprpriority = 2
postype = p1
bindtime = -1
ID = 191
persistent = 0

[State 191, Cloth]
type = RemoveExplod
trigger1 = RoundState = 1
ID = 191

[State 191, Cloth]
type = Explod
trigger1 = RoundState = 1
anim = 192
pos = 0, 0
sprpriority = 2
postype = p1
bindtime = -1
ID = 192
persistent = 0

[State 191, Cloth]
type = Explod
trigger1 = AnimElemTime(6) = 0
Anim = 193
sprpriority = 2
pos = -28, -131
postype = p1
vel = -3, -1
accel = 0, .45
bindtime = 1

[State 191, Cloth]
type = RemoveExplod
trigger1 = AnimTime = 0
ID = 193

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S190,0
channel = 0

[State 191, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0




[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S
facep2 = 1
sprpriority = 2

[State 3000, Helper]
type = Helper
triggerall = !numhelper(196)
trigger1 = animelem = 4
helpertype = normal
name = "Rose"
ID = 196
stateno = 196
pos = 13,-118
postype = p1
size.xscale = 1
size.yscale = 1
sprpriority = 3
facing = 1


[State 195, 1]
type = playsnd
trigger1 = animelem = 4
value = 1,1

[State 195, 1]
type = CtrlSet
trigger1 = Time = 40
value = 1

[State 195, 1]
type = CtrlSet
trigger1 = Time = 40
value = 1

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



[Statedef 5000]
type = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5000, 3]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype)

[State 5000, 4]
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5]
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5001

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140



[Statedef 5001]
type = S
movetype= H
physics = S

[State 5001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5001, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5005 + GetHitVar(animtype) + (GetHitVar(groundtype)=2)*10

[State 5001, 3]
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5001, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5001, 6]
type = ChangeState
trigger1 = HitOver
value = 0
ctrl = 1



[Statedef 5010]
type = C
movetype= H
physics = N
velset = 0,0

[State 5010, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = 5020 + GetHitVar(animtype)

[State 5010, 2]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5010, 3]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype)

[State 5010, 4]
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5010, 5]
type = StateTypeSet
triggerall = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5010, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5011

[State 5010, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5010, FFB Light]
type = ForceFeedback
trigger1 = anim = 5020
persistent = 0
time = 6
waveform = square

[State 5010, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5021
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5010, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5022
persistent = 0
time = 15
waveform = sinesquare
ampl = 140



[Statedef 5011]
type = C
movetype= H
physics = C

[State 5011, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5011, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5025 + GetHitVar(animtype)

[State 5011, 3]
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5011, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5011, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5011, 6]
type = ChangeState
trigger1 = HitOver
value = 11
ctrl = 1




[Statedef 5020]
type = A
movetype= H
physics = N
velset = 0,0

[State 5020, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(airtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5020, 2]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5020, 3]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype)

[State 5020, 4]
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5020, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5020, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5020, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5020, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
trigger4 = anim = [5051,5059]
persistent = 0
time = 15
waveform = sinesquare
ampl = 140



[Statedef 5030]
type = A
movetype= H
physics = N
ctrl = 0

[State 5030, 1]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5030, 3]
type = ChangeState
triggerall = !HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0
trigger2 = Pos Y >= 10
value = 5040

[State 5030, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0
trigger2 = Pos Y >= 10
value = 5050

[State 5030, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 5035



[Statedef 5035]
type = A
movetype= H
physics = N

[State 5035, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059]
trigger1 = Anim != 5090
value = 5035

[State 5035, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5035, 3]
type = ChangeState
triggerall = !HitFall
trigger1 = HitOver
trigger2 = AnimTime = 0
trigger3 = Vel Y > 0
trigger3 = Pos Y >= 10
trigger4 = Time = 0
trigger4 = Anim != 5035
value = 5040

[State 5035, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver
trigger2 = AnimTime = 0
trigger3 = Vel Y > 0
trigger3 = Pos Y >= 10
trigger4 = Time = 0
trigger4 = Anim != 5035
value = 5050



[Statedef 5040]
type = A
movetype= H
physics = N

[State 5040, 1]
type = ChangeState
trigger1 = !Alive
value = 5050

[State 5040, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim != 5040
trigger2 = Time = 0
trigger2 = Anim != 5035
value = 5040

[State 5040, 3]
type = CtrlSet
trigger1 = HitOver
value = 1

[State 5040, 4]
type = StateTypeSet
trigger1 = HitOver
movetype = I

[State 5040, 5]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5040, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52



[Statedef 5050]
type = A
movetype= H
physics = N

[State 5050, 1]
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim = 5035
trigger2 = Time = 0
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090
value = 5050

[State 5050, 2]
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, 3]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5050, 4]
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200

[State 5050, 5]
type = ChangeState
triggerall = Vel Y > -1
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5210

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 5100



[Statedef 5070]
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
value = 5071

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140



[Statedef 5071]
type = A
movetype= H
physics = N

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5071, 3]
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 15
type = ChangeState
value = 5110



[Statedef 5080]
type = L
movetype= H
physics = N
velset = 0,0

[State 5080, 1]
type = VarSet
trigger1 = time = 0
sysvar(2) = ifelse (GetHitVar(yvel) = 0, 5080, 5090)

[State 5080, 2]
type = VarAdd
trigger1 = time = 0
trigger1 = (anim = [5081,5089]) || (anim = [5111,5119])
trigger1 = SelfAnimExist(sysvar(2) + (anim % 10))
sysvar(2) = anim % 10

[State 5080, 3]
type = VarSet
trigger1 = time = 0
trigger1 = sysvar(2) = 5090
trigger1 = !SelfAnimExist(5090)
sysvar(2) = 5030

[State 5080, 3]
type = ChangeAnim
trigger1 = 1
value = sysvar(2)

[State 5080, 4]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0
value = 5081

[State 5080, 5]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) != 0
value = 5030



[Statedef 5081]
type = L
movetype= H
physics = C

[State 5081, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5081, 2]
type = VelSet
trigger1 = HitOver
x = 0

[State 5081, 3]
type = VarSet
trigger1 = Time = 0
sysvar(0) = 1

[State 5081, 4]
type = ChangeState
trigger1 = HitOver
value = 5110



[Statedef 5100]
type = L
movetype= H
physics = N

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1

[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var]
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 5100, 2]
type = ChangeAnim
triggerall = time = 0
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 5100, 3]
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5100, 6]
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110

[State 5100, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 5101

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20



[Statedef 5101]
type = L
movetype= H
physics = N

[State 5101, 1]
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160

[State 5101, 2]
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 3]
type = HitFallVel
trigger1 = Time = 0

[State 5101, 4]
type = PosSet
trigger1 = Time = 0
y = 20

[State 5101, 5]
type = VelAdd
trigger1 = 1
y = .4

[State 5101, 6]
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
type = ChangeState
value = 5110



[Statedef 5110]
type = L
movetype= H
physics = N

[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1]
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5110, 2]
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119]
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5110, 3]
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119]
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5110, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5110, Var]
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5110, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 5110, 7]
type = GameMakeAnim
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5110, 9]
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0)
value = 5110 + (anim % 10)

[State 5110, 10]
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0)
value = 5110

[State 5110, 11]
type = ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0)
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13]
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5110, 15]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine



[Statedef 5120]
type = L
movetype= I
physics = N

[State 5120, 1a]
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5111,5119]
trigger2 = !SelfAnimExist(5120 + (anim % 10))
value = 5120

[State 5120, 1b]
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5111,5119]
trigger1 = SelfAnimExist(5120 + (anim % 10))
value = 5120 + (anim % 10)

[State 5120, 2]
type = VelSet
trigger1 = Time = 0
x = 0

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5120, 4]
type = HitFallSet
trigger1 = AnimTime = 0
value = 1

[State 5120, 5]
type = NotHitBy
trigger1 = AnimTime = 0
value = , NT,ST,HT
time = 12

[State 5120, 6]
type = NotHitBy
trigger1 = AnimTime = 0
value2 = SCA
time = 3

[State 5120, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



[Statedef 5150]
type = L
movetype= H
physics = N
sprpriority = -3

[State 5150, 1]
type = ChangeAnim
triggerall = Time = 0
triggerall = SelfAnimExist(5140)
trigger1 = (anim != [5111,5119]) && (anim != [5171,5179])
trigger2 = !SelfAnimExist(5140 + (anim % 10))
value = 5140

[State 5150, 3]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (anim = [5111,5119]) || (anim = [5171,5179])
trigger1 = SelfAnimExist(5140 + (anim % 10))
value = 5140 + (anim % 10)

[State 5150, 4]
type = ChangeAnim
persistent = 0

trigger1 = MatchOver = 1
trigger1 = Anim = [5140,5149]
trigger1 = SelfAnimExist(anim+10)
value = anim+10

[State 5150, 5]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Anim != [5140,5159]
trigger1 = Anim != [5110,5119]
value = 5110

[State 5150, 6]
type = VelMul
trigger1 = 1
x = 0.85

[State 5150, 7]
type = VelSet
trigger1 = Vel x < .05
persistent = 0
x = 0

[State 5150, 8]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1



[Statedef 5200]
type = A
movetype= H
physics = N

[State 5200, 1]
type = ChangeAnim
trigger1 = Anim = 5035
trigger1 = AnimTime = 0
value = 5050

[State 5200, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5200, 3]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 10
value = 5201



[Statedef 5201]
type = A
movetype= H
physics = A
anim = 5200

[State 5201, 1]
type = Turn
trigger1 = Time = 0
trigger1 = p2dist X < -5
[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 6, 3
[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 100, 4
channel = 0

[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10
[State 5201, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-18 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 5201, 2]
type = VelSet
trigger1 = Time = 0
x = -.15
y = -3.5

[State 5201, 3]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5201, 4]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5201, 5]
type = PalFX
trigger1 = Time = 0
time = 3
add = 128,128,128

[State 5201, 6]
type = GameMakeAnim
trigger1 = Time = 1
value = 60
pos = 0, 0
under = 1



[Statedef 5210]
type = A
movetype= I
physics = N
anim = 5210
ctrl = 0

[State 5210, 1]
type = PalFX
trigger1 = Time = 0
time = 3
add = 128,128,128

[State 5210, 1]
type = PosFreeze
trigger1 = Time = 0
value = 4

[State 5210, 2]
type = Turn
trigger1 = Time = 0
trigger1 = p2dist X < -20

[State 5210, 1]
type = VelMul
trigger1 = Time = 4
x = .8
y = .8

[State 5210, 1]
type = VelAdd
trigger1 = Time = 4
y = -4.5

[State 5210, 1]
type = VelMul
trigger1 = Time = 4
trigger1 = Vel Y > 0
y = .5

[State 5210, 1]
type = VelAdd
trigger1 = Time = 4
trigger1 = Vel Y > -3
y = -2

[State 5210, 1]
type = VelAdd
trigger1 = Time = 4
trigger1 = Vel Y > -2
y = -1
[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 6, 3
[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 100, 1
channel = 0

[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10
[State 5201, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-18 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 5210, 2]
type = VelAdd
trigger1 = Time = 4
trigger1 = Command = "holdup"
y = -2

[State 5210, 2]
type = VelAdd
trigger1 = Time = 4
trigger1 = Command = "holddown"
y = 1.5

[State 5210, 2]
type = VelMul
trigger1 = Time = 4
trigger1 = Command = "holdfwd"
x = 1

[State 5210, 2]
type = VelAdd
trigger1 = Time = 4
trigger1 = Command = "holdback"
x = -1

[State 5210, 3]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 15

[State 5210, 4]
type = CtrlSet
trigger1 = Time = 20
value = 1

[State 5210, 5]
type = VelAdd
trigger1 = Time >= 4
y = .35

[State 5210, 5]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52
ctrl = 1



[Statedef 5500]
type = S
ctrl = 0
anim = 5300
velset = 0,0

[State 5500, 1]
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(5500)
value = 5500



[Statedef 5900]
type = S
[State 0, RemapPal]
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,palno

[State 5900, 1]
type = VarRangeSet
trigger1 = roundsexisted = 0
value = 0

[State 5900, 2]
type = VarRangeSet
trigger1 = roundsexisted = 0
fvalue = 0

[State 5900, 3]
type = ChangeState
trigger1 = !roundsexisted
value = 190





[Statedef -2]

;  --- Uno Tag System v3.0 STATEDEF -2 ---

[State -2, deactivate tag]
type = VarSet
triggerall = sysvar(4) > 0
triggerall = sysvar(4) != 6
trigger1 = roundstate > 2
trigger1 = Win || Lose
trigger2 = NumPartner
trigger2 = Roundstate < 1
trigger2 = teammode = Simul
trigger2 = !Partner, sysvar(4)
trigger2 = Time = [1,2]
trigger3 = Partner, sysvar(4)
trigger3 = !Life
sysvar(4) = 0

[State -2, def]
type = VarSet
triggerall = NumPartner
triggerall = Partner, StateNo != [1251110,1251114]
trigger1 = sysvar(4) = 10
trigger2 = sysvar(4) != 2 && PrevStateNo = 1251131
sysvar(4) = 15

[State -2, Uno]
type = null ;ParentVarSet
trigger1 = PrevStateNo = 1251106
sysvar(4) = 7

[State -2, Eksena]
type = ScreenBound
trigger1 = NumPartner && Partner, sysvar(4) = 4
trigger1 = StateNo = 1251131 || prevStateNo = 1251131
value = 1
movecamera = 1,1

[State -2, no_throw]
type = NotHitBy
trigger1 = NumPartner
trigger1 = sysvar(4) = [8,9]
trigger1 = StateNo != 1251112
value = , AT

[State -2, def]
type = VarSet
triggerall = NumPartner && sysvar(4) != 15
triggerall = Partner, Time = [0,1]
trigger1 = Partner, StateNo = 1251104
trigger2 = Partner, StateNo = 1251110
trigger2 = StateNo != [1251101,1251133]
sysvar(4) = 1

[State -2, GTG]
type = ChangeState
trigger1 = NumPartner
trigger1 = Life && Partner, Life
trigger1 = PrevStateNo = 1251126
trigger1 = StateNo != 1251111
value = 1251111
ignorehitpause = 1

[State -2, Oh No!]
type = SelfState
triggerall = sysvar(4) != [8,9]
triggerall = sysvar(4) != [12,15]
trigger1 = prevStateNo = 1251112
trigger1 = !(StateNo = [1251101,1251133])
value = 1251112
ctrl = 0

[State -2, PowerReset]
type = poweradd
trigger1 = sysvar(4) = 5
trigger1 = RoundNo < 2
trigger1 = RoundState < 2
trigger1 = Time = 0
value = -Power
persistent = 0

[State -2, PowerAdd]
type = poweradd
trigger1 = sysvar(4) = 5 && power < 900
trigger1 = RoundNo < 2
trigger1 = RoundState < 2
trigger1 = Time = 1
value = 1000
persistent = 0

;[State -2, prior]
;type = SprPriority
;trigger1 = NumPartner && Partner, sysvar(4) = 2
;trigger2 = (sysvar(4) = [8,9]) && StateNo != [1251110,1251111]
;value = 5

[State -2, err]
type = ChangeState
trigger1 = NumPartner && ID > Partner, ID
trigger1 = roundstate = 2 && sysvar(4)
trigger1 = StateNo = 0 && pos Y < 0
value = 1251112

; Tag active ctrl
[State -2, ctrl]
type = SelfState
trigger1 = TeamMode = Simul
trigger1 = NumPartner
trigger1 = Partner, sysvar(4)
trigger1 = !sysvar(4)
trigger1 = sysvar(4) != 8 && Partner,sysvar(4) != 8 && Partner,sysvar(4) != 12
trigger1 = StateNo != 5900
trigger1 = Partner, sysvar(4) != [2,15]
trigger1 = RoundState = 2
trigger1 = Life && Partner, Life
trigger1 = StateNo != [1000,1251199]
value = 1251112
ctrl = 0

[State -2, 1]
type = SelfState
value = 1251106
trigger1 = NumPartner
trigger1 = StateNo != 1251106 && Partner, StateNo = [1251128,1251129]

[State -2, 1]
type = SelfState
value = 1251131
triggerall = NumPartner && Partner, Time = [0,1]
triggerall = (StateNo = 1251112 || StateNo = 1251114) && MoveType != A
trigger1 = Partner, StateNo = 1251132 || Partner, prevStateNo = 1251132
trigger2 = Partner, StateNo = 1251127 && !NumHelper(1251101)

[State -2, cancelfx]
type = PalFx
triggerall = RoundState = 2
triggerall = Time = [0,1]
trigger1 = StateNo = 1251123
trigger2 = StateNo = 1251125 && NumTarget
Time = 6
add = (110 + Time*15), (110 + Time*15), (190 + Time*15)
sinadd =-245, -245, -250, (40 + Time*5)

[State -2, TargetVelAdd]
type = TargetVelAdd
trigger1 = NumTarget && numPartner
trigger1 = !(Target, StateNo = [1251117,1251119]) && !(Target, PrevStateNo = [1251117,1251119])
trigger1 = Roundstate = 2
trigger1 = prevStateNo = 1251126
trigger1 = Partner, StateNo = 1251102 && !(Partner, MoveContact)
trigger1 = Target, statetype != A && Target, GetHitVar(xvel) < 0
x = 0.12

[State -2, drop]
type = TargetDrop
triggerall = NumTarget
triggerall = Time = [0,1]
trigger1 = !Life
trigger2 = StateNo = [1251101,1251105]
trigger3 = StateNo = [1251115,1251116]  
trigger4 = StateNo = 1251106 || StateNo = 1251123

[State -2, Buwelo]
type = PosFreeze
trigger1 = PrevStateNo = 1251102 && StateNo != 1251123
trigger1 = sysvar(4) = 15
trigger1 = Anim != [42,45]
trigger1 = Time <= 5
trigger1 = NumTarget && Target, Statetype != A
trigger1 = MoveType = A

[State -2, aircombo]
type = VelMul
trigger1 = NumTarget || p2BodyDist x < 0
trigger1 = PrevStateNo = 1251102
trigger1 = StateNo != [1251100, 1251190]
trigger1 = MoveType = A && StateNo < 1000
x = ifelse(p2BodyDist x < 0,0.7,0.9)
y = ifelse(vel y < 2,2,0.9)

[State -2, velfollow]
type = VelAdd
trigger1 = PrevStateNo = 1251123 && (NumTarget && Target, vel y < -0.6)
trigger1 = MoveType = A && (Time = [0,3])
y = -1.2

[State -2, Target]
type = TargetState
trigger1 = NumTarget
trigger1 = StateNo = 1251102 || PrevStateNo = 1251102 || StateNo = 1251123 || PrevStateNo = 1251123 || StateNo = 1251126 || PrevStateNo = 1251126
trigger1 = (Target, Pos Y < 0) && !(Target, StateNo = [120,152]) && (Target, StateNo != [1251109,1251119]) && MoveContact  && (Target, Anim = [5100,5170])  && (Target, Anim != [5110,5120])  && Target, PrevStateNo != 1251119 
trigger1 = (Target, Statetype != A) ; && (Target, Statetype != S)  && (Target, Statetype != C)
trigger1 = !Target, HitOver
value = 1251119
ignorehitpause = 1

[State -2, Ov]
type = TargetState
triggerall = NumTarget && numPartner
triggerall = !(Target, StateNo = [120,152]) && !(Target, Anim = [120,152]) && Partner, StateNo = [1251101,1251133]
triggerall = Time = [0,2]
trigger1 = StateNo = 1251125 && Target, StateType != A
trigger2 = (StateNo = 1251126 || PrevStateNo = 1251126) && Target, Pos Y >= -10 && (Target, StateNo != [1251109,1251119]) && (Target, StateNo != [5000,5500])
value = 1251117
ignorehitpause = 1

[State -2, Ov2]
type = TargetState
triggerall = NumTarget = 1
trigger1 = (Target, StateNo != [1251109,1251119]) && !(Target, StateNo = [120,152]) && !(Target, Anim = [120,152]) && ((Target, StateNo != [5000,5500]) || (Target, PrevStateNo != 1251119 && Target, StateNo = [5030,5100])) && !Target, HitOver
trigger1 = (StateNo = 1251125 && Time = [0,2]) || StateNo = 1251126 || PrevStateNo = 1251126
value = 1251119
ignorehitpause = 1

[State -2, T_T]
type = TargetVelSet
triggerall = NumTarget = 1 && Target, Movetype = H && Target, vel x != 0
trigger1 = StateNo = 1251126 || sysvar(4) = 3
x = ifelse((Target, vel x > 0),0.55,-0.55)

[State -2, UM]
type = SelfState
trigger1 = Numpartner && Partner, StateNo = 1251106
trigger1 = StateNo = [1000,4500]
value = 1251129

; ------ Uno Tag System v3.0 END LINE ------

;


[State -2, Hit Detection]
type = varset
trigger1 = movecontact = 1 && var(30) < 0
var(30) = hitpausetime
ignorehitpause = 1
[State -2, Spark Level]
type=helper
triggerall= movecontact=1 && var(30)=hitpausetime

trigger1 = movehit = 1 && numenemy
trigger1 = var(10) = 8010 || var(10) = 8011 || var(10) = 8012 || var(10) = 8013 || var(10) = 8014
trigger2 = moveguarded = 1 && numenemy
trigger2 = var(17) = 8000 || var(17) = 8001
helpertype=normal
stateno=ifelse(moveguarded, var(17), var(10))
ID=8000
name="Spark"
postype=p1
pos= ifelse(p2dist x<0, 0, ifelse(p2dist x<var(12), ceil((p2dist x)+2), var(12))), var(13)
facing= -1
size.xscale = 1
size.yscale = 1
ownpal=1
pausemovetime=65535
supermovetime=65535
ignorehitpause=1

[State -2, Hit Detection]
type=varrangeset
trigger1= movetype=I
trigger2= movetype=H && time
first=10
last=15
value=-1
ignorehitpause=1

[State -2, Hit Detection]
type=varset
trigger1= 1
var(30)=-1

[State -2, Custom Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
trigger4 = (stateno = [3000, 4999])
var(20) = 0
ignorehitpause = 1
[State -2, Custom Combo Time]
type = varadd
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State -2, Custom Combo Asserts]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignorehitpause = 1
[State -2, Custom Combo PalFX]
type = palfx
trigger1 = var(20) = [1, 60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignorehitpause = 1



[State -2, VarSet]
type = VarSet
trigger1 = (!WinKO) && (Var(23) != 0)
v = 23
value = 0
ignorehitpause = 1

[State -2, VarAdd]
type = VarAdd
trigger1 = (Win) && (Var(23) < 2)
v = 23
value = 1
ignorehitpause = 1

[State -2, Pause]
type = pause
trigger1 =(WinKO) && (Var(23) = 1)
time = 10
ignorehitpause	= 1

[State -2, Helper]
type = Helper
triggerall = (WinKO)
trigger1 = (Var(23) = 1) && (HitDefAttr = S, HA) && (NumHelper(8600) = 0)
trigger2 = (Var(23) = 1) && (HitDefAttr = A, HA) && (NumHelper(8600) = 0)
trigger3 = (Var(23) = 1) && (HitDefAttr = C, HA) && (NumHelper(8600) = 0)
trigger4 = (Var(23) = 1) && (HitDefAttr = S, HT) && (NumHelper(8600) = 0)
trigger5 = (Var(23) = 1) && (HitDefAttr = A, HT) && (NumHelper(8600) = 0)
trigger6 = (Var(23) = 1) && (HitDefAttr = C, HT) && (NumHelper(8600) = 0)
trigger7 = (Var(23) = 1) && stateno = 3001 && (NumHelper(8600) = 0)
helpertype = Normal
name = "SuperKO"
id = 8600
pos = 0,0
postype	= left
facing = 0
stateno = 8600
keyctrl = 0
ownpal = 1
supermovetime = 0
pausemovetime = 40
ignorehitpause = 1


[State -2, Hitcount]
type=varadd
trigger1= movehit=1
trigger1= !(hitdefattr=SCA,AT)
var(13)=1

[State -2, Hitcount Reset]
type=varset
trigger1= numenemy && var(4)
trigger1= (enemynear,movetype!=H) && (enemynear,stateno!=5300)
var(4)=0
ignorehitpause=1


[State -2, Damage based on hits]
type=varset
trigger1 = (stateno=[200,2999])
trigger1= numenemy
fvar(12)= ifelse(enemynear,gethitvar(hitcount)<2, 24, ifelse(enemynear,gethitvar(hitcount)>=23, 2, 20-enemynear,gethitvar(hitcount))) / 24.0
ignorehitpause=1

[State -2, Reset var when the opponent recovers]
type=varset
trigger1= numenemy
trigger1= (enemynear,movetype!=H)
trigger2= !numenemy
fvar(12)=1

[State -2, Dampener itself]
type=attackmulset
trigger1= 1
value=fvar(12)
ignorehitpause=1


[State -2, Dampener]
type=varset
trigger1= 1
fvar(10)= ifelse(var(4)<6, 24, ifelse(var(4)>=23, 1, 29-var(4))) / 24.0
ignorehitpause=1

[State -2, Dampener - Supers]
type=varset
trigger1= (stateno=[3000,4999])
fvar(10)= ifelse(var(6), .6, ifelse(var(5), .8, 1.0))
ignorehitpause=1

[State -2, Dampener Limit]
type=varset
trigger1= fvar(10)<0
fvar(10)=0
ignorehitpause=1

[State -2, Root Dampener]
type=varset
trigger1= 1
fvar(11)= fvar(10) * 1
ignorehitpause=1


[State -3, Special-Super Cancel Reset]
type=varset
trigger1= 1
var(35)=0
ignorehitpause=1

[State -3, Special-Super Cancel Check]
type=varset
trigger1 = (stateno = [200,299]) || (stateno = [400,499])
trigger1 = movecontact
trigger2 = (stateno = [1000,2999])
trigger2 = movecontact
var(35)=1
ignorehitpause=1


[State -3, Super-Super Cancel Reset]
type=varset
trigger1= 1
var(36)=0
ignorehitpause=1

[State -3, Super-Super Cancel Reset]
type=varset
trigger1 = (stateno = [3000,3999])
trigger1 = stateno != [4000,4999]
trigger1 = movecontact
var(36)=1
ignorehitpause=1

[State -2, Debug]
type = DisplayToClipBoard
trigger1 = 1
text = "P2BodyDist X: %d | P2BodyDist Y: %d | Pos X: %d | Pos Y: %d \n"
params	= floor(P2BodyDist X),ceil(P2BodyDist Y),ceil(Pos X),ceil(Pos Y)
ignorehitpause = 1



[State -2, counterFX]
type=helper
trigger1= movehit && numtarget && hitdefattr=SCA,AA
trigger1= !numhelper(7400) && var(29)
trigger1= (target,movetype=H) && !(target,time)
helpertype=normal
stateno=8290
ID=8290
name="Counter"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(12), ceil(P2Dist x), var(12))) * const(size.xScale)), ceil(var(13) * const(size.yScale))
ignorehitpause=1

[State -2, countervar]
type=varset
trigger1= 1
var(29)=ifelse((p2movetype=A),1,0)

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy Mr.Ansatsuken - http://www.ansatsukenmugen.webs.com"
ignorehitpause = 1






[Statedef -3]

;  --- Uno Tag System v3.0 STATEDEF -3 ---


; Tag active definer
[State -2, def]
type = VarSet
triggerall = NumPartner
trigger1 = sysvar(4) = [8,9]
trigger1 = !(Partner, Life) || (Partner, StateNo = [1251110,1251114])
trigger2 = Partner, StateNo = [1251110,1251114]
trigger2 = sysvar(4) != [2,15] 
trigger3 = sysvar(4) = 5
trigger3 = Roundstate = 2 && StateNo = [1251111,1251114]
trigger4 = sysvar(4) = 14
trigger4 = MoveType = H && Partner, StateNo = [1251101,1251133]
trigger5 = sysvar(4) = 15 && NumEnemy
trigger5 = EnemyNear, StateNo = [0,50]
trigger6 = sysvar(4) = 15 && StateNo != [1251101,1251133]
trigger6 = NumTarget = 0 && Partner, NumTarget = 0
sysvar(4) = 1

[State -2, def_Partner]
type = VarSet
trigger1 = teammode = simul
trigger1 = roundstate < 1
sysvar(4) = 1 + ((ID > Partner, ID)*4)

[State -3, enterTheScreen]
type = ChangeState
trigger1 = sysvar(4)
trigger1 = NumPartner
trigger1 = StateNo = [1251112,1251114]	
trigger1 = Life 
trigger1 = (Partner, StateNo = [1251109,1251111]) || (Partner, StateNo = 1251125 && Partner, Time > 0)
trigger1 = Partner, StateNo != 1251110	; for type-r only
value = ifelse((Partner, StateNo = 1251125),1251131,1251101)

; Jump into the screen (Change Attack)
[State -3, enterTheScreen]
type = ChangeState
triggerall = sysvar(4)
triggerall = NumPartner
trigger1 = StateNo = 1251112
trigger1 = ((Partner, StateNo = 1251126 && Partner, Time > 0) || Partner, PrevStateNo = 1251126)
trigger1 = Life
value = 1251102

; Jump into the screen (Game is OVER)
[State -3, enterTheScreen]
type = ChangeState
triggerall = sysvar(4)
triggerall = NumPartner
trigger1 = Alive
trigger1 = StateNo = [1251112,1251114]
trigger1 = Time > 0
trigger1 = roundstate > 2
trigger1 = Win || LoseTime || WinTime || drawgame
value = 1251120

[State -3, NoJC]
type = AssertSpecial
triggerall = NumPartner
trigger1 = Partner, sysvar(4) = [12,13]
trigger2 = sysvar(4) = [8,9]
trigger3 = PrevStateNo = [1251112,1251133]
trigger4 = sysvar(4) = 15 && Partner, Time < 150
flag = nojugglecheck
ignorehitpause = 1

[State -3, RemoveExplod]
type = RemoveExplod
trigger1 = StateNo = [1251110,1251113]
trigger2 = !Life
trigger3 = StateNo = [1251126,1251127]

[State -3, Quiet]
type = AssertSpecial
trigger1 = NumPartner
trigger1 = Partner, sysvar(4) = 7
trigger1 = !Alive && !NumHelper(1251130)
flag = nokosnd

[State -3, Dark]
type = AssertSpecial
triggerall = numpartner
trigger1 = StateNo = 1251106
trigger2 = StateNo = 1251127 || Partner, StateNo = 1251127
trigger3 = NumHelper(1251101) && StateNo = 1251131 && Partner, StateNo != 1251125
flag = noBG
flag2 = noFG
flag3 = Timerfreeze
ignorehitpause = 1

[State -3, leavefx]
type = PalFx
trigger1 = StateNo = 1251111
trigger2 = StateNo = 1251127
trigger3 = (sysvar(4) = [8,9]) && StateNo = 1251110 && Time > 12
trigger4 = StateNo = 1251110 && Time > 14
Time = 2
add = 0,0,0
mul = 150,150,150

[State -3, InvBG]
type = BgPalFx
trigger1 = NumHelper(1251130)
trigger2 = StateNo = 1251106
Time = 2
color = 0
invertall = 1
add = -16 -ceil(cos(gameTime / 60.0 * pi) * 16), -16 -ceil(cos(gameTime / 60.0 * pi) * 16), -16 -ceil(cos(gameTime / 60.0 * pi) * 16)
ignorehitpause = 1

[State -3, InvChar]
type = PalFx
triggerall = NumEnemy
trigger1 = (Enemy, PrevStateNo = [1251128,1251129]) || (EnemyNear, PrevStateNo = [1251128,1251129])
trigger2 = Enemy, StateNo = 1251106 || EnemyNear, StateNo = 1251106
Time = 2
color = 0
add = -16 -ceil(cos(gameTime / 60.0 * pi) * 16), -16 -ceil(cos(gameTime / 60.0 * pi) * 16), -16 -ceil(cos(gameTime / 60.0 * pi) * 16)
ignorehitpause = 1

[State -3, Invert]
type = PalFx
trigger1 = PrevStateNo = [1251128,1251129]
Time = 10
invertall = 1
mul = 150, 150, 150

[State -3, SuperPause]
type = SuperPause
triggerall = NumPartner
trigger1 = Partner, StateNo = 1251106
trigger1 = NumHelper(1251130)
trigger2 = NumHelper(1251101) && Partner, StateNo != 1251125
trigger2 = MoveType != H
Time = 10
anim = -1
sound = -1
moveTime = 10
darken = 1
p2defmul = 0
unhittable = 1
pausebg = 1

[State -3, NoAirGuard]
type = AssertSpecial
trigger1 = NumPartner
trigger1 = sysvar(4) = 8
trigger1 = Movetype = A
trigger1 = prevStateNo = 1251133
flag = Noairguard
flag2 = nojugglecheck
flag3 = nowalk
ignorehitpause = 1

[State -3, aHit]
Type = VarSet
Triggerall = sysvar(4) = 8 && Roundstate = 2
triggerall = NumPartner && Partner, Alive
trigger1 = Movetype = H || StateNo >= 5000
sysvar(4) = 9

[State -3, bangon]
type = SelfState
trigger1 = NumPartner && sysvar(4) = 9
trigger1 = Alive && Partner, Alive
trigger1 = StateNo = 5110 || Anim = 5110
trigger1 = Time >= 12
value =5120

[State -3, leavePA]
type = SelfState
triggerall = sysvar(4) = [8,9]
triggerall = StateType != A || prevStateNo = [5000,5500]
triggerall = NumPartner
trigger1 = Roundstate = 2
trigger1 = Life && Partner, life
trigger1 = Partner, StateNo != [1251101,1251135]
trigger1 = StateNo != [200,1251199]
trigger1 = MoveType != H || (StateNo = 5120 && AnimElemTime(4) >= 1)
value = ifelse((sysvar(4)=9),1251111,1251110)
ctrl = 0

[State -3, LE]
type = SelfState
trigger1 = StateNo = 7828
trigger1 = PrevStateNo = [1251110,1251114] 
trigger2 = sysvar(4) = [8,9]
trigger2 = Anim = 100 && StateNo != [1251101,1251133]
trigger3 = sysvar(4) = 5
trigger3 = PrevStateNo = [1251110,1251114] 
trigger3 = StateNo != [1251101,1251133]
value = 1251111

[State -3, leaveIntro]
type = SelfState
triggerall = sysvar(4) = 5
triggerall = NumPartner
trigger1 = Roundstate >= 2
trigger1 = StateNo != [1000,1251199]
value = 1251110
ctrl = 0

[State -3, fromdark]
type = Helper
trigger1 = sysvar(4) = 7 && !NumHelper(1251139)
trigger1 = PrevStateNo = 1251106
trigger1 = Time <= 25
Helpertype = Normal
ID = 1251139
StateNo = 1251130
name = "dark"
ownpal = 1
supermoveTime = 9999
pausemoveTime = 9999

[State -3, sb_PA]
type = ScreenBound
trigger1 = NumPartner
trigger1 = sysvar(4) = [8,9]
value = ifelse(MoveType = A,1,0)
movecamera = 0,0

[State -3, NoCtrl]
type = CtrlSet
trigger1 = NumPartner
trigger1 = StateNo != [1251111,1251112]
trigger1 = sysvar(4) = [8,9]
value = ifelse((Partner, Alive),0, 1)

[State -3, Party]
type = CtrlSet
triggerall = NumPartner
triggerall = Partner, StateNo != [1251110,1251114]
trigger1 = Partner, sysvar(4) = 2
trigger1 = Movetype != A
trigger1 = StateNo != [5000,5500]
trigger1 = Partner, StateNo != [5000,5500]
trigger1 = prevStateNo != [5000,5500]
value = ifelse((prevStateNo = [1251132,1251131]) || (Partner, StateNo = 1251125) ||(Partner, movetype = A), 0, 1)

[State -3, Party]
type = AssertSpecial
triggerall = NumPartner
triggerall = Partner, StateNo != [1251110,1251114]
trigger1 = Partner, sysvar(4) = 2
trigger1 = Movetype != A
trigger1 = StateNo != [5000,5500]
trigger1 = Partner, StateNo != [5000,5500]
trigger1 = prevStateNo != [5000,5500]
flag = nowalk
flag2 = nojugglecheck

[State -3, PartyDone]
type = CtrlSet
triggerall = NumPartner
triggerall = !Ctrl
triggerall = Partner, sysvar(4) = 2
triggerall = Movetype = I
triggerall = StateNo != [200,5500]
trigger1 = prevStateNo = [5000,5500]
trigger2 = Partner, StateNo = 1251111
trigger3 = Partner, MoveType = H && !Partner, HitShakeOver
value = 1

[State -3, fadeOut]
type = Trans
triggerall = NumPartner
trigger1 = !Life && Partner, Life
;trigger1 = RoundState = 2 || Partner,sysvar(4) = 7
trigger1 = Partner,sysvar(4) = 7
trigger1 = StateNo = 5150
Trans = addalpha
alpha = (256-ifelse((Partner,sysvar(4) = 7),(Time *3),(Time*2))), (Time*Time)

[State -3, fadeOut]
type=assertspecial
triggerall = alive=0 && !ishelper && numpartner && Partner, sysvar(4)
trigger1=stateno=5150 && (((time=[80,150])&&(time%10<5))||(time>150))
trigger1=(partner,stateno!=stateno)||((partner,stateno=stateno)&&(partner,time<time))
flag=invisible
flag2=noshadow

[state -3, fadeOut]
type=posset
trigger1 = sysvar(4)
trigger1=stateno=5150 && alive=0 && !ishelper && numpartner && (time>150)
trigger1=(partner,stateno!=stateno)||((partner,stateno=stateno)&&(partner,time<time))
trigger1 = Partner, sysvar(4)
y=-3

[state -3, dead_Var]
type = VarSet
triggerall = !Alive
triggerall = RoundState = 2
triggerall = StateNo = [5131,5150]
triggerall = NumPartner && Partner, sysvar(4)
trigger1 = Time >= 125
trigger2 = Partner, sysvar(4) = 7
trigger2 = Time >= 85
sysvar(4) = 6

[state -3, awake_Var]
type = VarSet
triggerall = NumPartner && roundstate = 2
trigger1 = Alive
trigger1 = sysvar(4) = 6
trigger2 = Partner, Life
trigger2 = sysvar(4) = 7
sysvar(4) = 1

[state -3, offME]
type = NotHitBy
triggerall = NumPartner
trigger1 = sysvar(4) = 6
trigger2 = StateNo = 1251128 || PrevStateNo = 1251128
trigger3 = Partner, sysvar(4) = 6
trigger3 = (StateNo = [1251101,1251116]) || (StateNo = [1251120,1251133])
value = SCA

[state -3, disa2]
type = SelfState
trigger1 = RoundState = 2
trigger1 = StateNo = [5110,5150]
trigger1 = sysvar(4) = 6
value = 1251113

[state -3, Ghost]
type = AssertSpecial
triggerall = !Alive
triggerall = RoundState >= 2
triggerall = sysvar(4) = 6
trigger1 = Anim = [5000,5600]
trigger2 = PrevStateNo = [1251113,1251121]
flag = invisible
flag2 = noshadow
ignorehitpause = 1

[State -3, EndLife]
type = LifeAdd
triggerall = RoundState = 2
trigger1 = PrevStateNo = 1251129
trigger2 = sysvar(4) = 6
value = -LifeMax

[State -3, END]
type = PosSet
trigger1 = NumPartner
trigger1 = roundstate > 2
trigger1 = !Alive
trigger1 = PrevStateNo = 1251113
x = (Partner, pos x) - 5000*facing
y = 0

[State -3, 1251129]
type = LifeAdd
trigger1 = PrevStateNo = 1251129 && Time > 1
value = -LifeMax

[State -3, 1251129]
type = SelfState
trigger1 = StateNo < 5000
trigger1 = PrevStateNo = 1251129 && AnimElemNo(3) = 7
value = 5150

[State -3, Aura]
type=Helper
triggerall= !NumHelper(1251124)
trigger1 = sysvar(4) = 7 && MoveType = I && (StateNo = 1251106 || Life <= (LifeMax*.2))
Helpertype=normal
StateNo=1251124
ID=1251124
name="AURA"
postype=p1
ownpal = 1
pausemoveTime=99999
supermoveTime=99999

; ----------- UNO MODE -----------
[State -3, Cursed]
type = LifeAdd
trigger1 = NumPartner && RoundState = 2
trigger1 = StateNo != 1251106 && !(Partner, Life)
trigger1 = (gameTime%10) = 0
trigger1 = sysvar(4) = 7
value = (-3 + ifelse(Life < LifeMax/6, 2, 0))
kill = 0

[State -3, C_2]
type = PowerAdd
trigger1 = NumPartner && RoundState = 2
trigger1 = StateNo != 1251106 && !(Partner, Life)
trigger1 = sysvar(4) = 7
trigger1 = Power < PowerMax && MoveType != A
value = 100

[State -2, C_3]
type = AttackMulSet
trigger1 = RoundState = 2
trigger1 = sysvar(4) = 7 && StateNo = [200,4000]
value = 1.5 ;+ ((LifeMax/Life) * 0.015)

[State -3, C_4]
type = DefenceMulSet
trigger1 = RoundState = 2
trigger1 = sysvar(4) = 7 && !(Partner, Life)
value = ifelse((Life>150),(0.2 - ((LifeMax/Life) * 0.015)),0.15)

[State -2, C_5]
type = AssertSpecial
trigger1 = RoundState = 2
trigger1 = sysvar(4) = 7 && MoveType = A
flag = nojugglecheck
ignorehitpause = 1

[State -3, C_7]	; TimeOVER!
type = LifeAdd
trigger1 = NumPartner && RoundState > 2 && StateNo != 1251106 && !(Partner, Life) && sysvar(4) = 7 && !Win
value = -(Life)
kill = 1

[State -3, C_8]
type = SelfState
trigger1 = NumPartner && RoundState>=3 && Life > 1 && !(Partner, Life) && sysvar(4) = 7 && MoveType=H
value = ifelse(StateNo=5110,5120,5040)

[State -3, C_e1]
type = PalFx
trigger1 = StateNo != 1251106
trigger1 = RoundState = 2
trigger1 = !Win && !Lose && !MatchOver && !DrawGame
trigger1 = !NumHelper(1251107)
trigger1 = sysvar(4) = 7
add=(50+Random*0.15),(50+Random*0.12),(50+Random*0.12)
mul = (120+Random*0.12511), (120+Random*0.12511), (120+Random*0.12511)
sinadd=-255,-245,-245,(40 + Time*2)
Time=10

[State -3, C_e2]
type = AfterImage
triggerall = RoundState <= 2
triggerall = !Win && !Lose && !MatchOver && !DrawGame
triggerall = sysvar(4) = 7  && MoveType = A
trigger1 = PrevStateNo = 5300 || PrevStateNo = 4600
trigger2 = (gameTime%10) = 0
Trans = add
PalContrast = 256,0,0
PalBright = 50,0,0
Time =  -1
length = 17
TimeGap = 1
FrameGap = 1

[State -3, C_e3]
type = AfterImageTime
trigger1 = RoundState > 2
trigger1 = sysvar(4) = 7
trigger2 = !Alive
trigger3 = NumPartner && Partner, Alive
trigger4 = sysvar(4) = 7 && MoveType != A
Time = 0

[State -3, C_KOed]
type = SelfState
triggerall = sysvar(4) = 7
trigger1 = !Life
trigger1 = StateType != A
trigger1 = StateNo != [5000,5950]
value = 5950
; ----------------------

[State -3, T_T]
type = ScreenBound
trigger1 = roundstate > 2
trigger1 = !Alive
trigger1 = PrevStateNo = 1251113
;trigger2= EnemyNear, NumHelper(1251107) || Enemy, NumHelper(1251107)
value = 0
movecamera = 0,0

[State -3, T_T]
type = PosFreeze
trigger1 = NumEnemy && EnemyNear, NumHelper(1251107) || Enemy, NumHelper(1251107)
trigger2 = PrevStateNo = 1251121
trigger3 = StateNo = 1251125

[State -3, T_T]
type = SelfState
triggerall = NumPartner && sysvar(4) > 0
trigger1 = RoundState = 2  && Pos Y < 0
trigger1 = StateNo = 0 && (Partner, StateNo != [1251112,1251114])
trigger1 = PrevStateNo = [1251112,1251114]
value = 1251112

[State -3, wait out]
type = ChangeState
triggerall = NumPartner
triggerall = RoundState = 2
triggerall = Life && Partner, Life
triggerall = StateNo != [1251110,1251114]
trigger1 = sysvar(4) = 2				; performed team attack
trigger1 = (PrevStateNo = [5000,5500]) || (StateNo != [200,1251199]) && (MoveType != H)
trigger2 = sysvar(4) = 4         		; performed Delayed Cancel
trigger2 = MoveType = I || ((Partner, prevStateNo = 1251131 || Partner, StateNo != [1251101,1251135]) && Time > 1)
trigger3 = sysvar(4) = 3          	; performed Cross Attack
trigger3 = (StateNo = 1251126 && Time > 1) && (Partner, StateNo = 1251102 && Partner, BackEdgeBodyDist > 15)
trigger4 = (sysvar(4) = [2,4]) && MoveType = I && (StateNo != [1251101,1251133])
trigger5 = NumHelper(1251125)
trigger5 = StateNo = [0,199]
value = 1251111
ctrl = 0
ignorehitpause = 1

; ---- Uno Tag System v3.0 END LINE ----

;  ;]




[State -3, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -3, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = movecontact
var(1) = 1



[State -3, Combo condition Reset]
type = VarSet
trigger1 = 1
var(2) = 0

[State -3, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [1000,2999])
trigger2 = movecontact
trigger2 = stateno != 1256
var(2) = 1



[State -3, Combo condition Reset]
type = VarSet
trigger1 = 1
var(3) = 0

[State -3, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [3000,3999])
trigger2 = stateno != [4000,4999]
trigger2 = movecontact
var(3) = 1




[State -3, Shadows]
type = afterimage
triggerall = time = 1
trigger1 = stateno = 710 || stateno = 720
trigger2 = stateno = 55
time = 2
timegap = 1
framegap = 3
length = 12
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 120, 120, 120
palpostbright = 0, 0, 0
trans = add1

[State -3, lv1supershadow]
type=afterimage
trigger1= (stateno=[3000,3049]) && movetype = A && animelemtime(1)=1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, lv2supershadow]
type=afterimage
trigger1= (stateno=[3050,3100]) && movetype = A && animelemtime(1)=1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 32,32,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, lv3supershadow]
type=afterimage
trigger1= (stateno=[3200,4999]) && animelemtime(1)=1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,32,32
palPostBright = 0,0,0
palAdd = 0,0,0
palMul= 0.75,0.75,0.75
trans = Add1

[State -3, ExFX]
type = varadd
trigger1 = var(25) > 0
var(25) = -1
[State -3, ExFX]
type = varset
trigger1 = (stateno != [1000, 2999]) || movetype = H
var(25) = 0
[State -3, Ex Flash]
type = palfx
trigger1 = !(gametime % 2) && var(25)
time = 1
color = 0
mul = 256, 224, 0
add = 128, 128, 128
ignorehitpause = 1


[State -3, supershadowtime]
type = AfterImageTime
trigger1 = (stateno=[3000,4999]) && AnimElemTime(1) >= 0
trigger2 = (stateno=[700,705]) && AnimElemTime(1) >= 0
trigger3 = (stateno=[2500,2599]) && AnimElemTime(1) >= 0
trigger4 = (stateno=[710,720]) && AnimElemTime(1) >= 0
trigger5 = stateno = [55,56]
trigger5 = AnimElemTime(1) >= 0 && time <16
time = 2

[State -3, Prevent Crossup]
type=width
trigger1= 1
edge=8,0
ignorehitpause=1



[State -3, Jump Sound]
type = PlaySnd
triggerall = Time = 1
trigger1 = stateno = 50
value = 40, 1

[State -3, Landing Sound]
type = PlaySnd
triggerall = Time = 1
trigger1 = stateno = 52
trigger2 = stateno = 106
value = 40, 0

[State -3, Counter Sound]
type = PlaySnd
triggerall = Time = 1
trigger1 = stateno = [700,705]
value = 700, 0

[State -3, Charge Sound]
type = PlaySnd
triggerall = Time = 1
trigger1 = stateno = 710
value = 710, 0
channel = 2

[State -3, Charge Sound]
type = StopSnd
trigger1 = stateno != 710
value = 710, 0
channel = 2

[State -3, Landing Dust]
type = Explod
triggerall = Time = 1
trigger1 = stateno = 52
trigger2 = stateno = 106
trigger3 = stateno = 1052
scale = .5, .5
anim = 8102
pos = 0, 0
postype = p1
sprpriority = -1

[State -3, GetHit Snd]
type=playsnd
triggerall= alive && time=1
triggerall= stateno=5000 || stateno=5010
trigger1= gethitvar(animtype)>=2 && random<500
trigger2= gethitvar(animtype)=1 && random<375
trigger3= gethitvar(animtype)=0 && random<250
value=s10,0
channel=0
ignorehitpause=1

[State -3, GetHit Snd]
type=playsnd
triggerall= alive && time=1
trigger1= (stateno=5000 || stateno=5010) && numenemy
trigger1= gethitvar(fall) || (enemynear,hitdefattr=SCA,SA,HA)
trigger2= (stateno=5020 || stateno=5070 || stateno=5080)
trigger3= (stateno=5050 || stateno=5100) && (prevstateno!=[5000,5199])
value=s10,1
channel=0
ignorehitpause=1



