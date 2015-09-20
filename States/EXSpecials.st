; Unibeam
[Statedef 11000]
type    = U
movetype= A
physics = U
ctrl = 0
anim = 11000
sprpriority = 0
poweradd = 0

[State 1000, Strength]
type = VelMul
trigger1 = !Time
Y = 0.5
X = 0.5

[State 1000, Strength]
type = VelSet
trigger1 = AnimElem = 2
trigger2 = StateType != A
Y = 0
X = 0

[State 1000, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcfc", 2, ifelse(command = "qcfb", 1, 0))

[State 1000, Strength]
type = StateTypeSet
trigger1 = !Time
trigger1 = StateType = C
statetype = S
physics = S

[State 1000, Strength]
type = StateTypeSet
trigger1 = !Time
trigger1 = StateType = A
physics = N


[State 1000, Strength]
type = PosSet
trigger1 = Pos Y >= -Vel Y
trigger1 = Vel Y >= 0
Y = 0

[State 1000, Strength]
type = VelSet
trigger1 = Pos Y >= -Vel Y
trigger1 = Vel Y >= 0
Y = 0

[State 1000, Strength]
type = ChangeAnim
trigger1 = !Time
value = 11000 + var(0)


[State 13801, Masa & Mune]
type = helper
triggerall = !NumHelper(11000)
trigger1 = AnimElem = 2
stateno = 11010
ID = 11000
name = "Unibeam"
postype = p1
pos = 18,-15
ownpal = 1
persistent = 0

[State 803, Safety]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(StateType = S, 0, 7950)
ctrl = 1

;Unibeam Tail
[Statedef 11010]
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 11010 + Root, Var(0)
sprpriority = 3
poweradd = 0
velset = 0, 0
facep2 = 0

[State 1000, Strength]
type = VarSet
trigger1 = !Time
var(0) = Root, Var(0)

[State 2203, Start]
trigger1 = 1
type = AngleDraw
scale = 0.5, 0.5
ignorehitpause = 1

[State 801, Priority]
type = PlaySnd
trigger1 = !Time
value = S2,0
channel = 0

[State 801, Priority]
type = PlaySnd
trigger1 = MoveHit
value = S2,2
persistent = 0

[State 3055, Hit]
type = hitdef
triggerall = Root, StateType != A
trigger1 = animelem = 4 || animelem = 8
trigger2 = animelem = 12 || (AnimElemTime(12) = 4) || (AnimElemTime(12) = 8)
trigger3 = ((Animelem = 6) || (Animelem = 10) || (AnimElemTime(12) = 6)) && Var(0) > 0
trigger4 = ((AnimElemTime(12) = 12) || (AnimElemTime(12) = 16)) && Var(0) = 2
attr = S, SP
damage = Ceil(IfElse(var(0) = 0, 16.34, IfElse(var(0) = 1, 14.2, 12.9))*Root, Fvar(39)), 7
animtype = Hard
hitsound = -1
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.hittime = IfElse(var(0) = 0, 15, IfElse(var(0) = 1, 19, 20))
guard.hittime = IfElse(var(0) = 0, 0, IfElse(var(0) = 1, 4, 5))
ground.type = Low
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
envshake.time = 12
envshake.freq = 120
envshake.ampl = 2
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -3
air.velocity = -2, -.5
down.velocity = -2, -.5
getpower = 0
givepower = 36, 36
yaccel = 0.5

[State 3055, Hit]
type = hitdef
triggerall = Root, StateType = A
trigger1 = animelem = 4 || animelem = 8
trigger2 = animelem = 12 || (AnimElemTime(12) = 4) || (AnimElemTime(12) = 8)
trigger3 = ((Animelem = 6) || (Animelem = 10) || (AnimElemTime(12) = 6)) && Var(0) > 0
trigger4 = ((AnimElemTime(12) = 12) || (AnimElemTime(12) = 16)) && Var(0) = 2
attr = A, SP
damage = Ceil(IfElse(var(0) = 0, 16.34, IfElse(var(0) = 1, 14.2, 12.9))*Root, Fvar(39)), 7
animtype = Hard
hitsound = -1
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.hittime = IfElse(var(0) = 0, 15, IfElse(var(0) = 1, 19, 20))
guard.hittime = IfElse(var(0) = 0, 0, IfElse(var(0) = 1, 4, 5))
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -3
air.velocity = -2, -.5
down.velocity = -2, -.5
getpower = 0
givepower = 36, 36
yaccel = 0.5
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
envshake.time = 12
envshake.freq = 120
envshake.ampl = 2

[State 2201, Vel]
type = PosSet
trigger1 = 1
X = Parent, Pos X + 15 * Facing
Y = Parent, Pos Y - 21
ignorehitpause = 1

[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(1) = Parent, ID

[State 2202, Beam Head]
type = helper
trigger1 = AnimElem = 4
stateno = 11011
ID = 11011
name = "UniBeam Head"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0


[State 200, Dampen]
Type=ParentVarset
Triggerall = MoveHit
trigger1 =  !AnimTime || !PlayerIDExist(var(1)) || Root, StateNo != 11000
fvar(39) = Parent, fvar(39)*0.9
ignorehitpause = 1

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 =  !AnimTime || !PlayerIDExist(var(1)) || Root, StateNo != 11000

;Unibeam Head
[Statedef 11011]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 11016 + Root, Var(0)
sprpriority = 3
poweradd = 0
velset = 0, 0
facep2 = 0

[State 2203, Start]
trigger1 = 1
type = AngleDraw
scale = 0.5, 0.5

[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2203, Beam Velocity]
trigger1 = !Time
type = varset
var(1) = 35

[State 2203, Explod]
type = Explod
trigger1 = !Time
anim = 11013 + Root, Var(0)
ID = 11000
pos = 0,0
postype = p1;p2,front,back,left,right
facing = 1
bindtime = 0
vfacing = 1
vel = 0,0;Facing * Var(1)/2,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
trans = add
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 2203, Vel]
type = VelSet
trigger1 = Time <= 8
ignorehitpause = 1
X = Var(1)

[State 2203, Vel]
type = VelSet
trigger1 = Time > 8
ignorehitpause = 1
X = 0

[State 2203, ExplodScale]
type = ModifyExplod
trigger1 = 1
ID = 11000
postype = p1
scale = Abs(ParentDist X - Vel X)/16.0, 0.5
pos = Floor((ParentDist X - Vel X)/2.0) , 0
bindtime = 1
ignorehitpause = 1

[State 0, DisplayToClipboard]
type = DisplayToClipboard
trigger1 = 1
text = "scale = %f"
params = (0.05 + Abs(ParentDist X - Vel X)/16.0)

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, RemoveExplod]
type = RemoveExplod
trigger1 = !PlayerIDExist(var(0)) || Root, StateNo != 11000 || !AnimTime
ID = 11000

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Root, StateNo != 11000 || !AnimTime

