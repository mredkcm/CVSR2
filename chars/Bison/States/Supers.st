; _______________________________
;| Vega by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====
;==< SUPER STATES >====
;====

;==< HEARTBREAK DESPAIR >=
[Statedef 3000]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3000
velset = 0, 0
poweradd = -1000
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprpriority = 1
facep2 = 1

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && animelem = 3
value = 3, 7
channel = 0
[State 3000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3000, Super Pause FX]
type = helper
trigger1 = anim = 3000 && animelem = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -21, -67
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3000, Super Pause]
type = superpause
trigger1 = anim = 3000 && animelem = 3
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = anim = 3000 && animelem = 3
fvar(5) = 0

[State 3000, NHB]
type = nothitby
trigger1 = anim = 3000 && animelemtime(6) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3000, width]
type = width
trigger1 = anim = 3000 && animelemtime(4) >= 0
trigger2 = anim = 3001
edge = 20
player = 15
ignorehitpause = 1

[State 3000, nothitby]
type = nothitby
trigger1 = anim = 3000 && animelemtime(6) >= 0
value = , NP
time = 1
ignorehitpause = 1
[State 3000, shield]
type = helper
trigger1 = !numhelper(1007)
trigger1 = anim = 3000 && animelemtime(6) >= 0
helpertype = normal
stateno = 1007
ID = 1007
name = "Projectile Hitter"
postype = p1

[State 3000, Vel]
type = velset
trigger1 = anim = 3000 && animelemtime(4) >= 0
x = 8
y = 0
[State 3000, statetype]
type = statetypeset
trigger1 = anim = 3000 && animelemtime(4) >= 0
trigger2 = anim = 3001
statetype = A
physics = N

[State 3000, Anim]
type = changeanim
trigger1 = anim = 3000 && animelemtime(6) >= 1 && movehit
value = 3001
[State 3000, miss]
type = changestate
trigger1 = anim = 3000 && animelemtime(6) >= 1 && (moveguarded || movereversed)
value = 3003
[State 3000, Vel]
type = velset
trigger1 = anim = 3001
x = 2
y = 0

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && animelem = 4
value = 0, 40
[State 3000, Dust]
type = explod
trigger1 = anim = 3000 && animelem = 4
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3000, Snd]
type = playsnd
trigger1 = anim = 3001 && animelem = 1
value = 4, 1
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = anim = 3000 && animelem = 5
value = 5, 4

[State 3000, FX]
type = helper
trigger1 = anim = 3000 && animelemtime(4) >= 0 && !(animelemtime(4) % 5)
helpertype = normal
stateno = 3010
ID = 3010
name = "Psycho Crusher"
postype = p1
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3000, hitfirst]
type = hitdef
trigger1 = anim = 3000 && animelem = 6
attr = S, HA
damage = 33, 7
animtype = Medium
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 6
guard.pausetime = 8, 8
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -59
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -2, -2
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
air.fall = 1
fall.recover = 0
ID = 3000
yaccel = 0.5

[State 3000, Hit]
type = hitdef
trigger1 = anim = 3001
trigger1 = animelem = 4 || animelem = 8 || animelem = 12 || animelem = 16
attr = S, HA
damage = 33, 7
animtype = Medium
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -59
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -2, -2
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
air.fall = 1
fall.recover = 0
ID = 3000
yaccel = 0.5

[State 3000, hitthrow]
type = hitdef
trigger1 = anim = 3001 && animelem = 17
attr = S, HA
damage = 0, 7
animtype = Medium
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 6
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -59
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -2, -2
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
air.fall = 1
fall.recover = 0
ID = 3002
yaccel = 0.5

[State 3000, p2state]
type= targetdrop
trigger1= numtarget(3002) > 1
ID=3002
keepone=1
excludeID=3002
ignorehitpause=1

[State 3000, p2state]
type=targetstate
trigger1= animelemtime(17)>=0 && animelemtime(17)<2
trigger1= movehit=1 && numtarget(3002)=1
ID=3002
value=3004
ignorehitpause=1
[State 3000, p1state]
type=changestate
trigger1= animelemtime(17)>=0 && animelemtime(17)<2
trigger1= movehit=1 && numtarget(3002)=1
value=3002
ignorehitpause=1

