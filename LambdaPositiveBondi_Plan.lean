/-
  LambdaPositiveBondi_Plan.lean

  Lean 4 scaffold for the proposed Lambda > 0 Bondi-Sachs research plan.

  IMPORTANT: this file does NOT prove the open differential-geometry/PDE
  conjecture. Nobody currently has that proof. What is formalized here is the
  logical core that any proposed solution must satisfy:

    1. A flux-balance law for charges associated with boundary vector fields.
    2. A conformal Killing vector gives conservation if it kills the flux.
    3. A positive news-square representation gives monotonic Bondi mass.
    4. The genuinely open items remain hypotheses/definitions, not claimed
       theorems.

  Lean core here does not import Mathlib's real numbers, so the scalar type is
  Int. With Mathlib available, replace Int by ℝ everywhere.

  The hard, still-open physics tasks are:
    - construct the intrinsic news tensor N_ij on spacelike I^+;
    - prove the news representation of the AldS flux;
    - prove positivity of the news norm;
    - prove existence/well-posedness of the asymptotic Cauchy problem;
    - formulate no incoming radiation at I^-;
    - recover Bondi-Sachs in a controlled Lambda -> 0 limit.
-/

universe uP uB uC uV uT

namespace LambdaPositiveBondi

/-- A minimal abstract model of the boundary flux calculus on spacelike
    future infinity.  The types track the geometry:

      P : points of the 3-boundary I^+
      B : 3D regions between two cuts
      C : 2D cuts of I^+
      V : boundary vector fields generating charges
      T : tensor type at a boundary point
-/
structure AldSFluxModel (P : Type uP) (B : Type uB) (C : Type uC)
    (V : Type uV) (T : Type uT) where
  region : C → C → B
  future : C → C → Prop
  D : V → P → T
  Tfield : P → T
  Nfield : P → T
  pair : T → T → Int
  integral : B → (P → Int) → Int
  charge : V → C → Int

  integral_zero : ∀ b : B, integral b (fun _ => 0) = 0

  /- Wald-Zoupas/Poole-Skenderis-Taylor type flux-balance law:
       Q(xi, S2) - Q(xi, S1) = - ∫_{B12} T^{ij} D_i xi_j dμ.
  -/
  flux_balance :
    ∀ (ξ : V) (c₁ c₂ : C), future c₁ c₂ →
      charge ξ c₂ - charge ξ c₁ =
        - integral (region c₁ c₂) (fun p => pair (Tfield p) (D ξ p))

  /- Desired news representation of the flux for the chosen time vector:
       Q(xi, S2) - Q(xi, S1) = - ∫_{B12} N_{ij} N^{ij} dμ.
     Constructing such an N_ij is part of the open problem; here it is an
     assumption. -/
  news_balance :
    ∀ (ξ : V) (c₁ c₂ : C), future c₁ c₂ →
      charge ξ c₂ - charge ξ c₁ =
        - integral (region c₁ c₂) (fun p => pair (Nfield p) (Nfield p))

  nonneg_square : ∀ p : P, 0 ≤ pair (Nfield p) (Nfield p)

  integral_nonneg :
    ∀ (c₁ c₂ : C), future c₁ c₂ → ∀ (f : P → Int),
      (∀ p : P, 0 ≤ f p) → 0 ≤ integral (region c₁ c₂) f

/-- Abstract version of "xi is an asymptotic conformal Killing vector whose
    associated flux vanishes": T^{ij} D_i xi_j = 0 pointwise. -/
def FluxFreeVector
    (M : AldSFluxModel P B C V T) (ξ : V) : Prop :=
  ∀ p : P, M.pair (M.Tfield p) (M.D ξ p) = 0

/-- If the flux integrand vanishes pointwise, the charge is conserved. -/
theorem conserved_of_flux_free
    (M : AldSFluxModel P B C V T)
    (ξ : V)
    (hξ : FluxFreeVector M ξ)
    (c₁ c₂ : C) (hfut : M.future c₁ c₂) :
    M.charge ξ c₂ = M.charge ξ c₁ := by
  have hb := M.flux_balance ξ c₁ c₂ hfut
  have hfun :
      (fun p : P => M.pair (M.Tfield p) (M.D ξ p)) = (fun _ : P => 0) := by
    funext p
    exact hξ p
  rw [hfun] at hb
  rw [M.integral_zero] at hb
  omega

/-- If the charge drop is represented by the integral of a nonnegative news
    square, then the charge is monotone nonincreasing. -/
