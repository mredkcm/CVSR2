; _______________________________________
;| Dudley by Dick Buckus & Mr.Ansatsuken |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;
; NORMAL STATES;
;

; Stand Light Punch
[Statedef 200]
type = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0
facep2 = 1                         ;Set ctrl (Def: no change)
anim = 200                       ;Change animation (Def: no change)
poweradd = 0                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S100,3
channel = 0

[State 200, 1]
type = HitDef
trigger1 = time = 0
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 23, 0
getpower = 50,50                  ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority=4,Hit                 ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 5, 8                 ;Time attacker pauses, time opponent shakes
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-84               ;X-offset for the "hit spark" rel. to p2,
hitsound = s2, 1                  ;Sound to play on hit
guardsound = s6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime = 10             ;Time opponent is in hit state
ground.velocity = -4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
air.hittime = 12                 ;Time before opponent regains control in air

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 1, 1

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State AttackDone]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 240, ChangeState]
type = ChangeState
triggerall = command = "forward_x"
trigger1 = time = 0
value = 201
ctrl = 0
;---------------------------------------------------------------------------
; Stand Light Punch
[Statedef 201]
type = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0
facep2 = 1                         ;Set ctrl (Def: no change)
anim = 201                       ;Change animation (Def: no change)
poweradd = 0                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 300, Position]
type = PosAdd
trigger1 = (Time = 0) || (AnimElemTime(6) = 0) || (AnimElemTime(7) = 0)
x = Ifelse(Time = 0, 11, Ifelse (AnimElemTime(6) = 0, -6, -5))

[State 200, 1]
type = HitDef
trigger1 = time = 0
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 23, 0
getpower = 50,50                  ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority=4,Hit                 ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 5, 8                 ;Time attacker pauses, time opponent shakes
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-71               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = s2, 1                  ;Sound to play on hit
guardsound = s6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime = 10             ;Time opponent is in hit state
ground.velocity = -4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air

[State 200, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 1, 1

[State AttackDone]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing strong punch
[Statedef 210]
type = S
movetype= A
physics = S
juggle = 4
poweradd = 10
ctrl = 0
facep2 = 1
velset = 0,0
anim = 210
sprpriority = -1

;[State 210, 5]
;type = ChangeAnim
;triggerall = p2bodydist x<10
;trigger1 = Time = 0
;value = 211
;ctrl = 0

[State 210, Width]
type = Width
triggerall = anim = 210
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 210, 1]
type = PlaySnd
triggerall = anim = 210
trigger1 = animelem = 2
value = 1, 2

[State 211, Width]
type = Width
triggerall = anim = 211
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 5,0

[State 210, 2]
type = HitDef
triggerall = anim = 210
trigger1 = AnimElem = 3
attr = S, NA
animtype = Medium
damage = 46
getpower = 100,100
hitflag = MAF
guardflag = MA
pausetime = 10,10
priority=4,Hit
sparkno = -1 * (var(10):=8011)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-82
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 13
ground.velocity = -5.5
air.velocity = -2.5,-4

[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 240, ChangeState]
type = ChangeState
triggerall = command = "forward_y"
trigger1 = time = 0
value = 211
ctrl = 0

[State 250, ChangeState]
type = ChangeState
triggerall = var(7)!=1 && prevstateno = [200,205]
trigger1 = command = "b" && movehit
value = 320
ctrl = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 250, ChangeState]
type = ChangeState
triggerall= var(7)>=1 && (prevstateno = [200,205]) && roundstate=2
triggerall= (p2bodydist x=[0,56]) && (p2bodydist y=[-50,50]) && p2statetype!=L
trigger1= movehit && random<333
value = 320
ctrl = 0
;---------------------------------------------------------------------------
; Standing strong punch
[Statedef 211]
type = S
movetype= A
physics = S
juggle = 4
poweradd = 0
ctrl = 0
facep2 = 1
velset = 0,0
anim = 211
sprpriority = -1

[State 302, Position]
type = PosAdd
trigger1 = (Time = 0) || (AnimElemTime(7) = 0) || (AnimElemTime(8) = 0) || (AnimElemTime(10) = 0)
x = Ifelse(Time = 0, 16, Ifelse (AnimElemTime(7) = 0, 5, Ifelse (AnimElemTime(8) = 0, 11, -4)))

[State 210, Width]
type = Width
triggerall = anim = 210
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 210, 1]
type = PlaySnd
triggerall = anim = 210
trigger1 = animelem = 4
value = 1, 2

[State 211, Width]
type = Width
triggerall = anim = 211
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 5,0

[State 211, 1]
type = PlaySnd
triggerall = anim = 211
trigger1 = animelem = 3
value = 1, 2

