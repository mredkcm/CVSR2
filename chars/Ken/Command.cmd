;#ADD004BASIC PIEs#
; _________________________________________
;| Ken by Phantom.of.the.Server & Jmorphman|
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
name = "Shoryureppa"
command = ~D, DF, F, D, DF, F, x
time = 32

[Command]
name = "Shoryureppa"
command = ~D, DF, F, D, DF, F, y
time = 32

[Command]
name = "Shoryureppa"
command = ~D, DF, F, D, DF, F, z
time = 32

[Command]
name = "Shoryureppa"
command = ~D, DF, F, D, DF, F, ~x
time = 32

[Command]
name = "Shoryureppa"
command = ~D, DF, F, D, DF, F, ~y
time = 32

[Command]
name = "Shoryureppa"
command = ~D, DF, F, D, DF, F, ~z
time = 32


[Command]
name = "MAXShoryureppa"
command = ~D, DF, F, D, DF, F, x+y
time = 32

[Command]
name = "MAXShoryureppa"
command = ~D, DF, F, D, DF, F, y+z
time = 32

[Command]
name = "MAXShoryureppa"
command = ~D, DF, F, D, DF, F, x+z
time = 32


[Command]
name = "ShippuJinraikyaku"
command = ~D, DF, F, D, DF, F, a
time = 32

[Command]
name = "ShippuJinraikyaku"
command = ~D, DF, F, D, DF, F, b
time = 32

[Command]
name = "ShippuJinraikyaku"
command = ~D, DF, F, D, DF, F, c
time = 32

[Command]
name = "ShippuJinraikyaku"
command = ~D, DF, F, D, DF, F, ~a
time = 32

[Command]
name = "ShippuJinraikyaku"
command = ~D, DF, F, D, DF, F, ~b
time = 32

[Command]
name = "ShippuJinraikyaku"
command = ~D, DF, F, D, DF, F, ~c
time = 32


[Command]
name = "MAXShippuJinraikyaku"
command = ~D, DF, F, D, DF, F, a+b
time = 32

[Command]
name = "MAXShippuJinraikyaku"
command = ~D, DF, F, D, DF, F, b+c
time = 32

[Command]
name = "MAXShippuJinraikyaku"
command = ~D, DF, F, D, DF, F, a+c
time = 32


[Command]
name = "Shinryuken"
command = ~D, DB, B, D, DB, B, a
time = 32

[Command]
name = "Shinryuken"
command = ~D, DB, B, D, DB, B, b
time = 32

[Command]
name = "Shinryuken"
command = ~D, DB, B, D, DB, B, c
time = 32

[Command]
name = "Shinryuken"
command = ~D, DB, B, D, DB, B, ~a
time = 32

[Command]
name = "Shinryuken"
command = ~D, DB, B, D, DB, B, ~b
time = 32

[Command]
name = "Shinryuken"
command = ~D, DB, B, D, DB, B, ~c
time = 32


[Command]
name = "MAXShinryuken"
command = ~D, DB, B, D, DB, B, a+b
time = 32

[Command]
name = "MAXShinryuken"
command = ~D, DB, B, D, DB, B, b+c
time = 32

[Command]
name = "MAXShinryuken"
command = ~D, DB, B, D, DB, B, a+c
time = 32


[Command]
name = "Souryuken"
command = ~D, DF, F, D, DF, F, x+a
time = 32

[Command]
name = "Souryuken"
command = ~D, DF, F, D, DF, F, x+b
time = 32

[Command]
name = "Souryuken"
command = ~D, DF, F, D, DF, F, x+c
time = 32

[Command]
name = "Souryuken"
command = ~D, DF, F, D, DF, F, y+a
time = 32

[Command]
name = "Souryuken"
command = ~D, DF, F, D, DF, F, y+b
time = 32

[Command]
name = "Souryuken"
command = ~D, DF, F, D, DF, F, y+c
time = 32

[Command]
name = "Souryuken"
command = ~D, DF, F, D, DF, F, z+a
time = 32

[Command]
name = "Souryuken"
command = ~D, DF, F, D, DF, F, z+b
time = 32

[Command]
name = "Souryuken"
command = ~D, DF, F, D, DF, F, z+c
time = 32


[Command]
name = "Kuzuryureppa"
command = ~D, DF, F, D, DB, B, a+b
time = 32

[Command]
name = "Kuzuryureppa"
command = ~D, DF, F, D, DB, B, b+c
time = 32

[Command]
name = "Kuzuryureppa"
command = ~D, DF, F, D, DB, B, a+c
time = 32

[Command]
name = "JouenShinryuken"
command = ~D, DF, F, D, DF, F, x+y+z
time = 32

[Command]
name = "JouenShinryuken"
command = ~B, DB, D, DF, F, x+y
time = 32

[Command]
name = "JouenShinryuken"
command = ~B, DB, D, DF, F, y+z
time = 32

[Command]
name = "JouenShinryuken"
command = ~B, DB, D, DF, F, x+z
time = 32


[Command]
name = "ShinbuMessatsu"
command = ~D, DF, F, D, DB, B, x+y
time = 32

