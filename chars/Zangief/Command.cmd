;#ADD004BASIC PIEs#
; _________________________________________
;| Zangief by varo_hades                   |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==============================================================================================
;=======================================<COMMAND FILE>=========================================
;==============================================================================================

;====================<BUTTON REMAPPING>====================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s


;====================<DEFAULT VALUES>====================

[Defaults]
command.time = 15
command.buffer.time = 1



;====================<SINGLE BUTTON>====================

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



;==================<HOLD DIRECTION>==================

[Command]
name = "holdfwd"
command=/$F
time=1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup"
command = /$U
time=1

[Command]
name = "holddown"
command = /$D
time = 1


;====================<HOLD BUTTON>====================

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



;====================<DIRECTION>====================

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



;====================<RELEASE DIR>====================

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



;====================<RELEASE BUTTON>====================

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



;====================<SUPER MOTIONS>====================

[Command]
name = "Final Atomic Buster"
command = ~F, D, B, F, D, B, x
time = 40

[Command]
name = "Final Atomic Buster"
command = ~F, D, B, F, D, B, y
time = 40

[Command]
name = "Final Atomic Buster"
command = ~F, D, B, F, D, B, z
time = 40

[Command]
name = "Final Atomic Buster"
command = ~F, D, B, F, D, B, ~x
time = 40

[Command]
name = "Final Atomic Buster"
command = ~F, D, B, F, D, B, ~y
time = 40

[Command]
name = "Final Atomic Buster"
command = ~F, D, B, F, D, B, ~z
time = 40

[Command]
name = "MAXFinal Atomic Buster"
command = ~F, D, B, F, D, B, x+y
time = 40

[Command]
name = "MAXFinal Atomic Buster"
command = ~F, D, B, F, D, B, y+z
time = 40

[Command]
name = "MAXFinal Atomic Buster"
command = ~F, D, B, F, D, B, x+z
time = 40

[Command]
name = "Final Atomic Buster"
command = ~B, D, F, B, D, F, x
time = 40

[Command]
name = "Final Atomic Buster"
command = ~B, D, F, B, D, F, y
time = 40

[Command]
name = "Final Atomic Buster"
command = ~B, D, F, B, D, F, z
time = 40

[Command]
name = "Final Atomic Buster"
command = ~B, D, F, B, D, F, ~x
time = 40

[Command]
name = "Final Atomic Buster"
command = ~B, D, F, B, D, F, ~y
time = 40

[Command]
name = "Final Atomic Buster"
command = ~B, D, F, B, D, F, ~z
time = 40

[Command]
name = "MAXFinal Atomic Buster"
command = ~B, D, F, B, D, F, x+y
time = 40

[Command]
name = "MAXFinal Atomic Buster"
command = ~B, D, F, B, D, F, y+z
time = 40

[Command]
name = "MAXFinal Atomic Buster"
command = ~B, D, F, B, D, F, x+z
time = 40

[Command]
name = "Super Aerial Russian Slam"
command = ~D, DF, F, D, DF, F, a
time = 40

[Command]
name = "Super Aerial Russian Slam"
command = ~D, DF, F, D, DF, F, b
time = 40

[Command]
name = "Super Aerial Russian Slam"
command = ~D, DF, F, D, DF, F, c
time = 40

[Command]
name = "Super Aerial Russian Slam"
command = ~D, DF, F, D, DF, F, ~a
time = 40

[Command]
name = "Super Aerial Russian Slam"
command = ~D, DF, F, D, DF, F, ~b
time = 40

[Command]
name = "Super Aerial Russian Slam"
command = ~D, DF, F, D, DF, F, ~c
time = 40

[Command]
name = "MAXSuper Aerial Russian Slam"
command = ~D, DF, F, D, DF, F, a+b
time = 40

[Command]
name = "MAXSuper Aerial Russian Slam"
command = ~D, DF, F, D, DF, F, a+c
time = 40

[Command]
name = "MAXSuper Aerial Russian Slam"
command = ~D, DF, F, D, DF, F, b+c
time = 40

[Command]
name = "Siberian Blizzard"
command = ~D, DB, B, D, DB, B, a
time = 40

[Command]
name = "Siberian Blizzard"
command = ~D, DB, B, D, DB, B, b
time = 40

[Command]
name = "Siberian Blizzard"
command = ~D, DB, B, D, DB, B, c
time = 40

