; Standing Light
[Statedef 10200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10200                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.75
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 47, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
sparkno = S7000                      ;Spark anim no (Def: set above)
sparkxy = -10, -30               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S0,0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 3             ;Time that the opponent slides back
ground.hittime  = 13             ;Time opponent is in hit state
guard.hittime = 12
air.hittime = 13
ground.velocity = -1.4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-1           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
getpower = IfElse(Var(22) > 0, 0, 72), IfElse(Var(22) > 0, 0, 36)
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 2
channel = 0

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Standing Mid
[Statedef 10210]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= 18
ctrl = 0
velset = 0,0
anim = 10210
sprpriority = 2

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 0
channel = 0

[State 210, Explod]
type = Explod
triggerall = Anim = 10210
trigger1 = AnimElemNo(0) > 1
trigger1 = NumExplod(210) = 0
anim = 7042
ID = 210
pos = 12, -18
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1


[State 210, Hit1]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 70
guardflag = MA
hitflag = MAF
pausetime = 16,16
sparkno = -1
sparkxy = -20, -23
hitsound   = S0,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 17
guard.hittime = 16
ground.velocity = -2
air.velocity = -2,-.5
ground.cornerpush.veloff = 0;
air.cornerpush.veloff = 0;
getpower = IfElse(Var(22) > 0, 0, ifelse(p2movetype = H, 44, 101)), IfElse(Var(22) > 0, 0, 32)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; Standing Heavy
[Statedef 10220]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= 18
ctrl = 0
velset = 0,0
anim = 10220
sprpriority = 2

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 0
channel = 0

[State 210, Explod]
type = Helper
trigger1 = Anim = 10220
trigger1 = AnimElemNo(0) > 1
trigger1 = AnimElemTime(3) < 16
stateno = 10221
ID = 10220
pos = 10, -16
postype = p1  ;p2,front,back,left,right
facing = 1
scale = 1,1
sprpriority = 2
ownpal = 0
ignorehitpause = 1
persistent = 0

[State 210, Hit1]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 90
guardflag = MA
hitflag = MAF
pausetime = 16,16
sparkno = -1
sparkxy = -20, -23
hitsound   = S0,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 23
guard.hittime = 21
ground.velocity = -2
air.velocity = -2,-.5
ground.cornerpush.veloff = 0;
air.cornerpush.veloff = 0;
getpower = IfElse(Var(22) > 0, 0, ifelse(p2movetype = H, 44, 101)), IfElse(Var(22) > 0, 0, 32)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; Focus Blast
[Statedef 10221]
type    = A
movetype= I
physics = N
juggle  = 0
poweradd= 0
ctrl = 0
velset = 0,0
anim = 10625
sprpriority = 2

[State 10621, End]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 10621, End]
type = PosSet
trigger1 = 1
X = Root, Pos X  + 12*Facing
Y = Root, Pos Y  - 16

[State 10621, End]
type = AngleDraw
trigger1 = 1
value = -90

[State 10621, End]
type = DestroySelf
trigger1 = Root, StateNo != 10220
trigger2 = Root, AnimElemTime(3) >= 16

; Standing Launcher
[Statedef 10230]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= 18
ctrl = 0
velset = 0,0
anim = 10230
sprpriority = 2

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1


[State -3, Dampener]
Type = VelAdd
Trigger1 = AnimElem = 2
X = 4
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 0
channel = 0

[State 210, Explod]
type = Explod
triggerall = Anim = 10230
trigger1 = AnimElemNo(0) > 1
trigger1 = AnimElemTime(3) < 12
trigger1 = NumExplod(230) = 0
anim = 7043
ID = 230
pos = 12, -26
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1


[State 210, Hit1]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = DiagUp
damage    = 80,0
guardflag = MA
hitflag = MAF
pausetime = 12,16
sparkno = -1
sparkxy = -20, -23
hitsound   = S0,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 240
air.hittime  = 240
guard.hittime = 21
ground.velocity = 0, -8
air.velocity = 0,-8
fall.recover = 0
forcenofall = 1
ground.cornerpush.veloff = 0;
air.cornerpush.veloff = 0;
getpower =ifelse(p2movetype = H, 44, 101), 32
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Crouching Light
[Statedef 10400]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = C                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10400                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.75
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = C, NA                     ;Attribute: Standing, Normal Attack
damage = 45, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = LA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
sparkno = S7000                      ;Spark anim no (Def: set above)
sparkxy = -10, -30               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S0,0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 3             ;Time that the opponent slides back
ground.hittime  = 13             ;Time opponent is in hit state
guard.hittime = 12
air.hittime = 13
ground.velocity = -1.4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-1           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
getpower = 72, 36
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0