; Repulsor Blast
[Statedef 11100]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 11100
sprpriority = 0
poweradd = 0
velset = 0,0

[State 1000, Strength]
type = PlayerPush
trigger1 = 1
value = 0

[State 1000, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcbc", 2, ifelse(command = "qcbb", 1, 0))

[State 1000, Strength]
type = ChangeAnim
trigger1 = !Time
value = 11100 + var(0)

[State 13801, Masa & Mune]
type = helper
triggerall = !NumHelper(11100)
trigger1 = AnimElem = 2
stateno = 11110
ID = 11100
name = "Repulsor Blast Generator"
postype = p1
pos = -2, -28
ownpal = 1
persistent = 0

[State 803, Safety]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; Repulsor Blast Generator
[Statedef 11110]
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 11110 + Root, Var(0)
sprpriority = 3
poweradd = 0
velset = 0, 0
facep2 = 0

[State 2203, Start]
trigger1 = 1
type = Trans
trans = add
ignorehitpause = 1

[State 2203, Start]
type = AngleDraw
trigger1 = 1
scale = 0.75 + 0.1*Sin(Time/1.0), 0.75 + 0.1*Sin(Time/1.0)
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(1) = Parent, ID

[State 1000, Strength]
type = VarSet
trigger1 = !Time
var(0) = Root, Var(0)

[State 801, Priority]
type = PlaySnd
trigger1 = !Time
value = S2,0
channel = 0

[State 801, Priority]
type = PlaySnd
trigger1 = MoveHit
value = S2,2
persistent = 0

[State 3055, Hit]
type = hitdef
trigger1 = (Var(0) = [0, 1]) && ( AnimElem = 3 || AnimElem = 5 || AnimElem = 7  || AnimElem = 9 || AnimElem = 11 )
trigger2 = (Var(0) = 2     ) && ( AnimElem = 5 || AnimElem = 8 || AnimElem = 11 || AnimElem = 14 || AnimElem = 17 )
attr = S, SP
damage = Ceil(IfElse(var(0) = 0, 16.34, IfElse(var(0) = 1, 20.46, 24.52))*Root, Fvar(39)), 0
animtype = Hard
hitsound = -1
fall = 1
fall.animtype = Hard
hitflag = MAF
guardflag = MA
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.hittime = IfElse(var(0) = 0, 15, IfElse(var(0) = 1, 19, 20))
guard.hittime = 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = IfElse((Var(0) = 2 && AnimElemNo(0) > 11) || (Var(0) != 2 && AnimElemNo(0) > 8), -2, 2), -2
ground.cornerpush.veloff = 0
air.velocity = IfElse((Var(0) = 2 && AnimElemNo(0) > 11) || (Var(0) != 2 && AnimElemNo(0) > 8), -2, 2)/3.0, -0.6
air.velocity = IfElse((Var(0) = 2 && AnimElemNo(0) > 11) || (Var(0) != 2 && AnimElemNo(0) > 8), -2, 2), -2
down.velocity = IfElse((Var(0) = 2 && AnimElemNo(0) > 11) || (Var(0) != 2 && AnimElemNo(0) > 8), -2, 2), -2
getpower = 0
givepower = 36, 36
yaccel = 0.4
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
envshake.time = 4
envshake.freq = 120
envshake.ampl = 4

[State 2201, Vel]
type = PosSet
trigger1 = 1
X = Parent, Pos X - 2 * Facing
Y = Parent, Pos Y - 28
ignorehitpause = 1

[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(1) = Parent, ID

[State 2203, Total Time]
trigger1 = !Time
type = VarSet
fvar(0) = IfElse(Var(0) = 0, 14, IfElse(Var(0) = 1, 15.43, 16.86))


[State 2202, Beam Head]
type = helper
trigger1 = Time = 1
trigger2 = Time = Floor(1 + 0.5 * FVar(0))
trigger3 = Time = Floor(1 +       FVar(0))
trigger4 = Time = Floor(1 + 1.5 * FVar(0))
stateno = 11115
ID = 11115
name = "Repulsor Blast"
postype = p1
pos = IfElse(Time > 5, -5, 5),0
ownpal = 1

[State 200, Dampen]
Type=ParentVarset
Triggerall = MoveHit
trigger1 =  !AnimTime || !PlayerIDExist(var(1)) || Root, StateNo != 11100
fvar(39) = Parent, fvar(39)*0.9
ignorehitpause = 1

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 =  !AnimTime || !PlayerIDExist(var(1)) || Root, StateNo != 11100

; Repulsor Blast Body
[Statedef 11115]
type    = A
movetype= I
physics = N
juggle  = 3
ctrl = 0
anim = 11114
sprpriority = 3
poweradd = 0
velset = 0, 0
facep2 = 0

[State 2203, Pos]
type = Turn
trigger1 = Facing != Root, Facing
ignorehitpause = 1


[State 2203, Total Time]
trigger1 = !Time
type = VarSet
fvar(3) = IfElse(Parent, Var(0) = 0, 14, IfElse(Parent, Var(0) = 1, 15.43, 16.86))


[State 10621, Angle]
type = VarSet
trigger1 = !Time
v = 0
value = 150

[State 10621, Angle]
type = VarSet
trigger1 = !Time
trigger1 = Parent, Time < Floor(1.5 * FVar(3))
v = 0
value = -150

[State 10621, Angle]
type = VarSet
trigger1 = !Time
trigger1 = Parent, Time < Floor(FVar(3))
v = 0
value = -30

[State 10621, Angle]
type = VarSet
trigger1 = !Time
trigger1 = Parent, Time < Floor(0.5 * FVar(3))
v = 0
value = 30

[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2202, Beam Head]
type = helper
trigger1 = !Time
stateno = 11116
ID = 11116
name = "Repulsor Blast Body"
postype = p1
pos = 0,0
ownpal = 1

[State 2203, Base Vel]
trigger1 = !Time
type = VarSet
fvar(0) = 5 + Parent, Var(0)

[State 2203, Accel]
type = VarSet
trigger1 = !Time
fvar(2) = FVar(0) / FVar(3)

[State 2203, Length]
trigger1 = !Time
type = varset
fvar(1) = 0

[State 2203, Moving]
type = VarAdd
trigger1 = 1
fvar(1) = FVar(0)

[State 2203, Accelerating]
type = VarAdd
trigger1 = 1
fvar(0) = -FVar(2)

[State 2203, Vel]
type = PosSet
trigger1 = 1
ignorehitpause = 1
X = Parent, Pos X + ( FVar(1) * Cos(Var(0) * Pi/180.0) )*Facing
Y = Parent, Pos Y + (-FVar(1) * Sin(Var(0) * Pi/180.0) )

[State 2203, Scale]
type = AngleDraw
trigger1 = 1
value = Var(0)
scale = (FVar(1))/16.0, 0.5 + 0.1*Sin(GameTime/1.0)
ignorehitpause = 1

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 * (GameTime % 3 > 0), 256 
ignorehitpause = 1

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = Root, StateNo != 11100 || Time >= Floor(2 * Fvar(3))

; Repulsor Blast Head
[Statedef 11116]
type    = A
movetype= I
physics = N
juggle  = 0
poweradd= 0
ctrl = 0
velset = 0,0
anim = 11113
sprpriority = 2

[State 2203, Pos]
type = Turn
trigger1 = Facing != Root, Facing
ignorehitpause = 1

[State 2203, Pos]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2203, Pos]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256 * (GameTime % 3 > 0), 256 
ignorehitpause = 1

[State 10621, End]
type = Offset
trigger1 = 1
X = -0.5*Cos(Parent, Var(0) * Pi/180.0) *Facing
Y =  0.5*Sin(Parent, Var(0) * Pi/180.0)

[State 10621, End]
type = AngleDraw
trigger1 = 1
value = Parent, Var(0)
scale = 0.5, 0.5  + 0.1*Sin(GameTime/1.0)

[State 2203, Pos]
type = BindToParent
trigger1 = 1
pos = 0,0
ignorehitpause = 1


[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = Root, StateNo != 11100 || Parent, Time >= (2 * Parent, Fvar(3))