;---------------------------------------------------------------------------
;Manchester Gold
[Statedef 3000]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = N				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 1				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3000				;Change animation (Def: no change)
poweradd = -1000			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)
[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3000, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, NHB]
type = nothitby
trigger1 = time <= 53
time = 1
value = SCA

[State 3000, Snd]
type = playsnd
trigger1 = !time
value = 5, 4
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S4,9

[State 3000, Superpause FX]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -2, -76
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3000, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 1000,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=4
trigger2 = AnimElem=10
trigger3 = AnimElem=14
trigger4 = AnimElem=18
trigger5 = AnimElem=22
trigger6 = AnimElem=26
value = S1,1

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3005
ID = 3005
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
pausemovetime = 0
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3007
ID = 3007
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
pausemovetime = 0
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S4,7

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1
;persistent =

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 + hitcount || var(20))
trigger1 = animelem = 5 || (animelem = 6 && !movecontact && !movereversed)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0
givepower = 36, 36
pausetime = 2,0
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
p2facing = 1
ground.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
ground.cornerpush.veloff = 0
ground.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 + hitcount || var(20))
trigger1 = animelem = 5 || (animelem = 6 && !movecontact && !movereversed)
trigger2 = animelem = 13 || (animelem = 14 && !movecontact && !movereversed)
trigger3 = animelem = 21 || (animelem = 22 && !movecontact && !movereversed)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getpower = 0
givepower = 36, 36
pausetime = 2,0
pausetime = 2,0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
p2facing = 1
ground.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
ground.cornerpush.veloff = 0
ground.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 + hitcount || var(20))
trigger1 = animelem = 9 || (animelem = 10 && !movecontact && !movereversed)
trigger2 = animelem = 17 || (animelem = 18 && !movecontact && !movereversed)
trigger3 = animelem = 25 || (animelem = 26 && !movecontact && !movereversed)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getpower = 0
givepower = 36, 36
pausetime = 2,0
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
p2facing = -1
ground.velocity = ifelse(p2dist x > 30, -12, -11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
ground.cornerpush.veloff = 0
ground.velocity = ifelse(p2dist x > 30, -12, -11)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x > 30, -12, -11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 + hitcount || var(20))
trigger1 = animelem = 28
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 44 < 7, 7, fvar(11) * 44)), 7
getpower = 0
givepower = 36, 36
pausetime = 2,0
pausetime = 2,0
animtype = Hard
air.animtype = Diagup
fall.animtype = diagup
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
p2facing = 1
ground.velocity = -7.36,-4.32
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 29
id = 3005
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 29
id = 3007
[State 0, Explod]
type = Explod
trigger1 = animelem = 29
anim = 3006
ID = 3006
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = 0
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, TargetState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;MAX Manchester Gold
[Statedef 3050]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = S				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 1				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3050				;Change animation (Def: no change)
poweradd = -2000			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)
[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3000, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, NHB]
type = nothitby
trigger1 = time <= 53
time = 1
value = SCA

[State 3000, Snd]
type = playsnd
trigger1 = !time
value = 5, 4
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S4,9

[State 3000, Superpause FX]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8510
name = "Superpause FX"
postype = p1
pos = -2, -76
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3000, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 1000,PlaySnd]
type = PlaySnd
trigger1 = AnimElem=4
trigger2 = AnimElem=10
trigger3 = AnimElem=14
trigger4 = AnimElem=18
trigger5 = AnimElem=22
trigger6 = AnimElem=26
trigger7 = animelem = 30
trigger8 = animelem = 34
trigger9 = animelem = 38
trigger10 = animelem = 42
value = S1,1

