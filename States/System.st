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
;Stand
[Statedef 0]
type = S
physics = S
sprpriority = 0
     
[State 0, 1]
type = ChangeAnim
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = 0
     
[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0
     
[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0: ChangeState]
type = ChangeState
trigger1 = (Var(22) > 0)
value = 45
ctrl = 1


;---------------------------------------------------------------------------
; Stand to Crouch
[Statedef 10]
type    = C
physics = C
anim = 10

[State 10, 1]
type = VelMul
trigger1 = PalNo != 12
trigger1 = Time = 0
x = .75

[State 10, 2] ;Stop moving if low velocity
type = VelSet
trigger1 = abs(vel x) < Const(movement.crouch.friction.threshold)
x = 0

[State 10, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11

;---------------------------------------------------------------------------
; Jump Start
[Statedef 40]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1
facep2 = 1

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y) * IfElse(PalNo = 12, 1.5, 1)

[State 40, 5]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100 ;RUN_FWD
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x) * IfElse(PalNo = 12, 1.5,1)

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

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
trigger1 = Var(22) > 0
y = 0

[State 45, 7]
type = ChangeState
trigger1 = Time >= 2 
value = IfElse(var(21) > 20 && PalNo != 12, 7950, 50)
ctrl = 1


; Jump Up
[Statedef 50]
type = A
physics = A
facep2 = 1


[State 50, 1]
type = VarSet
trigger1 = Time = 0
var(0) = sysvar(1)

[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, Turn]
type = Turn
trigger1 = PalNo = 12 
trigger1 = Var(23) = 0
trigger1 = (ScreenPos X - EnemyNear(IfElse(EnemyNear(0), Alive, 0, 1)), ScreenPos X) * Facing > 0

[State 50, VelAdd]
type = VelAdd
trigger1 = PalNo = 12
trigger1 = (Vel X < 2) && (Var(23) = 1) && (Command = "holdfwd") && (Command != "holdback")
trigger1 = var(0) >= 0 || Vel X < 0
x = .1

[State 50, VelAdd]
type = VelAdd
trigger1 = PalNo = 12
trigger1 = (Vel X > -2) && (Var(23) = 1) && (Command != "holdfwd") && (Command = "holdback")
trigger1 = var(0) <= 0 || Vel X > 0
x = -.1

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43))

[State 50, 3]
type = ChangeAnim
trigger1 = Anim = [41,43]
trigger1 = AnimTime = 0
;trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3

;---------------------------------------------------------------------------
; Run/dash forward
[Statedef 100]
type    = S
physics = S
anim = 100 + 10000*(PalNo = 12)
sprpriority = 1

[State 100, type]
type = StateTypeSet
trigger1 = PalNo = 12
physics = N

[State 7950,2]
type = Explod
triggerall = PalNo = 12
trigger1 = !NumExplod(7950)
anim = 7041
ID = 7950
pos = -7, -17
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

[State 100, 1]
type = VelSet
trigger1 = PalNo != 12 || (!Time)
x = const(velocity.run.fwd.x) * IfElse(PalNo = 12, 3, 1)


[State 100, 1]
type = VelMul
trigger1 = PalNo = 12
trigger1 = Time = [2, 15]
x = 0.9

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 100, 4]
type = ChangeState
trigger1 = command != "holdfwd" && PalNo != 12
value = 0

[State 100, 4]
type = ChangeState
trigger1 = !AnimTime && PalNo = 12
value = 106

[State 100, 4]
type = CtrlSet
trigger1 = PalNo = 12
value = Time > 8

[State 100, 4]
type = ChangeState
trigger1 = Ctrl
trigger1 = Command = "holddown" && PalNo = 12
value = 10


[State 100, 4]
type = ChangeState
trigger1 = Ctrl
trigger1 = Command = "holdup" && PalNo = 12
value = 40


;---------------------------------------------------------------------------
; Hop backwards
[Statedef 105]
type    = A
physics = A
ctrl = 0
anim = 105
sprpriority = 1

[State 105, 1]
type = StateTypeSet
trigger1 = Time = 0
trigger1 = PalNo = 12
physics = N
statetype = S

