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
[Command]
name = "qcfhcba"
command = ~D, F, D, B, a
time = 40
[Command]
name = "qcfhcbb"
command = ~D, F, D, B, b
time = 40
[Command]
name = "qcfhcbc"
command = ~D, F, D, B, c
time = 40
[Command]
name = "qcfhcba"
command = ~D, F, D, B, ~a
time = 40
[Command]
name = "qcfhcbb"
command = ~D, F, D, B, ~b
time = 40
[Command]
name = "qcfhcbc"
command = ~D, F, D, B, ~c
time = 40



[Command]
name = "qcbhcfa"
command = ~D, B, D, F, a
time = 40
[Command]
name = "qcbhcfb"
command = ~D, B, D, F, b
time = 40
[Command]
name = "qcbhcfc"
command = ~D, B, D, F, c
time = 40
[Command]
name = "qcbhcfa"
command = ~D, B, D, F, ~a
time = 40
[Command]
name = "qcbhcfb"
command = ~D, B, D, F, ~b
time = 40
[Command]
name = "qcbhcfc"
command = ~D, B, D, F, ~c
time = 40

; ---

[Command]
name = "2qcfa"
command = ~D, DF, F, D, DF, F, a
time = 30

[Command]
name = "2qcfb"
command = ~D, DF, F, D, DF, F, b
time = 30

[Command]
name = "2qcfc"
command = ~D, DF, F, D, DF, F, c
time = 30

[Command]
name = "2qcfa"
command = ~D, DF, F, D, DF, F, ~a
time = 30

[Command]
name = "2qcfb"
command = ~D, DF, F, D, DF, F, ~b
time = 30

[Command]
name = "2qcfc"
command = ~D, DF, F, D, DF, F, ~c
time = 30

;---

[Command]
name = "2qcba"
command = ~D, DB, B, D, DB, B, a
time = 30

[Command]
name = "2qcbb"
command = ~D, DB, B, D, DB, B, b
time = 30

[Command]
name = "2qcbc"
command = ~D, DB, B, D, DB, B, c
time = 30

[Command]
name = "2qcba"
command = ~D, DB, B, D, DB, B, ~a
time = 30

[Command]
name = "2qcbb"
command = ~D, DB, B, D, DB, B, ~b
time = 30

[Command]
name = "2qcbc"
command = ~D, DB, B, D, DB, B, ~c
time = 30


[Command]
name = "dp2"
command = ~F, D, DF, a+b
time = 30

[Command]
name = "dp2"
command = ~F, D, DF, a+c
time = 30

[Command]
name = "dp2"
command = ~F, D, DF, ~a+b
time = 30

[Command]
name = "dp2"
command = ~F, D, DF, ~a+c
time = 30

[Command]
name = "dp2"
command = ~F, D, DF, ~b+c
time = 30

[Command]
name = "dp2"
command = F, D, DF, b+c
time = 30

[Command]
name = "dp2"
command = F, D, DF, ~b+c
time = 30



[Command]
name = "qcf2"
command = ~D, DF, F, a+b
time = 30

[Command]
name = "qcf2"
command = ~D, DF, F, a+c
time = 30

[Command]
name = "qcf2"
command = ~D, DF, F, ~a+b
time = 30

[Command]
name = "qcf2"
command = ~D, DF, F, ~a+c
time = 30

[Command]
name = "qcf2"
command = ~D, DF, F, ~b+c
time = 30

[Command]
name = "qcf2"
command = D, DF, F, b+c
time = 30

[Command]
name = "qcf2"
command = D, DF, F, ~b+c
time = 30


; --------


[Command]
name = "qcb2"
command = ~D, DB, B, a+b
time = 30

[Command]
name = "qcb2"
command = ~D, DB, B, a+c
time = 30

[Command]
name = "qcb2"
command = ~D, DB, B, ~a+b
time = 30

[Command]
name = "qcb2"
command = ~D, DB, B, ~a+c
time = 30

[Command]
name = "qcb2"
command = ~D, DB, B, ~b+c
time = 30

[Command]
name = "qcb2"
command = D, DB, B, b+c
time = 30

[Command]
name = "qcb2"
command = D, DB, B, ~b+c
time = 30

;-| Special Motions |------------------------------------------------------

[Command]
name = "hcba"
command = ~F, D, B, ~a
time=20

[Command]
name = "hcbb"
command = ~F, D, B, ~b
time=20

[Command]
name = "hcbc"
command = ~F, D, B, ~c
time=20

