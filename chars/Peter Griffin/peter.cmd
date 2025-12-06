;  =========================
;  =  Peter Griffin  =
;  =========================
;  by: Warner el Tochix
;  edits by: JudgeSpear
;  Version 1.1
;
;  Peter is more combo-friendly. His supers now link up properly in combos.
;  =============================================================
;  This character, and all code and artwork, is open source and public domain.
;  All I ask is that you give Warner and me credit should you use anything
;  from this character.


; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


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

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "Anal Torch"
command = ~D, DF, F, D, DF, F, x+y
time = 20

[Command]
name = "Steroid Peter Punch"
command = ~D, DF, F, D, DF, F, b+c
time = 20

[Command]
name = "A.N.N.A."
command = ~D, DB, B, D, DB, B, a+b
time = 20

[Command]
name = "Steroid Man"
command = ~D, DB, B, D, DB, B, x+y
time = 20

[Command]
name = "Kung Fu Fight"
command = ~D, DF, F, D, DF, F, a+b
time = 20

[Command]
name = "Ipecac Attack"
command = ~D, DB, B, D, DB, B, y+z
time = 20

[Command]
name = "Clown Peter"
command = ~D, DB, B, D, DB, B, b+c
time = 20

;-| Special Motions |------------------------------------------------------
[Command]
name = "Bottle Toss 1"
command = ~D, DF, F, a
time = 15

[Command]
name = "Bottle Toss 2"
command = ~D, DF, F, b
time = 15

[Command]
name = "Bottle Toss 3"
command = ~D, DF, F, c
time = 15

[Command]
name = "Bottle Toss 4"
command = ~D, DB, z
time = 15

[Command]
name = "BottleTossEX"
command = ~D, DF, F, a+b
time = 15

[Command]
name = "BottleTossEX"
command = ~D, DF, F, b+c
time = 15

[Command]
name = "BottleTossEX"
command = ~D, DF, F, a+c
time = 15

[Command]
name = "FartEX"
command = ~D, DF, F, x+y
time = 15

[Command]
name = "FartEX"
command = ~D, DF, F, y+z
time = 15

[Command]
name = "FartEX"
command = ~D, DF, F, x+z
time = 15


[Command]
name = "DrinkEX"
command = /a+b
time = 15

[Command]
name = "DrinkEX"
command = /b+c
time = 15

[Command]
name = "DrinkEX"
command = /c+a
time = 15

[Command]
name = "HCB x"
command =  ~F, DF, D, DB, B, x
time = 15

[Command]
name = "HCB y"
command =  ~F, DF, D, DB, B, y
time = 15

[Command]
name = "HCB z"
command = ~F, DF, D, DB, B, z
time = 15

[Command]
name = "HCB a"
command =  ~F, DF, D, DB, B, a
time = 15

[Command]
name = "HCB b"
command =  ~F, DF, D, DB, B, b
time = 15

[Command]
name = "HCB c"
command = ~F, DF, D, DB, B, c
time = 15

[Command]
name = "EX roadhouse"
command =  ~F, DF, D, DB, B, a+b
time = 15

[Command]
name = "EX roadhouse"
command =  ~F, DF, D, DB, B, b+c
time = 15

[Command]
name = "EX roadhouse"
command = ~F, DF, D, DB, B, a+c
time = 15

[Command]
name = "Anime Peter"
command = ~D, DB, a
time = 15

[Command]
name = "Shock Peter"
command = ~D, DB, b
time = 15

[Command]
name = "Mermaid Peter"
command = ~D, DB, c
time = 15

[Command]
name = "Ryu Peter"
command = ~D, DB, x
time = 15

[Command]
name = "Ryu Peter 2"
command = ~D, DB, y
time = 15

[Command]
name = "Fart-Douken 1"
command = ~D, DF, F, x
time = 15

[Command]
name = "Fart-Douken 2"
command = ~D, DF, F, y
time = 15

[Command]
name = "Fart-Douken 3"
command = ~D, DF, F, z
time = 15

[Command]
name = "Peter Smackdown 1"
command = ~D, DB, B, x
time = 15

[Command]
name = "Peter Smackdown 2"
command = ~D, DB, B, y
time = 15

[Command]
name = "Power Headbutt"
command = ~D, DB, B, z
time = 15

