; Lose by Time Over
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; Win state decider
; CNS difficulty: basic
[Statedef 180]
type = S

[State 180, winquote]
type = VictoryQuote
trigger1 = !Time
value = (Random % 5) + 1

[State 181, Lavos]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Inner Lavos")
trigger2 = (Enemy, Name = "Lavos Core")
trigger3 = (Enemy, Name = "Lavos")
value = 6

[State 180, Frog]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Frog") || (Enemy, Name = "Glenn")
value = 7

[State 180, Lucca]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Lucca")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
value = 8

[State 180, Crono]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Crono")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
value = 9

[State 180, Marle]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Marle 2")
trigger1 = (Enemy, AuthorName = "Kyo Kusanagi")
value = 10

[State 181, Ayla]
type = VictoryQuote
triggerall = numenemy 
trigger1 = (Enemy, Name = "Ayla")
value = 11

[State 180, 1]
type = ChangeState
trigger1 = prevstateno = 300
value = 300

[State 180, 1]
type = ChangeState
trigger1 = !Time
value = 181

;---------------------------------------------------------------------------
; Win pose 1 
; CNS difficulty: basic
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------

;Preintro
[Statedef 190]
type=S
ctrl=0
velset=0,0

[State 190, 0]
type = ChangeState
trigger1 = Time
value = 191 ;+ (Random % 2)
ctrl = 0


; Off-On Intro
[Statedef 191]
type = S
ctrl = 0
anim = 191
velset = 0,0

[State 193, 2] ;Assert this until you want "round 1, fight" to begin
type = PlaySnd
trigger1 = !Time
value = S7,1
channel = 0

[State 193, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 192, 3] ;Change to stand state when done
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; Taunt
; CNS difficulty: easy
[Statedef 195]
type = S
ctrl = 0
anim = 195
velset = 0,0
movetype = I
physics = S
sprpriority = 1

[State 195, 1]
type = PlaySnd
trigger1 = Time % 15 = 0
trigger1 = Time < 60
value = S0,1

[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;===========================================================================
; WinPoses
;===========================================================================

;===========================================================================
; Other States
;===========================================================================

;---------------------------------------------------------------------------
; Override common states (use same number to override) :
;---------------------------------------------------------------------------

; AirJump Start
[Statedef 45]
type    = A
physics = N
ctrl = 0
velset = 0,0

[State 45, 1]
type = ChangeAnim
trigger1 = SelfAnimExist(44)
value = 44

[State 45, 2]
type = ChangeAnim
trigger1 = !SelfAnimExist(44)
value = 41

[State 45, 3]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 45, 4]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 45, 5]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 45, 6]
type = VelSet
trigger1 = Time = 2
x = ifelse(sysvar(1)=0, const(velocity.airjump.neu.x), ifelse(sysvar(1)=1, const(velocity.airjump.fwd.x), const(velocity.airjump.back.x)))
y = const(velocity.airjump.y)

[State 45, 7]
type = ChangeState
trigger1 = Time = 2 && var(21) > 10
value = 7950
ctrl = 1

;---------------------------------------------------------------------------
; Modified Airjump, R.O.B. Style
;---------------------------------------------------------------------------
[Statedef 7950]
type    = A
physics = A


[State 45, 1]
type = PlaySnd
trigger1 = !Time
trigger1 = PrevStateNo !=7950
trigger1 = var(21) > 10
value = S1,0
channel = 0
volumescale = 30

[State 7950, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 7950, 2]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Command != "holdfwd" && Command != "holdback"
value = 41

[State 7950, 2]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Command = "holdfwd" && Command != "holdback"
value = 42

[State 7950, 2]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Command = "holdback" && Command != "holdfwd"
value = 43


[State 7950, Zwoom]
type = VelSet
trigger1 = Time = 0
trigger1 = PrevStateNo != 7950
trigger1 = var(21) > 10
x = 0
y = 0

[State 7950, Hold]
type = VelAdd
triggerall = var(21) > 10
trigger1 = Vel Y > Const(velocity.airjump.y)
trigger1 = Command = "holdup"
y = -.6


[State 7950, Hold]
type = VelAdd
triggerall = var(21) > 10
triggerall = Command != "holdup"
trigger1 = Anim = 43 && Command = "holdback"
trigger2 = Anim = 42 && Command = "holdfwd"
y = IfElse(Abs(Vel Y) < .6, -Vel Y, IfElse(Vel Y > 0, -.6, .6))

[State 7950, Hold]
type = VelAdd
triggerall = var(21) > 10
trigger1 = Vel X < Const(velocity.airjump.fwd.x)*1.5
trigger1 = Anim = 42 && Command = "holdfwd"
x = .7

[State 7950, Hold]
type = VelAdd
triggerall = var(21) > 10
trigger1 = Vel X > Const(velocity.airjump.back.x)*1.5
trigger1 = Anim = 43 && Command = "holdback"
x = -.7

[State 7950,2]
type = Explod
triggerall = var(21) > 10
triggerall = !NumExplod(7950)
trigger1 = Anim = 43 && Command = "holdback"
trigger2 = Anim = 42 && Command = "holdfwd"
trigger3 = Command = "holdup"
anim = IfElse(Anim = 41, 7040, IfElse(Anim = 42, 7041, 7042))
ID = 7950
pos = IfElse(Anim = 41, 5, IfElse(Anim = 42, -7, 5)), IfElse(Anim = 41, 0, IfElse(Anim = 42, -10, -7))
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 7950,2]
type = Explod
trigger1 = var(21) > 10
trigger1 = !NumExplod(7951)
trigger1 = Anim = 43 && Command = "holdback"
anim = 7040
ID = 7951
pos = 0, -5
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 7950, Fuel]
type = VarAdd
triggerall = var(21) > 0
trigger1 = Anim = 43 && Command = "holdback"
trigger2 = Anim = 42 && Command = "holdfwd"
trigger3 = Command = "holdup"
var(21) = -2

[State 7950, 3]
type = ChangeAnim
trigger1 = Vel y > Const720p(-8)
trigger1 = SelfAnimExist(anim + 3)
trigger1 = anim >= 41 && anim <= 43
persistent = 0
value = Anim + 3