; UniBeam
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
type = ChangeAnim
trigger1 = !Time
value = 11000 + var(0)


[State 13801, Masa & Mune]
type = helper
triggerall = !NumHelper(11000)
trigger1 = AnimElem = 2
stateno = 11010
ID = 11000
name = "Beam"
postype = p1
pos = 18,-15
ownpal = 1
pausemovetime = 99999999
persistent = 0

[State 803, Safety]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(StateType = S, 0, 7950)
ctrl = 1

;UniBeam 
[Statedef 11010]
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 11010 + Root, Var(0)
sprpriority = 3
poweradd = 0
velset = 0, 0

[State 1000, Strength]
type = VarSet
trigger1 = !Time
var(0) = Root, Var(0)

[State 2203, Start]
trigger1 = 1
type = AngleDraw
scale = 0.5, 0.5

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
trigger1 = animelem = 5 || animelem = 9 
trigger2 = animelem = 13 || animelem = 17 || animelem = 21
trigger3 = (animelem = 22 || animelem = 23 || animelem = 24) && Var(0) > 0
trigger4 = (animelem = 25 || animelem = 26) && Var(0) = 2
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
ground.hittime = IfElse(var(0) = 0, 15, IfElse(var(0) = 1, 21, 22))
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

;Beam Head
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
var(1) = IfElse(Root, Var(0) = 0, 15, IfElse(Root, Var(0) = 1, 12, 10))

[State 2203, Beam Velocity]
trigger1 = AnimElem = 2
type = varset
var(1) = 0

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
trigger1 = 1
ignorehitpause = 1
X = IfElse(AnimElemTime(0) < 2, Var(1), 0)

[State 2203, ExplodScale]
type = ModifyExplod
trigger1 = 1
ID = 11000
postype = p1
scale = 0.1 + Abs(ParentDist X - Vel X)/16.0, 0.5
pos = Floor((ParentDist X - Vel X)/2.0) , 0
bindtime = 1
ignorehitpause = 1

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
