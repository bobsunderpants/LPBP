# Bondi–Sachs–Penrose formalism for \(\Lambda>0\): status, derived framework, and formal core

## 1. Direct answer

No complete rigorous Bondi–Sachs–Penrose package is currently available for a generic isolated system with \(\Lambda>0\).

The \(\Lambda=0\) package has all of the following: a null \(\mathscr I^\pm\), characteristic well-posedness, an intrinsic Bondi news tensor, a no-incoming-radiation condition, Bondi mass loss and positivity, BMS symmetries, NP peeling, and a standard scattering framework. For \(\Lambda>0\), \(\mathscr I^\pm\) is spacelike, so most of that structure has no direct analogue. There are partial constructions (Friedrich asymptotics, conformal Einstein data, AldS charges and flux laws, super-Poynting radiation detectors, and proposal-level cut-news tensors), but the central news-square/positivity theorem is open.

This report separates:

* **Rigorous from the literature**: detector theorems, AldS charge/flux results, and the sign-dependent radiation criteria.
* **Derived here**: a concrete conformal–Bondi flux framework and a Bondi-gauge obstruction showing why naive news fails.
* **Formal/heuristic**: candidate cut-news decompositions and Codazzi-type constructions.
* **Open**: the actual news tensor with positive flux representation, no-incoming radiation, peeling, and a controlled \(\Lambda\to0\) limit.

A consolidated LaTeX manuscript with a bibliography is available as `LambdaPositive_Bondi_Article.tex`, with BibTeX database `lambda_positive_bondi.bib`; the compiled PDF is `LambdaPositive_Bondi_Article.pdf`.

---

## 2. Benchmark against the full \(\Lambda=0\) package

| Benchmark | \(\Lambda=0\) Bondi–Sachs–Penrose | \(\Lambda>0\) status |
|---|---|---|
| Infinity | null \(\mathscr I^\pm\) | spacelike \(\mathscr I^\pm\) |
| Gauge / well-posedness | characteristic Cauchy problem, Bondi gauge | conformal Cauchy problem at spacelike \(\mathscr I\); no universal Bondi gauge |
| News | intrinsic \(N_{AB}\) on 2-cuts | no accepted intrinsic news; radiation detector exists |
| No incoming radiation | well-defined at \(\mathscr I^-\) | no universal incoming/outgoing split; all radiation crosses spacelike \(\mathscr I\) |
| Charges/mass loss | Bondi 4-momentum, mass loss, positivity | AldS charges and flux laws; general positivity/rigidity open |
| Symmetries | BMS | Diff/CKV-type proposals; no universal BMS analogue |
| Peeling | NP peeling | no general peeling analogue |
| \(\Lambda\to0\) | built in | singular unless data scale appropriately; rigorous limit open |

Sources supporting the “incomplete package” verdict include Poole–Skenderis–Taylor [arXiv:1812.05369], Ashtekar [arXiv:1706.07482], the conformal Einstein/symplectic-flux analysis [arXiv:2504.20845], and the AldS charge/radiation discussion [arXiv:2512.14243].

---

## 3. Derived AldS conformal–Bondi framework

Let \(\Lambda=3/\ell^2>0\) and let \((M,g)\) be vacuum with cosmological constant. Use a conformal completion in which \(\mathscr I^\pm\) is spacelike and Riemannian with metric \(h_{ij}\).

### 3.1 Free data

Friedrich-type asymptotic data at \(\mathscr I\) are

\[
  (h_{ij},\mathcal T_{ij}),
\]

where \(h_{ij}\) is a Riemannian 3-metric and \(\mathcal T_{ij}\) is symmetric, trace-free and divergence-free with respect to \(h\). In a common normalization,

\[
  \mathcal T_{ij}= -\frac{3\ell}{16\pi G}\,h^{(3)}_{ij},
\]

where \(h^{(3)}_{ij}\) is the third Fefferman–Graham coefficient. Equivalently, \(\mathcal T_{ij}\) is proportional to the electric part of the rescaled Weyl tensor.

### 3.2 Charges

For a boundary vector field \(\xi^i\), define a charge on a 2-cut \(S\subset\mathscr I\) by

\[
  Q_\xi[S] = \int_S \mathcal T^{ij}\xi_i n_j\,dS ,
\]

where \(n_j\) is the unit normal within \(\mathscr I\) to the cut \(S\).

