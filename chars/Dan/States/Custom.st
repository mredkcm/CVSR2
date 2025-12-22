; ________________________________________________
;| Dan by Phantom.of.the.Server and Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;==< CUSTOM STATES >=
;==

;====< HIT by EX UPPERCUT >=
[Statedef 1111150]
type = A
movetype = H
physics = N
velset = 0, 0
anim = 5030

[State 1111150, Anim]
type = changeanim2
trigger1 = !time
value = 1111150

[State 1111150, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 1111150, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 1111150, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 1111150, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1111150, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundlevel)
value = 5100

[State 1111150, Offset]
type = offset
trigger1 = 1
y = const(size.mid.pos.y)


;====< KICKED by EX DANKUU KYAKU >=
;--- Hit Pause ---
[Statedef 1111200]
type = A
movetype = H
physics = N
velset = 0, 0
[State 1111200, Anim]
type = changeanim
trigger1 = 1
value = 5002
[State 1111200, End]
type = changestate
trigger1 = hitshakeover
value = 1111201


;--- Falling ---
[Statedef 1111201]
type = A
movetype = H
physics = N

[State 1111201, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 1111201, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 1111201, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1111201, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111201, Anim]
type = changeanim
trigger1 = !time
value = 5030

[State 1111201, bounce]
type = changestate
trigger1 = backedgebodydist <= 10 || frontedgebodydist <= 10
value = 1111202
[State 1111201, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;--- Hitting Wall ---
[Statedef 1111202]
type = A
movetype = H
physics = N

[State 1111202, turn]
type = turn
trigger1 = !time
trigger1 = frontedgedist < backedgedist

[State 1111202, Pos]
type = posset
trigger1 = 1
x = ceil(-160/camerazoom) * facing
[State 1111202, Pos]
type = posfreeze
trigger1 = 1
x = 1
y = 1

[State 1111202, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 1
[State 1111202, Push]
type = playerpush
trigger1 = 1
value = 1

[State 1111202, Anim]
type = changeanim
trigger1 = 1
value = 5000

[State 1111202, snd]
type = playsnd
trigger1 = !time
value = f7, 0
[State 1111202, FX]
type = explod
trigger1 = !time
anim = f72
pos = 0, floor(screenpos y) -50
postype = back
sprpriority = 3

[State 1111202, End]
type = changestate
trigger1 = time >= 4
value = 1111203


;--- Falling ---
[Statedef 1111203]
type = A
movetype = H
physics = N

[State 1111203, turn]
type = turn
trigger1 = !time

[State 1111203, Accel]
type = veladd
trigger1 = 1
y = 0.5
[State 1111203, Vel]
type = velset
trigger1 = !time
x = -1.5
y = -9

[State 1111203, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5051), 5051, 5030)
[State 1111203, Anim]
type = changeanim
trigger1 = anim = 5030 && !animtime
value = 5050
[State 1111203, Anim]
type = changeanim
trigger1 = vel y > -3 && anim = 5051
value = 5061

[State 1111203, screen]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0
[State 1111203, Push]
type = playerpush
trigger1 = 1
value = 0

[State 1111203, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1111203, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 5100


;====< DEAD by the SIGN >=
[Statedef 1111305]
type = S
physics = S
movetype = H
ctrl = 0
velset = 0, 0
sprpriority = 1
[State 1111305, self]
type = selfstate
trigger1 = selfanimexist(5130)
value = 5130
[State 1111305, Anim]
type = changeanim
trigger1 = !time && selfanimexist(5950)
value = 5950
[State 1111305, Anim]
type = changeanim2
trigger1 = !time && !selfanimexist(5950)
value = 1111305

[State 1111305, Stop]
type = posset
trigger1 = 1
y = 0
[State 1111305, Stop]
type = velset
trigger1 = 1
y = 0
[State 1111305, dust]
type = gamemakeanim
trigger1 = anim = 1111305 && animelem = 7
value = 60
pos = 0, 0
under = sysvar(1) <= 14
[State 1111305, snd]
type = playsnd
trigger1 = anim = 1111305 && animelem = 7
value = f7, 0

[State 1111305, Anim]
type = changeanim
trigger1 = anim = 5950 && time >= 120
trigger1 = selfanimexist(5112)
value = 5112
[State 1111305, End]
type = selfstate
trigger1 = !animtime || time >= 120
value = ifelse(alive, 5120, 5150)
