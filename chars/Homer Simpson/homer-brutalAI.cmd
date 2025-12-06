;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

 [Command]
name = "cpu1"
command = U, U, U, U, F, B, B, F
time = 0
[Command]
name = "cpu2"
command = U, U, U, D, F, B, B, F
time = 0
[Command]
name = "cpu3"
command = U, U, D, D, F, B, B, F
time = 0
[Command]
name = "cpu4"
command = U, D, D, D, F, B, B, F
time = 0
[Command]
name = "cpu5"
command = D, D, D, D, F, B, B, F
time = 0
[Command]
name = "cpu6"
command = D, D, D, U, F, B, B, F
time = 0
[Command]
name = "cpu7"
command = D, D, U, U, F, B, B, F
time = 0
[Command]
name = "cpu8"
command = D, U, U, U, F, B, B, F
time = 0
[Command]
name = "cpu9"
command = U, D, U, U, F, B, B, F
time = 0
[Command]
name = "cpu10"
command = U, U, D, U, F, B, B, F
time = 0
[Command]
name = "cpu11"
command = D, U, U, D, F, B, B, F
time = 0
[Command]
name = "cpu12"
command = U, D, D, U, F, B, B, F
time = 0
[Command]
name = "cpu13"
command = D, U, D, U, F, B, B, F
time = 0
[Command]
name = "cpu14"
command = U, D, U, D, F, B, B, F
time = 0
[Command]
name = "cpu15"
command = F, F, F, F, F, B, B, F
time = 0
[Command]
name = "cpu16"
command = B, B, B, B, F, B, B, F
time = 0
[Command]
name = "cpu17"
command = F, B, F, F, F, B, B, F
time = 0
[Command]
name = "cpu18"
command = F, F, B, F, F, B, B, F
time = 0
[Command]
name = "cpu19"
command = B, F, F, F, F, B, B, F
time = 0
[Command]
name = "cpu20"
command = F, F, F, B, F, B, B, F
time = 0
[Command]
name = "cpu21"
command = F, B, B, F, F, B, B, F
time = 0
[Command]
name = "cpu22"
command = B, F, F, B, F, B, B, F
time = 0
[Command]
name = "cpu23"
command = F, B, F, B, F, B, B, F
time = 0
[Command]
name = "cpu24"
command = B, F, B, F, F, B, B, F
time = 0
[Command]
name = "cpu25"
command = D, F, D, F, F, B, B, F
time = 0
[Command]
name = "cpu26"
command = D, B, D, B, F, B, B, F
time = 0
[Command]
name = "cpu27"
command = D, B, D, F, F, B, B, F
time = 0
[Command]
name = "cpu28"
command = D, F, D, B, F, B, B, F
time = 0
[Command]
name = "cpu29"
command = U, F, D, B, F, B, B, F
time = 0
[Command]
name = "cpu30"
command = U, B, D, F, F, B, B, F
time = 0
[Command]
name = "cpu31"
command = B, D, F, U, F, B, B, F
time = 0
[Command]
name = "cpu32"
command = F, D, B, U, F, B, B, F
time = 0
[Command]
name = "cpu33"
command = U, U, U, U, F, B, B, F
time = 0
[Command]
name = "cpu34"
command = U, U, U, D, F, B, B, F
time = 0
[Command]
name = "cpu35"
command = U, U, D, D, F, B, B, F
time = 0
[Command]
name = "cpu36"
command = U, D, D, D, F, B, B, F
time = 0
[Command]
name = "cpu37"
command = D, D, D, D, F, B, B, F
time = 0
[Command]
name = "cpu38"
command = D, D, D, U, F, B, B, F
time = 0
[Command]
name = "cpu39"
command = D, D, U, U, F, B, B, F
time = 0
[Command]
name = "cpu40"
command = D, U, U, U, F, B, B, F
time = 0
[Command]
name = "cpu41"
command = U, D, U, U, F, B, B, F
time = 0
[Command]
name = "cpu42"
command = U, U, D, U, F, B, B, F
time = 0
[Command]
name = "cpu43"
command = D, U, U, D, F, B, B, F
time = 0
[Command]
name = "cpu44"
command = U, D, D, U, F, B, B, F
time = 0
[Command]
name = "cpu45"
command = D, U, D, U, F, B, B, F
time = 0
[Command]
name = "cpu46"
command = U, D, U, D, F, B, B, F
time = 0
[Command]
name = "cpu47"
command = F, F, F, F, F, B, B, F
time = 0
[Command]
name = "cpu48"
command = B, B, B, B, F, B, B, F
time = 0
[Command]
name = "cpu49"
command = F, B, F, F, F, B, B, F
time = 0
[Command]
name = "cpu50"
command = F, F, B, F, F, B, B, F
time = 0
[Command]
name = "cpu51"
command = B, F, F, F, F, B, B, F
time = 0

; Definition of the Commands
;=====================================================================
;First of all, I must to Thanx to "Mr.H" for let me use this comands for my two chars: Homero and Homer-Iori
;   -Warner el Tochix
;-| EX Special Motions |----------------------------------------------

[Command]
name = "Woohoo Whirlwind EX"
command = ~F, D, DF, x+y
time = 35

[Command]
name = "Kinetic Donut EX"
command = ~D, DF, F, x+y
time = 35

;-| Super Motions |---------------------------------------------------
;

[Command]
name = "Shun Homer Satsu"
command = x,x,F,a,z
time = 45

[Command]
name = "Drunken Tornado_LV.3"
command = ~D, F, D, F, x+y
time = 40

[Command]
name = "Drunken Tornado_LV.2"
command = ~D, F, D, F, y
time = 40

[Command]
name = "Drunken Tornado_LV.1"
command = ~D, F, D, F, x
time = 40

[Command]
name = "Hell Candy Bomb_LV.3"
command = ~D, B, D, F, x+y
time = 40

[Command]
name = "Hell Candy Bomb_LV.2"
command = ~D, B, D, F, y
time = 40

[Command]
name = "Hell Candy Bomb_LV.1"
command = ~D, B, D, F, x
time = 40
[Command]
name = "Bash Dash Masher_LV.3"
command = ~D, F, D, B, x+y
time = 40

