;#ADD004BASIC PIEs#
; _______________________________________
;| Edmond Honda by Phantom.of.the.Server |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================< COMMAND FILE >=======================================
;==============================================================================================

;====================< BUTTON REMAPPING >====================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s


;====================< DEFAULT VALUES >====================

[Defaults]
command.time = 15
command.buffer.time = 1


;====================< SINGLE BUTTON >====================

[Command]
name = "a"
command = a
time = 1
[Command]
name = "b"
command = b
time = 1
[Command]
name = "c"
command = c
time = 1
[Command]
name = "x"
command = x
time = 1
[Command]
name = "y"
command = y
time = 1
[Command]
name = "z"
command = z
time = 1
[Command]
name = "start"
command = s
time = 1


;====================< HOLD DIR >====================

[Command]
name = "holdfwd"
command = /$F
time = 1
[Command]
name = "holdback"
command = /$B
time = 1
[Command]
name = "holdup"
command = /$U
time = 1
[Command]
name = "holddown"
command = /$D
time = 1


;====================< HOLD BUTTON >====================

[Command]
name = "holda"
command = /a
time = 1
[Command]
name = "holdb"
command = /b
time = 1
[Command]
name = "holdc"
command = /c
time = 1
[Command]
name = "holdx"
command = /x
time = 1
[Command]
name = "holdy"
command = /y
time = 1
[Command]
name = "holdz"
command = /z
time = 1
[Command]
name = "holdstart"
command = /s
time = 1


;====================< DIR >====================

[Command]
name = "fwd"
command = F
time = 1
[Command]
name = "back"
command = B
time = 1
[Command]
name = "up"
command = U
time = 1
[Command]
name = "down"
command = D
time = 1


;====================< RELEASE DIR >====================

[Command]
name = "rlsfwd"
command = ~$F
time = 1
[Command]
name = "rlsback"
command = ~$B
time = 1
[Command]
name = "rlsup"
command = ~$U
time = 1
[Command]
name = "rlsdown"
command = ~$D
time = 1


;====================< RELEASE BUTTON >====================

[Command]
name = "rlsx"
command = ~x
time = 1
[Command]
name = "rlsy"
command = ~y
time = 1
[Command]
name = "rlsz"
command = ~z
time = 1
[Command]
name = "rlsa"
command = ~a
time = 1
[Command]
name = "rlsb"
command = ~b
time = 1
[Command]
name = "rlsc"
command = ~c
time = 1


;====================< SUPER MOTIONS >====================

[Command]
name = "6321463214p"
command = ~F, D, DB, DF, D, DB, B, x
time = 64
[Command]
name = "6321463214p"
command = ~F, D, DB, DF, D, DB, B, y
time = 64
[Command]
name = "6321463214p"
command = ~F, D, DB, DF, D, DB, B, z
time = 64
[Command]
name = "6321463214p"
command = ~F, D, DB, DF, D, DB, B, ~x
time = 64
[Command]
name = "6321463214p"
command = ~F, D, DB, DF, D, DB, B, ~y
time = 64
[Command]
name = "6321463214p"
command = ~F, D, DB, DF, D, DB, B, ~z
time = 64

[Command]
name = "4646pp"
command = ~$B, F, B, F, x+y
time = 32
[Command]
name = "4646pp"
command = ~$B, F, B, F, x+z
time = 32
[Command]
name = "4646pp"
command = ~$B, F, B, F, y+z
time = 32

[Command]
name = "4646p"
command = ~$B, F, B, F, x
time = 32
[Command]
name = "4646p"
command = ~$B, F, B, F, y
time = 32
[Command]
name = "4646p"
command = ~$B, F, B, F, z
time = 32
[Command]
name = "4646p"
command = ~$B, F, B, F, ~x
time = 32
[Command]
name = "4646p"
command = ~$B, F, B, F, ~y
time = 32
[Command]
name = "4646p"
command = ~$B, F, B, F, ~z
time = 32

[Command]
name = "4646kk"
command = ~$B, F, B, F, a+b
time = 32
[Command]
name = "4646kk"
command = ~$B, F, B, F, a+c
time = 32
[Command]
name = "4646kk"
command = ~$B, F, B, F, b+c
time = 32

[Command]
name = "4646k"
command = ~$B, F, B, F, a
time = 32
[Command]
name = "4646k"
command = ~$B, F, B, F, b
time = 32
[Command]
name = "4646k"
command = ~$B, F, B, F, c
time = 32
[Command]
name = "4646k"
command = ~$B, F, B, F, ~a
time = 32
[Command]
name = "4646k"
command = ~$B, F, B, F, ~b
time = 32
[Command]
name = "4646k"
command = ~$B, F, B, F, ~c
time = 32


