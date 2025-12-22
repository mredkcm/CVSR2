; ________________________________
;| Karin by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===< HELPER STATES >====
;==

;====< SATELLITE BEAM >=
[Statedef 3250]
type = A
physics = N
movetype = A
anim = 3250
ctrl = 0
sprpriority = 5

[State 3250, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State 3250, Pos]
type = posset
trigger1 = 1
y = 0

[State 3250, Scale]
type = angledraw
trigger1 = 1
scale = 0.5 + (random / 1000.0), 1
[State 3250, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 128 + ceil(128 * random / 1000.0), 256
ignorehitpause = 1

[State 3250, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
mul = 192, 0, 96
[State 3250, BG PalFX]
type = bgpalfx
trigger1 = !(time % 2)
time = 1
color = 0
invertall = 1
[State 3250, Shake]
type = envshake
trigger1 = !(time % 6)
time = 6
ampl = 3
freq = 120

[State 3250, Snd]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0
[State 3250, Dust]
type = explod
trigger1 = !(time % 6)
anim = 8105
sprpriority = -3
postype = p1
pos = 0, 0
scale = 1, 1
ownpal = 1

[State 3250, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 3255
ID = 3255
name = "Dooooon!!!"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3250, hitcount]
type = parentvaradd
trigger1 = movehit = 1 && numtarget
trigger1 = !(target, ishelper)
var(13) = 1
ignorehitpause = 1
[State 3250, juggle]
type = parentvaradd
trigger1 = movehit = 1 && numtarget
trigger1 = !(target, ishelper)
var(14) = 1
ignorehitpause = 1
[State 3250, projcontact]
type = parentvarset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
trigger1 = root, stateno = 3203
var(18) = 1
ignorehitpause = 1

[State 3250, dampener]
type = varset
trigger1 = !time && !prevstateno
fvar(11) = root, fvar(10)
ignorehitpause = 1

[State 3250, Hit]
type = hitdef
trigger1 = !(movecontact % 4)
ID = 3250
attr = S, HP
hitflag = MAF
guardflag = H
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 2
getpower = 0, 0
givepower = 36, 36
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
ground.type = High
air.type = High
ground.hittime = 17
ground.slidetime = 17
guard.hittime = 17
air.hittime = 60
ground.velocity = -9, -6
guard.velocity = -12.65
air.velocity = -9, -6
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 0
sparkno = -1
guard.sparkno = -1
sparkxy = -10, -30

[State 3250, p2state]
type = targetstate
trigger1 = movehit && numtarget(3250)
trigger1 = (target(3250), stateno = 5000) || (target(3250), stateno = 5010) || (target(3250), stateno = 5020)
ID = 3250
value = 3270
ignorehitpause = 1

[State 3250, hitsound]
type = playsnd
trigger1 = movecontact = 1 && numtarget(3250)
value = ifelse(moveguarded, 3, 2), ifelse(moveguarded, 0, 2)
channel = 2
ignorehitpause = 1

[State 3250, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1= (target,movetype=H) && !(target,time)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
pos = (target, const(size.ground.front) -10), target, const(size.mid.pos.y)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3250, End]
type = changestate
trigger1 = time >= 60
value = 3251
ignorehitpause = 1


[Statedef 3251]
type = A
physics = N
movetype = I
ctrl = 0
anim = 3250
velset = 0, 0
sprpriority = 5
[State 3251, Shrink]
type = angledraw
trigger1 = 1
scale = 1 -(time / 16.0), 1
[State 3250, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 -(time * 16), 256
[State 3251, End]
type = destroyself
trigger1 = time >= 16


;====< IMPACT FX >=
[Statedef 3205]
type = A
velset = 0, 0
anim = 9741

[State 3205, Circle]
type = explod
trigger1 = !numexplod(3205)
anim = 8105
ID = 3205
sprpriority = -3
postype = p1
pausemovetime = -1
supermovetime = -1
ownpal = 1
[State 3205, Scale]
type = modifyexplod
trigger1 = numexplod(3205)
ID = 3205
scale = 0.2 + (0.1 * time), 0.04 + (0.02 * time)
trans = addalpha
alpha = ceil(256 -(12.8 * time)), 256

[State 3205, Safety]
type = removeexplod
trigger1 = time >= 20
[State 3205, End]
type = destroyself
trigger1 = time >= 20


;====< LIGHTING FX >=
[Statedef 3206]
type = A
physics = N
movetype = I
anim = 3206
ctrl = 0
sprpriority = 2

[State 3206, NHB]
type = nothitby
trigger1 = 1
value = SCA, AA, AP, AT
time = -1
ignorehitpause = 1

[State 3206, Bind]
type = bindtoroot
trigger1 = 1

[State 3206, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3206, End]
type = destroyself
trigger1 = root, stateno != 3203
trigger2 = root, movetype = H


;====< ONOMATOPAEA >=
[Statedef 3255]
type = A
velset = 0, 0
anim = 3255
sprpriority = 5
[State 3255, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
[State 3255, Turn]
type = turn
trigger1 = facing = -1

[State 3255, Pos]
type = posset
trigger1 = !time
y = -120

[State 3255, Scale]
type = angledraw
trigger1 = 1
scale = 0.5 + (0.05 * time), 0.5 + (0.05 * time)
[State 3255, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -8.53 * time), ceil(8.53 * time)

[State 3255, End]
type = destroyself
trigger1 = time >= 30


;====< HELICOPTER >====
[Statedef 6000]
type = A
physics = N
anim = 6000
velset = 0, 0
ctrl = 0
sprpriority = -5

[State 6000, Pos]
type = posset
trigger1 = 1
x = -168 * facing
y = ceil(pos y -screenpos y) + ceil(sin(time / 30.0 * pi) * 4) -8

[State 6000, door]
type = explod
trigger1 = !time
anim = 6001
ID = 6001
sprpriority = -3
postype = p1
bindtime = -1
removetime = 600
scale = const(size.xscale), const(size.yscale)
ownpal = 1

[State 6000, Shake]
type = envshake
trigger1 = !(time % 6)
time = 6
ampl = 2
freq = 90

[State 6000, Dust]
type = explod
trigger1 = !(time % 9)
anim = 8105
sprpriority = -5
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
ownpal = 1
[State 6000, Dust]
type = explod
trigger1 = !(time % 12)
anim = 8105
sprpriority = -5
postype = p1
pos = 0, -ceil(pos y)
scale = 1, 1
ownpal = 1
[State 6000, Dust]
type = explod
trigger1 = !(time % 15)
anim = 8105
sprpriority = -5
postype = p1
pos = 0, -ceil(pos y)
scale = 1.5, 1.5
ownpal = 1

[State 6000, End]
type = changestate
trigger1 = time >= 240
value = 6001


;--- --Fly Away -----
[Statedef 6001]
type = A
physics = N
velset = 0, 0
ctrl = 0
sprpriority = -5

[State 6001, Snd]
type = playsnd
trigger1 = !time
value = 7, 1
channel = 0
[State 6001, Dust]
type = explod
trigger1 = !time || time = 12
anim = 8105
sprpriority = -5
postype = p1
pos = 0, -ceil(pos y)
scale = ifelse(!time, 0.5, 1), ifelse(!time, 0.5, 1)
ownpal = 1

[State 6001, Vel]
type = veladd
trigger1 = vel x > -3
x = -.2
[State 6001, Vel]
type = veladd
trigger1 = vel y > -10
y = -.1

[State 6001, Safety]
type = removeexplod
trigger1 = (pos x != [ -465, 465]) || (screenpos y != [ -212, 0])
[State 6001, End]
type = destroyself
trigger1 = (pos x != [ -465, 465]) || (screenpos y != [ -212, 0])


;====< ISHIZAKI >====
;--- Intro ---
[Statedef 6010]
type = S
physics = N
anim = 6010
velset = 0, 0
ctrl = 0
sprpriority = -1
[State 6010, End]
type = changestate
trigger1 = time >= 96
value = 6011


[Statedef 6011]
type = S
physics = N
anim = 6011
velset = 0, 0
ctrl = 0
sprpriority = -1
[State 6011, End]
type = changestate
trigger1 = time >= 48
value = 6012


[Statedef 6012]
type = S
physics = N
anim = 6012
velset = 0, 0
ctrl = 0
sprpriority = -1

[State 6012, Turn]
type = turn
trigger1 = !time
[State 6012, Vel]
type = velset
trigger1 = !time
x = 4

[State 6012, End]
type = destroyself
trigger1 = pos x != [ -220, 220]


;--- Drink ---
[Statedef 6020]
type = S
physics = N
anim = 6020
velset = 4, 0
ctrl = 0
sprpriority = 1
[State 6020, End]
type = changestate
trigger1 = rootdist x <= 80
value = 6021


[Statedef 6021]
type = S
physics = N
anim = 6021
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 6021, Snd]
type = playsnd
trigger1 = !time
value = 7, 2
[State 6021, End]
type = changestate
trigger1 = roundstate != 4
value = 6012


;--- First Aid (Enemy) ---
[Statedef 6030]
type = S
physics = N
anim = 6030
velset = 4, 0
ctrl = 0
sprpriority = 1
[State 6030, End]
type = changestate
trigger1 = numenemy
trigger1 = abs(enemy, pos x -pos x) <= 80
value = 6031


[Statedef 6031]
type = S
physics = N
anim = 6031
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 6031, End]
type = changestate
trigger1 = roundstate != 4
value = 6012


;--- Running away ---
[Statedef 6040]
type = S
physics = N
anim = 6040
velset = 4, 0
ctrl = 0
sprpriority = -5
[State 6040, End]
type = destroyself
trigger1 = pos x != [ -220, 220]


;--- First Aid (Karin) ---
[Statedef 6050]
type = S
physics = N
anim = 6030
velset = 4, 0
ctrl = 0
sprpriority = 1
[State 6050, End]
type = changestate
trigger1 = rootdist x <= 80
value = 6051


[Statedef 6051]
type = S
physics = N
anim = 6031
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 6051, End]
type = changestate
trigger1 = roundstate != 4
value = 6012


;====< TRAY >=
[Statedef 6015]
type = A
physics = N
anim = 6015
velset = 0, 0
ctrl = 0
sprpriority = 0

[State 6015, Vel]
type = posset
trigger1 = !time
y = -90

[State 6015, Vel]
type = veladd
trigger1 = 1
y = 0.0625
[State 6015, Vel]
type = velset
trigger1 = !time && numhelper(6010)
x = facing * (helper(6010), pos x -pos x -(20 * facing)) / 32.0
y = -1

[State 6015, Snd]
type = playsnd
trigger1 = time = 31
value = 2, 2

[State 821, Hit Spark]
type = Helper
trigger1 = time = 31
helperType = Normal
stateNo = 8012
ID = 8000
name = "Spark"
posType = P1
pos = 20, 0
ownPal = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 6015, End]
type = changestate
trigger1 = time >= 32
value = 6016