[Command]
name = "Siberian Blizzard"
command = ~D, DB, B, D, DB, B, ~a
time = 40

[Command]
name = "Siberian Blizzard"
command = ~D, DB, B, D, DB, B, ~b
time = 40

[Command]
name = "Siberian Blizzard"
command = ~D, DB, B, D, DB, B, ~c
time = 40

[Command]
name = "MAXSiberian Blizzard"
command = ~D, DB, B, D, DB, B, a+b
time = 40

[Command]
name = "MAXSiberian Blizzard"
command = ~D, DB, B, D, DB, B, b+c
time = 40

[Command]
name = "MAXSiberian Blizzard"
command = ~D, DB, B, D, DB, B, a+c
time = 40

[Command]
name = "Ultimate Atomic Buster"
command = ~B, D, F, B, D, F, x+y+z
time = 40

[Command]
name = "Ultimate Atomic Buster"
command = ~F, D, B, F, D, B, x+y+z
time = 40

[Command]
name = "Power Atomic Destruction"
command = ~B, D, F, B, D, F, a+b+c
time = 40

[Command]
name = "Power Atomic Destruction"
command = ~F, D, B, F, D, B, a+b+c
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~B, D, F, B, D, F, a
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~B, D, F, B, D, F, b
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~B, D, F, B, D, F, c
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~B, D, F, B, D, F, ~a
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~B, D, F, B, D, F, ~b
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~B, D, F, B, D, F, ~c
time = 40

[Command]
name = "MAXUltra Final Atomic Buster"
command = ~B, D, F, B, D, F, a+b
time = 40

[Command]
name = "MAXUltra Final Atomic Buster"
command = ~B, D, F, B, D, F, b+c
time = 40

[Command]
name = "MAXUltra Final Atomic Buster"
command = ~B, D, F, B, D, F, a+c
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~F, D, B, F, D, B, a
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~F, D, B, F, D, B, b
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~F, D, B, F, D, B, c
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~F, D, B, F, D, B, ~a
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~F, D, B, F, D, B, ~b
time = 40

[Command]
name = "Ultra Final Atomic Buster"
command = ~F, D, B, F, D, B, ~c
time = 40

[Command]
name = "MAXUltra Final Atomic Buster"
command = ~F, D, B, F, D, B, a+b
time = 40

[Command]
name = "MAXUltra Final Atomic Buster"
command = ~F, D, B, F, D, B, b+c
time = 40

[Command]
name = "MAXUltra Final Atomic Buster"
command = ~F, D, B, F, D, B, a+c
time = 40

;====================<SPECIAL MOTIONS>====================

[Command]
name = "Screw Piledriver"
command = ~F, D, B, x
time = 16

[Command]
name = "Screw Piledriver"
command = ~B, D, F, x
time = 16

[Command]
name = "Screw Piledriver"
command = ~F, D, B, ~x
time = 16

[Command]
name = "Screw Piledriver"
command = ~B, D, F, ~x
time = 16

[Command]
name = "Screw Piledriver"
command = ~F, D, B, y
time = 16

[Command]
name = "Screw Piledriver"
command = ~B, D, F, y
time = 16

[Command]
name = "Screw Piledriver"
command = ~F, D, B, ~y
time = 16

[Command]
name = "Screw Piledriver"
command = ~B, D, F, ~y
time = 16

[Command]
name = "Screw Piledriver"
command = ~F, D, B, z
time = 16

[Command]
name = "Screw Piledriver"
command = ~B, D, F, z
time = 16

[Command]
name = "Screw Piledriver"
command = ~F, D, B, ~z
time = 16

[Command]
name = "Screw Piledriver"
command = ~B, D, F, ~z
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~F, D, B, x+y
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~B, D, F, x+y
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~F, D, B, ~x+y
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~B, D, F, ~x+y
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~F, D, B, y+z
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~B, D, F, y+z
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~F, D, B, ~y+z
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~B, D, F, ~y+z
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~F, D, B, x+z
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~B, D, F, x+z
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~F, D, B, ~x+z
time = 16

[Command]
name = "EXScrew Piledriver"
command = ~B, D, F, ~x+z
time = 16

[Command]
name = "Vodka Fire"
command = ~D, DF, x
time = 16

[Command]
name = "Vodka Fire"
command = ~D, DF, y
time = 16

[Command]
name = "Vodka Fire"
command = ~D, DF, z
time = 16

