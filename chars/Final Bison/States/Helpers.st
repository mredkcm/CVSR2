; _______________________________
;| Vega by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===< HELPER STATES >====
;==

;====< PSYCHO POWER >=
[Statedef 6000]
physics = N
anim = 9741
sprpriority = 2
ctrl = 0

[State 6000, Bind]
type = bindtoroot
trigger1 = 1
[State 6000, Turn]
type = turn
trigger1 = facing != (root, facing)
[State 6000, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6000, movevar]
type = varset
trigger1 = !time
var(0) = (root, stateno)
[State 6000, movevar]
type = varset
trigger1 = !time
var(1) = (root, anim)
[State 6000, movevar]
type = varset
trigger1 = !(root, hitpausetime)
var(2) = (root, animelemno(0))

[State 6000, Anim]
type = changeanim
trigger1 = (root, stateno = [200, 270]) && (root, anim = [200, 271])
trigger1 = selfanimexist((root, anim) + 5800)
value = (root, anim) + 5800
elem = var(2)
[State 6000, Anim]
type = changeanim
trigger1 = (root, stateno = 1205) && (root, anim = 1205)
value = 1206
elem = var(2)
[State 6000, Anim]
type = changeanim
trigger1 = (root, stateno = 1250) && (root, anim = 1255)
value = 1256
elem = var(2)
[State 6000, Anim]
type = changeanim
trigger1 = (root, stateno = 1400) && (root, anim = [1400, 1402])
value = 1405
elem = var(2)

[State 6000, spr]
type = sprpriority
trigger1 = 1
value = 2
[State 6000, spr]
type = sprpriority
trigger1 = anim = 6006 && animelemtime(3) < 0
value = 0

[State 6000, End]
type = destroyself
trigger1 = !animtime || (root, movetype != A)
trigger2 = (root, stateno) != var(0) || (root, anim) != var(1)
trigger3 = (anim != [6000, 6071]) && anim != 1206 && anim != 1256 && anim != 1405


;====< PSYCHO FIELD >=
;--- ADVANCING ---
[Statedef 1605]
type = A
physics = N
movetype = A
anim = 1605
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1605, nothitby]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1
[State 1605, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1605, timevar]
type = varadd
trigger1 = time
var(0) = 1
[State 1605, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1605, Vel]
type = veladd
trigger1 = vel x < 2
x = 0.05
[State 1605, Vel]
type = velset
trigger1 = vel x > 2
x = 2
[State 1605, Vel]
type = velset
trigger1 = var(0) < 20
x = 0
y = 0
[State 1605, Bind]
type = bindtoroot
trigger1 = var(0) < 20
pos = 47, -71