Because \(\nabla^i\mathcal T_{ij}=0\), if \(\xi\) is a conformal Killing vector of \(h_{ij}\), then the current \(j^i=\mathcal T^{ij}\xi_j\) is divergence-free. Hence \(Q_\xi[S]\) is cut-independent for such \(\xi\).

### 3.3 Flux law

For a 3-region \(B_{12}\subset\mathscr I\) between cuts \(S_1\) and \(S_2\),

\[
  Q_\xi[S_2]-Q_\xi[S_1]
    = -\int_{B_{12}} \mathcal T^{ij}D_i\xi_j\,d\mu .
\]

This is the AldS analogue of the Bondi balance law. It is rigorous at the level of the conformal boundary calculus once the free data and divergence identities are assumed.

A useful refinement of the news target follows from the linearity of the flux in \(\xi\). If the charge flux \(F_\xi=\Delta Q_\xi\) is homogeneous of degree one in \(\xi\), then a single \(\xi\)-independent density \(\sigma\ge0\) cannot satisfy \(F_\xi=-\int\sigma\,d\mu\) for all \(\xi\) unless \(F_\xi=0\): applying the representation to \(2\xi\) gives \(2F_\xi=F_\xi\). Thus a viable news representation must either fix a particular translation, use a \(\xi\)-dependent weight linear in \(D_{(i}\xi_{j)}\), or replace one scalar square by bilinear pairings. The finite-dimensional core is formalized as `LinearFluxObstruction.no_nonzero_constant_square`.

### 3.4 Why naive Bondi news is obstructed

In a direct Bondi-gauge expansion for \(\Lambda>0\), the order-\(r^{-1}\) angular metric coefficient \(\gamma_1\) is not free data. One obtains schematically

\[
  \Lambda\gamma_1
  =
  -\frac32 e^{-2\beta_0}
  \left(
    \cot\theta\,U_0
    - U_{0,\theta}
    - 2U_0\gamma_{0,\theta}
    - 2\gamma_{0,u}
  \right),
\]

up to convention-dependent signs and normalizations. Thus \(\gamma_1\) is fixed by lower-order fields for \(\Lambda>0\), whereas at \(\Lambda=0\) the analogous shear coefficient is the free Bondi news candidate. This is a local reason why a naive flat-space news tensor does not survive.

---

## 4. Radiation detector for \(\Lambda>0\)

Let \(N_\alpha=\partial_\alpha\Omega\), with \(N^\alpha N_\alpha=-\Lambda/3\). The canonical unit timelike normal to spacelike \(\mathscr I\) is

\[
  n_\alpha=\sqrt{3/\Lambda}\,N_\alpha .
\]

Define the electric and magnetic parts of the rescaled Weyl tensor \(d_{\alpha\beta\gamma\delta}\):

\[
  D_{ab}=n^\mu n^\nu d_{a\mu b\nu},\qquad
  C_{ab}=n^\mu n^\nu {}^\star d_{a\mu b\nu}.
\]

Here \(C_{ab}\) is proportional to the Cotton–York tensor \(Y_{ab}\) of \((\mathscr I,h)\); e.g. \(C_{ab}=-\sqrt{3/\Lambda}\,Y_{ab}\) in one common normalization. Other papers use \(C_{ab}=-3Y_{ab}/\Lambda\) or different Cotton-York factors. The zero condition is unchanged by these nonzero constants.

The canonical asymptotic super-Poynting vector is, up to a nonzero \(\Lambda\)-dependent factor,

\[
  p_i
    = 2\epsilon_i{}^{jk}C_{j\ell}D^{\ell}{}_k
    = \epsilon_i{}^{jk}[C,D]_{jk}.
\]

For \(\Lambda>0\):

\[
  \boxed{\text{no radiation} \iff p_i=0 \iff [C,D]=0.}
\]

This follows because \(D\) and \(C\) are symmetric and \([C,D]\) is skew; the Hodge dual on skew \(3\times3\) matrices is injective.

This criterion is a **detector**, not yet a news tensor. It tells you whether radiation is present, but it does not by itself supply a symmetric trace-free tensor \(N_{AB}\) on cuts with \(\Delta Q_\xi=-\int N_{AB}N^{AB}\).

### 4.1 Why \(\Lambda<0\) is different

For \(\Lambda<0\), \(\mathscr I\) is Lorentzian and there is no canonical timelike normal observer. The criterion must hold for all unit timelike observers tangent to \(\mathscr I\). This yields

\[
  \text{no radiation} \iff D_{ab}\ \text{and}\ C_{ab}\ \text{are proportional},
\]

