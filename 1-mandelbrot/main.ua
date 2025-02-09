W  ← 400  # width
H  ← 300  # height
S  ← 0.4  # scale
I  ← 30   # max iterations
Ox ← ÷3 W # offset x
Oy ← 0    # offset y

ToPixel ← ⍣(
  0.18_0.2_0.25_1 ⍤.=I
| 0.92_0.93_0.96_1 ⍤.≥20
| 0.37_0.5_0.67_1 ⍤.>13
| 0.64_0.75_0.55_1 ⍤.>11
| 0.74_0.38_0.41_1 ⍤.>8
| 0_0_0_0
)

Iterations ← ◌:◌: ⌵ ⍢(⊙(+⊙.×.) +1|× ⊙(<100⌵) <I) 0 (ℂ 0 0)
Img        ← ∵(ToPixel Iterations) ⊞ℂ ∩(÷S -0.5 ÷H) ⊓(-Oy)(-Ox) ⇡H⇡W

&fwa "./output/mandelbrot.png" img "png" Img