[State 1605, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
[State 1605, Angle]
type = angleadd
trigger1 = 1
value = 4
[State 1605, Angle]
type = angledraw
trigger1 = 1

[State 1605, End]
type = changestate
trigger1 = root, movetype = H
trigger1 = (root, stateno != [120, 155]) && (root, stateno != [700, 702])
value = 1606

[State 1605, End]
type = changestate
trigger1 = var(0) >= ifelse(var(10) = 3, 121, ifelse(var(10) = 2, 95, 68))
value = 1610

[State 1606, End]
type = destroyself
trigger1 = pos x != [ -300, 300]


;--- CANCELLED ---
[Statedef 1606]
type = A
physics = N
movetype = I
velset = 0.66 * vel x, 0
ctrl = 0
sprpriority = 4
[State 1606, Anim]
type = changeanim
trigger1 = anim != 1605
value = 1605
[State 1606, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1606, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
[State 1606, Fade]
type = palfx
trigger1 = !time
time = 20
sinadd = -255, -255, -255, 80
[State 1605, Angle]
type = angleadd
trigger1 = 1
value = 6
[State 1606, Shrink]
type = angledraw
trigger1 = 1
scale = 1 -(time * 0.05), 1 -(time * 0.05)
[State 1606, End]
type = destroyself
trigger1 = time >= 20


;--- BURSTING ---
[Statedef 1610]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1610, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse((var(2) < 3), 1610, 1612)
ignorehitpause = 1
[State 1610, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1610, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1610, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1610, timevar]
type = varadd
trigger1 = time
var(1) = 1
[State 1610, Anim]
type = changeanim
trigger1 = anim != [1610, 1611]
value = 1610
[State 1610, Anim]
type = changeanim
trigger1 = anim = 1610 && var(1) >= 5
value = 1611
elem = animelemno(0)

[State 1610, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
[State 1610, Angle]
type = angleadd
trigger1 = 1
value = 4
[State 1610, Angle]
type = angledraw
trigger1 = 1
[State 1610, Shrink]
type = angledraw
trigger1 = var(1) < 5
scale = (0.4 + .12 * var(1)), (0.4 + .12 * var(1))
[State 1610, Vel]
type = velset
trigger1 = 1
x = 0
y = 0

[State 1610, Snd]
type = playsnd
trigger1 = !time && prevstateno = 1605
value = 5, 12
[State 1610, Dust]
type = explod
trigger1 = !time && prevstateno = 1605
anim = 7104
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 1610, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1610, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 1610, Hit]
type = hitdef
trigger1 = !(var(1) % 6)
priority = 4, Hit
attr = S, SP
damage = ceil(36 * root, fvar(12)), 7
animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 6
sparkno = -1
guard.sparkno = -1
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -2, -8
down.velocity = -2, -8
air.fall = 1
fall.recover = 1
fall.recovertime = 38
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
yaccel = 0.5

[State 1610, Sparks]
type = explod
trigger1 = movecontact && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = ifelse(moveguarded, 7001, 7020 + (random % 8))
ID = 7000
sprpriority = 5
postype = left;p1
pos = 160 + ceil(pos x + target, pos x) / 2, ceil(screenpos y + target, screenpos y + target, const(size.mid.pos.y)) / 2
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 1610, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 3, 1610, 1612)
ignorehitpause = 1
[State 1610, End]
type = changestate
trigger1 = var(1) >= 30
value = 1612


[Statedef 1612]
type = A
physics = N
movetype = I
anim = 1612
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1612, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1612, Angle]
type = angleadd
trigger1 = 1
value = 4
[State 1612, Angle]
type = angledraw
trigger1 = 1
[State 1612, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1612, End]
type = destroyself
trigger1 = !animtime


;====< PROJECTILE HITTER >=
[Statedef 1007]
type = A
physics = N
movetype = I
anim = 9741
ctrl = 0

[State 1007, End]
type = destroyself
trigger1 = (root, stateno != 1000) && (root, stateno != 3000) && (root, stateno != 3050) && (root, stateno != 4000)
trigger2 = root, stateno = 1000 && (root, anim != 1000 || animelemtime(6) < 0)
trigger3 = root, stateno = 3000 && (root, anim != 3000 || animelemtime(6) < 0)
trigger4 = root, stateno = 3050 && (root, anim != 3050 || animelemtime(13) < 0)
trigger5 = root, stateno = 4000 && root, anim != 4001

[State 1007, elemvar]
type = varset
trigger1 = !(root, hitpausetime)
var(0) = (root, animelemno(0))
[State 1007, Anim]
type = changeanim
trigger1 = 1
value = root, anim
elem = var(0)

[State 1007, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1007
ignorehitpause = 1

[State 1007, HB]
type = hitby
trigger1 = (root, stateno = 1000) || (root, stateno = 3000)
time = -1
value = SCA, NP
ignorehitpause = 1
[State 1007, HB]
type = hitby
trigger1 = (root, stateno = 3050)
time = -1
value = SCA, NP, SP
ignorehitpause = 1
[State 1007, HB]
type = hitby
trigger1 = (root, stateno = 4000)
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1007, Bind]
type = bindtoroot
trigger1 = 1
time = -1
[State 1007, Assert]
type = assertspecial
trigger1 = 1
flag = invisible