;====================< SPECIAL MOTIONS >====================

[Command]
name = "63214pp"
command = ~F, D, DB, x+y
time = 32
[Command]
name = "63214pp"
command = ~F, D, DB, x+z
time = 32
[Command]
name = "63214pp"
command = ~F, D, DB, y+z
time = 32

[Command]
name = "63214p"
command = ~F, D, DB, x
time = 32
[Command]
name = "63214p"
command = ~F, D, DB, y
time = 32
[Command]
name = "63214p"
command = ~F, D, DB, z
time = 32
[Command]
name = "63214p"
command = ~F, D, DB, ~x
time = 32
[Command]
name = "63214p"
command = ~F, D, DB, ~y
time = 32
[Command]
name = "63214p"
command = ~F, D, DB, ~z
time = 32

[Command]
name = "46pp"
command = ~$B, F, x+y
time = 16
[Command]
name = "46pp"
command = ~$B, F, x+z
time = 16
[Command]
name = "46pp"
command = ~$B, F, y+z
time = 16

[Command]
name = "46p"
command = ~$B, F, x
time = 16
[Command]
name = "46p"
command = ~$B, F, y
time = 16
[Command]
name = "46p"
command = ~$B, F, z
time = 16
[Command]
name = "46p"
command = ~$B, F, ~x
time = 16
[Command]
name = "46p"
command = ~$B, F, ~y
time = 16
[Command]
name = "46p"
command = ~$B, F, ~z
time = 16

[Command]
name = "28kk"
command = ~$D, $U, a+b
time = 16
[Command]
name = "28kk"
command = ~$D, $U, a+c
time = 16
[Command]
name = "28kk"
command = ~$D, $U, b+c
time = 16

[Command]
name = "28k"
command = ~$D, $U, a
time = 16
[Command]
name = "28k"
command = ~$D, $U, b
time = 16
[Command]
name = "28k"
command = ~$D, $U, c
time = 16
[Command]
name = "28k"
command = ~$D, $U, ~a
time = 16
[Command]
name = "28k"
command = ~$D, $U, ~b
time = 16
[Command]
name = "28k"
command = ~$D, $U, ~c
time = 16

[Command]
name = "412p"
command = ~B, DB, D, x
time = 16
[Command]
name = "412p"
command = ~B, DB, D, y
time = 16
[Command]
name = "412p"
command = ~B, DB, D, z
time = 16

[Command]
name = "412k"
command = ~B, DB, D, a
time = 16
[Command]
name = "412k"
command = ~B, DB, D, b
time = 16
[Command]
name = "412k"
command = ~B, DB, D, c
time = 16

[Command]
name = "236x"
command = ~D, DF, F, x
time = 16
[Command]
name = "236y"
command = ~D, DF, F, y
time = 16
[Command]
name = "236z"
command = ~D, DF, F, z
time = 16

[Command]
name = "236a"
command = ~D, DF, F, a
time = 16
[Command]
name = "236b"
command = ~D, DF, F, b
time = 16
[Command]
name = "236c"
command = ~D, DF, F, c
time = 16

[Command]
name = "236pp"
command = ~D, DF, F, x+y
time = 16
[Command]
name = "236pp"
command = ~D, DF, F, x+z
time = 16
[Command]
name = "236pp"
command = ~D, DF, F, y+z
time = 16




;====================< OTHER >====================

[Command]
name = "highjump"
command = $D, $U
time = 15


;====================< DOUBLE TAP >====================

[Command]
name = "FF"
command = F, F
time = 10
[Command]
name = "BB"
command = B, B
time = 10


;====================< 2/3 BUTTON COMBINATION >====================

[Command]
name = "recovery"
command = x+y
time = 1
[Command]
name = "recovery"
command = x+z
time = 1
[Command]
name = "recovery"
command = y+z
time = 1
[Command]
name = "recovery"
command = a+x
time = 1

[Command]
name = "pp"
command = x+y
time = 1
[Command]
name = "pp"
command = x+z
time = 1
[Command]
name = "pp"
command = y+z
time = 1

[Command]
name = "kk"
command = a+b
time = 1
[Command]
name = "kk"
command = a+c
time = 1
[Command]
name = "kk"
command = b+c
time = 1

[Command]
name = "a+x"
command = a+x
time = 1

[Command]
name = "b+y"
command = b+y
time = 1

[Command]
name = "c+z"
command = c+z
time = 1


;==============================================================================================
;========================================< -1 STATES >===========================================
;==============================================================================================

[Statedef -1]