[State 210, Explod]
type = Explod
triggerall = Anim = 10400 
trigger1 = AnimElemNo(0) > 1
trigger1 = AnimElemTime(3) < 7
trigger1 = NumExplod(400) = 0
anim = 7042
ID = 400
pos = 10 , 0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1


[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 2
channel = 0

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

; Crouching Mid
[Statedef 10410]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = C                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10410                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = C, NA                     ;Attribute: Standing, Normal Attack
damage = 68, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = LA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
sparkno = S7000                      ;Spark anim no (Def: set above)
sparkxy = -10, -30               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S0,0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 3             ;Time that the opponent slides back
ground.hittime  = 20             ;Time opponent is in hit state
guard.hittime = 21
air.hittime = 13
fall = 1
ground.velocity = 0, -2             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-2           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
getpower = IfElse(Var(22) > 0, 0, 72), IfElse(Var(22) > 0, 0, 36)
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0


[State 210, Explod]
type = Explod
triggerall = Anim = 10410
trigger1 = AnimElemNo(0) > 1
trigger1 = NumExplod(410) = 0
trigger1 = AnimElemTime(3) < 7
anim = 7042
ID = 410
pos = 12, -6
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1

[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 2
channel = 0

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Crouching Heavy
[Statedef 10420]
type    = C
movetype= A
physics = C
juggle  = 0
poweradd= IfElse(Var(22) > 0, 0, 18)
velset = 0,0
ctrl = 0
anim = 10420
sprpriority = 1

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 420, Bomb]
type = Helper
trigger1 = AnimElem = 3
name = "Missile"
ID = 10420
stateno = 10421
pos = 0,-20
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S2,0
channel = 0

[State 420, VelAdd]
type = VelAdd
trigger1 = Anim = 10420
trigger1 = AnimElem = 3
x = -0.5
y = 0
ignorehitpause = 1

[State 420, 3]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;Missile
[Statedef 10421]
type=A
physics=N
movetype=A
anim=10421
ctrl=0
juggle = 0
velset=0,0
sprpriority=4

[State 1001, Override]
type = HitOverride
trigger1 = 1
attr = SCA, AA, AP
stateno = 10422
time = 1
ignorehitpause = 1

[State 1002, Immune]
type = NotHitBy
trigger1 = 1
value = , AT
time = 1
ignorehitpause = 1

[State 421, StartingVel]
type = VelSet
trigger1 = !Time
Y = -3

[State 421, StartingVel]
type = VelAdd
trigger1 = Vel Y >= -1
trigger1 = Vel X < 6
X = 0.3

[State 421, Gravity]
type = VelAdd
trigger1 = Vel Y < 3
Y = .3

[State 421, Gravity]
type = AngleSet
trigger1 = Vel X = 0
value = 90
ignorehitpause = 1

[State 421, Gravity]
type = AngleSet
trigger1 = Vel X != 0
value = 0 + ATan(-Vel Y / Vel X) * 180.0/Pi
ignorehitpause = 1

[State 421, Gravity]
type = AngleDraw
trigger1 = 1
ignorehitpause = 1

[State 421, Hit]
type = HitDef
trigger1 = Time = 5
attr = C, NP
damage    = Floor(80 * Parent, FVar(39)), 5
animtype  = Hard
hitflag = MAF
guardflag = MA
pausetime = 0,20
sparkno = -1
hitsound   = -1
guardsound = 6,0
ground.type = Low
ground.slidetime = 6
ground.hittime  = 28
ground.velocity = -2,-2.3
air.velocity = -1.2,-3
guard.hittime  = 24
getpower = IfElse(Var(22) > 0, 0, ifelse(p2movetype = H, 72, 216)), IfElse(Var(22) > 0, 0, 36)
givepower = 36, 36
palfx.invertall = 1
palfx.color = 0
palfx.add = 245, 148, 88
palfx.time = 20
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 1010, burst]
type = PlaySnd
trigger1 = MoveContact || Pos Y >= 0
value = S2,1
channel = 0
ignorehitpause=1