;====< PROJECTILE BANISHER >=
[Statedef 1407]
type = A
physics = N
movetype = I
ctrl = 0
anim = 1407
velset = 0, 0
[State 1407, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1407
ignorehitpause = 1
[State 1407, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP
ignorehitpause = 1
[State 1407, Anim]
type = changeanim
trigger1 = anim != 1407
value = 1407
[State 1407, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 1407, Bind]
type = bindtoroot
trigger1 = 1
time = -1
[State 1407, End]
type = destroyself
;triggerall = 0
trigger1 = root, stateno != 1400 || (root, anim != [1400, 1402])
trigger2 = root, animelemtime(7) < 0 || root, movetype = H
trigger3 = root, anim = 1400 && root, animelemtime(10) >= 0
trigger4 = root, anim = 1401 && root, animelemtime(11) >= 0
trigger5 = root, anim = 1402 && root, animelemtime(12) >= 0


;====< PSYCHO CRUSHER >=
[Statedef 1005]
physics = N
anim = 1005
sprpriority = 3
ctrl = 0
[State 1005, Bind]
type = bindtoroot
trigger1 = 1
pos = 80, -60
[State 1005, Turn]
type = turn
trigger1 = facing != (root, facing)
[State 1005, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1005, End]
type = destroyself
trigger1 = (root, stateno != 1000) || (root, anim != 1000)
trigger2 = (root, stateno = 1000) && root, animelemtime(6) < 0


;====< HEARTBREAK DESPAIR >=
[Statedef 3010]
physics = N
anim = 3010
sprpriority = 3
ctrl = 0
[State 3010, Bind]
type = bindtoroot
trigger1 = (root, stateno = 3000) && (root, movetype != H)
pos = (90 -time * 3), -59
[State 3010, Turn]
type = turn
trigger1 = facing != (root, facing)
[State 3010, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3010, Angle]
type = angledraw
trigger1 = time <= 2
scale = 0.083 * (time + 1), 0.17 * (time + 1)
[State 3010, Angle]
type = angledraw
trigger1 = time >= 3
scale = (0.25 + .11 * (time -3)), (0.5 -.071 * (time -3))
[State 3010, End]
type = destroyself
trigger1 = time >= 11


;====< PSYCHO BREAK SMASHER >=
[Statedef 3060]
physics = N
anim = 3060
sprpriority = 3
ctrl = 0
[State 3060, Bind]
type = bindtoroot
trigger1 = anim = 3060
pos = 80, -60
[State 3060, Turn]
type = turn
trigger1 = facing != (root, facing)
[State 3060, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3060, End]
type = changeanim
triggerall = anim = 3060
trigger1 = (root, stateno != 3050) || (root, anim != 3050)
trigger2 = (root, stateno = 3050) && root, animelemtime(13) < 0
value = 3061
[State 3060, End]
type = destroyself
trigger1 = anim = 3061 && !animtime


;====< FINAL PSYCHO CRUSHER >=
[Statedef 4006]
physics = N
anim = 4006
sprpriority = 5
velset = -2, 0
[State 4006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 4006, Bind]
type = bindtoroot
trigger1 = (root, stateno = 4000) && (root, anim = 4001)
pos = 160 -(20 * time), -60

[State 4006, Shrink]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.03125 * time), 0.5 + (0.0625 * time)

[State 4006, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 -(16 * time), 256

[State 4006, End]
type = destroyself
trigger1 = time >= 16


;====< WARP FX >=
;--- FADE OUT ---
[Statedef 1705]
physics = N
anim = 9741
sprpriority = ifelse((parent, ishelper), 0, -2)
[State 1705, nothitby]
type = nothitby
trigger1 = 1
time = -1
value = SCA
[State 1705, FX]
type = helper
trigger1 = !(parent, ishelper)
helpertype = normal
stateno = 1705
ID = 1705
name = "Warp FX"
postype = p1
ownpal = 1
persistent = 0

[State 1705, animvar]
type = varset
trigger1 = !time
var(0) = (root, anim)
[State 1705, animvar]
type = varset
trigger1 = !time
var(1) = (root, animelemno(0))
[State 1705, Anim]
type = changeanim
trigger1 = 1
value = var(0)
elem = var(1)

[State 1705, posvar]
type = varadd
trigger1 = var(2) < 60
var(2) = 6
[State 1705, Bind]
type = bindtoroot
trigger1 = 1
pos = ifelse((parent, ishelper), -var(2), var(2))

[State 1705, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -25 * time), 25 * time
[State 1705, End]
type = destroyself
trigger1 = time >= 10 || root, movetype = H

;--- FADE IN ---
[Statedef 1706]
physics = N
anim = 9741
sprpriority = ifelse((parent, ishelper), 0, -2)
[State 1706, nothitby]
type = nothitby
trigger1 = 1
time = -1
value = SCA
[State 1706, FX]
type = helper
trigger1 = !(parent, ishelper)
helpertype = normal
stateno = 1706
ID = 1706
name = "Warp FX"
postype = p1
ownpal = 1
persistent = 0

[State 1706, animvar]
type = varset
trigger1 = !time
var(0) = (root, anim)
[State 1706, animvar]
type = varset
trigger1 = !time
var(1) = (root, animelemno(0))
[State 1706, Anim]
type = changeanim
trigger1 = 1
value = var(0)
elem = var(1)

[State 1706, posvar]
type = varadd
trigger1 = var(2) < 60
var(2) = 6
[State 1706, Bind]
type = bindtoroot
trigger1 = 1
pos = ifelse((parent, ishelper), -60 + var(2), 60 -var(2))

[State 1706, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = 25 * time, ceil(256 -25 * time)
[State 1706, End]
type = destroyself
trigger1 = time >= 10 || root, movetype = H


;====< CAPE >=
[Statedef 6100]
physics = N
anim = 6100
sprpriority = -1
velset = -2, -.5
[State 6100, Accel]
type = veladd
trigger1 = 1
y = 0.1
[State 6100, fadeout]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -13 * time), 13 * time
[State 6100, End]
type = destroyself
trigger1 = time >= 20


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
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
[State 7100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 7101
ID = 7100
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


;====< FIRE >=
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
removetime = -2
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
trigger2 = enemynear, movetype != H || enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120


;====< SUPER CHARGE >=
[Statedef 7500]
physics = N
velset = 0, 0
anim = 9741

[State 7500, Lv1]
type = bgpalfx
trigger1 = time <= 10 && root, var(10) = 5
time = 1
add = 256 -ceil(25.6 * time), 256 -ceil(25.6 * time), 256 -ceil(25.6 * time)
mul = 256 -floor(25.6 * time), 256 -floor(25.6 * time), 256
color = 256 -floor(25.6 * time)
[State 7500, Lv1]
type = bgpalfx
trigger1 = (time = [11, 39]) && root, var(10) = 5
time = 1
mul = 0, 0, 256
color = 0
[State 7500, Lv1]
type = bgpalfx
trigger1 = time >= 40 && root, var(10) = 5
time = 1
mul = ceil(51.2 * (time -40)), ceil(51.2 * (time -40)), 256
color = floor(51.2 * (time -40))

[State 7500, Lv2]
type = bgpalfx
trigger1 = time <= 15 && root, var(10) = 6
time = 1
add = 256 -ceil(17.07 * time), 256 -ceil(17.07 * time), 256 -ceil(17.07 * time)
mul = 256 -floor(17.07 * time), 256 -floor(17.07 * time), 256
color = 256 -floor(17.07 * time)
[State 7500, Lv2]
type = bgpalfx
trigger1 = (time = [16, 47]) && root, var(10) = 6
time = 1
mul = 0, 0, 256
color = 0
[State 7500, Lv2]
type = bgpalfx
trigger1 = time >= 48 && root, var(10) = 6
time = 1
mul = ceil(51.2 * (time -48)), ceil(51.2 * (time -48)), 256
color = floor(51.2 * (time -48))

[State 7500, Lv3]
type = bgpalfx
trigger1 = time <= 20 && root, var(10) = 7
time = 1
add = 256 -ceil(12.8 * time), 256 -ceil(12.8 * time), 256 -ceil(12.8 * time)
mul = 256 -floor(12.8 * time), 256 -floor(12.8 * time), 256 -floor(12.8 * time)
color = 256 -floor(12.8 * time)
[State 7500, Lv3]
type = bgpalfx
trigger1 = (time = [21, 54]) && root, var(10) = 7
time = 1
mul = 0, 0, 0
color = 0
[State 7500, Lv3]
type = bgpalfx
trigger1 = time >= 55 && root, var(10) = 7
time = 1
mul = ceil(51.2 * (time -55)), ceil(51.2 * (time -55)), ceil(51.2 * (time -55))
color = floor(51.2 * (time -55))

[State 7500, Spiral]
type = helper
trigger1 = !time && root, var(10) >= 6
helpertype = normal
stateno = 7509
ID = 7509
name = "Super Charge Spiral"
postype = p1
pausemovetime = 255
supermovetime = 255
ownpal = 1

[State 7500, Main]
type = explod
trigger1 = !time
anim = 7500
ID = 7500
sprpriority = 5
postype = p1
removetime = -1
pausemovetime = -1
supermovetime = -1
[State 7500, Large Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 7501
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Portrait]
type = explod
trigger1 = time = 1 && root, var(10) = 7
anim = 7510
ID = 7510
postype = back
pos = 160, 120
sprpriority = -16
bindtime = -1
pausemovetime = -1
supermovetime = -1

[State 7500, Circle]
type = explod
trigger1 = !time
anim = 7502
ID = 75021
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 7
anim = 7502
ID = 75022
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 14
anim = 7502
ID = 75023
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 21
anim = 7502
ID = 75024
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
[State 7500, Circle]
type = explod
trigger1 = time = 28
anim = 7502
ID = 75025
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1

[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 5
ID = 7500
scale = 1.5 -(0.0333 * time), 1.5 -(0.0333 * time)
[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 6
ID = 7500
scale = 1.5 -(0.0283 * time), 1.5 -(0.0283 * time)
[State 7500, Scale]
type = modifyexplod
trigger1 = root, var(10) = 7
ID = 7500
scale = 1.5 -(0.025 * time), 1.5 -(0.025 * time)

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7501)
ID = 7501
scale = 0.25 + (0.075 * time), 0.25 + (0.075 * time)
trans = addalpha
alpha = ceil(256 -6.4 * time), 256

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time < 8
ID = 7510
postype = back
pos = 160, 120
scale = 0.5, 0.5
trans = addalpha
alpha = (32 * time), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && (time = [8, 50])
ID = 7510
postype = back
pos = 160, 120
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time >= 50
ID = 7510
postype = back
pos = 160 -(8 * (time -50)), 120 + (30 * (time -50))
scale = 0.5 + (0.25 * (time -50)), 0.5 + (0.25 * (time -50))
trans = addalpha
alpha = 256 -ceil(25.6 * (time -50)), 256

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75021)
ID = 75021
scale = 0.25 + (0.0375 * time), 0.25 + (0.0375 * time)
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75022)
ID = 75022
scale = 0.25 + (0.0375 * (time -7)), 0.25 + (0.0375 * (time -7))
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75023)
ID = 75023
scale = 0.25 + (0.0375 * (time -14)), 0.25 + (0.0375 * (time -14))
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75024)
ID = 75024
scale = 0.25 + (0.0375 * (time -21)), 0.25 + (0.0375 * (time -21))
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(75025)
ID = 75025
scale = 0.25 + (0.0375 * (time -28)), 0.25 + (0.0375 * (time -28))

