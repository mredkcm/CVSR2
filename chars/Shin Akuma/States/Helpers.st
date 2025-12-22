; ________________________________________
;| Gouki by Phantom.of.the.Server and Mwryly |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;
;===HELPER STATES===
;

;JUMP DUST
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

;HADOU KEN
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
[State 1005, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 1005, timevar]
type = varadd
trigger1 = time && var(11) < 25
var(11) = 1

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

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = 2, ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1005, Hit]
type = hitdef
trigger1 = !(root, var(1))
trigger1 = !(root, var(27))
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse((root, fvar(12)) * 56 < 7, 7, (root, fvar(12)) * 56)), 7
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -10.52, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
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
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1005, Hit]
type = hitdef
trigger1 = (root, var(1))
trigger1 = !(Root, var(16)) && (Root, var(15) < 2 || Root, var(20))
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse((root, fvar(12)) * ifelse(var(11) <= 12, 68, 54) < 7, 7, (root, fvar(12)) * ifelse(var(11) <= 12, 68, 54))), 7
;damage = ceil(ifelse(var(11) <= 12, 68, 54) * root, fvar(12)), 7
animtype = Hard
fall.animtype = Hard
air.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12 / ((root, var(20) > 0) + 1)
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(11) <= 12, -4, -10.52), ifelse(var(11) <= 12, -4, 0)
ground.cornerpush.veloff = 0
air.velocity = -.75 * vel x, -4
fall = var(11) <= 12
air.fall = 1
fall.recover = 1
fall.recovertime = 120
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
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1005, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag = 

