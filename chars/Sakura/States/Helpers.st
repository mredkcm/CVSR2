; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===< HELPER STATES >====
;==

;====< HADOU KEN >=
[Statedef 1005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
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
[State 1005, Strength]
type = varset
trigger1 = !time
var(32) = root, var(32)
[State 1005, movevar]
type = varset
trigger1 = !time && !prevstateno
var(5) = root, stateno
[State 1005, modevar]
type = varset
trigger1 = !time && !prevstateno
var(6) = root, var(1)

[State 1005, Anim]
type = changeanim
trigger1 = anim != 1005 && anim != 1025
value = ifelse(var(5) = 1020, 1025, 1005)

[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 1005, timevar]
type = varadd
trigger1 = time
var(1) = 1

[State 1005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1005, Angle]
type = angledraw
trigger1 = var(5) = 1020
value = 43
ignorehitpause = 1

[State 1005, Vel]
type = velset
trigger1 = var(32) = 1 && var(5) = 1000
x = ifelse(var(10) = 3, 6, ifelse(var(10) = 2, 4.5, 3))
y = 0
[State 1005, Vel]
type = velset
trigger1 = var(32) = 2 && var(5) = 1000
x = 4
y = 0
[State 1005, Vel]
type = velset
trigger1 = var(32) = 3 && var(5) = 1000
x = 2
y = 0
[State 1005, Vel]
type = velset
trigger1 = var(6) = 2 && var(5) = 1000
x = 4
y = 0

[State 1005, Vel]
type = velset
trigger1 = var(32) = 1 && var(5) = 1020
x = ifelse(var(10) = 3, 4.4, ifelse(var(10) = 2, 3.3, 2.2))
y = ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -3, -2))
[State 1005, Vel]
type = velset
trigger1 = var(32) = 2 && var(5) = 1020
x = 2.9
y = -2.7
[State 1005, Vel]
type = velset
trigger1 = var(32) = 3 && var(5) = 1020
x = 1.5
y = -1.4
[State 1005, Vel]
type = velset
trigger1 = var(6) = 2 && var(5) = 1020
x = 2.9
y = -2.7

[State 1005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
persistent = 0
ignorehitpause = 1

[State 1005, Hit]
type = hitdef
trigger1 = var(32) = 1 && var(5) = 1000
priority = 4, Hit
attr = S, SP
damage = ceil(69 * root, fvar(12)), 9
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -9.22, 0
ground.cornerpush.veloff = 0
air.velocity = -3, -3
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
fall.recovertime = 36

[State 1005, Hit]
type = hitdef
trigger1 = var(32) = 2 && var(5) = 1000
priority = 4, Hit
attr = S, SP
damage = ceil(97 * root, fvar(12)), 12
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -12.65, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 36
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

[State 1005, Hit]
type = hitdef
trigger1 = var(32) = 3 && var(5) = 1000
priority = 4, Hit
attr = S, SP
damage = ceil(118 * root, fvar(12)), 15
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -3
ground.cornerpush.veloff = 0
air.velocity = -6, -3
guard.velocity = -12.65
fall = 1
fall.recover = 1
fall.recovertime = 28
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

[State 1005, Hit]
type = hitdef
trigger1 = var(32) = 1 && var(5) = 1020
priority = 4, Hit
attr = S, SP
damage = ceil(69 * root, fvar(12)), 9
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -9.22, 0
ground.cornerpush.veloff = 0
air.velocity = -2, -4
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
fall.recovertime = 32

[State 1005, Hit]
type = hitdef
trigger1 = var(32) = 2 && var(5) = 1020
priority = 4, Hit
attr = S, SP
damage = ceil(97 * root, fvar(12)), 12
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -12.65, 0
ground.cornerpush.veloff = 0
air.velocity = -3, -5
air.fall = 1
fall.recover = 1
fall.recovertime = 32
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

[State 1005, Hit]
type = hitdef
trigger1 = var(32) = 3 && var(5) = 1020
priority = 4, Hit
attr = S, SP
damage = ceil(118 * root, fvar(12)), 15
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -6
ground.cornerpush.veloff = 0
air.velocity = -4, -6
guard.velocity = -12.65
fall = 1
fall.recover = 1
fall.recovertime = 32
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

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1= (target,movetype=H) && !(target,time)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
pos = (target, const(size.ground.front) -10), -floor(p2dist y)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1
[State 1005, End]
type = destroyself
trigger1 = pos x != [ -300, 300]

[State 1005, End]
type = changestate
triggerall = var(6) = 1
trigger1 = var(5) = 1000 && var(32) = 1 && var(1) >= ifelse(var(10) = 3, 25, ifelse(var(10) = 2, 33, 50))
trigger2 = var(5) = 1020 && var(32) = 1 && var(1) >= ifelse(var(10) = 3, 17, ifelse(var(10) = 2, 23, 34))
trigger3 = var(32) != 1 && time >= ifelse(var(32) = 3, 10, 20)
value = 1007
ignorehitpause = 1
[State 1005, End]
type = changestate
trigger1 = var(6) = 2 && var(32) != 1 && time >= 15
value = 1007
ignorehitpause = 1

[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1006, sizefix]
type = angledraw
trigger1 = 1
scale = 1, 0.75
ignorehitpause = 1

[State 1006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1006, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 1006, End]
type = destroyself
trigger1 = !animtime

[Statedef 1007]
type = A
physics = N
movetype = I
velset = 0.5 * vel x, 0.5 * vel y
ctrl = 0
sprpriority = 4
[State 1007, Anim]
type = changeanim
trigger1 = anim != 1007
value = 1007
elem = animelemno(0)
[State 1007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1007, Fade]
type = palfx
trigger1 = !time
time = 16
sinadd = -255, -255, -255, 64

[State 1007, Shrink]
type = angledraw
trigger1 = 1
scale = 1, 1 -(time * 0.063)
ignorehitpause = 1

[State 1007, End]
type = destroyself
trigger1 = time >= 16


;====< HADOU SHOU >=
[Statedef 1015]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1015, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1015
ignorehitpause = 1
[State 1015, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1015, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = root, var(10)
[State 1015, movevar]
type = varset
trigger1 = !time && !prevstateno
var(5) = root, stateno
[State 1015, Anim]
type = changeanim
trigger1 = anim != 1015 && anim != 1035
value = ifelse(var(5) = 1030, 1035, 1015)

[State 1015, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1015, Angle]
type = angledraw
trigger1 = var(5) = 1030
value = 43
ignorehitpause = 1

[State 1015, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1015, movehitvar]
type = varset
trigger1 = movehit && numtarget
trigger1 = target, movetype = H
var(3) = 1
ignorehitpause = 1
[State 1015, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 1015, Bind]
type = bindtoroot
trigger1 = (root, stateno = 1010) && var(5) = 1010
pos = 72, -54
[State 1015, Bind]
type = bindtoroot
trigger1 = (root, stateno = 1030) && var(5) = 1030
pos = 44, -90

[State 1015, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = target, time = 0 && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 1015, Hit]
type = hitdef
triggerall = animelemno(0) != var(4) && var(2) < 4 && var(5) = 1010
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6
priority = 4, Hit
attr = S, SP
damage = ceil(40 * root, fvar(12)), 7
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 6, 12
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -3
ground.cornerpush.veloff = 0
air.velocity = -4, -3
getpower = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
guard.velocity = -12.65
fall = 1
fall.recover = 1
fall.recovertime = 12
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1015, Hit]
type = hitdef
triggerall = animelemno(0) != var(4) && var(2) < 4 && var(5) = 1030
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6
priority = 4, Hit
attr = S, SP
damage = ceil(40 * root, fvar(12)), 7
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 6, 12
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -6
ground.cornerpush.veloff = 0
air.velocity = -3, -6
getpower = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
guard.velocity = -12.65
fall = 1
fall.recover = 1
fall.recovertime = 32
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 1015, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1= (target,movetype=H) && !(target,time)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p2
pos = (target, const(size.ground.front) -10), -floor(p2dist y)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 1015, End]
type = destroyself
trigger1 = !animtime
trigger2 = animelemtime(7) < 0 && (root, stateno != var(5))
trigger3 = (root, anim = 1010 && root, animelemtime(5) < 0)
trigger4 = (root, anim = 1030 && root, animelemtime(5) < 0)
ignorehitpause = 1
[State 1015, End]
type = changestate
trigger1 = movecontact
value = 1015
ignorehitpause = 1