not merely commuting. Commuting symmetric tensors can share an eigenframe without being proportional. Explicit photon-rocket Robinson–Trautman examples with \(\Lambda<0\) have \([C,D]=0\) but nonzero radiation. This does not contradict the \(\Lambda>0\) commutation theorem, which uses a distinguished normal observer.

---

## 5. What should count as news?

The following choices are not sufficient by themselves:

* \(h^{(3)}_{ij}\sim\mathcal T_{ij}\): part of the free data, not a news tensor;
* Cotton–York \(C_{ij}\): intrinsic to the boundary geometry and cannot encode the free radiative data alone;
* the commutator \([C,D]\) or its dual \(p_i\): a no-radiation detector, but only a 3-vector of independent components and not a positive-square flux integrand.

The working proposal from the 2022 super-Poynting program is cut-wise:

\[
  N_{AB}=V_{AB}+M_{AB},
\]

where \(V_{AB}\) is fixed by the intrinsic geometry of \((\mathscr I,h)\) and the cut, while \(M_{AB}\) is solved for from a Codazzi-type equation sourced by a one-form \(X_A\). The research problem is to define \(X_A\) from \((\mathscr I,h,\mathcal T)\) so that:

1. the Codazzi equation is solvable;
2. \(X_A=0\iff p_i=0\iff[C,D]=0\);
3. \(\Delta Q_\xi=-\int N_{AB}N^{AB}\,d\mu\le0\);
4. \(N_{AB}\to N^{\mathrm{Bondi}}_{AB}\) as \(\Lambda\to0\);
5. incoming/outgoing radiation can be separated in a scattering setup.

No such construction is proved here.

---

## 6. Lean formalization

Two Lean files were produced and verified.

### 6.1 Core Lean scaffold

`/home/bob/Documents/Default Project/LambdaPositiveBondi_Plan.lean`

Uses `Int` and no Mathlib import. It proves:

* `conserved_of_flux_free`;
* `charge_nonincreasing`;
* `equal_charge_iff_zero_flux`;
* `toy_charge_nonincreasing`.

The genuinely open items are explicit structures/definitions:

* `RigidityTarget`;
* `DesiredNewsConstruction`.

Check:

```sh
cd "/home/bob/Documents/Default Project"
lean LambdaPositiveBondi_Plan.lean
```

### 6.2 Mathlib scaffold

`/home/bob/Documents/Default Project/pnp-mathlib/PNP/LambdaPositiveBondi.lean`

Uses `ℝ` and Bochner integrals over a measure on the 3-boundary. It preserves the symbols:

* `AldSFluxModel`, `FluxFreeVector`;
* `conserved_of_flux_free`, `charge_nonincreasing`, `equal_charge_iff_zero_flux`;
* `RigidityTarget`, `DesiredNewsConstruction`;
* `Toy.toyMeasure`, `Toy.toyModel`, `Toy.toy_charge_nonincreasing`.

It adds the finite-dimensional radiation algebra:

* `BoundaryRadiation.SymTensor3`;
* `Cotton`, `Stress`;
* `commutator`, `superPoynting`;
* `CanonicalSuperPoyntingZero`, `CommutatorZero`, `NoRadiation`;
* `canonicalSuperPoyntingZero_iff_commutatorZero`;
* `noRadiation_iff_commuting`;
* `Proportional`, `NegativeNoRadiation`, `proportional_implies_commutatorZero`;
* `CandidateRadiationData`, `DetectorNewsTarget`;
* `NewsRepresentationTarget`, `NewsPositivityTarget`;
* conditional implications such as `noRadiation_of_candidate_news_zero` and `charge_nonincreasing_of_candidate_news`;
* the exact-solution tests `rocket_noRadiation_iff` and `outgoing_noRadiation_iff`;
* the algebraic outgoing-square identity `outgoing_superPoynting_normal`;
* the abstract outgoing-flux structure `OutgoingCutData` with `normalFlux_nonpos` and `normalFlux_eq_zero_iff`;
* the conditional cut-news skeleton `CutNews.CutNewsCandidate` with `CutNews.source_zero_iff_news_zero`, `CutNews.news_zero_iff_detector_zero`, and `CutNews.news_nonzero_iff_radiation`;
* the linearized-detector algebra `scaleSym`, `commutator_scaleSym_scaleSym`, `superPoynting_scaleSym_scaleSym`, and `linearized_superPoynting_is_quadratic`;
* the pointwise news-square obstruction `NewsSquareObstruction.no_linear_pointwise_square`;
* the charge-linearity obstruction `LinearFluxObstruction.no_nonzero_constant_square`;
* the open target `DesiredCutNewsConstruction`.

