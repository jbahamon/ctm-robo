;Proton Cannon
[Statedef 12100]
type    = S
movetype= A
physics = N
juggle  = 0
ctrl = 0
anim = 12100
sprpriority = 1
poweradd = 0
facep2 = 1
velset = 0,0

[State 220, 2]
type = HitDef
trigger1 = Animelem = 2
attr = S, HA
animtype  = Hard
damage    = 13
hitflag = MAF
guardflag = MA
pausetime = 16,16
sparkno = S7000
sparkxy = -10, -20
hitsound   = S0,2
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 24
air.hittime  = 24
yaccel = 0.1
ground.velocity = 0, -1
air.velocity = 0,-1
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16
fall = 1
ground.cornerpush.veloff = -3;
air.cornerpush.veloff = -3;

[State 2200, Super Pause FX]
type = helper
trigger1 = AnimElemtime(3) = 10
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2200, Super Pause]
type = SuperPause
trigger1 = AnimElemtime(3) = 10
time = 45
movetime = 0
anim = -1
sound = S1,1;S a7,2
p2defmul = 1
poweradd = -3000
darken = 0

[State 2020, Super Pause FX]
type = Helper
trigger1 = Animelem = 2
stateno = 12101 
ID = 12100
name = "Proton Cannon"
postype = p1
pos = 0,-30
ownpal = 1
persistent = 0
supermovetime = 999

[State 2202, Shake]
type = EnvShake
trigger1 = Anim = 12100 && AnimElem = 5
time = 80
freq = 120
ampl = 2
persistent = 0

[State 2202, Stop]
type = VelSet
trigger1 = NumHelper(12100)
X = 0

[State 2200, End]
type = ChangeState
trigger1 = Anim = 12100 && AnimElemNo(0) >= 3 && !NumHelper(12100)
value = 0
ctrl = 1

; The Cannon
[Statedef 12101]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 7300
sprpriority = -1
poweradd = 0
velset = 0, 0

[State 2201, var]
type = VarSet
trigger1 = !Time
fvar(39) = 1

[State 2201, var]
type = ParentVarSet
trigger1 = 1
fvar(39) = fvar(39)

[State 2201, Trans]
type = trans
trigger1 = Time = [0, 25]
trans = addalpha
alpha = 10 * Time, 256 - 10 * Time
ignorehitpause = 1

[State 2201, Vel]
type = Offset
trigger1 = Time < 10
X = 0
Y = - 30 + 3*(Time)
ignorehitpause = 1

[State 2201, Vel]
type = VelSet
trigger1 = Parent, ScreenPos Y - ScreenPos Y < 30
Y = 0
ignorehitpause = 1

[State 2201, Vel]
type = PosSet
trigger1 = 1
X = Parent, Pos X
Y = Parent, Pos Y - 30
ignorehitpause = 1

[State 2201, Fire]
type = ChangeAnim
trigger1 = Parent, StateNo = 12100
trigger1 = Parent, Anim = 12100
trigger1 = Parent, AnimElemTime(5) = -6
value = 12108
persistent = 0

[State 2201, Fire]
type = Helper
trigger1 = Anim = 12108
stateno = 12102
ID = 12101
name = "Prometheus Beam Base"
postype = p1
pos = 30,0
ownpal = 1
persistent = 0
;supermovetime = 9999

[State 2201, Trans]
type = trans
trigger1 = Anim = 12108
trigger1 = AnimElemNo(0) = 2
trans = addalpha
alpha = 256 - 16 * AnimElemTime(2), 16 * AnimElemTime(2)
ignorehitpause = 1

[State 2201, End]
type = DestroySelf
trigger1 = (Anim = 12108 && !AnimTime) || Parent, StateNo != 12100
ignorehitpause = 1

;Prometheus Beam
[Statedef 12102]
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 12105
sprpriority = 3
poweradd = 0
velset = 0, 0

[State 801, Priority]
type = PlaySnd
trigger1 = !Time
value = S6,0
channel = 0

[State 801, Priority]
type = PlaySnd
trigger1 = MoveHit
value = S2,2
persistent = 0


[State 200, Dampen]
Type=Varset
trigger1 = !PrevStateNo
trigger1 = !Time
v = 1
value = 0
ignorehitpause = 1