;//==========================
;// add004-1-sctrls-start
;//==========================
;--- partner_standby
[state 0]
	type=selfstate
	value=190190
	ctrl=0
	trigger1=ctrl && numpartner && !ishelper && roundstate=2 && pos y=0
	trigger1=(sysfvar(4)>0) && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=(playerid(floor(sysfvar(0))),var(0)=90900) && (playerid(floor(sysfvar(0))),var(22)=4)
	ignorehitpause=1
;##Add.List01##
;//==========================
;// add004-1-sctrls-end
;//==========================




[State -1, Tick Fix]
type = ctrlset
triggerall = !ctrl
trigger1 = (stateno = 52 || stateno = 101 || stateno = 5120) && !animtime
trigger2 = (stateno = [200, 499]) && !animtime
trigger3 = ((stateno = [760, 762]) || (stateno = [700, 715]) || (stateno = [900, 905])) && !animtime
trigger4 = stateno = 810 && !animtime
trigger5 = (stateno = 5001 || stateno = 5011 || stateno = 151 || stateno = 153) && hitover
value = 1

[State -1, Roll Forward]
type = changestate
value = 710
triggerall = !AIlevel
triggerall = command = "a+x"
triggerall = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101])) && command = "holdfwd"
trigger2 = var(20) && var(4)

[State -1, Roll Backward]
type = changestate
value = 715
triggerall = !AIlevel
triggerall = command = "a+x"
triggerall = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101])) && command = "holdback"

[State -1, Dodge]
type = changestate
value = 700
triggerall = !AIlevel
triggerall = command = "a+x"
triggerall = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101]))

[State -1, Orochi Kudaki]
type = changestate
value = 3100
triggerall = !AIlevel
triggerall = command = "6321463214p"
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 3000 && !var(20)
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7)

[State -1, MAX Oni Musou]
type = changestate
value = 3050
triggerall = !AIlevel
triggerall = command = "4646pp" && ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 0)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 2000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || var(8)

[State -1, MAX Fuji Oroshi]
type = changestate
value = 3250
triggerall = !AIlevel
triggerall = command = "4646kk" && ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 0)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 2000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7) || var(8)

[State -1, Oni Musou]
type = changestate
value = 3000
triggerall = !AIlevel
triggerall = command = "4646p" && ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 0)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7)

[State -1, Fuji Oroshi]
type = changestate
value = 3200
triggerall = !AIlevel
triggerall = command = "4646k" && ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 0)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 1000 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(7)

[State -1, EX Super Hyakkan Otoshi]
type = changestate
value = 1230
triggerall = !AIlevel
triggerall = command = "28kk" && ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(50) > 16)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Super Zutsuki]
type = changestate
value = 1130
triggerall = !AIlevel
triggerall = command = "46pp" && ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 16)
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Hyakuretsu Harite]
type = changestate
value = 1030
triggerall = !AIlevel
triggerall = (command = "pp" && var(45) >= 5) || (command = "236pp")
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, EX Ooichou Nage]
type = changestate
value = 1330
triggerall = !AIlevel
triggerall = command = "63214pp"
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Super Hyakkan Otoshi]
type = changestate
value = 1200
triggerall = !AIlevel
triggerall = command = "28k" && ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(50) > 16)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Super Zutsuki]
type = changestate
value = 1100
triggerall = !AIlevel
triggerall = command = "46p" && ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 16)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Hyakuretsu Harite]
type = changestate
value = 1000
triggerall = !AIlevel
triggerall = ((command = "x" || command = "y" || command = "z") && var(45) >= 5) || (command = "236x" || command = "236y" || command = "236z")
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Ooichou Nage]
type = changestate
value = 1300
triggerall = !AIlevel
triggerall = command = "63214p"
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52 || (stateno = [100, 101])
trigger2 = var(6)

[State -1, Zero Counter]
type = changestate
value = 750
trigger1 = !AIlevel
trigger1 = stateno = 150 || stateno = 152
trigger1 = command = "412p" || command = "412k"
trigger1 = roundstate = 2 && statetype != A
trigger1 = power >= 1000 && !var(20)

[State -1, Custom Combo]
type = changestate
value = ifelse(statetype = A, 905, 900)
trigger1 = !AIlevel
trigger1 = command = "c+z"
trigger1 = roundstate = 2
trigger1 = power >= 1000 && !var(20)
trigger1 = ctrl || stateno = 52 || (stateno = [100, 101])

[State -1, Power Charge]
type = changestate
value = 730
trigger1 = !AIlevel
trigger1 = command = "holdb" && command = "holdy"
trigger1 = roundstate = 2 && statetype != A
trigger1 = power < const(data.power) && power < powermax && !var(20)
trigger1 = ctrl || (stateno = [100, 101])

[State -1, Dash / Run]
type = changestate
value = 102
trigger1 = !AIlevel
trigger1 = command = "FF"
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl

[State -1, Dash Backward]
type = changestate
value = 105
trigger1 = !AIlevel
trigger1 = command = "BB"
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl

[State -1, Throw]
type = changestate
value = 800
trigger1 = !AIlevel
trigger1 = (command = "holdfwd" || command = "holdback") && (command = "pp" || command = "kk")
trigger1 = roundstate = 2 && statetype = S
trigger1 = ctrl

[State -1, SHP]
type = changestate
value = 220
triggerall = !AIlevel
triggerall = command != "holddown" && command = "z"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, Harai -geri]
type = changestate
value = 255
triggerall = !AIlevel
triggerall = command != "holddown" && command = "holdfwd" && command = "c"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, SHK]
type = changestate
value = 250
triggerall = !AIlevel
triggerall = command != "holddown" && command = "c"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, SMP]
type = changestate
value = 210
triggerall = !AIlevel
triggerall = command != "holddown" && command = "y"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, ScMK]
type = changestate
value = 241
triggerall = !AIlevel
triggerall = command != "holddown" && command = "b"
triggerall = statetype != A
triggerall = p2bodydist x <= (const(size.xscale) * 16)
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, SfMK]
type = changestate
value = 240
triggerall = !AIlevel
triggerall = command != "holddown" && command = "b"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, SLP]
type = changestate
value = 200
triggerall = !AIlevel
triggerall = command != "holddown" && command = "x"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, SLK]
type = changestate
value = 230
triggerall = !AIlevel
triggerall = command != "holddown" && command = "a"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CHP]
type = changestate
value = 420
triggerall = !AIlevel
triggerall = command = "holddown" && command = "z"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CHK]
type = changestate
value = 450
triggerall = !AIlevel
triggerall = command = "holddown" && command = "c"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CMP]
type = changestate
value = 410
triggerall = !AIlevel
triggerall = command = "holddown" && command = "y"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CMK]
type = changestate
value = 440
triggerall = !AIlevel
triggerall = command = "holddown" && command = "b"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CLP]
type = changestate
value = 400
triggerall = !AIlevel
triggerall = command = "holddown" && command = "x"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, CLK]
type = changestate
value = 430
triggerall = !AIlevel
triggerall = command = "holddown" && command = "a"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(4)

[State -1, AHP]
type = changestate
value = 621
triggerall = !AIlevel
triggerall = command = "z"
triggerall = statetype = A && !vel x
trigger1 = ctrl
trigger2 = var(4)

[State -1, AHP]
type = changestate
value = 620
triggerall = !AIlevel
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, AHK]
type = changestate
value = 650
triggerall = !AIlevel
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, AMP]
type = changestate
value = 610
triggerall = !AIlevel
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, AMK]
type = changestate
value = 640
triggerall = !AIlevel
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, ALP]
type = changestate
value = 600
triggerall = !AIlevel
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, ALK]
type = changestate
value = 630
triggerall = !AIlevel
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Taunt]
type = changestate
value = 195
triggerall = !AIlevel
triggerall = command = "start"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger2 = var(6)


;==============================================================================================
;===========================================< A.I >==============================================
;==============================================================================================

[State -1, Fall Recovery]
type = changestate
value = 5210
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && alive
trigger1 = stateno = 5050 && canrecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = random < (25 * (AIlevel ** 2 / 64.0))

[State -1, Fall Recovery]
type = changestate
value = 5200
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && alive
trigger1 = stateno = 5050 && gethitvar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Jump]
type = changestate
value = 40
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = enemynear, movetype = A && p2bodydist x < 160 && enemynear, hitdefattr = SC, AT

[State -1, Roll Forward]
type = changestate
value = 710
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A
trigger1 = random < (75 * (AIlevel ** 2 / 64.0))
trigger1 = (ctrl || (stateno = [100, 101])) && var(20) <= 164 && !var(26)
trigger1 = (enemynear, movetype = A) && !(enemynear, hitdefattr = SCA, AT) && (p2bodydist x = [95, 127])

[State -1, Dodge]
type = changestate
value = 700
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A
trigger1 = random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = (ctrl || (stateno = [100, 101])) && var(20) <= 164 && !var(26)
trigger1 = (enemynear, movetype = A) && !(enemynear, hitdefattr = SCA, AT) && (p2bodydist x = [0, 60])

[State -1, Dash Backward]
type = changestate
value = 105
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = S
triggerall = ctrl && (stateno != [100, 106]) && var(20) <= 150 && !var(26)
trigger1 = (enemynear, movetype = A) && backedgedist >= 80 && (p2bodydist x = [80, 120]) && (enemynear, vel x = [ -12, 2])
trigger1 = random < (ifelse((enemynear, hitdefattr = SC, AT), 150, 50) * (AIlevel ** 2 / 64.0))
;trigger2 = (p2bodydist x = [0, 80]) && backedgebodydist >= 80
;trigger2 = enemynear, stateno = 5120 && enemynear, animtime = -4 && random < (750 * (AIlevel ** 2 / 64.0))