[Command]
name = "ShinbuMessatsu"
command = ~D, DF, F, D, DB, B, y+z
time = 32

[Command]
name = "ShinbuMessatsu"
command = ~D, DF, F, D, DB, B, x+z
time = 32


[Command]
name = "GurenSenpukyaku"
command = ~D, DF, F, D, DF, F, a+b+c
time = 32

[Command]
name = "GurenSenpukyaku"
command = ~B, DB, D, DF, F, a+b
time = 32

[Command]
name = "GurenSenpukyaku"
command = ~B, DB, D, DF, F, b+c
time = 32

[Command]
name = "GurenSenpukyaku"
command = ~B, DB, D, DF, F, a+c
time = 32



;====================<SPECIAL MOTIONS>====================

[Command]
name = "Hadoken"
command = ~D, DF, F, x
time = 16

[Command]
name = "Hadoken"
command = ~D, DF, F, y
time = 16

[Command]
name = "Hadoken"
command = ~D, DF, F, z
time = 16

[Command]
name = "Hadoken"
command = ~D, DF, F, ~x
time = 16

[Command]
name = "Hadoken"
command = ~D, DF, F, ~y
time = 16

[Command]
name = "Hadoken"
command = ~D, DF, F, ~z
time = 16


[Command]
name = "EXHadoken"
command = ~D, DF, F, x+y
time = 16

[Command]
name = "EXHadoken"
command = ~D, DF, F, y+z
time = 16

[Command]
name = "EXHadoken"
command = ~D, DF, F, x+z
time = 16


[Command]
name = "Shoryuken"
command = ~F, D, DF, x
time = 16

[Command]
name = "Shoryuken"
command = ~F, D, DF, y
time = 16

[Command]
name = "Shoryuken"
command = ~F, D, DF, z
time = 16

[Command]
name = "Shoryuken"
command = ~F, D, DF, ~x
time = 16

[Command]
name = "Shoryuken"
command = ~F, D, DF, ~y
time = 16

[Command]
name = "Shoryuken"
command = ~F, D, DF, ~z
time = 16


[Command]
name = "EXShoryuken"
command = ~F, D, DF, x+y
time = 16

[Command]
name = "EXShoryuken"
command = ~F, D, DF, y+z
time = 16

[Command]
name = "EXShoryuken"
command = ~F, D, DF, x+z
time = 16



[Command]
name = "TatsumakiSenpukyaku"
command = ~D, DB, B, a
time = 16

[Command]
name = "TatsumakiSenpukyaku"
command = ~D, DB, B, b
time = 16

[Command]
name = "TatsumakiSenpukyaku"
command = ~D, DB, B, c
time = 16

[Command]
name = "TatsumakiSenpukyaku"
command = ~D, DB, B, ~a
time = 16

[Command]
name = "TatsumakiSenpukyaku"
command = ~D, DB, B, ~b
time = 16

[Command]
name = "TatsumakiSenpukyaku"
command = ~D, DB, B, ~c
time = 16


[Command]
name = "EXTatsumakiSenpukyaku"
command = ~D, DB, B, a+b
time = 16

[Command]
name = "EXTatsumakiSenpukyaku"
command = ~D, DB, B, b+c
time = 16

[Command]
name = "EXTatsumakiSenpukyaku"
command = ~D, DB, B, a+c
time = 16


[Command]
name = "ClassicAirborneTatsumakiSenpukyaku"
command = ~F, DF, D, DB, B, a
time = 32

[Command]
name = "ClassicAirborneTatsumakiSenpukyaku"
command = ~F, DF, D, DB, B, b
time = 32

[Command]
name = "ClassicAirborneTatsumakiSenpukyaku"
command = ~F, DF, D, DB, B, c
time = 32

[Command]
name = "ClassicAirborneTatsumakiSenpukyaku"
command = ~F, DF, D, DB, B, ~a
time = 32

[Command]
name = "ClassicAirborneTatsumakiSenpukyaku"
command = ~F, DF, D, DB, B, ~b
time = 32

[Command]
name = "ClassicAirborneTatsumakiSenpukyaku"
command = ~F, DF, D, DB, B, ~c
time = 32


[Command]
name = "Ryusenkyaku"
command = ~B, D, DB, a
time = 16

[Command]
name = "Ryusenkyaku"
command = ~B, D, DB, b
time = 16

[Command]
name = "Ryusenkyaku"
command = ~B, D, DB, c
time = 16

[Command]
name = "Ryusenkyaku"
command = ~B, D, DB, ~a
time = 16

[Command]
name = "Ryusenkyaku"
command = ~B, D, DB, ~b
time = 16

[Command]
name = "Ryusenkyaku"
command = ~B, D, DB, ~c
time = 16


[Command]
name = "EXRyusenkyaku"
command = ~B, D, DB, a+b
time = 16

[Command]
name = "EXRyusenkyaku"
command = ~B, D, DB, b+c
time = 16

[Command]
name = "EXRyusenkyaku"
command = ~B, D, DB, a+c
time = 16