[Command]
name = "Bash Dash Masher_LV.2"
command = ~D, F, D, B, y
time = 40

[Command]
name = "Bash Dash Masher_LV.1"
command = ~D, F, D, B, x
time = 40

[Command]
name = "Grim Reaper"
command = ~D, F, D, B, z
time = 40

[Command]
name = "Heavy Roller"
command = ~D, F, D, B, b
time = 40

[Command]
name = "Kakaroto"
command = ~D, DF, F, a+b
time = 25

[Command]
name = "Misogi Butt"
command = ~D, F, B, a+b
time = 40

[Command]
name = "Beer Riot"
command = ~D, DB, B, s
time = 25

[Command]
name = "Ready Aim Fire"
command = ~D, DF, F, y+z
time = 40

;-| Special Motions |-------------------------------------------------
[Command]
name = "Sideswitch"
command = ~D, DB, B, z
time = 20

[Command]
name = "Rush Tackle Kick_a"
command = ~F, DF, D, DB, B, a
time = 20

[Command]
name = "Rush Tackle Kick_b"
command = ~F, DF, D, DB, B, b
time = 20

[Command]
name = "Woohoo Whirlwind_x"
command = ~F, D, DF, x

[Command]
name = "Woohoo Whirlwind_y"
command = ~F, D, DF, y

[Command]
name = "Kinetic Donut_x"
command = ~D, DF, F, x

[Command]
name = "Kinetic Donut_y"
command = ~D, DF, F, y

[Command]
name = "Gun_z" 
command = ~D, DF, F, z

[Command]
name = "3-hit Rushdown"
command = ~D, DB, B, x

[Command]
name = "3-hit Rushdown"
command = ~D, DB, B, y

[Command]
name = "Sling-Shot Slow"
command = ~D, DF, c

;-| Double Tap |------------------------------------------------------
[Command]
name = "FF";Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB";Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = a+x
time = 1

;-| Dir + Button |----------------------------------------------------
[Command]
name = "fwd_a"
command = /F,a
time = 1

[Command]
name = "fwd_b"
command = /F,b
time = 1

[Command]
name = "fwd_c"
command = /F,c
time = 1

[Command]
name = "fwd_x"
command = /F,x
time = 1

[Command]
name = "fwd_y"
command = /F,y
time = 1

[Command]
name = "fwd_z"
command = /F,z
time = 1

[Command]
name = "back_a"
command = /B,a
time = 1

[Command]
name = "back_ab"
command = /B,a+b
time = 1

[Command]
name = "back_b"
command = /B,b
time = 1

[Command]
name = "back_c"
command = /B,c
time = 1

[Command]
name = "back_x"
command = /B,x
time = 1

[Command]
name = "back_y"
command = /B,y
time = 1

[Command]
name = "back_z"
command = /B,z
time = 1

[Command]
name = "down_b"
command = /D,b
time = 1

[Command]
name = "down_y"
command = /D,y
time = 1

[Command]
name = "charge1"
command = /b
time = 1

[Command]
name = "charge2"
command = /y
time = 1

[Command]
name = "charge"
command = /c
time = 1

[Command]
name = "Super Jump"
command = ~D, U
time = 10
;-| Single Button |---------------------------------------------------
[Command]
name = "x"
command = x
time = 1

[Command]
name = "a"
command = a
time = 1

[Command]
name = "y"
command = y
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
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

[Command]
name = "random"
command = x
time = 1

[Command]
name = "random"
command = a
time = 1

[Command]
name = "random"
command = y
time = 1

[Command]
name = "random"
command = b
time = 1

[Command]
name = "random"
command = c
time = 1

[Command]
name = "random"
command = z
time = 1

[Command]
name = "random"
command = s
time = 1

;-| Hold Button |-----------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup";Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;------------------------ For KOF Series Only
[Command]
name = "holdupfwd"
command = /UF
time = 1

[Command]
name = "holdupback"
command = /UB
time = 1

;=====================================================================
; State Entry for Commands
;=====================================================================
; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]
;_____________________________________________________________________


;AI Activation
[State -1, AI Deactivation]
type = VarSet
trigger1 = roundstate = 1
trigger2 = roundstate = 3
trigger3 = roundstate = 4
v = 7
value = 0

;AI Activation
[State -1, AI Activation]
type = VarSet
triggerall = roundstate = 2
trigger1 = command = "cpu1"
trigger2 = command = "cpu2"
trigger3 = command = "cpu3"
trigger4 = command = "cpu4"
trigger5 = command = "cpu5"
trigger6 = command = "cpu6"
trigger7 = command = "cpu7"
trigger8 = command = "cpu8"
trigger9 = command = "cpu9"
trigger10 = command = "cpu10"
trigger11 = command = "cpu11"
trigger12 = command = "cpu12"
trigger13 = command = "cpu13"
trigger14 = command = "cpu14"
trigger15 = command = "cpu15"
trigger16 = command = "cpu16"
trigger17 = command = "cpu17"
trigger18 = command = "cpu18"
trigger19 = command = "cpu19"
trigger20 = command = "cpu20"
trigger21 = command = "cpu21"
trigger22 = command = "cpu22"
trigger23 = command = "cpu23"
trigger24 = command = "cpu24"
trigger25 = command = "cpu25"
trigger26 = command = "cpu26"
trigger27 = command = "cpu27"
trigger28 = command = "cpu28"
trigger29 = command = "cpu29"
trigger30 = command = "cpu30"
trigger31 = command = "cpu31"
trigger32 = command = "cpu32"
trigger33 = command = "cpu33"
trigger34 = command = "cpu34"
trigger35 = command = "cpu35"
trigger36 = command = "cpu36"
trigger37 = command = "cpu37"
trigger38 = command = "cpu38"
trigger39 = command = "cpu39"
trigger40 = command = "cpu40"
trigger41 = command = "cpu41"
trigger42 = command = "cpu42"
trigger43 = command = "cpu43"
trigger44 = command = "cpu44"
trigger45 = command = "cpu45"
trigger46 = command = "cpu46"
trigger47 = command = "cpu47"
trigger48 = command = "cpu48"
trigger49 = command = "cpu49"
trigger50 = command = "cpu50"
trigger51 = command = "cpu51"
v = 7
value = 1


