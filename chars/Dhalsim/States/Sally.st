; _________________________________________
;| Dhalsim by Knuckles8864                 |
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;==
;====<SALLY>===
;==

;===<SPECTATE>==
[StateDef 10000]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0
facep2 = 0
sprpriority = -65536

[State 10000, Look to Left]
type = ChangeAnim
trigger1 = RootDist x < 0
trigger1 = Anim != 10000
value = 10000

[State 10000, Look to Right]
type = ChangeAnim
trigger1 = RootDist x > 0
trigger1 = Anim != 10001
value = 10001

; Clap
[State 10000, Into Clap]
type = ChangeState
trigger1 = NumEnemy
trigger1 = !EnemyNear,HitOver
trigger2 = Root,StateNo = 811 || Root,StateNo = 812 || Root,StateNo = 1501 || Root,StateNo = 1511 || Root,StateNo = 1521 || Root,StateNo = 1531
value = 10010

; Look Away
[State 10000, Into Looking Away]
type = ChangeState
trigger1 = !Root,HitOver
trigger2 = Root,HitFall
trigger3 = Root,StateNo = 175
trigger4 = Root,MoveType = H
value = 10020

; Taunt
[State 10000, Into Taunt]
type = ChangeState
trigger1 = Root,StateNo = [195, 196]
trigger1 = !Root,AnimElemTime(1)
trigger1 = Random < 125
value = 10025

; Win / Lose
[State 10000, Into Win/Lose]
type = ChangeState
trigger1 = Root,Win
trigger1 = Root,StateNo = [181, 189]
trigger2 = Root,Lose
trigger2 = Root,StateNo = 170 || Root,StateNo = 5150
value = cond(root,win, 10030, 10040)

; Simul Lose
[state 10000, End State]
type = ChangeState
trigger1 = Root,StateNo = 5150
value = 10040



;===<CLAP>==
[StateDef 10010]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0
facep2 = 0

[State 10010, Clap to the Left]
type = ChangeAnim
trigger1 = RootDist x < 0
trigger1 = Anim != 10010
value = 10010

[State 10010, Clap to the Right]
type = ChangeAnim
trigger1 = RootDist x > 0
trigger1 = Anim != 10011
value = 10011

; Spectate
[State 10010, Back to Watching]
type = ChangeState
trigger1 = Time > 96
trigger1 = !AnimTime
trigger1 = NumEnemy
trigger1 = EnemyNear,Hitover
value = 10000

; Look Away
[State 10010, Look Away This Time]
type = ChangeState
trigger1 = !Root,HitOver
trigger2 = Root,HitFall
value = 10020

; Win / Lose
[State 10010, Win or Lose Real Smooth]
type = ChangeState
trigger1 = Root,Win
trigger1 = Root,StateNo = [181, 189]
trigger2 = Root,Lose
trigger2 = Root,StateNo = 170 || Root,StateNo = 5150
value = cond(root,win, 10030, 10040)

; Simul Lose
[State 10010, Fall at Same Time Now]
type = ChangeState
trigger1 = Root,StateNo = 5150
value = 10040



;===<LOOK AWAY>==
[StateDef 10020]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0
facep2 = 0

[State 10020, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = 10020

; Shake Head
[State 10020, Begin to Shake Head]
type = ChangeAnim
trigger1 = Anim = 10020
trigger1 = AnimElemNo(0) = 7
trigger1 = Root,MoveType = H
value = 10021

; Shake Head
[State 10020, Keep Shaking Head]
type = ChangeAnim
trigger1 = Anim = 10021
trigger1 = AnimElemNo(0) = 1
trigger1 = Root,MoveType != H
value = 10022

; Spectate
[State 10020, Back to Watching]
type = ChangeState
trigger1 = !AnimTime
trigger1 = Anim = 10020 || Anim = 10022
value = 10000

; Clap
[State 10020, Clap Now Y'all]
type = ChangeState
trigger1 = Root,HitOver
trigger1 = !Root,HitFall
trigger1 = NumEnemy
trigger1 = !EnemyNear,HitOver
value = 10010

; Win / Lose
[State 10010, Win or Lose Real Smooth]
type = ChangeState
trigger1 = Root,Win
trigger1 = Root,StateNo = [181, 189]
trigger2 = Root,Lose
trigger2 = Root,StateNo = 170 || Root,StateNo = 5150
value = cond(root,win, 10030, 10040)

; Simul Lose
[State 10010, Fall at Same Time Now]
type = ChangeState
trigger1 = Root,StateNo = 5150
value = 10040



;===<TAUNT>==
[StateDef 10025]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0
facep2 = 0

[State 10025, Jump for Joy Left]
type = ChangeAnim
trigger1 = RootDist x < 0
trigger1 = !Time
value = 10030

[State 10025, Jump for Joy Right]
type = ChangeAnim
trigger1 = RootDist x > 0
trigger1 = !Time
value = 10031

[State 10025, Voice]
type = PlaySnd
trigger1 = !AnimElemTime(4)
value = 10000, 0

; Spectate
[State 10025, Back to Watching]
type = ChangeState
trigger1 = !AnimTime
value = 10000



;===<WIN>==
[StateDef 10030]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0
facep2 = 0

[State 10030, Jump for Joy Left]
type = ChangeAnim
triggerall = RootDist x < 0
trigger1 = !Time
trigger2 = !AnimTime
trigger2 = Anim != 10030
value = 10030

[State 10030, Jump for Joy Right]
type = ChangeAnim
triggerall = RootDist x > 0
trigger1 = !Time
trigger2 = !AnimTime
trigger2 = Anim != 10031
value = 10031

[State 10030, Voice]
type = PlaySnd
trigger1 = !AnimElemTime(4)
value = 10000, 0
persistent = 0



;===<LOSE>==
[StateDef 10040]
type = S
physics = S
movetype = I
ctrl = 0
velset = 0, 0
facep2 = 0

[State 10040, Awww...]
type = ChangeAnim
trigger1 = !Time
value = 10040