[Command]
name = "NataotoshiGeri"
command = ~D, DF, F, a
time = 16

[Command]
name = "KamabaraiGeri"
command = D, DF, F, b
time = 16

[Command]
name = "OosotomawashiGeri"
command = ~D, DF, F, c
time = 16

[Command]
name = "NataotoshiGeri"
command = ~D, DF, F, ~a
time = 16

[Command]
name = "KamabaraiGeri"
command = ~D, DF, F, ~b
time = 16

[Command]
name = "OosotomawashiGeri"
command = ~D, DF, F, ~c
time = 16


[Command]
name = "FujinsenGeri"
command = ~D, DF, F, a+b
time = 16

[Command]
name = "FujinsenGeri"
command = ~D, DF, F, b+c
time = 16

[Command]
name = "FujinsenGeri"
command = ~D, DF, F, a+c
time = 16


[Command]
name = "ZenpouTenshi"
command = ~D, DB, B, x
time = 16

[Command]
name = "ZenpouTenshi"
command = ~D, DB, B, y
time = 16

[Command]
name = "ZenpouTenshi"
command = ~D, DB, B, z
time = 16

[Command]
name = "ZenpouTenshi"
command = ~D, DB, B, ~x
time = 16

[Command]
name = "ZenpouTenshi"
command = ~D, DB, B, ~y
time = 16

[Command]
name = "ZenpouTenshi"
command = ~D, DB, B, ~z
time = 16


[Command]
name = "Zentou"
command = ~D, DB, B, s
time = 16

[Command]
name = "Zentou"
command = ~D, DB, B, ~s
time = 16


[Command]
name = "RasetsuKyaku"
command = ~F, D, DF, a
time = 16

[Command]
name = "RasetsuKyaku"
command = ~F, D, DF, b
time = 16

[Command]
name = "RasetsuKyaku"
command = ~F, D, DF, c
time = 16

[Command]
name = "RasetsuKyaku"
command = ~F, D, DF, ~a
time = 16

[Command]
name = "RasetsuKyaku"
command = ~F, D, DF, ~b
time = 16

[Command]
name = "RasetsuKyaku"
command = ~F, D, DF, ~c
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
trigger4 = (StateNo = 5001 || StateNo = 5011 || StateNo = 151 || StateNo = 153) && HitOver
value = 1

[State -1, Souryuken]
type = ChangeState
value = 4100
triggerAll = !AILevel
triggerAll = command = "Souryuken" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
triggerAll = TeamMode = Simul && NumPartner
triggerAll = Partner, Alive
triggerAll = Partner, Facing != Facing && (abs(Partner, P2Dist x) - abs(P2Dist x) < 200)
triggerAll = Partner, AuthorName = "Phantom.of.the.Server" && Partner, Name = "Ryu" && (Partner, var(1) != 2)
triggerAll = !(Partner, StateType = A) && !(Partner, var(20)) && !(Partner, MoveType = H)
triggerAll = Partner, ctrl || ((Partner, StateNo = [200,299]) && Partner, Time <= 2)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

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

[State -1, Double Shinku Hadoken]
type = ChangeState
value = 4000
triggerAll = var(40) != 1
triggerAll = TeamMode = Simul && NumPartner
triggerAll = Partner, Alive
triggerAll = Partner, AuthorName = "Phantom.of.the.Server" && Partner, Name = "Ryu" && (Partner, var(1) != 2)
trigger1 = Partner, StateNo = 3600
trigger1 = StateNo != 4000
trigger1 = MoveType != H

[State -1, Guren Senpukyaku]
type = ChangeState
value = 3600
triggerAll = !AILevel
triggerAll = command = "GurenSenpukyaku" && var(40) = 3
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Shinbu Messatsu]
type = ChangeState
value = 3500
triggerAll = !AILevel
triggerAll = command = "ShinbuMessatsu" && var(40) = [1,2]
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Jouen Shinryuken]
type = ChangeState
value = 3300
triggerAll = !AILevel
triggerAll = command = "JouenShinryuken" && var(40) != 1 && var(40) != 3
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Kuzuryureppa]
type = ChangeState
value = 3400
triggerAll = !AILevel
triggerAll = (command = "MAXShippuJinraikyaku" && var(40) = 1) || (command = "Kuzuryureppa" && var(40) = 2)
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)

[State -1, MAX Shippu Jinraikyaku]
type = ChangeState
value = 3250 + 5 * (var(40) = 3)
triggerAll = !AILevel
triggerAll = command = "MAXShippuJinraikyaku" && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)

[State -1, MAX Shinryuken]
type = ChangeState
value = 3150
triggerAll = !AILevel
triggerAll = command = "MAXShinryuken"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)

[State -1, MAX Shoryureppa]
type = ChangeState
value = 3050
triggerAll = !AILevel
triggerAll = command = "MAXShoryureppa"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 2000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7) || var(8)