[Command]
name = "Vodka Fire"
command = ~D, DF, ~x
time = 16

[Command]
name = "Vodka Fire"
command = ~D, DF, ~y
time = 16

[Command]
name = "Vodka Fire"
command = ~D, DF, ~z
time = 16

[Command]
name = "EXVodka Fire"
command = ~D, DF, x+y
time = 16

[Command]
name = "EXVodka Fire"
command = ~D, DF, y+z
time = 16

[Command]
name = "EXVodka Fire"
command = ~D, DF, x+z
time = 16

[Command]
name = "Banishing Flat"
command = ~F, D, DF, x
time = 16

[Command]
name = "Banishing Flat"
command = ~F, D, DF, y
time = 16

[Command]
name = "Banishing Flat"
command = ~F, D, DF, z
time = 16

[Command]
name = "Banishing Flat"
command = ~F, D, DF, ~x
time = 16

[Command]
name = "Banishing Flat"
command = ~F, D, DF, ~y
time = 16

[Command]
name = "Banishing Flat"
command = ~F, D, DF, ~z
time = 16

[Command]
name = "EXBanishing Flat"
command = ~F, D, DF, x+y
time = 16

[Command]
name = "EXBanishing Flat"
command = ~F, D, DF, y+z
time = 16

[Command]
name = "EXBanishing Flat"
command = ~F, D, DF, x+z
time = 16

[Command]
name = "Flying Powerbomb"
command = ~F, D, B, a
time = 16

[Command]
name = "Flying Powerbomb"
command = ~F, D, B, b
time = 16

[Command]
name = "Flying Powerbomb"
command = ~F, D, B, c
time = 16

[Command]
name = "Flying Powerbomb"
command = ~F, D, B, ~a
time = 16

[Command]
name = "Flying Powerbomb"
command = ~F, D, B, ~b
time = 16

[Command]
name = "Flying Powerbomb"
command = ~F, D, B, ~c
time = 16

[Command]
name = "EXFlying Powerbomb"
command = ~F, D, B, a+b
time = 16

[Command]
name = "EXFlying Powerbomb"
command = ~F, D, B, b+c
time = 16

[Command]
name = "EXFlying Powerbomb"
command = ~F, D, B, a+c
time = 16

[Command]
name = "Atomic Suplex"
command = ~B, D, F, a
time = 16

[Command]
name = "Atomic Suplex"
command = ~B, D, F, b
time = 16

[Command]
name = "Atomic Suplex"
command = ~B, D, F, c
time = 16

[Command]
name = "Atomic Suplex"
command = ~B, D, F, ~a
time = 16

[Command]
name = "Atomic Suplex"
command = ~B, D, F, ~b
time = 16

[Command]
name = "Atomic Suplex"
command = ~B, D, F, ~c
time = 16

[Command]
name = "EXAtomic Suplex"
command = ~B, D, F, a+b
time = 16

[Command]
name = "EXAtomic Suplex"
command = ~B, D, F, b+c
time = 16

[Command]
name = "EXAtomic Suplex"
command = ~B, D, F, a+c
time = 16

[Command]
name = "Toss Up"
command = ~B, D, DB, x
time = 16

[Command]
name = "Toss Up"
command = ~B, D, DB, y
time = 16

[Command]
name = "Toss Up"
command = ~B, D, DB, z
time = 16

[Command]
name = "Toss Up"
command = ~B, D, DB, ~x
time = 16

[Command]
name = "Toss Up"
command = ~B, D, DB, ~y
time = 16

[Command]
name = "Toss Up"
command = ~B, D, DB, ~z
time = 16

[Command]
name = "EXToss Up"
command = ~B, D, DB, x+y
time = 16

[Command]
name = "EXToss Up"
command = ~B, D, DB, y+z
time = 16

[Command]
name = "EXToss Up"
command = ~B, D, DB, x+z
time = 16

[Command]
name = "Aerial Russian Slam"
command = ~F, D, DF, a
time = 16

[Command]
name = "Aerial Russian Slam"
command = ~F, D, DF, b
time = 16

[Command]
name = "Aerial Russian Slam"
command = ~F, D, DF, c
time = 16

[Command]
name = "Aerial Russian Slam"
command = ~F, D, DF, ~a
time = 16

[Command]
name = "Aerial Russian Slam"
command = ~F, D, DF, ~b
time = 16