;====< PROJECTILE SHIELD >=
[Statedef 1115]
type = A
physics = N
movetype = A
ctrl = 0
velset = 8, 0
sprpriority = 3

[State 1115, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1115
ignorehitpause = 1
[State 1115, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1115, Anim]
type = changeanim
trigger1 = anim != 1115
value = 1115
[State 1115, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1115, Bind]
type = bindtoroot
trigger1 = 1
pos = 0, -55
time = -1

[State 1115, End]
type = destroyself
trigger1 = !animtime


;====< PROJECTILE HITTER >=
[Statedef 1306]
type = A
physics = N
movetype = A
anim = 1306
ctrl = 0
[State 1306, Reversal]
type = reversaldef
trigger1 = !time
reversal.attr = SCA, AP
p1stateno = 1307
pausetime = 6, 6
sparkno = -1
numhits = 0
ground.hittime = 0
ignorehitpause = 1
[State 1306, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1307
ignorehitpause = 1
[State 1306, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, AP
ignorehitpause = 1
[State 1306, Bind]
type = bindtoroot
trigger1 = 1
time = -1
[State 1306, Anim]
type = changeanim
trigger1 = root, anim = 1305 && root, animelemtime(5) < 0
value = 1306
elem = (root, animelemno(0))
ignorehitpause = 1
[State 1306, End]
type = destroyself
trigger1 = !animtime || root, movetype = H
trigger2 = root, stateno != 1305 || root, anim != 1305

[Statedef 1307]
type = A
physics = N
movetype = A
anim = 9741
ctrl = 0
[State 1307, Bind]
type = bindtoroot
trigger1 = 1
time = -1
[State 1307, End]
type = destroyself
trigger1 = root, stateno != 1305 || root, anim != 1305
trigger2 = root, stateno = 1305 && !(root, time)


;====< SHINKUU HADOU KEN >=
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
stateno = ifelse(var(2) < 5, 3005, 3006)
ignorehitpause = 1

[State 3005, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5

[State 3005, movevar]
type = varset
trigger1 = !time && !prevstateno
var(5) = root, stateno

[State 3005, modevar]
type = varset
trigger1 = !time && !prevstateno
trigger1 = root, var(1) = 2
var(6) = 1

[State 3005, Anim]
type = changeanim
trigger1 = anim != 1005 && anim != 1025
value = ifelse(var(5) = 3020, 1025, 1005)

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
trigger1 = time && !var(6)
var(1) = 1

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, Shrink]
type = angledraw
trigger1 = var(5) = 3000 && !var(6)
scale = 0.5, 1 -(var(1) * 0.0178)
ignorehitpause = 1

[State 3005, Shrink]
type = angledraw
trigger1 = var(5) = 3020 && !var(6)
scale = 0.5, 1 -(var(1) * 0.04)
value = 43
ignorehitpause = 1

[State 3005, Shrink]
type = angledraw
trigger1 = var(6)
scale = 0.66, 0.5
value = ifelse(var(5) = 3020, 43, 0)
ignorehitpause = 1

[State 3005, FX]
type = explod
trigger1 = var(6) && !(gametime % 2)
anim = 4308
sprpriority = 4
postype = p1
pos = ifelse(var(5) = 3020, -24, -24), ifelse(var(5) = 3020, 24, 0)
random = 48, 48
vel = -.5 * vel x, -.5 * vel y
accel = 0, 0.125
scale = 0.5, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ownpal = 1

[State 3005, Vel]
type = velset
trigger1 = var(5) = 3000
x = ifelse((time <= 0 && var(2) > 1), 0.5, ifelse(var(6), 8, 4))
y = 0
[State 3005, Vel]
type = velset
trigger1 = var(5) = 3020
x = ifelse((time < 2 && var(2) > 1), 0.8, 5.1)
y = ifelse((time < 2 && var(2) > 1), -.7, -4.8)

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
trigger1 = var(5) = 3000
priority = 4, Hit
attr = S, HP
damage = ceil(30 * (root, fvar(12))), 7
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 2 * (var(2) < 5), 4
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < 5, -10.52, -6), ifelse(var(2) < 5, 0, -4)
ground.cornerpush.veloff = 0
air.velocity = -6, -4
guard.velocity = -12.65
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

[State 3005, Hit]
type = hitdef
trigger1 = var(5) = 3020
priority = 4, Hit
attr = S, HP
damage = ceil(30 * (root, fvar(12))), 7
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 2 * (var(2) < 5), 4
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -8
ground.cornerpush.veloff = 0
air.velocity = -4, -8
guard.velocity = -12.65
fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 1006, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1= (target,movetype=H) && !(target,time)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
pos = (target, const(size.ground.front) -10), -floor(p2dist y)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 5, 3005, 3006)
ignorehitpause = 1

[State 3005, lose hits]
type = varadd
trigger1 = var(5) = 3000
trigger1 = var(1) >= (9 * var(2))
trigger2 = var(5) = 3020
trigger2 = var(1) >= (4 * var(2))
var(2) = 1

[State 3005, End]
type = changestate
trigger1 = var(5) = 3000 && var(1) >= 45
trigger2 = var(5) = 3020 && var(1) >= 20
value = 3007
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -300, 300]