[State 7500, Safety]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
[State 7500, No bars]
type = assertspecial
trigger1 = root, var(10) = 7
flag = nobardisplay
flag2 = noFG

[State 7500, Safety]
type = removeexplod
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60
[State 7500, End]
type = destroyself
trigger1 = root, var(10) = 5 && time >= 45
trigger2 = root, var(10) = 6 && time >= 53
trigger3 = time >= 60


;--- Spiral ---
[Statedef 7509]
physics = N
anim = 7509
sprpriority = 5
[State 7509, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7509, Spin]
type = angleset
trigger1 = !time
value = -15 * (random % 24)
[State 7509, Spin]
type = angleadd
trigger1 = 1
value = -15

[State 7509, Angle]
type = angledraw
trigger1 = root, var(10) = 6
scale = 1 -(time / 53.0), 1 -(time / 53.0)
[State 7509, Trans]
type = trans
trigger1 = root, var(10) = 6
trans = addalpha
alpha = floor(4.83 * time), 256

[State 7509, Angle]
type = angledraw
trigger1 = root, var(10) = 7
scale = 1 -(time / 60.0), 1 -(time / 60.0)
[State 7509, Trans]
type = trans
trigger1 = root, var(10) = 7
trans = addalpha
alpha = floor(4.267 * time), 256