[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3005
ID = 3005
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
pausemovetime = 0
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
[State 0, Explod]
type = Explod
trigger1 = animelem = 5
anim = 3007
ID = 3007
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -1
pausemovetime = 0
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S4,7

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1
;persistent =

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 + hitcount || var(20))
trigger1 = animelem = 5 || (animelem = 6 && !movecontact && !movereversed)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0
givepower = 36, 36
pausetime = 2,0
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
p2facing = 1
ground.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 + hitcount || var(20))
trigger1 = animelem = 5 || (animelem = 6 && !movecontact && !movereversed)
trigger2 = animelem = 13 || (animelem = 14 && !movecontact && !movereversed)
trigger3 = animelem = 21 || (animelem = 22 && !movecontact && !movereversed)
trigger4 = animelem = 29 || (animelem = 30 && !movecontact && !movereversed)
trigger5 = animelem = 37 || (animelem = 38 && !movecontact && !movereversed)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getpower = 0
givepower = 36, 36
pausetime = 2,0
guard.pausetime = 2,0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
p2facing = 1
ground.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x > 30, 12, 11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 + hitcount || var(20))
trigger1 = animelem = 9 || (animelem = 10 && !movecontact && !movereversed)
trigger2 = animelem = 17 || (animelem = 18 && !movecontact && !movereversed)
trigger3 = animelem = 25 || (animelem = 26 && !movecontact && !movereversed)
trigger4 = animelem = 33 || (animelem = 34 && !movecontact && !movereversed)
trigger5 = animelem = 41 || (animelem = 42 && !movecontact && !movereversed)
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getpower = 0
givepower = 36, 36
pausetime = 2,0
guard.pausetime = 2,0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
p2facing = -1
ground.velocity = ifelse(p2dist x > 30, -12, -11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
ground.cornerpush.veloff = 0
guard.velocity = ifelse(p2dist x > 30, -12, -11)
guard.cornerpush.veloff = 0
air.velocity = ifelse(p2dist x > 30, -12, -11);, ifelse(p2dist y < (enemy, const(size.mid.pos.y)) + 60, 0, -3) + vel y
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120


[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 + hitcount || var(20))
trigger1 = animelem = 48
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0
givepower = 36, 36
pausetime = 16,16
guard.pausetime = 2,0
animtype = Hard
air.animtype = High
fall.animtype = High
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
p2facing = 1
ground.velocity = 0,0
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = 0, 0
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -91
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p1stateno = 3051

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 46
id = 3005
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 46
id = 3007
[State 0, Explod]
type = Explod
trigger1 = animelem = 46
anim = 3006
ID = 3006
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
pausemovetime = 0
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 0, TargetState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Part 2

[Statedef 3051]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = S				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 0				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3051				;Change animation (Def: no change)
poweradd = 0			;Power to add (Def: 0)
sprpriority = 2

[State 0, TargetState]
type = TargetState
trigger1 = !time
value = 3055

[State 0, TargetBind]
type = TargetBind
trigger1 = !time
pos = 60,0
;ignorehitpause =
;persistent =

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S5,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,3

[State 200, Hit]
type = hitdef
;trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 13
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -2.2, -8.36
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -2.2, -8.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 7), var(36) := -179
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 =!animtime
value = 0
ctrl = 1

[Statedef 3055]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 2

[State 0, ChangeAnim2]
type = ChangeAnim2
trigger1 = !time
value = 3055
;ignorehitpause =
;persistent =

[State 0, VelSet]
type = VelSet
trigger1 = !time
x = 1.8
y = -15.5
;ignorehitpause =
;persistent =

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
y = .6

;Union Jack Platinum
[Statedef 3100]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = N				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 0				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3100				;Change animation (Def: no change)
poweradd = -1000			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)


[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)
[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3000, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, NotHitBy]
type = NotHitBy
trigger1 = AnimElemTime(2) < 0
time = 1
value = SCA

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S6,2

[State 3000, Superpause FX]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8500
ID = 8500
name = "Superpause FX"
postype = p1
pos = -2, -76
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3000, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
trigger2 = animelem = 9
trigger3 = animelem = 15
x = 8
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
trigger2 = animelem = 11
trigger3 = animelem = 17
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 26
x = 16
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 30
x = 0

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
trigger2 = animelem = 9
trigger3 = animelem = 15
trigger4 = animelem = 31
trigger5 = animelem = 35
trigger6 = animelem = 38
trigger7 = animelem = 41
trigger8 = animelem = 44
trigger9 = animelem = 49
value = S1, 2

[State 200, Snd]
type = playsnd
trigger1 = animelem = 49
value = S6, 6

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = -4.32
ground.cornerpush.veloff = 0
guard.velocity = -4.32
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -53
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 11
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
guard.pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32
ground.cornerpush.veloff = 0
guard.velocity = -4.32
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -48
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 19
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32
ground.cornerpush.veloff = 0
guard.velocity = -4.32
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 107), var(36) := -76
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 31
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 101), var(36) := -56
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 35
trigger2 = animelem = 23
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -2.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -56
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 38
trigger2 = animelem = 26
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -2.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -39
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 41
trigger2 = animelem = 29
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -2.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 110), var(36) := -71
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 44
trigger2 = animelem = 32
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -2.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 109), var(36) := -23
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 50 || animelem = 51
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -7.36, -4.32
ground.cornerpush.veloff = 0
guard.velocity = -7.36
guard.cornerpush.veloff = 0
ground.velocity = -7.36, -4.32
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 96), var(36) := -49
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;MAX Union Jack Platinum
[Statedef 3150]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = N				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 0				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3150				;Change animation (Def: no change)
poweradd = -2000			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)
[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3000, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, NHB]
type = nothitby
trigger1 = AnimElemTime(7) < 0
time = 1
value = SCA

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S6,2

[State 3000, Superpause FX]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8510
ID = 8510
name = "Superpause FX"
postype = p1
pos = -2, -76
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3000, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
trigger2 = animelem = 9
trigger3 = animelem = 15
trigger4 = animelem = 23
trigger5 = animelem = 34
trigger6 = animelem = 49
trigger7 = animelem = 53
trigger8 = animelem = 56
trigger9 = animelem = 59
trigger10 = animelem = 62
trigger11 = animelem = 65
trigger12 = animelem = 68
trigger13 = animelem = 71
trigger14 = animelem = 74
trigger15 = animelem = 77
trigger16 = animelem = 80
trigger17 = animelem = 86
value = 1, 2