[State 211, 2]
type = HitDef
triggerall = anim = 211
trigger1 = animelem = 3
attr = S, NA
animtype = Medium
damage = 49
getpower = 100,100
guardflag = MA
hitflag = MAF
pausetime = 6,12
priority=4,Hit
sparkno = -1 * (var(10):=8011)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-61
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 13
ground.velocity = -5.5
air.velocity = -2.5,-4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Standing fierce punch
[Statedef 220]
type = S
movetype= A
physics = S
juggle = 4
poweradd = 20
ctrl = 0
facep2 = 1
velset = 0,0
anim = 220
sprpriority = 2

;[State 220, 5]
;type = ChangeAnim
;triggerall = p2bodydist x<20
;trigger1 = Time = 0
;value = 221
;ctrl = 0

[State 202, Position]
type = PosAdd
triggerall = anim = 220
trigger1 = (AnimElemTime(2) = 0) || (AnimElemTime(10) = 0) || (AnimElemTime(11) = 0)
x = Ifelse((AnimElemTime(2) = 0) || (AnimElemTime(10) = 0), 5, 9)

[State 220, Width]
type = Width
triggerall = anim = 220
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 220, 1]
type = PlaySnd
triggerall = anim = 220
trigger1 = animelem = 3
value = 1, 3

[State 220, 1]
type = PlaySnd
triggerall = anim = 220
trigger1 = animelem = 3
value = 100, 1
channel = 0

[State 220, 2]
type = HitDef
triggerall = anim = 220
trigger1 = AnimElem = 4
attr = S, NA
animtype = Hard
damage = 67
getpower = 150,150
guardflag = MA
hitflag = MAF
pausetime = 8,14
priority=4,Hit
sparkno = -1 * (var(10):=8012)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-73
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -5.5
air.velocity = -2.5,-4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 240, ChangeState]
type = ChangeState
triggerall = command = "forward_z"
trigger1 = time = 0
value = 221
ctrl = 0
;---------------------------------------------------------------------------
; Standing fierce punch
[Statedef 221]
type = S
movetype= A
physics = S
juggle = 4
poweradd = 0
ctrl = 0
facep2 = 1
velset = 0,0
anim = 221
sprpriority = 2

[State 202, Position]
type = PosAdd
trigger1 = (AnimElemTime(2) = 0) || (AnimElemTime(10) = 0) || (AnimElemTime(11) = 0)
x = Ifelse((AnimElemTime(2) = 0) || (AnimElemTime(10) = 0), 5, 9)

[State 220, Width]
type = Width
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 4
x = 8

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 7
x = 0