; ‹Öç“ó•SEˆëŽ®E”ª’t—iLV.2j
[State -1, Shun Homer Satsu]
type = ChangeState
value = 3600
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = Power >= 4000
triggerall = var(39) = 1
triggerall = var(7) = 1
trigger1 = p2dist x <= 100
trigger1 = P2statetype != L && StateType != A
trigger1 = StateType != A && (StateNo = 100 || StateNo = 40 || Stateno = 0 || Stateno = 230)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4 = Stateno = 3101 && AnimElem = 33
trigger4 =  Random >= P2Life
trigger5 = stateno = 3120 || Stateno = 3667
trigger5 = moveguarded

[State -1, Road Roller D'oh]
type = ChangeState
value = 3500
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = Power >= 3000
triggerall = var(39) = 1
triggerall = var(7) = 1
trigger1 = P2Life < 250 || Life < 750 && P2Life < 750 && random > life
trigger1 = Random = 1010
trigger1 = StateType != A && Ctrl = 1


; ‹Öç“ó•SEˆëŽ®E”ª’t—iLV.2j
[State -1, Touch of Death]
type = ChangeState
value = 3667
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = Power >= 3000
triggerall = var(39) = 1
trigger1 = p2dist x <= 50
trigger1 = random > 857 | random > life && life < 750
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger1 = P2MoveType != H || P2MoveType = H && Random > 500
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2

[State -1, Bart Sling-Shot Slow]
type = ChangeState
value = 6010
triggerall = NumHelper(6005) = 0 && NumHelper(6006) = 0 &&  NumHelper(6007) = 0
triggerall = var(39) = 0 && Command = "Sling-Shot Slow" && NumProjID(1005) = 0
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)


; Supers
;HELL with the Candy Bombs Level 2
[State -1, AI: Hell Candy Bomb 2]
type = ChangeState
value = 3010
triggerall = StateType = S || StateType = C
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0 ;To avoid spamming this move in training mode
triggerall = P2Name != "AoF2 Strength Training"
triggerall = P2Name != "ALIEN QUEEN"
triggerall = P2Name != "What the fuck" ;(Rox Howard clones)
triggerall = P2Name != "Apocalypse"
triggerall = P2Name != "Onslaught2" || P2Name != "Onslaught"
triggerall = P2Name != "G-akiha"
triggerall = P2Name != "MP-Suika"
triggerall = Power >= 2000
triggerall = Var(24) = 1
triggerall = !var(39)
trigger1 = Random <= 700
trigger1 = p2dist x >= 120
trigger1 = P2statetype != L
trigger1 = ctrl = 1
trigger1 = P2Life != 0

; Supers
;HELL with the Candy Bombs Level 3
[State -1, AI: Hell Candy Bomb 3]
type = ChangeState
value = 3020
triggerall = StateType = S || StateType = C
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0 ;To avoid spamming this move in training mode
triggerall = Power >= 3000
triggerall = var(7) = 1
triggerall = !var(39)
triggerall = P2Name != "AoF2 Strength Training"
triggerall = P2Name != "ALIEN QUEEN"
triggerall = P2Name != "What the fuck" ;(Rox Howard clones)
triggerall = P2Name != "Apocalypse"
triggerall = P2Name != "Onslaught2" || P2Name != "Onslaught"
triggerall = P2Name != "G-akiha"
triggerall = P2Name != "MP-Suika"
trigger1 = p2dist x >= 200
trigger1 = P2statetype != L
triggerall = ctrl = 1
trigger1 = P2Life != 0

; Supers
;HELL with the Candy Bombs Level 1
[State -1, AI: Hell Candy Bomb 1 ]
type = ChangeState
value = 3000
triggerall = NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0
triggerall = StateType = S || StateType = C
triggerall = StateNo != 3000
triggerall = StateNo != 4000
triggerall = Power >= 1000
triggerall = var(7) = 1
triggerall = !var(39)
trigger1 = Time = 10
trigger1 = p2dist x >= 70
trigger1 = p2dist x <= 100
trigger1 = P2statetype != L
trigger2 = p2movetype = H
trigger2 = AnimElem >= 5
trigger2 = Random >= 779
trigger2 = Random <= 1000
triggerall = ctrl = 1

; Supers
;Homer goku
[State -1, DBZ]
type = ChangeState
value = 350
triggerall = StateType = S || StateType = C
triggerall = StateNo != 350
triggerall = Power >= 2500
triggerall = var(7) = 1
triggerall = !var(39)
trigger1 = Time = 10
trigger1 = p2dist x >= 70
trigger1 = p2dist x <= 100
trigger1 = P2statetype != L && StateType != A
trigger1 = P2StateNo != 120
trigger1 = P2StateNo != 121
trigger1 = P2StateNo != 122
trigger2 = Random >= 699
trigger2 = Random <= 1000
trigger2 = P2StateNo = 5300
triggerall = ctrl = 1

; Supers
;Butt slam
[State -1, Misogi]
type = ChangeState
value = 4300
triggerall = StateType = S || StateType = C
triggerall = StateNo != 4300
triggerall = Power >= 3500
triggerall = var(7) = 1
triggerall = !var(39)
trigger1 = Time = 10
trigger1 = p2dist x >= 70
trigger1 = p2dist x <= 100
trigger1 = P2statetype != L && StateType != A
trigger1 = P2StateNo != 120
trigger1 = P2StateNo != 121
trigger1 = P2StateNo != 122
trigger2 = P2StateNo = 5000
triggerall = ctrl = 1


;Bash Dash Masher/Maniac Masher Level 3
[State -1, AI: Bash Dash Masher 3]
type = ChangeState
value = 3120
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = Power >= 3000
trigger1 = p2dist x <= 100
trigger1 = P2statetype != L && StateType != A
trigger1 = P2StateNo != 120
trigger1 = P2StateNo != 121
trigger1 = P2StateNo != 122
trigger2 = p2movetype = H
trigger2 = AnimElem >= 5
trigger2 = Random >= 666
trigger2 = Random <= 1000
trigger1 = ctrl = 1

