W   ← 400  # width
H   ← 400  # height
S   ← 0.08 # scale
F   ← 20   # number of frames for gif
Fps ← 10   # frame rate for gif

ToPixel ← ⍣(
  0.16_0.16_0.21 ⍤.>0
| 0.09_0.57_0.6 ⍤.≤0.3⌵
| 0.31_0.23_0.64 ⍤.≤0.6⌵
| 0.82_0.06_0.22 ⍤.≤0.9⌵
| 0.31_0.23_0.64 ⍤.≤1.1⌵
| 0.09_0.57_0.6 ⍤.≤1.3⌵
| 0.16_0.16_0.21
)

Equation ← - ⊙(∿××) ◡(+ ⊓∿(∿+η) ∩(×.)) °ℂ
Grid     ← ⊞ℂ ∩(÷S -0.5 ÷W) ⇡H⇡W
Img      ← ∵(ToPixel Equation: 2) Grid
&fwa "./4-im-a-sinner/output.png" img "png" Img

Frames ← ≡(∵(ToPixel Equation) Grid) ×6 ÷F-÷2F⇡+1F
&fwa "./4-im-a-sinner/output.gif" gif Fps Frames