[State -1, Shippu Jinraikyaku]
type = ChangeState
value = 3200 + 5 * (var(40) = 3)
triggerAll = !AILevel
triggerAll = command = "ShippuJinraikyaku"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Shinryuken]
type = ChangeState
value = 3100
triggerAll = !AILevel
triggerAll = command = "Shinryuken"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Shoryureppa]
type = ChangeState
value = 3000
triggerAll = !AILevel
triggerAll = command = "Shoryureppa"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 1000 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Fujinsen Geri]
type = ChangeState
value = 1430
triggerAll = !AILevel
triggerAll = command = "FujinsenGeri" && !var(40)
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Ryusenkyaku]
type = ChangeState
value = 1330
triggerAll = !AILevel
triggerAll = command = "EXRyusenkyaku" && !var(40)
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Airborne Tatsumaki Senpukyaku]
type = ChangeState
value = 1270 + 5 * (var(40) = 3)
triggerAll = !AILevel
triggerAll = command = "EXTatsumakiSenpukyaku" && var(40) != [1,2]
triggerAll = RoundState = 2 && StateType = A
triggerAll = (var(3) != [1,2])
triggerAll = !var(40) || (var(40) = 3 && pos y <= -64)
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl
trigger2 = var(6)

[State -1, EX Tatsumaki Senpukyaku]
type = ChangeState
value = 1230 + 5 * (var(40) = 3)
triggerAll = !AILevel
triggerAll = command = "EXTatsumakiSenpukyaku" && var(40) != [1,2]
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Shoryuken]
type = ChangeState
value = 1130
triggerAll = !AILevel
triggerAll = command = "EXShoryuken" && var(40) != [1,2]
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX Hadoken]
type = ChangeState
value = 1030
triggerAll = !AILevel
triggerAll = command = "EXHadoken" && var(40) != [1,2]
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
triggerAll = !var(39)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Rasetsu Kyaku]
type = ChangeState
value = 1600
triggerAll = !AILevel
triggerAll = command = "RasetsuKyaku" && var(40) = [1,2]
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Zentou]
type = ChangeState
value = 1530
triggerAll = !AILevel
triggerAll = command = "Zentou" && var(40) != 1 && var(40) != 3
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Zenpou Tenshi]
type = ChangeState
value = 1500
triggerAll = !AILevel
triggerAll = command = "ZenpouTenshi" && var(40) != 1 && var(40) != 3
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Oosotomawashi Geri]
type = ChangeState
value = 1420
triggerAll = !AILevel
triggerAll = command = "OosotomawashiGeri" && var(40) != 3
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Kamabarai Geri]
type = ChangeState
value = 1410
triggerAll = !AILevel
triggerAll = command = "KamabaraiGeri" && var(40) != 3
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Nataotoshi Geri]
type = ChangeState
value = 1400
triggerAll = !AILevel
triggerAll = command = "NataotoshiGeri" && var(40) != 3
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Inazuma Kakato Wari (from Geri)]
type = ChangeState
value = 1405
triggerAll = !AILevel
triggerAll = command = "holda" || command = "holdb" || command = "holdc"
triggerAll = RoundState = 2 && StateType != A
trigger1 = StateNo = 1400 && AnimElem = 7
trigger2 = StateNo = 1410 && AnimElem = 4
trigger3 = StateNo = 1420 && AnimElem = 7

[State -1, Ryusenkyaku]
type = ChangeState
value = 1300
triggerAll = !AILevel
triggerAll = command = "Ryusenkyaku" && var(40) != 1 && var(40) != 3
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Classic Airborne Tatsumaki Senpukyaku]
type = ChangeState
value = 1250
triggerAll = !AILevel
triggerAll = (command = "ClassicAirborneTatsumakiSenpukyaku" && var(40) = 2) || (command = "TatsumakiSenpukyaku" && var(40) = 1)
triggerAll = RoundState = 2 && StateType = A
triggerAll = (var(3) != [1,2])
trigger1 = ctrl
trigger2 = var(6)

[State -1, Airborne Tatsumaki Senpukyaku]
type = ChangeState
value = 1240 + 5 * (var(40) = 3)
triggerAll = !AILevel
triggerAll = (command = "TatsumakiSenpukyaku") && var(40) != 1
triggerAll = RoundState = 2 && StateType = A
triggerAll = (var(3) != [1,2])
triggerAll = var(40) != 3 || (var(40) = 3 && pos y <= -64)
trigger1 = ctrl
trigger2 = var(6)

[State -1, Tatsumaki Senpukyaku]
type = ChangeState
value = 1200 + 5 * (var(40) = 3)
triggerAll = !AILevel
triggerAll = command = "TatsumakiSenpukyaku"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Shoryuken]
type = ChangeState
value = 1100
triggerAll = !AILevel
triggerAll = command = "Shoryuken"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Hadoken]
type = ChangeState
value = 1000
triggerAll = !AILevel
triggerAll = command = "Hadoken"
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
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

[State -1, Air Throw]
type = ChangeState
value = 850
triggerAll = !AILevel && var(40) != 3
triggerAll = RoundState = 2 && StateType = A
triggerAll = ctrl && pos y <= -32
trigger1 = (command = "holdfwd" || command = "holdback") && command = "pp" && var(40) != 1
trigger2 = (command = "holdfwd" || command = "holdback") && command = "kk" && var(40) = 1