;Bash Dash Masher/Maniac Masher Level 1
[State -1, AI: Bash Dash Masher 1]
type = ChangeState
value = 3100
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = Power >= 1000
trigger1 = p2dist x <= 100
trigger1 = P2statetype != L && StateType != A
trigger1 = ctrl = 1
trigger2 = stateno = 1301
trigger2 = p2movetype = H
trigger2 = AnimElem >= 5
trigger2 = Random >= 666
trigger2 = Random <= 1000


;Drunken Tornado Level 3
[State -1, AI: Drunken Tornado 3]
type = ChangeState
value = 3320
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = Power >= 3000
triggerall = var(39) = 1
trigger1 = p2dist x <= 46
trigger1 = ctrl = 1
trigger1 = P2Life != 0
trigger1 = p2dist Y >= -143
trigger2 = stateno = 205
trigger2 = movecontact
trigger3 = stateno = 200
trigger3 = movecontact
trigger4 = stateno = 210
trigger4 = movecontact

;Drunken Tornado Level 1
[State -1, AI: Drunken Tornado 1]
type = ChangeState
value = 3300
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = Power >= 1000
triggerall = var(39) = 1
trigger1 = p2dist x <= 46
trigger1 = ctrl = 1
trigger1 = P2Life != 0
trigger1 = p2dist Y >= -143
trigger2 = stateno = 205
trigger2 = movecontact
trigger3 = stateno = 200
trigger3 = movecontact
trigger4 = stateno = 210
trigger4 = movecontact
trigger5 = stateno = 1301
trigger5 = p2movetype = H
trigger5 = AnimElem >= 5
trigger5 = Random >= 333
trigger5 = Random <= 666


;Riot of the Legendary Beer Homer
[State -1, AI: Beer Riot Mode]
type = ChangeState
value = 9999
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = !var(39)
trigger1 = ctrl = 1
trigger1 = Life >= 500
trigger1 = Life <= 700
trigger1 = P2Life <= 200
trigger2 = ctrl = 1
trigger2 = Life >= 1000


;Specials
; Rush n Grab
[State -1, AI: Rush Tackle Kick]
type = ChangeState
value = 1400
triggerall = StateType = S || StateType = C
triggerall = StateNo != 1400
triggerall = StateNo != 3000
triggerall = var(7) = 1
trigger1 = p2dist x >= 65
trigger1 = Time = 20
trigger1 = ctrl = 1

;Woohoo Whirlwind low
[State -1, AI: Woohoo Whirlwind 1]
type = ChangeState
value = 1100
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
trigger1 = p2dist x <= 30
trigger1 = ctrl = 1

;woohoo Whirlwind high
[State -1, AI: Woohoo Whirlwind 2]
type = ChangeState
value = 1110
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
trigger1 = p2dist x <= 30
trigger1 = ctrl = 1

;Sideswitch
[State -1, AI: Sideswitch]
type = ChangeState
value = 1400
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
trigger1 = p2dist x <= 52
trigger1 = p2dist x >= 21
trigger1 = Pos X <= -100
trigger1 = ctrl = 1


;Why you little (Grabble)!!
[State -1, AI: Throw]
type = ChangeState
value = 850
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
trigger1 = P2statetype != L && StateType != A
trigger1 = p2dist x <= 35
trigger1 = p2dist x >= 28
trigger1 = ctrl = 1


;Homer's 3 Hit Rushdown
;1st Hit
[State -1, AI: 3-hit Rush 1st hit]
type = ChangeState
value = 1300
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
trigger1 = P2statetype != L && StateType != A
trigger1 = p2dist x <= 45
trigger1 = Ctrl = 1

;2nd Hit
[State -1, AI: 3-hit Rush 2nd hit]
type = ChangeState
value = 1301
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
trigger1 = stateno = 1300
trigger1 = Time = 16

;3rd Hit
[State -1, AI: 3-hit Rush 3rd hit]
type = ChangeState
value = 1302
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
trigger1 = stateno = 1301
trigger1 = Time > 16

;Eat My Shorts!!
[State -1, AI: Kinetic Donut]
type = ChangeState
value = 1000
triggerall = NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0
triggerall = var(7) = 1 && NumProjID(1005) = 0
triggerall = StateType = S || StateType = C
trigger1 = P2Life != 0
trigger1 = p2dist x >= 170
trigger1 = ctrl = 1


; Crawling Dodge
[State -1, AI: Dodge]
type = ChangeState
value = 4000
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = StateNo != 4000
triggerall = StateNo != 3000
triggerall = P2Movetype = A
trigger1 = !var(39)
trigger1 = random <= 970
trigger1 = p2Dist X >= 120
trigger2 = var(39)
trigger2 = random <= 999
trigger2 = p2Dist X <= 1200
triggerall = ctrl = 1

;It's official. You Suck!!! (Homer's Taunt)
[State -1, AI: Taunt]
type = ChangeState
value = 195
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = P2Life = 0
trigger1 = Life >= 700
trigger1 = ctrl = 1


; Sandwich/Hulk Homer Check
[State -1, AI: Charge Check]
type = ChangeState
value = 4100
triggerall = Power <= 2999
triggerall = StateNo != 4100
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = P2statetype = L
trigger1 = P2statetype != S
trigger1 = P2StateType != C
trigger1 = P2StateType != A
triggerall = ctrl = 1

; Cancel charge
[State -1, AI: Charge Cancel]
type = ChangeState
value = 4101
triggerall = StateType = S || StateType = C
triggerall = var(7) = 1
triggerall = StateNo = 4100
trigger1 = P2statetype != L
trigger1 = p2Dist X <= 80

; Run Forward
[State -1, AI: Run Forward]
type = ChangeState
value = 100
triggerall = var(7) = 1
triggerall = StateNo != 100
triggerall = StateType = S || StateType = C
triggerall = StateNo != 1400
trigger1 = Power <= 2999
trigger1 = p2Dist X >= 100
triggerall = ctrl = 1

;Stop running
[State -1, AI: Stop Running]
type = ChangeState
value = 101
triggerall = var(7) = 1
triggerall = StateNo = 100
triggerall = StateType = S || StateType = C
trigger1 = p2Dist X <= 100
trigger1 = Time = 30