[Command]
name = "Aerial Russian Slam"
command = ~F, D, DF, ~c
time = 16

[Command]
name = "EXAerial Russian Slam"
command = ~F, D, DF, a+b
time = 16

[Command]
name = "EXAerial Russian Slam"
command = ~F, D, DF, b+c
time = 16

[Command]
name = "EXAerial Russian Slam"
command = ~F, D, DF, a+c
time = 16

[Command]
name = "Lariat2"
command = a+b+c
time = 16

[Command]
name = "Lariat"
command = x+y+z
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
name = "412p"
command = ~B, DB, D, ~x
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~y
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~z
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
name=  "412k"
command = ~B, DB, D, c
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~a
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~b
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~c
time = 16




;====================<OTHER>====================

[Command]
name = "highjump"
command = $D, $U
time = 15



;====================<DOUBLE TAP>====================

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10



;====================<2/3 BUTTON COMBINATION>====================

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
time=1

[Command]
name = "b+y"
command = b+y
time = 1

[Command]
name = "c+z"
command = c+z
time = 1




;==============================================================================================
;========================================<-1 STATES>===========================================
;==============================================================================================
[StateDef -1]

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
type = CtrlSet
triggerAll = !ctrl
trigger1 = (StateNo = 52 || StateNo = 101 || StateNo = 5120) && !AnimTime
trigger2 = (StateNo = [200,499]) && !AnimTime
trigger3 = ((StateNo = [760,762]) || (StateNo = [700,715]) || (StateNo = [900,905])) && !AnimTime
trigger4 = StateNo = 810 && !AnimTime
trigger5 = (StateNo = 5001 || StateNo = 5011 || StateNo = 151 || StateNo = 153) && HitOver
value = 1

[State -1, Roll Forward]
type = ChangeState
value = 710
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdfwd"
trigger2 = var(20) && var(4)

[State -1, Roll Backward]
type = ChangeState
value = 715
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdback"

[State -1, Dodge]
type = ChangeState
value = 700
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))

[State -1, Ultimate Atomic Buster]
type = ChangeState
value = 3200
triggerAll = !AILevel
triggerAll = command = "Ultimate Atomic Buster" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Power Atomic Destruction]
type = ChangeState
value = 3500
triggerAll = !AILevel
triggerAll = command = "Power Atomic Destruction" && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, MAX Final Atomic Buster]
type = ChangeState
value = 3050
triggerAll = !AILevel
triggerAll = command = "MAXFinal Atomic Buster"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)

[State -1, MAX Ultra Final Atomic Buster]
type = ChangeState
value = 3350
triggerAll = !AILevel
triggerAll = command = "MAXUltra Final Atomic Buster"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)

[State -1, MAX Siberian Blizzard]
type = ChangeState
value = 3450
triggerAll = !AILevel
triggerAll = command = "MAXSiberian Blizzard" && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)

[State -1, MAX Super  Aerial Russian Slam]
type = ChangeState
value = 3150 
triggerAll = !AILevel
triggerAll = command = "MAXSuper Aerial Russian Slam" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)