[Command]
name = "Light Buttstomp"
command = ~F, D, DF, x
time = 15

[Command]
name = "Medium Buttstomp"
command = ~F, D, DF, y
time = 15

[Command]
name = "Heavy Buttstomp"
command = ~F, D, DF, z
time = 15

[Command]
name = "EX Buttstomp"
command = ~F, D, DF, z+y
time = 15

[Command]
name = "EX Buttstomp"
command = ~F, D, DF, z+y
time = 15

[Command]
name = "EX Buttstomp"
command = ~F, D, DF, x+y
time = 15

[Command]
name = "EX Buttstomp"
command = ~F, D, DF, x+z
time = 15

[Command]
name = "PB&J"
command = ~D, DF, F, s
time = 15

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "superjump"     ;Required (do not remove)
command = $D, U
time = 15

[Command]
name = "superjumpforward"     ;Required (do not remove)
command = $D, UF
time = 15

[Command]
name = "superjumpbackward"     ;Required (do not remove)
command = $D, UB
time = 15

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------

[Command]
name = "fwd_b"
command = /F,b
time = 1

[Command]
name = "fwd_y"
command = /F,y
time = 1

[Command]
name = "back_b"
command = /B,b
time = 1

[Command]
name = "back_y"
command = /B,y
time = 1

[Command]
name = "fwd_c"
command = /F,c
time = 1

[Command]
name = "fwd_z"
command = /F,z
time = 1

[Command]
name = "back_c"
command = /B,c
time = 1

[Command]
name = "back_z"
command = /B,z
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
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

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_a";Required (do not remove)
command = /a
time = 1

[Command]
name = "hold_b";Required (do not remove)
command = /b
time = 1

[Command]
name = "hold_c";Required (do not remove)
command = /c
time = 1

[Command]
name = "hold_x";Required (do not remove)
command = /x
time = 1

[Command]
name = "hold_y";Required (do not remove)
command = /y
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------
[State -1, Steroid Man]
type = ChangeState
value = 1020
triggerall = command = "Steroid Man"
triggerall = power >= 3000
triggerall = roundstate = 2
triggerall = stateno != 3000 ; v1.1 - Cannot cancel in from Anal Torch
triggerall = stateno != [3050,3100] ; Cannot cancel in from Ipecac Attack
;trigger1 = var(1) ;Use combo condition (above)
trigger1 = statetype != A
trigger1 = hitdefattr = SC, NA, SA, HA
trigger1 = stateno != 1020
trigger2 = statetype = A
trigger2 = hitdefattr = A, NA
trigger2 = stateno != 1020
trigger3 = statetype = S
trigger3 = ctrl
;---------------------------------------------------------------------------
[State -1, A.N.N.A Attack]
type = ChangeState
value = 3100
triggerall = command = "A.N.N.A."
triggerall = power >= 3000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = (stateno = 1220) && time > 2
;---------------------------------------------------------------------------
[State -1, Kung Fu Fight]
type = ChangeState
value = 2500
triggerall = command = "Kung Fu Fight"
triggerall = power >= 1000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = hitdefattr = S, NA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
;---------------------------------------------------------------------------
[State -1, Anal Torch]
type = ChangeState
value = 3000
triggerall = command = "Anal Torch"
triggerall = power >= 2000
triggerall = roundstate = 2
triggerall = stateno != [3050,3100] ; Cannot cancel in from Ipecac Attack
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = (stateno != [3000,3050])