[Statedef 6016]
type = A
physics = N
anim = 6015
ctrl = 0
sprpriority = 0

[State 6016, Vel]
type = veladd
trigger1 = 1
y = 0.25
[State 6016, Vel]
type = velset
trigger1 = !time
x = 1
y = -5.92

[State 6016, End]
type = destroyself
trigger1 = time >= 48


;====< DOG >=
[Statedef 6045]
type = S
physics = N
anim = 6045
velset = 8, 0
ctrl = 0
sprpriority = -3
[State 6045, Snd]
type = playsnd
trigger1 = !time
value = 7, 3
[State 6045, End]
type = destroyself
trigger1 = time >= 20
trigger1 = pos x != [ -190, 190]

;====< EXCEL FINISH >=
[Statedef 8650]
type = A
velset = 0, 0
anim = 9741

[State 8650, Bind]
type = posset
trigger1 = 1
x = 0
y = ceil(pos y -screenpos y) + 120

[State 8650, Sound]
type = playsnd
trigger1 = !time
value = 0, 8600
channel = 1

[State 8650, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 8650, Snd]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 8650, BG PalFX]
type = bgpalfx
trigger1 = time < 10
time = 1
mul = 0, 0, 0
[State 8650, BG PalFX]
type = bgpalfx
trigger1 = time = [10, 20]
time = 1
mul = (time -10) * 25, (time -10) * 25, (time -10) * 25