theorem charge_nonincreasing
    (M : AldSFluxModel P B C V T)
    (ξ : V)
    (c₁ c₂ : C) (hfut : M.future c₁ c₂) :
    M.charge ξ c₂ ≤ M.charge ξ c₁ := by
  have hb := M.news_balance ξ c₁ c₂ hfut
  have hI :
      0 ≤ M.integral (M.region c₁ c₂)
        (fun p => M.pair (M.Nfield p) (M.Nfield p)) :=
    M.integral_nonneg c₁ c₂ hfut _ M.nonneg_square
  omega

/-- A zero-flux cut pair iff the corresponding charge difference vanishes. -/
theorem equal_charge_iff_zero_flux
    (M : AldSFluxModel P B C V T)
    (ξ : V)
    (c₁ c₂ : C) (hfut : M.future c₁ c₂) :
    M.charge ξ c₂ = M.charge ξ c₁ ↔
      M.integral (M.region c₁ c₂) (fun p => M.pair (M.Tfield p) (M.D ξ p)) = 0 := by
  constructor
  · intro h
    have hb := M.flux_balance ξ c₁ c₂ hfut
    omega
  · intro hI
    have hb := M.flux_balance ξ c₁ c₂ hfut
    omega

/-- Rigidity would require this implication to hold for the constructed news
    tensor: zero news-square integral iff the news square vanishes pointwise.
    This is not proved here; it is a target of the program. -/
def RigidityTarget
    (M : AldSFluxModel P B C V T) : Prop :=
  ∀ c₁ c₂ : C, M.future c₁ c₂ →
    M.integral (M.region c₁ c₂)
        (fun p => M.pair (M.Nfield p) (M.Nfield p)) = 0 ↔
      ∀ p : P, M.pair (M.Nfield p) (M.Nfield p) = 0

/-- The main open theorem, stated rather than proved:

    For a physically admissible asymptotically locally de Sitter spacetime,
    there exists an intrinsic news tensor N_ij such that the AldS flux law is
    represented by N_ij N^ij and all the above consequences follow.

    This is intentionally a structure, not an axiom: supplying an instance is
    exactly the unsolved mathematical problem. -/
structure DesiredNewsConstruction
    (P : Type uP) (B : Type uB) (C : Type uC)
    (V : Type uV) (T : Type uT) where
  model : AldSFluxModel P B C V T
  intrinsic : True
  recovers_bondi_news : True
  no_incoming_radiation : True
  peeling_statement : True
  lambda_to_zero_limit : True

/- A finite toy model, used only to check that the abstract flux calculus is
   not vacuous.  It is not a spacetime. -/
namespace Toy

abbrev P := Unit
abbrev B := Fin 3 × Fin 3
abbrev C := Fin 3
abbrev V := Unit
abbrev T := Int

def future (c₁ c₂ : C) : Prop :=
  c₁.val ≤ c₂.val

def toyPair (a b : T) : Int :=
  a * b

def toyIntegral (b : B) (f : P → Int) : Int :=
  ((b.2.val : Int) - (b.1.val : Int)) * f ()

def toyCharge (_ : V) (c : C) : Int :=
  - (c.val : Int)

/-- A toy AldS flux model with constant positive news square. -/
def toyModel : AldSFluxModel P B C V T where
  region c₁ c₂ := (c₁, c₂)
  future := future
  D _ _ := 1
  Tfield _ := 1
  Nfield _ := 1
  pair := toyPair
  integral := toyIntegral
  charge := toyCharge

  integral_zero := by
    intro b
    simp [toyIntegral]

  flux_balance := by
    intro ξ c₁ c₂ hfut
    simp [future, toyIntegral, toyCharge, toyPair] at hfut ⊢
    omega

  news_balance := by
    intro ξ c₁ c₂ hfut
    simp [future, toyIntegral, toyCharge, toyPair] at hfut ⊢
    omega

  nonneg_square := by
    intro p
    simp [toyPair]

  integral_nonneg := by
    intro c₁ c₂ hfut f hf
    simp [future] at hfut
    have hΔ : 0 ≤ ((c₂.val : Int) - (c₁.val : Int)) := by omega
    exact Int.mul_nonneg hΔ (hf ())

/-- The abstract monotonicity theorem applies to the toy model. -/
theorem toy_charge_nonincreasing
    (ξ : V) (c₁ c₂ : C) (hfut : future c₁ c₂) :
    toyModel.charge ξ c₂ ≤ toyModel.charge ξ c₁ :=
  charge_nonincreasing toyModel ξ c₁ c₂ hfut

end Toy

end LambdaPositiveBondi