[State 200, Snd]
type = playsnd
trigger1 = animelem = 86
value = 6, 6

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
trigger2 = animelem = 9
trigger3 = animelem = 15
trigger4 = animelem = 23
trigger5 = animelem = 34
x = 10
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
trigger2 = animelem = 11
trigger3 = animelem = 17
trigger4 = animelem = 25
trigger5 = animelem = 36
x = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 43
x = 16
[State 0, VelSet]
type = VelSet
trigger1 = animelem = 47
x = 0

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 4
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 15 + 3 * var(9)
ground.slidetime = 15 + 3 * var(9)
guard.hittime = 15
air.hittime = 120
ground.velocity = -4.32
ground.cornerpush.veloff = 0
guard.velocity = -4.32
guard.cornerpush.veloff = 0
air.velocity = -2.16, -8.00
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -53
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 11
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32
ground.cornerpush.veloff = 0
guard.velocity = -4.32
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 72), var(36) := -48
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 16
attr = C, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32
ground.cornerpush.veloff = 0
guard.velocity = -4.32
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 107), var(36) := -76
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 26
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32
ground.cornerpush.veloff = 0
guard.velocity = -4.32
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 102), var(36) := -34
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 37
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 36 < 7, 7, fvar(11) * 36)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18 + 4 * var(9)
ground.slidetime = 18 + 4 * var(9)
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32
ground.cornerpush.veloff = 0
guard.velocity = -4.32
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 107), var(36) := -76
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 49
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 22 < 7, 7, fvar(11) * 22)), 7
getpower = 0,0
givepower = 36, 36
pausetime = 12,12
guard.pausetime = 12,12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = 0
ground.cornerpush.veloff = 0
guard.velocity = ifelse(var(20), -6.83, -12.64)
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 101), var(36) := -56
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 53
trigger2 = animelem = 65
trigger3 = animelem = 77
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = -2.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -56
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 56
trigger2 = animelem = 68
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = -2.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 112), var(36) := -39
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 59
trigger2 = animelem = 71
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = -2.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 110), var(36) := -71
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 62
trigger2 = animelem = 74
trigger3 = animelem = 80
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 7 < 7, 7, fvar(11) * 7)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 24
ground.slidetime = 24
guard.hittime = 24
air.hittime = 120
ground.velocity = -2.25
ground.cornerpush.veloff = 0
guard.velocity = -4.65
guard.cornerpush.veloff = 0
air.velocity = -4.32, -7.36
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 109), var(36) := -23
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
kill = 0

[State 200, Hit]
type = hitdef
triggerall = !var(16) && (var(15) < 1 || var(20))
trigger1 = animelem = 87
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * 15 < 7, 7, fvar(11) * 15)), 7
getpower = 0,0
givepower = 36, 36
pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
guard.pausetime = ifelse(var(20), 2, 4), ifelse(var(20), 2, 4)
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -7.36, -4.32
ground.cornerpush.veloff = 0
guard.velocity = -7.36
guard.cornerpush.veloff = 0
ground.velocity = -7.36, -4.32
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 96), var(36) := -49
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;London Silver
[Statedef 3300]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = N				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 0				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3300				;Change animation (Def: no change)
poweradd = -3000			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)

[State 3000, Super Cancel Flag]
type = varset
trigger1 = !time
var(21) = ((prevstateno = [1000, 2999]) && var(7)) || var(20)
[State 3000, Hyper Cancel Flag]
type = varset
trigger1 = !time
var(22) = (prevstateno = [3000, 4999]) && var(8)
[State 3000, CC Reset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1

[State 3000, Corner Push]
type = varset
trigger1 = time = 3
fvar(5) = 0
[State 3000, Unguardable]
type = varset
trigger1 = time = 3 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 43

[State 3000, Super Cancel Flash]
type = palfx
trigger1 = var(21) || var(22)
trigger1 = !(time % 2) && time <= 12
time = 1
add = 255, 255, 255
ignorehitpause = 1
[State 3000, Super Cancel Juggle]
type = varset
trigger1 = !time
trigger1 = var(21) || var(22)
var(15) = 0
ignorehitpause = 1

[State 3000, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 800, Guard Dist]
type = attackdist
trigger1 = 1
value = 0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = !time
value = S6,2

[State 3000, Superpause FX]
type = helper
trigger1 = time = 3
helpertype = normal
stateno = 8520
ID = 8520
name = "Superpause FX"
postype = p1
pos = -2, -76
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 3000, Superpause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
p2defmul = 1
unhittable = 1
anim = -1
sound = s0, 8500
darken = 0

[State 800, Hit]
type = hitdef
trigger1 = time = 0
attr = S, NT
hitflag = M-
priority = 1, Miss
getpower = 0, 0
givepower = 0, 0
sparkno = -1 + 0 * (var(33) := 0)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 40), var(36) := -50
hitsound = -1 + 0 * (var(31) := 800)
guardsound = -1 + 0 * (var(32) := 0)
fall = 1
fall.recover = 1
fall.xvelocity = -3.325
fall.yvelocity = -3.85
numhits = 0
p1stateno = 3310