[Statedef 3006]
type = A
physics = N
movetype = I
anim = 1006
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3006, Shrink]
type = angledraw
trigger1 = var(5) = 3000
scale = 0.5, 0.75 -(var(1) * 0.024)
ignorehitpause = 1

[State 3006, Shrink]
type = angledraw
trigger1 = var(5) = 3000 && var(6)
scale = 1, 0.75
ignorehitpause = 1

[State 3006, Shrink]
type = angledraw
trigger1 = var(5) = 3020
scale = 0.5, 0.75 -(var(1) * 0.024)
value = 43
ignorehitpause = 1

[State 3006, Shrink]
type = angledraw
trigger1 = var(6)
scale = 1, 0.75
ignorehitpause = 1

[State 3006, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 3006, End]
type = destroyself
trigger1 = !animtime

[Statedef 3007]
type = A
physics = N
movetype = I
velset = 0.5 * vel x, 0.5 * vel y
ctrl = 0
sprpriority = 4

[State 3007, Anim]
type = changeanim
trigger1 = 0; anim != 1007
value = 1007
elem = animelemno(0)

[State 3007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 -(25 * time), 256
ignorehitpause = 1
[State 3007, Shrink]
type = angledraw
trigger1 = time
scale = 0.5, 0.2 -(time * 0.02)
ignorehitpause = 1

[State 3007, End]
type = destroyself
trigger1 = time >= 10


;====< NEKKETSU HADOU KEN >=
[Statedef 4305]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 4305, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4307;ifelse(var(3), 4306, 4307)
ignorehitpause = 1
[State 4305, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 4305, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 4305, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4305

[State 4305, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 0.5, 12)
y = 0

[State 4305, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4305, Dust]
type = explod
trigger1 = !(time % 6)
anim = 4309
ID = 4309
sprpriority = 4
postype = p1
pos = 0, -ceil(pos y) + 7
scale = 1, 1

[State 4305, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 9
channel = 1
persistent = 0
ignorehitpause = 1

[State 4305, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 4305, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 4305, Hit]
type = hitdef
trigger1 = !var(3)
priority = 4, Hit
attr = S, HP
damage = ceil(280 * root, fvar(12)), 35
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 24
ground.hittime = 24
ground.velocity = -12, -4
ground.cornerpush.veloff = 0
air.type = Low
air.velocity = -12, -4
p2facing = 1
guard.velocity = -12.65
fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 24
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1

[State 4305, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1= (target,movetype=H) && !(target,time)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
pos = (target, const(size.ground.front) -10), -floor(p2dist y)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 4305, End]
type = changestate
trigger1 = movecontact || movereversed
value = 4307
ignorehitpause = 1
[State 4305, End]
type = destroyself
trigger1 = pos x != [ -320, 320]

[Statedef 4306]
type = A
physics = N
movetype = I
anim = 4306
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 4306, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 4306, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0
[State 4306, End]
type = destroyself
trigger1 = !animtime

[Statedef 4307]
type = A
physics = N
movetype = A
anim = 4306
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1
hitcountpersist = 1

[State 4307, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4307, Flash]
type = bgpalfx
trigger1 = !time
time = 25
add = 128, 128, 128
sinadd = -128, -128, -128, 100
[State 4307, slow]
type = pause
trigger1 = time < 8
time = 1

[State 4307, Snd]
type = playsnd
trigger1 = !time
value = 5, 1
ignorehitpause = 1
persistent = 0

[State 4307, Circle]
type = helper
trigger1 = !var(7) && !time
helpertype = normal
stateno = 7251
ID = 7251
name = "Circle"
postype = p1
pos = -10, 0
ownpal = 1
supermovetime = 300

[State 4307, fragment]
type = helper
trigger1 = numhelper(4310) < 16 && (time = [1, 9])
helpertype = normal
stateno = 4310
ID = 4310
name = "Nekketsu Fragment"
postype = p1
pos = -20 + (random % 20), -10 + (random % 20)
size.xscale = ifelse(random < 500, -.5, 0.5)
size.yscale = ifelse(random < 500, -.5, 0.5)
ownpal = 1

[State 4307, fragment]
type = explod
trigger1 = (time = [1, 9])
anim = 4310
sprpriority = 5
postype = p1
pos = -20 + (random % 20), -10 + (random % 20)
vel = -5 + (random / 50.0), -5 + (random / 100.0)
removetime = -2
ownpal = 1
scale = ifelse(random < 500, -.5, 0.5), ifelse(random < 500, -.5, 0.5)

[State 4307, HitSound]
type = playsnd
trigger1 = var(8) = 1 || var(8) = 2
value = 2, ifelse(var(8) = 2, 0, 7)
channel = 2
ignorehitpause = 1
[State 4307, HitSound]
type = varset
trigger1 = 1
var(8) = 0
ignorehitpause = 1

[State 4307, End]
type = destroyself
trigger1 = time >= 16
trigger1 = !numhelper(4310) || time >= 180


;====< NEKKETSU FRAGMENT >=
[Statedef 4310]
type = S
physics = N
movetype = A
anim = 4310
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 4310, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4311
ignorehitpause = 1
[State 4310, HB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4310, Vel]
type = velset
trigger1 = !time && !prevstateno
x = 5 + (random / 100.0)
y = -5 + (random / 100.0)

[State 4310, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1475, HitSound]
type = parentvarset
trigger1 = movecontact = 1
trigger1 = playerIDexist(parent, ID)
var(8) = ifelse(moveguarded, 2, 1)
persistent = 0
ignorehitpause = 1

[State 4310, Hit]
type = hitdef
trigger1 = !movecontact
priority = 4, Hit
attr = S, HP
damage = 7, 2
animtype = Hard
hitflag = MAF
guardflag = M
pausetime = 0, 4
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7, 0
ground.cornerpush.veloff = 0
air.velocity = -12, -4
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
yaccel = 0.5
forcestand = 1
air.fall = 1
fall.recover = 0

[State 4310, HitSpark]
type = Helper
trigger1 = MoveContact = 1 && NumTarget
trigger1= (target,movetype=H) && !(target,time)
helperType = Normal
stateNo = ifElse(MoveGuarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p2
pos = (target, const(size.ground.front) -10), -floor(p2dist y)
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State 4310, End]
type = changestate
trigger1 = movecontact
value = 4311
ignorehitpause = 1
[State 4310, End]
type = destroyself
trigger1 = pos x != [ -300, 300]
trigger2 = !animtime

[Statedef 4311]
type = A
physics = N
movetype = I
ctrl = 0
sprpriority = 4
[State 4311, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1
[State 4311, End]
type = destroyself
trigger1 = time >= 12


;====< HADOUKEN CHARGE >=
[Statedef 1002]
physics = N
velset = 0, 0
anim = 1002
sprpriority = 3
[State 1002, Bind]
type = bindtoroot
trigger1 = 1

[State 1002, Anim]
type = changeanim
trigger1 = root, anim = 1000 && root, animelemtime(10) < 0
trigger1 = animelemtime(3) >= 0
value = anim
elem = 1
[State 1002, Anim]
type = changeanim
triggerall = root, anim = 1000 && root, animelemtime(10) < 0
trigger1 = anim = 1002 && root, var(32) != 1
trigger2 = anim = 1003 && root, var(32) != 2
trigger3 = anim = 1004 && root, var(32) != 3
value = ifelse((root, var(32) = 1), 1002, ifelse((root, var(32) = 2), 1003, 1004))
[State 1002, Anim]
type = changeanim
trigger1 = root, anim = 1000 && root, animelemtime(10) >= 0
trigger1 = animelemtime(3) < 0
value = ifelse((root, var(32) = 1), 1002, ifelse((root, var(32) = 2), 1003, 1004))
elem = 3

[State 1002, No Shadow]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1002, Snd]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 2
[State 1002, Snd]
type = stopsnd
trigger1 = root, stateno != 1000 || root, anim != 1000
trigger2 = !animtime
channel = 2

[State 1002, End]
type = destroyself
trigger1 = root, stateno != 1000 || root, anim != 1000
trigger2 = !animtime


;--- DIAGONAL ---
[Statedef 1024]
physics = N
velset = 0, 0
anim = 1024
sprpriority = 3
[State 1024, Bind]
type = bindtoroot
trigger1 = 1

[State 1024, Anim]
type = changeanim
trigger1 = root, anim = 1020 && root, animelemtime(10) < 0
trigger1 = animelemtime(4) >= 0
value = 1024
elem = 1
[State 1024, Anim]
type = changeanim
trigger1 = root, anim = 1020 && root, animelemtime(10) >= 0
trigger1 = animelemtime(4) < 0
value = 1024
elem = 4

[State 1024, No Shadow]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1024, Snd]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 2
[State 1024, Snd]
type = stopsnd
trigger1 = root, stateno != 1020 || root, anim != 1020
trigger2 = !animtime
channel = 2

[State 1024, End]
type = destroyself
trigger1 = root, stateno != 1020 || root, anim != 1020
trigger2 = !animtime


;--- SHINKUU ---
[Statedef 3004]
physics = N
velset = 0, 0
anim = 3004
sprpriority = 3
[State 3004, Bind]
type = bindtoroot
trigger1 = 1
[State 3004, Anim]
type = changeanim
trigger1 = root, anim = 3000 && animelemtime(4) >= 0
trigger2 = root, anim = 4300 && animelemtime(4) >= 0
value = 3004
elem = 1
[State 3004, Anim]
type = changeanim
trigger1 = root, anim = 3001 && animelemtime(4) < 0
trigger2 = root, anim = 4301 && animelemtime(4) < 0
value = 3004
elem = 4
[State 3004, No Shadow]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3004, Snd]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 2
[State 3004, Snd]
type = stopsnd
trigger1 = root, stateno != 3000 || (root, anim != [3000, 3001])
trigger1 = root, stateno != 4300 || (root, anim != [4300, 4301])
trigger2 = !animtime
channel = 2

[State 3004, End]
type = destroyself
trigger1 = root, stateno != 3000 || (root, anim != [3000, 3001])
trigger1 = root, stateno != 4300 || (root, anim != [4300, 4301])
trigger2 = !animtime


;--- DIAGONAL SHINKUU ---
[Statedef 3024]
physics = N
velset = 0, 0
anim = 1024
sprpriority = 3
[State 3024, Bind]
type = bindtoroot
trigger1 = 1
[State 3024, Anim]
type = changeanim
trigger1 = root, anim = 3020 && animelemtime(4) >= 0
value = 1024
elem = 1
[State 3024, Anim]
type = changeanim
trigger1 = root, anim = 3021 && animelemtime(4) < 0
value = 1024
elem = 4
[State 3024, No Shadow]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3024, Snd]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 2
[State 3024, Snd]
type = stopsnd
trigger1 = root, stateno != 3020 || (root, anim != [3020, 3021])
trigger2 = !animtime
channel = 2