[State 3055, Hit]
type = VarAdd
triggerall = Var(1) < (35/2)
trigger1 = Root, Command = "a"
trigger2 = Root, Command = "b"
trigger3 = Root, Command = "c"
v = 1
value = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
triggerall = AnimElemNo(0) = 4
triggerall = AnimElemTime(4) < 105
trigger1 = (AnimElemTime(4) % 3) = 1
attr = S, HP
damage = Ceil(IfElse(GameTime % 2, 8, 7)*Root, Fvar(39)), 1
animtype = Hard
hitsound = -1
fall.animtype = Hard
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -2
air.velocity = -2, -.5
down.velocity = -2, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1
ignorehitpause = 1


[State 3055, Hit]
type = hitdef
triggerall = AnimElemNo(0) = 4
triggerall = AnimElemTime(4) < 105
trigger1 = (AnimElemTime(4) % 3) = 2
trigger1 = (2*var(1)) > Ceil(AnimElemTime(4)/3.0)
attr = S, HP 
damage = Ceil(Root, FVar(39) * IfElse(GameTime % 2, 1, 2)), 0
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -2
air.velocity = -2, -.5
down.velocity = -2, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1
ignorehitpause = 1

[State 2201, Vel]
type = PosSet
trigger1 = 1
X = Parent, Pos X + 30 * Facing
Y = Parent, Pos Y
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
var(0) = Parent, ID

[State 2202, Beam Head]
type = helper
trigger1 = !Time
stateno = 12103
ID = 12102
name = "Prometheus Beam Head"
postype = p1
pos = 350,0
ownpal = 1
persistent = 0

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 =  !AnimTime || !PlayerIDExist(var(0)) || Parent, StateNo != 12101

;Beam Head
[Statedef 12103]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 12107
sprpriority = 3
poweradd = 0
velset = 0, 0

[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2203, Explod]
type = Explod
trigger1 = !Time
anim = 12106
ID = 12103
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

[State 2203, ExplodScale]
type = ModifyExplod
trigger1 = 1
ID = 12103
postype = p1
scale = 0.1 + Abs(ParentDist X)/16.0, 1 
pos = Floor((ParentDist X)/2.0) , 0
bindtime = 1
ignorehitpause = 1


[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, RemoveExplod]
type = RemoveExplod
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 12102 || !AnimTime
ID = 12103

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 12102 || !AnimTime

;Angled Proton Cannon
[Statedef 12200]
type    = S
movetype= A
physics = N
juggle  = 0
ctrl = 0
anim = 12100
sprpriority = 1
poweradd = 0
facep2 = 1
velset = 0,0

[State 220, 2]
type = HitDef
trigger1 = Animelem = 2
attr = S, HA
animtype  = Hard
damage    = 13
hitflag = MAF
guardflag = MA
pausetime = 16,16
sparkno = S7000
sparkxy = -10, -20
hitsound   = S0,2
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 24
air.hittime  = 24
yaccel = 0.1
ground.velocity = 0, -1
air.velocity = 0,-1
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16
fall = 1
ground.cornerpush.veloff = -3;
air.cornerpush.veloff = -3;

[State 2200, Super Pause FX]
type = helper
trigger1 = AnimElemtime(3) = 10
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2200, Super Pause]
type = SuperPause
trigger1 = AnimElemtime(3) = 10
time = 45
movetime = 0
anim = -1
sound = S1,1;S a7,2
p2defmul = 1
poweradd = -3000
darken = 0

[State 2020, Super Pause FX]
type = Helper
trigger1 = Animelem = 2
stateno = 12201 
ID = 12200
name = "Proton Cannon"
postype = p1
pos = 0,-30
ownpal = 1
persistent = 0
supermovetime = 999

[State 2202, Shake]
type = EnvShake
trigger1 = Anim = 12100 && AnimElem = 5
time = 80
freq = 120
ampl = 2
persistent = 0

[State 2202, Stop]
type = VelSet
trigger1 = NumHelper(12200)
X = 0

[State 2200, End]
type = ChangeState
trigger1 = Anim = 12100 && AnimElemNo(0) >= 3 && !NumHelper(12200)
value = 0
ctrl = 1

; The Cannon
[Statedef 12201]
type    = A
movetype= A
physics = N
ctrl = 0
anim = 7300
sprpriority = -1
poweradd = 0
velset = 0, 0

[State 2201, var]
type = AngleDraw
trigger1 = 1
value = 30

[State 2201, var]
type = VarSet
trigger1 = !Time
fvar(39) = 1

[State 2201, var]
type = ParentVarSet
trigger1 = 1
fvar(39) = fvar(39)

[State 2201, Trans]
type = trans
trigger1 = Time = [0, 25]
trans = addalpha
alpha = 10 * Time, 256 - 10 * Time
ignorehitpause = 1