[State 800, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 8
channel = 0

[State 800, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;Throw
[Statedef 3310]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = N				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 0				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3310				;Change animation (Def: no change)
poweradd = 0			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)

[State 0, TargetState]
type = TargetState
trigger1 = !time
value = 3311

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElem = 1
pos = 18, -86
[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElem = 2
pos = 17, -85
[State 810, Bind 3]
type = TargetBind
trigger1 = AnimElem = 3
pos = -43, -62
[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElem = 4
pos = 6, -47
[State 810, Bind 5]
type = TargetBind
trigger1 = AnimElem = 5
pos = 61, -73

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 3315
ctrl = 0

;Charging
[Statedef 3315]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = N				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 0				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3315				;Change animation (Def: no change)
poweradd = 0			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)

[State 730, Snd]
type = playsnd
trigger1 = !time
value = 4, 7
channel = 0

[State 3260, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 3355
ID = 3355
name = "London Silver Aura"
postype = p1
ownpal = 1

[State 0, VarAdd]
type = VarAdd
trigger1 = var(11) < 25
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
var(11) = 1

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = !animtime
trigger1 = (var(11) = [5,9])
trigger2 = (var(11) = [10,14])
trigger3 = (var(11) = [15,19])
trigger4 = (var(11) = [20,24])
trigger5 = var(11) >= 25
value = 3315 + (var(11)/5)
;elem = 1
;ignorehitpause =
;persistent =


[State 3315, ChangeState]
type = changestate
trigger1 = time = 180
value = 3316
ctrl = 0

;Attack
[Statedef 3316]
type = S				;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A				;Move-type: A-attack, I-idle, H-gethit
physics = N				;Physics: S-stand, C-crouch, A-air
juggle = 0 ; 0				;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0			;Set velocity (x,y) (Def: no change)
ctrl = 0				;Set ctrl (Def: no change)
anim = 3321				;Change animation (Def: no change)
poweradd = 0			;Power to add (Def: 0)
sprpriority = 2			;Set layering priority to 2 (in front)

[State 0, TargetState]
type = TargetState
trigger1 = !time
value = 3312

[State 0, Explod]
type = Explod
trigger1 = animelem = 3
anim = 1405
ID = 1405
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
supermove
pausemove
scale = .5,.5
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 0

[State 200, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, HA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11) * (365 + (var(11)*4))   < 7, 7, fvar(11) * (365 + (var(11)*4)))), 7
getpower = 0
givepower = 36, 36
pausetime = 24, 24
pausetime = 24, 24
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -4.32-(var(11)), -8.36-(var(11))
ground.cornerpush.veloff = 0
guard.velocity = -10.65
guard.cornerpush.veloff = 0
air.velocity = -4.32-(var(11)/5), -8.36-(var(11)/5)
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 63), var(36) := -27
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 0, TargetState]
type = TargetState
trigger1 = movehit && numtarget
value = ifelse(var(11)=25&&winko,3314,3313)
persistent = 0
[State 0, TargetVelSet]
type = TargetVelSet
trigger1 = movehit && numtarget
x = -4.32-(var(11)/5)
y = -12.36-(var(11)/5)
persistent = 0

