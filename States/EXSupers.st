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

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S11,IfElse(Random % 2, 0, 4)
channel = 0

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

[State 8520, Portrait]
type = Helper
trigger1 = AnimElemtime(3) = 10
stateno = 7001
name = "Super BG"
ID = 7001
sprpriority = -16
postype = back
ownpal = 1
supermovetime = 99999
pausemovetime = 99999

[State 2200, Super Pause]
type = SuperPause
trigger1 = AnimElemtime(3) = 10
time = 45
movetime = 0
anim = -1
sound = S1,1;S a7,2
p2defmul = 1
poweradd = -1000
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

[State 420, 1]
type = PlaySnd
trigger1 = Anim = 12100 && AnimElem = 5
trigger1 = AnimElem = 5
value = S11,3
channel = 0
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

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S11,IfElse(Random % 2, 0, 4)
channel = 0

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
ground.velocity = 0, -3
air.velocity = 0,-3
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

[State 8520, Portrait]
type = Helper
trigger1 = AnimElemtime(3) = 10
stateno = 7001
name = "Super BG"
ID = 7001
sprpriority = -16
postype = back
ownpal = 1
supermovetime = 99999
pausemovetime = 99999

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


[State 420, 1]
type = PlaySnd
trigger1 = Anim = 12100 && AnimElem = 5
trigger1 = AnimElem = 5
value = S11,3
channel = 0
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

;Proton Beam
[Statedef 12202]
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 12109
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
pos = Floor(350*0.866),-Floor(350*0.5)
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

[State 2202, Beam Head]
type = helper
trigger1 = !Time
stateno = 12204
ID = 12104
name = "Prometheus Beam Body"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0

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

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 12202 || !AnimTime

; Beam Body
[Statedef 12204]
movetype = I
type = S
anim = 12106
physics = N
juggle  = 0
ctrl = 0
sprpriority = 1
poweradd = 0
velset = 0,0

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2202, Trans]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2203, ExplodScale]
type = AngleDraw
trigger1 = 1
value = 30
scale = 0.1 + 1.154*Abs(Parent, ParentDist X)/16.0, 1 
ignorehitpause = 1

[State 2203, ExplodScale]
type = BindToParent
trigger1 = 1
pos = Floor((Parent, ParentDist X)/2.0) , Floor((Parent, ParentDist Y)/2.0)
ignorehitpause = 1


[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 12203 || !AnimTime

;Iron Avenger
[Statedef 12300]
type    = S
movetype= A
physics = N
juggle  = 0
ctrl = 0
anim = 12300
sprpriority = 1
poweradd = 0
facep2 = 1
velset = 0,0

[State 2200, Invincibility]
type = NotHitBy
trigger1 = AnimElem = 5
time = 22
value = , AA, AP, AT

[State 7950,2]
type = Explod
trigger1 = Anim = 12300
trigger1 = AnimElemNo(0) = 6
trigger1 = !NumExplod(7950)
anim = 7041
ID = 7950
pos = -4, -14
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

[State 2200, Super Pause FX]
type = helper
trigger1 = AnimElem = 5
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 8520, Portrait]
type = Helper
trigger1 = AnimElem = 5
stateno = 7001
name = "Super BG"
ID = 7001
sprpriority = -16
postype = back
ownpal = 1
supermovetime = 99999
pausemovetime = 99999


[State 2200, Super Pause]
type = SuperPause
trigger1 = AnimElem = 5
time = 45
movetime = 0
anim = -1
sound = -1
p2defmul = 1
poweradd = -3000
darken = 0

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 5
value = S11,1
channel = 0


[State 2200, Invincibility]
type = PlaySnd
trigger1 = AnimElem = 6
value = S0,2
channel = 1

[State 2202, Shake]
type = VelSet
trigger1 = Anim = 12300
trigger1 = AnimElemNo(0) = 6
X = 12.6

[State 1020, Width]
type = PlayerPush
trigger1 = Anim = 12300
trigger1 = AnimElemNo(0) = 6
value = 0
ignorehitpause = 1

[State 3060,Hit]
type = HitDef
trigger1 = time = 1
attr = S,HT
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = S7002,3
p1sprpriority = 1
p2sprpriority = 0
p1facing = 1
p2facing = 1
p1stateno = 12302
p2stateno = 12350
guard.dist = 0
fall = 0
getpower = 0

[State 2020, Fail]
type = ChangeState
trigger1 = !AnimTime && !MoveHit
value = 12301


;Iron Avenger Miss
[Statedef 12301]
type = C
physics = C
movetype = I
anim = 12301
ctrl = 0
sprpriority = 1

