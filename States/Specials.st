;===========================================================================
; Special Moves
;===========================================================================

;---------------------------------------------------------------------------
;Beast Toss
[Statedef 800]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 800
sprpriority = 2
poweradd = 18
facep2 = 1
velset = 0,0

[State 800, Direction]
type = VarSet
trigger1 = !Time
var(1) = IfElse(command = "holdback", -1, 1)

[State 800, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 800, Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 800, Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3,2

[State 800, Hit]
type = hitdef
trigger1 = !time
attr = S, NT 
hitflag = M-
priority = 1, Miss
sparkno = -1
hitsound = s7000, 0
p1facing = 1
p2facing = var(1)
p1stateno = 801
p2stateno = 802
guard.dist = 0
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Beast Toss - Throw
[Statedef 801]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 801
sprpriority = 1
poweradd = 72
velset = 0,0

[State 801, Var]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 801, Priority]
type = PlaySnd
trigger1 = Time % 20 = 0
trigger1 = Time < 50
trigger1 = !var(0)
value = S3,0
channel = 0

[State 801, Var]
type = VarSet
triggerall = Time >= 30
trigger1 = AnimElemTime(2) = 0 && var(1) < 0
trigger2 = AnimElemTime(4) = 0 && var(1) > 0
var(0) = 1

[State 801, Priority]
type = Sprpriority
trigger1 = AnimElemNo(0) = 1
value = 2

[State 801, Priority]
type = Sprpriority
trigger1 = AnimElemNo(0) = 3
value = 0

[State 801, Bind]
type = TargetBind
trigger1 = !var(0)
trigger1 = AnimElemNo(0) = 1
pos = 0, 0

[State 801, Bind]
type = TargetBind
trigger1 = !var(0)
trigger1 = AnimElemNo(0) = 2
pos = -15 - Target, Const(size.ground.front) , 0

[State 801, Bind]
type = TargetBind
trigger1 = !var(0)
trigger1 = AnimElemNo(0) = 3
pos = 0, 0

[State 801, Bind]
type = TargetBind
trigger1 = !var(0)
trigger1 = AnimElemNo(0) = 4
pos = 15 + Target, Const(size.ground.front) , 0

[State 801, Flip]
type = null;Turn
trigger1 = AnimElemTime(2) = 0
ignorehitpause = 1

[State 801, Flip]
type = TargetFacing
trigger1 = AnimElemTime(2) = 0
value = 1

[State 801, Flip]
type = TargetFacing
trigger1 = AnimElemTime(4) = 0
value = -1