[State 3000, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "Flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 3000, Anim]
type = changeanim
trigger1 = anim = 3000 && (animelemtime(6) >= 20)
trigger2 = anim = 3000 && (animelemtime(6) >= 10) && (frontedgedist <= (const(size.air.front) + 20))
trigger3 = anim = 3001 && !animtime
value = 1001
[State 3000, Vel]
type = velmul
trigger1 = anim = 1001
x = 0.85
[State 3000, End]
type = changeanim
trigger1 = anim = 1001 && !animtime
value = 1002
[State 3000, Vel]
type = velset
trigger1 = anim = 1002
x = 0
y = 0
[State 3000, Pos]
type = posset
trigger1 = anim = 1002
y = 0
[State 3000, statetype]
type = statetypeset
trigger1 = anim = 1002
statetype = S
physics = S
[State 3000, Snd]
type = playsnd
trigger1 = anim = 1002
value = 0, 52
persistent = 0
[State 3000, Dust]
type = explod
trigger1 = anim = 1002
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = anim = [1001, 1002]
movetype = I

[State 3000, End]
type = changestate
trigger1 = anim = 1002 && !animtime
value = 0
ctrl = 1


;--- JUMP BACK ---
[Statedef 3003]
type = A
physics = A
movetype = I
anim = 3003
ctrl = 0
velset = -4, -10
[State 3003, posfix]
type = posadd
trigger1 = !time
x = 20


;--- THROW ---
[Statedef 3002]
type = S
movetype = A
physics = S
anim = 3002
ctrl = 0
sprpriority = 1

[State 3002, throw]
type = targetstate
trigger1 = !time
value = 3004
[State 3002, throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 3002, grabsnd]
type = playsnd
trigger1 = !time
value = 0, 800

[State 3002, width]
type = width
trigger1 = animelemtime(10) < 0
edge = 25, 0

[State 3002, throwsnd]
type = playsnd
trigger1 = animelem = 4
value = 3, 8
channel = 0

[State 3002, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(4) < 0
pos = 50, 0
[State 3002, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = 49, -75
[State 3002, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = 36, -81
[State 3002, Bind 6]
type = targetbind
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
pos = 5, -80
[State 3002, Bind 7]
type = targetbind
trigger1 = animelem = 7
pos = -20, -80 -target, const(size.mid.pos.y)

[State 3002, hurt]
type = targetlifeadd
trigger1 = animelem = 7
value = -ceil(33 * fvar(12))

[State 3002, hurt]
type = targetpoweradd
trigger1 = animelem = 7
value = 36

[State 3002, throw]
type = targetstate
trigger1 = animelem = 7
value = 812

[State 3002, Turn]
type = turn
trigger1 = animelem = 11

[State 3002, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 3004]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = -1
[State 3004, Anim]
type = changeanim2
trigger1 = !time
value = 3004
[State 3004, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0


;==< PSYCHO BREAK SMASHER >=
[Statedef 3050]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3050
velset = 0, 0
poweradd = -2000
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprpriority = 1
facep2 = 1

[State 3050, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3050 && animelem = 1
value = 4, 8
channel = 0
[State 3050, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3050, Super Pause FX]
type = helper
trigger1 = anim = 3050 && animelem = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 24, -91
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3050, Super Pause]
type = superpause
trigger1 = anim = 3050 && animelem = 2
time = 53
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0
movetime = 53

[State Corner Push]
type = varset
trigger1 = anim = 3050 && animelem = 2
fvar(5) = 0

[State 3050, NHB]
type = nothitby
trigger1 = anim = 3050 && time < 64
time = 1
value = SCA
ignorehitpause = 1

[State 3050, width]
type = width
trigger1 = anim = 3050 && animelemtime(11) >= 0
value = 20
ignorehitpause = 1
[State 3050, Push]
type = playerpush
trigger1 = anim = 3050 && animelemtime(13) >= 0
value = 0
ignorehitpause = 1

[State 3050, nothitby]
type = nothitby
trigger1 = anim = 3050 && animelemtime(13) >= 0
value = , NP, SP
time = 1
ignorehitpause = 1
[State 3050, shield]
type = helper
trigger1 = !numhelper(1007)
trigger1 = anim = 3050 && animelemtime(13) >= 0
helpertype = normal
stateno = 1007
ID = 1007
name = "Projectile Hitter"
postype = p1

[State 3050, Vel]
type = velset
trigger1 = anim = 3050 && animelemtime(11) >= 0
x = 10
y = 0
[State 3050, Vel]
type = velset
trigger1 = anim = 3050 && animelemtime(11) >= 0 && var(14) < 9
trigger1 = (movecontact = [1, 3]) || (movereversed = [1, 3])
x = 0
y = 0

[State 3050, statetype]
type = statetypeset
trigger1 = anim = 3050 && animelemtime(11) >= 0
statetype = A
physics = N

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3050 && animelem = 11
value = 0, 40
[State 3050, Dust]
type = explod
trigger1 = anim = 3050 && animelem = 11
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3050, Snd]
type = playsnd
trigger1 = anim = 3050 && animelem = 11
value = 4, 5
channel = 0
[State 3050, Snd]
type = playsnd
trigger1 = anim = 3050 && animelem = 13
value = 5, 5

[State 3050, FX]
type = helper
trigger1 = !numhelper(3060)
trigger1 = anim = 3050 && animelemtime(13) >= 0
helpertype = normal
stateno = 3060
ID = 3060
name = "Psycho Crusher"
postype = p1
ownpal = 1
pausemovetime = 999
supermovetime = 999

[State 3050, hitvar]
type = varset
trigger1 = anim != 3050
trigger2 = anim = 3050 && animelemtime(13) < 0
var(14) = 0
[State 3050, hitvar]
type = varadd
trigger1 = anim = 3050 && (movehit = 1 || moveguarded = 1 || movereversed = 1)
var(14) = 1

[State 3050, Hit]
type = hitdef
trigger1 = anim = 3050 && animelemtime(13) >= 0
trigger1 = !(movecontact % 4) && var(14) < 9
attr = S, HA
damage = 37, 7
animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 8
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -59
hitsound = s2, 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10, -4.5
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -10, -4.5
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
fall = 1
fall.recover = 0
ID = 3050
yaccel = 0.5

[State 3050, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7180
ID = 7180
name = "Flames"
postype = p2
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

[State 3050, Anim]
type = changeanim
trigger1 = anim = 3050 && (animelemtime(12) >= 85)
trigger2 = anim = 3050 && (animelemtime(12) >= 10) && (frontedgedist <= (const(size.air.front) + 20))
value = 3051

[State 3050, Vel]
type = velmul
trigger1 = anim = 3051
x = 0.85
[State 3050, End]
type = changeanim
trigger1 = anim = 3051 && !animtime
value = 1002

[State 3050, Vel]
type = velset
trigger1 = anim = 1002
x = 0
y = 0
[State 3050, Pos]
type = posset
trigger1 = anim = 1002
y = 0
[State 3050, statetype]
type = statetypeset
trigger1 = anim = 1002
statetype = S
physics = S

[State 3050, Snd]
type = playsnd
trigger1 = anim = 1002
value = 0, 52
persistent = 0
[State 3050, Dust]
type = explod
trigger1 = anim = 1002
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = anim = [1001, 1002]
movetype = I

[State 3050, End]
type = changestate
trigger1 = anim = 1002 && !animtime
value = 0
ctrl = 1


;==< KNEE PRESS NIGHTMARE >=
[Statedef 3100]
type = S
physics = S
movetype = A
ctrl = 0
anim = 3100
velset = 0, 0
poweradd = -1000
juggle = ifelse((prevstateno = [1000, 4999]), 0, 6) * !var(20)
sprpriority = 1
facep2 = 1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3100, Snd]
type = playsnd
trigger1 = animelemtime(1) = 2
value = 4, 1
channel = 0
[State 3100, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 3100, Super Pause FX]
type = helper
trigger1 = animelemtime(1) = 2
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 23, -59
ownpal = 1
persistent = 0
supermovetime = 9999
[State 3100, Super Pause]
type = superpause
trigger1 = animelemtime(1) = 2
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = animelemtime(1) = 2
fvar(5) = 0

[State 3100, NHB]
type = nothitby
trigger1 = animelemtime(4) < 0
time = 1
value = SCA
ignorehitpause = 1

[State 3100, Anim]
type = changeanim
triggerall = vel y > 0 && pos y >= -ceil(vel y)
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(11) >= 0 && animelemtime(12) < 0
value = 3100
elem = animelemno(0) + 1

[State 3100, Snd]
type = playsnd
trigger1 = (animelem = 2 || animelem = 8)
value = 0, 40
[State 3100, Dust]
type = explod
trigger1 = (animelem = 2 || animelem = 8)
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3100, Vel]
type = velset
trigger1 = (animelem = 2 || animelem = 8)
x = ifelse((animelem = 2), 5, 7.5)
y = -2.5
[State 3100, Vel]
type = velset
trigger1 = animelem = 16
x = 25
[State 3100, Vel]
type = velset
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
x = 0
y = 0
[State 3100, Vel]
type = velset
trigger1 = animelemtime(12) >= 0
y = 0

[State 3100, statetype]
type = statetypeset
trigger1 = animelemtime(2) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(8) >= 0 && animelemtime(12) < 0
statetype = A
physics = N
[State 3100, statetype]
type = statetypeset
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
trigger2 = animelemtime(12) >= 0
statetype = S
physics = S
[State 3100, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0 && animelemtime(6) < 0
trigger2 = animelemtime(8) >= 0 && animelemtime(12) < 0
y = 0.25

[State 3100, Pos]
type = posset
trigger1 = animelemtime(6) >= 0 && animelemtime(8) < 0
trigger2 = animelemtime(12) >= 0
y = 0

[State 3100, Snd]]
type = playsnd
trigger1 = animelem = 2 || animelem = 8
value = 3, 2
channel = 0
[State 3100, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 9
value = 1, 6
channel = 1
[State 3100, Snd]
type = playsnd
trigger1 = animelem = 15
value = 5, 8
channel = 1

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 6 || animelem = 12
value = 0, 52
[State 3100, Dust]
type = explod
trigger1 = animelem = 6 || animelem = 12
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3100, hithigh]
type = hitdef
trigger1 = animelem = 4 || animelem = 10
attr = S, HA
damage = 37, 6
animtype = Medium
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -85
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -7, 0
air.type = Low
air.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 0
air.fall = 1
fall.recover = 0
yaccel = 0.5

[State 3100, hitlow]
type = hitdef
trigger1 = animelem = 5 || animelem = 11
attr = S, HA
damage = 37, 6
animtype = Hard
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -26
hitsound = s2, 6
guardsound = s2, 0
ground.type = Low
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -7, 0
air.type = Low
air.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 0
air.fall = 1
fall.recover = 0
yaccel = 0.5

[State 3100, hitslide]
type = hitdef
trigger1 = animelem = 16
attr = C, HA
damage = 37, 6
animtype = Hard
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7000
sparkxy = -10, -20
hitsound = s2, 6
guardsound = s2, 0
ground.type = Trip
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -4
air.type = Low
air.velocity = -4, -4
air.cornerpush.veloff = 0
down.hittime = 20
down.velocity = 0, 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0;-12.74
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(17) >= 0
movetype = I

[State 3100, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 10, 12)
ctrl = 1


;==< KICKS >=
[Statedef 3150]
type = A
physics = N
movetype = A
ctrl = 0
anim = 3150
velset = 0, 0
poweradd = -1000
juggle = 0
sprpriority = 1

[State 3150, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3150, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3150, Pos]
type = posadd
trigger1 = !time
trigger1 = p2dist x = [ -48, 0]
x = ceil(p2dist x -24)
[State 3150, Pos]
type = posset
trigger1 = !time
trigger1 = pos y >= -24
y = -12

[State 3150, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = 20, -15
ownpal = 1
supermovetime = 9999
[State 3150, Super Pause]
type = superpause
trigger1 = !time
time = 45
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 3150, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(25) < 0
x = 4

[State 3150, Snd]
type = playsnd
trigger1 = animelem = 5
value = 4, 2
channel = 0
[State 3150, Snd]
type = playsnd
trigger1 = animelem = 15
value = 3, 7
channel = 0
[State 3150, Snd]
type = playsnd
trigger1 = animelem = 24
value = 3, 1
channel = 0

[State 3100, Snd]
type = playsnd
trigger1 = animelem = 2 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13
trigger2 = animelem = 15 || animelem = 17 || animelem = 19 || animelem = 21 || animelem = 24
value = 1, 6
channel = 1

[State 3150, Hit]
type = hitdef
trigger1 = animelem = 2 || animelem = 7 || animelem = 9 || animelem = 11 || animelem = 13
trigger2 = animelem = 15 || animelem = 17 || animelem = 19 || animelem = 21
attr = A, HA
damage = 20, 2
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 2), 8, 4), ifelse((animelem = 2), 12, 8)
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -30 -(random % 20), -69 -(random % 20)
hitsound = s2, 6
guardsound = s2, 0
air.type = Low
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -4.49, 0
ground.cornerpush.veloff = 0;-8.17
air.velocity = -6, -3.5
air.cornerpush.veloff = 0
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 0
air.fall = 1
fall.recover = 0
yaccel = 0.5

[State 3150, Hit]
type = hitdef
trigger1 = animelem = 24
attr = A, HA
damage = 20, 2
animtype = Diagup
fall.animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -40, -86
hitsound = s2, 6
guardsound = s2, 0
air.type = Low
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -8, -4
guard.velocity = -7.51
ground.cornerpush.veloff = 0;-10.47
air.velocity = -8, -4
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
guard.velocity = -10.52
getpower = 0
givepower = 36, 36
forcestand = 1
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
fall = 1
fall.recover = 0
yaccel = 0.5

[State 3100, Anim]
type = changeanim
trigger1 = movecontact != [1, 16]
trigger1 = animelemtime(10) >= 0 && animelemtime(22) < 0
value = 3150
elem = 22

[State 3150, Vel]
type = veladd
trigger1 = animelemtime(25) >= 0
y = 0.5
[State 3150, Vel]
type = velset
trigger1 = animelem = 25
x = -4
y = -8
[State 3150, statetype]
type = statetypeset
trigger1 = animelemtime(25) >= 0
movetype = I

[State 3150, End]
type = changestate
trigger1 = animelemtime(25) >= 0
trigger1 = pos y > -vel y
value = 3151


;--- Land ---
[Statedef 3151]
type = S
physics = S
ctrl = 0
anim = 1103
velset = 0, 0
[State 3151, Pos]
type = posset
trigger1 = 1
y = 0
[State 3151, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3151, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 3151, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==< FINAL PSYCHO CRUSHER >=
[Statedef 4000]
type = S
physics = N
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
poweradd = -3000
juggle = 15
facep2 = 1
sprpriority = 1

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7

[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
channel = 0
[State 4000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1
[State 4000, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7500
ID = 7500
name = "Super Charge"
postype = p1
pos = -2, -108
ownpal = 1
persistent = 0
supermovetime = 9999
[State 4000, Super Pause]
type = superpause
trigger1 = !time
time = 60
movetime = 60
anim = -1
sound = s7, 0
p2defmul = 1
darken = 0

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 4000, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA
[State 4000, shield]
type = helper
trigger1 = !numhelper(1007) && anim = 4001
helpertype = normal
stateno = 1007
ID = 1007
name = "Projectile Hitter"
postype = p1

[State 4000, Push]
type = playerpush
trigger1 = anim = 4000
trigger2 = anim = 4001 && var(14) >= 9
value = 0
[State 4000, screen]
type = screenbound
trigger1 = anim = 4000 && animelemtime(10) >= 0
trigger2 = anim = 4001
value = 0
movecamera = 0, 1
[State 4000, spr]
type = sprpriority
trigger1 = 1
value = ifelse(anim = 4001, 4, 1)

[State 4000, posfix]
type = posadd
trigger1 = anim = 4000 && animelem = 2 || animelem = 3
x = ifelse((animelem = 2), -8, -12)

[State 4000, Vel]
type = velset
trigger1 = anim = 4000 && animelemtime(10) >= 0 && vel x > -10
x = -12.5
[State 4000, Fade]
type = trans
trigger1 = anim = 4000 && (animelemtime(10) = [0, 10])
trans = addalpha
alpha = ceil(256 -25.6 * animelemtime(10)), ceil(25.6 * animelemtime(10))
[State 4000, Fade]
type = trans
trigger1 = anim = 4000 && animelemtime(10) >= 10
trans = addalpha
alpha = 0, 256
[State 4000, Anim]
type = changeanim
trigger1 = anim = 4000 && time >= 60
value = 4001

[State 4000, Snd]
type = playsnd
trigger1 = anim = 4001
value = 4, 9
channel = 0
persistent = 0
[State 4000, Snd]
type = playsnd
trigger1 = anim = 4001
value = 5, 10
persistent = 0
[State 4000, Pos]
type = posset
trigger1 = anim = 4001
x = (-320 * facing)
y = -45
persistent = 0

[State 4000, palfx]
type = palfx
trigger1 = anim = 4001 && (gametime % 4 = [0, 1])
time = 1
color = 0
add = 30 + ceil(sin(gametime / 3.0) * 30), 60 + ceil(sin(gametime / 3.0) * 30), 90 + ceil(sin(gametime / 3.0) * 30)
mul = 256, 512, 512
ignorehitpause = 1
[State 4000, palfx]
type = palfx
trigger1 = anim = 4001 && (gametime % 4 = [2, 3])
time = 1
color = 0
add = 60 + ceil(sin(gametime / 3.0) * 30), 30 + ceil(sin(gametime / 3.0) * 30), 90 + ceil(sin(gametime / 3.0) * 30)
mul = 512, 256, 512
ignorehitpause = 1

[State 4000, FX]
type = removeexplod
trigger1 = anim != 4001 && numexplod(4005)
ID = 4005
[State 4000, FX]
type = explod
trigger1 = anim = 4001 && !numexplod(4005)
anim = 4005
ID = 4005
sprpriority = 4
postype = p1
ownpal = 1
removeongethit = 1
ignorehitpause = 1
[State 4000, FX]
type = modifyexplod
trigger1 = anim = 4001 && (frontedgedist > -90 && time < 180)
ID = 4005
postype = p1
pos = 75, -60
vel = 20, 0
removetime = 300
ignorehitpause = 1

[State 4000, FX]
type = helper
trigger1 = anim = 4001 && numexplod(4005) && !(gametime % 8)
helpertype = normal
stateno = 4006
ID = 4006
name = "Psycho Crusher"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
pausemovetime = 999
supermovetime = 999
ignorehitpause = 1

[State 4000, BG PalFX]
type = bgpalfx
trigger1 = anim = 4001
time = 90
add = -90, -90, -90
sinadd = 90, 90, 90, 360
ignorehitpause = 1

[State 4000, hitvar]
type = varset
trigger1 = anim != 4001
var(14) = 0
[State 4000, hitvar]
type = varadd
trigger1 = anim = 4001 && (movehit = 1 || moveguarded = 1 || movereversed = 1)
var(14) = 1

[State 4000, Vel]
type = velset
trigger1 = anim = 4001
x = 20
y = 0
[State 4000, Vel]
type = velset
trigger1 = anim = 4001 && var(14) < 12
trigger1 = (movecontact = [1, 4]) || (movereversed = [1, 4])
x = 0
y = 0

[State 4000, Hit]
type = hitdef
trigger1 = anim = 4001 && !(time % 4) && var(14) < 11
attr = S, HA
damage = 62, 8
animtype = Diagup
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 8
sparkno = s7030 + (random % 8)
guard.sparkno = s7001
sparkxy = -10, -60
hitsound = sifelse(hitcount, -1, 2), 3
guardsound = s2, 0
ground.type = Low
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -12, -12
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -12, -12
guard.dist = 320
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 8
sprpriority = 5
fall = 1
fall.recover = 0
ID = 4000
yaccel = 0.5
forcestand = 1

[State 4000, HitSound]
type = playsnd
trigger1 = movehit = 1
trigger1 = hitcount && hitpausetime = 1
value = 2, ifelse(hitcount = 12, 8, 3)
channel = 2
ignorehitpause = 1

[State 4000, statetype]
type = statetypeset
trigger1 = anim = 4001
statetype = A
physics = N
movetype = A
[State 4000, End]
type = changestate
trigger1 = anim = 4001 && (frontedgedist <= -90 || time >= 180)
value = 4002


;--- END ---
[Statedef 4002]
type = S
physics = S
movetype = I
anim = 4002
ctrl = 0
velset = 0, 0
[State 4002, Anim]
type = changeanim
trigger1 = time <= 40
;trigger1 = animelemtime(2) < 0 && numtarget(4000)
;trigger1 = (target, stateno = [5020, 5119]) && time <= 120
value = 4002
elem = 1
[State 4002, Pos]
type = posset
trigger1 = animelemtime(2) < -1
x = 0
y = 0
[State 4002, Pos]
type = posset
trigger1 = animelemtime(2) = -1
x = -80 * facing

[State 4002, palfx]
type = palfx
trigger1 = !time
time = 1
add = 0, 0, 0
ignorehitpause = 1
[State 4002, afterimageoff]
type = afterimagetime
trigger1 = 1
time = 0
ignorehitpause = 1

[State 4002, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 1
channel = 0
[State 4002, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 6
[State 4002, fadein]
type = trans
trigger1 = animelemtime(2) = [0, 10]
trans = addalpha
alpha = 25 * animelemtime(2), ceil(256 -25 * animelemtime(2))
[State 4002, FX]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 1706
ID = 1705
name = "Warp FX"
postype = p1
pos = 60, 0

[State 4002, Push]
type = playerpush
trigger1 = animelemtime(2) <= 10
value = 0
[State 4002, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