;Weak punch
[State -1, AI: Weak Punch]
type = ChangeState
value = 200
triggerall = var(7) = 1
triggerall = StateType = S || StateType = C
triggerall = StateNo != 200
triggerall = StateNo != 4000
trigger2 = ctrl = 1
trigger1 = stateno = 235
trigger1 = movecontact = 1
trigger2 = p2dist x <= 70
trigger2 = p2dist x >= 50

;Close Weak Punch
[State -1, AI: Weak Punch Close]
type = ChangeState
value = 205
triggerall = var(7) = 1
triggerall = StateType = S || StateType = C
triggerall = StateNo != 4000
triggerall = StateNo != 200
triggerall = StateNo != 205
triggerall = P2Life != 0
trigger1 = p2dist x <= 50
trigger1 = ctrl = 1
trigger2 = stateno = 235
trigger2 = movecontact = 1
trigger3 = stateno = 200
trigger3 = movecontact = 1

;Jump up n' get em
[State -1, AI: Jump]
type = ChangeState
value = 40
triggerall = var(7) = 1
triggerall = StateType = S || StateType = C
trigger1 = P2StateType = A
trigger1 = ctrl = 1

;Close weak kick
[State -1, AI: Weak Kick Close]
type = ChangeState
value = 235
triggerall = var(7) = 1
triggerall = StateType = S || StateType = C
triggerall = StateNo != 4000
trigger1 = stateno = 205
trigger1 = movecontact = 1
trigger2 = p2dist x <= 30
trigger2 = ctrl = 1
trigger3 = stateno = 200
trigger3 = movecontact = 1

;Aerial weak punch
[State -1, AI: Weak Punch Jump]
type = ChangeState
value = 600
triggerall = var(7) = 1
triggerall = StateType = A
trigger1 = p2dist x <= 30
trigger1 = ctrl = 1

;Aerial Strong Punch
[State -1, AI: Strong Punch Jump]
type = ChangeState
value = 610
triggerall = var(7) = 1
triggerall = StateType = A
trigger1 = p2dist x <= 20
trigger1 = ctrl = 1
trigger2 = stateno = 600
trigger2 = movecontact = 1
trigger2 = stateno = 630
trigger2 = movecontact = 1

;Aerial weak Kick
[State -1, AI: Weak Kick Jump]
type = ChangeState
value = 630
triggerall = var(7) = 1
triggerall = StateType = A
trigger1 = p2dist x <= 30
trigger1 = ctrl = 1
trigger2 = stateno = 600
trigger2 = movecontact = 1

;Power Slash
[State -1, AI: Strong Kick Close]
type = ChangeState
value = 245
triggerall = var(7) = 1
triggerall = StateType = S || StateType = C
trigger1 = P2movetype = H
trigger1 = p2dist x <= 70
trigger1 = Time = 30
trigger1 = ctrl = 1
trigger2 = stateno = 235
trigger2 = movecontact = 1
trigger2 = stateno = 200
trigger2 = movecontact = 1

;Guard codes

; ==========================
; AI Standing Guard
; ==========================
[State -1, AI: Guard Stand]
type = ChangeState
triggerall = var(7) = 1 ;AI trigger used
triggerall = Statetype != A ;Player is not in the air
triggerall = P2statetype != C ;Player is not crouching
triggerall = Statetype = S ;Player is currently standing
triggerall = P2Movetype = A ;Opponent is attacking
triggerall = Pos Y != [-1,-999]
triggerall = ctrl = 1
trigger1 = random <= 950 ;triggers at 95% probability
value = 130 ;Default standing guard state

; =============================
; AI Stand to Crouch Guard Transition
; =============================
[State -1, AI: Guard Stand to Crouch]
type = ChangeState
triggerall = var(7) = 1
triggerall = StateType != A
triggerall = P2statetype = C
triggerall = P2Movetype = A
triggerall = Pos Y != [-1,-999]
trigger1 = stateno = 150
trigger1 = 1
value = 152

; =============================
; AI Crouching Guard
; =============================
[State -1, AI: Guard Crouch]
type = ChangeState
triggerall = var(7) = 1
triggerall = StateType != A
triggerall = P2statetype = C
triggerall = P2Movetype = A
triggerall = Pos Y != [-1,-999]
triggerall = ctrl = 1
trigger1 = random <= 950
value = 131

; =============================
; AI Crouch to Stand Guard Transition
; =============================
[State -1, AI: Guard Crouch to Stand]
type = ChangeState
triggerall = var(7) = 1
triggerall = Statetype != A
triggerall = P2statetype != C
triggerall = P2Movetype = A
trigger1 = 1
trigger1 = stateno = 152
value = 150

; =============================
; AI Aerial Guard
; =============================
[State -1, AI: Guard Air]
type = ChangeState
triggerall = var(7) = 1
triggerall = Statetype = A
triggerall = P2Movetype = A
triggerall = ctrl = 1
trigger1 = random <= 950
value = 132

;=====================================================================
; Super Arts
;=====================================================================

;---------------------------------------------------------------------
; ‹Öç“ó•SEˆëŽ®E”ª’t—iLV.2j
[State -1, Shun Homer Satsu]
type = ChangeState
value = 3600
triggerall= Command = "Shun Homer Satsu"
triggerall = Power = 4000
triggerall = var(39)
trigger1 = StateType != A && (StateNo = 100 || StateNo = 40 || Stateno = 0 || Stateno = 230)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
;=======================
[State -1, Homer Butt Slam]
type = ChangeState
value = 4400
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0
triggerall= Var(17) = 0 && var(39) = 0 && (Command = "Misogi Butt" && Power >= 3500)
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
;Super Cancel triggers
trigger4 = Stateno = 1110  && HitDefAttr = S, SA
;---------------------------------------------------------------------
; ‹Öç“ó•SEˆëŽ®E”ª’t—iLV.1j
[State -1, Ready Aim Fire]
type = ChangeState
value = 3400
triggerall= var(39) = 0
triggerall= Power >= 2000
triggerall= Command = "Ready Aim Fire"
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
;trigger1 = StateNo = 3100
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2
;Super Cancel triggers
trigger5 = Stateno = 1110  && HitDefAttr = S, SA


;---------------------------------------------------------------------
; — •SŽ®E‹S‰‹iLv.3j
[State -1, Drunken Tornado 3]
type = ChangeState
value = 3320
triggerall= var(39)
triggerall= Command = "Drunken Tornado_LV.3" && Power >= 3000
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2