Checks:

```sh
cd "/home/bob/Documents/Default Project/pnp-mathlib"
lake env lean PNP/LambdaPositiveBondi.lean
lake build PNP.LambdaPositiveBondi
```

All checks pass with no errors. The module does not assert open physics as axioms: the unresolved theorem is represented as a structure that nobody currently inhabits.

---

## 7. Continuation results

### Sign-dependent criteria in Lean

The Mathlib file now also defines `Proportional` and `NegativeNoRadiation` for the \(\Lambda<0\) criterion, and proves

```lean
proportional_implies_commutatorZero
```

together with an explicit commuting-but-not-proportional trace-free example. Thus the strict inequality between the \(\Lambda>0\) and \(\Lambda<0\) no-radiation criteria is mechanized at the finite-dimensional algebra level.

### Exact Robinson–Trautman-dS test

Using the orthonormal-frame data of arXiv:2608.31129, eq. (35), the file defines

```lean
rocketStress (m p q)
rocketCotton (p q)
```

and proves that the canonical detector vanishes exactly when \(p=q=0\), i.e. for the generalized Kinnersley non-radiating rockets. This is a concrete exact-solution check of the detector, not a news-square theorem.

### Conditional outgoing-flux positivity

For a compact cut \(\mathcal S\subset\mathscr I^+\), the condition \(Q_-^\mu=0\) isolates the outgoing radiative component. In that case arXiv:2208.05436, eqs. (80)–(84), gives

\[
  p_m=\bar p_a m^a
      =-2(\hat C_{AB}\hat C^{AB}+C_A C^A)\le0,
      \qquad p_m=0\Rightarrow \bar p_a=0.
\]

The Lean structure `OutgoingCutData` encodes this as an abstract positive flux law, with proved consequences `normalFlux_nonpos` and `normalFlux_eq_zero_iff`. Supplying the geometric types and proving the flux identity remain research work.

### Cut-news reduction

The cut-wise construction \(N_{AB}=V_{AB}+M_{AB}\) is now sharper. For a compact spherical cut \(S\subset\mathscr I^+\), the intrinsic piece is

\[
  V_{AB}=S_{AB}-\frac12\Sigma_A{}^D\Sigma_{BD}
         +\frac{\varkappa}{2}\Sigma_{AB}
         +\frac{\varkappa^2}{8}q_{AB}-\rho_{AB},
\]

where \(\rho_{AB}\) is the unique Codazzi tensor of trace \(K\) (round gauge: \(\rho_{AB}=Kq_{AB}/2\)). The remaining piece \(M_{AB}\) is trace-free and solves a Codazzi equation sourced by \(X_{CAB}=2q_{B[C}X_{A]}\). Solvability requires

\[
  \int_S \xi^A X_A\,dS=0
\]

for every conformal Killing vector \(\xi^A\) of the cut. In the Hodge decomposition \(X_A=\epsilon_A{}^B D_Bx+D_AX\), this removes the \(s=1\) harmonics; constants are gauge. Thus the real open input is a gauge-invariant one-form \(X_A\), or equivalently a dimensionless function \(f\), made from \((\mathscr I,h,\mathcal T)\) whose vanishing characterizes no radiation.

The ansatz \(X_A=\Delta f\,D_Af\) automatically satisfies the CKV orthogonality by Lemma 4 of arXiv:2208.05436, and \(X_A=0\) iff \(f\) is constant. Under the outgoing condition \(\mathcal Q_-^\mu=0\), the stress is fixed by the Cotton tensor up to one Coulombian component, so \(f\) should be built from the Cotton Hodge potentials and Cotton one-form potentials. No choice with the correct zero set is known.

The constraints are sharper than a mere dimensional analogy. \(X_A\) has conformal weight \(\omega^{-2}\), whereas the canonical super-Poynting vector has weight \(\omega^{-5}\); a scalar built directly from \([C,\mathcal F]\) therefore cannot serve as the gauge-invariant dimensionless \(f\) without additional conformal factors. The Hodge decomposition \(X_A=\epsilon_A{}^BD_Bx+D_AX\) leaves \(x,X\) ambiguous by constants, while the six CKV conditions remove their \(s=1\) parts; the admissible \(X_A\) is an \(s\ge2\) harmonic expansion. The ansatz \(X_A=\Delta f\,D_Af\) selects a special subfamily whose vanishing means \(f\) is constant, not \(f=0\). Since the Cotton/\(\mathcal F\) potentials themselves are ambiguous by \(s=0,1\) harmonics, no canonical \(f\) has been extracted from them. The paper gives no equation linking \(X_A\) to \(\bar p_a\) or \(Q_-^\mu\); the link is only the requirement that \(M_{AB}\) carry the \(\mathcal F_{ab}\)-dependence absent from \(V_{AB}\).