[State 105, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = PalNo = 12
x = const(velocity.run.back.x) * 1.5

[State 105, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = PalNo != 12
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, 2]
type = CtrlSet
trigger1 = PalNo = 12
trigger1 = Time = 12
value = 1

[State 105, 3]
type = ChangeState
trigger1 = PalNo = 12
trigger1 = Time = 12
value = 106

[State 105, 3]
type = ChangeState
trigger1 = PalNo != 12
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 106


[State 7950,2]
type = Explod
triggerall = PalNo = 12
trigger1 = !NumExplod(7950)
anim = 7042
ID = 7950
pos = 5, -7
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
trigger1 = PalNo = 12
trigger1 = !NumExplod(7951)
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

;---------------------------------------------------------------------------
; Modified Airjump, R.O.B. Style
[Statedef 7950]
type    = A
physics = A
facep2 = 1

[State 45, 1]
type = StateTypeSet
triggerall = !Time
trigger1 = Var(22) > 0
trigger2 = Var(21) > 0 && PalNo = 12
physics = N

[State 45, 1]
type = StateTypeSet
trigger1 = Var(22) = 0
trigger1 = PalNo != 12
physics = A

[State 45, 1]
type = PlaySnd
triggerall = !Time
trigger1 = var(21) > 20
trigger2 = PalNo = 12
value = S1,0
channel = 0
volumescale = 10

[State 7950, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 7950, 2]
type = ChangeAnim
trigger1 = Anim != 41
trigger1 = Command != "holdfwd" && Command != "holdback"
value = 41

[State 7950, 2]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Anim != 42
trigger1 = Command = "holdfwd" && Command != "holdback"
value = 42

[State 7950, 2]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Anim != 43
trigger1 = Command = "holdback" && Command != "holdfwd"
value = 43

[State 7950, Hold]
type = VelSet
triggerall = Var(22) = 0
triggerall = var(21) > 20
triggerall = !Time && PalNo != 12
trigger1 = Vel Y > -Const(velocity.airjump.y)
y = -Const(velocity.airjump.y)

[State 7950, Hold]
type = VelSet
triggerall = Var(22) > 0 || PalNo = 12
trigger1 = Command = "holdup"
y = -3.6

[State 7950, Hold]
type = VelSet
triggerall = Var(22) > 0 || PalNo = 12
trigger1 = Command = "holddown"
y = 3.6

[State 7950, Hold]
type = VelSet
triggerall = Var(22) > 0 || PalNo = 12
trigger1 = Command != "holdup"
trigger1 = Command != "holddown"
y = 0

[State 7950, Hold]
type = VelAdd
triggerall = Var(22) = 0 && PalNo != 12
triggerall = var(21) > 20
trigger1 = Vel Y > Const(velocity.airjump.y)*0.7
trigger1 = Command = "holdup"
y = -.6

[State 7950, Hold]
type = VelAdd
triggerall = var(21) > 20
triggerall = Var(22) = 0 && PalNo != 12
triggerall = Command != "holdup"
trigger1 = Anim = 43 && Command = "holdback"
trigger2 = Anim = 42 && Command = "holdfwd"
Y = IfElse(Abs(Vel Y) < .6, -Vel Y, IfElse(Vel Y > 0, -.6, .6))

[State 7950, Hold]
type = VelAdd
triggerall = var(21) > 20 || PalNo = 12
trigger1 = Vel X < Const(velocity.airjump.fwd.x) * 1.5
trigger1 = Anim = 42 && Command = "holdfwd"
x = .7 

[State 7950, Hold]
type = VelAdd
triggerall = var(21) > 20 || PalNo = 12
trigger1 = Vel X > Const(velocity.airjump.back.x) * 1.5
trigger1 = Anim = 43 && Command = "holdback"
x = -.7

[State 7950, Hold]
type = VelSet
triggerall = Var(22) > 0 && PalNo != 12
trigger1 = Command != "holdfwd" && Command != "holdback"
X = 0


[State 7950, Hold]
type = VelMul
triggerall = PalNo = 12
trigger1 = Command != "holdfwd" && Command != "holdback"
X = 0.9

[State 7950,2]
type = Explod
triggerall = var(21) > 20 || PalNo = 12
triggerall = !NumExplod(7950)
trigger1 = Anim = 43 && Command = "holdback"
trigger2 = Anim = 42 && Command = "holdfwd"
trigger3 = Command = "holdup"
trigger4 = (Var(22) > 0 || PalNo = 12) && Command != "holdback" && Command != "holdfwd" && Command != "holdback"
anim = IfElse(Anim = 41, 7043, IfElse(Anim = 42, 7041, 7042))
ID = 7950
pos = IfElse(Anim = 41, 0, IfElse(Anim = 42, -7, 5)), IfElse(Anim = 41, -8, IfElse(Anim = 42, -17, -7))
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
triggerall = var(21) > 20 || PalNo = 12
triggerall = !NumExplod(7951)
triggerall = Anim = 43 
trigger1 = Command = "holdback"
trigger2 = Var(22) > 0 || PalNo = 12
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
triggerall = var(21) > 0 && PalNo != 12
trigger1 = Anim = 43 && Command = "holdback"
trigger2 = Anim = 42 && Command = "holdfwd"
trigger3 = Command = "holdup"
var(21) = -2


[State 7950, Fuel]
type = VarAdd
trigger1 = PalNo = 12
trigger1 = var(21) >= 0
var(21) = -1

[State 600, 2]
type = PosSet
trigger1 = Var(22) > 0 || PalNo = 12
trigger1 = Pos Y > -Vel Y && Vel Y > 0
Y = 0
ignorehitpause = 1


[State 600, 2]
type = ChangeState
trigger1 = PalNo = 12 && Var(21) < 0
value = 50
ignorehitpause = 1


;Super Armor State
[Statedef 7960]
velset = 0,0
Movetype = H

[State 999, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1
ignorehitpause = 1

[State 999, 0]
type = AssertSpecial
ignorehitpause=1
trigger1 = 1
flag = NoStandGuard
flag2 = NoCrouchGuard
flag3 = NoAirGuard

[State 899, NotHitBy]
type = NotHitBy 
trigger1 = !time
value = SCA, AA, AP
time = 100
ignorehitpause=1

[State 999, HitOver]
type = NotHitBy
trigger1= 1
time = 1
value= , AT
ignorehitpause=1

[State 999, HitOver]
type = HitOverride
trigger1= 1
time = 1
attr = SCA, AA, AP
stateno = 7960
ignorehitpause = 1

[State 999, LifeAdd]
type = LifeAdd
trigger1 = Time = 0
value = - floor(gethitvar(damage))
ignorehitpause = 1

[State 999, ChangeAnim]
type = ChangeAnim
trigger1 = Time < floor(gethitvar(hittime) * 0.35)
value = Anim
elem = AnimElemNo(0)
ignorehitpause = 1

[State 999, End]
type = ChangeState
trigger1 = Time >= floor(gethitvar(hittime) * 0.35)
value = Var(23)
ignorehitpause = 1


; Super Jump
[Statedef 7970]
type = A
physics = S
ctrl = 0
anim = 40

[State 7970, VarSet]
type = VarSet
trigger1 = Time = 0
var(23) = 1

[State 7970, VelSet]
type = VelSet
trigger1 = AnimTime = 0
x = 0
y = -9.5

[State 9000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1


; Initialize (at the start of the round)
[Statedef 5900]
type = S

[State 5900, 1] ;Clear all int variables
type = VarRangeSet
trigger1 = roundsexisted = 0
value = 0

[State 5900, 2] ;Clear all float variables
type = VarRangeSet
trigger1 = roundsexisted = 0
fvalue = 0

[State 5900, 3] ;Change palette
type = RemapPal
trigger1 = 1
source = 1,1
dest = 1,palno


[State 5900, 3] ;Change palette
type = RemapPal
trigger1 = PalNo = 12
source = 2,4
dest = 2,13

[State 5900, 4] ;Intro for round 1
type = ChangeState
trigger1 = roundno = 1
value = 190

[State 5900, 5] ;All other rounds
type = ChangeState
trigger1 = 1
value = 0

; Fly
[Statedef 10050]
anim = 10050
movetype = I
type = A
physics = N

[State 10050, Var]
type = VelMul
trigger1 = !Time
X = 0.5

[State 10050, Var]
type = VarSet
trigger1 = !Time
trigger1 = Var(21) >= 0
v = 21
value = IfElse(Var(21) > 0, 0,  108)


[State 10050, Var]
type = ChangeState
trigger1 = !AnimTime || !Var(21)
value = 7950