[State -1, Guard]
type = changestate
value = 120
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && inguarddist
trigger1 = ctrl && (stateno != [120, 155]) && !var(20)
trigger1 = !var(26) || p2bodydist x >= 40
trigger1 = !(enemynear, hitdefattr = SCA, AT) && (enemynear, time < 120)
trigger1 = statetype != A || p2statetype = A
trigger1 = ifelse(statetype = A, ((var(3) != [1, 2]) || stateno = 5210), 1)
trigger1 = random < (ifelse((p2stateno = [200, 699]), 100, ifelse((p2stateno = [1000, 2999]), 333, 1000)) * (AIlevel ** 2 / 64.0))

[State -1, Zero Counter]
type = changestate
value = 750
trigger1 = AIlevel && numenemy
trigger1 = stateno = 150 || stateno = 152
trigger1 = roundstate = 2 && statetype != A
trigger1 = power >= 1000 && var(20) <= 60
trigger1 = random < (25 * (AIlevel ** 2 / 64.0))
trigger1 = (p2bodydist x = [0, 50]) && (life < 0.5 * lifemax)

[State -1, Power Charge]
type = changestate
value = 730
triggerall = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A
trigger1 = power < const(data.power) && !var(20)
trigger1 = ctrl && power < const(data.power) && power < powermax && !var(20)
trigger1 = !inguarddist && p2bodydist x >= 160 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Custom Combo]
type = changestate
value = ifelse(statetype = A, 905, 900)
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && (statetype != A || (vel x > 0 && vel y >= 0))
trigger1 = power >= 1000 && !var(20)
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = (enemynear, movetype = A) && (p2bodydist x = [0, 40]) && (p2dist y = [ -60, 60]) && (enemynear, vel y >= 0)
trigger1 = (enemynear, stateno = [200, 699]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger1 = (enemynear, backedgebodydist <= 32 || enemynear, frontedgebodydist <= 32)

[State -1, Super Zutsuki CC]
type = changestate
value = 1100
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && var(20) > 30
triggerall = (p2bodydist x = [ -96, 96]) && (p2dist y = [ -67, 0]) && p2statetype != L
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger2 = stateno = 900 && !animtime && ctrl
trigger3 = var(6) && movehit && random < (100 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = 1110 || stateno = 1210) && var(6)

[State -1, Dash Under]
type = changestate
value = 102
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = (enemynear, stateno = [5020, 5040]) && !(enemynear, hitfall)
triggerall = !(enemynear, ctrl) && p2dist y < -64 && enemynear, vel y < 4 && p2statetype = A
trigger1 = stateno = 52 && time = 2 && ctrl
trigger2 = (stateno = [200, 499]) && !animtime && ctrl

[State -1, SHP CC]
type = changestate
value = 220
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && var(20) > 30
triggerall = (p2bodydist x = [28, 64]) && (p2dist y = [ -86, 0]) && p2statetype = A
triggerall = (enemynear, backedgebodydist <= 32 || enemynear, frontedgebodydist <= 32)
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger3 = var(6) && movehit && random < (100 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = 1110 || stateno = 1210) && var(6)

[State -1, Throw]
type = changestate
value = 800
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = S
triggerall = p2statetype != A && p2statetype != L && p2movetype != H
triggerall = (p2bodydist x = [ -22, 32]) && p2dist y = 0 
trigger1 = ctrl && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (p2stateno = [120, 140]) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Harai -geri]
type = changestate
value = 255
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [61, 93]) && (p2dist y = [ -12, 0]) && p2statetype != A && p2statetype != L
trigger1 = (ctrl || (stateno = [100, 101])) && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 9) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SHP]
type = changestate
value = 220
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2dist y = [ -86, 0]) && p2statetype != L
triggerall = ifelse(p2statetype = A, (p2bodydist x = [28, 64]), (p2bodydist x = [ -22, 64]))
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101]))
trigger1 = random < (ifelse(p2statetype = A, 250, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 7) && power >= 1000 && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SHK]
type = changestate
value = 250
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 50]) && (p2dist y = [ -70, 0]) && p2statetype != C && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse(p2statetype = A, 200, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 4) && power >= 1000 && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CHP]
type = changestate
value = 420
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [64, 78]) && (p2dist y = [ -12, 60]) && p2statetype != A && p2statetype != L
triggerall = (p2statetype = S || (p2statetype = C && p2movetype = H))
trigger1 = (ctrl || (stateno = [100, 101])) && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 4) && power >= 1000 && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CHK]
type = changestate
value = 450
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [48, 52]) && (p2dist y = [ -12, 60]) && p2statetype != A && p2statetype != L
triggerall = (p2statetype = S || (p2statetype = C && p2movetype = H))
trigger1 = (ctrl || (stateno = [100, 101])) && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 4) && power >= 1000 && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, AHP]
type = changestate
value = 621
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A && !vel x
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 40]) && (p2dist y = [ -38, 45]) && p2statetype = S
trigger1 = ctrl
trigger1 = vel y > 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(4) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AHP]
type = changestate
value = 620
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A && vel x
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 40]) && (p2dist y = [ -38, 45]) && p2statetype = S
trigger1 = ctrl
trigger1 = vel y > 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(4) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AHK]
type = changestate
value = 650
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 59]) && (p2dist y = [ -20, 63]) && p2statetype != A && p2statetype != L
trigger1 = ctrl
trigger1 = vel y > 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(4) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SMP]
type = changestate
value = 210
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 57]) && (p2dist y = [ -40, 0]) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse(p2statetype = A, 200, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 4) && power >= 1000 && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, ScMK]
type = changestate
value = 241
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = p2bodydist x = [ -26, ceil(const(size.xscale) * 16)]
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 20]) && (p2dist y = [ -62, 0]) && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse(p2statetype = A, 200, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 4) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SfMK]
type = changestate
value = 240
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = p2bodydist x > ceil(const(size.xscale) * 16)
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 50]) && (p2dist y = [ -40, 0]) && p2statetype != A && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse(p2statetype = A, 200, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 3) && power >= 1000 && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CMP]
type = changestate
value = 410
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 64]) && (p2dist y = [ -26, 0]) && p2statetype != A && p2statetype != L
trigger1 = (ctrl || (stateno = [100, 101])) && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 4) && power >= 1000 && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CMK]
type = changestate
value = 440
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 49]) && (p2dist y = [ -33, 0]) && p2statetype != A && p2statetype != L
trigger1 = (ctrl || (stateno = [100, 101])) && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 3) && power >= 1000 && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, AMP]
type = changestate
value = 610
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 57]) && (p2dist y = [ -110, 16]) && p2statetype = A
trigger1 = ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(4) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AMK]
type = changestate
value = 640
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -64, -16]) && (p2dist y = [ -32, 51]) && p2statetype != A && p2statetype != L
trigger1 = ctrl
trigger1 = vel y > 0 && random < (200 * (AIlevel ** 2 / 64.0))
trigger2 = var(4) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SLP]
type = changestate
value = 200
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 49]) && (p2dist y = [ -35, 0]) && p2statetype != A && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse(p2statetype = A, 200, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 3) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, SLK]
type = changestate
value = 230
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 48]) && (p2dist y = [ -12, 0]) && p2statetype != A && p2statetype != L
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse(p2statetype = A, 200, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 3) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CLP]
type = changestate
value = 400
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 60]) && (p2dist y = [ -19, 0]) && p2statetype != A && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse(p2statetype = A, 200, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 3) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, CLK]
type = changestate
value = 430
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 54]) && (p2dist y = [ -12, 0]) && p2statetype != A && p2statetype != L
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = (ctrl || (stateno = [100, 101])) && random < (ifelse(p2statetype = A, 200, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && !animtime && ctrl
trigger2 = movehit && (enemynear, gethitvar(hittime) >= 3) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, ALP]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 45]) && (p2dist y = [ -40, 43]) && p2statetype != A && p2statetype != L
trigger1 = ctrl
trigger1 = vel y > 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(4) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, ALK]
type = changestate
value = 630
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype = A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -44, 4]) && (p2dist y = [ -42, 41]) && p2statetype != A && p2statetype != L
trigger1 = ctrl
trigger1 = vel y > 0 && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(4) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Ooichou Nage]
type = changestate
value = 1300
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = p2statetype != A && p2statetype != L
triggerall = p2dist x >= 0 && p2bodydist x <= ceil(32 * const(size.xscale)) && p2dist y = 0
triggerall = (enemynear, hitover || !(enemynear, movetype = H) || var(20)) && !(enemynear, stateno = [150, 155]) && enemynear, anim != 5040
triggerall = !(enemynear, stateno = 40 && enemynear, time >= 0) && !(enemynear, stateno = 52 && !(enemynear, ctrl) && enemynear, prevstateno = [5020, 5040])
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = random < (ifelse((p2stateno = [120, 140]), 250, 125) * (AIlevel ** 2 / 64.0))