[State 3024, End]
type = destroyself
trigger1 = root, stateno != 3020 || (root, anim != [3020, 3021])
trigger2 = !animtime


;--- NEKKETSU ---
[Statedef 4304]
physics = N
velset = 0, 0
anim = 4304
sprpriority = 3

[State 4304, Bind]
type = bindtoroot
trigger1 = 1
pos = ifelse((root, anim = 4300), -18, 3), ifelse((root, anim = 4300), -63, -55)

[State 4304, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4304, Angle]
type = angleadd
trigger1 = 1
value = 6

[State 4304, Angle]
type = angledraw
trigger1 = 1
ignorehitpause = 1

[State 4304, Snd]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 2

[State 4304, Snd]
type = stopsnd
trigger1 = root, stateno != 4300 || (root, anim != [4300, 4301])
trigger2 = root, anim = 4301 && root, animelemtime(2) >= 0
channel = 2

[State 4304, End]
type = destroyself
trigger1 = root, stateno != 4300 || (root, anim != [4300, 4301])
trigger2 = root, anim = 4301 && root, animelemtime(2) >= 0


;====< HADOUKEN INTRO >=
[Statedef 1003]
physics = N
velset = 0, 0
anim = 1002
sprpriority = 3
[State 1003, Bind]
type = bindtoroot
trigger1 = root, animelemtime(29) < 0
[State 1003, Bind]
type = bindtoroot
trigger1 = root, animelem = 29
pos = 86, -54
[State 1003, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 1003, Anim]
type = changeanim
trigger1 = root, animelemtime(29) < 0
trigger1 = animelemtime(3) >= 0
value = 1002
elem = 1
[State 1003, Anim]
type = changeanim
trigger1 = root, animelemtime(28) >= 0 && root, animelemtime(29) < 0
value = 1002
elem = 3
[State 1003, Anim]
type = changeanim
trigger1 = root, animelemtime(29) >= 0
value = 1005
persistent = 0
[State 1003, Vel]
type = velset
trigger1 = anim = 1005
x = (p2dist x -31) / 7.0
y = 0
persistent = 0