[State 2021, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Iron Avenger Success
[Statedef 12302]
type = A
physics = N
movetype = A
anim = 12302
ctrl = 0
sprpriority = 1
velset = 0,0

[State 420, 1]
type = PlaySnd
trigger1 = !Time
value = S11,2
channel = 0

[State 3055, Hit]
type = VarSet
trigger1 = !Time
v = 2
value = 0
ignorehitpause = 1

[State 3055, Hit]
type = VarAdd
triggerall = Var(2) < 30
trigger1 = Command = "a"
trigger2 = Command = "b"
trigger3 = Command = "c"
v = 2
value = 1
ignorehitpause = 1

[State 1031, Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = !Time
value = -80
persistent = 0

[State 7950,2]
type = Explod
trigger1 = Anim = 12302
trigger1 = !NumExplod(7950)
anim = 7041
ID = 7950
pos = -10, 0
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

[State 1031, Throw Enemy]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 1031, Throw Enemy]
type = PlayerPush
trigger1 = 1
value = 0


[State 1031, Bind]
type = PlaySnd
trigger1 = (Time % 30) = 0
value = S2,1
loop = 0
channel = 1

[State 1031, Bind]
type = Helper
trigger1 = Time % 3 = 0
name = "Rock"
ID = 12310
stateno = 12310
pos = 0,10
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

; First Drag Distance
[State 1031, Bind]
type = VarSet
trigger1 = !Time
V = 0
value = Floor(0.5 * GameWidth + FrontEdgeDist)

; First Drag Speed
[State 1031, Bind]
type = VarSet
trigger1 = !Time
FV = 0
value = 8.5

[State 1031, Bind]
type = PosSet
trigger1 = !Time
Y = -10

[State 1031, Bind]
type = VelSet
trigger1 = !Time
X = FVar(0)
; Idea: drag the opponent for ~3/5 of a stage, then turn and drag them to the center, lift them and
; beam them

[State 1031, Bind]
type = ChangeState
trigger1 = Time > Var(0)/FVar(0)
value = 12303

[State 1031, Bind]
type = TargetBind
trigger1 = 1
pos = 0, 10
time = 1

[State 1031, Throw Enemy]
type = TargetState
triggerall = NumTarget
trigger1 = !Time
value = 12350
persistent = 0

[State 1031, Safety]
type = ChangeState
trigger1 = !NumTarget
value = 50
ctrl = 0
ignorehitpause = 1

; Re-drag
[Statedef 12303]
type = A
physics = N
movetype = A
anim = 12302
ctrl = 0
sprpriority = 1
velset = 0,0


[State 3055, Hit]
type = VarAdd
triggerall = Var(2) < 30
trigger1 = Command = "a"
trigger2 = Command = "b"
trigger3 = Command = "c"
v = 2
value = 1
ignorehitpause = 1
[State 1031, Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = !Time
value = -80
persistent = 0

[State 1031, Throw Enemy]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 1031, Throw Enemy]
type = PlayerPush
trigger1 = 1
value = 0

[State 1031, Debris]
type = Helper
trigger1 = Time % 2 = 0
name = "Rock"
ID = 12310
stateno = 12310
pos = 0,10
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 1031, Throw Enemy]
type = TargetState
triggerall = NumTarget
trigger1 = !Time
value = 12351
persistent = 0

; Second Drag Distance
[State 1031, Position]
type = VarSet
trigger1 = !Time
V = 0
value = Floor(Abs(Pos X)) ; measured from the center of the stage

; Second Drag Speed
[State 1031, Drag Speed]
type = VarSet
trigger1 = !Time
FV = 0
value = 10.5

[State 1031, Turn]
type = Turn
trigger1 = !Time
trigger1 = FrontEdgeDist < BackEdgeDist

[State 1031, Bind]
type = TargetBind
trigger1 = 1
pos = 0, 10
time = 1

[State 1031, Set Speed]
type = VelSet
trigger1 = !Time
X = FVar(0)

; Second Drag Distance
; Timer
[State 1031, Start Timer]
type = VarSet
trigger1 = !Time
V = 1
value = 0

[State 1031, Bind]
type = VarSet
trigger1 = Time > (Var(0)/FVar(0) - 3)
V = 1
value = 1
persistent =  0

[State 420, 1]
type = PlaySnd
trigger1 = Var(1) = 1
value = S11,5
channel = 0
persistent = 0

[State 1031, Bind]
type = PlaySnd
trigger1 = Var(1) = 1
value = 3,1
channel = 1

[State 1031, Bind]
type = VarAdd
trigger1 = Var(1) > 0
V = 1
value = 1



[State 7950,2]
type = Explod
trigger1 = Anim = 12302
trigger1 = !Var(1)
trigger1 = !NumExplod(7950)
anim = 7041
ID = 7950
pos = -10, 0
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
trigger1 = Anim = 12302
trigger1 = Var(1) >= 2
trigger1 = !NumExplod(7950)
anim = 7043
ID = 7950
pos = 0, -4
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = -2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 1031, Time]
type = VelSet
trigger1 = Var(1) = [1, 4]
X =  FVar(0) * 1.5 * Cos(Pi*Var(1)/10.0) ;* (1.5 - Var(1)/26.0)
Y = -FVar(0) * 1.5 * Sin(Pi*Var(1)/10.0)

[State 1031, Time]
type = AngleDraw
trigger1 = Var(1) < 5
value = 90 * Var(1)/5.0

[State 1031, Time]
type = VelSet
trigger1 = Var(1) >= 5
X = 0
Y = 0
persistent = 0

[State 1031, Time]
type = ChangeState
trigger1 = Var(1) = 5
value = 12304
persistent = 0

