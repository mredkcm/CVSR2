; ______________________________
;| Guy by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;==< CUSTOM STATES >=
;==

;====< HIT by EX HOUZANTOU >=
[Statedef 1111010]
type = A
movetype = H
physics = N
velset = 0, 0
anim = 5030
[State 1111010, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1111010, Push]
type = playerpush
trigger1 = 1
value = 0
[State 1111010, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 1111010, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)
[State 1111010, Anim]
type = changeanim
trigger1 = vel y <= 5
value = 5030
[State 1111010, Anim]
type = changeanim
trigger1 = vel y > 5 && anim != 5035 && selfanimexist(5035)
trigger2 = anim = 5035 && !animtime
value = ifelse((anim = 5030), 5035, 5050)
[State 1111010, End]
type = changestate
trigger1 = vel y <= 5 && (backedgebodydist <= 0 || frontedgebodydist <= 0)
value = 1111011
[State 1111010, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100

[Statedef 1111011]
type = A
movetype = H
physics = N
ctrl = 0
[State 1111011, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1111011, Push]
type = playerpush
trigger1 = 1
value = 0
[State 1111011, Pos]
type = posadd;posset
trigger1 = 1
x = ifelse((frontedgebodydist > backedgebodydist), backedgebodydist, frontedgebodydist);-160 * facing
[State 1111011, freeze]
type = posfreeze
trigger1 = 1
value = 1
[State 1111011, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)
[State 1111011, FX]
type = playsnd
trigger1 = !time
value = f7, 2
[State 1111011, FX]
type = explod
trigger1 = !time
anim = f72
postype = back
pos = 0, floor(screenpos y) -50
sprpriority = 3
[State 1111011, Shake]
type = envshake
trigger1 = !time
time = 12
fre = 90
ampl = 6
[State 1111011, End]
type = changestate
trigger1 = !time
value = 1111012


[Statedef 1111012]
type = A
movetype = H
physics = N
velset = 0, 0
anim = 5030

[State 1111012, screen]
type = screenbound
trigger1 = pos x != [ -80, 80]
value = 1
movecamera = 0, 1

[State 1111012, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111012, Anim]
type = changeanim
trigger1 = anim != 5052 && selfanimexist(5052)
value = 5052

[State 1111012, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime && selfanimexist(5035)
trigger2 = anim = 5035 && !animtime
value = ifelse((anim = 5030), 5035, 5050)

[State 1111012, turn]
type = turn
trigger1 = !time

[State 1111012, Accel]
type = veladd
trigger1 = 1
y = 0.35

[State 1111012, Vel]
type = velset
trigger1 = !time
x = -2
y = -8

[State 1111012, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1111012, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100