[State -1, Super Zutsuki]
type = changestate
value = 1100
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
;triggerall = ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 16)
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 320]) && (p2dist y = [ -66, 0]) && p2statetype != L
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = (p2bodydist x = [ -22, 16]) && p2statetype = A && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && movehit && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = enemynear, gethitvar(hittime) >= 7

[State -1, Super Hyakkan Otoshi]
type = changestate
value = 1200
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
;triggerall = ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(50) > 16)
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 152]) && (p2dist y = [ -64, 0]) && p2stateno != 5120
triggerall = p2statetype != A || p2movetype = H
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = random < (ifelse(inguarddist, 50, 10) * (AIlevel ** 2 / 64.0))
trigger2 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger2 = p2stateno = 5100 && (enemynear, time = 1) && random < (250 * (AIlevel ** 2 / 64.0))

[State -1, Hyakuretsu Harite]
type = changestate
value = 1000
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = !var(16) && (var(15) < 1 || var(20))
triggerall = (p2bodydist x = [ -22, 80]) && (p2dist y = [ -54, 0])
triggerall = (p2statetype != A || p2movetype = H) && p2statetype != L
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = random < (ifelse((p2stateno = [120, 155]), 100, 50) * (AIlevel ** 2 / 64.0))
trigger2 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger2 = enemynear, gethitvar(hittime) >= 4 && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = var(6) && movehit && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = enemynear, gethitvar(hittime) >= 8

