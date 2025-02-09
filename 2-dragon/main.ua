W ← 200
H ← 200
S ← 4
I ← 2

P ← ℂ:

PStart ← [(P (-(÷2 S) ÷2 W) (÷2 H)) (P (+(÷2 S) ÷2 W) (÷2 H))]

RotP       ← +× ⊙⤚- P ∿+η ⊙∿.
Dragon     ← ⍥(⊂ RotP η ⊣. ⇌.)I PStart
IsOnLine   ← <0.01 ⌵- /+ ⊙(⌵-⊃⊢⊣)◡(⌵-) ⊟
IsOnDragon ← ⊙◌ ≥1 /+ ≡(IsOnLine⊃⊢⊣) ⧈∘ 2 Dragon

ToPix ← ⨬(0_0_0)(255_255_255) IsOnDragon

Img ← ∵ToPix (⍉ ⊞P ⇡W⇡H)
&fwa "./2-dragon/output.png" img "png" Img