[State -1, Target Combo]
type = ChangeState
value = 225
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "z"
triggerAll = StateType != A
triggerAll = var(40) != 1
trigger1 = StateNo = 215 && AnimElemTime(6) < 0 && MoveContact
trigger2 = var(4)

[State -1, Standing Far/Close Heavy Punch]
type = ChangeState
value = 220 + (Abs(P2BodyDist X) <= 25) * 5
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Ushiro Mawashi Geri]
type = ChangeState
value = 259
triggerAll = !AILevel && var(40) != 1 && var(40) != 3
triggerAll = command != "holddown" && command = "holdfwd" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Shiden Kakato Otoshi]
type = ChangeState
value = 257
triggerAll = !AILevel && var(40) = 3
triggerAll = command != "holddown" && command = "holdfwd" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Far/Close Heavy Kick]
type = ChangeState
value = 250 + (Abs(P2BodyDist X) <= 25 && var(40) != 3) * 5
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Far/Close Medium Punch]
type = ChangeState
value = 210 + (Abs(P2BodyDist X) <= 15) * 5
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Inazuma Kakato Wari]
type = ChangeState
value = 249
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "b"
triggerAll = (var(40) != 3 && command = "holdfwd") || (var(40) = 3 && command = "holdback")
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Fumikomi Mae Geri]
type = ChangeState
value = 247
triggerAll = !AILevel && var(40) = 3
triggerAll = command != "holddown" && command = "holdfwd" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Far/Close Medium Kick]
type = ChangeState
value = ifElse(var(40) = 3, 242, 240 + (Abs(P2BodyDist X) <= 20) * 5)
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Far/Close Light Punch]
type = ChangeState
value = 200 + (Abs(P2BodyDist X) <= 15) * 5
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 205 || StateNo = 400) && Time >= 5
trigger3 = var(4)

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 205 || StateNo = 400) && Time >= 5
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
trigger2 = (StateNo = 200 || StateNo = 205 || StateNo = 400) && Time >= 5
trigger3 = var(4)

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 205 || StateNo = 400) && Time >= 5
trigger3 = var(4)

[State -1, Jumping Heavy Punch]
type = ChangeState
value = ifElse(vel x, 621, 620)
triggerAll = !AILevel
triggerAll = command = "z"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 651
triggerAll = !AILevel
triggerAll = command = "c"
triggerAll = StateType = A
triggerAll = vel x
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = !AILevel
triggerAll = command = "c"
triggerAll = StateType = A
triggerAll = !vel x
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = !AILevel
triggerAll = command = "y"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Angled Jumping Medium Kick]
type = ChangeState
value = 641
triggerAll = !AILevel
triggerAll = command = "b"
triggerAll = StateType = A
triggerAll = vel x
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = !AILevel
triggerAll = command = "b"
triggerAll = StateType = A
triggerAll = !vel x
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

[State -1, Angled Jumping Light Kick]
type = ChangeState
value = 631
triggerAll = !AILevel
triggerAll = command = "a"
triggerAll = StateType = A
triggerAll = vel x
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = !AILevel
triggerAll = command = "a"
triggerAll = StateType = A
triggerAll = !vel x
trigger1 = ctrl
trigger2 = var(4)

[State -1, Taunt]
type = ChangeState
value = 195
triggerAll = !AILevel
triggerAll = command = "start" && var(40) != 1
triggerAll = StateType != A
triggerAll = StateNo != [200,699]
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Violent Taunt]
type = ChangeState
value = 198
triggerAll = !AILevel
triggerAll = command = "start" && var(40) = 1
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
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Fall Recovery (Ground)]
type = ChangeState
value = 5200
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && GetHitVar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = Random < (100 * (AILevel ** 2 / 64.0))

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
trigger1 = Random < (50 * (AILevel ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [92,122])

[State -1, Dodge]
type = ChangeState
value = 700
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [0,60])

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = ctrl && (StateNo != [100,106]) && var(20) <= 150 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && BackEdgeDist >= 80 && (P2BodyDist x = [80,120]) && (EnemyNear, vel x)
trigger1 = Random < (ifElse((EnemyNear, HitDefAttr = SC, AT), 150, 50) * (AILevel ** 2 / 64.0))
trigger2 = (P2BodyDist x = [0,80]) && BackEdgeBodyDist >= 80
trigger2 = EnemyNear, StateNo = 5120 && EnemyNear, AnimTime = -4 && Random < (750 * (AILevel ** 2 / 64.0))