In the outgoing sector, Proposition 2 of arXiv:2208.05436 gives
\[
  Q_-^\mu=Q_+^\mu=0
  \iff Q_-^\mu=0,\ p_m=0
  \iff Q_-^\mu=0,\ \bar p_a=0
  \iff \hat{\mathcal F}_{AB}=\hat C_{AB}=0,\quad \mathcal F_A=C_A=0 .
\]
This is the strongest available rigidity statement: \(p_m\) and \(Q_+^\alpha\) are pure Cotton/intrinsic quantities, while only \(p_A\) retains the Coulombian scalar \(\mathcal F^E{}_E\).

The Mathlib file now encodes the conditional logic as `CutNews.CutNewsCandidate`. Uniqueness of the trace-free Codazzi solution gives `CutNews.source_zero_iff_news_zero`, matching the paper's target \(X_A=0\iff N_{AB}=0\). If one additionally assumes `source_zero_iff_detector`, the theorem `CutNews.news_zero_iff_detector_zero` follows. This is conditional; it does not supply the geometric \(X_A\) or \(f\).

### Scaling obstruction for naive news candidates

A tensor built only as the STF part of the super-Poynting vector cannot represent the AldS charge flux: \(p_i\) is linear in the holographic stress \(D_{ij}\), so such a tensor is at least linear in \(D\), and its square is at least quadratic, whereas the AldS flux \(\mathcal T^{ij}D_i\xi_j\) is linear in \(\mathcal T\). This rules out the most naive “dual of the detector” news candidates and motivates the cut-wise \(V_{AB}+M_{AB}\) program.

A second, sharper obstruction concerns the simple pointwise ansatz under the outgoing condition \(Q_-^\mu=0\). There the available cut data are a trace-free Cotton tensor \(\hat C_{AB}\) and an independent Cotton one-form \(C_A\), with

\[
-p_m=2(\hat C_{AB}\hat C^{AB}+C_A C^A)\ge0.
\]

Suppose one tries a linear combination \(N_{AB}=L(\hat C)_{AB}+K(C)_{AB}\) whose pointwise square is exactly \(\hat C^2+C^2\). Setting one input to zero forces \(L\) and \(K\) to be norm-preserving linear maps; polarizing the identity forces \(L(\hat C)\cdot K(C)=0\) for all inputs. Since an isometry of the two-dimensional space of STF cut tensors is surjective, choose \(C\ne0\) and \(\hat C\) with \(L(\hat C)=K(C)\ne0\), giving a nonzero cross term, a contradiction. The Mathlib file proves the finite-dimensional core as `NewsSquareObstruction.no_linear_pointwise_square`. Hence the outgoing positive density cannot be obtained by a purely linear pointwise news-square ansatz; total-derivative or cut-Codazzi corrections are essential.

### Linearized de Sitter waves

Work in TT gauge on the round \(S^3\) boundary of de Sitter,

\[
h_{ij}=\ell^2(q_{ij}+\varepsilon\kappa_{ij}),\qquad
D^i\kappa_{ij}=0,\qquad q^{ij}\kappa_{ij}=0.
\]

Using the FG relation \(D_{ij}=-\tfrac32h^{(3)}_{ij}\) and \(\mathscr C_{ij}=-\ell^2Y_{ij}\), a direct variation on the unit round \(S^3\) gives

\[
\delta P_{ij}=-\tfrac12(\Delta+1)\kappa_{ij},\qquad
\delta Y_{ij}
=
-\tfrac12\,\epsilon_{(i}{}^{kl}D_k(\Delta+1)\kappa_{j)l}.
\]

The detector becomes

\[
\bar{\mathcal P}_i
=
3\ell^2\,\epsilon_i{}^{jk}
Y_{j\ell}h^{(3)\ell}{}_k ,
\]

up to the common nonzero normalization. Thus:

* around **pure de Sitter**, \(Y^{(0)}=D^{(0)}=0\), so both \(Y\) and \(h^{(3)}\) are \(O(\varepsilon)\) and \(\bar{\mathcal P}_i=O(\varepsilon^2)\). The super-Poynting detector has no linearized first-order part; it cannot itself serve as linear Bondi news.
* around a **nonradiating Coulomb background** such as Kottler, \(Y^{(0)}=0\) but \(D^{(0)}\ne0\), so \(\bar{\mathcal P}^{(1)}_i=3\ell^2\epsilon_i{}^{jk}\delta Y_{j\ell}D^{(0)\ell}{}_k\) can be linear in the wave.

The Mathlib file records the bilinear algebra as `commutator_scaleSym_scaleSym`, `superPoynting_scaleSym_scaleSym`, and `linearized_superPoynting_is_quadratic`.

The independent Hamiltonian analysis of Ashtekar–Bonga–Kesavan gives explicit TT modes

\[
h_{\vec k}^{(s)}
 =
 -2H\left[
 E_{\vec k}^{(s)}\left(\eta\cos k\eta-k^{-1}\sin k\eta\right)
 -
 B_{\vec k}^{(s)}\left(\eta\sin k\eta+k^{-1}\cos k\eta\right)
 \right],
\]

with boundary rescaled Weyl data \(\mathcal E_{ab}|_{\mathscr I^+}=k^2E\,\mathfrak e_{ab}\), \(\mathcal B_{ab}|_{\mathscr I^+}=k^2B\,{}^\ast\mathfrak e_{ab}\). Their gauge-invariant quadratic charges include

\[
\mathcal H_T
 =
 \frac{1}{2H\kappa}\int_{\mathscr I^+}
 \mathcal E_{cd}
 \left(\mathcal L_T h_{ab}+2Hh_{ab}\right)
 \mathring q^{ac}\mathring q^{bd}.
\]

The \(B=0\) branch preserves conformal flatness of the first-order boundary geometry and carries zero energy, momentum and angular momentum; it is not a radiative branch in that linear theory. These quadratic Hamiltonian fluxes are robust, but they are not a nonlinear news tensor.

### Conformal phase-space obstruction

In the conformal Einstein/symplectic analysis for \(\Lambda>0\), the Geroch–Xanthopoulos regularization used at \(\Lambda=0\) fails: flat-space perturbations may be rescaled to \(O(\Omega)\), whereas the \(\Lambda>0\) consistency conditions force \(O(1)\) boundary falloff. The resulting presymplectic flux is nevertheless finite and nonzero,

\[
\bm F_\xi
 =
 \frac{\ell}{16\pi G}\int_{\mathscr I^+}
 |\tilde\gamma|^{1/2}
 \delta\tilde e^{ab}
 \mathcal L_{\tilde\xi}\delta\tilde\gamma_{ab}.
\]

This supplies a phase-space flux at spacelike \(\mathscr I^+\), but it does not identify a local news tensor or a mass-aspect positivity theorem.

### Flat-limit status

For a controlled retarded one-parameter family with \(H=\sqrt{\Lambda/3}\), source scale \(D_o\ll\ell\), \(H\Delta t_{\rm source}\ll1\), and finite source duration, Ashtekar–Bonga–Kesavan show that the de Sitter quadrupole flux approaches Einstein’s quadrupole formula in the physical \((t,\vec x)\) chart; the tail term is \(O(H)\) and vanishes as \(H\to0\). This is the best available controlled \(\Lambda\to0\) statement.

It is not a universal boundary limit. Generic homogeneous dS waves can carry arbitrarily negative energy with respect to dS time translations, all dS Killing fields become spacelike near \(\mathscr I^+\), and the Bondi-gauge obstruction

\[
\Lambda\gamma_1
 =
 -\frac32 e^{-2\beta_0}
 \left(\cot\theta\,U_0-U_{0,\theta}-2U_0\gamma_{0,\theta}-2\gamma_{0,u}\right)
\]

requires the bracket to be \(O(\Lambda)\) for \(\gamma_1\) to stay finite as \(\Lambda\to0\). Without that scaling the flat limit is singular. At the symmetry level, flux formulas can pass continuously to Bondi form while the asymptotic symmetry algebra jumps: the much smaller \(\Lambda>0\) algebra gives way to BMS as \(\Lambda\to0\). The recovery of no-incoming-radiation Bondi–Sachs–Penrose data has further subtle differences. A candidate AldS news must therefore be accompanied by a no-incoming/outgoing condition and a scaling prescription; the detector alone does not provide one.

## 8. Exact-solution benchmark

