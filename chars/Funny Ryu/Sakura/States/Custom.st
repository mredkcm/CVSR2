; _________________________________
;| Sakura by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;======================================< CUSTOM STATES >=========================================
;==============================================================================================

;========================< KICKED by EX SHUNPUU R.K. >=============================
;--- Hit Pause ---
[Statedef 1111230]
type = A
movetype = H
physics = N
velset = 0, 0
[State 1111230, Anim]
type = changeanim
trigger1 = 1
value = 5012
[State 1111230, End]
type = changestate
trigger1 = hitshakeover
value = 1111231


;--- Falling ---
[Statedef 1111231]
type = A
movetype = H
physics = N

[State 1111231, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 1111231, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 1111231, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1111231, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111231, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 1111231, bounce]
type = changestate
trigger1 = backedgebodydist <= 10 || frontedgebodydist <= 10
value = 1111232
[State 1111231, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;--- Hitting Wall ---
[Statedef 1111232]
type = A
movetype = H
physics = N

[State 1111232, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1111232, Pos]
type = posset
trigger1 = 1
x = -160 * facing
[State 1111232, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1111232, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1111232, Push]
type = playerpush
trigger1 = 1
value = 1

[State 1111232, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1111232, snd]
type = playsnd
trigger1 = !time
value = f7, 0
[State 1111232, FX]
type = explod
trigger1 = !time
anim = f72
pos = 0, floor(screenpos y) -50
postype = back
sprpriority = 3

[State 1111232, End]
type = changestate
trigger1 = time >= 4
value = 1111233


;--- Falling ---
[Statedef 1111233]
type = A
movetype = H
physics = N

[State 1111233, turn]
type = turn
trigger1 = !time

[State 1111233, Accel]
type = veladd
trigger1 = 1
y = 0.5
[State 1111233, Vel]
type = velset
trigger1 = !time
x = -2.5
y = -9

[State 1111233, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)
[State 1111233, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime
value = 5050
[State 1111233, Anim]
type = changeanim
trigger1 = vel y > -3 && anim = 5051
value = 5061

[State 1111233, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 1111233, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111233, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1111233, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100