[State -1, Final Atomic Buster]
type = ChangeState
value = 3000
triggerAll = !AILevel
triggerAll = command = "Final Atomic Buster"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Ultra Final Atomic Buster]
type = ChangeState
value = 3300
triggerAll = !AILevel
triggerAll = command = "Ultra Final Atomic Buster"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Siberian Blizzard]
type = ChangeState
value = 3400
triggerAll = !AILevel
triggerAll = command = "Siberian Blizzard" && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Super Aerial Russian Slam]
type = ChangeState
value = 3100
triggerAll = !AILevel
triggerAll = command = "Super Aerial Russian Slam" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, EX Banishing Flat]
type = ChangeState
value = 1230
triggerAll = !AILevel
triggerAll = command = "EXBanishing Flat" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Toss Up]
type = ChangeState
value = 1930
triggerAll = !AILevel
triggerAll = command = "EXToss Up" && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Screw Piledriver]
type = ChangeState
value = 1330
triggerAll = !AILevel
triggerAll = command = "EXScrew Piledriver"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Vodka Fire]
type = ChangeState
value = 1730
triggerAll = !AILevel
triggerAll = command = "EXVodka Fire" && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
triggerAll = !var(39)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Vodka Fire]
type = ChangeState
value = 1630
triggerAll = !AILevel
triggerAll = command = "EXVodka Fire" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
triggerAll = !var(39)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Aerial Russian Slam]
type = ChangeState
value = 1830
triggerAll = !AILevel
triggerAll = command = "EXAerial Russian Slam" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Atomic Suplex]
type = ChangeState
value = 1530
triggerAll = !AILevel
triggerAll = command = "EXAtomic Suplex"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Flying Powerbomb]
type = ChangeState
value = 1430
triggerAll = !AILevel
triggerAll = command = "EXFlying Powerbomb"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Air Screw Piledriver]
type = ChangeState
value = 1380
triggerAll = !AILevel
triggerAll = command = "EXScrew Piledriver" && var(40) != 0
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Banishing Flat]
type = ChangeState
value = 1200
triggerAll = !AILevel
triggerAll = command = "Banishing Flat" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Toss Up]
type = ChangeState
value = 1900
triggerAll = !AILevel
triggerAll = command = "Toss Up" && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Air Screw Piledriver]
type = ChangeState
value = 1350
triggerAll = !AILevel
triggerAll = command = "Screw Piledriver" && var(40) != 0
triggerAll = RoundState = 2 && StateType = A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Screw Piledriver]
type = ChangeState
value = 1300
triggerAll = !AILevel
triggerAll = command = "Screw Piledriver"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Vodka Fire]
type = ChangeState
value = 1700
triggerAll = !AILevel
triggerAll = command = "Vodka Fire" && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Vodka Fire]
type = ChangeState
value = 1600
triggerAll = !AILevel
triggerAll = command = "Vodka Fire" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Aerial Russian Slam]
type = ChangeState
value = 1800
triggerAll = !AILevel
triggerAll = command = "Aerial Russian Slam" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Atomic Suplex]
type = ChangeState
value = 1500
triggerAll = !AILevel
triggerAll = command = "Atomic Suplex"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Flying Powerbomb]
type = ChangeState
value = 1400
triggerAll = !AILevel
triggerAll = command = "Flying Powerbomb"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Lariat]
type = ChangeState
value = 1100
triggerAll = !AILevel
triggerAll = command = "Lariat2"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Air Lariat]
type = ChangeState
value = 1050
triggerAll = !AILevel
triggerAll = (command = "Lariat" || command = "Lariat2") && var(40) != 0
triggerAll = RoundState = 2 && StateType = A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Lariat]
type = ChangeState
value = 1000
triggerAll = !AILevel
triggerAll = command = "Lariat"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Zero Counter]
type = ChangeState
value = 750
triggerAll = !AILevel
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = command = "412p" || command = "412k"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power >= 1000 && !var(20)

[State -1, Custom Combo]
type = ChangeState
value = ifElse(StateType = A, 905, 900)
triggerAll = !AILevel
trigger1 = command = "c+z"
trigger1 = RoundState = 2
trigger1 = power >= 1000 && !var(20)
trigger1 = ctrl || StateNo = 52 || (StateNo = [100,101])
trigger1 = !var(41)

[State -1, Power Charge]
type = ChangeState
value = 730
triggerAll = !AILevel
trigger1 = command = "holdb" && command = "holdy"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power < const(data.power) && power < PowerMax && !var(20)
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Dash Forward/Run]
type = ChangeState
value = 110
triggerAll = !AILevel
trigger1 = command = "FF"
trigger1 = roundstate = 2 && StateType = S
trigger1 = ctrl

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = !AILevel
trigger1 = command = "BB"
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = !AILevel
trigger1 = (command = "holdfwd" || command = "holdback") && (command = "pp" || command = "kk")
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Standing Heavy Punch]
type = ChangeState
value = 300
triggerAll = !AILevel && var(40) != 0
triggerAll = command = "holdfwd" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Heavy Punch]
type = ChangeState
value = 220
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Medium Punch]
type = ChangeState
value = 210
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Light Punch]
type = ChangeState
value = 200
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 205 || StateNo = 230 || StateNo = 400 || StateNo = 430) && Time >= 5
trigger3 = var(4)