[State 1003, Anim]
type = changeanim
trigger1 = anim = 1005 && p2dist x <= 30
value = 1006
persistent = 0
[State 1003, Vel]
type = velset
trigger1 = anim = 1006
x = 0
y = 0
[State 1003, Snd]
type = playsnd
trigger1 = anim = 1006
value = 5, 1
persistent = 0

[State 1003, Shrink]
type = angledraw
trigger1 = anim = [1005, 1006]
scale = 0.5, 0.4
ignorehitpause = 1

[State 1003, Shrink]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1003, Snd]
type = playsnd
trigger1 = !time
value = 5, 5
channel = 2
[State 1003, Snd]
type = stopsnd
trigger1 = root, stateno != 352
trigger2 = anim = 1006 && !animtime
channel = 2

[State 1003, End]
type = destroyself
trigger1 = root, stateno != 352
trigger2 = anim = 1006 && !animtime


;====< 7251 CIRCLE >=
[Statedef 7251]
physics = N
velset = 0, 0
anim = 9741
[State 7251, palfx]
type = palfx
trigger1 = !time
time = 25
sinadd = -255, -255, -255, 100
[State 7251, Circle]
type = explod
trigger1 = !time
anim = 7251
ID = 7251
sprpriority = 3
postype = p1
removetime = 25
supermovetime = 30
[State 7251, Shrink]
type = modifyexplod
trigger1 = numexplod(7251)
ID = 7251
scale = 0.067 + (0.03 * time), 0.2 + (0.09 * time)
[State 7251, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
flag2 = invisible
ignorehitpause = 1
[State 7251, End]
type = destroyself
trigger1 = !numexplod(7251)


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
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
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
pos = -160 + (40 * time), floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5
trans = addalpha
alpha = (32 * time), 256

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && (time = [8, 50])
ID = 7510
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time >= 50
ID = 7510
postype = back
pos = 160 -(4 * (time -50)), floor((1.3333333 * gameheight / gamewidth) * 120) + (32 * (time -50))
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

;--- --Level 2 -----
[Statedef 7503]
type = A
velset = 0, 0
anim = 7503
sprpriority = 5

[State 7503, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 7503, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 192, 0, 256

[State 7503, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 7503, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7503, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 7503, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 7503, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 7503, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 7504
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 7503, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 7503, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 7503, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 7503, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7503, Circle]
type = explod
trigger1 = time = 24
anim = 7505
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 7503, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7503, Safety]
type = removeexplod
trigger1 = time >= 40

[State 7503, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 3 -----
[Statedef 7506]
type = A
velset = 0, 0
anim = 7506
sprpriority = 5

[State 0, EnvColor]
type = BGPalFX
trigger1 = time <= 45
mul=226,60,60
time = 2
invertall = 0
ignorehitpause = 1
color=0

[State -2,AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
;flag2=nobg
flag2=nobardisplay

[State 5035, 1]
type = Trans
trigger1 = 1
trans = add

[State -2, 1]
type = PalFX
trigger1 = time = 0
time = 1
add = 0,0,0

[State 7506, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 7506, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7506, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 7506, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 7506, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 7506, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 20
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 7506, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 21
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 7506, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 7506, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 7506, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 7506, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 7506, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 7506, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 7506, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 7507
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 7506, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 7506, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 7506, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 7506, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7506, Circle]
type = explod
trigger1 = time = 24
anim = 7508
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 7506, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7506, Safety]
type = removeexplod
trigger1 = time >= 40

[State 7506, End]
type = destroyself
trigger1 = time >= 40

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
pos = -8, 0
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
pos = ceil(-93 + (random / 6.25)), ceil(19 -(random / 6.25))

[State 7243, Particle]
type = explod
trigger1 = (time % 4) = 1
anim = 7243
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x -13) / 16.0), ((rootdist y -61) / 16.0)
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
value = 7, ifelse((root, stateno = [4001, 4002]), 7, 6)
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

[State 7600, Kanji]
type = helper
trigger1 = !time && (root, stateno = [4001, 4002])
helpertype = normal
stateno = 7610
ID = 7610
name = "Haru Kanji"
postype = left
pos = 0, floor((gameheight / gamewidth) * 80) - 60
ownpal = 1

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


;====< HARU KANJI >=
[Statedef 7610]
type = A
physics = N
anim = 9741

[State 7610, Kanji]
type = explod
trigger1 = !time
anim = 7610
ID = 7610
sprpriority = -5
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
bindtime = -1
removetime = 60

[State 7610, Shrink]
type = modifyexplod
trigger1 = time < 6 && numexplod(7610)
ID = 7610
scale = (5.5 - time) * (1.3333333 * gameheight / gamewidth), (5.5 - time) * (1.3333333 * gameheight / gamewidth)

[State 7610, Shrink]
type = modifyexplod
trigger1 = time >= 6 && numexplod(7610)
ID = 7610
scale = 0.5 * (1.3333333 * gameheight / gamewidth), 0.5 * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = ceil(256 - 8 * (time - 6)), 256

[State 7610, Safety]
type = removeexplod
trigger1 = time >= 38

[State 7610, End]
type = destroyself
trigger1 = time && !numexplod(7610)

[State 8600, Text 1]
type = Explod
trigger1 = !Time
anim = 8617
ID = 10
onTop = 1
posType = Left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.55, 0.55 * (1.3333333 * GameHeight / GameWidth)
bindTime = -1
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1

[State 8600, Text 2]
type = Explod
trigger1 = !Time
anim = 8617
ID = 11
onTop = 1
posType = left
pos = 160, floor((1.3333333 * GameHeight / GameWidth) * 120)
scale = 0.55, 0.55 * (1.3333333 * GameHeight / GameWidth)
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