The following data were extracted with \(\ell^2=3/\Lambda\), \(\kappa^2=8\pi G\), and FG convention
\[
 ds^2=\frac{\ell^2}{\rho^2}\left[-d\rho^2+
 \big(g^{(0)}_{ij}+\rho^2g^{(2)}_{ij}+\rho^3g^{(3)}_{ij}+\cdots\big)dx^idx^j\right],
\]
\[
 T_{ij}=-\frac{3\ell^2}{2\kappa^2}g^{(3)}_{ij}.
\]

* **de Sitter.** \(g^{(0)}=d\Omega_3^2\), \(g^{(3)}=0\), \(T_{ij}=0\), \(M=J=0\), \(C_{ab}=F_{ab}=0\), \(p_a=0\). This is the exact non-radiating reference solution.
* **Kottler / Schwarzschild–de Sitter.** \(g^{(0)}=dt^2+d\Omega_2^2\),
  \(g^{(3)}=-\frac{2m}{3\ell}(2dt^2-d\Omega_2^2)\), hence
  \(T_{ij}=\frac{m}{8\pi G}(2dt^2-d\Omega_2^2)\). The charges are \(Q^+_{\partial_t}=m/G\), \(Q^-_{\partial_t}=-m/G\), \(H=2m/G\); \(M=2m/G\), \(J=0\). Boundary Cotton vanishes and \(p_a=0\), as expected for spherical symmetry.