[Command]
name = "qcba"
command =  ~D, DB, B, a
time=15

[Command]
name = "qcbb"
command = ~D, DB, B, b	
time=15

[Command]
name = "qcbc"
command = ~D, DB, B, c
time=15

[Command]
name = "qcba"
command =  ~D, DB, B, ~a
time=15

[Command]
name = "qcbb"
command = ~D, DB, B, ~b	
time=15

[Command]
name = "qcbc"
command = ~D, DB, B, ~c
time=15

[Command]
name = "qcbx"
command = ~D, DB, B, ~x
time=15

[Command]
name = "qcbx"
command = ~D, DB, B, x
time=15

;---

[Command]
name = "dfa"
command = ~F, D, DF, ~a
time = 20

[Command]
name = "dfa"
command = ~F, D, DF, a
time = 20

[Command]
name = "dfb"
command = ~F, D, DF, ~b
time = 20

[Command]
name = "dfb"
command = ~F, D, DF, b
time = 20

[Command]
name = "dfc"
command = ~F, D, DF, ~c
time = 20

[Command]
name = "dfc"
command = ~F, D, DF, c
time = 20

[Command]
name = "qcfa"
command = ~D, DF, F, ~a
time = 15

[Command]
name = "qcfa"
command = ~D, DF, F, a
time = 15

[Command]
name = "qcfb"
command = ~D, DF, F, ~b
time = 15

[Command]
name = "qcfb"
command = ~D, DF, F, b
time = 15

[Command]
name = "qcfc"
command = ~D, DF, F, ~c
time = 15

[Command]
name = "qcfc"
command = ~D, DF, F, c
time = 15

;-| Double Tap |-----------------------------------------------------------

[Command]
name = "dashUFUF"
command = /UF, a+b
time = 10
[Command]
name = "dashUFUF"
command = /UF, a+c
time = 10
[Command]
name = "dashUFUF"
command = /UF, b+c
time = 10

[Command]
name = "dashDBDB"
command = /DB, a+b
time = 10

[Command]
name = "dashDBDB"
command = /DB, a+c
time = 10

[Command]
name = "dashDBDB"
command = /DB, b+c
time = 10

[Command]
name = "dashUBUB"
command = /UB, a+b
time = 10

[Command]
name = "dashUBUB"
command = /UB, a+c
time = 10

[Command]
name = "dashUBUB"
command = /UB, b+c
time = 10

[Command]
name = "dashDFDF"
command = /DF, a+b
time = 10

[Command]
name = "dashDFDF"
command = /DF, a+c
time = 10

[Command]
name = "dashDFDF"
command = /DF, b+c
time = 10

[Command]
name = "dashUU"
command = /U, a+b
time = 10

[Command]
name = "dashUU"
command = /U, a+c
time = 10

[Command]
name = "dashUU"
command = /U, b+c
time = 10

[Command]
name = "dashDD"
command = /D, a+b
time = 10

[Command]
name = "dashDD"
command = /D, a+c
time = 10

[Command]
name = "dashDD"
command = /D, b+c
time = 10

[Command]
name = "dashFF"
command = /F, a+b
time = 10

[Command]
name = "dashFF"
command = /F, a+c
time = 10

[Command]
name = "dashFF"
command = /F, b+c
time = 10

[Command]
name = "dashBB"
command = /B, a+b
time = 10

[Command]
name = "dashBB"
command = /B, b+c
time = 10

[Command]
name = "dashBB"
command = /B, a+c
time = 10

[Command]
name = "dashUFUF"
command = UF, UF
time = 10

[Command]
name = "dashDBDB"
command = DB, DB
time = 10

[Command]
name = "dashUBUB"
command = UB, UB
time = 10

[Command]
name = "dashDFDF"
command = DF, DF
time = 10

[Command]
name = "dashUU"
command = U, U
time = 10

[Command]
name = "dashDD"
command = D, D
time = 10

[Command]
name = "dashFF"
command = F, F
time = 10

[Command]
name = "dashBB"
command = B, B
time = 10