[State -1, Rasetsu Kyaku]
type = ChangeState
value = 1600
triggerAll = AILevel && NumEnemy
triggerAll = (var(40) = [1,2]) && StateType != A && RoundState = 2 && ctrl
trigger1 = Enemynear, MoveType = A && P2BodyDist x < 90 && (Facing != EnemyNear, Facing) && Random < (500 * (AILevel ** 2 / 64.0))
trigger1 = var(10) := 2
trigger2 = Enemy, NumProj > 0 && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = var(10) := 3
trigger3 = P2bodydist x < 60 && Enemy, HitDefAttr = SC, AT && Random < (750 * (AIlevel ** 2 / 64.0))
trigger3 = var(10) := 2
trigger3 = Random < (50 * (AILevel ** 2 / 64.0))
trigger3 = var(10) := ifElse((Random < (500 * (AILevel ** 2 / 64.0)) || BackEdgeDist < 100), 3, -3)

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
trigger1 = Random < (ifElse((P2StateNo = [200, 699]), 100, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (AILevel ** 2 / 64.0))

[State -1, Zero Counter]
type = ChangeState
value = 750
trigger1 = AILevel && NumEnemy
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power >= 1000 && var(20) <= 60
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))
trigger1 = (P2BodyDist x = [0,50]) && (Life < 0.5 * LifeMax)

[State -1, Power Charge]
type = ChangeState
value = 730
triggerAll = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power < const(data.power) && !var(20)
trigger1 = ctrl && Power < const(data.power) && Power < PowerMax && !var(20)
trigger1 = !InGuardDist && P2BodyDist x >= 160 && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Custom Combo]
type = ChangeState
value = ifElse(StateType = A, 905, 900)
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && (StateType != A || (vel x > 0 && vel y >= 0))
trigger1 = Power >= 1000 && !var(20)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100, 101]))
trigger1 = (EnemyNear, MoveType = A) && (P2BodyDist x = [0,40]) && (P2Dist y = [-60,60]) && (EnemyNear, vel y >= 0)
trigger1 = (EnemyNear, StateNo = [200,699]) && Random < (9250 * (AILevel ** 2 / 64.0))

[State -1, Air Throw]
type = ChangeState
value = 850
trigger1 = AILevel && NumEnemy && var(40) != 3
trigger1 = RoundState = 2 && StateType = A
trigger1 = !var(16) && (var(15) < 1 || var(20))
trigger1 = ctrl && pos y <= -32
trigger1 = P2StateType = A && Random < (200 * (AILevel ** 2 / 64.0))
trigger1 = (P2Dist x = [-20,4]) && (P2Dist y = [-118,48])

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-20,24]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Run]
type = ChangeState
value = 100
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl && (StateNo != [100,106])
trigger1 = (EnemyNear, MoveType != A) && P2BodyDist x >= 160 && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Shoryuken (Custom Combo)]
type = ChangeState
value = 1100
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && var(20) > 30
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = (EnemyNear, BackEdgeBodyDist <= 8 || EnemyNear, FrontEdgeBodyDist <= 8)
triggerAll = ((P2BodyDist x = [-65,65]) && P2StateType != A) || ((P2BodyDist x = [-140,140]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100, 101]))
trigger2 = StateNo = 900 && !AnimTime && ctrl
trigger3 = var(6) && MoveHit && Random < (100 * (AILevel ** 2 / 64.0))
trigger4 = var(20) > 30 && StateNo = 1000 && var(6)

[State -1, Hadoken (Custom Combo)]
type = ChangeState
value = 1000
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
triggerAll = !var(16) && var(20)
triggerAll = P2StateType != A && P2StateType != L
trigger1 = var(20) > 30 && StateNo = 1100 && var(6)

[State -1, Inazuma Kakato Wari]
type = ChangeState
value = 249
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,90]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Fumikomi Mae Geri]
type = ChangeState
value = 247
triggerAll = AILevel && NumEnemy && var(40) = 3
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,140]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Shiden Kakato Otoshi]
type = ChangeState
value = 257
triggerAll = AILevel && NumEnemy && var(40) = 3
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,120]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Ushiro Mawashi Geri]
type = ChangeState
value = 259
triggerAll = AILevel && NumEnemy && (var(40) = 0 || var(40) = 2)
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [-17,90]) && (P2Dist y = [-50,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Target Combo]
type = ChangeState
value = 225
trigger1 = AILevel && var(40) != 1
trigger1 = StateNo = 215 && AnimElemTime(6) < 0 && MoveContact

[State -1, Standing Far/Close Heavy Punch]
type = ChangeState
value = 220 + (Abs(P2BodyDist x) <= 25) * 5
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,63]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Heavy Kick]
type = ChangeState
value = 250 + ((Abs(P2BodyDist x) <= 25) && var(40) != 3) * 5
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,92]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = AILevel && NumEnemy
triggerAll = roundstate = 2 && Statetype != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,35]) && (p2dist y = [-90,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,60]) && (P2Dist y = [-20,60]) && P2StateType != A && P2StateType != L
triggerAll = (P2StateType = S || (P2StateType = C && P2MoveType = H))
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 6) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Punch]
type = ChangeState
value = 620
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,48]) && (P2Dist y = [-35,45]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Kick]
type = ChangeState
value = 650 + (vel x >= 0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-22,40]) && P2StateType = S
trigger1 = ctrl && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Medium Punch]
type = ChangeState
value = 210 + (Abs(P2BodyDist X) <= 15) * 5
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,50]) && (P2Dist y = [-65,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Medium Kick]
type = ChangeState
value = ifElse(var(40) = 3, 242, 240 + (Abs(P2BodyDist X) <= 20) * 5)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,35]) && (P2Dist y = [-75,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,34]) && (P2Dist y = [-90,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,68]) && (P2Dist y = [-12,10]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-35,45]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640 + (vel x >= 0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,28]) && (P2Dist y = [-25,25]) && P2StateType = A
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Light Punch]
type = ChangeState
value = 200 + (Abs(P2BodyDist X) <= 25) * 5
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-65,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Light Kick]
type = ChangeState
value = 230
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,53]) && (P2Dist y = [-17,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,48]) && (P2Dist y = [0,35]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,57]) && (P2Dist y = [0,13]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100, 101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,23]) && (P2Dist y = [-28,13]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Jumping Light Kick]
type = ChangeState
value = 630 + (vel x >= 0)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,20]) && (P2Dist y = [-25,55]) && P2StateType != L
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (ifElse(P2Dist x < 0, 250, 50) * (AILevel ** 2 / 64.0))