[State 7509, End]
type = destroyself
trigger1 = root, var(10) = 6 && time >= 54
trigger2 = time >= 61


;====< POWER CHARGE >=
;--- MAIN FX ---
[Statedef 7240]
type = S
anim = 7240
velset = 0, 0
ctrl = 0

[State 7240, Bind]
type = bindtoroot
trigger1 = (root, stateno = 740) && (root, anim = 740)
pos = -4, 0
[State 7240, Snd]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 7240, Aura]
type = explod
trigger1 = !numexplod(7242)
ID = 7242
anim = 7242
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7242) && (root, power < 3000)
ID = 7242
scale = 0.5, 0.1 + .4 * (root, power / 3000.0)
[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7242) && (root, power >= 3000)
ID = 7242
scale = 0.5, 0.5

[State 7240, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7240, End]
type = stopsnd
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
channel = 0
[State 7240, End]
type = removeexplod
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
[State 7240, End]
type = destroyself
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)


;--- PARTICLES ---
[Statedef 7243]
type = S
anim = 9741
velset = 0, 0
ctrl = 0

[State 7243, Bind]
type = bindtoroot
trigger1 = !(time % 4)
pos = ceil(-99 + (random / 6.25)), ceil(12 -(random / 6.25))

[State 7243, Particle]
type = explod
trigger1 = (time % 4) = 1
anim = 7243
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x -19) / 16.0), ((rootdist y -68) / 16.0)
scale = ifelse(random < 500, 0.5, -.5), ifelse(random < 500, 0.5, -.5)
removetime = 16
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7243, End]
type = removeexplod
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)
[State 7243, End]
type = destroyself
trigger1 = (root, stateno != 740) || (root, anim != 740) || (root, movetype = H)