[State 220, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 1, 3

[State 220, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 100, 1
channel = 0

[State 220, 2]
type = HitDef
trigger1 = time = 0
attr = S, NA
animtype = Hard
damage = 75
getpower = 150,150
guardflag = MA
hitflag = MAF
pausetime = 8,12
priority=4,Hit
sparkno = -1 * (var(10):=8012)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-73
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 13
ground.velocity = -5.5
air.velocity = -2.5,-4

[State 221, Width]
type = Width
triggerall = anim = 221
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 221, 1]
type = PlaySnd
triggerall = anim = 221
trigger1 = animelem = 4
value = 1, 3

[State 221, 1]
type = PlaySnd
triggerall = anim = 221
trigger1 = animelem = 3
value = 100, 1
channel = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing light kick
[Statedef 230]
type = S
movetype= A
physics = S
juggle = 4
poweradd = 0
ctrl = 0
facep2 = 1
velset = 0,0
anim = 230
sprpriority = 2

[State 230, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 1, 1

[State 230, 2]
type = HitDef
trigger1 = Time = 0
attr = S, NA
animtype = Medium
damage = 26
getpower = 50,50
guardflag = MA
hitflag = MAF
pausetime = 8,12
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-76
hitsound = s2,1
guardsound = s6,0
ground.type = Low
ground.slidetime = 10
ground.hittime = 11
ground.velocity = -5
air.velocity = -2.5,-3.5

[State AttackDone]
type=statetypeset
trigger1= animelemtime(6)>=0
movetype=I

[State 230, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing strong kick
[Statedef 240]
type = S
movetype= A
physics = S
juggle = 5
poweradd = 10
ctrl = 0
facep2 = 1
velset = 0,0
anim = 240
sprpriority = 2

;[State 240, 4]
;type = ChangeAnim
;triggerall = p2bodydist x<11.9
;trigger1 = time = 0
;value = 241
;ctrl = 0

[State 204, Position]
type = Posadd
trigger1 = (Time = 0) || (AnimElemTime(2) = 0) || (AnimElemTime(12) = 0) || (AnimElemTime(15) = 0)
x = Ifelse (Time = 0, 7, ifelse (AnimElemTime(2) = 0, -1, ifelse (AnimElemTime(12) = 0, -3, -3)))

[State 240, 1]
type = PlaySnd
triggerall = anim = 240
trigger1 = animelem = 4
value = 1, 2

[State 240, Width]
type = Width
triggerall = anim = 240
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 240, 2]
type = HitDef
triggerall = anim = 240
trigger1 = animelem = 5
attr = S, NA
animtype = Medium
damage = 46
getpower = 100,100
guardflag = MA
hitflag = MAF
pausetime = 6,12
priority=4,Hit
sparkno = -1 * (var(10):=8011)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-85
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -6
air.velocity = -2.2,-3.2

[State 240, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 240, ChangeState]
type = ChangeState
triggerall = command = "forward_b"
trigger1 = time = 0
value = 241
ctrl = 0

[State 250, ChangeState]
type = ChangeState
triggerall =var(7)!=1 && prevstateno = 230
trigger1 = command = "y" && movehit
value = 310
ctrl = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 250, ChangeState]
type = ChangeState
triggerall= var(7)>=1 && prevstateno = 230 && roundstate=2
triggerall= (p2bodydist x=[0,56]) && (p2bodydist y=[-50,50]) && p2statetype!=L
trigger1= movehit && random<333
value = 310
ctrl = 0
;---------------------------------------------------------------------------
; Standing strong kick
[Statedef 241]
type = S
movetype= A
physics = S
juggle = 5
poweradd = 0
ctrl = 0
facep2 = 1
velset = 0,0
anim = 241
sprpriority = 2

[State 240, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 1, 2

[State 240, Width]
type = Width
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 303, Position]
type = PosAdd
trigger1 = (AnimElemTime(9) = 0) || (AnimElemTime(10) = 0) || (AnimElemTime(11) = 0)
x = Ifelse (AnimElemTime(9) = 0, 6, Ifelse(AnimElemTime(10) = 0, 5, 1))

[State 240, 2]
type = HitDef
trigger1 = time = 0
attr = S, NA
animtype = Medium
damage = 53
getpower = 100,100
guardflag = MA
hitflag = MAF
pausetime = 6,12
priority=4,Hit
sparkno = -1 * (var(10):=8011)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-64
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -6
air.velocity = -2.2,-3.2

[State 240, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 250, ChangeState]
type = ChangeState
triggerall = var(7)!=1 && prevstateno!= [200,230]
trigger1 = command = "b" && movehit
value = 320
ctrl = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(8)>=0
movetype=I

[State 250, ChangeState]
type = ChangeState
triggerall= var(7)>=1 && (prevstateno!= [200,230]) && roundstate=2
triggerall= (p2bodydist x=[0,56]) && (p2bodydist y=[-50,50]) && p2statetype!=L
trigger1= ctrl && random<333
value = 320
ctrl = 0
;---------------------------------------------------------------------------
; Standing fierce kick
[Statedef 250]
type = S
movetype= A
physics = S
juggle = 5
poweradd = 20
ctrl = 0
facep2 = 1
velset = 0,0
anim = 250
sprpriority = 2

[State 250, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 1, 3

[State 250, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 100, 2
channel = 0

[State 250, Width]
type = Width
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 250, 2]
type = HitDef
trigger1 = animelem = 7
attr = S, NA
animtype = Hard
damage = 68
getpower = 150,150
guardflag = MA
hitflag = MAF
pausetime = 12,12
priority=4,Hit
sparkno = -1 * (var(10):=8012)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-66
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -6
air.velocity = -2.2,-3.2

[State 250, 2]
type = HitDef
trigger1 = animelem = 8
trigger1= !movecontact && !movereversed
attr = S, NA
animtype = Hard
damage = 68
getpower = 150,150
guardflag = MA
hitflag = MAF
pausetime = 12,12
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-87
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -6
air.velocity = -2.2,-3.2

[State 250, ChangeState]
type = ChangeState
triggerall = command = "forward_c"
trigger1 = time = 0
value = 251
ctrl = 0

[State 250, ChangeState]
type = ChangeState
triggerall = var(7)!=1 && prevstateno = 240
trigger1 = command = "z" && movehit
value = 300
ctrl = 0

[State 250, ChangeState]
type = ChangeState
triggerall= var(7)>=1 && prevstateno = 240 && roundstate=2
triggerall= (p2bodydist x=[0,56]) && (p2bodydist y=[-50,50]) && (p2statetype!=L)
trigger1 = movehit && random<333
value = 300
ctrl = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 250, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Forward fierce kick
[Statedef 251]
type = S
movetype= A
physics = S
juggle = 5
poweradd = 20
ctrl = 0
facep2 = 1
velset = 0,0
anim = 251
sprpriority = 2

[State 251, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 1, 3

[State 251, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 100, 2
channel = 0

[State 251, Width]
type = Width
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 304, Position]
type = PosAdd
trigger1 = (AnimElemTime(2) = 0) || (AnimElemTime(15) = 0)
x = Ifelse((AnimElemTime(2) = 0), 22, 1)

[State 243, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
animtype = Hard
damage = 62
getpower = 150,150
guardflag=HA
hitflag = MAF
pausetime = 6,12
priority=4,Hit
sparkno = -1 * (var(10):=8012)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-29
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -6
air.velocity = -2.2,-3.2

[State 251, 1]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 250, ChangeState]
type = ChangeState
triggerall = var(7)!=1
trigger1 = command = "b" && movehit
value = 320
ctrl = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 250, ChangeState]
type = ChangeState
triggerall= var(7)>=1 && roundstate=2
triggerall= (p2bodydist x=[0,56]) && (p2bodydist y=[-50,50]) && p2statetype!=L
trigger1= movehit && random<333
value = 320
ctrl = 0

;---------------------------------------------------------------------------
;Chain 1
[Statedef 300]
type = C
movetype= A
physics = C
juggle = 6
poweradd = 0
velset = 0,0
ctrl = 0
facep2 = 1
facep2 = 1
anim = 420
sprpriority = 2

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem=1
x = 15

[State 420, 1]
type = PlaySnd
trigger1 = animelem = 5
value = 1, 3

[State 420, 2]
type = HitDef
trigger1 = time = 0
attr = S, NA
damage = 66
getpower = 50,50
animtype = Medium
hitflag = MAF
guardflag = M
pausetime = 12,12
priority=4,Hit
sparkno = -1 * (var(10):=8012)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-65
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -4
air.velocity = -3,-4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 420, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
; Chain 2
[Statedef 310]
type = S
movetype= A
physics = S
juggle = 4
poweradd = 0
ctrl = 0
velset = 0,0
anim = 210
sprpriority = -1

[State 210, Width]
type = Width
triggerall = anim = 210
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 210, 1]
type = PlaySnd
triggerall = anim = 210
trigger1 = animelem = 2
value = 1, 2

[State 210, 2]
type = HitDef
triggerall = anim = 210
trigger1 = AnimElem = 3
attr = S, NA
animtype = Medium
damage = 46
getpower = 50,50
hitflag = MAF
guardflag = MA
pausetime = 6,12
priority=4,Hit
sparkno = -1 * (var(10):=8011)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-82
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 13
ground.velocity = -5.5
air.velocity = -2.5,-4

[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 250, ChangeState]
type = ChangeState
triggerall = var(7)!=1 && prevstateno = 240
trigger1 = command = "z" && movehit
value = 300
ctrl = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 250, ChangeState]
type = ChangeState
triggerall= var(7)>=1 && prevstateno = 240 && roundstate=2
triggerall= (p2bodydist x=[0,56]) && (p2bodydist y=[-50,50]) && p2statetype!=L
trigger1= movehit && random<300
value = 300
ctrl = 0
;---------------------------------------------------------------------------
; Chain 3
[Statedef 320]
type = S
movetype= A
physics = S
juggle = 5
poweradd = 0
ctrl = 0
facep2 = 1
velset = 0,0
anim = 240
sprpriority = 2