; Shooting the Beam
[Statedef 12304]
type = A
physics = N
movetype = A
anim = 12303
ctrl = 0
sprpriority = -1
velset = 0,0

[State 1031, Time]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElem = 15
value = 12352
persistent = 0

[State 3055, Hit]
type = VarAdd
triggerall = Var(2) < 30
trigger1 = Command = "a"
trigger2 = Command = "b"
trigger3 = Command = "c"
v = 2
value = 1
ignorehitpause = 1

[State 1031, Bind]
type = PlaySnd
trigger1 = AnimElem = 5
value = 6,2
channel = 1

[State 7950,2]
type = Explod
trigger1 = Anim = 12303
trigger1 = !NumExplod(7950)
anim = 7043
ID = 7950
pos = 0, -4
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = -2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1

[State 200, Explod]
type = EnvShake
trigger1 = AnimElem = 5
time = 70
ampl = 5
freq = 120

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 12315
ID = 12304
pos = 1, -10
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
pausemovetime = 9999999*(Var(24) > 0)
removeongethit = 1
ignorehitpause = 1

[State 1031, Damage]
type = HitAdd
triggerall = NumTarget
trigger1 = AnimElemTime(5) = 10
trigger2 = AnimElemTime(5) = 45
trigger3 = AnimElemTime(5) = 60
value = 1

[State 1031, Damage]
type = TargetLifeAdd
triggerall = NumTarget
trigger1 = AnimElemTime(5) = 10
trigger2 = AnimElemTime(5) = 45
value = -90
kill = 0

[State 1031, Damage]
type = TargetLifeAdd
triggerall = NumTarget
trigger1 = AnimElemTime(5) = 60
value = -90 - Var(2)
persistent = 0

[State 1031, Throw Enemy]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 1031, Throw Enemy]
type = PlayerPush
trigger1 = 1
value = 0

[State 1031, Time]
type = TargetState
trigger1 = NumTarget
value = 12352
persistent = 0

[State 1031, Bind]
type = TargetBind
trigger1 = AnimElemNo(0) < 4
pos = 0, -8* AnimElemTime(1) + 0.24* AnimElemTime(1) * AnimElemTime(1)
time = 1

[State 1031, Bind]
type = TargetBind
trigger1 = NumTarget
trigger1 = AnimElemNo(0) >= 4
pos = 0, 25
time = 1

[State 1031, Bind]
type = TargetDrop
trigger1 = !AnimTime

[State 1031, Bind]
type = Turn
trigger1 = !AnimTime

[State 1031, Bind]
type = VelSet
trigger1 = !AnimTime
X = -4
Y = -3

[State 1031, Bind]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 0

;Rocks
[Statedef 12310]
type=A
physics=N
movetype=A
anim=12310
ctrl=0
juggle = 8
velset=0,0
sprpriority=4

[State 421, StartingVel]
type = EnvShake
trigger1 = !Time
ampl = 2
freq = 120
time = 2

[State 421, StartingVel]
type = PosSet
trigger1 = !Time
Y = 0

[State 1001, Override]
type = ChangeAnim
trigger1 = !Time
value = IfElse(Random % 3 = 0, 12310, IfElse(Random % 2 = 0, 12311, 12312))

[State 421, StartingVel]
type = VelSet
trigger1 = !Time
X = -3 - (Random/1000.0)*3.0
Y = -4 - (Random/1000.0)*3.0

[State 421, StartingVel]
type = VarSet
trigger1 = !Time
fv = 0
value = Random/1000.0 * 10.0


[State 421, StartingVel]
type = AngleDraw
trigger1 = 1
value = Time * FVar(0)


[State 421, Gravity]
type = VelAdd
trigger1 = Pos Y <= 0
Y = .5

[State 1010, burst]
type = DestroySelf
trigger1 = Pos Y > 0
ignorehitpause=1

; Iron Avenger - GetHit
[Statedef 12350]
type = A
movetype = H
physics = N
sprpriority = 1

[State 1031, Throw Enemy]
type = PlayerPush
trigger1 = 1
value = 0

[State 1031, Throw Enemy]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time 
value = 12350
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

; Iron Avenger - GetHit
[Statedef 12351]
type = A
movetype = H
physics = N
sprpriority = 1


[State 1031, Throw Enemy]
type = PlayerPush
trigger1 = 1
value = 0

[State 2023, Anim]
type = Turn
trigger1 = !Time 
ignorehitpause = 1

[State 1031, Throw Enemy]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time 
value = 12350
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

; Iron Avenger - GetHit
[Statedef 12352]
type = A
movetype = H
physics = N
sprpriority = 1

[State 1031, Throw Enemy]
type = PlayerPush
trigger1 = 1
value = 0

[State 1031, Throw Enemy]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time 
value = 12350
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050


; Iron Avenger - GetHit
[Statedef 12353]
type = A
movetype = H
physics = N
sprpriority = 1

[State 1031, Throw Enemy]
type = PlayerPush
trigger1 = 1
value = 0

[State 1031, Throw Enemy]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time 
value = 12350
ignorehitpause = 1

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050