[State 801, !Turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
ignorehitpause = 1

[State 801, !Turn]
type = AssertSpecial
trigger1 = 1
flag = noautoturn
ignorehitpause = 1

[State 801, Throw Enemy]
type = Turn
trigger1 = Anim = 801
trigger1 = var(0)
trigger1 = AnimElemNo(0) = 2
persistent = 0

[State 801, Throw Enemy]
type = TargetState
trigger1 = var(0)
value = 803
persistent = 0

[State 801, Anim]
type = ChangeAnim
trigger1 = var(0)
value = 803
persistent = 0

[State 801, Anim]
type = VelSet
trigger1 = var(0)
x = -5
persistent = 0

[State 801, End]
type = ChangeState
trigger1 = Time > 70
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Beast Toss - Gethit
[Statedef 802]
type = S
movetype = H
physics = N
ctrl = 0
sprpriority = 1

[State 802, Priority]
type = SprPriority
trigger1 = AnimElem = 3
value = 2

[State 802, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 802

[State 802, Exit]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;---------------------------------------------------------------------------
;Beast Toss - Air
[Statedef 803]
type = A
movetype = H
physics = N
ctrl = 0
sprpriority = 0

[State 803, Vel]
type = VelSet
trigger1 = !Time
y = -9
x = -2

[State 803, Vel]
type = VelAdd
trigger1 = 1
y = .56

[State 803, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 805

[State 803, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 804

[State 803, Life]
type = LifeAdd
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = -105

[State 803, Pal]
type = PalFX
trigger1 = (Vel y > 0) && (Pos y >= 0)
add = 200, 200, 200
mul = 256, 256, 256
time = 8

[State 803, Life]
type = EnvShake
trigger1 = (Vel y > 0) && (Pos y >= 0)
time = 14
freq = 120
ampl = 4

[State 803, Life]
type = PosSet
trigger1 = (Vel y > 0) && (Pos y >= 0)
y = 0

[State 803, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100
ctrl = 0

;---------------------------------------------------------------------------
;Rocket Punch
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 72
ctrl = 0
anim = 1000
sprpriority = 1
facep2 = 1
velset = -1.5,0

[State 1000, Change]
type = ChangeAnim
triggerall = AnimElemTime(2) = -7
trigger1 = prevstateno = [200, 299]
trigger2 = prevstateno = [400, 499]
value = 1000
elem = 2
persistent = 0

[State 1000, Vel]
trigger1 = AnimElem = 2
type = VelSet
X = 0

[State 1000, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcfc", 2, ifelse(command = "qcfb", 1, 0))

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 2
name = "Rocket Punch"
ID = 1000
stateno = 1001
pos = 19, -23
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1


[State 1000, Pawnch]
type = PlaySnd
trigger1 = AnimElem = 3
value = S2,0
channel = 0

[State 1000, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; The Fist
[Statedef 1001]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7054
sprpriority = 3

[State 1001, Air?]
type = VarSet
trigger1 = !Time
var(0) = (Parent, Statetype = A)

[State 1001, Explod]
type = Explod
trigger1 = !NumExplod(1001)
trigger1 = Time > 5
anim = 7005
ID = 1001
pos = 0, 0
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
removeongethit = 1
ignorehitpause = 1

[State 1001, PosSet]
type = VarSet
trigger1 = !Time
var(0) = parent, var(0)

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1002
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1001, PosSet]
type = VelSet
trigger1 = !Time
x = 0

[State 1001, PosSet]
type = VelAdd
trigger1 = Time > 5
trigger1 = Vel X < IfElse(var(0) = 0, 4, IfElse(var(0) = 1, 5.5, 7))
x = IfElse(var(0) = 0, .3, IfElse(var(0) = 1, .45, .6))

[State 1001, HitDef]
type = HitDef
trigger1 = Time = 4
trigger1 = !var(0)
attr = S, SP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
priority = 4, Hit
sparkno = S7051
damage = 82,7
sparkxy = -15,0
hitsound = S2,1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5.52, 0
ground.cornerpush.veloff = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 2
air.velocity = -4, -1
air.fall = 1
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
getpower = ifelse(p2movetype = H, 72, 144) + 20 * Var(0), 36
givepower = 36, 36
palfx.add= 128, 100, 7
palfx.mul=256,256,256
palfx.time = 8

[State 1001, HitDef]
type = HitDef
trigger1 = Time = 4
trigger1 = var(0)
attr = A, SP
hitflag = MAF        ;HLAFD+-
guardflag = MA         ;HLA
animtype = Hard
priority = 4, Hit
sparkno = S7051
damage = 82,7
sparkxy = -15,0
hitsound = S2,1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5.52, 0
ground.cornerpush.veloff = 0
givepower = 36, 36
envshake.time = 14
envshake.freq = 120
envshake.ampl = 2
air.velocity = -4, -1
air.fall = 1
fall.recover = 1
fall.recovertime = 30
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
getpower = ifelse(p2movetype = H, 72, 144), 36
givepower = 36, 36
palfx.add= 128, 100, 7
palfx.mul=256,256,256
palfx.time = 8

[State 1001, ChangeState]
type = ChangeState
trigger1 = HitCount > 0
value = 1002
ctrl = 0

[State 1001, End]
type = DestroySelf
trigger1 = Pos x != [-200, 200]

;---------------------------------------------------------------------------
;Destroyed Punch
[Statedef 1002]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 7054
sprpriority = 3

[State 1002, NHB]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 1
ignorehitpause = 1

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = Time = 10

;---------------------------------------------------------------------------
;Rocket Punch (Air)
[Statedef 1005]
type    = A
movetype= A
physics = N
juggle  = 3
poweradd= 72
ctrl = 0
anim = 1005
sprpriority = 1
facep2 = 1
velset = 0,0

[State 1005, Fuel]
type = VarAdd
trigger1 = !Time
var(21) = -30

[State 1005,2]
type = Explod
trigger1 = !NumExplod(1005) && AnimElemTime(2) < 7
anim = 7043
ID = 1005
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


[State 1005, Vel]
type = VelSet
trigger1 = AnimElemTime(2) < 7
Y = -.2

[State 1005, Vel]
type = VelSet
trigger1 = AnimElemTime(2) = 7
X = -2
Y = -2

[State 1005, Change]
type = ChangeAnim
trigger1 = PrevStateNo = [600, 699]
trigger1 = AnimElemTime(1) < 7
value = 1005
elem = 2
persistent = 0

[State 1005, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcfc", 2, ifelse(command = "qcfb", 1, 0))

[State 1006, Gravity]
type = VelAdd
trigger1 = AnimElemTime(2) > 7
Y = 0.1

[State 1000, Pawnch]
type = PlaySnd
trigger1 = AnimElem = 2
value = S2,0
channel = 0

[State 1005, Pawnch]
type = Helper
trigger1 = AnimElem = 2
name = "Rocket Punch"
ID = 1000
stateno = 1001
pos = 19, -23
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 1005, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 1006
ctrl = 0

;Falling
[Statedef 1006]
type = A
movetype = I
physics = N
anim = 1006
ctrl = 0

[State 1006, Gravity]
type = VelAdd
trigger1 = 1
Y = 0.47

[State 1006, Land]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > - Vel Y
value = 1007
ctrl = 0

;Landing
[Statedef 1007]
type = S
movetype = I
physics = N
anim = 47
ctrl = 0
velset = 0,0

[State 1007, Pos]
type = PosSet
trigger1 = 1
Y = 0
[State 1007, End]
trigger1 = Time > 10
type = ChangeState
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Robo Tackle
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 8
ctrl = 0
sprpriority = 1
poweradd = 72
facep2 = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "dfc", 2, ifelse(command = "dfb", 1, 0))

[State 1010, Anim]
type = ChangeAnim
trigger1 = !Time
value = 1010 + Var(0)

[State 1010, Explod]
type = Explod
trigger1 = AnimElemNo(0) = 11
trigger1 = !NumExplod(1010)
anim = 7006
ID = 1010
pos = -5, -15
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
ignorehitpause = 1

[State 1010, Anim]
type = ChangeAnim
trigger1 = !AnimTime && Anim = [1010, 1012]
value = 1013

[State 1100, nothitby]
type = nothitby
trigger1 = Anim = 1011
value = SCA
time = 1
ignorehitpause = 1

[State 1010, Jump]
type = StateTypeSet
trigger1 = Anim = 1013
statetype = A
physics = N

[State 1010, Jump]
type = PlaySnd
trigger1 = Anim = 1013
value = S3,1
channel = 0
persistent = 0

[State 1010, Jump]
type = VelSet
trigger1 = Anim = 1013
x = ifelse(var(0) = 2, 4.2, ifelse(var(0) = 1, 3.5, 2.5))
y = ifelse(var(0) = 2, -4.2, ifelse(var(0) = 1, -3.5, -2.5))
persistent = 0

[State 1010, HitDef]
type = HitDef
trigger1 = !Time
attr = A, SA
damage = ifelse(var(0) = 2, 128, ifelse(var(0) = 1, 101, 85)),15
animtype = Back
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12,12
sparkno = S7009
;guard.sparkno = S8105
sparkxy = -10,-30
hitsound = S1,2
guardsound = 5,0
ground.type = Low
ground.velocity = ifelse(var(0) = 2, -2.5, ifelse(var(0) = 1, -3, -3.5)), ifelse(var(0) = 2, -7.4, ifelse(var(0) = 1, -6.2, -5.7));-4
ground.hittime = 16
ground.slidetime = 16
guard.velocity = -10
air.velocity = -3,-10
airguard.velocity = -1, -3
air.hittime = 16
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
getpower = ifelse(p2movetype = H, 72, 144), 36 
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 2011, AfterImage]
type = Explod
trigger1 = Anim = 1013 && GameTime % 3 = 0
anim = 1016
ID = 1010
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
removetime = 20
scale = 1,1
sprpriority = 0
ownpal = 1
removeongethit = 0


[State 1010, End]
type = ChangeState
trigger1 = Anim = 1013 
trigger1 = AnimTime >= IfElse(var(0) = 2, 15, ifelse(var(0) = 1, 13, 10))
value = 1011
ctrl = 0

;---------------------------------------------------------------------------
;Falling after Tackle
[Statedef 1011]
type    = A
movetype= I
physics = N
juggle  = 3
ctrl = 0
anim = 1014
sprpriority = 1
poweradd = 0
facep2 = 0

[State 1011, Explods]
type = RemoveExplod
trigger1 = AnimElem = 2 && Anim = 1014
ID = 1010
ignorehitpause = 1

[State 1011, Vel]
trigger1 = !Time
type = VelMul
X = 0.5
Y = 0.7

[State 1011, Gravity]
trigger1 = 1
type = VelAdd
Y = 0.49

[State 1011, Change]
type = StateTypeSet
trigger1 = Pos Y > - Vel Y
trigger1 = Vel Y > 0
statetype = S
physics = S

[State 1011, Pos]
type = PosSet
trigger1 = Pos Y > - Vel Y
trigger1 = Vel Y > 0
Y = 0

[State 1011, Pos]
type = VelSet
trigger1 = Pos Y >= - Vel Y
trigger1 = Vel Y > 0
Y = 0

[State 1011, End]
type = ChangeAnim
trigger1 = StateType = S 
value = 1015
persistent = 0

[State 1011, End]
type = ChangeState
trigger1 = Anim = 1015
trigger1 = AnimTime >= IfElse(Var(0) = 2, 13, IfElse(Var(0) = 1, 9, 5))
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Area Bomb
[Statedef 1020]
type    = S
movetype= A
physics = S
juggle  = 8
ctrl = 0
anim = 1020
sprpriority = 1
poweradd = 72
facep2 = 1

[State 1010, Anim]
type = ChangeAnim
trigger1 = PrevStateNo = [200, 299]
trigger2 = PrevStateNo = [400, 499]
value = 1020
elem = 3
persistent = 0

[State 1010, Explod]
type = Explod
trigger1 = AnimElemNo(0) = [3,6]
trigger1 = NumExplod(1020) < 3
trigger1 = time % 3
anim = 7055
ID = 1020
pos = 20 - Random % 40, 5 - Random % 40
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "dfc", 2, ifelse(command = "dfb", 1, 0))

[State 1010, HitDef]
type = HitDef
trigger1 = !Time
attr = A, SA
damage = ifelse(var(0) = 2, 125, ifelse(var(0) = 1, 118, 111)),15
animtype = Back
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12,12
sparkno = S7009
;guard.sparkno = S8105
sparkxy = -10,-30
hitsound = S2,1
guardsound = 5,0
ground.type = Low
ground.velocity = ifelse(var(0) = 2, -2.5, ifelse(var(0) = 1, -3, -3.5)), ifelse(var(0) = 2, -7.4, ifelse(var(0) = 1, -6.2, -5.7));-4
guard.velocity = -2
ground.hittime = 16
ground.slidetime = 16
guard.velocity = -10
air.velocity = -3,-10
airguard.velocity = -2, -3
air.hittime = 16
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
getpower = ifelse(p2movetype = H, 62, 134), 36 
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 1020, Bomb]
type = Helper
trigger1 = AnimElemTime(3) = 5
name = "Explosion"
ID = 1020
stateno = 1021
pos = 0,-15
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Area Bomb Explosion
[Statedef 1021]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 7056
sprpriority = 4

[State 1021, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1021, Scale]
type = AngleDraw
trigger1 = 1
value = 1
scale = Time/33.0, Time/33.0
;ignorehitpause = 
;persistent = 

[State 801, Priority]
type = PlaySnd
trigger1 = !Time
value = S2,2
channel = 0

[State 1021, Trans]
type = Trans
trigger1 = Time = [0,20]
trans = add


[State 1021, Trans]
type = Trans
trigger1 = Time != [0,20]
trans = addalpha
alpha = 256 - 16 * (Time - 20), 256


[State 1021, End]
type = DestroySelf
trigger1 = Time >= 36



