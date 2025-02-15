Dn  ← 0.6  # duration of a Ch in seconds
Bar ← 6    # duration of a bar in seconds
V   ← 0.2  # volume
S   ← &asr # sample rate

JoinB   ← ∧(⊂°□):[] ⇌
Silence ← ×0⇡⌊×S
Fade    ← × ⇌ ÷⟜(⇡)⧻.
Tone    ← ×V /+∿ ⊞× : ×τ ÷⟜(⇡⌊×)S
MkNotes ← JoinB ≡(□ ⊂ (Fade Tone Dn °□⊣:) Silence°□⊢.)

ChRoot ← ∵({(↥0 -Dn ÷:⊙: Bar) [330]}◌) ⇡.
ChN₁   ← ∵({(↥0 -Dn ÷:⊙: Bar) [415]}◌) ⇡.
ChN₂   ← ∵({(↥0 -Dn ÷:⊙: Bar) [220]}◌) ⇡.
ChN₃   ← ∵({(↥0 -Dn ÷:⊙: Bar) [247]}◌) ⇡.
# [E, G#, B, D]
Ch₁ ← ∵({(↥0 -Dn ÷:⊙: Bar) [330 415 493 293]}◌) ⇡.
# [A, C#, E, G]
Ch₂ ← ∵({(↥0 -Dn ÷:⊙: Bar) [220 277 324 392]}◌) ⇡.
# [B, D#, F#, A]
Ch₃ ← ∵({(↥0 -Dn ÷:⊙: Bar) [247 311 370 440]}◌) ⇡.

Bar₁ ← ++ (MkNotes ChRoot 10) (MkNotes ChN₂ 6) (MkNotes Ch₂ 4)
Bar₂ ← ++ (MkNotes ChRoot 10) (MkNotes ChN₃ 6) (MkNotes Ch₃ 4)
Bar₃ ← ++ (MkNotes ChRoot 10) (MkNotes ChN₁ 6) (MkNotes Ch₁ 4)

Samples ← ⊟. JoinB [Bar₁ Bar₂ Bar₃ Bar₂]
&ap Samples
&fwa "./5-polyrhythms/output.wav" audio "wav" S Samples
