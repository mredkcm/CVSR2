; ________________________________________________
;| Dan by Phantom.of.the.Server and Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;===< TAUNT STATES >=
;==
		
;===< Standing >==
[Statedef 400]
type = S
movetype = I
physics = S
anim = 400
velset = 0, 0
poweradd = 56 * (!var(20) && (prevstateno != [800, 849]))
sprpriority = 1
ctrl = 0
facep2 = 1

[State 400, snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 13
channel = 0
[State 400, snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 400, delay]
type = changeanim
trigger1 = animelem = 19 && prevstateno != 820 && command = "holdstart"
value = 400
elem = 17
[State 400, afterthrow]
type = changeanim
trigger1 = animelem = 10 && prevstateno = 820
value = 400
elem = 18
[State 400, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Crouching >==
[Statedef 401]
type = C
movetype = A
physics = C
anim = 401
velset = 0, 0
poweradd = 56 * (!var(20) && (prevstateno != [800, 849]))
sprpriority = 1
ctrl = 0
facep2 = 1

[State 1600, dist]
type = attackdist
trigger1 = 1
value = 0

[State 260, Hit]
type = hitdef
trigger1 = !time
attr = C, HA
damage = 5, 10 ;NO, it's NOT a bug, it IS supposed to do more damage when guarded, OK?
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAFD
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkNo = -1 + 0 * (var(43) := 8010)
guard.sparkNo = -1 + 0*(var(44) := 8000)
sparkXY = -10 + 0 * (var(45) := 30), var(46) := -60
hitsound = s2, 1
guardsound = s2, 0
ground.type = Low
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = 0

[State 401, snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 1
channel = 0
[State 401, snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 401, delay]
type = changeanim
trigger1 = animelem = 19 && prevstateno != 810 && command = "holdstart"
value = 401
elem = 17
[State 401, afterthrow]
type = changeanim
trigger1 = animelem = 10 && prevstateno = 810
value = 401
elem = 18
[State 401, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Air >==
[Statedef 402]
type = A
movetype = A
physics = A
velset = vel x, ifelse(vel y <0,vel y*ifelse(vel x,ifelse(AIlevel && prevstateno!=1700,1.5,1.75),1.5), vel y)
anim = 402
poweradd = 28
sprpriority = 1
ctrl = 0

[State 1600, dist]
type = attackdist
trigger1 = 1
value = 0

[State 260, Hit]
type = hitdef
trigger1 = !time
attr = A, HA
damage = 5, 10 ;NO, it's NOT a bug, it IS supposed to do damage when guarded, OK?
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = H
hitflag = MAFD
priority = 4, Hit
pausetime = ifelse(var(20), 4, 8), ifelse(var(20), 4, 8)
sparkNo = -1 + 0 * (var(43) := 8010)
guard.sparkNo = -1 + 0*(var(44) := 8000)
sparkXY = -10 + 0 * (var(45) := 30), var(46) := -60
hitsound = s2, 4
guardsound = s2, 0
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = ifelse(var(20), -2.66, -4.49), 0
guard.velocity = ifelse(var(20), -2.66, -4.49)
ground.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
guard.cornerpush.veloff = 0;ifelse(var(20), -4.33, -8.17)
air.type = Low
air.hittime = 18
air.velocity = ifelse(var(20), -2.5, -5), -7
air.cornerpush.veloff = 0
getpower = 72 * !var(20), 36 * !var(20)
givepower = 36, 36
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = ifelse(var(20), -4, -8), -1.5
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = 0

[State 402, snd]
type = playsnd
trigger1 = animelem = 2
value = 4, ifelse(!(gametime%2),60,17)
channel = 0
[State 402, snd]
type = playsnd
triggerall = !(gametime%2)
trigger1 = animelem = 2
value = 4, 60
channel = 7
[State 402, snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1


;===< Rolling Forward >==
[Statedef 403]
type = C
movetype = I
physics = C
anim = 403
velset = 0, 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 0, NotHitBy]
type = hitby
trigger1 = animelemtime(15)<0
value = SC,SA,HA,AT
time = 1
ignorehitpause = 1
persistent = 1

[State 403, Push]
type = playerpush
trigger1 = animelemtime(15) < 0
value = 0
[State 403, turn]
type = turn
trigger1 = animelem = 16 && p2dist x < 0
[State 403, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(14) < 0
x = 5

[State 403, snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 40
[State 403, dust]
type = explod
trigger1 = animelemtime(3) >= 0 && animelemtime(15) < 0 && !(time % 5)
anim = 7103
scale = 0.5, 0.5
sprpriority = 3
postype = p1
vel = -1, 0
ownpal = 1

[State 403, Power]
type = poweradd
trigger1 = animelem = 17
value = 70 * !var(20)

[State 403, snd]
type = playsnd
trigger1 = animelem = 19
value = 4, 59;14;ifelse(random<500,2,14)
channel = 0
[State 403, snd]
type = playsnd
trigger1 = animelem = 19
value = 1, 1
channel = 1

[State 403, sts]
type = statetypeset
trigger1 = animelemtime(16) >= 0
statetype = S
physics = S
[State 403, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Rolling Backward >==
[Statedef 404]
type = C
movetype = I
physics = C
anim = 404
velset = 0, 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 0, NotHitBy]
type = hitby
trigger1 = animelemtime(15)<0
value = SC,SA,HA,AT
time = 1
ignorehitpause = 1
persistent = 1

[State 404, Push]
type = playerpush
trigger1 = animelemtime(15) < 0
value = 0
[State 404, turn]
type = turn
trigger1 = animelem = 16 && p2dist x < 0
[State 404, Vel]
type = velset
trigger1 = animelemtime(3) >= 0 && animelemtime(14) < 0
x = -5

[State 404, snd]
type = playsnd
trigger1 = animelem = 3
value = 0, 40
[State 404, dust]
type = explod
trigger1 = animelemtime(3) >= 0 && animelemtime(15) < 0 && !(time % 5)
anim = 7103
scale = 0.5, 0.5
sprpriority = 3
postype = p1
vel = 1, 0
ownpal = 1

[State 404, Power]
type = poweradd
trigger1 = animelem = 19
value = 70 * !var(20)

[State 404, snd]
type = playsnd
trigger1 = animelem = 19
value = 4, 2;ifelse(random<500,2,14)
channel = 0
[State 404, snd]
type = playsnd
trigger1 = animelem = 19
value = 1, 1
channel = 1

[State 404, sts]
type = statetypeset
trigger1 = animelemtime(16) >= 0
statetype = S
physics = S
[State 404, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Chouhatsu Shinwa Standing >==
[Statedef 410]
type = S
movetype = I
physics = S
anim = 400
velset = 0, 0
poweradd = 250 * (prevstateno != 410)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 410, buttonvar]
type = varset
trigger1 = !time
var(34) = ifelse(command = "x", 1, ifelse(command = "y", 2, ifelse(command = "z", 3, ifelse(command = "a", 4, ifelse(command = "b", 5, ifelse(command = "c", 6, ceil(random / 167)))))))

[State 415, snd]
type = stopsnd
trigger1 = animelem = 3
channel = 7
[State 410, snd]
type = playsnd
trigger1 = animelem = 3 && (var(34) = [1, 3])
value = 4, ifelse(var(34) = 1, 63, ifelse(var(34) = 2, 64, 66))
channel = 0
[State 410, snd]
type = playsnd
trigger1 = animelem = 3 && (var(34) = [1, 3])
value = 4, ifelse(var(34) = 1, 63, ifelse(var(34) = 2, 64, 66))
channel = 7
[State 410, snd]
type = playsnd
trigger1 = animelem = 3 && (var(34) = [4, 6])
value = 4, ifelse(var(34) = 4, 67, ifelse(var(34) = 5, 68, 69))
channel = 0
[State 410, snd]
type = playsnd
trigger1 = animelem = 3 && (var(34) = [4, 6])
value = 4, ifelse(var(34) = 4, 67, ifelse(var(34) = 5, 68, 69))
channel = 7
[State 410, snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 410, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;===< Chouhatsu Shinwa Crouching >==
[Statedef 411]
type = C
movetype = I
physics = C
anim = 401
velset = 0, 0
poweradd = 250 * (prevstateno != 411)
sprpriority = 1
ctrl = 0
facep2 = 1

[State 411, buttonvar]
type = varset
trigger1 = !time
var(34) = ifelse(command = "x", 1, ifelse(command = "y", 2, ifelse(command = "z", 3, ifelse(command = "a", 4, ifelse(command = "b", 5, ifelse(command = "c", 6, ceil(random / 167)))))))

[State 415, snd]
type = stopsnd
trigger1 = animelem = 3
channel = 7
[State 411, snd]
type = playsnd
trigger1 = animelem = 3 && (var(34) = 1)
value = 3, ifelse(var(34) = 1, 0, ifelse(var(34) = 2, 1, 2))
channel = 0
[State 411, snd]	
type = playsnd
trigger1 = animelem = 3 && (var(34) = [2,3])
value = 4, ifelse(var(34) = 3, 71, 72)
channel = 0
[State 411, snd]
type = playsnd
trigger1 = animelem = 3 && (var(34) = [2,3])
value = 4, ifelse(var(34) = 3, 71, 72)	
channel = 7
[State 411, snd]
type = playsnd
trigger1 = animelem = 3 && (var(34) = [4, 6])
value = 4, ifelse(var(34) = 4, 2, ifelse(var(34) = 5, 1, 11))
channel = 0
[State 411, snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 1
channel = 1

[State 411, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Chouhatsu Shinwa Air >==
[Statedef 412]
type = A
movetype = I
physics = A
velset = vel x, ifelse(vel y <0,vel y*ifelse(vel x,1.75,1.5), vel y)
anim = 402
poweradd = 250
sprpriority = 1
ctrl = 0

[State 412, buttonvar]
type = varset
trigger1 = !time
var(34) = ifelse(command = "x", 1, ifelse(command = "y", 2, ifelse(command = "z", 3, ifelse(command = "a", 4, ifelse(command = "b", 5, ifelse(command = "c", 6, ceil(random / 167)))))))

[State 415, snd]
type = stopsnd
trigger1 = animelem = 2
channel = 7
[State 412, snd]
type = playsnd
trigger1 = var(34) = [1,3]
trigger1 = animelem = 2
value = 4, ifelse(var(34) = 3, 60, ifelse(var(34)=2,61,17))
channel = 0
[State 412, snd]
type = playsnd
trigger1 = var(34) = [2,3]	
trigger1 = animelem = 2
value = 4, ifelse(var(34) = 3, 60, ifelse(var(34)=2,61,17))
channel = 7
[State 412, snd]
type = playsnd
trigger1 = var(34) = [4,6]
trigger1 = animelem = 2
value = 4, ifelse(var(34) = 4, 36, ifelse(var(34)=5,84,87))
channel = 0
[State 412, snd]
type = playsnd
trigger1 = var(34) = [5,6]
trigger1 = animelem = 2
value = 4, ifelse(var(34) = 4, 36, ifelse(var(34)=5,84,87))
channel = 7
[State 412, snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1


;===< Chouhatsu Shinwa Rolling Forward >==
[Statedef 413]
type = C
movetype = I
physics = C
anim = 413
velset = 0, 0
poweradd = 250
sprpriority = 1
ctrl = 0
facep2 = 1

[State 0, NotHitBy]
type = hitby
trigger1 = animelemtime(14)<0
value = SC,SA,HA,AT
time = 1
ignorehitpause = 1
persistent = 1

[State 413, buttonvar]
type = varset
trigger1 = !time
var(34) = ifelse(command = "x", 1, ifelse(command = "y", 2, ifelse(command = "z", 3, ifelse(command = "a", 4, ifelse(command = "b", 5, ifelse(command = "c", 6, ceil(random / 167)))))))

[State 413, Push]
type = playerpush
trigger1 = animelemtime(14) < 0
value = 0
[State 413, turn]
type = turn
trigger1 = animelem = 14 && p2dist x < 0
[State 413, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(13) < 0
x = 7.5

[State 413, snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 40
[State 413, dust]
type = explod
trigger1 = animelemtime(2) >= 0 && animelemtime(14) < 0 && !(time % 4)
anim = 7103
scale = 0.5, 0.5
sprpriority = 3
postype = p1
vel = -1, 0
ownpal = 1

[State 415, snd]
type = stopsnd
trigger1 = animelem = 16
channel = 7
[State 413, snd]
type = playsnd
trigger1 = animelem = 16 && (var(34) = [1, 3])
value = 4, ifelse(var(34) = 1, 11, ifelse(var(34) = 2, 13, 62))
channel = 0
[State 413, snd]
type = playsnd
trigger1 = animelem = 16 && (var(34) = 3)
value = 4, ifelse(var(34) = 1, 11, ifelse(var(34) = 2, 13, 62))
channel = 7
[State 413, snd]
type = playsnd
trigger1 = animelem = 16 && (var(34) = [4, 6])
value = 4, ifelse(var(34) = 4, 14, ifelse(var(34) = 5, 28, 59))
channel = 0
[State 413, snd]
type = playsnd
trigger1 = animelem = 16
value = 1, 1
channel = 1

[State 413, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Chouhatsu Shinwa Rolling Backward >==
[Statedef 414]
type = C
movetype = I
physics = C
anim = 414
velset = 0, 0
poweradd = 250
sprpriority = 1
ctrl = 0
facep2 = 1

[State 0, NotHitBy]
type = hitby
trigger1 = animelemtime(14)<0
value = SC,SA,HA,AT
time = 1
ignorehitpause = 1
persistent = 1

[State 414, buttonvar]
type = varset
trigger1 = !time
var(34) = ifelse(command = "x", 1, ifelse(command = "y", 2, ifelse(command = "z", 3, ifelse(command = "a", 4, ifelse(command = "b", 5, ifelse(command = "c", 6, ceil(random / 167)))))))

[State 414, Push]
type = playerpush
trigger1 = animelemtime(14) < 0
value = 0
[State 414, turn]
type = turn
trigger1 = animelem = 14 && p2dist x < 0
[State 414, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(13) < 0
x = -7.5

[State 414, snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 40
[State 414, dust]
type = explod
trigger1 = animelemtime(2) >= 0 && animelemtime(14) < 0 && !(time % 4)
anim = 7103
scale = 0.5, 0.5
sprpriority = 3
postype = p1
vel = -1, 0
ownpal = 1

[State 415, snd]
type = stopsnd
trigger1 = animelem = 16
channel = 7
[State 413, snd]
type = playsnd
trigger1 = animelem = 16 && (var(34) = [1, 3])
value = 4, ifelse(var(34) = 1, 11, ifelse(var(34) = 2, 13, 62))
channel = 0
[State 413, snd]
type = playsnd
trigger1 = animelem = 16 && (var(34) = 3)
value = 4, ifelse(var(34) = 1, 11, ifelse(var(34) = 2, 13, 62))
channel = 7
[State 414, snd]
type = playsnd
trigger1 = animelem = 16 && (var(34) = [4, 6])
value = 4, ifelse(var(34) = 4, 14, ifelse(var(34) = 5, 28, 59))
channel = 0
[State 414, snd]
type = playsnd
trigger1 = animelem = 16
value = 1, 1
channel = 1

[State 414, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;===< Chouhatsu Shinwa Special >==
[Statedef 415]
type = S
movetype = I
physics = S
anim = 415
velset = 0, 0
poweradd = 200
sprpriority = 1
ctrl = 0
facep2 = 1

[State 411, buttonvar]
type = varset
trigger1 = !time
var(34) = ifelse(command = "holddown", 1, ifelse(command = "holdfwd", 2, ifelse(command = "holdback", 3, ifelse(!AIlevel, 4, (ceil(random / 250))))))

[State 415, snd]
type = stopsnd
trigger1 = animelem = 2 
channel = 7
[State 415, snd]
type = playsnd
triggerall = var(34) = 1 || var(34) = 4
trigger1 = animelem = 2 
value = 4, ifelse(var(34)=4,5,3)
channel = 0
[State 415, snd]
type = playsnd
triggerall = var(34) = [2,3]
trigger1 = animelem = 2 
value = 4, ifelse(var(34)=3,65,70)
channel = 0
[State 415, snd]
type = playsnd
triggerall = var(34) = [2,3]
trigger1 = animelem = 2 
value = 4, ifelse(var(34)=3,65,70)
channel = 7
[State 415, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