[State -1, Standing Far/Close Light Kick]
type = ChangeState
value = 230
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 205 || StateNo = 230 || StateNo = 400 || StateNo = 430) && Time >= 5
trigger3 = var(4)

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = !AILevel
triggerAll = command  ="holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 205 || StateNo = 230 || StateNo = 400 || StateNo = 430) && Time >= 5
trigger3 = var(4)

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 205 || StateNo = 230 || StateNo = 400 || StateNo = 430) && Time >= 5
trigger3 = var(4)

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 670
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 625
triggerAll = !AILevel
triggerAll = command = "holdup" && command = "z"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Angled Jumping Heavy Punch]
type = ChangeState
value = 621
triggerAll = !AILevel
triggerAll = command = "z"
triggerAll = StateType = A
triggerAll = vel x
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = !AILevel
triggerAll = command = "z"
triggerAll = StateType = A
triggerAll = !vel x
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 660
triggerAll = !AILevel && var(40) != 0
triggerAll = command = "holddown" && command = "y"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = !AILevel
triggerAll = command = "c"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 615
triggerAll = !AILevel
triggerAll = command = "holdup" && command = "y"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = !AILevel
triggerAll = command = "y"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Medium Kick]
type = ChangeState
value = 645
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "b"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = !AILevel
triggerAll = command = "b"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = !AILevel
triggerAll = command = "x"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Medium Kick]
type = ChangeState
value = 635
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = !AILevel
triggerAll = command = "a"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Taunt]
type = ChangeState
value = 195
triggerAll = !AILevel
triggerAll = command = "start"
triggerAll = StateType != A
triggerAll = StateNo != [200,699]
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(6)



;==============================================================================================
;===========================================< A.I >==============================================
;==============================================================================================

[State -1, Fall Recovery (Air)]
type = ChangeState
value = 5210
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && CanRecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = Random < (25 * (AILevel ** 3 / 64.0))

[State -1, Fall Recovery (Ground)]
type = ChangeState
value = 5200
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && GetHitVar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = Random < (100 * (AILevel ** 3 / 64.0))

[State -1, Jump]
type = ChangeState
value = 40
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A && ctrl
trigger1 = EnemyNear, MoveType = A && P2BodyDist x < 160 && EnemyNear, HitDefAttr = SC, AT

[State -1, Roll Forward]
type = ChangeState
value = 710
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (AILevel ** 3 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [92,122])

[State -1, Dodge]
type = ChangeState
value = 700
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (AIlevel ** 3 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [0,60])

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = ctrl && (StateNo != [100,106]) && var(20) <= 150 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && BackEdgeDist >= 80 && (P2BodyDist x = [80,120]) && (EnemyNear, vel x)
trigger1 = Random < (ifElse((EnemyNear, HitDefAttr = SC, AT), 150, 50) * (AILevel ** 3 / 64.0))
trigger2 = (P2BodyDist x = [0,80]) && BackEdgeBodyDist >= 80
trigger2 = EnemyNear, StateNo = 5120 && EnemyNear, AnimTime = -4 && Random < (750 * (AILevel ** 3 / 64.0))

[State -1, Guard]
type = ChangeState
value = 120
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && InGuardDist
trigger1 = ctrl && (StateNo != [120, 155]) && !var(20)
trigger1 = !var(26) || P2BodyDist x >= 40
trigger1 = !(EnemyNear, HitDefAttr = SCA, AT) && (EnemyNear, Time < 120)
trigger1 = StateType != A || P2StateType = A
trigger1 = ifElse(StateType = A, ((var(3) != [1, 2]) || StateNo = 5210), 1)
trigger1 = Random < (ifElse((P2StateNo = [200, 699]), 100, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (AILevel ** 3 / 64.0))

[State -1, Zero Counter]
type = ChangeState
value = 750
trigger1 = AILevel && NumEnemy
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power >= 1000 && var(20) <= 60
trigger1 = Random < (25 * (AILevel ** 3 / 64.0))
trigger1 = (P2BodyDist x = [0,50]) && (Life < 0.5 * LifeMax)

[State -1, Power Charge]
type = ChangeState
value = 730
triggerAll = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power < const(data.power) && !var(20)
trigger1 = ctrl && Power < const(data.power) && Power < PowerMax && !var(20)
trigger1 = !InGuardDist && P2BodyDist x >= 160 && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-20,40]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (125 * (AIlevel ** 3 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Run]
type = ChangeState
value = 100
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl && (StateNo != [100,106])
trigger1 = (EnemyNear, MoveType != A) && P2BodyDist x >= 160 && Random < (25 * (AILevel ** 3 / 64.0))

[State -1, Standing Heavy Punch]
type = ChangeState
value = 300
triggerAll = AILevel && NumEnemy && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,101]) && (P2Dist y = [-111,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Standing Heavy Punch]
type = ChangeState
value = 220
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,101]) && (P2Dist y = [-111,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,146]) && (P2Dist y = [-111,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && Statetype != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-132,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,97]) && (P2Dist y = [-33,0]) && P2StateType != A && P2StateType != L
triggerAll = (P2StateType = S || (P2StateType = C && P2MoveType = H))
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 6) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 670
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,92]) && (P2Dist y = [-116,50]) && P2StateType = S
trigger1 = ctrl && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 660
triggerAll = AILevel && NumEnemy && var(40) != 0
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,92]) && (P2Dist y = [-116,50]) && P2StateType = S
trigger1 = ctrl && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Jumping Medium Punch]
type = ChangeState
value = 625
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,42]) && (P2Dist y = [-80,50]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 3 / 64.0))