[State 0, VarSet]
type = VarSet
trigger1 = !animtime
var(11)=0
[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

[Statedef 3311]
type = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State 3311, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 3311

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(6)>0
x = 0
y = -20

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0
;ignorehitpause =
;persistent =

[State 0, SprPriority]
type = SprPriority
trigger1 = animelem = 2
value = 3


[Statedef 3312]
type = A
movetype= H
physics = N
velset = 0,0
sprpriority = 1

[State 3311, 1]
type = ChangeAnim2
Trigger1 = !time
value = 3312

[State 0, VelSet]
type = VelSet
trigger1 = !time
x = 0
y = 25
[State 0, PosSet]
type = PosSet
trigger1 = !time
y = -240

[State 0, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

;persistent =

[Statedef 3313]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = -1

[State 826, 1]
type = ChangeAnim2
Trigger1 = !time && !SelfAnimExist(5937)
value = 3313

[State 826, 1]
type = ChangeAnim
Trigger1 = !time && SelfAnimExist(5937)
value = 5937

[State 827, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 0, AngleAdd]
type = AngleAdd
trigger1 = Anim != 5937
value = 32
[State 0, AngleDraw]
type = AngleDraw
trigger1 = Anim != 5937

[State 827, Vel]
type = veladd
trigger1 = 1
y = 0.58

[State 827, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 827, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 5100

[Statedef 3314]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = -1

[State 826, 1]
type = ChangeAnim2
Trigger1 = !time && !SelfAnimExist(5937)
value = 3313

[State 826, 1]
type = ChangeAnim
Trigger1 = !time && SelfAnimExist(5937)
value = 5937

[State 827, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0
ignorehitpause = 1

[State 0, AngleAdd]
type = AngleAdd
trigger1 = Anim != 5937
value = 32
[State 0, AngleDraw]
type = AngleDraw
trigger1 = Anim != 5937

[State 827, Vel]
type = veladd
trigger1 = 1
y = 0.58

[State 827, End]
type = PosSet
trigger1 = pos x != [-200,200]
y = 999
[State 827, End]
type = VelSet
trigger1 = pos y = 999
y = 0
x = 0
[State 827, End]
type = selfstate
trigger1 = pos y = 999
value = 5150



;====<LONDON SILVER>=
[StateDef 3200]
type = S
physics = N
moveType = A
anim = 3200
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = -3000
faceP2 = 1

[State 3200, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "b+c"), 2, ifElse((command = "a+c"), 1, 0))

[State 3200, Super Cancel Flag]
type = VarSet
trigger1 = !Time
var(21) = ((PrevStateNo = [1000,2999]) && var(7)) || var(20)

[State 3200, Hyper Cancel Flag]
type = VarSet
trigger1 = !Time
var(22) = (PrevStateNo = [3000,4999]) && var(8)

[State 3200, Custom Combo Reset]
type = PalFX
trigger1 = !Time
trigger1 = !(var(20) := 0)
time = 1

[State 3200, Corner Push]
type = VarSet
trigger1 = 1
fvar(5) = 0

[State 3200, Unguardable]
type = VarSet
trigger1 = Time = 3 && NumEnemy
trigger1 = (EnemyNear, StateNo != [120,155])
var(17) = 47

[State 3200, Super Cancel Flash]
type = PalFX
trigger1 = var(21) || var(22)
trigger1 = !(Time % 2) && Time <= 12
time = 1
add = 255,255,255
ignoreHitPause = 1

[State 3200, Super Cancel Juggle]
type = VarSet
trigger1 = !Time
trigger1 = var(21) || var(22)
var(15) = 0
ignoreHitPause = 1

[State 3200, NotHitBy]
type = NotHitBy
trigger1 = !(pos y > -vel y)
time = 1
value = SCA

[State 3200, Super Pause FX]
type = Helper
trigger1 = Time = 3
helperType = Normal
stateNo = 8520
ID = 8500
name = "Superpause FX"
posType = p1
pos = ceil(-35 * const(size.xScale)), ceil(-36 * const(size.yScale))
superMoveTime = 255
size.xScale = 1
size.yScale = 1
ownpal = 1

[State 3200, Super Pause]
type = SuperPause
trigger1 = Time = 3
time = 47
moveTime = 47
p2DefMul = 1
unHittable = 1
anim = -1
sound = s0,8500
darken = 0

[State 3200, Voice 1]
type = PlaySnd
trigger1 = !Time
value = 6,0
channel = 0

[State 182, twirl]
type = playsnd
trigger1 = !time
value = 1,3
channel = 1

[State 3200, Jumping Sound]
type = PlaySnd
trigger1 = AnimElem = 14
value = 0,41
channel = 3

[State 3200, StateTypeSet: Air, Physics: None]
type = StateTypeSet
trigger1 = AnimElem = 14
stateType = A
physics = N

[State 3200, Dust Helper]
type = Helper
trigger1 = AnimElem = 14
helperType = Normal
stateNo = 8100
ID = 8100
name = "London Silver Dust"
posType = P1
ownPal = 1

[State 1000, VelSet]
type = VelSet
trigger1 = AnimElem=14
x = 4.0+var(10) * 3
y = -(3.95+var(10)*.65)*1.75

[State 1000, VelSet]
type = VelAdd
trigger1 = AnimElemTime(14)>0
y = .875

[State 1100, End]
type = ChangeState
trigger1 = pos y > -vel y
value = 3201


;Landing
[StateDef 3201]
type = S
anim = 3201
physics = N
moveType = A
velSet = 0,0

[State 3201, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3201, Landing Dust Explod]
type = Explod
trigger1 = !Time
anim = 8102
sprPriority = -3
posType = P1
scale = 0.5,0.5
pauseMoveTime = -1
superMoveTime = -1
ownPal = 1

[State 3201, Landing Sound]
type = PlaySnd
trigger1 = !Time
value = 0,52

[State 3201, Stick woosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1,2
channel = 1

[State 3000, HitDef]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 2
ID = 3200
attr = A, HA
hitFlag = MAF
guardFlag = H
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 98 < 7, 7, fvar(11) * 98)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 12
ground.slideTime = 12
guard.hitTime = 12
air.hitTime = 120
ground.velocity = 0, 6.24
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerPush.velOff = 0
air.velocity = 0, 12.24
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 107), var(36) := -76
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd= -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3201, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget(3200)
trigger1 = !(Target(3200), Time)
value = ifElse(Target(3200), StateType = A, 3208, 3205)
ID = 3200
ignoreHitPause = 1
persistent = 0

[State 3201, ChangeState]
type = ChangeState
trigger1 = NumTarget(3200)
trigger1 = MoveHit && Target, Alive
value = 3210

[State 3201, StateTypeSet: Idle]
type = StateTypeSet
trigger1 = AnimElemTime(3) >= 0
moveType = I

[State 3010, TargetBind]
type = TargetBind
trigger1 = MoveHit && NumTarget(3200)
trigger1 = !(Target(3200), Time)
pos = 50,0
ignoreHitPause = 1

[State 3201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Success
[StateDef 3210]
type = S
anim = 3210
physics = N
moveType = A
velSet = 0,0

[State 3210, Voice]
type = PlaySnd
trigger1 = AnimElem = 8
value = 6,4
channel = 0

[State 3210, Woosh]
type = playsnd
trigger1 = AnimElem = 10
trigger2 = AnimElem = 16
trigger3 = AnimElem = 22
value = 1,2
channel = 1

[State 3210, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(24) < 0
edge = 80,0

[State 3210, Hit 1]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 11
ID = 3210
attr = S, HA
hitFlag = MAFD
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = 0,0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 84), var(36) := -14
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3210, TargetState]
type = TargetState
trigger1 = MoveHit && NumTarget
value = 3215
ID = 3210
ignoreHitPause = 1
persistent = 0

[State 3210, Hit 2]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 17
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 94), var(36) := -57
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3210, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 23
ID = 3211
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 7, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 97), var(36) := -112
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0