[State 2201, Vel]
type = Offset
trigger1 = Time < 10
X = 0
Y = - 30 + 3*(Time)
ignorehitpause = 1

[State 2201, Vel]
type = PosSet
trigger1 = 1
X = Parent, Pos X
Y = Parent, Pos Y - 40
ignorehitpause = 1

[State 2201, Fire]
type = ChangeAnim
trigger1 = Parent, StateNo = 12200
trigger1 = Parent, Anim = 12100
trigger1 = Parent, AnimElemTime(5) = -6
value = 12108
persistent = 0

[State 2201, Fire]
type = Helper
trigger1 = Anim = 12108
stateno = 12202
ID = 12101
name = "Prometheus Beam Base"
postype = p1
pos = 26,-15
ownpal = 1
persistent = 0
;supermovetime = 9999

[State 2201, Trans]
type = trans
trigger1 = Anim = 12108
trigger1 = AnimElemNo(0) = 2
trans = addalpha
alpha = 256 - 16 * AnimElemTime(2), 16 * AnimElemTime(2)
ignorehitpause = 1

[State 2201, End]
type = DestroySelf
trigger1 = (Anim = 12108 && !AnimTime) || Parent, StateNo != 12200
ignorehitpause = 1

;Prometheus Beam
[Statedef 12202]
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 12105
sprpriority = 3
poweradd = 0
velset = 0, 0


[State 2201, var]
type = AngleDraw
trigger1 = 1
value = 30

[State 801, Priority]
type = PlaySnd
trigger1 = !Time
value = S6,0
channel = 0

[State 801, Priority]
type = PlaySnd
trigger1 = MoveHit
value = S2,2
persistent = 0


[State 200, Dampen]
Type=Varset
trigger1 = !PrevStateNo
trigger1 = !Time
v = 1
value = 0
ignorehitpause = 1

[State 3055, Hit]
type = VarAdd
triggerall = Var(1) < (35/2)
trigger1 = Root, Command = "a"
trigger2 = Root, Command = "b"
trigger3 = Root, Command = "c"
v = 1
value = 1
ignorehitpause = 1

[State 3055, Hit]
type = hitdef
triggerall = AnimElemNo(0) = 4
triggerall = AnimElemTime(4) < 105
trigger1 = (AnimElemTime(4) % 3) = 1
attr = S, HP
damage = Ceil(IfElse(GameTime % 2, 8, 7)*Root, Fvar(39)), 1
animtype = Hard
hitsound = -1
fall.animtype = Hard
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -2
air.velocity = -2, -.5
down.velocity = -2, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1
ignorehitpause = 1


[State 3055, Hit]
type = hitdef
triggerall = AnimElemNo(0) = 4
triggerall = AnimElemTime(4) < 105
trigger1 = (AnimElemTime(4) % 3) = 2
trigger1 = (2*var(1)) > Ceil(AnimElemTime(4)/3.0)
attr = S, HP 
damage = Ceil(Root, FVar(39) * IfElse(GameTime % 2, 1, 2)), 0
animtype = Hard
fall.animtype = Hard
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 2
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -2
air.velocity = -2, -.5
down.velocity = -2, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1
ignorehitpause = 1

[State 2201, Vel]
type = PosSet
trigger1 = 1
X = Parent, Pos X + 26 * Facing
Y = Parent, Pos Y - 15
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
var(0) = Parent, ID

[State 2202, Beam Head]
type = helper
trigger1 = !Time
stateno = 12203
ID = 12102
name = "Prometheus Beam Head"
postype = p1
pos = 350,0
ownpal = 1
persistent = 0

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 =  !AnimTime || !PlayerIDExist(var(0)) || Parent, StateNo != 12201

;Beam Head
[Statedef 12203]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 12107
sprpriority = 3
poweradd = 0
velset = 0, 0


[State 2201, var]
type = AngleDraw
trigger1 = 1
value = 30

[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2203, Explod]
type = Explod
trigger1 = !Time
anim = 12106
ID = 12103
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

[State 2203, ExplodScale]
type = ModifyExplod
trigger1 = 1
ID = 12103
postype = p1
scale = 0.1 + Abs(ParentDist X)/16.0, 1 
pos = Floor((ParentDist X)/2.0) , 0
bindtime = 1
ignorehitpause = 1


[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, RemoveExplod]
type = RemoveExplod
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 12202 || !AnimTime
ID = 12103

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 12202 || !AnimTime
