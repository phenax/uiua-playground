Dn  ← 0.6  # duration of a Ch in seconds
Bar ← 6    # duration of a bar in seconds
V   ← 0.2  # volume
S   ← &asr # sample rate

JoinB   ← ∧(⊂°□):[] ⇌
Silence ← ×0⇡⌊×S
Fade    ← × ⇌ ÷⟜(⇡)⧻.
Tone    ← ×V /+∿ ⊞× : ×τ ÷⟜(⇡⌊×)S
MkNotes ← JoinB ≡(□ ⊂ (Fade Tone Dn °□⊣:) Silence°□⊢.)

ChX     ← ∵({(↥0 -Dn ÷:⊙: Bar) ⊂[]:}◌) ⇡.
ChXHalf ← ∵({(↥0 -Dn ÷:⊙: ÷2Bar) ⊂[]:}◌) ⇡.

ChRoot ← ChX: [165]

ChN₁  ← ChX: [185]
ChN₂  ← ChX: [123]
ChN₃₁ ← ChXHalf: [207]
ChN₃₂ ← ChXHalf: [247]

# [F#, C#, E, A]
Ch₁ ← ∵({(↥0 -Dn ÷:⊙: Bar) [185 277 329 440]}◌) ⇡.
# [B, F#, A, D#]
Ch₂ ← ∵({(↥0 -Dn ÷:⊙: Bar) [123 185 220 311]}◌) ⇡.
# [E, B, D#, G#]
Ch₃ ← ∵({(↥0 -Dn ÷:⊙: Bar) [165 247 311 415]}◌) ⇡.

Bar₁ ← ++ (MkNotes ChRoot 10) (MkNotes ChN₁ 6) (MkNotes Ch₁ 4)
Bar₂ ← ++ (MkNotes ChRoot 10) (MkNotes ChN₂ 6) (MkNotes Ch₂ 4)
Bar₃ ← ++ (MkNotes ChRoot 10) (⊂ (MkNotes ChN₃₁ 3) (MkNotes ChN₃₂ 3)) (MkNotes Ch₃ 4)

Samples ← ⊟. JoinB [Bar₁ Bar₂ Bar₃ Bar₂]
&ap Samples
&fwa "./5-polyrhythms/output.wav" audio "wav" S Samples
