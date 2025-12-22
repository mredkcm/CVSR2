; ________________________________
;| Karin by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====< CUSTOM STATES >===
;==

;====< HIT by EX HOU SHOU >=
;--- Hit Pause ---
[Statedef 1125]
type = A
movetype = H
physics = N
velset = 0, 0
[State 1125, Anim]
type = changeanim
trigger1 = 1
value = 5012
[State 1125, End]
type = changestate
trigger1 = hitshakeover
value = 1126


;--- Falling ---
[Statedef 1126]
type = A
movetype = H
physics = N

[State 1126, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 1126, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 1126, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1126, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1126, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 1126, bounce]
type = changestate
trigger1 = backedgebodydist <= 10 || frontedgebodydist <= 10
value = 1127
[State 1126, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;--- Hitting Wall ---
[Statedef 1127]
type = A
movetype = H
physics = N

[State 1127, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1127, Pos]
type = posset
trigger1 = 1
x = -160 * facing
[State 1127, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1127, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1127, Push]
type = playerpush
trigger1 = 1
value = 1

[State 1127, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1127, snd]
type = playsnd
trigger1 = !time
value = f7, 0
[State 1127, FX]
type = explod
trigger1 = !time
anim = f72
pos = 0, floor(screenpos y) -50
postype = back
sprpriority = 3

[State 1127, End]
type = changestate
trigger1 = time >= 4
value = 1128


;--- Falling ---
[Statedef 1128]
type = A
movetype = H
physics = N

[State 1128, turn]
type = turn
trigger1 = !time

[State 1128, Accel]
type = veladd
trigger1 = 1
y = 0.5
[State 1128, Vel]
type = velset
trigger1 = !time
x = -2.5
y = -9

[State 1128, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)
[State 1128, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime
value = 5050
[State 1128, Anim]
type = changeanim
trigger1 = vel y > -3 && anim = 5051
value = 5061

[State 1128, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 1128, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1128, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1128, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;====< HIT by BEAM >=
;--- Hit Pause ---
[Statedef 3270]
type = A
movetype = H
physics = N
velset = 0, 0

[State 3270, Anim]
type = changeanim
trigger1 = !selfanimexist(7696)
value = 5002
[State 3270, Anim]
type = changeanim
trigger1 = selfanimexist(7696)
trigger1 = anim != 7696
value = 7696

[State 3270, palfx]
type = palfx
trigger1 = !selfanimexist(7696)
trigger1 = !(gametime % 2)
time = 1
color = 0
invertall = 1

[State 3270, End]
type = selfstate
trigger1 = hitshakeover
value = 5030