[State -1, Orochi Kudaki]
type = changestate
value = 3100
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 3000 && !var(20)
triggerall = !var(16) && (var(15) < 1 || var(20) || (stateno = [1000, 4999]))
triggerall = !(enemynear, ctrl) && p2stateno != 5201
triggerall = p2dist x >= 0 && p2bodydist x <= ceil(32 * const(size.xscale))
triggerall = (enemynear, hitover || !(enemynear, movetype = H) || var(21)) && !(enemynear, stateno = [150, 155]) && enemynear, anim != 5040
triggerall = !(enemynear, stateno = 40 && enemynear, time >= 1) && !(enemynear, stateno = 52 && !(enemynear, ctrl) && enemynear, prevstateno = [5020, 5040])
triggerall = p2statetype != A && p2statetype != L && (p2dist y = [ -48, 0])
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101])) && random < (500 * (AIlevel ** 2 / 64.0))

[State -1, MAX Oni Musou]
type = changestate
value = 3050
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
;triggerall = ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 16)
triggerall = power >= 2000 && var(20) <= 60
triggerall = !var(16) && (var(15) < 4 || var(20) || (stateno = [1000, 4999]))
triggerall = (enemynear, movetype != A) || (enemynear, stateno = [200, 699])
triggerall = !(enemynear, ctrl) && ((enemynear, stateno != [120, 155]) || enemynear, statetype = A)
triggerall = (p2bodydist x = [ -78, 78]) && (p2dist y = [ -67, 0])
triggerall = p2statetype != A && p2statetype != L && power < 3000
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = var(7) && movehit && random < (ifelse((var(20) = [1, 30]), 200, 50) * (AIlevel ** 2 / 64.0))
trigger2 = enemynear, gethitvar(hittime) >= 5

[State -1, MAX Fuji Oroshi]
type = changestate
value = 3250
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
;triggerall = ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 16)
triggerall = power >= 2000 && var(20) <= 60
triggerall = !var(16) && (var(15) < 2 || var(20) || (stateno = [1000, 4999]))
triggerall = (enemynear, movetype != A) || (enemynear, stateno = [200, 699])
triggerall = !(enemynear, ctrl) && ((enemynear, stateno != [120, 155]) || enemynear, statetype = A)
triggerall = ifelse((enemynear, statetype = A && enemynear, movetype = H), (enemynear, hitfall), 1)
triggerall = (p2bodydist x = [ -112, 112]) && (p2dist y = [ -64, 0])
triggerall = p2statetype != L && p2movetype != A
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101])) && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = var(7) && movehit && random < (ifelse((var(20) = [1, 30]), 200, 50) * (AIlevel ** 2 / 64.0))
trigger2 = (p2bodydist x = [ -32, 32]) && enemynear, gethitvar(hittime) >= 5
trigger3 = var(8) && movehit
trigger3 = stateno = 3001 && animelemtime(5) = 1
trigger3 = enemynear, gethitvar(hittime) >= 5