[State 1010, burst]
type = ChangeState
trigger1 = MoveContact || Pos Y >= 0
value = 10422
ignorehitpause=1

;Explosion
[Statedef 10422]
type = A
physics = N
movetype = I
anim = 7051
velset = 0,0
ctrl = 0
sprpriority = 4

[State 1015, snd]
type = PlaySnd
trigger1=!time
value = S7010,4
channel = 1

[State 1015, assert]
type = AssertSpecial
trigger1=1
flag=noshadow
ignorehitpause=1

[State 1015, end]
type = DestroySelf
trigger1 = !AnimTime

;---------------------------------------------------------------------------
;Jump Light
[Statedef 10600]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd= 0
ctrl = 0
anim = 10600
sprpriority = 1

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1


[State 600, 2]
type = VelMul
trigger1 = Var(21) <= 0
trigger1 = !Time
Y = 0.7


[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.75
persistent = 0
ignorehitpause = 1


[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 600, 2]
type = VelMul
trigger1 = !Time
X = 0.75

[State 600, 2]
type = PlaySnd
trigger1 = Time = 2
value = S3, 2
channel = 0

[State 600, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 50
guardflag = HA
hitflag = MAF
priority = 3
pausetime = 7,8
sparkno = S7000
sparkxy = -10,-18
hitsound   =  S0,0
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 30
guard.hittime  = 29
ground.velocity = -2
air.velocity = 0, -0.5
air.hittime = 14
yaccel = 0.2
getpower = 72, 36
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8


[State 210, Explod]
type = Explod
triggerall = Time > 5
triggerall = Anim = 10600
trigger1 = AnimElemNo(0) > 1
trigger1 = NumExplod(600) = 0
anim = 7042
ID = 600
pos = 20, -22
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1


[State 600, 2]
type = ChangeState
trigger1 = !AnimTime
value = 7950
ctrl = 1
ignorehitpause = 1

[State 1006, Gravity]
type = VelAdd
trigger1 = Var(21) <= 0
trigger1 = Time > 10
Y = 0.2
ignorehitpause = 1

[State 1006, Land]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > - Vel Y
value = 10050
ctrl = 0


;---------------------------------------------------------------------------
;Jump Mid
[Statedef 10610]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd= 0
ctrl = 0
anim = 10610
sprpriority = 1

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 600, 2]
type = VelMul
trigger1 = Var(21) <= 0
trigger1 = !Time
Y = 0.7

[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 600, 2]
type = PlaySnd
trigger1 = Time = 2
value = S3, 2
channel = 0

[State 600, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 70
guardflag = HA
hitflag = MAF
priority = 3
pausetime = 7,8
sparkno = S7000
sparkxy = -10,-18
hitsound   =  S0,0
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 40
guard.hittime  = 39
ground.velocity = -2
air.velocity = 0,-0.5
air.hittime = 14
getpower = 72, 36
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
yaccel = 0.2

[State 210, Explod]
type = Explod
triggerall = Anim = 10610
trigger1 = AnimElemNo(0) > 1
trigger1 = NumExplod(610) = 0
anim = 7042
ID = 610
pos = 12, -12
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1

[State 600, 2]
type = ChangeState
trigger1 = !AnimTime
value = 7950
ctrl = 1
ignorehitpause = 1

[State 1006, Gravity]
type = VelAdd
trigger1 = Var(21) <= 0
trigger1 = Time > 10
Y = 0.2
ignorehitpause = 1

[State 1006, Land]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > - Vel Y
value = 52
ctrl = 0

;Jump Heavy
[Statedef 10620]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd= 0
ctrl = 0
anim = 10620
sprpriority = 1

[State -3, Command]
type = ChangeAnim
triggerall = !Time
trigger1 = Command = "holdup" && Command != "holddown"
trigger2 = Command != "holdup" && Command = "holddown"
value = IfElse(Command = "holdup" && Command != "holddown", 10622, 10621)
ignorehitpause = 1


[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 600, 2]
type = VelMul
trigger1 = Var(21) <= 0
trigger1 = !Time
X = 0.5
Y = 0.5

[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 600, 2]
type = PlaySnd
trigger1 = Time = 2
value = S3, 2
channel = 0

[State 600, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 80
guardflag = HA
hitflag = MAF
priority = 3
pausetime = 7,8
sparkno = S7000
sparkxy = -10,-18
hitsound   =  S0,0
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 53
guard.hittime  = 51
ground.velocity = 0, -2
air.velocity = 0, -0.5
air.hittime = 14
getpower = 72, 36
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
yaccel = 0.2

[State 210, Explod]
type = Helper
triggerall = Anim = [10620, 10622]
trigger1 = AnimElemNo(0) > 1
trigger1 = AnimElemTime(3) < 16
stateno = 10621
ID = 10620
pos = 12, -16
postype = p1  ;p2,front,back,left,right
facing = 1
scale = 1,1
sprpriority = 2
ownpal = 0
ignorehitpause = 1
persistent = 0

[State 600, 2]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1
ignorehitpause = 1

[State 1006, Gravity]
type = VelAdd
trigger1 = Time > 10
trigger1 = Var(21) <= 0
Y = 0.2
ignorehitpause = 1

[State 600, 2]
type = ChangeState
trigger1 = !AnimTime
value = 7950
ctrl = 1
ignorehitpause = 1

[State 1006, Land]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > - Vel Y
value = 52
ctrl = 0

; Focus Blast
[Statedef 10621]
type    = A
movetype= I
physics = N
juggle  = 0
poweradd= 0
ctrl = 0
velset = 0,0
anim = 10625
sprpriority = 2

[State 10621, End]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 10621, End]
type = PosSet
trigger1 = Root, Anim = 10620
X = Root, Pos X  + 12*Facing
Y = Root, Pos Y  - 16


[State 10621, End]
type = PosSet
trigger1 = Root, Anim = 10621
X = Root, Pos X  + 12*Facing
Y = Root, Pos Y  


[State 10621, End]
type = PosSet
trigger1 = Root, Anim = 10622
X = Root, Pos X  + 12*Facing
Y = Root, Pos Y  - 26

[State 10621, End]
type = AngleSet
trigger1 = !Time
value = IfElse(Root, Anim = 10620, -90, IfElse(Root, Anim = 10621, -135, -45))


[State 10621, End]
type = AngleDraw
trigger1 = 1

[State 10621, End]
type = DestroySelf
trigger1 = Root, StateNo != 10620
trigger2 = Root, AnimElemTime(3) >= 16


; Air Knockdown
[Statedef 10630]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd= 18
ctrl = 0
velset = 0,0
anim = 10630
sprpriority = 0

[State -3, NoEffects]
Type = RemoveExplod
Trigger1 = !Time
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Triggerall = !Time
Trigger1= Roundstate >= 2
Trigger1= P2Stateno != [120,160]
Trigger1= !(enemynear,ctrl)
Trigger1= (P2StateType = A) || (P2MoveType = H)
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 600, 2]
type = VelSet
trigger1 = !Time
Y = -0.1

[State 600, 2]
type = PlaySnd
trigger1 = Time = 2
value = S3, 2
channel = 0

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 0
channel = 0


[State 210, Explod]
type = Explod
triggerall = Anim = 10630
trigger1 = AnimElemNo(0) > 1
trigger1 = AnimElemTime(3) < 12
trigger1 = NumExplod(630) = 0
anim = 7041
ID = 630
pos = 0, -8
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1

[State 210, Explod]
type = Explod
triggerall = Anim = 10630
trigger1 = AnimElemNo(0) > 1
trigger1 = AnimElemTime(3) < 12
trigger1 = NumExplod(631) = 0
anim = 7041
ID = 631
pos = 10, -16
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 0
removeongethit = 1
ignorehitpause = 1


[State 210, Hit1]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = DiagUp
damage    = 27
guardflag = MA
hitflag = MAF
pausetime = 12,16
sparkno = -1
sparkxy = -20, -23
hitsound   = S0,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 240
air.hittime  = 240
guard.hittime = 21
ground.velocity = -4, 12
air.velocity = -4, 12
fall.recover = 0
fall = 1
ground.cornerpush.veloff = 0;
air.cornerpush.veloff = 0;
getpower =ifelse(p2movetype = H, 44, 101), 32
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1

[State 1006, Gravity]
type = VelAdd
trigger1 = Time > 10
Y = 0.2

[State 1006, Land]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > - Vel Y
value = 52
ctrl = 0