;---------------------------------------------------------------------
; — •SŽ®E‹S‰‹iLv.2j
[State -1, Drunken Tornado 2]
type = ChangeState
value = 3310
triggerall= var(39)
triggerall= Command = "Drunken Tornado_LV.2" && Power >= 2000
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2



;---------------------------------------------------------------------
; — •SŽ®E‹S‰‹iLv.1j
[State -1, Drunken Tornado 1]
type = ChangeState
value = 3300
triggerall= var(39)&& Power >= 1000
triggerall= (Command = "Drunken Tornado_LV.1") || (Command = "Drunken Tornado_LV.2" && Power < 2000)
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2


;---------------------------------------------------------------------
; — •S”ªŽ®E”ªŽð”tiLV.3j
[State -1, Hell Candy Bomb 3]
type = ChangeState
value = 3020
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0
triggerall= Var(17) = 0 && var(39) = 0 && (Command = "Hell Candy Bomb_LV.3" && Power >= 3000)
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410

;---------------------------------------------------------------------
; — •S”ªŽ®E”ªŽð”tiLV.2j
[State -1, Hell Candy Bomb 2]
type = ChangeState
value = 3010
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0
triggerall= Var(17) = 0 && var(39) = 0 && (Command = "Hell Candy Bomb_LV.2" && Power >= 2000)
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410

;---------------------------------------------------------------------
; — •S”ªŽ®E”ªŽð”tiLV.1j
[State -1, Hell Candy Bomb 1]
type = ChangeState
value = 3002
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0 && Power >= 1000
;triggerall= Var(17) = 0 && var(39) = 0 && ((Command = "Hell Candy Bomb_LV.1") || (Command = "Hell Candy Bomb_LV.2" && Power < 2000))
triggerall= Var(17) = 0 && var(39) = 0 && (Command = "Hell Candy Bomb_LV.1")
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410

;---------------------------------------------------------------------
; ‹Öç“ó•SEˆëŽ®E”ª’t—iLV.3j
[State -1, Bash Dash Masher 3]
type = ChangeState
value = 3120
triggerall= Command = "Bash Dash Masher_LV.3" && Power >= 3000
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2
;Super Cancel triggers
trigger5 = Stateno = 1110  && HitDefAttr = S, SA

;---------------------------------------------------------------------
; ‹Öç“ó•SEˆëŽ®E”ª’t—iLV.2j
[State -1, Bash Dash Masher 2]
type = ChangeState
value = 3110
triggerall= Command = "Bash Dash Masher_LV.2" && Power >= 2000
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2
;Super Cancel triggers
trigger5 = Stateno = 1110 && HitDefAttr = S, SA
;---------------------------------------------------------------------
; ‹Öç“ó•SEˆëŽ®E”ª’t—iLV.1j
[State -1, Bash Dash Masher 1]
type = ChangeState
value = 3100
triggerall= Power >= 1000
triggerall= (Command = "Bash Dash Masher_LV.1") || (Command = "Bash Dash Masher_LV.2" && Power < 2000)
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2
;Super Cancel triggers
trigger5 = Stateno = 1110  && HitDefAttr = S, SA

;---------------------------------------------------------------------
; ‹Öç“ó•SEˆëŽ®E”ª’t—iLV.2j
[State -1, Touch of Death]
type = ChangeState
value = 3667
triggerall= Command = "Grim Reaper" && Power >= 2000
triggerall = var(39)
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100 || StateNo = 40)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2
;Dream Cancel triggers
trigger5 = Stateno = 3101