[State -1, Oni Musou]
type = changestate
value = 3000
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
;triggerall = ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 16)
triggerall = power >= 1000 && var(20) <= 60
triggerall = !var(16) && (var(15) < 2 || var(20) || (stateno = [1000, 4999]))
triggerall = !(enemynear, ctrl) && ((enemynear, stateno != [120, 155]) || enemynear, statetype = A)
triggerall = (p2bodydist x = [ -78, 78]) && (p2dist y = [ -67, 0])
triggerall = (p2statetype != A || var(20)) && p2statetype != L && p2movetype != A
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101])) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = var(7) && movehit && random < (ifelse((var(20) = [1, 30]), 200, 50) * (AIlevel ** 2 / 64.0))
trigger2 = enemynear, gethitvar(hittime) >= 7

[State -1, Fuji Oroshi]
type = changestate
value = 3200
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
;triggerall = ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 16)
triggerall = power >= 1000 && var(20) <= 60
triggerall = !var(16) && (var(15) < 2 || var(20) || (stateno = [1000, 4999]))
triggerall = !(enemynear, ctrl) && ((enemynear, stateno != [120, 155]) || enemynear, statetype = A)
triggerall = ifelse((enemynear, statetype = A && enemynear, movetype = H), (enemynear, hitfall), 1)
triggerall = (p2bodydist x = [ -88, 88]) && (p2dist y = [ -64, 0])
triggerall = p2statetype != L && p2movetype != A
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101])) && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = var(7) && movehit && random < (ifelse((var(20) = [1, 30]), 50, 25) * (AIlevel ** 2 / 64.0))
trigger2 = (p2bodydist x = [ -32, 32]) && enemynear, gethitvar(hittime) >= 7

[State -1, EX Ooichou Nage]
type = changestate
value = 1330
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
triggerall = !(enemynear, ctrl)
triggerall = p2statetype != A && p2statetype != L
triggerall = p2dist x >= 0 && p2bodydist x <= ceil(34 * const(size.xscale)) && p2dist y = 0
triggerall = (enemynear, hitover || !(enemynear, movetype = H) || var(20)) && !(enemynear, stateno = [150, 155]) && enemynear, anim != 5040
triggerall = !(enemynear, stateno = 40 && enemynear, time >= 0) && !(enemynear, stateno = 52 && !(enemynear, ctrl) && enemynear, prevstateno = [5020, 5040])
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = random < (ifelse((p2stateno = [120, 140]), 250, 125) * (AIlevel ** 2 / 64.0))

[State -1, EX Super Zutsuki]
type = changestate
value = 1130
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
;triggerall = ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(48) > 16)
triggerall = power >= 500 && var(20) <= 60
triggerall = !var(16) && (var(15) < 2 || var(20))
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [ -22, 320]) && (p2dist y = [ -66, 0]) && p2statetype != L
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = (p2bodydist x = [ -22, 16]) && p2statetype = A && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = var(6) && movehit && random < (100 * (AIlevel ** 2 / 64.0))
trigger2 = enemynear, gethitvar(hittime) >= 7

[State -1, EX Super Hyakkan Otoshi]
type = changestate
value = 1230
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
;triggerall = ifelse(var(20) > 0 || (stateno = [1000, 4999]), 1, var(50) > 16)
triggerall = power >= 500 && var(20) <= 60
triggerall = !var(16) && (var(15) < 2 || var(20))
triggerall = !(enemynear, ctrl) && (enemynear, stateno != [120, 155])
triggerall = (p2bodydist x = [ -22, 152]) && (p2dist y = [ -64, 0])
triggerall = p2statetype != A && p2statetype != L
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = random < (25 * (AIlevel ** 2 / 64.0))

[State -1, EX Hyakuretsu Harite]
type = changestate
value = 1030
triggerall = AIlevel && numenemy
triggerall = roundstate = 2 && statetype != A
triggerall = power >= 500 && var(20) <= 60
triggerall = !(enemynear, ctrl) && ((enemynear, stateno != [120, 155]) || enemynear, statetype = A)
triggerall = !var(16) && (var(15) < 4 || var(20))
triggerall = (p2bodydist x = [ -22, 80]) && (p2dist y = [ -54, 0])
triggerall = (p2statetype != A || p2movetype = H) && p2statetype != L
trigger1 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger1 = (p2stateno = [120, 155]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (ctrl || stateno = 52 || (stateno = [100, 101]))
trigger2 = enemynear, gethitvar(hittime) >= 4 && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = var(6) && movehit && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = enemynear, gethitvar(hittime) >= 8

[State -1, Taunt]
type = changestate
value = 195
triggerall = AIlevel && numenemy
triggerall = statetype != A && life >= 0.5 * lifemax
triggerall = (enemynear, life) <= 0.5 * (enemynear, lifemax)
trigger1 = ctrl
trigger1 = p2dist x >= 160 && !(enemynear, ctrl)
trigger1 = (enemynear, movetype = H) && (enemynear, hitfall) && random < (50 * (AIlevel ** 2 / 64.0))