[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "highjump"
command = D, $U
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = a+b
time = 1

[Command]
name = "2p";Required (do not remove)
command = a+b
time = 1

[Command]
name = "2p"
command = b+c
time = 1

[Command]
name = "a+c"
command = a+c
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


;===========================================================================
; Super Moves
;===========================================================================

[State -1, Iron Avenger]
type = ChangeState
value = 12300
triggerall = PalNo = 12 
triggerall = Command = "qcb2"
triggerall = Power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (StateNo = [10200, 10299]) 
trigger3 = (StateNo = [10400, 10499]) 
trigger4 = (StateNo = [11000, 11999]) 
ignorehitpause = 1

[State -1, Angled Proton Cannon]
type = ChangeState
value = 12200
triggerall = PalNo = 12 
triggerall = Command = "dp2"
triggerall = Power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (StateNo = [10200, 10299]) 
trigger3 = (StateNo = [10400, 10499]) 
trigger4 = (StateNo = [11000, 11999]) 
ignorehitpause = 1

[State -1, Proton Cannon]
type = ChangeState
value = 12100
triggerall = PalNo = 12 
triggerall = Command = "qcf2"
triggerall = Power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (StateNo = [10200, 10299]) 
trigger3 = (StateNo = [10400, 10499]) 
trigger4 = (StateNo = [11000, 11999]) 
ignorehitpause = 1

;---------------------------------------------------------------------------
[State -1, Prometheus Cannon]
type = ChangeState
value = 2200
triggerall = PalNo != 12 
triggerall = Command = "qcbhcfa" || Command = "qcbhcfb" || Command = "qcbhcfc"
triggerall = Var(22) > 0
trigger1 = ctrl || ((stateno = [200, 299]) && time <= 10)
;---------------------------------------------------------------------------
[State -1, Omega Laser]
type = ChangeState
value = 2020
triggerall = PalNo != 12 
triggerall = Command = "qcbhcfa" || Command = "qcbhcfb" || Command = "qcbhcfc"
triggerall = Power >= 1000
triggerall = Var(22) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = ( StateNo = [200,299] ) && MoveContact
trigger3 = ( StateNo = [400,499] ) && MoveContact
;---------------------------------------------------------------------------
[State -1, Uzzi Punch]
type = ChangeState
value = 2010
triggerall = PalNo != 12 
triggerall = Command = "2qcfa" || Command = "2qcfb" || Command = "2qcfc" 
triggerall = Power >= 1000
triggerall = Var(22) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = ( StateNo = [200,299] ) && MoveContact
trigger3 = ( StateNo = [400,499] ) && MoveContact
;---------------------------------------------------------------------------
[State -1, Shock]
type = ChangeState
value = 2000
triggerall = PalNo != 12 
triggerall = Command = "2qcba" || Command = "2qcbb" || Command = "2qcbc" 
triggerall = Power >= 1000
triggerall = Var(22) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = ( StateNo = [200,299] ) && MoveContact
trigger3 = ( StateNo = [400,499] ) && MoveContact
;---------------------------------------------------------------------------
;===========================================================================
; EX Special Moves
;===========================================================================

[State -1, Smart Bomb]
type = ChangeState
value = 11200
triggerall = PalNo = 12
triggerall = Command = "dfa" || Command = "dfb" || Command = "dfc"
triggerall = RoundState = 2 && !NumHelper(11200)
trigger1 = Ctrl
trigger2 = (StateNo = [10200, 10299]) 
trigger3 = (StateNo = [10400, 10499]) 
trigger4 = (StateNo = [10600, 10699]) 
ignorehitpause = 1

[State -1, Repulsor Blast]
type = ChangeState
value = 11100
triggerall = PalNo = 12
triggerall = Statetype != A
triggerall = Command = "qcba" || Command = "qcbb" || Command = "qcbc"
triggerall = RoundState = 2 && !NumHelper(11100)
trigger1 = Ctrl
trigger2 = (StateNo = [10200, 10299]) 
trigger3 = (StateNo = [10400, 10499]) 
ignorehitpause = 1

[State -1, Unibeam]
type = ChangeState
value = 11000
triggerall = PalNo = 12
triggerall = Command = "qcfa" || Command = "qcfb" || Command = "qcfc"
triggerall = RoundState = 2 && !NumHelper(11000)
trigger1 = Ctrl
trigger2 = (StateNo = [10200, 10299]) 
trigger3 = (StateNo = [10400, 10499]) 
trigger4 = (StateNo = [10600, 10699]) 
ignorehitpause = 1

;===========================================================================
; Special Moves
;===========================================================================
[State -1, Robo Tackle]
type = ChangeState
value = 1010
triggerall = PalNo != 12
triggerall = Command = "dfa" || Command = "dfb" || Command = "dfc"
triggerall = Roundstate = 2 && Statetype != A 
trigger1 = Ctrl
trigger2 = (StateNo = [200, 299]) && MoveContact
trigger3 = (StateNo = [400, 499]) && MoveContact
;---------------------------------------------------------------------------
[State -1, Rocket Punch]
type = ChangeState
value = 1000
triggerall = PalNo != 12
triggerall = Command = "qcfa" || Command = "qcfb" || Command = "qcfc"
triggerall = RoundState = 2 && StateType != A && !NumHelper(1000)
triggerall = Var(22) = 0
trigger1 = Ctrl
trigger2 = (StateNo = [200, 299]) && movecontact
trigger3 = (StateNo = [400, 499]) && movecontact
;---------------------------------------------------------------------------
[State -1, Rocket Punch (Air)]
type = ChangeState
value = 1005
triggerall = PalNo != 12
triggerall = Var(21) > 30
triggerall = Command = "qcfa" || Command = "qcfb" || Command = "qcfc"
triggerall = Roundstate = 2 && (!NumHelper(1000) || Var(22))
trigger1 = Ctrl && Statetype = A 
trigger2 = (StateNo = [600, 699]) && MoveContact
;---------------------------------------------------------------------------
[State -1, Area Bomb]
type = ChangeState
value = 1020
triggerall = PalNo != 12
triggerall = Command = "qcba" || Command = "qcbb" || Command = "qcbc" 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (StateNo = [200, 210]) && movecontact && AnimTime < 10
trigger3 = (stateno = [400, 499]) && movecontact

;===========================================================================
; Throws, Rolls, Etc
;===========================================================================


[State -1, Robo Launcher]
type = ChangeState
value = 1030
triggerall = Command = "qcba" || Command = "qcbb" || Command = "qcbc" 
triggerall = Var(21) >= 50
triggerall = Power >= 500
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (StateNo = [600, 699]) && MoveContact
;---------------------------------------------------------------------------
[State -1, Robo Toss]
type = ChangeState
triggerall = PalNo != 12 
trigger1 = (command = "recovery" || command = "2p") && (command = "holdfwd" || command = "holdback")
trigger1 = roundstate = 2 && ctrl && statetype = S && stateno != 100
value = 800

;Flight
[State -1, Flight]
type = ChangeState
value = 10050
triggerall = PalNo = 12 
triggerall = Command = "qcbx"
triggerall = Var(24) >= 0
trigger1 = ctrl
trigger2 = (StateNo = [10200, 10499]) || (StateNo = [10600, 10699])
trigger2 = StateNo != 10230
ignorehitpause = 1


;===========================================================================
; Electrocute Activation
;===========================================================================


;Air Dash
[State -1, Air Dash]
type = ChangeState
value = 10100
triggerall = PalNo = 12 
triggerall = statetype = A
triggerall = ctrl || StateNo = [10600, 10699]
triggerall = !Var(25) || Var(21) > 0
trigger1 = command = "dashFF"
trigger2 = command = "dashDD"
trigger3 = command = "dashUU"
trigger4 = command = "dashBB"
trigger5 = command = "dashDBDB"
trigger6 = command = "dashDFDF"
trigger7 = command = "dashUFUF"
trigger8 = command = "dashUBUB"

[State -1, Electrocute]
type = ChangeState
value = 2100
triggerall = PalNo != 12 
triggerall = Command = "a+c" && !(command = "holdfwd" || command = "holdback")
triggerall = Var(22) = 0
triggerall = Power >= 3000
trigger1 = StateType != A
trigger1 = ctrl 


;Dash
[State -1, Dash]
type = ChangeState
value = 100
triggerall = PalNo = 12 
triggerall = Command = "2p" && Command != "holddown" && Command != "holdback"
triggerall = statetype != A
trigger1 = ctrl

;Back Hop
[State -1, Dash]
type = ChangeState
value = 105
triggerall = PalNo = 12 
triggerall = Command = "2p" && Command != "holddown" && Command = "holdback"
triggerall = statetype != A
trigger1 = ctrl



;===========================================================================
; EX Normal Moves
;===========================================================================
[State -1, Stand Light]
type = ChangeState
value = 10200
triggerall = PalNo = 12
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 10200 && MoveContact && PrevStateNo != 10200

[State -1, Stand Mid]
type = ChangeState
value = 10210
triggerall = PalNo = 12
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 10400
trigger2 = MoveContact
trigger3 = StateNo = 10200
trigger3 = MoveContact
ignorehitpause = 1

[State -1, Stand Heavy]
type = ChangeState
value = 10220
triggerall = PalNo = 12
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = [10200, 10210] 
trigger2 = MoveContact
trigger3 = StateNo = [10400, 10410] 
trigger3 = MoveContact
ignorehitpause = 1

[State -1, Stand Launcher]
type = ChangeState
value = 10230
triggerall = PalNo = 12
triggerall = command = "x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = [10200, 10499]
trigger2 = StateNo != 10230
trigger2 = MoveContact
ignorehitpause = 1

[State -1, Crouch Light]
type = ChangeState
value = 10400
triggerall = PalNo = 12
triggerall = command = "a"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 10400 && MoveContact && PrevStateNo != 10400
trigger3 = StateNo = 10200 && MoveContact 
ignorehitpause = 1

[State -1, Crouch Mid]
type = ChangeState
value = 10410
triggerall = PalNo = 12
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (StateNo = [10200, 10210]) && MoveContact
trigger3 = StateNo = 10400 && MoveContact
ignorehitpause = 1

[State -1, Crouch Heavy]
type = ChangeState
value = 10420
triggerall = PalNo = 12
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (StateNo = [10200, 10220]) && MoveContact
trigger3 = (StateNo = [10400, 10410]) && MoveContact
ignorehitpause = 1

;---------------------------------------------------------------------------
;Jump Light
[State -1, Jump Light]
type = ChangeState
value = 10600
triggerall = PalNo = 12
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = StateNo = 10600 && MoveContact && PrevStateNo != 10600
ignorehitpause = 1

;---------------------------------------------------------------------------
;Jump Mid
[State -1, Jump Mid]
type = ChangeState
value = 10610
triggerall = PalNo = 12
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 10600
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = StateNo = 10610 && MoveContact && PrevStateNo != 10610
ignorehitpause = 1

;---------------------------------------------------------------------------
;Jump Heavy
[State -1, Jump Heavy]
type = ChangeState
value = 10620
triggerall = PalNo = 12
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [10600, 10610]
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = StateNo = 10610 && MoveContact
ignorehitpause = 1

[State -1, Air Knockdown]
type = ChangeState
value = 10630
triggerall = PalNo = 12
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = StateNo = [10600, 10699]
trigger2 = StateNo != 10630
trigger2 = MoveContact
ignorehitpause = 1

;===========================================================================
; Normal Moves
;===========================================================================
[State -1, Stand Light]
type = ChangeState
value = 200
triggerall = PalNo != 12
triggerall = Var(22) = 0
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
[State -1, Stand Mid]
type = ChangeState
value = 210
triggerall = PalNo != 12
triggerall = Var(22) = 0
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) 
trigger2 = movecontact