;==< KEI INTRO >==
[Statedef 6000]
type = S
physics = N
anim = 6000
sprpriority = -1
[State 6000, offset]
type = offset
trigger1 = 1
y = -5

[State 6000, Anim]
type = changeanim
trigger1 = anim = 6000 && animelemtime(2) < 0 && root, stateno = 354
trigger1 = root, anim = 354 && root, animelemtime(4) < -1
value = 6000
elem = 1

[State 6000, Anim]
type = changeanim
trigger1 = anim = 6000 && !animtime
value = 6001
[State 6000, steps]
type = playsnd
trigger1 = anim = 6001
trigger1 = animelem = 2 || animelem = 5
value = 0, 100
[State 6000, Turn]
type = turn
trigger1 = anim = 6001
persistent = 0
[State 6000, Vel]
type = velset
trigger1 = anim = 6001
x = 8

[State 6000, Snd]
type = playsnd
trigger1 = anim = 6000 && animelem = 6
value = 6, 0
channel = 0
[State 6000, Snd]
type = playsnd
trigger1 = anim = 6000 && animelem = 13
value = 6, 1
channel = 0
[State 6000, Snd]
type = playsnd
trigger1 = anim = 6001
value = 6, 2
channel = 0
persistent = 0

[State 6000, End]
type = destroyself
trigger1 = anim = 6001
trigger1 = frontedgedist < -50


;==< KEI WIN POSE 1 >==
[Statedef 6002]
type = S
physics = N
anim = 6002
sprpriority = 2
[State 6002, offset]
type = offset
trigger1 = 1
y = 5
[State 6002, steps]
type = playsnd
trigger1 = anim = 6002
trigger1 = animelem = 2 || animelem = 5
value = 0, 100
[State 6002, Vel]
type = velset
trigger1 = anim = 6002
x = 8
[State 6002, Anim]
type = changeanim
trigger1 = anim = 6002 && rootdist x <= 200
value = 6003
[State 6002, Snd]
type = playsnd
trigger1 = anim = 6003
value = 6, 1
channel = 0
persistent = 0
[State 6002, Snd]
type = playsnd
trigger1 = anim = 6003 && animelem = 3
value = 5, 3
[State 6002, Dust]
type = explod
trigger1 = anim = 6003 && animelem = 3
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = 36
ownpal = 1
scale = 0.5, 0.5
[State 6002, Shake]
type = envshake
trigger1 = anim = 6003 && animelem = 3
time = 18
freq = 60
ampl = 4
[State 6002, statetype]
type = statetypeset
trigger1 = anim = 6003 && animelemtime(3) >= 0
statetype = L
physics = C


;==< KEI WIN POSE 2 >==
[Statedef 6004]
type = S
physics = N
anim = 6002
sprpriority = 2
[State 6004, steps]
type = playsnd
trigger1 = anim = 6002
trigger1 = animelem = 2 || animelem = 5
value = 0, 100
[State 6004, Vel]
type = velset
trigger1 = anim = 6002
x = 8
[State 6004, Anim]
type = changeanim
trigger1 = anim = 6002 && rootdist x <= 125
value = 6004
[State 6004, Anim]
type = changeanim
trigger1 = anim = 6004 && root, stateno = 182 && root, anim = 182
value = 6004
elem = root, animelemno(0)
[State 6004, Anim]
type = turn
trigger1 = anim = 6004
persistent = 0
[State 6004, statetype]
type = statetypeset
trigger1 = anim = 6004
physics = S


;==< KEI SHUN GOKU SATSU >==
[Statedef 6010]
type = S
physics = N
anim = 6002
sprpriority = -1

[State 6010, Snd]
type = playsnd
trigger1 = !time
value = 6, 0
channel = 0
persistent = 0
[State 6010, steps]
type = playsnd
trigger1 = anim = 6002
trigger1 = animelem = 2 || animelem = 5
value = 0, 100
[State 6010, Vel]
type = velset
trigger1 = anim = 6002
x = 8

[State 6010, Anim]
type = changeanim
trigger1 = anim = 6002 && root, stateno = 4001 && root, anim = 4001
trigger1 = root, animelemtime(2) < 0 && rootdist x <= 90
value = 6010
[State 4001, grabsnd]
type = playsnd
trigger1 = anim = 6010
value = 0, 800
persistent = 0
[State 6010, Vel]
type = velset
trigger1 = anim = 6010
x = 0
persistent = 0

[State 6010, Bind]
type = bindtoroot
trigger1 = anim = 6010 && root, stateno = 4001 && root, anim = 4001
trigger1 = root, animelemtime(8) < 0
pos = 65, 0
[State 6010, Bind]
type = bindtoroot
trigger1 = anim = 6010 && root, stateno = 4001 && root, anim = 4001
trigger1 = root, animelemtime(8) >= 0
pos = 90, 0

[State 6010, palfx]
type = palfx
trigger1 = root, animelemtime(10) = -1 || root, animelemtime(14) = -1 || root, animelemtime(18) = -1
add = -50, -50, -50
sinadd = -155, -155, -155, 80
mul = 256, 128, 256
color = 0
time = 20
[State 6010, palfx]
type = palfx
trigger1 = root, animelemtime(23) = -1
add = 0, 0, 0
sinadd = 0, 0, 0, 1
time = 1

[State 6010, End]
type = changestate
trigger1 = anim = 6010 && (root, stateno != 4001 || root, anim != 4001)
value = 6011 
[State 6010, End]
type = changestate
trigger1 = anim = 6010 && root, stateno = 4001 && root, anim = 4001
trigger1 = root, animelemtime(23) >= -1
value = 6012


[Statedef 6011]
type = S
physics = N
anim = 6002
sprpriority = -1
[State 6011, Snd]
type = playsnd
trigger1 = !time
value = 6, 2
channel = 0
persistent = 0
[State 6011, Turn]
type = turn
trigger1 = !time
[State 6011, steps]
type = playsnd
trigger1 = animelem = 2 || animelem = 5
value = 0, 100
[State 6011, Vel]
type = velset
trigger1 = 1
x = 8
[State 6011, End]
type = destroyself
trigger1 = frontedgedist < -50


[Statedef 6012]
type = S
physics = N
anim = 6012
sprpriority = -3
[State 6012, Vel]
type = velset
trigger1 = anim = 6012
x = 0