[State 204, Position]
type = Posadd
trigger1 = (Time = 0) || (AnimElemTime(2) = 0) || (AnimElemTime(12) = 0) || (AnimElemTime(15) = 0)
x = Ifelse (Time = 0, 7, ifelse (AnimElemTime(2) = 0, -1, ifelse (AnimElemTime(12) = 0, -3, -3)))

[State 240, 1]
type = PlaySnd
triggerall = anim = 240
trigger1 = animelem = 4
value = 1, 2

[State 240, Width]
type = Width
triggerall = anim = 240
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 240, 2]
type = HitDef
triggerall = anim = 240
trigger1 = animelem = 5
attr = S, NA
animtype = Medium
damage = 46
getpower = 50,50
guardflag = MA
hitflag = MAF
pausetime = 6,12
priority=4,Hit
sparkno = -1 * (var(10):=8011)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-85
hitsound = s2,2
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -6
air.velocity = -2.2,-3.2

[State 240, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

[State 250, ChangeState]
type = ChangeState
triggerall = var(7)!=1 && prevstateno= 241||prevstateno= 210
trigger1 = command = "z" && movehit
value = 330
ctrl = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 250, ChangeState]
type = ChangeState
triggerall= var(7)>=1 && (prevstateno= 241||prevstateno= 210) && roundstate=2
triggerall= (p2bodydist x=[0,56]) && (p2bodydist y=[-50,50]) && p2statetype!=L
trigger1= movehit && random<333
value = 330
ctrl = 0
;---------------------------------------------------------------------------
; Chain 4
[Statedef 330]
type = S
movetype= A
physics = S
juggle = 4
poweradd = 0
ctrl = 0
facep2 = 1
velset = 0,0
anim = 220
sprpriority = 2