;---------------------------------------------------------------------------
[State -1, Stand Strong]
type = ChangeState
value = 220
triggerall = PalNo != 12
triggerall = Var(22) = 0
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = PalNo != 12
triggerall = Var(22) = 0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Mid
[State -1, Crouching Mid]
type = ChangeState
value = 410
triggerall = PalNo != 12
triggerall = Var(22) = 0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) 
trigger2 = movecontact

;---------------------------------------------------------------------------
;Crouching Strong
[State -1, Crouching Strong]
type = ChangeState
value = 420
triggerall = PalNo != 12
triggerall = Var(22) = 0
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Light
[State -1, Jump Light]
type = ChangeState
value = 600
triggerall = PalNo != 12
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Mid
[State -1, Jump Mid]
type = ChangeState
value = 610
triggerall = PalNo != 12
triggerall = command = "b"
triggerall = var(21) > 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Strong
[State -1, Jump Strong]
type = ChangeState
value = 620
triggerall = PalNo != 12
triggerall = command = "c"
triggerall = var(21) > 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 610)
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Custom AirJump
[State -1, AirJump :D]
type = ChangeState
value = 7950
triggerall = Command = "holdup" || Command = "holdfwd" || Command = "holdback"
triggerall = ctrl
triggerall = var(21) > 20 || (PalNo = 12 && Var(21) > 0)
trigger1 = (stateno = 50 && (Time > 15 || PalNo = 12))
trigger2 = StateNo = 7950 && Anim = 41 && (Command = "holdfwd" || Command = "holdback")
trigger3 = StateNo = 7950 && Anim = 42 && Command != "holdfwd" && (Command = "holdup" || Command = "holdback")
trigger4 = StateNo = 7950 && Anim = 43 && Command != "holdback" && (Command = "holdup" || Command = "holdfwd")

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 7970
triggerall = PalNo = 12 
trigger1 = Command = "highjump"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = Command = "holdup"
trigger2 = StateNo = 10230
trigger2 = MoveHit
ignorehitpause = 1