[State 3211, ChangeState]
type = ChangeState
trigger1 = NumTarget(3211)
trigger1 = MoveHit && Target, Alive
value = 3211

[State 3210, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Ranbu portion
[StateDef 3211]
type = S
anim = 3211
physics = N
moveType = A
velSet = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 18
value = S4,7
channel = 0

[State 3211, Width]
type = Width
trigger1 = NumTarget && AnimElemTime(62) < 0
edge = 80,0

[State 3211, MP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 30 || AnimElem = 38 || AnimElem = 41
value = 1,1

[State 3211, HP Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 9 || AnimElem = 20 || AnimElem = 48 || AnimElem = 54 || AnimElem = 61
value = 1,2

[State 3211, Hit Sound]
type = Null
trigger1 = AnimElem = 31 || AnimElem = 38 || AnimElem = 41
trigger1 = var(31) := 1
trigger2 = AnimElem = 9 || AnimElem = 22 || AnimElem = 49 || AnimElem = 56
trigger2= var(31) := 2

[State 3211, Spark XY]
type = Null
trigger1 = AnimElem = 9
trigger1 = var(35) := 102 || var(36) := -34
trigger2 = AnimElem = 22
trigger2 = var(35) := 107 || var(36) := -76
trigger3 = AnimElem = 31
trigger3 = var(35) := 71 || var(36) := -31
trigger4 = AnimElem = 38
trigger4 = var(35) := 35 || var(36) := -67
trigger5 = AnimElem = 41
trigger5 = var(35) := 59 || var(36) := -90
trigger6 = AnimElem = 49
trigger6 = var(35) := 72 || var(36) := -53
trigger7 = AnimElem = 56
trigger7 = var(35) := 72 || var(36) := -48
trigger8 = AnimElem = 62
trigger8 = var(35) := 40 || var(36) := -91


[State 3211, HitDef: High]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 38 || AnimElem = 41
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = High
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
p2Facing = 1

[State 3211, HitDef: Low]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 9 || AnimElem = 22 || AnimElem = 31 || AnimElem = 49 || AnimElem = 56
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 14 < 7, 4, fvar(11) * 14)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 0,0
guard.pauseTime = 0,0
animType = Hard
air.animType = Back
fall.animType = Back
ground.type = Low
air.type = Low
ground.hitTime = 30
ground.slideTime = 30
guard.hitTime = 30
air.hitTime = 120
ground.velocity = 0,0
ground.cornerPush.velOff = 0
guard.velocity = 0
guard.cornerPush.velOff = 0
air.velocity = -4.32, -7.49
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0*(var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 18
envShake.ampl = 6
envShake.freq = 120
kill = 0
p2Facing = 1

[State 3211, Upwards Hit]
type = HitDef
trigger1 = !var(16) && var(15) < 1
trigger1 = AnimElem = 62
ID = 3212
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 35 < 7, 7, fvar(11) * 35)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 12,12
guard.pauseTime = 12,12
animType = Up
air.animType = Up
fall.animType = Up
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = 0, -14.21
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = 0, -14.21
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitSound = -1 + 0 * (var(31) := 2)
guardSound = -1 + 0 * (var(32) := 0)
sparkNo = -1 + 0 * (var(33) := 8014)
guard.sparkNo = -1 + 0 * (var(34) := 8001)
sparkXY = -10 + 0 * (var(35) := 40), var(36) := -91
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120
kill = 0

[State 3211, ChangeState]
type = ChangeState
trigger1 = NumTarget(3212)
trigger1 = MoveHit && Target, Alive
value = 3212

[State 3211, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;Finish
[StateDef 3212]
type = S
anim = 3212
physics = N
moveType = A
velSet = 0,0
hitcountpersist = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = S1,2
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = S6,6
channel = 0

[State 0, Explod]
type = Explod
trigger1 = animelem = 9
anim =  1405
bindTime = -1
sprpriority = 3
postype = p1
pos = 0,0
scale = 0.5,0.5
ownpal = 1
removeongethit = 1
ignorehitpause = 0

[State 3211, Spark XY]
type = Null
trigger1 = AnimElem = 9
trigger1 = var(35) := 63 || var(36) := -27
trigger2 = AnimElem = 10
trigger2 = var(35) := 73 || var(36) := -121

[State 3212, Final Hit]
type = HitDef
trigger1 = !var(16) && var(15) < (1 + HitCount)
trigger1 = AnimElem = 9
ID = 3213
attr = S, HA
hitFlag = MAF
guardFlag = M
priority = 4, Hit
damage = ceil(ifElse(fvar(11) * 147 < 7, 7, fvar(11) * 147)), 7
getPower = 0,0
givePower = 36, 36
pauseTime = 24,24
guard.pauseTime = 24,24
animType = DiagUp
air.animType = DiagUp
fall.animType = DiagUp
ground.type = High
air.type = Low
ground.hitTime = 18
ground.slideTime = 18
guard.hitTime = 18
air.hitTime = 120
ground.velocity = -5.5, -8.5
ground.cornerPush.velOff = 0
guard.velocity = -12.64
guard.cornerPush.velOff = 0
air.velocity = -5.5, -8.5
air.cornerPush.velOff = 0
yAccel = 0.5
fall = 1
fall.recover = 1
fall.recoverTime = 120
forceStand = 1
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1 + 0 * (var(32) := 0)
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkXY = -10, -55
palFX.time = 12 * var(9)
palFX.add = 255, 255, 255
palFX.sinAdd = -255, -255, -255, 48
envShake.time = 14
envShake.ampl = 4
envShake.freq = 120

[State 3200, PlaySnd]
type = PlaySnd
trigger1 = NumTarget(3213)
trigger1 = MoveHit = 1
value = 2,3200
channel = 3
ignoreHitPause = 1
persistent = 0

[State -2, TargetState]
type = TargetState
trigger1 = NumTarget(3213)
trigger1 = movehit = 1 && var(30) = hitpausetime
value = 3217
ID = 3213
ignoreHitPause = 1

[State 3212, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



;Being Slammed (Standing)
[StateDef 3205]
type = U
moveType = H
physics = N
velset = 0,0

[State 3205, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = ifElse(SelfAnimExist(5111) || SelfAnimExist(5112), 5012, 5070)

[State 3205, ChangeAnim]
type = ChangeAnim
trigger1 = SelfAnimExist(5420 + (StateType = C))
value = 5420 + (StateType = C)

[State 3205, End]
type = SelfState
trigger1 = HitShakeOver && pos y < 0
trigger2 = StateType = L
value = 5030

[State 3205, End]
type = ChangeState
trigger1 = HitShakeOver && pos y >= 0
value = 3206


;Hitting the Ground
[StateDef 3206]
type = L
moveType = H
physics = N
velSet = 0,0

[State 3206, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5102) && PrevStateNo != 3209, 5102, ifElse(SelfAnimExist(5101) && PrevStateNo != 3209, 5101, 5100))

[State 3206, ChangeAnim]
type = ChangeAnim
triggerall = !Time && PrevStateNo != 3209
trigger1 = SelfAnimExist(5422)
value = 5422

[State 3206, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3206, HitFallDamage]
type = HitFallDamage
trigger1 = !Time

[State 3206, EnvShake]
type = EnvShake
trigger1 = !Time
time = 14
ampl = -4

[State 3206, Impact Sound]
type = PlaySnd
trigger1 = !Time
value = F7,1

[State 3206, Hitting the Floor FX]
type = Explod
trigger1 = !Time
anim = F61
posType = P1
pos = 0, 0
sprPriority = -3

[State 3206, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = Anim = 5100 + (Anim % 10)
trigger2 = Time = 4
trigger2 = Anim != 5422
trigger3 = Anim = 5422
trigger3 = AnimTime = 0 || Time = 12
value = 3207


;Bouncing Off Ground
[StateDef 3207]
type = L
moveType = H
physics = N

[State 3207, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(SelfAnimExist(5160 + Anim % 10), 5160 + Anim % 10, 5160)

[State 3207, ChangeAnim]
type = ChangeAnim
triggerall = !Time && Anim = 5422
trigger1 = SelfAnimExist(5424)
value = 5424

[State 3207, VelSet]
type = VelSet
trigger1 = !Time
y = -10.75

[State 3207, PosSet]
type = PosSet
trigger1 = !Time
y = const(movement.down.bounce.offset.y)

[State 3207, PosAdd]
type = PosAdd
trigger1 = !Time
x = const(movement.down.bounce.offset.x)

[State 3207, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.625

[State 3207, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 5424
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = ifElse(SelfAnimExist(5162), 5162, ifElse(SelfAnimExist(5161), 5161, 5160))

[State 3207, End]
type = SelfState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.down.bounce.groundlevel)
value = 5110


;Aerial Being Slammed (Hitshake)
[StateDef 3208]
type = A
moveType = H
physics = N
velSet = 0,0

[State 3208, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5070

[State 3208, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3208, ChangeAnim]
type = ChangeState
trigger1 = HitShakeOver
value = 3209


;Aerial Being Slammed (Knocked Away)
[StateDef 3209]
type = A
moveType = H
physics = N
ctrl = 0

[State 3209, VelAdd]
type = VelAdd
trigger1 = Time > 0
y = GetHitVar(yaccel)

[State 3209, HitVelSet]
type = HitVelSet
trigger1 = !Time
x = 1
y = 1

[State 3209, ChangeState]
type = ChangeState
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.trip.groundlevel)
value = 3206



;Target (Canterbury Blue hit 1)
[StateDef 3215]
type = S
moveType = H
physics = N
velSet = 0,0

[State 3215, PosSet]
type = PosSet
trigger1 = !Time
y = 0

[State 3215, HitFallSet]
type = HitFallSet
trigger1 = !Time
value = 0

[State 3215, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 5022

[State 3215, ChangeAnim]
type = ChangeAnim
trigger1 = Time > 0
value = Anim

[State 3215, ChangeState]
type = ChangeState
trigger1 = HitShakeOver
value = 3216


;Sliding
[StateDef 3216]
type = S
movetype = H
physics = S

[State 3016, ChangeAnim]
type = ChangeAnim
trigger1 = !AnimTime
value = 5027

[State 3216, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 3216, SelfState]
type = SelfState
trigger1 = HitOver
value = 0
ctrl = 1


;Hit by final hit of London Silver
[Statedef 3217]
type = A
movetype= H
physics = N
velset = 0,0

[State 3217, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(airtype) = 1),5000,5010) + GetHitVar(animtype)

[State 3217, 2]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 3217, 3]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 826, 1]
type = ChangeAnim
Trigger1 = !time && SelfAnimExist(5937)
value = 5937

[State 3217, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 3217, 5]
type = ChangeState
trigger1 = HitShakeOver
value = ifElse(Life>0, 3218, 3220)


; Air get-hit (knocked away)
[Statedef 3218]
type = A
movetype= H
physics = N
ctrl = 0

[State 3218, 1]
type = ChangeAnim
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
trigger1 = Anim != 5937
value = 5030

[State 3218, 2]
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 3218, 3]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 3218, 5]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= Const(movement.air.gethit.groundlevel)
value = 3219 ;HITA_FALL

[State 5030, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 3219 ;Air get-hit (transition)


; Air get-hit (falling)
[Statedef 3219]
type = A
movetype= H
physics = N

[State 3219, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim = 5035
trigger2 = Time = 0     ;If no transition anim
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090 ;Not if hit off ground anim
value = 5050

[State 3219, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, Const720p(4), Const720p(-8))
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 3219, 3] ;Gravity
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 3219, 4] ;Recover near ground
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= Const(movement.air.gethit.groundrecover.ground.threshold)
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200 ;Air get-hit (fall recovery on ground)

[State 3219, 5]; Recover in mid air
type = ChangeState
triggerall = Vel Y > Const(movement.air.gethit.airrecover.threshold)
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5210 ;Air get-hit (fall recovery in air)

[State 3219, 6]
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, Const(movement.air.gethit.groundlevel))
value = 5100 ;Downed get-hit (hit ground from fall)


;Flying off the screen, dead
[Statedef 3220]
type = A
movetype= H
physics = N
ctrl = 0

[State 827, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0
ignorehitpause = 1

[State 3218, 1]
type = ChangeAnim
trigger1 = Anim != [5000, 5199]
trigger1 = SelfAnimExist(5030)
trigger1 = Anim != 5937
value = 5030

[State 3218, 2]
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 3218, 3]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 827, End]
type = PosSet
trigger1 = pos x != [-200,200]
y = 999
[State 827, End]
type = VelSet
trigger1 = pos y = 999
y = 0
x = 0
[State 827, End]
type = selfstate
trigger1 = pos y = 999
value = 5150