[State -1, EX Shoryuken (after Target Combo)]
type = ChangeState
value = 1130
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = (var(40) = 0 || var(40) = 3) && Power >= 50
triggerAll = (P2StateNo != [120, 155]) && P2StateType != L
triggerAll = (P2BodyDist x > 0) && (EnemyNear, vel y > -1) && (EnemyNear, vel x > -2)
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
triggerAll = !(EnemyNear, HitFall) || NumTarget(1430) || NumTarget(3400)
trigger1 = var(6) && StateNo = 225 && PrevStateNo = 215 && MoveHit

[State -1, Shoryuken]
type = ChangeState
value = ifElse((var(40) = 0 || var(40) = 3) && Power >= 500 && Random < 133, 1130, 1100)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType != L && (P2Dist y = [-80,32])
triggerAll = ((P2BodyDist x = [-48,48]) && P2StateType != A) || ((P2BodyDist x = [-140,140]) && P2StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = var(6) && MoveHit && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3
trigger3 = (StateNo = 5120 || StateNo = 5201) && !AnimTime && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Inazuma Kakato Wari (from Geri)]
type = ChangeState
value = 1405
triggerAll = AILevel && MoveHit
trigger1 = StateNo = 1400 && AnimElem = 7
trigger2 = StateNo = 1410 && AnimElem = 4
trigger3 = StateNo = 1420 && AnimElem = 7

