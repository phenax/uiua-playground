W ← 600    # width
H ← 600    # height
S ← ÷2 W   # size of segment
I ← 12     # iterations
E ← 0.0001 # error for 0

StartLine ← [(ℂ: (-(÷2 S) ÷2 W) ÷3 H) (ℂ: (+(÷2 S) ÷2 W) ÷3 H)]

ArcTan   ← ⨬(°∿ ÷ √+1×. .)(×η±) =∞⌵ .
Quadrant ← ⍣(π ⍤. × ⊙(≤0) ≤0|η◌ ⍤.<0|(+πη) ⍤.<0◌|0◌◌)
Theta    ← +⊙(Quadrant ∩(⨬∘(0◌) ≤E⌵.))⌵ ArcTan◡÷: ⊙-- ⊙: ∩(°ℂ)
Split    ← ⊂⊂: +,ℂ: ⊙×× ⊙, ⊙⊙(◡(÷√2⌵-)) ⊃(∿+η)∿ +(÷2η) ◡Theta°⊟
Join     ← ⊂ ⨬∘(↙-1⧻.) =◡(⊓⊣⊢)
Curve    ← ⍥(/Join ≡Split ⧈∘2)I StartLine

IsOnLine  ← ◌: <0.1 ⌵- /+ ⊙(⌵-⊃⊢⊣)◡(⌵-)
IsOnCurve ← ≥1 /+ ≡(⨬(0◌)IsOnLine ◡(≤S⌵-⊢)) ⧈∘2 Curve
ToPix     ← ⨬(0_0_0)(⊂: 0.3_0.05 +0.1 ÷W ◌°ℂ) IsOnCurve.
Img       ← ∵ToPix (⍉ ⊞(ℂ:) ⇡W⇡H)
&fwa "./3-levy-c-curve/output.png" img "png" Img
