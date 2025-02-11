W ← 600 # width
H ← 600 # height
S ← 4   # size of segment
I ← 12  # iterations

StartLine ← [(ℂ: (-(÷2 S) ÷2 W) (÷2 H)) (ℂ: (+(÷2 S) ÷2 W) (÷2 H))]
Rotate    ← +× ⊙⤚- ℂ: ∿+η ⊙∿.
Dragon    ← ⍥(⊂ Rotate η ⊣. ⊙(↘1) ⇌.)I StartLine

# Center the image
MinX           ← /↧ ◌°ℂ Dragon
MaxX           ← /↥ ◌°ℂ Dragon
MinY           ← /↧ ◌:°ℂ Dragon
MaxY           ← /↥ ◌:°ℂ Dragon
CenteredDragon ← +ℂ: (-MinX ÷2 +MinX -MaxX W) (-MinY ÷2 +MinY -MaxY H) Dragon

IsOnLine   ← ◌: <0.01 ⌵- /+ ⊙(⌵-⊃⊢⊣)◡(⌵-)
IsOnDragon ← ≥1 /+ ≡(⨬(0◌)IsOnLine ◡(≤S⌵-⊢)) ⧈∘ 2 CenteredDragon

ToPix ← ⨬(0_0_0)(⊂: 0.3_0.05 +0.1 ÷W ◌°ℂ) IsOnDragon.
Img   ← ∵ToPix (⍉ ⊞(ℂ:) ⇡W⇡H)
&fwa "./2-dragon/output.png" img "png" Img