[State -1, * Geri]
type = ChangeState
value = ifElse(!var(40) && Power >= 500 && Random < 100, 1430, ifElse(Random < 500, 1420, ifElse(Random < 500, 1410, 1400)))
triggerAll = AILevel && NumEnemy && var(40) != 3
triggerAll = RoundState = 2 && StateType != A
triggerAll = (EnemyNear, MoveType != A) || (EnemyNear, StateNo = [200, 499])
triggerAll = (P2BodyDist x = [-8,65]) && P2StateType != A && (P2StateType != L || P2StateNo = 5120)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger1 = P2BodyDist x >= 65 && Random < (50 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = (EnemyNear, StateNo = 5120 || EnemyNear, StateNo = 5201) && (EnemyNear, AnimTime = -18) && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = var(6) && MoveHit && Random < (100 * (AILevel ** 2 / 64.0))
trigger3 = EnemyNear, GetHitVar(HitTime) >= 6

[State -1, Airborne Tatsumaki Senpukyaku]
type = ChangeState
value = ifElse((var(40) = 0 || var(40) = 3) && Power >= 500 && Random < 100, 1270 + 5 * (var(40) = 3), ifElse((var(40) = 1 || (Random < 500 && var(40) = 2)), 1250, 1240 + 5 * (var(40) = 3)))
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = var(3) != [1,2]
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2StateType = A
triggerAll = (P2BodyDist x = [-8,160]) && P2Dist y >= -120
trigger1 = ctrl && Random < (50 * (AILevel ** 2 / 64.0))
trigger2 = var(6) && MoveHit && P2StateType = A

[State -1, Tatsumaki Senpukyaku]
type = ChangeState
value = ifElse((var(40) = 0 || var(40) = 3) && Power >= 500 && Random < 100, 1230 + 5 * (var(40) = 3), 1200 + 5 * (var(40) = 3))
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = (EnemyNear, MoveType != A) || (EnemyNear, StateNo = [200, 499])
triggerAll = (P2BodyDist x = [-8,165]) && P2StateType != A && (P2StateType != L || P2StateNo = 5120)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger1 = P2BodyDist x >= 15 && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = (EnemyNear, StateNo = 5120 || EnemyNear, StateNo = 5201) && (EnemyNear, AnimTime = -18) && Random < (125 * (AILevel ** 2 / 64.0))
trigger3 = var(6) && MoveHit && Random < (50 * (AILevel ** 2 / 64.0))
trigger3 = EnemyNear, GetHitVar(HitTime) >= 6

[State -1, Ryusenkyaku]
type = ChangeState
value = ifElse(!var(40) && Power >= 500 && Random < 100, 1330, 1300)
triggerAll = AILevel && NumEnemy && var(40) != 1 && var(40) != 3
triggerAll = RoundState = 2 && StateType != A
triggerAll = (EnemyNear, MoveType != A) || (EnemyNear, StateNo = [200, 499])
triggerAll = (P2BodyDist x = [-8,97]) && P2StateType != A && (P2StateType != L || P2StateNo = 5120)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger1 = P2BodyDist x >= 15 && Random < (50 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = (EnemyNear, StateNo = 5120 || EnemyNear, StateNo = 5201) && (EnemyNear, AnimTime = -18) && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = var(6) && MoveHit && Random < (100 * (AILevel ** 2 / 64.0))
trigger3 = EnemyNear, GetHitVar(HitTime) >= 6

[State -1, Hadoken]
type = ChangeState
value = ifElse((var(40) = 0 || var(40) = 3) && Power >= 500 && Random < 100, 1030, 1000)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(39)
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2BodyDist x >= 25 && P2Dist y >= -120 && EnemyNear, vel y >= 0
triggerAll = P2StateType != A || EnemyNear, vel x < 0
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = EnemyNear, StateNo = 195 && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Jouen Shinryuken / Guren Senpukyaku]
type = ChangeState
value = ifElse(var(40) = 3, 3600, 3300)
triggerAll = AILevel && NumEnemy && var(40) != 1
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 3000 && !var(20)
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && P2StateNo != 5201
triggerAll = P2Dist x >= 0 && P2BodyDist x <= 46
triggerAll = (EnemyNear, HitOver || !(EnemyNear, MoveType = H) || var(21)) && !(EnemyNear, StateNo = [150,155]) && EnemyNear, Anim != 5040
triggerAll = !(EnemyNear, StateNo = 40 && EnemyNear, Time >= 1) && !(EnemyNear, StateNo = 52 && !(EnemyNear, ctrl) && EnemyNear, PrevStateNo = [5020,5040])
triggerAll = P2StateType != A && P2StateType != L && (P2Dist y = [-48,0])
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (500 * (AILevel ** 2 / 64.0))

[State -1, MAX Shippu Jinraikyaku]
type = ChangeState
value = ifElse(var(40) = 1 || (var(40) = 2 && Random < 500), 3400, 3250 + 5 * (var(40) = 3))
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 2000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-60,60]) && (P2Dist y = [-32,32])
triggerAll = P2StateType != A && P2StateType != L
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, MAX Shoryureppa]
type = ChangeState
value = 3050
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 2000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-140,140]) && (P2Dist y = [-32,32])
triggerAll = P2StateType != A && P2StateType != L
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, MAX Shinryuken]
type = ChangeState
value = 3150
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 2000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 3 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-46,46]) && (P2Dist y = [-69,0])
triggerAll = (EnemyNear, vel x = [-5,5]) && P2StateType != L
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(7) && MoveHit && (EnemyNear, HitFall)
trigger2 = Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 2 / 64.0))
trigger3 = var(8) && Random < (100 * (AILevel ** 2 / 64.0))
trigger3 = StateNo = 3001 && AnimElemTime(9) < 0
trigger3 = EnemyNear, GetHitVar(HitTime) >= 3

[State -1, Shoryureppa]
type = ChangeState
value = 3000
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 1000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-100,100]) && (P2Dist y = [-32,32])
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != A
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, Shippu Jinraikyaku]
type = ChangeState
value = 3200 + 5 * (var(40) = 3)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 1000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 1 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-60,60]) && (P2Dist y = [-32,32])
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != A
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(7) && MoveHit && Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 4

[State -1, Shinryuken]
type = ChangeState
value = 3100
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 1000 && var(20) <= 60
triggerAll = !var(16) && (var(15) < 3 || var(20) || (StateNo = [1000,4999]))
triggerAll = !(EnemyNear, ctrl) && ((EnemyNear, StateNo != [120,155]) || EnemyNear, StateType = A)
triggerAll = (EnemyNear, MoveType != A) || (EnemyNear, StateType = A)
triggerAll = (P2BodyDist x = [-46,46]) && (P2Dist y = [-69,0])
triggerAll = (EnemyNear, vel x = [-5,5]) && P2StateType != L
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(7) && MoveHit && (EnemyNear, HitFall)
trigger2 = Random < (ifElse((var(20) = [1,30]), 200, 50) * (AILevel ** 2 / 64.0))
trigger2 = EnemyNear, GetHitVar(HitTime) >= 3

[State -1, Taunt]
type = ChangeState
value = ifElse(var(40) = 1, 198, 195)
triggerAll = AILevel && NumEnemy
triggerAll = StateType != A && Life >= 0.5 * LifeMax
triggerAll = (EnemyNear, Life) <= 0.5 * (EnemyNear, LifeMax)
trigger1 = ctrl
trigger1 = P2Dist x >= 160 && !(EnemyNear, ctrl)
trigger1 = (EnemyNear, MoveType = H) && (EnemyNear, HitFall) && Random < (50 * (AILevel ** 2 / 64.0))

