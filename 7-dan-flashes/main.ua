W   ← 400 # width
H   ← 400 # height
S   ← 0.1 # scale
F   ← 50  # number of frames for gif
Fps ← 10  # frame rate for gif

ToPixel ← ⍣(
  1_0.84_0 ⍤.≤0.1⌵
| 0_0_0 ⍤.≤0.44⌵
| 0_0.34_0.72 ⍤.≤0.8⌵
| 0.16_0.16_0.21
)

Sq ← :⊃∿(∿+η) +∩(×.)
# xsin(ax)cos(ax)cos(x^2 + y^2) = ysin(ax)cos(ax)sin(x^2 + y^2)
Equation ← -⊙×× ⊙: ⊙⊙(∩(××⊃∿(∿+η).) ⊙×⊸×⊙:) ◡Sq °ℂ

Grid ← ⊞ℂ ∩(÷S -0.5 ÷W) ⇡H⇡W
Img  ← ∵(ToPixel Equation: 1) Grid
&fwa "./7-dan-flashes/output.png" img "png" Img

Frames ← ≡(∵(ToPixel Equation) Grid) +0.2×5÷F⇡F
&fwa "./7-dan-flashes/output.gif" gif Fps Frames