;[State 1005, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = (target, movetype = H) && !(target, time)
;anim = 7020 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

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
persistent = 1
ignoreHitPause = 1

[State 1005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1006
ignoreHitPause = 1

[State 1005, End]
type = destroyself
trigger1 = pos x != [ -300, 300]

[Statedef 1006]
type = A
physics = N
movetype = I
anim = 3006
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1006, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
;[State 1006, Snd]
;type = playsnd
;trigger1 = !time
;value = 5, 1
;ignorehitpause = 1
;persistent = 0
[State 1006, End]
type = destroyself
trigger1 = !animtime


;EX HADOU KEN
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
stateno = ifelse(var(2) < 2, 1015, 1016)
ignorehitpause = 1
[State 1015, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1015, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 4
[State 1015, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 1005

[State 1015, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1015, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1015, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 7)
y = 0

[State 1015, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = 2, ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitPause = 1

[State 1015, Hit]
type = hitdef
trigger1 = !(root, var(27))
trigger1 = !(root, var(16)) && ((root, var(15) < 1) || (root, var(20)))
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse((root, fvar(12)) * 42 < 7, 7, (root, fvar(12)) * 42)), 7
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 4, 10;10 * (var(2) < 1), 12
sparkno = -1
guard.sparkno = -1;s7001
sparkxy = -10, 0
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity =  -6, ifelse(var(2)>1,-4,0)
ground.cornerpush.veloff = 0
air.velocity = -6, -4
fall = var(2)>1
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
;palfx.sinadd = 64, 64, 64, 4
;palfx.mul = 128, 128, 128
;palfx.time = 32
sprpriority = 4
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1015, Miss]
type = hitdef
trigger1 = numenemy
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, SP
hitflag =

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

;[State 1015, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = (target, movetype = H) && !(target, time)
;anim = 7020 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

[State 1005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1015, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 2, 1015, 1016)

[State 1005, ChangeState]
type = ChangeState
trigger1 = MoveReversed
value = 1016
ignoreHitPause = 1

[State 1015, End]
type = destroyself
trigger1 = pos x != [ -300, 300]

[Statedef 1016]
type = A
physics = N
movetype = I
anim = 3006
ctrl = 0
velset = 0, 0
sprpriority = 4
;[State 1016, Snd]
;type = playsnd
;trigger1 = !time
;value = 5, 1
;ignorehitpause = 1
;persistent = 0
[State 1016, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1016, End]
type = destroyself
trigger1 = !animtime


;SHAKUNETSU HADOU KEN
[Statedef 1025]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1025, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = root, var(10)
[State 1025, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 1025

[State 1025, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < var(10), 1025, 1026)
ignorehitpause = 1
[State 1025, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1025, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1025, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1025, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, ifelse(var(10) = 3, 7, ifelse(var(10) = 2, 5.25, 3.5)))
y = 0

[State 1025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1025, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = 2, ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitpause = 1

[State 1025, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < var(10)+1 || Root, var(20))
priority = 4, Hit
attr = S, SP
damage = ceil(ifelse((root, fvar(12)) * ifelse(var(10) = 1, 68, ifelse(var(10) = 2, 37, 27)) < 7, 7, (root, fvar(12)) * ifelse(var(10) = 1, 68, ifelse(var(10) = 2, 37, 27)))), 7
;damage = ceil(ifelse(var(10) = 1, 68, ifelse(var(10) = 2, 37, 27)) * root, fvar(12)), 7
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < var(10)), 6
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1;s7001
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4.5, -3
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4.5, -3
fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 32
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

;[State 1025, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = !(target, time) && target, movetype = H
;anim = 7020 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

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

[State 1025, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
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
persistent = 1
ignoreHitPause = 1

[State 1025, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1025, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1025, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1025, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < var(10), 1025, 1026)
[State 1025, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

[Statedef 1026]
type = A
physics = N
movetype = I
anim = 1026
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 1026, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
[State 1026, Snd]
type = playsnd
trigger1 = !time
value = 5, 2
ignorehitpause = 1
persistent = 0
[State 1026, End]
type = destroyself
trigger1 = !animtime

;==<EX SHAKUNETSU HADOUKEN>====
[Statedef 1035]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1025, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = root, var(10)
[State 1025, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 1025

[State 1025, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 3, 1035, 1036)
ignorehitpause = 1
[State 1025, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1025, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 1025, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1025, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1,8);ifelse((time < 2 && var(2) > 1), 1, ifelse(var(10) = 3, 7, ifelse(var(10) = 2, 5.25, 3.5)))
y = 0

[State 1025, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1025, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = 2, ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitpause = 1

[State 1025, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < ifelse(var(2) > 2, 6, 4) || Root, var(20))
priority = 4, Hit
attr = S, SP
;damage = 41,9;ceil(ifelse(var(10) = 1, 68, ifelse(var(10) = 2, 37, 27)) * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * 41 < 7, 7, (root, fvar(12)) * 41)), 8
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < 3), 6
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1;s7001
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4.5, ifelse((var(2) < 3),0,-4.2)
ground.cornerpush.veloff = 0
guard.velocity = -10.52
air.velocity = -4.5, -4.2
fall = (var(2) = 3)
fall.recover = 1
fall.recovertime = 120
getpower = 0, 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
palfx.color = 32
palfx.sinadd = 80, 25, 0, 8
palfx.mul = 512, 256, 128
palfx.time = 32
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

;[State 1025, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = !(target, time) && target, movetype = H
;anim = 7020 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

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

[State 1025, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7180) < 1
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
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

[State 1035, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1035, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1035, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1025, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 3, 1035, 1036)
[State 1025, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

[Statedef 1036]
type = A
physics = N
movetype = I
anim = 1026
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 1036, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
[State 1036, Snd]
type = playsnd
trigger1 = !time
value = 5, 2
ignorehitpause = 1
persistent = 0
[State 1036, End]
type = destroyself
trigger1 = !animtime

;====<ZANKUU HADOUKEN
[Statedef 1055]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1056
ignorehitpause = 1
[State 1055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1055, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1055, Vel]
type = velset
trigger1 = (!(root, var(1)) && !(root, var(42)) || (root, var(1)) && !(root, var(43)));!(root, var(1))
trigger1 = var(10) != 4
x = ifelse(var(10) = 3,  3.73, ifelse(var(10) = 2, 2.62, 1.29))
y = ifelse(var(10) = 3,  3.73, ifelse(var(10) = 2, 4.84, 5.15))

[State 1055, Vel]
type = velset
trigger1 = (!(root, var(1)) && (root, var(42)) || (root, var(1)) && (root, var(43)));(root, var(1))
trigger1 = var(10) != 4
x = ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3, 2))
y = ifelse(var(10) = 3, 4, ifelse(var(10) = 2, 3, 2))

[State 1055, Vel]
type = velset
trigger1 = !(root, var(1)); || ((root, var(1)) && (root, var(43)))
trigger1 = var(10) = 4
x = 4
y = 4

[State 1055, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 3, 1055, ifelse(var(10) = 2, 1056, 1057))

[State 1055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1055, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = 2, ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1055, Hit]
type = hitdef
trigger1 = var(10)!= 4
trigger1 = !(root, var(27))
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
ID = 1055
priority = 4, Hit
attr = A, SP
;damage = ceil(ifelse(var(1) = 1, 32, 47) * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * ifelse(var(1), 32, 47) < 7, 7, (root, fvar(12)) * ifelse(var(1), 32, 47))), 7
animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, ifelse(var(1) = 1, 8, 12)
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1;s7001
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7.51, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -5, 5
down.hittime = 20
down.velocity = 0, 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = ifelse(var(10)=4,0,ifelse(p2movetype = H, 72, 144)) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
yaccel = 0.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 1055, Hit]
type = hitdef
trigger1 = var(10) = 4
trigger1 = !(root, var(27))
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
ID = 1075
priority = 4, Hit
attr = A, SP
damage = ceil(ifelse((root, fvar(12)) * 50 < 7, 7, (root, fvar(12)) * 50)), 7
animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1;s7001
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7.51, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -5, -1;-vel x, vel y
down.hittime = 20
down.velocity = 0, 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = ifelse(var(10)=4,0,ifelse(p2movetype = H, 72, 144)) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
yaccel = 0.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 7509, spin]
type=angleadd
trigger1 = (!(root, var(1)) && !(root, var(42)) || (root, var(1)) && !(root, var(43)));!(root, var(1))
trigger1 = var(10)!= 4 && !time
value= ifelse(var(10) = 3, -4, ifelse(var(10) = 2, -18, -34))

[State 7509, spin]
type=angleadd
trigger1 = (!(root, var(1)) && !(root, var(42)) || (root, var(1)) && !(root, var(43)));!(root, var(1))
trigger1 = var(10) = 4 && !time
value= -8

[State 7509, spin]
type=angledraw
trigger1= 1
scale=1,1

;[State 1055, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = !(target, time) && target, movetype = H
;anim = 7020 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

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
persistent = 1
ignoreHitPause = 1

[State 1055, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1055, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1055, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1055, End]
type = changestate
trigger1 = movecontact
value = 1056
ignorehitpause = 1
[State 1055, End]
type = changestate
trigger1 = pos y >= 0
value = 1057
ignorehitpause = 1
[State 1055, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

[Statedef 1056]
type = A
physics = N
movetype = I
anim = 3056
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1
[State 1056, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 7509, spin]
type=angleadd
trigger1= time = 0
value= var(10);ifelse(var(10)=4, -4, ifelse(var(10) = 3, -2, ifelse(var(10) = 2, -9, -13)))
[State 7509, spin]
type=angledraw
trigger1= 1
scale=1,1
[State 1056, VelSet]
type = VelSet
trigger1 = prevstateno = 3075
x = 2.4
y = 2.4
ignorehitpause = 1
[State 1056, End]
type = destroyself
trigger1 = !animtime

[Statedef 1057]
type = A
physics = N
movetype = I
anim = 3057
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 1057, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 1057, Pos]
type = posset
trigger1 = 1
y = 0
[State 1057, Snd]
type = playsnd
trigger1 = !time
value = 5, 3
ignorehitpause = 1
persistent = 0
[State 1057, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -2
pos = 0, 0
vel = 0, 0
removetime = -2
ownpal = 1
scale = 0.75, 0.75
pausemovetime = -1
supermovetime = -1
[State 1057, End]
type = destroyself
trigger1 = !animtime

;=<EX ZANKUU HADOUKEN>====
[Statedef 1065]
type = A
physics = N
movetype = A
anim = 1057
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1056
ignorehitpause = 1
[State 1055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1055, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)
[State 1055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 1055, Vel]
type = velset
trigger1 = !(root, var(1))
x = 2.62;1.54;ifelse(var(10) = 3, 2.8, ifelse(var(10) = 2, 1.96, 1.12))
y = 4.84;4.62;ifelse(var(10) = 3, 2.8, ifelse(var(10) = 2, 3.64, 4.48))

[State 1055, Vel]
type = velset
trigger1 = (root, var(1))
x = ifelse(var(10) = 3, 4.12, ifelse(var(10) = 2, 3.62, 2.5))*0.92
y = ifelse(var(10) = 3, 3.37, ifelse(var(10) = 2, 4.25, 5.15))*0.92


[State 1055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1065, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = 2, ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 1055, Hit]
type = hitdef
trigger1 = !(root, var(27))
trigger1 = !(Root, var(16)) && (Root, var(15) < 1 || Root, var(20))
ID = 1075
priority = 4, Hit
attr = A, SP
;damage = ceil(ifelse(var(1) = 1, 32, 60) * root, fvar(12)), 7
damage = ceil(ifelse((root, fvar(12)) * ifelse(var(1) = 1, 32, 50) < 7, 7, (root, fvar(12)) * ifelse(var(1) = 1, 32, 50))), 7
animtype = Back
fall.animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1;s7001
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -7.51, 0
guard.velocity = -10.52
ground.cornerpush.veloff = 0
air.velocity = -5, -1;-vel x, vel y
down.hittime = 20
down.velocity = 0, 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0;ifelse(p2movetype = H, 72, 144) * !(root, var(20)), 36 * !(root, var(20))
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 4
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
yaccel = 0.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

[State 7509, spin]
type=angleadd
trigger1 = (root, var(1)!= 1)
trigger1 = !time
value= -18

[State 7509, spin]
type=angleadd
trigger1 = (root, var(1) = 1)
trigger1 = var(10)!= 4 && !time
value= ifelse(var(10) = 3, 5, ifelse(var(10) = 2, -8, -25))
[State 7509, spin]
type=angledraw
trigger1= 1
scale=1,1

;[State 1055, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = !(target, time) && target, movetype = H
;anim = 7020 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

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

[State 1055, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1055, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 1055, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 1055, End]
type = changestate
trigger1 = movecontact
value = 1056
ignorehitpause = 1
[State 1055, End]
type = changestate
trigger1 = pos y >= 0
value = 1057
ignorehitpause = 1
[State 1055, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;MESSATSU GOU HADO
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
stateno = ifelse(var(2) < ifelse((root, var(1)), 8, 5), 3005, 3006)
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
trigger1 = time && var(4) < 25
var(4) = 1

[State 3005, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 7)
y = 0

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitpause = 1

[State 3005, Hit]
type = hitdef
trigger1 = (root, var(17)!= 2) && !(root, var(1))
trigger1 = !(root, var(16)) && (root, var(15) < 6)
trigger2 = (root, var(17) = 2) && !(root, var(1))
trigger2 = !(root, var(16)) && (root, var(15) < 10 - var(4))
trigger3 = (root, var(1))
trigger3 = !(root, var(16)) && (root, var(15) < 10)
priority = 4, Hit
attr = S, HP
;damage = ceil(ifelse(fvar(12) * ifelse((root, var(1)), 28, 34) < 7, 7, fvar(12) * ifelse((root, var(1)), 28, 34))), 7
damage = ceil(ifelse((root, fvar(12)) * ifelse((root, var(1)), 22, 29) < 7, 7, (root, fvar(12)) * ifelse((root, var(1)), 22, 29))), 8
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < ifelse((root, var(1)), 8, 5)), 6
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1;s7001
hitsound = -1
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, -5
ground.cornerpush.veloff = 0
air.velocity = -6, -5
guard.velocity = -10.52
fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

[State 3005, Miss]
type = hitdef
trigger1 = numenemy && (root, var(1) <= 1)
trigger1 = (enemynear, stateno = [5070, 5071])
attr = S, HP
hitflag =

;[State 3005, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = !(target, time) && target, movetype = H
;anim = 7030 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

[State 3005, hitspark]
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

[State 3005, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3005, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3005, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3005, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < ifelse((root, var(1)), 8, 5), 3005, 3006)
[State 3005, End]
type = destroyself
trigger1 = pos x != [ -280, 280]

[Statedef 3006]
type = A
physics = N
movetype = I
anim = 3006
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 3006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3006, VelSet]
type = VelSet
trigger1 = prevstateno!= 3005
trigger1 = prevstateno = 3025
x = 4.3
ignorehitpause = 1
[State 3006, Snd]
type = PlaySnd
trigger1 = !time
value = 2, ifElse(MoveGuarded, 0, 7)
channel = 3
persistent = 0
ignorehitpause = 1
[State 3006, End]
type = destroyself
trigger1 = !animtime

;MESSATSU GOU HADO AGYO===
[Statedef 3025]
type = A
physics = N
movetype = A
anim = 3025
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3075, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3006
ignorehitpause = 1
[State 3075, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3075, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 6
[State 3075, movehitvar]
type = varset
triggerall = !var(3)
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
trigger2 = numhelper(3025)
trigger2 = helper(3025), var(3)
var(3) = 1
ignorehitpause = 1

[State 1005, timevar]
type = varadd
trigger1 = time && var(11) < 25
var(11) = 1

[State 3075, vel1]
type = velset
trigger1 = !time && (rootdist x > 48)
x = 4 + random / 333.3
y = -0.85 + random / 333.7
[State 3075, vel2]
type = velset
trigger1 = !time && (rootdist x <= 48)
x = 8 + random / 333.3
y = -1.15 + random / 333.3
;x = y * 1.425

[State 3075, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3025, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = 2, ifElse(MoveGuarded, 0, 7)
channel = 3
ignorehitPause = 1

[State 3075, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < 20)
priority = 4, Hit
attr = S, HP
damage = ceil(ifelse((root, fvar(12)) * 14 < 7, 7, (root, fvar(12)) * 14)), 4
;damage = ceil(21 * root, fvar(12)), 4
animtype = Hard
fall.animtype = Back
hitflag = MAF
guardflag = MAF
pausetime = 0, ifelse(var(11)<= 2, 5, 3)
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1;s7001
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -4
ground.cornerpush.veloff = 0
air.velocity = -3, -5
down.hittime = 20
down.velocity = 0, 0
fall = 1
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

;[State 3075, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = !(target, time) && target, movetype = H
;anim = 7030 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

[State 3005, hitspark]
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
persistent = 1
ignoreHitPause = 1

[State 3025, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3025, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3025, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3075, End]
type = changestate
trigger1 = movecontact
value = 3006
ignorehitpause = 1
[State 3075, End]
type = destroyself
trigger1 = pos x != [ -240, 240]

;TENMA GOU ZANKUU
[Statedef 3055]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < ifelse((root, var(1)), 8, 5), 3055, 3056)
ignorehitpause = 1
[State 3055, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 5
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3055

[State 3055, hitvar]
type = varadd
trigger1 = !time
var(2) = 1
[State 3055, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1

[State 3055, Vel]
type = velset
trigger1 = 1
x = ifelse((time < 2 && var(2) > 1), 1, 5.4)
y = ifelse((time < 2 && var(2) > 1), 1, 5.4)

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
trigger1 = !(Root, var(16)) && (Root, var(15) < ifelse((root, var(1)), 10, 6) || Root, var(20))
priority = 4, Hit
attr = A, HP
;damage = ifelse((root, var(1)), ceil(28 * root, fvar(12)), ceil(35 * root, fvar(12))), 8
;damage = ceil(ifelse(fvar(12) * ifelse((root, var(1)), 24, 30) < 7, 7, fvar(12) * ifelse((root, var(1)), 24, 30))), 7
damage = ceil(ifelse((root, fvar(12)) * ifelse((root, var(1)), 23, 29) < 7, 7, (root, fvar(12)) * ifelse((root, var(1)), 23, 29))), 8
animtype = Back
hitflag = MAF
guardflag = MA
pausetime = 4 * (var(2) < ifelse((root, var(1)), 8, 5)), 6
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1;ls7001
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(var(2) < ifelse((root, var(1)), 8, 5), -10.52, -4), ifelse(var(2) < ifelse((root, var(1)), 8, 5), 0, -2)
ground.cornerpush.veloff = 0
air.velocity = -4, -2
guard.velocity = -10.52
fall = (var(2) >= ifelse((root, var(1)), 8, 5))
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1

;[State 3055, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = !(target, time) && target, movetype = H
;anim = 7030 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

[State 3005, hitspark]
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

[State 3055, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1 && (root, var(1) != 1)
trigger1 = !(target, time) && (target, movetype = H) && !var(16)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1

[State 3055, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3055, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3055, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3055, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < ifelse((root, var(1)), 8, 5), 3055, 3056)
[State 3055, End]
type = changestate
trigger1 = pos y >= 0
value = 3057
ignorehitpause = 1
[State 3055, End]
type = destroyself
trigger1 = pos x != [ -280, 280]

[Statedef 3056]
type = A
physics = N
movetype = I
anim = 3056
ctrl = 0
velset = 0, 0
sprpriority = 4
[State 3056, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3056, Snd]
type = playsnd
trigger1 = !time
value = 2, 7
channel = 3
ignorehitpause = 1
persistent = 0
[State 3056, End]
type = destroyself
trigger1 = !animtime

[Statedef 3057]
type = A
physics = N
movetype = I
anim = 3057
velset = 0, 0
ctrl = 0
sprpriority = 4
[State 3057, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3057, Pos]
type = posset
trigger1 = 1
y = 0
[State 3057, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5, 3
ignorehitpause = 1
persistent = 0
[State 3057, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -2
pos = 0, 0
vel = 0, 0
removetime = -2
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 3057, End]
type = destroyself
trigger1 = !animtime

;TENMA GOU ZANKUU AGYO
[Statedef 3075]
type = A
physics = N
movetype = A
anim = 1055
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3075, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1056
ignorehitpause = 1
[State 3075, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3075, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 6
[State 3075, movehitvar]
type = varset
triggerall = !var(3)
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
trigger2 = numhelper(3075)
trigger2 = helper(3075), var(3)
var(3) = 1
ignorehitpause = 1

[State 1005, timevar]
type = varadd
trigger1 = time && var(11) < 25
var(11) = 1

[State 3075, vel1]
type = velset
trigger1 = !time && (rootdist y > 24)
x = 4.5 + random / 173.3
y = 3.5 + random / 173.7
[State 3075, vel2]
type = velset
trigger1 = !time && (rootdist y <= 24)
x = 7 + random / 566.3
y = 5 + random / 566.7
;x = y * 1.425

[State 3075, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3075, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
persistent = 0
ignorehitpause = 1

[State 3075, Hit]
type = hitdef
trigger1 = !(root, var(16)) && root, var(15) < 20
priority = 4, Hit
attr = A, HP
damage = ceil(ifelse((root, fvar(12)) * 14 < 7, 7, (root, fvar(12)) * 14)), 4
;damage = ceil(23 * root, fvar(12)), 4
animtype = Hard
fall.animtype = Back
hitflag = MAFD
guardflag = MAF
pausetime = 0, ifelse(var(11)<= 2, 5, 3)
sparkno = -1
sparkxy = -10, 0
guard.sparkno = -1;s7001
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -3, -1
ground.cornerpush.veloff = 0
air.velocity = -3, -.5
down.hittime = 20
down.velocity = 0, 0
fall = 1
fall.recover = 0
getpower = 0
givepower = 36, 36
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
sprpriority = 4
airguard.ctrltime = 16
airguard.velocity = ifelse((root, var(20)), -4, -8), -1.5
forcestand = 1
palFX.time = 12 * (root, var(29))
palFX.add = 255,255,255
palFX.sinAdd= -255,-255,-255,48

;[State 3075, Sparks]
;type = explod
;trigger1 = movehit && numtarget
;trigger1 = !(target, time) && target, movetype = H
;anim = 7030 + (random % 8)
;ID = 7000
;sprpriority = 5
;postype = left
;pos = ceil((target, pos x) -((target, const(size.ground.front) -10) * facing) + 160), ceil(screenpos y)
;removetime = -2
;ownpal = 1
;facing = -1
;ignorehitpause = 1
;persistent = 0
;pausemovetime = 100
;supermovetime = 100

[State 3005, hitspark]
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
persistent = 1
ignoreHitPause = 1

[State 3075, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3075, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 3075, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 3075, End]
type = changestate
trigger1 = movecontact
value = 3056
ignorehitpause = 1
[State 3075, End]
type = changestate
trigger1 = pos y >= 0
value = 3057
ignorehitpause = 1
[State 3075, End]
type = destroyself
trigger1 = pos x != [ -240, 240]


;B&W DUST
[Statedef 3125]
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
anim = 3125
ID = 3125
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
ID = 3125
scale = 0.2 + (0.05 * time) * const(size.xscale), 0.05 + (0.0125 * time) * const(size.yscale)
[State 3125, End]
type = destroyself
trigger1 = time >= 17

;-----SRK FX-----------
[Statedef 3165]
physics = N
velset = 0, 0
anim = 3165
sprpriority = 3
[State 3165, Assert]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3165, Bind]
type = bindtoroot
trigger1 = (root, stateno = 1100) && (root, anim = 1100) ;vel y < -5.3;1
pos = 25,-125
[State 3165, Bind]
type = bindtoroot
trigger1 = (root, stateno = 3100) && (root, anim = 3100);vel y < -5.3;1
pos = 25,-125
[State 3165, Bind]
type = bindtoroot
trigger1 = (root, stateno = 1110) && (root, anim = 1110) ;vel y < -5.3;1
pos = 25,-125
[State Shadows]
type = Afterimage
trigger1 = time = 0
time = 9999
length = 10
PalBright = 1, 1, 1
PalContrast = 25, 155, 255
PalAdd = 0, 0, 0
PalMul = 0.60, .60, .60
Timegap = 1
FrameGap = 1
Trans = add
[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 3165, End]
type = destroyself
trigger1 = !animtime
trigger2 = !(parent, stateno = [1100,1110]) || parent, stateno = 3100
trigger2 = parent, movetype = H

;TENMA SHINZUI WARI F.X.
[Statedef 3305]
physics = N
velset = 0, 0
anim = 3305
sprpriority = 3
[State 3305, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 3305, Bind]
type = bindtoroot
trigger1 = (root, anim = 3300)
trigger2 = (root, anim = 1302)
ignorehitpause = 1

[State 3305, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 2
length = 3
palcontrast = 120, 90, 150
trans = add

[State 3305, End]
type = destroyself
trigger1 = !animtime || (root, stateno != 3300) && (root, var(1) = 1)
trigger2 = !animtime || (root, stateno != 1302) && (root, var(1)!= 1)

;MISOGI ILLUSIONS
[Statedef 4104]
physics = N
anim = 9741
[State 4111, Assert]
type = assertspecial
trigger1 = 1
flag = invisible

[State 4104, Dust]
type = explod
trigger1 = !time
anim = 4110
ID = 4110
sprpriority = -1
postype = p1
pos = 0, 0
vel = 0, 0
removetime = -2
ownpal = 1
[State 4104, particles]
type = explod
trigger1 = time = [1, 16]
vel = 0, -ceil(random / 200)
accel = 0, -.3
anim = 4111
sprpriority = -1
postype = p1
pos = -2, -45
random = 50, 50
facing = -1 + (random < 500) * 2
removetime = -2
ownpal = 1
scale = 0.25, 0.25
pausemovetime = 300
supermovetime = 300

[State 4104, Fade]
type = palfx
trigger1 = !time
mul = 200, 0, 256
sinadd = -255, -255, -255, 240
time = 60

[State 4104, End]
type = destroyself
trigger1 = time >= 60

;S.G.S. GUARDED
[Statedef 4012]
physics = N
velset = 0, 0
anim = 9741

[State 4012, BG PalFX]
type = bgpalfx
trigger1 = !time
time = 20
add = -255, -128, -64
sinadd = 255, 128, 64, 80
persistent = 0
[State 4012, palfx]
type = palfx
trigger1 = !time
time = 24
sinadd = -255, -255, -255, 96

[State 4012, thunder]
type = explod
trigger1 = !time
anim = 4012
ID = 4012
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
removetime = -2
supermovetime = 30
ownpal = 1
[State 4012, Circle]
type = explod
trigger1 = !time
anim = 7501
ID = 4013
sprpriority = 5
postype = p1
removetime = 20
supermovetime = 30

[State 4012, Shrink]
type = modifyexplod
trigger1 = numexplod(4013)
ID = 4013
scale = 0.2 + (0.09 * time), 0.2 + (0.09 * time)
[State 4012, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 4012, End]
type = destroyself
trigger1 = time >= 24


;KONGOU KOKURETSU ZAN
; - KKZ AURA -
[Statedef 4203]
physics = N
velset = 0, 0
anim = 4203
sprpriority = 0
[State 4203, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 4203, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 2
palcontrast = 100, 100, 100
trans = add
[State 4203, Bind]
type = bindtoroot
trigger1 = 1
time = -1
[State 4203, End]
type = destroyself
trigger1 = root, stateno != 4200 || root, anim != 4200
trigger2 = root, stateno = 4200 && root, animelemtime(19) >= 0
trigger3 = !animtime

;--- LIGHTNING ---
[Statedef 4205]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
anim = 4205
sprpriority = 4

[State 4205, No Reversals]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AT
stateno = 5000
ignorehitpause = 1

[State 4205, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4205, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 6

[State 4205, movehitvar]
type = varset
triggerall = !var(3)
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
trigger2 = numhelper(4205)
trigger2 = helper(4205), var(3)
var(3) = 1
ignorehitpause = 1

[State 4205, Dampener]
type = varset
trigger1 = 1
fvar(12) = (root, fvar(10)) * ifelse(var(29), 1.2, 1)

[State 4205, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 2
length = 3
palcontrast = 20, 10, 50
trans = add

[State 4205, Hit]
type = hitdef
trigger1 = animelem = 1
attr = S, HA
damage = ceil(ifelse(fvar(12) * 122 < 7, 7, fvar(12) * 122)), 5
;damage = ceil(40 * root, fvar(12)), 5
animtype = Up
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1
hitsound = s2, 7
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(frontedgedist < backedgedist, 6, -6), -3
ground.cornerpush.veloff = 0
air.velocity = ifelse(frontedgedist < backedgedist, 6, -6), -3
down.velocity = ifelse(frontedgedist < backedgedist, 6, -6), -3
getpower = 0
givepower = 36, 36
guard.velocity = -10.52
fall = 1
fall.recover = 0
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = 32
sprpriority = 4
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -8, -1.5

[State 4205, flames]
type = helper
triggerall = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

;[State 4205, Sparks]
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
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = (target, const(size.ground.front)), (target, const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 4205, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 4205, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 4205, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1

[State 4205, End]
type = destroyself
trigger1 = !animtime


;--- SHOCKWAVES ---
[Statedef 4206]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 4206, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4206
ignorehitpause = 1
[State 4206, hitby]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 4206, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4206, Strength]
type = varset
trigger1 = !time && !prevstateno
var(10) = 6
[State 4206, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 4206

[State 4206, movehitvar]
type = varset
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
var(3) = 1
ignorehitpause = 1
[State 4206, movehitvar2]
type = varset
trigger1 = !time && prevstateno
var(4) = animelemno(0)
ignorehitpause = 1

[State 4206, Dampener]
type = varset
trigger1 = 1
fvar(12) = (root, fvar(10)) * ifelse(var(29), 1.2, 1)

[State 4206, Shadows]
type = afterimage
trigger1 = !time && !prevstateno
time = 999
timegap = 1
framegap = 2
length = 7
palcontrast = 20, 20, 20
trans = add

[State 4206, HitSound]
type = playsnd
trigger1 = movehit && numtarget
trigger1 = !(target, time) && target, movetype = H
value = 2, 7
channel = 1
ignorehitpause = 1

[State 4206, Hit]
type = hitdef
trigger1 = animelemno(0) != var(4)
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
attr = S, HA
damage = ceil(ifelse(fvar(12) * 36 < 7, 7, fvar(12) * 36)), 8
;damage = ceil(60 * root, fvar(12)), 5
animtype = Hard
fall.animtype = DiagUp
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 1
sparkno = -1
guard.sparkno = -1
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse((animelem = 9), -12, -4), -8
ground.cornerpush.veloff = 0
air.velocity = -3, -8
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
palfx.sinadd = 64, 64, 64, 4
palfx.mul = 128, 128, 128
palfx.time = ifelse(p2statetype = A, 74, 30)
ID = 4206 + (facing = -1)
nochainID = 4207 -(facing = -1)
sprpriority = 4
forcestand = 1
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -8, -1.5

[State 4206, flames]
type = helper
trigger1 = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0

;[State 4206, Sparks]
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
trigger1 = moveContact = 1 && numtarget
trigger1 = !(target, hitshakeover)
helperType = Normal
stateNo = ifElse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
posType = P2
pos = (target, const(size.ground.front)), (target, const(size.mid.pos.y))
facing = -1
ownPal = 1
size.xScale = 1
size.yScale = 1
pauseMoveTime = 65535
superMoveTime = 65535
persistent = 0
ignoreHitPause = 1

[State 4205, Parent Hit Count]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 4205, Self Hit Count]
type = VarAdd
trigger1 = MoveContact && NumTarget
var(13) = 1
[State 4205, Juggle Points]
type = ParentVarAdd
trigger1 = MoveContact && NumTarget
var(15) = 1


[State 4206, End]
type = destroyself
trigger1 = !animtime


;PURPLE DUST
[Statedef 4210]
physics = N
anim = 9741
[State 4210, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1
[State 4210, Dust]
type = explod
trigger1 = !time
anim = 4210
ID = 4210
sprpriority = -2
postype = p1
removetime = 25
[State 4210, Fade]
type = palfx
trigger1 = !time
mul = 384, 384, 384
sinadd = -255, -255, -255, 100
time = 25
[State 4210, Shrink]
type = modifyexplod
trigger1 = 1
ID = 4210
scale = 0.5 + (0.1 * time), 0.1 + (0.02 * time)
[State 4210, End]
type = destroyself
trigger1 = time >= 26

;AURA
[Statedef 6000]
physics = N
velset = 0, 0
anim = 6000
sprpriority = -2
[State 6000, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 6000, Var]
type = varset
trigger1 = !time
var(0) = root, anim
[State 6000, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 2
palcontrast = 100, 100, 100
trans = add
[State 6000, Bind]
type = bindtoroot
trigger1 = 1
[State 6000, End]
type = destroyself
trigger1 = (root, anim) != var(0)
trigger2 = root, stateno = 195 && root, animelemtime(19) >= 0
trigger3 = root, stateno = 182 && root, animelemtime(26) >= 0
trigger4 = root, stateno = 1020 && root, animelemtime(9) >= 0
trigger5 = root, stateno = 1400 && root, animelemtime(5) >= 0
trigger6 = root, stateno = 3020 && root, anim = 3020 && root, animelemtime(22) >= 0
trigger7 = root, stateno = 193 && root, anim = 193 && root, animelemtime(39) >= 0
trigger8 = root, stateno = 1030 && root, animelemtime(6) >= 0
trigger9 = root, stateno = 1021 && root, animelemtime(9) >= 0 && root, var(1) = 1
trigger10 = root, stateno = 6901 && root, animelemtime(21) >= 0
;METSU
[Statedef 6002]
physics = N
velset = 0, -.5
anim = 6002
sprpriority = -1
[State 6002, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 6002, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 2
palcontrast = 120, 90, 150
trans = add
[State 6002, Shadows]
type = velset
trigger1 = animelem = 6
y = -2
[State 6002, Fade]
type = palfx
trigger1 = animelem = 7
sinadd = -255, -255, -255, 64
time = 16

[State 6002, Bind]
type = posset
trigger1 = root, stateno = 195 && root, movetype != H
x = ceil(root, pos x) + ifelse(root, facing = -1, 5, -5)

[State 6002, End]
type = destroyself
trigger1 = !animtime || root, movetype = H

;KANJI
[Statedef 6012]
physics = N
velset = 0, 0
anim = 6012
sprpriority = 2

[State 6012, glow]
type = palfx
trigger1 = !time
time = 9999
add = 50, 0, 0
sinadd = 100, 0, 0, 80

[State 6012, Bind]
type = bindtoroot
trigger1 = 1
pos = ifelse((root, facing = 1), 0, 32), 0

;KKZ AURA
[Statedef 4203]
physics = N
velset = 0, 0
anim = 4203
sprpriority = 0
[State 4203, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1
[State 4203, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 2
palcontrast = 100, 100, 100
trans = add
[State 4203, Bind]
type = bindtoroot
trigger1 = 1
time = -1
[State 4203, End]
type = destroyself
trigger1 = root, stateno != 4200 || root, anim != 4200
trigger2 = root, stateno = 4200 && root, animelemtime(19) >= 0
trigger3 = !animtime


;RED PARTICLES
[Statedef 6021]
physics = N
anim = 6021
sprpriority = 4
[State 6021, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
[State 6021, Assert]
type = assertspecial
trigger1 = !time
flag = invisible
[State 6021, Fade]
type = palfx
trigger1 = !time
add = -255, -255, -255
sinadd = 255, 255, 255, 40
time = 10
[State 6021, Vel]
type = velset
trigger1 = !time
x = (rootdist x + 16) / 36.0
y = (rootdist y -79) / 36.0
[State 6021, End]
type = destroyself
trigger1 = !animtime


;VEGA
[Statedef 6100]
physics = N
velset = 0, 0
anim = 6100
sprpriority = 4
[State 6100, exists]
type = parentvarset
trigger1 = playerIDexist(parent, ID)
var(51) = 1
[State 6100, offset]
type = offset
trigger1 = 1
y = 6
[State 6100, Snd]
type = playsnd
trigger1 = time = 5
value = 6, random < 500
channel = 0
[State 6100, blood]
type = explod
trigger1 = animelem = 9
anim = 6105
ID = 6105
sprpriority = 5
postype = p1
bindtime = -1
[State 6100, Snd]
type = playsnd
trigger1 = animelem = 9
value = 2, 8
[State 6100, Snd]
type = playsnd
trigger1 = animelem = 12
value = 6, 11
channel = 0
[State 6100, gone]
type = destroyself
triggerall = numenemy
trigger1 = enemy, name = "Shin Gouki" && enemy, authorname = "Phantom.of.the.Server" && enemy, numhelper(6100)
trigger2 = enemy, name = "Vega" && enemy, authorname = "Phantom.of.the.Server"
trigger3 = enemy, name = "cvsvega" && (enemy, authorname = "Warusaki3" || enemy, authorname != "Gargoyle")
trigger4 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger5 = enemy, name = "M.Bison" && enemy, authorname = "N -Mario"
trigger6 = enemy, name = "CvSBison" && enemy, authorname = "Team Kai (Saiai and Koga)"
trigger7 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "Sevil Nahte"

;VEGA 2
[Statedef 6150]
physics = N
velset = 0, 0
anim = 6150
sprpriority = -4
[State 6100, exists]
type = parentvarset
trigger1 = playerIDexist(parent, ID)
var(51) = 1
[State 6100, offset]
type = offset
trigger1 = 1
y = 6
[State 6100, Snd]
type = playsnd
trigger1 = time = 5
value = 6, random < 500
channel = 0
[State 192, Anim]
type = changeanim
trigger1 = animelemtime(9) < 0 && ((root, anim = 178) && (root, animelemtime(2) = 0))
value = 6150
elem = 9
[State 192, Anim]
type = changestate
trigger1 = animelemtime(10) < 0 && ((root, anim = 178) && (root, animelemtime(3) = 0))
value = 6101
[State 6100, Snd]
type = playsnd
trigger1 = animelem = 9
value = 6, 11
channel = 0
[State 6100, gone]
type = destroyself
triggerall = numenemy
trigger1 = enemy, name = "Shin Gouki" && enemy, authorname = "Phantom.of.the.Server" && enemy, numhelper(6100)
trigger2 = enemy, name = "Vega" && enemy, authorname = "Phantom.of.the.Server"
trigger3 = enemy, name = "cvsvega" && (enemy, authorname = "Warusaki3" || enemy, authorname != "Gargoyle")
trigger4 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger5 = enemy, name = "M.Bison" && enemy, authorname = "N -Mario"
trigger6 = enemy, name = "CvSBison" && enemy, authorname = "Team Kai (Saiai and Koga)"
trigger7 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "Sevil Nahte"
;trigger8 = (root, stateno = 178) && (root, time = 260)

;--- DEAD ---
[Statedef 6101]
physics = N
velset = 0, 0
anim = 6101
sprpriority = 4
[State 6101, offset]
type = offset
trigger1 = 1
y = 6
[State 6101, Snd]
type = stopsnd
trigger1 = !time
channel = 0
[State 6101, exists]
type = parentvarset
trigger1 = playerIDexist(parent, ID)
var(51) = 1
[State 6101, gone]
type = destroyself
triggerall = numenemy
trigger1 = enemy, name = "Shin Gouki" && enemy, authorname = "Phantom.of.the.Server" && enemy, numhelper(6100)
trigger2 = enemy, name = "Vega" && enemy, authorname = "Phantom.of.the.Server"
trigger3 = enemy, name = "cvsvega" && (enemy, authorname = "Warusaki3" || enemy, authorname != "Gargoyle")
trigger4 = enemy, name = "M. Bison" && enemy, authorname = "VK, Updated by Terry Kuo, adapted by Tenebrous"
trigger5 = enemy, name = "M.Bison" && enemy, authorname = "N -Mario"
trigger6 = enemy, name = "CvSBison" && enemy, authorname = "Team Kai (Saiai and Koga)"
trigger7 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "Sevil Nahte"


;DIZZY FX
[Statedef 3033]
physics = N
velset = 0, 0
anim = 9741
sprpriority = 4
[State 3033, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 3033, Pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)
[State 3033, Snd]
type = playsnd
trigger1 = enemynear, stateno = 5300
value = 0, ifelse(random < 500, 5300, 5301)
persistent = 0
[State 3033, End]
type = destroyself
trigger1 = enemynear, ctrl
trigger1 = (enemynear, movetype != H) && (enemynear, stateno != 5300)


;FIRE
;--- RED ---
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
trigger2 = enemynear, movetype != H || enemynear, stateno = 5300
trigger3 = enemynear, statetype = L && (enemynear, stateno != [5080, 5081])
[State End]
type = destroyself
trigger1 = !numenemy || time >= 120


;--- SHARED ---
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
anim = 7181
ID = 7181
sprpriority = 3
postype = p2
vel = -.2, -.75
pos = (enemynear, const(size.mid.pos.x)), ifelse((enemynear, statetype = L), 0, (enemynear, const(size.mid.pos.y) + 10))
random = 40, 40
removetime = -2
scale = 0.5, 0.5
ownpal = 1
[State 7181, Pos]
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


;SHIN SHORYUUKEN SHOCKWAVE
[Statedef 7050]
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
anim = 7051
ID = 7051
sprpriority = 5
postype = p1
removetime = 15
pausemovetime = -1
supermovetime = -1
[State 7050, Circle]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
sprpriority = 5
postype = p1
removetime = 15
pausemovetime = -1
supermovetime = -1
[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 7051
scale = 0.15 * time, 0.15 * time
[State 7050, Shrink]
type = modifyexplod
trigger1 = 1
ID = 7050
scale = 0.05 * time, 0.05 * time
[State 7050, No Shadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
[State 7050, Safety]
type = removeexplod
trigger1 = time >= 15
ID = 7050
[State 7050, End]
type = destroyself
trigger1 = time >= 15


;POWER CHARGE
;--- MAIN FX ---
[Statedef 7240]
type = S
anim = ifelse(!(root, var(1)), 9741, 7241)
velset = 0, 0
ctrl = 0

[State 7240, Bind]
type = bindtoroot
trigger1 = (root, stateno = 740) && (root, anim = 740)
pos = -10, 0
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
[State 7240, Power Charge Dust]
type = Explod
trigger1 = !(Time % 6)
anim = 7240
sprPriority = -3
posType = P1
pos = 0, -ceil(pos y)
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1
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
pos = ceil(-90 + (random / 6.25)), ceil(20 -(random / 6.25))

[State 7243, Particle]
type = explod
trigger1 = (time % 4) = 1
anim = 7243
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x -10) / 16.0), ((rootdist y -60) / 16.0)
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


;ZERO COUNTER CHARGE
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


;ORIGINAL COMBO CHARGE
[Statedef 7260]
physics = N
moveType = I
anim = 8400
ctrl = 0
velSet = 0,0
sprPriority = 5

[State 8400, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8400, BGpalFX]
type = BGpalFX
trigger1 = Time < 25
time = 1
mul = 128,128,128

[State 8400, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8400, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8400, Scale]
type = AngleDraw
trigger1 = Time < 8
scale = (0.0625 * Time), (0.0625 * Time)
ignoreHitPause = 1

[State 8400, Scale]
type = AngleDraw
trigger1 = Time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time < 16
trans = AddAlpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Transparency]
type = Trans
trigger1 = Time >= 16
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256
ignoreHitPause = 1

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
facing = ifelse(random < 500, 1, -1)
vfacing = ifelse(random < 500, 1, -1)
postype = p1
removetime = 20
supermovetime = 300
[State 7260, Circle]
type = explod
trigger1 = time = 20
anim = 7265
ID = 7265
sprpriority = 5
postype = p1
removetime = -1
supermovetime = 300

;[State 7260, shrinkcircle]
;type = modifyexplod
;trigger1 = 1
;ID = 7260
;scale = 2 -(0.1 * time), 2 -(0.1 * time)
;[State 7260, shrinkcircle]
;type = modifyexplod
;trigger1 = 1
;ID = 7261
;scale = 0.017 * time, 0.017 * time
;[State 7260, shrinkcircle]
;type = modifyexplod
;trigger1 = time >= 20
;ID = 7262
;scale = 0.1 + (0.1 * (time -20)), 0.1 + (0.1 * (time -20))

[State 8400, Scale Lines Explod]
type = ModifyExplod
trigger1 = NumExplod(7260)
ID = 7260
scale = 2 - (0.125 * Time), 2 - (0.125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8400, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(7265)
ID = 7265
scale = (0.1 * (Time - 16)), (0.1 * (Time - 16))
trans = AddAlpha
alpha = ceil(256 - 25.6 * (Time - 16)), 256
ignorehitpause = 1
[State 7260, bound]
type = screenbound
trigger1 = 1
value = 0
[State 7260, Safety]
type = removeexplod
trigger1 = time >= 30
[State 6110, End]
type = destroyself
trigger1 = time >= 30


;SUPER CHARGE
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
trigger1 = time = 1 && root, var(10) = 7 && Root, StateNo != 3601
anim = ifelse((root, var(1) = 2), 7511, 7510)
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
pos = -160 + (40 * time), 120
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
trigger1 = numexplod(7510) && time >= 50 && root, var(1) != 2
ID = 7510
postype = back
pos = 160 -(20 * (time -50)), 120 + (40 * (time -50))
scale = 0.5 + (0.25 * (time -50)), 0.5 + (0.25 * (time -50))
trans = addalpha
alpha = 256 -ceil(25.6 * (time -50)), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(7510) && time >= 50 && root, var(1) = 2
ID = 7510
postype = back
pos = 160 -(18 * (time -50)), 120 + (32 * (time -50))
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
trigger1 = root, var(10) = 6 && time >= 53
trigger2 = time >= 60


[Statedef 7510]
physics=N
velset=0,0
anim=9741

[State 8520, Assert: NoBarDisplay, NoBG, NoFG]
type = AssertSpecial
trigger1 = Time < 50
flag = NoBarDisplay
flag2 = NoBG
flag3 = NoFG

[State 8520, Portrait (Ken)]
type = Explod
trigger1 = !Time
anim = 7514
ID = 22
sprPriority = -18
posType = Back
removeTime = 60
superMoveTime = -1

[State 8520, ModifyExplod 1 (Ken)]
type = ModifyExplod
trigger1 = NumExplod(22) && Time <= 7
ID = 22
posType = Back
pos = 400 - (34 * (Time)), 120
scale = 0.5, 0.5

[State 8520, ModifyExplod 2 (Ken)]
type = ModifyExplod
trigger1 = NumExplod(22) && Time >= 53
ID = 22
posType = Back
pos = 162 - (40 * (Time - 53)),120
scale = 0.5 + (0.25 * (Time - 53)),0.5 + (0.25 * (Time - 53))
trans = AddAlpha
alpha = 256 - ceil(25.6 * (Time - 53)),256

[State 8520, Portrait (Ryu)]
type = Explod
trigger1 = Time = 7
anim = 7512
ID = 23
sprPriority = -16
posType = Back
pos = 130,120
scale = 0.5,0.5
removeTime = 60
superMoveTime = -1

[State 8520, ModifyExplod 1 (Ryu)]
type = ModifyExplod
trigger1 = NumExplod(23) && Time <= 14
ID = 23
posType = Back
pos = -261 + (56 * (Time - 7)), 120
scale = 0.5, 0.5

[State 8520, ModifyExplod 2 (Ryu)]
type = ModifyExplod
trigger1 = NumExplod(23) && Time >= 53
ID = 23
posType = Back
pos = 131 + (40 * (Time - 53)),120
scale = 0.5 + (0.25 * (Time - 53)),0.5 + (0.25 * (Time - 53))
trans = AddAlpha
alpha = 256 - ceil(25.6 * (Time - 53)),256

[State 8520, ModifyExplod 1 (Mask)]
type = ModifyExplod
trigger1 = NumExplod(24) && Time <= 14
ID = 24
posType = Back
pos = -261 + (56 * (Time - 7)), 120
scale = 0.5, 0.5

[State 8520, RemoveExplod]
type = RemoveExplod
trigger1 = NumExplod(24) && Time >= 32
ID = 24

[State 8520, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 60

[State 8520, End]
type = DestroySelf
trigger1 = Time >= 60



;COUNTER F.X.
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


;SUPER FINISH
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
value = 7, 6
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

[State 7600, ten]
type = explod
trigger1 = !time
anim = 7605
ID = 7605
sprpriority = -5
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5
bindtime = -1
removetime = 40
pausemovetime = -1
supermovetime = -1

[State 7600, Shrink]
type = modifyexplod
trigger1 = numexplod(7605)
ID = 7605
scale = (0.2 * time) * (1.3333333 * gameheight / gamewidth), (0.2 * time) * (1.3333333 * gameheight / gamewidth)
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


;KANJI B.G.
[Statedef 7610]
physics = N
velset = 0, 0
anim = 9741

[State 7610, Assert]
type = assertspecial
trigger1 = time < 120
flag = nomusic

[State 7610, Snd]
type = playsnd
trigger1 = !time
value = 7, 7

[State 7610, black]
type = bgpalfx
trigger1 = time < 120
time = 2
add = -255, -255, -255

[State 7610, black]
type = bgpalfx
trigger1 = time = 120
time = 60
add = -255, -255, -255
sinadd = 255, 255, 255, 240

[State 7610, Fade]
type = palfx
trigger1 = time = 120
time = 60
sinadd = -255, -255, -255, 240

[State 7610, Kanji]
type = explod
trigger1 = (root, var(1)!= 1)
trigger1 = !time
anim = 7606
ID = 7606
sprpriority = -5
postype = left
pos = 160, 120
scale = 0.45 * (1.3333333 * gameheight / gamewidth), 0.45 * (1.3333333 * gameheight / gamewidth)
bindtime = -1

[State 7610, Shrink]
type = modifyexplod
trigger1 = time < 6
ID = 7606
scale = (5.5 - time) * (1.3333333 * gameheight / gamewidth), (5.5 - time) * (1.3333333 * gameheight / gamewidth)

[State 7610, Shrink]
type = modifyexplod
trigger1 = time >= 6
ID = 7606
scale = 0.45 * (1.3333333 * gameheight / gamewidth), 0.45 * (1.3333333 * gameheight / gamewidth)

[State 7610, Kanji]
type = explod
trigger1 = (root, var(1) = 1)
trigger1 = !time
anim = 7610
ID = 7610
sprpriority = -5
postype = left
pos = 160, 120
scale = 0.5 * (1.3333333 * gameheight / gamewidth), 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1

[State 7610, Shrink]
type = modifyexplod
trigger1 = time < 6
ID = 7610
scale = (5.5 - time) * (1.3333333 * gameheight / gamewidth), (5.5 - time) * (1.3333333 * gameheight / gamewidth)

[State 7610, Shrink]
type = modifyexplod
trigger1 = time >= 6
ID = 7610
scale = 0.5 * (1.3333333 * gameheight / gamewidth), 0.5 * (1.3333333 * gameheight / gamewidth)

[State 7610, flamebg]
type = explod
trigger1 = !time
anim = 7611
ID = 7611
sprpriority = 5
postype = left
pos = 0, floor((gameheight / gamewidth) * 80) - 60
bindtime = -1
removetime = -1
pausemovetime = 300
supermovetime = 300

[State 7610, Assert]
type = assertspecial
trigger1 = 1
flag = invisible
flag2 = nobardisplay
ignorehitpause = 1

[State 7610, Assert]
type = assertspecial
trigger1 = time < 120
flag = noFG
ignorehitpause = 1

[State 7610, Safety]
type = removeexplod
trigger1 = time >= 180

[State 7610, End]
type = destroyself
trigger1 = time >= 180


;CAMERA CONTROL
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

[State 8001, Impact Explod]
type = Explod
trigger1 = (root, stateno = 192)
trigger1 = !Time
anim = 8001
ID = 1
posType = P2
facing = 1
sprPriority = 5
pos = 0, -70
random = 60, 60
removeTime = 8
pauseMoveTime = -1
superMoveTime = -1
onTop = 1

[State 8001, Scale Impact Explod]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 0.5 - (0.0625 * Time), 0.5 - (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (32 * Time),256

[State 8001, Remove Explods]
type = RemoveExplod
trigger1 = !(root, stateno = 192)
trigger1 = time >= 8

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
facing = ifElse((Parent, StateNo = [3100,3999]), -1, ifelse(Random < 500, -1, 1))
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

;Super Hit Spark (Shun Goku Satsu)
[StateDef 8015]
type = A
physics = N
moveType = I
anim = 8010
velSet = 0,0
sprPriority = 5

[State 4015, BindToRoot]
type = BindToRoot
triggerall = !Time
trigger1 = (Root, StateNo = 4001) && (Root, Anim = 4001) && (Root, AnimElemTime(2) > 0) && (Root, AnimElemTime(16) < 0)
trigger2 = (Root, StateNo = 4004) && (Root, Anim = 4004) && (Root, AnimElemTime(2) > 0) && (Root, AnimElemTime(33) < 0)
pos = (Random % 40) * ifElse(Random % 2, -1, 1) + 26, -50 - (Random % 40) * ifElse(Random % 2, -1, 1)
facing = 1

[State 4015, BindToRoot]
type = BindToRoot
triggerall = !Time
trigger1 = (Root, StateNo = 178) && (Root, Anim = 178) && (Root, AnimElemTime(2) >= 30) && (Root, AnimElemTime(3) < 0)
pos = (Random % 25) * ifElse(Random % 2, -1, 1) - 52, -50 - (Random % 40) * ifElse(Random % 2, -1, 1)
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
triggerAll = !Time
trigger1 = (Root, StateNo = 4001)
trigger2 = (Root, StateNo = 4004)
trigger3 = (Root, StateNo = 178)
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
triggerAll = !Time
trigger1 = (Root, StateNo = 4001)
trigger2 = (Root, StateNo = 4004)
trigger3 = (Root, StateNo = 178)
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
triggerAll = !Time
trigger1 = (Root, StateNo = 4001)
trigger2 = (Root, StateNo = 4004)
trigger3 = (Root, StateNo = 178)
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
triggerAll = !Time
trigger1 = (Root, StateNo = 4001)
trigger2 = (Root, StateNo = 4004)
trigger3 = (Root, StateNo = 178)
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
triggerAll = !Time
trigger1 = (Root, StateNo = 4001)
trigger2 = (Root, StateNo = 4004)
trigger3 = (Root, StateNo = 178)
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

;==<IMPACT DUST>===
[StateDef 8110]
type = A
anim = 9741
velSet = 0,0
sprPriority = 5

[State 8110, Impact Dust Explod 1]
type = Explod
trigger1 = !Time
anim = 8110
ID = ifElse(Time = 8, 3, ifElse(Time = 4, 2, 1))
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Impact Dust Explod 2]
type = Explod
trigger1 = !Time
anim = 8120
ID = 2
posType = P1
removeTime = 8
sprPriority = -4
pauseMoveTime = -1
superMoveTime = -1

[State 8110, Scale]
type = ModifyExplod
trigger1 = 1
scale = 0.25 + (0.03125 * Time), 0.25 + (0.03125 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 256, 256 - (64 * (Time - 4))), 256

[State 8110, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 8

[State 8110, End]
type = DestroySelf
trigger1 = !NumExplod

;====<COUNTER FX>=
[StateDef 8290]
type = A
physics = N
velSet = 0,0
anim = 9741

[State 8290, "Counter!" Text Explod]
type = Explod
trigger1 = !NumExplod(8290)
anim = 8290
ID = 8290
sprPriority = 64
posType = P1
facing = Facing
removeTime = 32
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time < 8
ID = 8290
scale = 0.5, .5
trans = AddAlpha
alpha = 256,0

[State 8290, Scale]
type = ModifyExplod
trigger1 = Time >= 8
ID = 8290
scale = 0.5 + 0.0625 * (Time - 8), 0.5 + 0.0625 * (Time - 8)
trans = AddAlpha
alpha = 256 - 32 * (Time - 8), 32 * (Time - 8)

[State 8290, Safety]
type = RemoveExplod
trigger1 = Time >= 16

[State 8290, End]
type = DestroySelf
trigger1 = Time >= 16

;Level 1 Super FX
[StateDef 8500]
type = A
velSet = 0,0
anim = 8500
sprPriority = 5

[State 8500, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8500, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 0,0,256

[State 8500, Rotate]
type = AngleSet
trigger1 = !Time
value = 6 * (Random % 60)

[State 8500, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8500, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8500, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5,0.5
ignoreHitPause = 1

[State 8500, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8500, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8501
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8500, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8500, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8500, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 - (0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8502
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 32
superMoveTime = -1

[State 8500, Scale Circle Explod]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8500, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8500, End]
type = DestroySelf
trigger1 = Time >= 40


;Level 2 Super FX
[StateDef 8510]
type = A
velSet = 0,0
anim = 8510
sprPriority = 5

[State 8510, Assert: NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignoreHitPause = 1

[State 8510, BGpalFX]
type = BGpalFX
trigger1 = Time < 39
time = 1
color = 0
mul = 192,0,256

[State 8510, Rotate]
type = AngleSet
trigger1 = !Time
value =6 * (Random % 60)

[State 8510, Rotate]
type = AngleAdd
trigger1 = 1
value = -6

[State 8510, Scale]
type = AngleDraw
trigger1 = Time < 16
scale = (0.03125 * Time), (0.03125 * Time)
ignoreHitPause = 1

[State 8510, Scale]
type = AngleDraw
trigger1 = Time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Transparency]
type = Trans
trigger1 = 1
trans = AddAlpha
alpha = 256,256
ignoreHitPause = 1

[State 8510, Lines Explod]
type = Explod
trigger1 = Time = 0 || Time = 8 || Time = 16 || Time = 24
anim = 8511
ID = ifElse(Time = 24, 4, ifElse(Time = 16, 3, ifElse(Time = 8, 2, 1)))
sprPriority = 5
posType = P1
facing = ifElse(Random < 500, -1, 1)
vFacing = ifElse(Random < 500, -1, 1)
removeTime = 16
superMoveTime = -1

[State 8510, Scale Lines Explod 1]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = 1 - (0.0625 * Time), 1 - (0.0625 * Time)
trans = AddAlpha
alpha = ifElse(Time < 4, 64 * Time, 256), 256

[State 8510, Scale Lines Explod 2]
type = ModifyExplod
trigger1 = NumExplod(2)
ID = 2
scale = 1 - (0.0625 * (Time - 8)), 1 - (0.0625 * (Time - 8))
trans = AddAlpha
alpha = ifElse((Time - 8) < 4, 64 * (Time - 8), 256), 256

[State 8510, Scale Lines Explod 3]
type = ModifyExplod
trigger1 = NumExplod(3)
ID = 3
scale = 1 - (0.0625 * (Time - 16)), 1 - (0.0625 * (Time - 16))
trans = AddAlpha
alpha = ifElse((Time - 16) < 4, 64 * (Time - 16), 256), 256

[State 8510, Scale Lines Explod 4]
type = ModifyExplod
trigger1 = NumExplod(4)
ID = 4
scale = 1 -(0.0625 * (Time - 24)), 1 - (0.0625 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24) < 4, 64 * (Time - 24), 256), 256

[State 8510, Circle Explod]
type = Explod
trigger1 = Time = 24
anim = 8512
ID = 10
sprPriority = 5
posType = P1
facing = ifElse(Random < 500,-1,1)
vFacing = ifElse(Random < 500,-1,1)
removeTime = 32
superMoveTime = -1

[State 8510, Scale]
type = ModifyExplod
trigger1 = NumExplod(10)
ID = 10
scale = 2 - (0.125 * (Time - 24)), 2 - (0.125 * (Time - 24))
trans = AddAlpha
alpha = ifElse((Time - 24)<4, 64 * (Time - 24), 256), 256

[State 8510, Remove Explods]
type = RemoveExplod
trigger1 = Time >= 40

[State 8510, End]
type = DestroySelf
trigger1 = Time >= 40


;Level 3 Super FX
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
trigger1 = !Time && Root, StateNo != [3600,3701]
anim = ifelse(root, var(1), 7515, 7510)
ID = 20
sprPriority = -16
posType = Back
removeTime = 40
superMoveTime = -1
;
;[State 8520, Portrait 2]
;type = Explod
;trigger1 = !Time && Root, StateNo != [3600,3701]
;anim = 8525 + (Root, var(40) = 1)
;ID=21
;sprPriority = -16
;posType = Back
;removeTime = 40
;superMoveTime = -1

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
ignoreHitPause = 1

[State 8999, End]
type = DestroySelf
trigger1 = RoundState = 2
