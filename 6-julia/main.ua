W   ← 200  # width
H   ← 200  # height
S   ← 0.35 # scale
I   ← 30   # max iterations
Ox  ← 0    # offset x
Oy  ← 0    # offset y
F   ← 24   # number of frames for gif
Fps ← 8    # frame rate for gif

ToPixel ← ⍣(
  0.18_0.2_0.25 ⍤.=I
| 0.92_0.93_0.96 ⍤.≥20
| 0.37_0.5_0.67 ⍤.>13
| 0.64_0.75_0.55 ⍤.>11
| 0.74_0.38_0.41 ⍤.>8
| 0_0_0
)

C          ← ×0.7885 ⁿ(×i)e
Iterations ← ◌:◌: ⌵ ⍢(⊙(+⊙.×.) +1|× ⊙(<100⌵) <I) 0 :C
Grid       ← ⊞ℂ ∩(÷S -0.5 ÷H) ⊓(-Oy)(-Ox) ⇡H⇡W
Img        ← ∵(ToPixel Iterations ×1.62π) Grid
&fwa "./6-julia/output.png" img "png" Img

Frames ← ≡(∵(ToPixel Iterations :) Grid) ×τ÷F⇡F
&fwa "./6-julia/output.gif" gif Fps Frames