;====< ZERO COUNTER CHARGE >=
[Statedef 7250]
physics = N
velset = 0, 0
anim = 9741

[State 7250, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 20
add = -255, -128, -64
sinadd = 255, 128, 64, 80
persistent = 0
[State 7250, palfx]
type = palfx
trigger1 = !time
time = 20
sinadd = -255, -255, -255, 80

[State 7250, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = 30
ownpal = 1
[State 7250, thunder]
type = explod
trigger1 = !time
anim = 7250
ID = 7250
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
removetime = -2
supermovetime = 30
ownpal = 1
[State 7250, Circle]
type = explod
trigger1 = !time
anim = 7251
ID = 7251
sprpriority = 3
postype = p1
removetime = 20
supermovetime = 30

[State 7250, Shrink]
type = modifyexplod
trigger1 = numexplod(7251)
ID = 7251
scale = 0.2 + (0.09 * time), 0.2 + (0.09 * time)
[State 7250, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1
[State 7250, End]
type = destroyself
trigger1 = time >= 20


;====< EXCEL COMBO CHARGE >=
[Statedef 7260]
physics = N
velset = 0, 0
anim = 9741

[State 7260, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 30
add = -255, -255, -128
sinadd = 255, 255, 128, 120
[State 7260, palfx]
type = palfx
trigger1 = time = 20
time = 11
sinadd = -255, -255, -255, 40
persistent = 0

[State 7260, main]
type = explod
trigger1 = !time
anim = 7260
ID = 7260
sprpriority = 5
postype = p1
removetime = 20
supermovetime = 300
[State 7260, sphere]
type = explod
trigger1 = !time
anim = 7500
ID = 7261
sprpriority = 5
postype = p1
removetime = -1
supermovetime = 300
[State 7260, Circle]
type = explod
trigger1 = time = 20
anim = 7501
ID = 7262
sprpriority = 5
postype = p1
removetime = -1
supermovetime = 300

[State 7260, shrinkcircle]
type = modifyexplod
trigger1 = 1
ID = 7260
scale = 2 -(0.1 * time), 2 -(0.1 * time)
[State 7260, shrinkcircle]
type = modifyexplod
trigger1 = 1
ID = 7261
scale = 0.017 * time, 0.017 * time
[State 7260, shrinkcircle]
type = modifyexplod
trigger1 = time >= 20
ID = 7262
scale = 0.1 + (0.1 * (time -20)), 0.1 + (0.1 * (time -20))

[State 7260, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1
[State 7260, bound]
type = screenbound
trigger1 = 1
value = 0
[State 7260, Safety]
type = removeexplod
trigger1 = time >= 30
[State 7260, End]
type = destroyself
trigger1 = time >= 30


;====< COUNTER F.X. >=
[Statedef 7400]
type = A
physics = N
anim = 9741

[State 7400, superchargebgpalfx]
type = allpalfx
trigger1 = !time
time = 8
add = 255, 255, 255
sinadd = -255, -255, -255, 32

[State 7400, slow]
type = pause
trigger1 = time < 8
time = 1

[State 7400, End]
type = destroyself
trigger1 = time >= 8


;====< SUPER FINISH >=
[Statedef 7600]
type = A
velset = 0, 0
anim = 9741
[State 7600, Bind]
type = posset
trigger1 = 1
x = 0
y = ceil(pos y -screenpos y) + 120

[State 7600, Snd]
type = playsnd
trigger1 = !time
value = 7, 5
channel = 1

[State 7600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 7600, Snd]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 7600, BG PalFX]
type = bgpalfx
trigger1 = time < 10
time = 1
mul = 0, 0, 0
[State 7600, BG PalFX]
type = bgpalfx
trigger1 = time = [10, 20]
time = 1
mul = (time -10) * 25, (time -10) * 25, (time -10) * 25

[State 7600, MvC]
type = explod
trigger1 = !time
anim = 7601
ID = 7601
ontop = 1
postype = left
pos = 0, 0
scale = 1, (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 7600, Fade]
type = modifyexplod
trigger1 = numexplod(7601)
ID = 7601
trans = addalpha
alpha = ifelse(time < 10, 256, ceil(256 -(time -10) * 25.6)), 256

[State 7600, Circle]
type = explod
trigger1 = !time
anim = 7600
ID = 7600
sprpriority = -255
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 7600, Scale]
type = modifyexplod
trigger1 = numexplod(7600)
ID = 7600
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = ceil(256 -12.8 * time), 256

[State 7600, Safety]
type = removeexplod
trigger1 = time > 20 && numexplod
trigger2 = roundstate < 3
[State 7600, nobars]
type = assertspecial
trigger1 = time <= 20
flag = nobardisplay
flag2 = noFG
flag3 = globalnoshadow

[State 7600, End]
type = destroyself
trigger1 = roundstate < 3


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