* **Kerr–de Sitter.** With \(\Xi=1+a^2/\ell^2\), the charges are \(M=2m/(\Xi^2G)\), \(J=2am/(\Xi^2G)\). In the Kerr-dS-like family, \(C_{ab}\) and \(F_{ab}\) are proportional through a conformal Killing vector, so \([C,F]=0\) and \(p_a=0\). Exact Kerr–de Sitter is conformally flat in these data.
* **Robinson–Trautman-dS.** The boundary metric is \(g^{(0)}=dt^2+\frac{6}{\Lambda}e^{\hat\Phi}dzd\bar z\). The Cotton and stress components satisfy
  \(C_{zz}=-i\frac{\Lambda}{3}\kappa^2T_{zz}\), \(C_{tz}=-i\frac{\Lambda}{3}\kappa^2T_{tz}\), plus conjugates. Generic RT-dS data radiate by the super-Poynting detector. The known flux laws include
  \[
    -\int_{B_{12}}\mathbf F_\xi
      =\frac{2m}{\kappa^2}\int_{B_{12}}\partial_t(\hat\sigma^{-3})\,dt\,d\Omega_0\le0,
  \]
  for the Bondi-mass representative \(f=1/\hat\sigma\), and
  \[
    -\int\mathbf F_C=\frac{m}{2\kappa^2}\frac{dC}{dt}\le0
  \]
  for the Calabi functional \(C=\int R_2^2d\Omega\). These are genuine monotonicity results in this restricted class, not a general positivity theorem. With the Bondi-time translation and a different representative, the flux contains an additional \(\Lambda\)-dependent term,
  \[
    \frac{dE}{du_B}
      =-\frac{\epsilon^2}{16\pi G}\oint d^2S
        \left[
          (\dot f''-\cot\theta\,\dot f')^2
          +\frac{3m}{\ell^2}\partial_{u_B}(f'^2)
        \right],
  \]
  so positivity is representative-dependent even inside RT-dS.
* **Photon rockets.** For the \(\Lambda>0\) pure-radiation RT family, the orthonormal-frame super-Poynting vector is
  \(\bar{\mathcal P}^{\hat a}=-2(p^2+q^2)\delta^{\hat a}{}_{\hat1}+4q(m-p)\delta^{\hat a}{}_{\hat2}\). Its vanishing is equivalent to \(p=q=0\), i.e. to the generalized Kinnersley non-radiating rockets; this is the exact check encoded in Lean as `rocket_noRadiation_iff`.
* **C-metric with \(\Lambda>0\).** The conformal-boundary data give
  \(\bar{\mathcal P}^a=\sqrt{3/\Lambda}\,18\alpha m^2S^{9/2}(1+6S\alpha^2/\Lambda)\delta^a_p\), nonzero for acceleration \(\alpha\neq0\) and vanishing iff \(\alpha=0\). The source prints \(D_{ab}\) and \(C_{ab}\) but not \(g^{(3)}\), so the holographic-stress normalization and a flux formula remain to be fixed.

The exact-solution benchmark supports the detector but does not supply the general news-square theorem.

## 9. Concrete research plan

1. **Define the AldS state space (open).** Fix the precise function spaces and constraint set for \((h_{ij},\mathcal T_{ij})\) at spacelike \(\mathscr I^\pm\), including smoothness, trace-free/divergence-free conditions, and conformal rescaling conventions.

2. **Construct a news candidate (partially reduced).** The intrinsic piece \(V_{AB}\) and the Codazzi equation for \(M_{AB}\) are known. The remaining task is to choose a weight-\(\omega^{-2}\), CKV-orthogonal one-form \(X_A\), equivalently a dimensionless function \(f\), from \((\mathscr I,h,\mathcal T)\) whose constancy matches no radiation. The allowed \(X_A\) has only \(s\ge2\) harmonic content; no canonical choice is known.

3. **Prove the flux representation (open).** Show that the AldS charge flux equals \(-\int N_{AB}N^{AB}\,d\mu\), first for linearized de Sitter waves and then generally. The outgoing conditional density \(-p_m=2(\hat C^2+C^2)\) is known, but a linear pointwise tensor square is ruled out by `NewsSquareObstruction.no_linear_pointwise_square`.

4. **Prove positivity and rigidity (open).** Show \(N_{AB}N^{AB}\ge0\), and characterize equality as \([C,D]=0\), equivalently no radiation. This is the central missing theorem.

5. **Formulate no incoming radiation and scattering (partially clarified).** The cut condition \(\mathcal Q_-^\mu=0\) gives a conditional outgoing sector with \(p_m=-2(\hat C_{AB}\hat C^{AB}+C_AC^A)\le0\), but its physical interpretation as a universal no-incoming condition is not established.

6. **Prove a controlled \(\Lambda\to0\) limit (partially clarified).** Controlled retarded quadrupole families do approach the Einstein/Bondi flux, but the boundary limit is singular unless \(U_0,\beta_0,\partial_u\gamma_0\) scale so that the Bondi-gauge bracket is \(O(\Lambda)\). A universal limit is ruled out by the negative-energy/homogeneous-wave pathologies.

The exact-solution validation has been carried out for de Sitter, Kottler/Kerr–de Sitter, Robinson–Trautman-dS, photon rockets, and the C-metric; see section 8. Linearized dS waves are now analyzed at the detector level, including the quadratic-on-dS and linear-on-Coulomb behavior; a linearized news-square theorem remains open. At present the detector criterion, not the full news-square theorem, is the object tested in those examples.

---

## 10. Sources

* Poole, Skenderis & Taylor, *(A)dS\(_4\) in Bondi gauge*, arXiv:1812.05369 — Bondi-gauge \((A)dS_4\) analysis and the \(\gamma_1\) obstruction.
* Ashtekar, *Geometry and Physics of Null Infinity*, arXiv:1706.07482 — benchmark \(\Lambda=0\) package and \(\Lambda>0\) caveats.
* Ciambelli et al., arXiv:2504.20845 — conformal Einstein/symplectic flux and asymptotic charges.
* AldS charge/radiation discussion, arXiv:2512.14243 — boundary charges and radiation caveats.
* Senovilla, *Gravitational radiation at infinity with non-negative cosmological constant*, arXiv:2208.05436v1, 10 Aug 2022 — Theorems 1–3; eqs. (23), (26), (65)–(75); cut-news proposal; incoming/outgoing discussion.
* Fernández-Álvarez & Senovilla, *Characterization of gravitational radiation at infinity with a cosmological constant*, arXiv:2510.07148v1, 8 Oct 2025 — Theorems 1–3; \(D_{ab}\) as FG third coefficient; canonical super-Poynting criterion.
* Fernández-Álvarez & Senovilla, *Asymptotic Gravitational Radiation of Photon Rockets with \(\Lambda\)*, arXiv:2608.31129v1, 31 Aug 2026 — confirms the \(\Lambda>0\) detector; gives \(\Lambda<0\) proportionality counterexamples to commutation.
* Senovilla, *Gravitational radiation and the cosmological constant* / C-metric radiation paper, arXiv:2007.11677v3 — conformal-boundary \(C_{ab},D_{ab}\) and nonzero C-metric super-Poynting data.
* Ashtekar, Bonga & Kesavan, *Asymptotics with a positive cosmological constant II/III*, arXiv:1506.06152, arXiv:1510.05593 — linear dS waves, quadrupole flux, and controlled \(\Lambda\to0\) retarded families.
* arXiv:2306.08029 — asymptotic symmetry algebra changes and emergence of BMS in the \(\Lambda\to0\) limit.
* arXiv:1904.02822 — subtle differences in recovering no-incoming-radiation Bondi–Sachs–Penrose data.