[State 6012, Anim]
type = changeanim
trigger1 = anim = 6012 && !animtime
value = 6002
[State 6012, steps]
type = playsnd
trigger1 = anim = 6002
trigger1 = animelem = 2 || animelem = 5
value = 0, 100
[State 6012, Turn]
type = turn
trigger1 = anim = 6002
persistent = 0
[State 6012, Vel]
type = velset
trigger1 = anim = 6002
x = 8

[State 6012, Snd]
type = playsnd
trigger1 = anim = 6012 && animelem = 5
value = 6, 1
channel = 0
[State 6012, Snd]
type = playsnd
trigger1 = anim = 6002
value = 6, 2
channel = 0
persistent = 0

[State 6012, End]
type = destroyself
trigger1 = anim = 6002
trigger1 = frontedgedist < -50


;====< SHOE >=
[Statedef 1475]
type = A
physics = N
movetype = A
ctrl = 0
velset = 6, 2
sprpriority = 3
anim = 1475

[State 1475, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1476
ignorehitpause = 1
[State 1475, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NA, SA, HA, NP, SP, HP
ignorehitpause = 1

[State 1475, Vel]
type = veladd
trigger1 = 1
y = 0.5
[State 1475, Dust]
type = explod
trigger1 = pos y >= -ceil(vel y) && time <= 20
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
scale = 0.25, 0.25
ownpal = 1
[State 1475, Vel]
type = velmul
trigger1 = pos y >= -ceil(vel y)
x = 0.5
y = -.5

[State 1475, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 4
persistent = 0
ignorehitpause = 1

[State 1475, Hit]
type = hitdef
trigger1 = 1
priority = 1, Hit
attr = A, SP
damage = ceil(14 * root, fvar(12)), 7
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 4
sparkno = -1
guard.sparkno = -1 + 0*(var(34):=8001)
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, 0
ground.cornerpush.veloff = 0
air.velocity = -2, -2
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
kill = 0
forcestand = 1

[State 1475, Sparks]
type = explod
trigger1 = movehit && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = 7020 + (random % 8)
ID = 7000
sprpriority = 5
postype = left
pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
removetime = -2
ownpal = 1
facing = -1
ignorehitpause = 1
persistent = 0
pausemovetime = 147
supermovetime = 147

[State 1475, End]
type = changestate
trigger1 = movecontact || time >= 60
trigger2 = vel y <= 1 && pos y >= -1
value = 1476
ignorehitpause = 1
[State 1475, End]
type = destroyself
trigger1 = frontedgedist < -50 || backedgedist < -50

[Statedef 1476]
type = A
physics = N
movetype = I
ctrl = 0
velset = -vel x, vel y
sprpriority = 4
[State 1476, Anim]
type = changeanim
trigger1 = vel y <= 1 && pos y >= -1
value = 6092
[State 1476, Pos]
type = posset
trigger1 = anim = 6092
y = 0
[State 1476, Vel]
type = velset
trigger1 = anim = 6092
x = 0
y = 0
[State 1476, Dust]
type = explod
trigger1 = anim = 6092
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
scale = 0.25, 0.25
ownpal = 1
persistent = 0
[State 1476, Vel]
type = veladd
trigger1 = 1
y = 0.5
[State 1476, Vel]
type = velmul
trigger1 = pos y >= -ceil(vel y)
x = 0.5
y = -.5
[State 1476, Fade]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -8.53 * time), ceil(8.53 * time)
[State 1476, End]
type = destroyself
trigger1 = time >= 30


;--- WIN POSE ---
[Statedef 6091]
physics = N
velset = 0, 0
anim = 6091
sprpriority = 2
[State 6091, Vel]
type = velset
trigger1 = time = 1
x = -(rootdist x -4) / -68.0
y = -5
[State 6091, Accel]
type = veladd
trigger1 = time
y = 0.15
[State 6091, Vel]
type = velset
trigger1 = anim = 6091 && vel y > 0 && rootdist y <= 90
x = 1.5 * vel x
y = -.5 * vel y
persistent = 0
[State 6091, Anim]
type = changeanim
trigger1 = anim = 6091 && vel y > 0 && pos y >= -10
value = 6092
[State 6091, Pos]
type = posset
trigger1 = anim = 6092
y = 0
[State 6091, Vel]
type = velset
trigger1 = anim = 6092
x = 0
y = 0
[State 6091, Dust]
type = explod
trigger1 = anim = 6092
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
scale = 0.25, 0.25
ownpal = 1
persistent = 0


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



;Jump dust
[Statedef 8100]
type = S
anim = 9742
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


;Dash dust
[Statedef 8103]
type = A
anim = 9742
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
anim = 9742
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

;WALL IMPACT DUST
[StateDef 8111]
type = A
anim = 9742
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

;FLAMES
[Statedef 8150]
type = A
velset = 0, 0
anim = 9742

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

;RECOVER FX
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


;COUNTER FX
[Statedef 8290]
type = A
physics = N
velset = 0, 0
anim = 9742

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

;MAX MODE TEXT FX
[StateDef 8291]
type = A
physics = N
velSet = 0,0
anim = 9742

[State 8291, "Power Up!" Text Explod]
type = Explod
trigger1 = !NumExplod(8291)
anim = 8291
ID = 8291
sprPriority = 64
posType = P1
facing = Facing
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8291, Scale]
type = ModifyExplod
trigger1 = Time < 8
ID = 8291
scale = 0.5, .5
trans = AddAlpha
alpha = 256,0

[State 8291, Scale]
type = ModifyExplod
trigger1 = Time >= 8
ID = 8291
scale = 0.5 + 0.0625 * (Time - 8), 0.5 + 0.0625 * (Time - 8)
trans = AddAlpha
alpha = 256 - 32 * (Time - 8), 32 * (Time - 8)

[State 8291, Safety]
type = RemoveExplod
trigger1 = Time >= 16

[State 8291, End]
type = DestroySelf
trigger1 = Time >= 16

;POWER CHARGE MAIN FX 
[Statedef 8330]
type = A
physics = N
movetype = I
anim = 9742
ctrl = 0
velset = 0, 0

[State 8330, Bind]
type = bindtoroot
trigger1 = (root, stateno = 740)
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
trigger1 = root, stateno != 740
channel = 0

[State 8330, End]
type = removeexplod
trigger1 = root, stateno != 740

[State 8330, End]
type = destroyself
trigger1 = root, stateno != 740


;POWER CHARGE Particles 
[Statedef 8331]
type = A
physics = N
movetype = I
anim = 9742
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
trigger1 = root, stateno != 740

[State 8331, End]
type = destroyself
trigger1 = root, stateno != 740


;ZERO COUNTER PAUSE
[Statedef 8350]
type = A
physics = N
movetype = I
anim = 9742
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


;CUSTOM COMBO
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
anim = 9742

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
type = VarSet
trigger1= !Time && Root, var(23) = 900
var(0) = 1

[State 8600, Move Name: Haoh Shokoken]
type = varset
trigger1 = !time && (root, var(23) = [3000, 3099])
var(0) = 2

[State 8600, Move Name: Ryuko Ranbu]
type = varset
trigger1 = !time && (root, var(23) = [3100, 3199])
var(0) = 3

[State 8600, Move Name: Tenchi Haohken]
type = varset
trigger1 = !time && (root, var(23) = [4100, 4199])
var(0) = 4

[State 8600, Move Name: Tenchi Haohken]
type = varset
trigger1 = !time && (root, var(23) = [3200, 3299])
var(0) = 5

[State 8600, Move Name: Tenchi Haohken]
type = varset
trigger1 = !time && (root, var(23) = [4200, 4299])
var(0) = 6

[State 8600, Move Name: Tenchi Haohken]
type = varset
trigger1 = !time && (root, var(23) = [4000, 4099])
var(0) = 7

[State 8600, Move Name: Tenchi Haohken]
type = varset
trigger1 = !time && (root, var(23) = [4300, 4399])
var(0) = 8

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

;====<CAMERA CONTROL>=
[StateDef 8999]
type = S
velSet = 0,0
anim = 9741

[State 8999, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 1,1

[State 8999, End]
type = DestroySelf
trigger1 = RoundState = 2
;----------------------------------------------------------------------------
;Black Fade Out
[Statedef 9550]
physics=N
anim=9741
Sprpriority=-9999

[State 9550, Assert]
type = AssertSpecial
trigger1=1
flag=nobardisplay
Flag2=NoFG 
ignorehitpause = 1

[State 3055, bgpal]
type = bgpalfx
trigger1 = 1
mul = 512, 0, 0
time = 2
add = -70, -70, -70
color = 0
ignorehitpause = 1


[State 9550, Assert]
type=trans
trigger1=1
trans=addalpha
alpha=0+32*time, 256-32*time
ignorehitpause=1

[State 9550, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
[State 9550, PosSet]
type = PosSet
trigger1 =1
x =ceil(pos x-GameHeight / GameWidth)
y =ceil(pos y-GameHeight / GameWidth)
ignorehitpause=1
[State 9550, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 9550, end]
type=destroyself
trigger1 = root,MoveType = H
[State 9550, ChangeState]
type = ChangeState
trigger1 =root,stateno=4005&&root,animelemtime(11)>=1
value =9551
;-------------------------------------------------------------------------------
;Black Fade Out
[Statedef 9552]
physics=N
anim=9550
Sprpriority=-9999

[State 9552, Assert]
type = AssertSpecial
trigger1=1
flag=nobardisplay
Flag2=NoFG 
ignorehitpause = 1

[State 9552, Assert]
type=trans
trigger1=1
trans=addalpha
alpha=0+32*time, 256-32*time
ignorehitpause=1

[State 9552, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
[State 9550, PosSet]
type = PosSet
trigger1 =1
x =ceil(pos x-GameHeight / GameWidth)
y =ceil(pos y-GameHeight / GameWidth)
ignorehitpause=1
[State 9552, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 9552, end]
type=destroyself
trigger1 = root,MoveType = H
[State 9552, ChangeState]
type = ChangeState
trigger1 =root,stateno=3610&&root,animelemtime(83)>=1
value =9551
;------------------------------------------------------------------------------
;Black Fade Out
[Statedef 9553]
physics=N
anim=9741
Sprpriority=-9999

[State 9550, Assert]
type = AssertSpecial
trigger1=1
flag=nobardisplay
Flag2=NoFG 
ignorehitpause = 1

[State 3055, bgpal]
type = bgpalfx
trigger1 = 1
mul = 512 -ceil(10 * time),512 -ceil(10 * time),512 -ceil(10 * time)
time = 2
add = (-20 + 5 * time),0,0
color = ceil(18 * time)
ignorehitpause = 1



[State 9550, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
[State 9550, PosSet]
type = PosSet
trigger1 =1
x =ceil(pos x-GameHeight / GameWidth)
y =ceil(pos y-GameHeight / GameWidth)
ignorehitpause=1
[State 9550, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 9550, end]
type=destroyself
trigger1 = root,MoveType = H
[State 9550, ChangeState]
type = ChangeState
trigger1 =root,stateno=4001&&root,time >= 70
value =9551
;-------------------------------------------------------------------------------
;Black Fade Out
[Statedef 9551]
physics=N

[State 9551, Assert]
type = AssertSpecial
trigger1=1
flag=NoFG 
ignorehitpause = 1
[State 9551, Assert]
type=trans
trigger1=1
trans=addalpha
alpha=256-16*time, 0+16*time
ignorehitpause=1


[State 9551, ScreenBound]
type = ScreenBound
trigger1 =1
value = 1
[State 0, PosSet]
type = PosSet
trigger1 =1
x =ceil(pos x-GameHeight / GameWidth)
y =ceil(pos y-GameHeight / GameWidth)
ignorehitpause=1
[State 9551, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 9551, end]
type=destroyself
trigger1 =time>=32

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;---------------------------------------------------------------------------
;CAMERA FOCUS
[Statedef 6001]
type = S
physics = S
anim = 0
ctrl = 0

[state 6001,TURN]
type=turn
trigger1=ishelper(6001)
trigger1=facing!=root,facing
ignorehitpause=1

[State 6001,vel]
type = VelSet
trigger1 = parent,pos X > 0
x = ifelse(facing = 1,4,-4)
[State 6001,vel]
type = VelSet
trigger1 = parent,pos X < 0
x = ifelse(facing = 1,-4,4)
[State 6001,vel]
type = VelSet
trigger1 = parent,pos X = [-5,5]
x = 0

[State 6001, WIDTH]
type = Width
trigger1 = 1
value = 1,1

[State 6001, NHB]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 6001,AS]
type = AssertSpecial
Trigger1 = 1
flag = invisible
flag2 = noshadow

[State 6001,Bound]
type = ScreenBound
trigger1 =1
value =1
movecamera = 320,0
[State 6001,push]
type = PlayerPush
trigger1 =1
value = 0

[State 6001, Destroyself]
type = destroyself
trigger1 = Time = 50
trigger1 = enemy, Life >= 1
trigger2=numhelper(6001)>=2