[State 202, Position]
type = PosAdd
triggerall = anim = 220
trigger1 = (AnimElemTime(2) = 0) || (AnimElemTime(10) = 0) || (AnimElemTime(11) = 0)
x = Ifelse((AnimElemTime(2) = 0) || (AnimElemTime(10) = 0), 5, 9)

[State 220, Width]
type = Width
triggerall = anim = 220
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 220, 1]
type = PlaySnd
triggerall = anim = 220
trigger1 = animelem = 3
value = 1, 3

[State 220, 1]
type = PlaySnd
triggerall = anim = 220
trigger1 = animelem = 3
value = 100, 1
channel = 0

[State 220, 2]
type = HitDef
triggerall = anim = 220
trigger1 = AnimElem = 4
attr = S, NA
animtype = Hard
damage = 67
getpower = 50,50
guardflag = MA
hitflag = MAF
pausetime = 8,14
priority=4,Hit
sparkno = -1 * (var(10):=8012)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-73
hitsound = s2,3
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -5.5
air.velocity = -2.5,-4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 220, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;Crouching light punch
[Statedef 400]
type = C
movetype= A
physics = C
juggle = 5
poweradd = 0
ctrl = 0
facep2 = 1
anim = 400
sprpriority = 2

[State 400, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 1, 1

[State 400, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 23
getpower = 50,50
animtype = Light
hitflag = MAF
guardflag = MA
pausetime = 10,11
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-49
hitsound = s2,1
guardsound = s6,0
ground.type = Low
ground.slidetime = 4
ground.hittime = 10
ground.velocity = -4
air.velocity = -1.5,-3

[State 400, 3]
type = CtrlSet
trigger1 = Time = 5
value = 1

[State AttackDone]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 400, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11

;---------------------------------------------------------------------------
;Crouching strong punch
[Statedef 410]
type = C
movetype= A
physics = C
juggle = 6
poweradd = 10
ctrl = 0
facep2 = 1
anim = 410
sprpriority = 2

[State 410, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 1, 2

[State 410, Width]
type = Width
trigger1 = (AnimElemTime (2) >= 0) && (AnimElemTime (7) < 0)
value = 15,0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = 6

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 8
x = -4

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 9
x = -2

;This is the first hit, triggered on the 3rd element of animation.
[State 410, 2]
type = HitDef
trigger1 = AnimElem = 3
attr = C, NA
damage = 47
getpower = 100,100
animtype = Medium
hitflag = MAF
guardflag = MA
pausetime = 9,11
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-55
hitsound = s2,2
guardsound = s6,0
ground.type = Low
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -4
air.velocity = -3,-4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 410, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
;Crouching fierce punch
[Statedef 420]
type = C
movetype= A
physics = C
juggle = 6
poweradd = 20
ctrl = 0
facep2 = 1
anim = 420
sprpriority = 2

[State 420, 1]
type = PlaySnd
trigger1 = animelem = 5
value = 1, 3

[State 420, 2]
type = HitDef
trigger1 = time = 0
attr = C, NA
damage = 66
getpower = 150,150
animtype = Medium
hitflag = MAF
guardflag = MA
pausetime = 12,12
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-65
hitsound = s2,3
guardsound = s6,0
ground.type = Low
ground.slidetime = 12
ground.hittime = 15
ground.velocity = -4
air.velocity = -3,-4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

[State 420, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Crouching light kick
[Statedef 430]
type = C
movetype= A
physics = C
juggle = 5
poweradd = 0
ctrl = 0
facep2 = 1
anim = 430
sprpriority = 2

[State 430, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 1, 1

[State 430, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 28
getpower = 50,50
animtype = Light
hitflag = MAF
guardflag = L
pausetime = 12,12
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-30
hitsound = s2,1
guardsound = s6,0
ground.type = Low
ground.slidetime = 6
ground.hittime = 10
ground.velocity = -5
air.velocity = -2,-3
down.velocity = -5,0
down.hittime = 20

[State AttackDone]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 430, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
;Crouching strong kick
[Statedef 440]
type = C
movetype= A
physics = C
juggle = 5
poweradd = 10
ctrl = 0
facep2 = 1
anim = 440
sprpriority = 2

[State 440, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 1, 2

[State 404, Position]
type = PosAdd
trigger1 = Time = 0 || AnimElem = 2 || AnimElem = 3 || AnimElem = 6 || AnimElem = 7 || AnimElem = 13
x = Ifelse (Time = 0, 2, Ifelse ((AnimElem = 2), 12, Ifelse((AnimElem = 3), 11, Ifelse ((AnimElem = 6), -12, Ifelse ((AnimElem = 7), -13, 0)))))

[State 440, 2]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 46
getpower = 100,100
hitflag = MAF
guardflag = L
pausetime = 12,12
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-11
hitsound = s2,2
guardsound = s6,0
ground.type = Trip
ground.slidetime = 10
ground.hittime = 15
ground.velocity = -1.5,-2
air.velocity = -1.2,-3
guard.velocity = -5
fall = 1

[State AttackDone]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

[State 440, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Crouch Fierce Kick
[Statedef 450]
type = C
movetype= A
physics = C
juggle = 7
poweradd = 20
ctrl = 0
facep2 = 1
anim = 450
sprpriority = 2

[State 450, 2]
type = nothitby
trigger1 = prevstateno = 750
value = SCA

[State 450, 2]
type = PlaySnd
trigger1 = animelem = 2
value = 1, 3

[State 450, 2]
type = PlaySnd
trigger1 = animelem = 2
value = 100, 4
channel = 0

[State 405, Position]
type = PosAdd
trigger1 = AnimElem = 3 || AnimElem = 6 || AnimElem = 7 || AnimElem = 8 || AnimElem = 11 || AnimElem = 12  || AnimElem = 13 || AnimElem = 14  || AnimElem = 19 || AnimTime = 0
x = Ifelse ((AnimElem = 3), 9, Ifelse ((AnimElem = 6) || (AnimElem = 8), 6, Ifelse((AnimElem = 7), 12, Ifelse ((AnimElem = 11), -19, Ifelse ((AnimElem = 12) || (AnimElem = 13), -6, Ifelse (AnimTime = 0, 0, -1))))))

[State 450, 3]
type = HitDef
trigger1 = Time = 0
attr = C, NA
damage = 72
getpower = 150,150
hitflag = MAF
guardflag = L
pausetime = 12,18
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-10
hitsound = s2,3
guardsound = s6,0
ground.type = Trip
ground.slidetime = 12
ground.hittime = 16
ground.velocity = -1,-12
air.velocity = -1,-12
guard.velocity = -8
airguard.velocity = -3, -7
fall = 1
yaccel = .6

[State AttackDone]
type=statetypeset
trigger1= animelemtime(10)>=0
movetype=I

[State 450, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1
;---------------------------------------------------------------------------
;Jump Light Punch
[Statedef 600]
type = A
movetype= A
physics = A
juggle = 2
poweradd = 0
ctrl = 0
anim = 600
sprpriority = 2

[State 600, 1]
type = PlaySnd
trigger1 = animelem = 3
value = 1, 1

[State 600, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 20
getpower = 50,50
guardflag = HA
hitflag = MAF
pausetime = 7,8
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-89
hitsound = s2,1
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
air.slidetime = 18
air.hittime = 18
ground.velocity = -4
air.velocity = 1,-3

[State AttackDone]
type=statetypeset
trigger1= animelemtime(4)>=0
movetype=I

[State 600, 3]
type = CtrlSet
trigger1 = Time = 17
value = 1

;---------------------------------------------------------------------------
;Jump Strong Punch
[Statedef 610]
type = A
movetype= A
physics = A
juggle = 4
poweradd = 10
ctrl = 0
anim = 610
sprpriority = 2

[State 610, 2]
type = PlaySnd
trigger1 = animelem = 3
value = 1, 2

[State 610, 3]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 49
getpower = 100,100
guardflag = HA
hitflag = MAF
pausetime = 10,10
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-89
hitsound = s2,2
guardsound = s6,0
animtype = Med
ground.type = High
ground.slidetime = 15
ground.hittime = 15
air.slidetime = 18
air.hittime = 18
ground.velocity = -5
air.velocity = -1.3,-4

[State AttackDone]
type=statetypeset
trigger1= animelemtime(5)>=0
movetype=I

;--------------------------------------------------------------
;Jump Fierce Punch
[Statedef 620]
type = A
movetype= A
physics = A
juggle = 4
poweradd = 20
ctrl = 0
anim = 620
sprpriority = 2

[State 620, 2]
type = PlaySnd
trigger1 = animelem = 3
value = 1, 3

[State 620, 3]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 72
getpower = 150,150
guardflag = HA
hitflag = MAF
pausetime = 12,12
priority=4,Hit
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-83
hitsound = s2,3
guardsound = s6,0
animtype = Med
ground.type = High
ground.slidetime = 18
ground.hittime = 18
air.slidetime = 18
air.hittime = 18
ground.velocity = -5
air.velocity = -13,9
air.fall = 1
fall.recover = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(7)>=0
movetype=I

;---------------------------------------------------------------------------
;Jump Light Kick
[Statedef 630]
type = A
movetype= A
physics = A
juggle = 3
poweradd = 0
ctrl = 0
anim = 630
sprpriority = 2

[State 630, 1]
type = PlaySnd
trigger1 = animelem = 2
value = 1, 1

[State 630, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 26
getpower = 50,50
guardflag = HA
hitflag = MAF
priority=4,Hit
pausetime = 8,8
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-74
hitsound = s2,1
guardsound = s6,0
ground.type = High
ground.slidetime = 12
ground.hittime = 12
air.slidetime = 18
air.hittime = 18
ground.velocity = -4
air.velocity = 1,-3

[State AttackDone]
type=statetypeset
trigger1= animelemtime(13)>=0
movetype=I

;---------------------------------------------------------------------------
;Jump Strong Kick
[Statedef 640]
type = A
movetype= A
physics = A
juggle = 4
poweradd = 10
ctrl = 0
anim = 640
sprpriority = 2

[State 640, 2]
type = PlaySnd
trigger1 = animelem = 3
value = 1, 2

[State 640, 3]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 49
getpower = 100,100
guardflag = HA
hitflag = MAF
priority=4,Hit
pausetime = 10,10
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-74
hitsound = s2,2
guardsound = s6,0
animtype = Med
ground.type = High
ground.slidetime = 15
ground.hittime = 15
air.slidetime = 18
air.hittime = 18
ground.velocity = -5
air.velocity = -1.3,-2

[State AttackDone]
type=statetypeset
trigger1= animelemtime(12)>=0
movetype=I
;---------------------------------------------------------------------------
;Jump Fierce Kick
[Statedef 650]
type = A
movetype= A
physics = A
juggle = 4
poweradd = 20
ctrl = 0
anim = 650
sprpriority = 2

[State 650, 2]
type = PlaySnd
trigger1 = animelem = 3
value = 1, 3

[State 650, 3]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 73
getpower = 150,150
guardflag = HA
hitflag = MAF
priority=4,Hit
pausetime = 12,12
sparkno = -1 * (var(10):=8010)**0
guard.sparkno= -1 * (var(17):=8000)**0
sparkxy = -10 + 0*(var(12):=77), var(13):=-46
hitsound = s2,3
guardsound = s6,0
animtype = Hard
ground.type = High
ground.slidetime = 18
ground.hittime = 18
air.slidetime = 18
air.hittime = 18
ground.velocity = -5
air.velocity = -13,9
air.fall = 1
fall.recover = 0

[State AttackDone]
type=statetypeset
trigger1= animelemtime(9)>=0
movetype=I

;---------------------------------------------------------------------------
;Kung Fu Throw - Attempt
; CNS difficulty: medium-advanced
[Statedef 800]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2

[State 800, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, NT
hitflag = M-
priority = 1, Miss
sparkno = -1
sprpriority = 1
p1facing = ifelse (command = "holdback", -1, 1)
p2facing = 1
guard.dist = 0         ;Force p2 to face KFM
p1stateno = 810       ;On success, KFM changes to state 810
;p2stateno = 820       ;If hit, p2 changes to state 820 in KFM's cns
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1

[State AttackDone]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Kung Fu Throw - Throwing the opponent
[Statedef 810]
type = S
movetype =  A
physics = S
anim = 810
sprpriority = -2
velset = 0, 0

[State 0, TargetState]
type = TargetState
trigger1 = time = 0
value = 820

[State 810, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 800, 0
channel = 1

[State 810, Effect]
type = PlaySnd
trigger1 = animelem = 6
value = 1, 3

[State 810, Effect]
type = PlaySnd
trigger1 = animelem = 5
value = 100, 4
channel = 0

[State 810, 1]
type = Playerpush
trigger1 = 1
value = 0

[State 0, Explod]
type = Explod
trigger1 = AnimElemTime(2)>=0
anim = 811
ID = 811
postype = p1
pos = 0,0
scale = ceil(1*const(size.xscale)), ceil(1*const(size.yscale))
sprpriority = 5
persistent = 0

[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElemTime(1)>=0 && AnimElemTime(2)<0
pos = 53, 0

[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElemTime(2)>=0 && AnimElemTime(3)<0
pos = -41, -54

[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElemTime(3)>=0 && AnimElemTime(4)<0
pos = -37, -53

[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElemTime(4)>=0 && AnimElemTime(5)<0
pos = -32, -54

[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElemTime(5)>=0 && AnimElemTime(6)<0
pos = -22, -58

[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElemTime(6)>=0 && AnimElemTime(7)<0
pos = -8, -66

[State 0, Width]
type = Width
trigger1 = time = 0
edge = 60,0

[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElem = 7
pos = 74, -67

[State 810, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Thrown by Kung Fu Throw
; (a custom gethit state)
[Statedef 820]
type = A
movetype =  H
physics = N
velset = 0,0
sprpriority = -1

[State 820, screenbound]
type = screenbound
trigger1 = AnimElemTime(6) < 0
movecamera = 0
value = 1

[State 820, 1]
type = ChangeAnim2
trigger1 = Time = 0
value = 820

[State 820, 2]
type = ChangeAnim
trigger1 = animtime = 0
value = 5160

[State 820, 3]
type = SprPriority
trigger1 = animelem = 4
value = 2

[State 820, 4]
type = SprPriority
trigger1 = animelem = 5
value = -1

[State 820, 6]
type = VelSet
triggerall = anim = 820
trigger1 = AnimElemTime(7) = 0
x = -7.5
y = -4

[State 820, 7]
type = veladd
trigger1 = AnimElemTime(7) >= 0
y = 0.7

[State 820, 8]
type = EnvShake
triggerall = anim = 5160
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 15

[State 820, 9]
type = LifeAdd
triggerall = anim = 5160
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = ceil((-147)*(const(data.attack)*0.01))

[State 820, 10]
type = SelfState
triggerall = anim = 5160
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
;---------------------------------------------------------------------------
;Kung Fu Throw - Attempt
; CNS difficulty: medium-advanced
[Statedef 900]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2

[State 800, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, NT
hitflag = M-
priority = 1, Miss
sparkno = -1
sprpriority = 1
p1facing = ifelse (command = "holdback", -1, 1)
p2facing = 1
guard.dist = 0         ;Force p2 to face KFM
p1stateno = 910       ;On success, KFM changes to state 810
;p2stateno = 920       ;If hit, p2 changes to state 820 in KFM's cns
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1              ;Force p2 into falling down

[State AttackDone]
type=statetypeset
trigger1= animelemtime(3)>=0
movetype=I

[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;Kung Fu Throw - Throwing the opponent
[Statedef 910]
type = S
movetype =  A
physics = S
anim = 910
sprpriority = -2
velset = 0, 0

[State 0, TargetState]
type = TargetState
trigger1 = time = 0
value = 920

[State 810, Effect]
type = PlaySnd
trigger1 = Time = 0
value = 800, 0
channel = 1

[State 810, Effect]
type = PlaySnd
trigger1 = animelem=4||animelem=11||animelem=18||animelem=26||animelem=32||animelem=39
value = 1, 3
channel = 1

[State 810, Effect]
type = PlaySnd
trigger1 = animelem=5||animelem=12||animelem=19||animelem=26||animelem=33||animelem=40
value = 100, 0
channel = 0

[State 810, Effect]
type = PlaySnd
trigger1 = animelem=6||animelem=13||animelem=20||animelem=27||animelem=34||animelem=41
value = 2, 3
channel = 3

[State 3000, Charge]
type = helper
helpertype = normal
trigger1 = animelem=6||animelem=13||animelem=20||animelem=27||animelem=34||animelem=41
pos = 53, -66
stateno = 8012
sprpriority = 5

[State 0, Explod]
type = Explod
trigger1 = AnimElemTime(2)>=0
anim = 911
ID = 911
pos = 0,0
postype = p1
facing = 1;ifelse (command = "holdback", -1, 1)
sprpriority = 4
persistent = 0

[State 0, Width]
type = Width
trigger1 = time = 0
edge = 60,0

[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElemTime(45)<0
pos = 53, -66

[State 1310, Bind 6]
type = TargetBind
trigger1 = AnimElemTime(45)=0
pos = 53, -15

[State 1310, Bind 6]
type = TargetState
trigger1 = AnimElemTime(45)=0
value = 921

[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem=6||animelem=13||animelem=20||animelem=27||animelem=34||animelem=41
value = ceil((-24)*(const(data.attack)*0.01))

[State 810, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 105
ctrl = 0
;---------------------------------------------------------------------------
;Opponent Pounded
[Statedef 920]
type = A
movetype = H
physics = N
sprpriority = 2
velset = 0,0

[State 811, Anim]
type = ChangeAnim2
Trigger1 = Time = 0
value = 920

[State 811, Screen]
type = ScreenBound
trigger1 = 1
Value = 1
movecamera = 1,0

;---------------------------------------------------------------------------
;Opponenet Thrown
[Statedef 921]
type = A
movetype = H
physics = N
anim = 5030
sprpriority = 1
poweradd = 40
velset = -4,-8

[State 812, Gravity]
type = Gravity
Trigger1 = 1

[State 812, Screen]
type = ScreenBound
trigger1 = 1
Value = 1
movecamera = 1,0

[State 812, StateChange]
type = SelfState
trigger1 = AnimTime = 0
value = 5035