[State -1, Jumping Heavy Punch]
type = ChangeState
value = ifElse(vel x > 0, 621, 620)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,45]) && (P2Dist y = [-64,50]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,92]) && (P2Dist y = [-116,50]) && P2StateType = S
trigger1 = ctrl && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Standing Medium Punch]
type = ChangeState
value = 210
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,80]) && (P2Dist y = [-129,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-115,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,70]) && (P2Dist y = [-52,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,111]) && (P2Dist y = [-33,0]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Jumping Medium Punch]
type = ChangeState
value = 615
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,42]) && (P2Dist y = [-80,50]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 3 / 64.0))

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,42]) && (P2Dist y = [-80,50]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 3 / 64.0))

[State -1, Jumping Medium Kick]
type = ChangeState
value = 645
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,79]) && (P2Dist y = [-60,40]) && P2StateType = A
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (AILevel ** 3 / 64.0))

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,79]) && (P2Dist y = [-60,40]) && P2StateType = A
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (AILevel ** 3 / 64.0))

[State -1, Standing Light Punch]
type = ChangeState
value = 200
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,63]) && (P2Dist y = [-87,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,72]) && (P2Dist y = [-23,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,61]) && (P2Dist y = [-54,0]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,90]) && (P2Dist y = [-27,0]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100, 101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 3 / 64.0))

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,41]) && (P2Dist y = [-56,28]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AIlevel ** 3 / 64.0))

[State -1, Jumping Medium Kick]
type = ChangeState
value = 635
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,79]) && (P2Dist y = [-60,40]) && P2StateType = A
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (AILevel ** 3 / 64.0))

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,32]) && (P2Dist y = [-117,40]) && P2StateType != L
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (ifElse(P2Dist x < 0, 250, 50) * (AILevel ** 3 / 64.0))

[State -1, Lariat]
type = ChangeState
value = ifelse(Random < 133, 1100, 1000)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-70,70]) && P2StateType != A) || ((P2BodyDist x = [-80,80]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = var(6) && MoveHit && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Air Lariat]
type = ChangeState
value = ifelse(Random < 133, 1050, 1050)
triggerAll = AILevel && NumEnemy && var(40) != 0
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-70,70]) && P2StateType != A) || ((P2BodyDist x = [-80,80]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = var(6) && MoveHit && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Screw Piledriver]
type = ChangeState
value = ifElse(Power >= 500 && Random < 100, 1380, 1350)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall= p2dist x>=0 && p2bodydist x<=ceil(32 * const(size.xscale)) && p2dist y=0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Air Screw Piledriver]
type = ChangeState
value = ifElse(Power >= 500 && Random < 100, 1330, 1300)
triggerAll = AILevel && NumEnemy && var(40) != 0
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall= p2dist x>=0 && p2bodydist x<=ceil(32 * const(size.xscale)) && p2dist y=0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Flying Powerbomb]
type = ChangeState
value = ifElse(Power >= 500 && Random < 100, 1430, 1400)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall= p2dist x>=0 && p2bodydist x<=ceil(32 * const(size.xscale)) && p2dist y=0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Atomic Suplex]
type = ChangeState
value = ifElse(Power >= 500 && Random < 100, 1530, 1500)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall= p2dist x>=0 && p2bodydist x<=ceil(32 * const(size.xscale)) && p2dist y=0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Banishing Flat]
type = ChangeState
value = ifElse(Power >= 500 && Random < 133, 1230, 1200)
triggerAll = AILevel && NumEnemy && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-70,70]) && P2StateType != A) || ((P2BodyDist x = [-80,80]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = var(6) && MoveHit && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Toss Upx]
type = ChangeState
value = ifElse(Power >= 500 && Random < 100, 1930, 1900)
triggerAll = AILevel && NumEnemy && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerall= p2dist x>=0 && p2bodydist x<=ceil(32 * const(size.xscale)) && p2dist y=0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Aerial Russian Slam]
type = ChangeState
value = ifElse(Power >= 500 && Random < 133, 1830, 1800)
triggerAll = AILevel && NumEnemy && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-80,80]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = var(6) && MoveHit && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Vodka Fire]
type = ChangeState
value = ifElse(Power >= 500 && Random < 100, 1730, 1700)
triggerAll = AILevel && NumEnemy && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-70,70]) && P2StateType != A) || ((P2BodyDist x = [-80,80]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = var(6) && MoveHit && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Vodka Fire]
type = ChangeState
value = ifElse(Power >= 500 && Random < 100, 1630, 1600)
triggerAll = AILevel && NumEnemy && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-70,70]) && P2StateType != A) || ((P2BodyDist x = [-80,80]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 3 / 64.0))
trigger2 = var(6) && MoveHit && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (AILevel ** 3 / 64.0))

