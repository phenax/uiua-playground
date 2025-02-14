W  ← 400  # width
H  ← 400  # height
S  ← 0.08 # scale
I  ← 30   # max iterations
Ox ← 0    # offset x
Oy ← 0    # offset y

ToPixel ← ⍣(
  0.16_0.16_0.21 ⍤.>0
| 0.09_0.57_0.6 ⍤.≤0.3⌵
| 0.31_0.23_0.64 ⍤.≤0.6⌵
| 0.82_0.06_0.22 ⍤.≤0.9⌵
| 0.31_0.23_0.64 ⍤.≤1.1⌵
| 0.09_0.57_0.6 ⍤.≤1.3⌵
| 0.16_0.16_0.21
  # | 0.74_0.58_0.98
)

Iterations ← - ⊙(∿×2×) ◡(+ ⊓∿(∿+η) ∩(×.)) °ℂ
Img        ← ∵(ToPixel Iterations) ⊞ℂ ∩(÷S -0.5 ÷W) ⊓(-Oy)(-Ox) ⇡H⇡W
&fwa "./4-im-a-sinner/output.png" img "png" Img