[State 8650, MvC]
type = explod
trigger1 = !time
anim = 8650
ID = 8650
sprpriority = 5
postype = left
pos = 0, 0
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1
ontop = 1
scale = 1, (1.3333333 * gameheight / gamewidth)

[State 8650, Fade]
type = modifyexplod
trigger1 = numexplod(8650)
ID = 8650
scale = 1, 1
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

[State 8650, Circle]
type = explod
trigger1 = !time
anim = 8651
ID = 8651
sprpriority = -5
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1
under = 1

[State 8650, Shrink]
type = modifyexplod
trigger1 = numexplod(8651)
ID = 8651
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = ceil(256 -12.8 * time), 256

[State 8650, Text]
type = explod
trigger1 = !time
anim = 8403
ID = 8502
sprpriority = -5
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.75 * (1.3333333 * gameheight / gamewidth), 0.75 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1
under = 1

[State 8650, Fade]
type = modifyexplod
trigger1 = numexplod(8502)
ID = 8502
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

[State 8650, Safety]
type = removeexplod
trigger1 = time > 20 && numexplod
trigger2 = roundstate < 3
[State 8650, nobars]
type = assertspecial
trigger1 = time <= 20
flag = nobardisplay
flag2 = noFG
[State 8650, End]
type = destroyself
trigger1 = roundstate < 3