;---------------------------------------------------------------------
; ‹Öç“ó•SEˆëŽ®E”ª’t—iLV.2j
[State -1, Road Roller D'oh]
type = ChangeState
value = 3500
triggerall= Command = "Heavy Roller"
triggerall = Power >= 3000
triggerall = var(39)
trigger1 = StateType != A && Ctrl = 1
;Dream Cancel triggers
trigger2 = Stateno = 3101

;---------------------------------------------------------------------
; — •SŽ®E‹S‰‹iLv.1j

[State -1, Hyper]
type = ChangeState
value = 350
triggerall = command = "Kakaroto"
triggerall = power >= 2000 
trigger1 = Statetype != A && ctrl
trigger2 = (StateType != A) && (HitdefAttr = SC, NA) && (MoveContact)

;---------------------------------------------------------------------
; –\‘–
[State -1, BEER RIOT HOMER]
type = ChangeState
value = 9999
triggerall= !var(39)
triggerall = command = "Beer Riot"
trigger1 = StateType = S && Ctrl = 1

;============================================
; EX Specials
;============================================

;---------------------------------------------------------------------
; •SŽ®E‹SÄ‚«i‹­j
[State -1, EX Woohoo Whirlwind]
type = ChangeState
value = 1120
triggerall = Power >= 500
triggerall= Command = "Woohoo Whirlwind EX"
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2

;---------------------------------------------------------------------
; •S”ªŽ®EˆÅ•¥‚¢i‹­j
[State -1, EX Kinetic Donut]
type = ChangeState
value = 1020
triggerall = Power >= 500
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0
triggerall= Var(17) = 0 && Command = "Kinetic Donut EX" && NumProjID(1005) = 0
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410



;=====================================================================
; Special Arts 
;=====================================================================

;---------------------------------------------------------------------
; ‹û•—
[State -1, Side Switch]
type = ChangeState
value = 1200
triggerall= Command = "Sideswitch" && var(39) = 0
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410

;---------------------------------------------------------------------
; “ó•SE“óŽ®E‹ÕŒŽ@‰AiŽãj
[State -1, Tackle Kick]
type = ChangeState
value = 1400
triggerall= Command = "Rush Tackle Kick_a"
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2

;---------------------------------------------------------------------
; “ó•SE“óŽ®E‹ÕŒŽ@‰Ai‹­j
[State -1, Tackle Kick Drunken]
type = ChangeState
value = 1410
triggerall= Command = "Rush Tackle Kick_b"
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2

;---------------------------------------------------------------------
; •SŽ®E‹SÄ‚«iŽãj
[State -1, Woohoo Whirlwind 1]
type = ChangeState
value = 1100
triggerall= Command = "Woohoo Whirlwind_x"
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2

;---------------------------------------------------------------------
; •SŽ®E‹SÄ‚«i‹­j
[State -1, Woohoo Whirlwind 2]
type = ChangeState
value = 1110
triggerall= Command = "Woohoo Whirlwind_y"
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
trigger4  = StateNo = 1301 && AnimElem = 5,>= 2

;---------------------------------------------------------------------
; •S”ªŽ®EˆÅ•¥‚¢iŽãj
[State -1, Kinetic Donut 1]
type = ChangeState
value = 1000
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0
triggerall= Var(17) = 0 && Command = "Kinetic Donut_x" && NumProjID(1005) = 0
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410

;---------------------------------------------------------------------
; •S”ªŽ®EˆÅ•¥‚¢i‹­j
[State -1, Kinetic Donut 2]
type = ChangeState
value = 1010
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0
triggerall= Var(17) = 0 && Command = "Kinetic Donut_y" && NumProjID(1005) = 0
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
;---------------------------------------------------------------------
; 3 de unave
[State -1]
type = ChangeState
value = 1012
triggerall= NumHelper(3008) = 0 && NumHelper(3009) = 0 && NumHelper(3010) = 0
triggerall= Var(17) = 0 && Command = "Gun_z" && NumProjID(1005) = 0
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410
;------------------------ ˆê’i–Ú

[State -1, 3-hit rush 1]
type = ChangeState
value = 1300
triggerall= Command = "3-hit Rushdown"
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Var(12) = [1,10]
trigger2 = (stateno = [200,205)) || stateno = 235 || stateno = 400 || stateno = 430
trigger3 = Var(12) = [1,16]
trigger3 = stateno = 210 || (stateno = 215 && var(13) = 1) || stateno = 410

;------------------------ “ñ’i–Ú
[State -1, 3-hit rush 2]
type = ChangeState
value = 1301
triggerall= var(15) = 1
trigger1  = StateNo = 1300 && AnimElem = 5,>= 2 && AnimElem = 7,< 0
trigger2 = Var(12) = [1,16]
trigger2 = stateno = 1300

;------------------------ ŽO’i–Ú
[State -1, 3-hit rush 3]
type = ChangeState
value = 1302
triggerall= var(15) = 1
trigger1  = StateNo = 1301 && AnimElem = 5,>= 2 && AnimElem = 7,< 0
trigger2 = Var(12) = [1,16]
trigger2 = stateno = 1301

;------------------------æs“ü—Í
[State -1,3-hit rush - Varset]
type = VarSet
var(15) = 1
triggerall = Command = "3-hit Rushdown" && Time > 0 && var(15) = 0
trigger1  = StateNo = 1300 && AnimElem = 1,> 1 && AnimElem = 6,< 3
trigger2  = StateNo = 1301 && AnimElem = 1,> 1 && AnimElem = 6,< 3

;=====================================================================
; Basic Animation
;=====================================================================

;---------------------------------------------------------------------
;RunFwd
[State -1, Run Forward]
type = ChangeState
value = 100
trigger1 = Command = "FF" && StateType = S && Ctrl = 1 && StateNo != 100

;Run Fwd
;ƒ_ƒbƒVƒ…
[State -1, Air Dash]
type = ChangeState
value = 110
triggerall = command = "FF"
triggerall = statetype = A
triggerall = StateNo != 110
trigger1 = ctrl

;---------------------------------------------------------------------
;RunBack
[State -1, Hop Backward]
type = ChangeState
value = 105
trigger1 = Command = "BB" && StateType = S && Ctrl = 1

;Run Fwd
;ƒ_ƒbƒVƒ…
[State -1, Air Dash]
type = ChangeState
value = 115
triggerall = command = "BB"
triggerall = statetype = A
triggerall = StateNo != 115
trigger1 = ctrl


;=====================================================================
; 2/3 Buttons
;=====================================================================
;
;=====================================================================
; Basic Throws
;=====================================================================

;---------------------------------------------------------------------
; ‹t”‚¬i‚o’Êí“Š‚°j
[State -1, Throw]
type = ChangeState
value = 800
triggerall = StateNo != 100 && StateType = S && Ctrl = 1
triggerall = P2MoveType != H && !P2StateType = A
trigger1 = Command = "fwd_y" && P2BodyDist X < 10 ;40
trigger2 = Command = "back_y" && P2BodyDist X < 10  ;20

;---------------------------------------------------------------------
; ‹t”‚¬iK’Êí“Š‚°j
[State -1, Throw]
type = ChangeState
value = 850
triggerall = StateNo != 100 && StateType = S && Ctrl = 1
triggerall = P2MoveType != H && !P2StateType = A
trigger1 = Command = "fwd_b" && P2BodyDist X < 10
trigger2 = Command = "back_b" && P2BodyDist X < 10
;---------------------------------------------------------------------
; Special Attacks , Moves and so on.
;---------------------------------------------------------------------

;---------------------------------------------------------------------
; ‹Ù‹}‰ñ”ð“®ì
[State -1, Crawling Dodge]
type = ChangeState
value = 4000
triggerall = Command = "recovery"
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)
trigger2 = Time <= 1 && ((StateNo = [200,499]) ||  (StateNo = 700))
;---------------------------------------------------------------------
; ƒpƒ[—­‚ß“®ì
;Power Charge
[State -1, Power Charge]
type = ChangeState
value = 4100
triggerall = (command = "charge1" && command = "charge2")
triggerall = statetype != A && Power < 4000
triggerall = var(7) != 1      ;Prevents AI from Abusing Charge to throw off AI
trigger1 = ctrl
trigger2 = Time <= 1 && ((StateNo = [200,499]) ||  (StateNo = 700))
;=====================================================================
; Dir + Button
;=====================================================================

;---------------------------------------------------------------------
; ŠOŽ®EŒ•€@‰A@"Ž€_"i¨{Aj
[State -1]
type = ChangeState
value = 700
triggerall= Command = "fwd_a"
trigger1 = StateType != A && (Ctrl = 1 || StateNo = 100)

;---------------------------------------------------------------------
; ŠOŽ®E•S‡Ü‚èiƒWƒƒƒ“ƒv’†©{Aj
[State -1, Body Slam]
type = ChangeState
value = 710
triggerall= Command = "back_ab"
trigger1 = StateType = A && Ctrl = 1



;=====================================================================
; Taunts
;=====================================================================

;---------------------------------------------------------------------
; ’§”­
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
trigger1 = StateType = S && Ctrl = 1

;=====================================================================
; Basic Arts
;=====================================================================

;---------------------------------------------------------------------
; Žãƒpƒ“ƒ`
[State -1, Stand Weak Punch]
type = ChangeState
value = IfElse(P2BodyDist X <= 10,205,200)
triggerall = Command = "x" && !Command = "holddown"
trigger1 = StateType = S && (Ctrl = 1 || StateNo = 100)
trigger2  = (StateNo = 200 && AnimElem = 3,> 1)
trigger3  = (StateNo = 205 && AnimElem = 3,> 1)
trigger4  = (StateNo = 400 && AnimElem = 3,> 1)
trigger5  = (StateNo = 430 && AnimElem = 3,> 1)


;---------------------------------------------------------------------
; ŽãƒLƒbƒN
[State -1, Stand Weak Kick]
type = ChangeState
value = IfElse(P2BodyDist X <= 28,235,230)
triggerall = Command = "a" && !Command = "holddown"
trigger1 = StateType = S && (Ctrl = 1 || StateNo = 100)
trigger2  = (StateNo = 200 && AnimElem = 3,> 1)
trigger3  = (StateNo = 205 && AnimElem = 3,> 1)
trigger4  = (StateNo = 400 && AnimElem = 3,> 1)
trigger5  = (StateNo = 430 && AnimElem = 3,> 1)
;---------------------------------------------------------------------
; ‹­ƒpƒ“ƒ`
[State -1, Stand Medium Punch]
type = ChangeState
value = IfElse(P2BodyDist X <= 44,215,210)
triggerall = Command = "y" && !Command = "holddown"
trigger1  = (StateNo = 200 && AnimElem = 3,> 1)
trigger2  = (StateNo = 205 && AnimElem = 3,> 1)
trigger3 = StateType = S && (Ctrl = 1 || StateNo = 100)
;---------------------------------------------------------------------
; ‹­ƒLƒbƒN
[State -1, Stand Medium Kick]
type = ChangeState
value = IfElse(P2BodyDist X <= 40,245,240)
triggerall = Command = "b" && !Command = "holddown"
trigger1  = (StateNo = 230 && AnimElem = 3,> 1)
trigger2  = (StateNo = 235 && AnimElem = 3,> 1)
trigger3 = StateType = S && (Ctrl = 1 || StateNo = 100)
;---------------------------------------------------------------------
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = Command = "z" && !Command = "holddown"
triggerall = var(7) != 1
trigger1 = stateType = S
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
;---------------------------------------------------------------------
; ‹­ƒLƒbƒN
[State -1, Stand Strong Kick]
type = ChangeState
value = 250
triggerall = Command = "c" && !Command = "holddown"
triggerall = var(7) != 1
trigger1 = stateType = S
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
; ‚µ‚á‚ª‚ÝŽãƒpƒ“ƒ`
[State -1]
type = ChangeState
value = 400
triggerall = Command = "x" && Command = "holddown"
trigger1 =  (StateType = C && Ctrl = 1) || StateNo = 100
trigger2  = (StateNo = 200 && AnimElem = 3,> 1)
trigger3  = (StateNo = 205 && AnimElem = 3,> 1)
trigger4  = (StateNo = 400 && AnimElem = 3,> 1)
trigger5  = (StateNo = 430 && AnimElem = 3,> 1)
;---------------------------------------------------------------------
; ‚µ‚á‚ª‚Ý‹­ƒpƒ“ƒ`
[State -1]
type = ChangeState
value = 410
triggerall = Command = "y" && Command = "holddown"
trigger1 = (StateType = C && Ctrl = 1) || StateNo = 100
trigger2  = (StateNo = 400 && AnimElem = 3,> 1)
trigger3  = (StateNo = 430 && AnimElem = 3,> 1)
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
[State -1]
type = ChangeState
value = 420
triggerall = Command = "z" && Command = "holddown"; || var(7) != 1
trigger1 = (StateType = C && Ctrl = 1) || StateNo = 100
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
; ‚µ‚á‚ª‚ÝŽãƒLƒbƒN
[State -1]
type = ChangeState
value = 430
triggerall = Command = "a" && Command = "holddown"
trigger1 = (StateType = C && Ctrl = 1) || StateNo = 100
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
; ‚µ‚á‚ª‚Ý‹­ƒLƒbƒN
[State -1]
type = ChangeState
value = 440
triggerall = Command = "b" && Command = "holddown"
trigger1 = (StateType = C && Ctrl = 1) || StateNo = 100
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
[State -1]
type = ChangeState
value = 450
triggerall = Command = "c" && Command = "holddown"
trigger1 = (StateType = C && Ctrl = 1) || StateNo = 100
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
; ƒWƒƒƒ“ƒvŽãƒpƒ“ƒ`
[State -1]
type = ChangeState
value = 600
triggerall = Command = "x" && StateType = A && Ctrl = 1
trigger1 = StateNo != 105
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
; ƒWƒƒƒ“ƒv‹­ƒpƒ“ƒ`
[State -1]
type = ChangeState
value = 610
triggerall = Command = "y" && StateType = A && Ctrl = 1
trigger1 = StateNo != 105
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
;Aerial Strong Kick
[State -1, Aerial Strong Kick]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
; ƒWƒƒƒ“ƒvŽãƒLƒbƒN
[State -1]
type = ChangeState
value = 630
triggerall = Command = "a" && StateType = A && Ctrl = 1
trigger1 = StateNo != 105
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
; ƒWƒƒƒ“ƒv‹­ƒLƒbƒN
[State -1]
type = ChangeState
value = 640
triggerall = Command = "b" && StateType = A && Ctrl = 1
trigger1 = StateNo != 105
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------
[State -1, Aerial Hard Kick]
type = ChangeState
value = 650
trigger1 = command = "c" && StateType = A && Ctrl = 1
triggerall = var(7) != 1
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 235 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 430 && movecontact
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 700 && movecontact
;---------------------------------------------------------------------