[State -1, Power Atomic Destruction ]
type = ChangeState
value = 3500
triggerAll = AILevel && NumEnemy && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 3000 && !var(20)
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = (Enemynear, StateNo != [120, 155]) || EnemyNear, StateType = A
triggerAll = EnemyNear, StateType != L
triggerall= (p2bodydist x=[-88,88]) && (p2dist y=[-64,0])
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (50 * (AIlevel ** 2 / 64.0))

[State -1, Ultimate Atomic Buster]
type = ChangeState
value = 3200
triggerAll = AILevel && NumEnemy && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 3000 && !var(20)
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = (Enemynear, StateNo != [120, 155]) || EnemyNear, StateType = A
triggerAll = EnemyNear, StateType != L
triggerall= (p2bodydist x=[-88,88]) && (p2dist y=[-64,0])
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (50 * (AIlevel ** 2 / 64.0))

[State -1, MAX Siberian Blizzard]
type = ChangeState
value = 3450
triggerAll = AILevel && NumEnemy && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 2000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-80,80]) && (P2Dist y = [-80,32])
triggerAll = P2StateType != A && P2StateType != L
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, MAX Ultra Final Atomic Buster]
type = ChangeState
value = 3350
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 2000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-80,80]) && (P2Dist y = [-80,32])
triggerAll = P2StateType != A && P2StateType != L
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, MAX Super Aerial Russian Slam]
type = ChangeState
value = 3150
triggerAll = AILevel && NumEnemy && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 2000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-80,80]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, MAX Final Atomic Buster]
type = ChangeState
value = 3050
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 2000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-80,80]) && (P2Dist y = [-80,32])
triggerAll = P2StateType != A && P2StateType != L
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, Siberian Blizzard]
type = ChangeState
value = 3400
triggerAll = AILevel && NumEnemy && var(40) != 0
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 1000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-80,80]) && (P2Dist y = [-80,32])
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != A
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, Ultra Final Atomic Buster]
type = ChangeState
value = 3300
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 1000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-80,80]) && (P2Dist y = [-80,32])
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != A
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, Super Aerial Russian Slam]
type = ChangeState
value = 3100
triggerAll = AILevel && NumEnemy && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 1000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-80,80]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, Final Atomic Buster]
type = ChangeState
value = 3000
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 1000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-80,80]) && (P2Dist y = [-80,32])
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != A
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 3 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 3 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, Taunt]
type = ChangeState
value = 195
triggerAll = AILevel && NumEnemy
triggerAll = StateType != A && Life >= 0.5 * LifeMax
triggerAll = (EnemyNear, Life) <= 0.5 * (EnemyNear, LifeMax)
trigger1 = ctrl
trigger1 = P2Dist x >= 160 && !(EnemyNear, ctrl)
trigger1 = (EnemyNear, MoveType = H) && (EnemyNear, HitFall) && Random < (50 * (AILevel ** 2 / 64.0))