[State -1, Ipecac Attack]
type = ChangeState
value = 3050
triggerall = command = "Ipecac Attack"
triggerall = power >= 3000
triggerall = roundstate = 2
triggerall = stateno != [3050,3100] ; Cannot cancel in from Ipecac Attack
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = (stateno != [3000,3050])
;---------------------------------------------------------------------------
;Clown Peter
[State -1, Clown Peter]
type = ChangeState
value = 3150
triggerall = command = "Clown Peter"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
;---------------------------------------------------------------------------
;Steroid Peter Punch
[State -1, Steroid Peter Punch]
type = ChangeState
value = 3200
triggerall = command = "Steroid Peter Punch"
triggerall = power >= 3000
triggerall = roundstate = 2
triggerall = stateno != [3050,3100] ; Cannot cancel in from Ipecac Attack
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = (stateno != [3000,3050])
;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
var(1) = 1
;------------------------------------------------------------------
;EX Roadhouse Kick
[State -1, EX Roadhouse Kick]
type = ChangeState
value = 4010
triggerall = power >= 500
triggerall = statetype != A
triggerall = command = "EX roadhouse"
trigger1 = var(1) ;Use combo condition (above)
;------------------------------------------------------------------
;Roadhouse Kick
[State -1, Roadhouse Kick]
type = ChangeState
value = 4000
triggerall = statetype != A
triggerall = command = "HCB a" ||  command = "HCB b" ||  command = "HCB c"
trigger1 = var(1) ;Use combo condition (above)
;------------------------------------------------------------------
;Puke Puddle
[State -1, Puke Puddle]
type = ChangeState
value = 2000
triggerall = statetype != A
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = command = "HCB x" ||  command = "HCB y" ||  command = "HCB z"
trigger1 = ctrl
;--------------------------------------------------------------------
;EX bottle
[State -1, EX bottle]
type = ChangeState
value = 320
triggerall = command = "BottleTossEX"
triggerall = power >= 500
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype !=A
trigger1 = ctrl
;--------------------------------------------------------------------
;Light bottle
[State -1, Light bottle]
type = ChangeState
value = 300
triggerall = command = "Bottle Toss 1"
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype !=A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Fast bottle
[State -1, Fast bottle]
type = ChangeState
value = 310
triggerall = command = "Bottle Toss 2"
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype !=A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Far bottle
[State -1, Far bottle]
type = ChangeState
value = 315
triggerall = command = "Bottle Toss 3"
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype !=A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Upwards bottle
[State -1, Upwards bottle]
type = ChangeState
value = 375
triggerall = command = "Bottle Toss 4"
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype !=A
trigger1 = ctrl
;---------------------------------------------------------------------------------
;EX Buttstomp
[State -1, EX Buttstomp]
type = ChangeState
value = 4610
triggerall = statetype != A
triggerall = power >= 500
triggerall = command = "EX Buttstomp"
trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Buttstomp
[State -1, Buttstomp]
type = ChangeState
value = 4510
triggerall = statetype != A
triggerall = command = "Light Buttstomp"
trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Buttstomp
[State -1, Buttstomp]
type = ChangeState
value = 4511
triggerall = statetype != A
triggerall = command = "Medium Buttstomp"
trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Buttstomp
[State -1, Buttstomp]
type = ChangeState
value = 4512
triggerall = statetype != A
triggerall = command = "Heavy Buttstomp"
trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Buttstomp
[State -1, Buttstomp]
type = ChangeState
value = 4500
triggerall = statetype = A
triggerall = command = "Light Buttstomp"
trigger1 = ctrl
;---------------------------------------------------------------------------
;Buttstomp
[State -1, Buttstomp]
type = ChangeState
value = 4500
triggerall = statetype = A
triggerall = command = "Medium Buttstomp"
trigger1 = ctrl
;---------------------------------------------------------------------------
;Buttstomp
[State -1, Buttstomp]
type = ChangeState
value = 4500
triggerall = statetype = A
triggerall = command = "Heavy Buttstomp"
trigger1 = ctrl
;---------------------------------------------------------------------------
;EX Fart
[State -1, EX Fart]
type = ChangeState
value = 1017
triggerall = command = "FartEX"
triggerall = power >= 500
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype != A
trigger1 = var(1)
trigger2 = (stateno = 1220) && time > 5
;---------------------------------------------------------------------------
;Light fart
[State -1, Fart-Douken 1]
type = ChangeState
value = 1000
triggerall = command = "Fart-Douken 1"
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype != A
trigger1 = var(1)
trigger2 = (stateno = 1220) && time > 5
;---------------------------------------------------------------------------
;Fast fart
[State -1, Fart-Douken 2]
type = ChangeState
value = 1010
triggerall = command = "Fart-Douken 2"
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype != A
trigger1 = var(1)
trigger2 = (stateno = 1220) && time > 5
;---------------------------------------------------------------------------
;Fast fart
[State -1, Fart-Douken 3]
type = ChangeState
value = 1015
triggerall = command = "Fart-Douken 3"
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype != A
trigger1 = var(1)
trigger2 = (stateno = 1220) && time > 5
;---------------------------------------------------------------------------
;Anime
[State -1, Anime Peter]
type = ChangeState
value = 1022
triggerall = command = "Anime Peter"
triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Shock
[State -1, Shock Peter]
type = ChangeState
value = 1024
triggerall = command = "Shock Peter"
triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Ryu 
[State -1, Ryu Peter]
type = ChangeState
value = 1030
triggerall = command = "Ryu Peter"
triggerall = numhelper = 0
triggerall = numproj = 0 
triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Ryu 2
[State -1, Ryu Peter 2]
type = ChangeState
value = 1031
triggerall = command = "Ryu Peter 2"
triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Mermaid
[State -1, Mermaid Peter]
type = ChangeState
value = 1040
triggerall = command = "Mermaid Peter"
triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = StateNo != 100 && StateType = S && Ctrl = 1
triggerall = P2MoveType != H && !P2StateType = A
trigger1 = Command = "fwd_y" && P2BodyDist X < 40
trigger2 = Command = "back_y" && P2BodyDist X < 20
;---------------------------------------------------------------------
;Throw 2
[State -1, Throw 2]
type = ChangeState
value = 850
triggerall = StateNo != 100 && StateType = S && Ctrl = 1
triggerall = P2MoveType != H && !P2StateType = A
trigger1 = Command = "fwd_b" && P2BodyDist X < 40
trigger2 = Command = "back_b" && P2BodyDist X < 20
;---------------------------------------------------------------------
;===========================================================================
;Counter
[State -1, Counter]
type = ChangeState
value = 8000
triggerall = power >= 1000
triggerall = command = "x" && command = "y" || command = "y" && command = "z" || command = "x" && command = "z" || command = "x" && command = "y" && command = "z"
triggerall = statetype != A
trigger1 = stateno = 150
trigger2 = stateno = 151
;===========================================================================
;Counter
[State -1, Counter]
type = ChangeState
value = 8001
triggerall = power >= 1000
triggerall = command = "x" && command = "y" || command = "y" && command = "z" || command = "x" && command = "z" || command = "x" && command = "y" && command = "z"
triggerall = statetype = C
trigger1 = stateno = 152
trigger2 = stateno = 153
;===========================================================================
;---------------------------------------------------------------------------
;It's peanut butter jelly time
[State -1, It's peanut butter jelly time]
type = ChangeState
value = 112
triggerall = command = "PB&J"
triggerall = power >= 3000
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start" && command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Taunt 2
[State -1, Taunt 2]
type = ChangeState
value = 196
triggerall = command = "start" && command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = p2bodydist X >29
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
;---------------------------------------------------------------------------
;Stand Strong Punch close
[State -1, Stand Medium Punch close]
type = ChangeState
value = 215
triggerall = p2bodydist X <29
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
;---------------------------------------------------------------------------
;Stand Strongest Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = command = "z" && command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 210 && movecontact) || (stateno = 215) && movecontact || (stateno = 200) && movecontact
;---------------------------------------------------------------------------
[State -1, Power Headbutt]
type = ChangeState
value = 1220
triggerall = command = "z" && command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 5
trigger3 = (stateno = 230) && time > 6
;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a" && command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 235
triggerall = command = "a" && command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
;---------------------------------------------------------------------------
;Standing Strongest Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 230) && movecontact
trigger3 = (stateno = 240) && movecontact
;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 ;combo from crouch light kick
trigger2 = movecontact
;---------------------------------------------------------------------------
;Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = 410) && movecontact
;--------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
;---------------------------------------------------------------------------
;Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 430) && movecontact
;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 430) && movecontact
trigger3 = (stateno = 440) && movecontact
;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = stateno != 600
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = stateno != 610
trigger2 = (stateno = 600) && movecontact ;light air attack
;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = stateno != 620
trigger2 = stateno = 610
trigger2 = movecontact
trigger3 = stateno = 600
trigger3 = movecontact
;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = stateno != 630
triggerall = stateno != 640
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 635
triggerall = command = "b"
triggerall = stateno != 635
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 630 
trigger2 = movecontact
;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger1 = stateno != 640
trigger2 = stateno = 635
trigger2 = movecontact
trigger3 = stateno = 630
trigger3 = movecontact