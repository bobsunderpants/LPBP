# Bondi–Sachs–Penrose formalism for \(\Lambda>0\): status, derived framework, and formal core

## 1. Direct answer

No complete rigorous Bondi–Sachs–Penrose package is currently available for a generic isolated system with \(\Lambda>0\).

The \(\Lambda=0\) package has all of the following: a null \(\mathscr I^\pm\), characteristic well-posedness, an intrinsic Bondi news tensor, a no-incoming-radiation condition, Bondi mass loss and positivity, BMS symmetries, NP peeling, and a standard scattering framework. For \(\Lambda>0\), \(\mathscr I^\pm\) is spacelike, so most of that structure has no direct analogue. There are partial constructions (Friedrich asymptotics, conformal Einstein data, AldS charges and flux laws, super-Poynting radiation detectors, and proposal-level cut-news tensors), but the central news-square/positivity theorem is open.  A restricted rank-two news object does exist in the strongly equipped outgoing sector, where \(n^+_{AB}=2V_{AB}\); it does not close the generic problem.

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
| News | intrinsic \(N_{AB}\) on 2-cuts | no universal intrinsic news; detector and conditional radiant news \(n^+_{AB}=2V_{AB}\) in strongly equipped outgoing sector |
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

The bilinear-pairing option is realized exactly in the linearized de Sitter theory. The renormalized symplectic potential on \(\mathscr I^+\) is \(\Theta=-\frac{\ell}{16\pi G}\int e_{ab}\delta\gamma^{ab}\), so for a de Sitter isometry \(\xi\) the flux is \(\mathcal F_\xi=\frac{\ell}{16\pi G}\int \delta e^{ab}\mathcal L_\xi\delta\gamma_{ab}\). Writing \(h_{ab}=(\delta\gamma_{ab})^{\mathrm{tf}}\), \(E_{ab}=\delta e_{ab}\), and absorbing the constant into \(\varkappa\),
\[
  \mathcal F_\xi=\varkappa\int E^{ab}\mathcal L_\xi h_{ab}.
\]
Because \(D^aE_{ab}=0\) and \(D_{(a}\xi_{b)}=\frac13(D\cdot\xi)\gamma_{ab}\), two integrations by parts give the local Hamiltonian news current
\[
  \mathcal F_\xi=\varkappa\int \xi^cJ_c[h,E],\qquad
  J_c=h_{ab}\big(\tfrac13D_cE^{ab}-D_cE^{ab}\big)
      -2E^{ab}D_a h_{cb}+\tfrac13 E^{ab}D_c h_{ab},
\]
equivalently \(J_c=-\frac23h_{ab}D_cE^{ab}+E^{ab}(\frac13D_ch_{ab}-2D_ah_{cb})\). This is exact \(\xi\)-linearity, gauge invariance on the de Sitter background, and a phase-space news pair \(\mathcal N^{\mathrm H}=(h_{ab},E_{ab})\), not a scalar square. The Ashtekar--Bonga--Kesavan time-translation flux \(\mathcal H_T=\frac1{2H\kappa}\int E^{ab}(\mathcal L_Th_{ab}+2Hh_{ab})\) is a special case and has the controlled positive Minkowski flat limit for smooth retarded families. For their symmetry prescription, the difference of candidate nonlinear AldS charge integrals linearizes precisely to these symplectic flux formulas, so \(\mathcal N^{\mathrm H}\) represents the linearized AldS charge-flux law itself. This does not solve the nonlinear problem: the full de Sitter energy is sign-indefinite under \(E\mapsto-E\), \(B\mapsto B\), and positivity still needs incoming/outgoing restrictions. The finite core is `HamiltonianNewsFlux.Model`, `flux_smul`, `flux_add`, and `flux_zero`.

A crucial reconciliation removes an apparent contradiction with the simpler volume flux law \(Q_\xi[S_2]-Q_\xi[S_1]=-\int \cT^{ij}D_i\xi_j\). If \(\xi\) is a conformal Killing field of the boundary and \(\cT^{ij}\) is trace-free, then \(D_{(i}\xi_{j)}\) is pure trace and \(D_{[i}\xi_{j]}\) is antisymmetric, so \(\cT^{ij}D_i\xi_j=0\) pointwise. Thus the simple volume law is degenerate on exactly the conformal symmetries relevant to de Sitter translations. This agrees with the ABK observation that imposing conformal flatness of \(\mathscr I^+\) from the outset forces all fluxes to vanish. The nonzero Hamiltonian flux survives because the candidate nonlinear charge integrals depend on the full boundary conformal geometry; their linearization involves \(\mathcal L_\xi h_{ab}\), not just the background contraction \(\cT^{ij}D_i\xi_j\). The algebraic core is `CKVFluxDegeneracy.contract_zero`.

Fernández--Álvarez and Senovilla independently show that first-class currents \(y^a=t^{ab}\xi_b\), with \(t^{ab}\) built from \(D_{ab}\), \(C_{ab}\), or their outgoing/incoming parts, have balance laws sourced only by matter and Coulomb contributions; gravitational radiation does not enter. First-class stress/Cotton moments therefore cannot represent AldS radiation flux. A news candidate must involve symplectic/Hamiltonian data, second-class Bel--Robinson currents, or radiant news and its time derivative.

FAS VII.116--VII.119 give the exact second-class Bel--Robinson bitranslation charge
\[
\mathcal R_S=\int_S\alpha^3\left[\tfrac14(W^++W^-)-(Z^++Z^-)+\tfrac32\mathcal V\right]dS,
\qquad
\int_\Delta D_a\mathcal R^a=\mathcal R_{S_2}-\mathcal R_{S_1}.
\]
Under \(Q_-^\mu=0\), \(W^-=Z^-=0\), so using \(W^+=4\hat C^2\) and \(Z^+=4C^2\),
\[
\mathcal R_S=\int_S\alpha^3\left(\hat C^2-4C^2+\tfrac32\mathcal V\right)dS.
\]
This radiative density is indefinite: it vanishes on nonzero news when \(\hat C^2=4C^2\), even though the first-jet square \(s=\hat C^2+C^2>0\). With \(r=\alpha^{-3}\mathcal R_{\rm dens}-\tfrac32\mathcal V=\hat C^2-4C^2\), the two detector magnitudes are separated by \(\hat C^2=(4s+r)/5\) and \(C^2=(s-r)/5\). Thus the second-class charge value is another charge-blind detector, and the missing object is its intrinsic divergence. Under the conditional flat identification \(\mathring n=\mathcal N\), its radiative density has the limit \(N^2r\to\frac14\alpha_\infty-\beta_\infty=\frac12(\mathcal W-\mathcal Z)=|\dot{\mathcal N}|^2-|D\mathcal N|^2\), a time-minus-angular gradient energy rather than a Bondi news square. Since \(r=0<s\) is possible, no scalar multiple of this single charge can reproduce the detector square \(s\); the pair \((s,r)\), or the intrinsic divergence, is needed. Lean: `SecondClassBRCharge.Model`, `outgoing_charge`, `radiative_charge_may_vanish_on_nonzero_news`, `hatC2_from_square_and_charge`, `C2_from_square_and_charge`, `no_scalar_charge_equals_detector_square`, `FlatDetectorModel`, `flat_radiative_charge`, `flat_radiative_charge_detector`.

FAS also give a conserved second-class charge for a triple of conformal Killing fields proportional to the unit normal. In the outgoing sector its density is \(w_{\rm can}=\frac14(W^++4Z^++6\mathcal V)=\hat C^2+4C^2+\frac32\mathcal V\). Combining this with the bitranslation density \(\rho=\hat C^2-4C^2+\frac32\mathcal V\) gives \(\hat C^2=\frac12(w_{\rm can}+\rho-3\mathcal V)\), \(C^2=\frac18(w_{\rm can}-\rho)\), and \(s=\frac18(5w_{\rm can}+3\rho)-\frac32\mathcal V\). Thus the second-class charge family determines the vector detector directly and the tensor detector/detector square only after the Coulomb superenergy is known; it still supplies only charge values, not the intrinsic divergence/flux. Lean: `SecondClassBRCharge.PairModel`, `hatC2_from_superEnergy_and_bitranslation`, `C2_from_superEnergy_and_bitranslation`, `detectorSq_from_superEnergy_and_bitranslation`. At the algebraic level the Coulomb input is not optional: \((\hat C^2,C^2,\mathcal V)=(1,0,0)\) and \((0,0,2/3)\) give the same \((w_{\rm can},\rho)=(1,1)\) but detector squares \(1\) and \(0\). Lean: `pureTensorPair`, `pureCoulombPair`, `pair_charge_blindness`.

The remaining step is now sharply localized. FAS define the second-class bitranslation current \(\cR^a=-\mathcal D^\alpha{}_{\mu\nu\rho}\omega_\alpha{}^a e^\mu{}_b e^\nu{}_c e^\rho{}_d\tau^b\tau^c\tau^d\), write the formal cut balance \(\int_\Delta D_a\cR^a\epsilon=\cR_{S_2}-\cR_{S_1}\), and explicitly state that computing \(D_a\cR^a\) requires \(\mathcal L_{\vec n}d_{\alpha\beta\gamma\delta}\) at \(\scri\). The available spacetime identity for the rescaled Bel--Robinson tensor is sourced by the Cotton tensor and vanishes in vacuum only as a spacetime divergence; it does not give the intrinsic boundary divergence. The conformal field equations, the intrinsic divergences \(D_b\mathcal D^{ab}=0\) and \(D_b\mathcal C^{ab}=0\), and the null-frame Bianchi decomposition \(eq{:}idbianchi1\)--\(eq{:}idbianchi8\) constrain tangential/algebraic data or involve non-intrinsic \(k^\pm\)-derivatives; none solves for the required normal Lie derivative. Hence the cut charge cannot be converted into a flux density from intrinsic endpoint data alone. Finite non-factorization algebra: `SecondClassCurrentDivergenceObstruction.Model`, `FactorsThroughIntrinsic`, `not_factors_through_intrinsic`, `factors_with_fixed_extension`; physical realizability of two extensions is not asserted.

Since the holographic stress is proportional to the rescaled electric Weyl tensor, \(E_{ab}=\delta e_{ab}\) is the same linear object as \(\delta\cT^{\mathrm{tf}}_{ab}\). Senovilla's TT tensor \(\mathcal F_{ab}\) is also the rescaled electric Weyl tensor, so in the no-incoming sector \(Q_-^\mu=0\) the radiative cut components satisfy \(\hat{\mathcal F}_{AB}=\epsilon_{AD}\hat C_B{}^D\) and \(\mathcal F_A=\epsilon_{AB}C^B\). Consequently the radiative projection of the linearized AldS news pair is, up to a fixed rotation and normalization, the detector pair \((\hat C_{AB},C_A)\), with square proportional to \(\hat C^2+C^2=-\tfrac12p_m\). Thus the object pairing with \(\xi\) in the linearized AldS flux and the object detecting outgoing radiation share the same radiative components and zero set. This is a compatibility result under \(Q_-^\mu=0\), not a nonlinear news construction or a full positivity theorem.

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
* the pointwise news-square obstruction `NewsSquareObstruction.no_linear_pointwise_square` and the harmonic-mode obstruction `HarmonicDimensionObstruction.no_injective_pair_to_tensor`;
* the charge-linearity obstruction `LinearFluxObstruction.no_nonzero_constant_square`;
* the linearized Hamiltonian news-flux core `HamiltonianNewsFlux.Model`, `flux_smul`, `flux_add`, and `flux_zero`;
* the CKV flux degeneracy core `CKVFluxDegeneracy.trace`, `ckvDerivative`, and `contract_zero`;
* the second-class Bel--Robinson charge core `SecondClassBRCharge.Model`, `outgoing_charge`, `DetectorModel`, `radiative_charge_may_vanish_on_nonzero_news`, `hatC2_from_square_and_charge`, `C2_from_square_and_charge`, `no_scalar_charge_equals_detector_square`, `FlatDetectorModel`, `flat_radiative_charge`, `flat_radiative_charge_detector`, `PairModel`, `hatC2_from_superEnergy_and_bitranslation`, `C2_from_superEnergy_and_bitranslation`, `detectorSq_from_superEnergy_and_bitranslation`, `pureTensorPair`, `pureCoulombPair`, `pair_charge_blindness`, and the intrinsic-divergence obstruction `SecondClassCurrentDivergenceObstruction.Model`, `FactorsThroughIntrinsic`, `not_factors_through_intrinsic`, `factors_with_fixed_extension`;
* the linearized sign-flip obstruction `LinearizedFluxObstruction.SignFlipNewsModel`, `LinearizedFluxObstruction.energy_zero_of_sign_flip_square`, and `LinearizedFluxObstruction.no_sign_flip_square`, plus its nonlinear second-variation core `NonlinearSquareLinearizationObstruction.Model`, `Q_nonneg`, `flip_nonneg`, `Q_zero`, and `impossible`;
* the conditional radiant-news core `RadiantCutNews.StrongModel`, `nPlus_zero_iff_V_zero`, `Zplus_iff_V_zero`, `V_zero_iff_Pzero`, and `nMinus_zero_of_noIncoming`;
* the inverse-divergence core `RadiantCutNews.StrongOutgoingInversion.Model`, `div_V_eq_half_source`, and `nPlus_eq_twoV_of_div`;
* the detector-square representative `DetectorSquareNews.Pair`, `DetectorSquareNews.Model`, `normalFlux_nonpos`, and `normalFlux_zero_iff_news_zero`;
* the minimal rank-two tensor-pair core `RankTwoTensorPairNews.VectorTensorIsometry` and `normalFlux_zero_iff_news_zero`;
* the radiant transport-square core `RadiantNewsTransport.Model`, `W_nonneg`, and `W_zero_iff_nDot_zero`;
* the outgoing zero-set unification core `NewsZeroSetUnification.Model`, `detector_zero_iff_radiant_zero`, and `detector_zero_iff_no_radiation`;
* the spectral magnitude obstruction `SpectralNormMismatch.Model` and `no_uniform_lower_bound`;
* the first-jet radiant-news core `RadiantJetNews.Model`, `jet_sq_eq_neg_half_normalFlux`, and `jet_zero_iff_detector_zero`, plus `NewsOnlyJetSquare.Algebra` and `scaled_jet_sq`;
* the generalized \((\delta,\gamma)\) inversion core `GeneralizedJetRotation.TensorRotation`, `sq_inverse`, and `inverse_zero_iff`;
* the charge-blindness core `ChargeFluxBlindness.Model`, `news_zero_flux_zero`, and `not_flux_zero_imp_news_zero`, plus the generator-kernel obstruction `FluxGeneratorKernelObstruction.Sector`, `Model`, `evenMomentumCoefficient_zero`, `no_universal_news_square`, and the unrestricted no-go `UnrestrictedCentralNoGo.Model`, `impossible`, plus the finite dimension count `FiniteChargeDetectionObstruction.no_injective_fin8_to_fin7`;
* the conformal-weight core `ConformalWeightObstruction.LocalTensorOperator`, `tensor_square_weight`, `vector_square_weight`, and `no_local_rank_two_map`;
* the arbitrary-cut polar-decomposition core `ArbitraryCutJetNews.PolarData`, `toIsometry`, and `J_zero_iff`;
* the conformal-intertwiner weight algebra `ConformalJetIntertwiner.Algebra`, `input_weight`, `output_weight`, and `jet_square_scaling`;
* the symplectic dual-news core `SymplecticDualNews.Model`, `flux_zero_of_news_zero`, and `flux_zero_all_iff_dual_zero`, plus the local-adjoint algebra `LocalDualNews.localDual`, `localDual_add`, `localDual_smul`, `PairingAlgebra`, `pairing`, the retarded-square core `RetardedSquareCriterion.Model`, `square`, `nonnegative`, `zero_iff`, and the flat flux normalization `FlatBondiBridge.Model`, `scaled_seed_square`, `flux_equivalence`, the retarded first-jet flux bridge `RetardedJetFluxBridge.Model`, `dotNewsSq_eq`, `seedSq_eq_integratedDotSq`, `flux_eq_integratedDotSq`, `flux_zero_iff_integratedDotSq_zero`, the origin-ambiguity core `RetardedOriginAmbiguity.Algebra`, `square_eq`, `square_eq_iff`, `square_ne_of_nonzero`, the linear retarded-sector central core `LinearRetardedCentralCore.Model`, `flux_nonneg`, `flux_zero_of_news_zero`, `newsSq_zero_of_flux_zero`, `flux_zero_iff_news_zero`, plus the divergence resolution `BetaPlusDivergence.Algebra`, `beta_eq_div_sq`, `beta_nonneg`, `beta_eq_four_Nsq_Csq`, `NC_eq_neg_half_div`, `BetaPlusDivergence.LimitAlgebra`, `tendsto_beta`, `tendsto_NC`, and the flat normalization `FlatNewsNormalization.FlatFAS`, `betaInf_eq_half_zFlat`, `zFlat_eq_two_betaInf`, `BondiFrame`, `covDivSq_eq`, `betaInf_eq_bondiDivSq`, the controlled identification core `ControlledFlatNewsIdentification.Model`, `U_eq_S_of_strong_gauge`, `V_eq_flatNews`, `V_zero_iff_flatNews_zero`, its convergence form `ControlledFlatNewsIdentification.LimitModel`, `tendsto_U`, `tendsto_V`, plus the spectral weight `BetaSpectralWeight.Mode`, `lambda_ge_two`, `betaSq_eq_flux_weight`, `betaSq_ge_two_flux`, `betaSq_eq_quadrupole`, plus the flat detector balance `FlatJetEnergy.Algebra`, `alphaInf_eq_two_wFlat`, `betaInf_eq_half_zFlat`, `jetLimit_eq_detector`, and its generalized-transport invariance `GeneralizedTransportFlatBalance.Model`, `tensor_normalization_gauge_free`, `vector_normalization_gauge_free`, and the degenerate-transport trichotomy `DegenerateTransportLimit.Algebra`, `raw_eq_detector_mul_scale`, `detector_eq_mul_inv`, `detector_ge_of_raw_lower_bound`, `raw_le_of_detector_bound`, and the generalized news normalization `GeneralizedRadiantNewsNormalization.Model`, `mu_sq_eq_one`, `mu_eq_one_or_neg_one`, `mu_nonneg`, `mu_eq_one`;
* the flat-limit directional degeneracy core `FlatLimitDirection.Model` and `qMinus_zero_Qflat_ne_zero_imp_B_one`;
* the first-jet flat-scaling core `FirstJetFlatScaling.Algebra`, `scaled_phi_eq`, `scaled_vector_eq`, and `scaled_jet_eq`;
* the regular flat-limit implication `FlatLimitConstraint.Model` and `flat_news_zero`;
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

A genuine rank-two news object has now been identified in a restricted sector. Fernández-Álvarez and Senovilla (arXiv:2105.09167, Class. Quantum Grav. 39 (2022) 165012) define equipped, strictly equipped, and strongly equipped \(\mathscr I^+\) by a chosen unit tangent field \(m^a\), a foliation by cuts, and umbilical cuts respectively. On each cut they define radiant news
\[
  n^\pm_{AB}=V_{AB}+X^\pm_{AB},
\]
with \(n^\pm_{AB}=0\iff Z^\pm=0\), where \(Z^\pm\) are the transverse radiant-super-momentum components. For strongly equipped \(\mathscr I^+\) with \(S^2\) leaves and no incoming radiation \(Q_-^\mu=0\), the second outgoing component can be chosen as \(X^+_{AB}=V_{AB}\), hence
\[
  n^+_{AB}=2V_{AB}.
\]
This is the sharpest actual news candidate found: symmetric, trace-free, gauge invariant, and with the correct outgoing zero set in that sector. FAS further allow \(n^+_{(\mu)}=2\mu V\) with constant \(\mu\). Within the present framework the normalization is fixed: detector-square matching with the geometric \(-\tfrac12p_m\) gives \(\mu^2=1\), and positivity of the radiated power with positive base power gives \(\mu\ge0\), hence \(\mu=1\). Lean: `GeneralizedRadiantNewsNormalization.Model`, `mu_sq_eq_one`, `mu_eq_one_or_neg_one`, `mu_nonneg`, `mu_eq_one`. Theorem 2 of arXiv:2105.09167 strengthens the zero set under criterion 2 to \(n^+_{AB}=0\iff P^a=0\iff\) no radiation at \(\mathscr I^+\); Corollary VI.8 gives \(V_{AB}=0\iff P^a=0\) in the strongly equipped case. Hence \(V_{AB}\) itself is a rank-two news tensor in that controlled sector. If Senovilla's cut-news tensor is identified with the FAS outgoing radiant news in this sector, then \(X^+_{AB}=V_{AB}\) corresponds to \(M_{AB}=V_{AB}\). Since the cuts are umbilical, \(\Sigma_{AB}=0\), the Codazzi-source equation gives the explicit source
\[
  X_A=\tfrac12 D_CV^C{}_A-\tfrac12\sqrt{\Lambda/3}\,\epsilon_{AB}C^B .
\]
This identification is natural but not proved, and \(X_A=0\Rightarrow V_{AB}=0\) is not automatic. A purely FAS-derived inversion is also available:
\[
  D^BV_{AB}=-N\epsilon_{AB}C^{+B}.
\]
On a unit round cut, with \(S_A=-N\epsilon_{AB}C^{+B}=\sum_{l\ge2,m}(\sigma_{lm}D_AY_{lm}+\tau_{lm}\epsilon_A{}^BD_BY_{lm})\),
\[
  V_{AB}=\sum_{l\ge2,m}\left[
  \frac{\sigma_{lm}}{1-l(l+1)/2}H_{AB}(Y_{lm})
  +\frac{2\tau_{lm}}{1-l(l+1)}G_{AB}(Y_{lm})\right],
  \qquad n^+_{AB}=2V_{AB}.
\]
Thus the rank-two news is an inverse-elliptic transform of the Cotton one-form on each cut. Writing \(L=l(l+1)\), Bochner and Hodge identities give \(\int|H(Y_{lm})|^2=\int|G(Y_{lm})|^2=L(L-2)/2\int|Y_{lm}|^2\) and \(\int|DY_{lm}|^2=\int|\epsilon D Y_{lm}|^2=L\int|Y_{lm}|^2\), hence
\[
  \int_S |V_{AB}|^2
  =
  \sum_{l\ge2,m}\left[
  \frac{2}{L-2}|S^{\rm grad}_{lm}|^2
  +\frac{2(L-2)}{(L-1)^2}|S^{\rm curl}_{lm}|^2
  \right]
  \le \frac12\int_S|S_A|^2,
\]
with equality only for a pure \(l=2\) gradient source; consequently \(\int|n^+|^2\le2\int|S|^2\). The same calculation yields a sharp magnitude obstruction: for pure gradient/curl harmonics,
\[
  \frac{\int|V|^2}{\int|S|^2}
  =
  \frac{2}{L-2}
  \quad\text{or}\quad
  \frac{2(L-2)}{(L-1)^2},
\]
and both ratios tend to zero. Therefore no constant \(c>0\) satisfies \(c\int|S|^2\le\int|V|^2\) for all sources. The rank-two news \(n^+=2V\) has the same zero set as the Cotton detector but is an order-\((-1)\) elliptic smoothing, losing arbitrarily large high-harmonic detector weight. This is the quantitative reason why zero-set unification does not give a news-square theorem. The Mathlib core is `RadiantCutNews.StrongModel`, `nPlus_zero_iff_V_zero`, `Zplus_iff_V_zero`, `V_zero_iff_Pzero`, and `nMinus_zero_of_noIncoming`.

The outgoing zero sets now unify. Under \(Q_-^\mu=0\) and the FAS hypotheses (strict/strong equipment, \(S^2\) leaves, criterion 2, solvability equations),
\[
  \cN^{\mathrm{det}}_{\mathrm{out}}=0
  \iff Q_+^\mu=0
  \iff n^+_{AB}=0
  \iff V_{AB}=0
  \iff P^a=0
  \iff \text{no radiation at }\mathscr I^+ .
\]
The detector pair has the exact detector square, radiant news has the FAS transport square, and the linearized Hamiltonian pair has the symplectic/AldS flux pairing. The zero-set part of the central theorem is therefore achieved in the controlled outgoing sector; the remaining difficulty is a single object whose magnitude simultaneously carries all three structures. Conditional logic: `NewsZeroSetUnification.Model`, `detector_zero_iff_radiant_zero`, `detector_zero_iff_no_radiation`.

FAS also supply a transport law for the radiant news: under strict equipment, \(S^2\) leaves, and the solvability equations (VI.86), (VI.87), (VI.111), (VI.112),
\[
  N\epsilon_B{}^E C^{(\pm)}_{AE}
  =
  \dot n^{(\pm)}_{AB}-\Sigma^{(\pm)}_{(AC}n^{(\pm)}_{B)}{}^C,
  \qquad
  N^2W^{(\pm)}=(\dot n^{(\pm)}-\Sigma n^{(\pm)})^2 .
\]
For umbilical leaves this reduces to \(N^2W^{(\pm)}=\dot n^{(\pm)}_{AB}\dot n^{(\pm)AB}\), and in the strongly equipped outgoing sector to \(N^2W^+=4\dot V_{AB}\dot V^{AB}\). This is a super-Poynting flux-square, not an AldS charge-flux law, and the zero-set theorem concerns \(n^+\) rather than \(\dot n^+\).

The first-jet construction repairs the spectral mismatch. Define
\[
  \Phi^+_{AB}:=\frac{1}{2N}\big(\dot n^+_{AB}-\Sigma^+_{(AC}n^+_{B)}{}^C\big).
\]
FAS transport and the no-incoming Cotton projection relations give \(\Phi^+_{AB}=\epsilon_B{}^E\hat C_{AE}\), so \(|\Phi^+|^2=\hat C^2\). The vector detector is recovered from \(n^+=2V\) by \(D^B n^+_{AB}=-2N\epsilon_{AB}C^B\). On a round cut the rank-two pair
\[
  \mathcal N^{\rm jet}_+:=(\Phi^+_{AB},\mathcal J C_A[n^+])
\]
therefore satisfies
\[
  \|\mathcal N^{\rm jet}_+\|^2=\int(\hat C^2+C^2)=-\tfrac12\int p_m,
\]
and vanishes exactly on the unified no-radiation sector. This is the first candidate carrying simultaneously the unified zero set, FAS radiant flux square, exact detector square, and minimal rank-two tensor-pair structure. It still uses the equipment first jet, requires \(S^2\) leaves and strong equipment, and has no proved AldS/symplectic flux pairing or flat limit; the conformally covariant \(\mathcal J\) is supplied below. FAS VI.123 further gives \(N^2Z^+=D_Cn^{+BC}D_Dn^{+BD}\) in the normalized controlled sector, so
\[
N^2\|\mathcal N^{\rm jet}\|^2
=\frac14\int\big[(\dot n^+-\Sigma n^+)^2+|Dn^+|^2\big]\,dS,
\]
a local first-derivative quadratic form of the news tensor itself. Lean: `RadiantJetNews.Model`, `jet_sq_eq_neg_half_normalFlux`, `jet_zero_iff_detector_zero`, `NewsOnlyJetSquare.Algebra`, `scaled_jet_sq`.

The umbilical normalization is not essential. FAS permit generalized transport with gauge-invariant scalars \(\delta,\gamma\), not both zero:
\[
N(\delta\,\mathcal C^{(+)}_{AB}+\gamma\,\epsilon_{(A}{}^C\mathcal C^{(+)}_{B)C})
=\dot n^+_{AB}-\Sigma^+_{(AC}n^+_{B)}{}^C .
\]
With \(R\) the STF rotation, \(R^2=-1\) and \((\delta I+\gamma R)^{-1}=(\delta I-\gamma R)/(\delta^2+\gamma^2)\). Under the no-incoming identification \(\mathcal C^{(+)}=2\hat C\),
\[
\hat C_{AB}
=\frac{\delta\Phi_{AB}-\gamma(R\Phi)_{AB}}{\delta^2+\gamma^2},
\qquad
\hat C^2=\frac{\Phi^2}{\delta^2+\gamma^2}=\frac14W^+ .
\]
Thus \(\Phi^{\rm norm}:=\Phi/\sqrt{\delta^2+\gamma^2}\) always carries the tensor detector square, and the pair \((\Phi^{\rm norm},\mathcal J C[n^+])\) has the same norm and zero set as before. This extends the first-jet news to the full nondegenerate generalized transport family; the equipment, \(S^2\), no-incoming, and round-cut hypotheses remain. Lean: `GeneralizedJetRotation.TensorRotation`, `sq_inverse`, `inverse_zero_iff`.

There is also an exact detector-square news object in the outgoing sector. Under \(Q_-^\mu=0\), define
\[
  \mathcal N^{\rm det}_{\rm out}:=(\hat C_{AB},C_A)\in\mathfrak{STF}(S)\oplus T^*S,
  \qquad
  |\mathcal N^{\rm det}_{\rm out}|^2=\hat C_{AB}\hat C^{AB}+C_A C^A .
\]
Then \(p_m=-2|\mathcal N^{\rm det}_{\rm out}|^2\), so \(p_m\le0\) and \(p_m=0\iff \mathcal N^{\rm det}_{\rm out}=0\). This evades the pointwise linear STF-tensor obstruction by enlarging the target bundle, but it is not a rank-two tensor and is not the AldS charge news. The Mathlib core is `DetectorSquareNews.Pair`, `DetectorSquareNews.Model`, `normalFlux_nonpos`, and `normalFlux_zero_iff_news_zero`.

On a round cut, the vector component can be converted into a second STF tensor by the \(L^2\)-isometry
\[
  \mathcal J=\left(\frac{2}{-\Delta-2}\right)^{1/2}\mathcal K,
  \qquad
  \mathcal K v_{AB}=D_{(A}v_{B)}-\tfrac12q_{AB}D_Cv^C ,
\]
defined on the \(l\ge2\) sector. Since \(\mathcal K(D_AY)=H_{AB}(Y)\), \(\mathcal K(\epsilon_A{}^BD_BY)=G_{AB}(Y)\), and \(\|\mathcal K v\|^2=(L-2)\|v\|^2/2\), one has \(\|\mathcal Jv\|^2=\|v\|^2\). Hence
\[
  \mathcal N^{(2)}_{\rm out}:=(\hat C_{AB},\mathcal JC_A)
  \in\mathfrak{STF}(S)\oplus\mathfrak{STF}(S)
\]
satisfies \(\|\mathcal N^{(2)}_{\rm out}\|^2=\int(\hat C^2+C^2)=-p_m/2\) and vanishes iff both detector components vanish. This is the minimal rank-two tensor-pair representation saturating the representation-theoretic obstruction. Its Mathlib core is `RankTwoTensorPairNews.VectorTensorIsometry` and `normalFlux_zero_iff_news_zero`. It is not a single rank-two news tensor and has no AldS charge-flux representation.

A concrete round-cut inversion is now available. In the gauge where the cut metric is the unit round sphere, define
\[
H_{AB}(Y)=D_AD_BY-\tfrac12q_{AB}\Delta Y,\qquad
G_{AB}(Y)=\epsilon_{(A}{}^CD_{B)}D_CY .
\]
For \(Y_{lm}\) with \(\Delta Y_{lm}=-l(l+1)Y_{lm}\),
\[
D^AH_{AB}(Y_{lm})=\left(1-\tfrac12l(l+1)\right)D_BY_{lm},
\qquad
D^AG_{AB}(Y_{lm})=\tfrac12(1-l(l+1))\epsilon_B{}^CD_CY_{lm}.
\]
Thus the divergence equation \(D^AM_{AB}=2X_B\), with \(X_A=D_AX+\epsilon_A{}^BD_Bx\), has the unique trace-free solution
\[
M_{AB}
=
\sum_{l\ge2,m}\left[
\frac{2}{1-l(l+1)/2}X_{lm}H_{AB}(Y_{lm})
+
\frac{4}{1-l(l+1)}x_{lm}G_{AB}(Y_{lm})
\right].
\]
The excluded \(l=1\) potentials are precisely the CKV obstruction and \(l=0\) is gauge. The candidate news is therefore nonlocal on the cut, with inverse-elliptic multipliers of order \(l^{-2}\). The inversion coefficients contain no \(\Lambda\), so singularities in a flat limit must enter through the source, conformal representative, or extrinsic curvature rather than through this Codazzi operator.

### Scaling obstruction for naive news candidates

A tensor built only as the STF part of the super-Poynting vector cannot represent the AldS charge flux: \(p_i\) is linear in the holographic stress \(D_{ij}\), so such a tensor is at least linear in \(D\), and its square is at least quadratic, whereas the AldS flux \(\mathcal T^{ij}D_i\xi_j\) is linear in \(\mathcal T\). This rules out the most naive “dual of the detector” news candidates and motivates the cut-wise \(V_{AB}+M_{AB}\) program.

A second, sharper obstruction concerns the simple pointwise ansatz under the outgoing condition \(Q_-^\mu=0\). There the available cut data are a trace-free Cotton tensor \(\hat C_{AB}\) and an independent Cotton one-form \(C_A\), with

\[
-p_m=2(\hat C_{AB}\hat C^{AB}+C_A C^A)\ge0.
\]

Suppose one tries a linear combination \(N_{AB}=L(\hat C)_{AB}+K(C)_{AB}\) whose pointwise square is exactly \(\hat C^2+C^2\). Setting one input to zero forces \(L\) and \(K\) to be norm-preserving linear maps; polarizing the identity forces \(L(\hat C)\cdot K(C)=0\) for all inputs. Since an isometry of the two-dimensional space of STF cut tensors is surjective, choose \(C\ne0\) and \(\hat C\) with \(L(\hat C)=K(C)\ne0\), giving a nonzero cross term, a contradiction. The Mathlib file proves the finite-dimensional core as `NewsSquareObstruction.no_linear_pointwise_square`. Hence the outgoing positive density cannot be obtained by a purely linear pointwise news-square ansatz.

This extends to nonlocal maps on a round cut. For each \(l\ge2\), STF tensor harmonics decompose as \(2\mathcal H_l\) (the \(H\)- and \(G\)-families), and vector harmonics also decompose as \(2\mathcal H_l\) (gradient and curl). The detector pair \((\hat C_{AB},C_A)\) therefore lies in \(4\mathcal H_l\), while one rank-two STF news tensor lies in \(2\mathcal H_l\). Schur's lemma shows that any \(\mathrm{SO}(3)\)-equivariant linear map between them, even with arbitrary spectral multipliers, has nontrivial kernel on each \(l\)-sector and cannot preserve the detector norm. Thus no rotation-covariant linear nonlocal operation can compress the full detector pair into one rank-two news tensor. The minimal linear norm-preserving target is the pair itself. The per-mode finite core is `HarmonicDimensionObstruction.no_injective_pair_to_tensor`. Nonlinear, symmetry-breaking, \(\xi\)-dependent, or multi-cut constructions are not excluded.

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

In Fourier modes the energy is
\[
\mathcal H_T
=
\frac{H}{\kappa}
\int\frac{d^3k}{(2\pi)^3}\,k
\sum_{s=1}^2
\left[
E_{\vec k}^{(s)}\mathcal L_k(B_{\vec k}^{(s)})^\star
+
2E_{\vec k}^{(s)}(B_{\vec k}^{(s)})^\star
\right],
\]
linear in \(E\) for fixed \(B\), with \(E\) and \(B\) independent phase-space amplitudes. Hence \(E\mapsto-E\), \(B\mapsto B\) reverses the energy sign. A sign-definite news square cannot do this: any representation \(\mathcal H_T=\pm\int\sigma^2d\mu\) over the full linearized phase space forces \(\mathcal H_T=0\). The Mathlib core is `LinearizedFluxObstruction.SignFlipNewsModel`, `energy_zero_of_sign_flip_square`, and `no_sign_flip_square`. This obstruction disappears only after imposing an outgoing/no-incoming relation that fixes \(B\) nonlocally in terms of \(E\).

The obstruction also survives linearization of a differentiable nonlinear square. If \(E[g_0]=0\), \(\sigma[g_0]=0\), and \(E[g]=\int\sigma[g]^2\), then the second variation along a perturbation \(\gamma\) is \(\int\dot\sigma[\gamma]^2\ge0\). Thus no such energy can have the full ABK linearized energy as its quadratic part, because that quadratic part changes sign under \(E\mapsto-E\), \(B\mapsto B\). A positive square is possible only on a constrained tangent space excluding the sign-flip directions, as in the retarded-source sector. This is a conditional no-go for differentiable square representations, not a theorem excluding all nonlinear energies. Lean: `NonlinearSquareLinearizationObstruction.Model`, `Q_nonneg`, `flip_nonneg`, `Q_zero`, `impossible`.

A stronger charge-blindness result follows from the same ABK formulas. At \(\mathscr I^+\), \(\mathcal E_{ab}\) is determined by \(E_{\vec k}\) while the surviving boundary metric is determined by \(B_{\vec k}\), and all seven Poincaré fluxes are \(E\)-\(B\) cross terms. Choose nonzero smooth compactly supported \(E_{\vec k}\) and \(B_{\vec k}\) with disjoint momentum supports. The Lie-dilation operators in the flux formulas preserve momentum support, so every \(\mathcal H_K\) vanishes. Yet \(\mathcal E\neq0\), \(\mathcal B\neq0\), and for generic polarizations \([\mathcal B,\mathcal E]\neq0\), so the detector pair and the first-jet news are nonzero. Thus vanishing of all finite de Sitter charge fluxes is strictly weaker than absence of radiation; news-zero still forces radiative flux-zero, but not conversely. Lean: `ChargeFluxBlindness.Model`, `news_zero_flux_zero`, `not_flux_zero_imp_news_zero`.

A parity-kernel obstruction sharpens the search for a flux object. A single even-parity retarded radiative multipole gives positive energy flux but vanishing momentum flux by parity, while mixed-parity sectors allow nonzero momentum flux. A representation \(F_K=c_K\|\mathcal N\|^2\) with one common square would force the momentum coefficient to vanish in the even sector and then force momentum flux to vanish everywhere, a contradiction. Hence generator-dependent duals or bilinear pairings are necessary even in the retarded multipole sector. Lean: `FluxGeneratorKernelObstruction.Sector`, `Model`, `evenMomentumCoefficient_zero`, `no_universal_news_square`.

There is now an unconditional-format no-go for the unrestricted central object on the full linearized TT phase space. If the candidate must satisfy both \(\mathcal N=0\iff\) no radiation and \(\mathcal F_T=0\iff\) no radiation, the ABK blind example has \(\mathcal F_T=0\) but nonzero news. The two equivalences contradict each other. Thus a universal central theorem is impossible on that phase space; the positive central theorem is necessarily sectoral. Lean: `UnrestrictedCentralNoGo.Model`, `impossible`. A finite-dimensional shadow is the detector-pair dimension \(5+3=8\) versus seven de Sitter generators: any linear map \(\mathbb R^8\to\mathbb R^7\) has nontrivial kernel, and on the \(l\)-th radiative harmonic the pair has dimension \(4l+2\ge10\). This is weaker than the global ABK blindness because charge fluxes are integrals, but it explains structurally why finite charge evaluations alone cannot detect unrestricted news. Lean: `FiniteChargeDetectionObstruction.no_injective_fin8_to_fin7`.

### Conformal-weight obstruction to local rank-two news

The first-jet pair has mixed conformal weights. Under \(q_{AB}\mapsto\omega^2q_{AB}\), the FAS news \(n^+_{AB}\) and lapse \(N\) are invariant, \(\epsilon_{AB}\mapsto\omega^2\epsilon_{AB}\), and trace-freeness gives \(D^B n^+_{AB}\mapsto\omega^{-2}D^B n^+_{AB}\). The detector inversion \(D^Bn^+_{AB}=-2N\epsilon_{AB}C^B\) then gives \(C_A\mapsto\omega^{-2}C_A\). FAS transport and the invariant \(\epsilon_A{}^B\) give \(\Phi^+_{AB}\mapsto\omega^{-1}\Phi^+_{AB}\) and \(\hat C_{AB}\mapsto\omega^{-1}\hat C_{AB}\). Both squares have pointwise weight \(\omega^{-6}\), matching \(p_m\).

A rank-two tensor-pair realization therefore needs an operator \(\mathcal J_q\) with \(\mathcal J_{\tilde q}(\omega^{-2}C)=\omega^{-1}\mathcal J_q(C)\), i.e. conformal weight \(+1\). Locally,
\[
\mathcal K_{\tilde q}(\omega^{-2}C)_{AB}
=
\omega^{-2}\big[\mathcal K_q(C)_{AB}
-2(\omega_A C_B+\omega_B C_A)+2q_{AB}\omega^D C_D\big],
\]
so \(\mathcal K_q\) is not covariant on weight-\(\omega^{-2}\) one-forms. More generally, natural local tensor differential operators in two dimensions shift conformal weight by even integers because every contraction with \(q\), \(\epsilon\), or curvature has even weight. The required shift is \(1\), so no local tensor differential operator can realize \(\mathcal J_q\). The round-cut \(\mathcal J\) is nonlocal of order \(-1\), so a conformally covariant pseudodifferential intertwiner of weight \(+1\) is needed; the local obstruction does not exclude it, and a weighted conformal-Killing construction is given below. Lean: `ConformalWeightObstruction.LocalTensorOperator`, `tensor_square_weight`, `vector_square_weight`, `no_local_rank_two_map`.

### Arbitrary-cut polar-decomposition isometry

The round-cut restriction can be removed at the metric level. On any closed oriented Riemannian two-surface define
\(\mathcal K_q v_{AB}=D_{(A}v_{B)}-\tfrac12q_{AB}D^Cv_C\). Its kernel is the space of conformal Killing one-forms, and it is elliptic. Let \(P_q=\mathcal K_q^\ast\mathcal K_q\), let \(P_q^{-1/2}\) be the inverse square root on \((\ker\mathcal K_q)^\perp\), and set
\[
\widehat{\mathcal J}_q=\mathcal K_q P_q^{-1/2}.
\]
Then \(\int_S|\widehat{\mathcal J}_qv|^2\,dS=\int_S|v|^2\,dS\) for \(v\perp\ker\mathcal K_q\), and \(\widehat{\mathcal J}_qv=0\iff v=0\). On the unit round sphere \(P_q\) has eigenvalues \((L-2)/2\) on \(l\ge2\) vector harmonics, so this reduces to the previous Hodge inverse. Hence the first-jet news can be defined on arbitrary cuts with the same norm and zero set, provided \(C_A[n^+]\perp\ker\mathcal K_q\). This metric-dependent map does not by itself obey the conformal intertwining law \(\mathcal J_{\tilde q}(\omega^{-2}C)=\omega^{-1}\mathcal J_q(C)\). Lean: `ArbitraryCutJetNews.PolarData`, `toIsometry`, `J_zero_iff`.

### Conformally covariant weighted intertwiner

The missing conformal law is obtained by weighting the conformal Killing operator. Let \(\mu_q=(\det q)^{1/4}\), so \(\tilde\mu=\omega\mu\) and \(d\tilde S=\omega^2dS\). On weight-two one-forms, \(\mathcal K_q^{(2)}v=D_{(A}v_{B)}-\tfrac12q_{AB}D^Cv_C\) obeys \(\mathcal K_{\tilde q}^{(2)}(\omega^2v)=\omega^2\mathcal K_q^{(2)}v\). Use the pairings
\[
\langle v,u\rangle_{V}=\int q^{AB}v_Au_B\,\mu^{-8}\,dS,
\qquad
\langle S,U\rangle_{W}=\int q^{AC}q^{BD}S_{AB}U_{CD}\,\mu^{-6}\,dS .
\]
For \(v=\mu^4C\) and \(S=\mu^3T\) these are the geometric norms \(\int|C|^2dS\) and \(\int|T|^2dS\). Both pairings scale by \(\omega^{-4}\), so the adjoint satisfies \(\mathcal K_{\tilde q}^{(2)\dagger}(\omega^2S)=\omega^2\mathcal K_q^{(2)\dagger}S\). Hence
\[
P_q^{(2)}=\mathcal K_q^{(2)\dagger}\mathcal K_q^{(2)}
\]
obeys \(P_{\tilde q}^{(2)}(\omega^2v)=\omega^2P_q^{(2)}v\), and so does its inverse square root off the conformal-Killing kernel. Define
\[
\mathcal J_q^{\mathrm{cov}}C
=
\mu_q^{-3}\mathcal K_q^{(2)}(P_q^{(2)})^{-1/2}(\mu_q^4C).
\]
Then \(C\) of weight \(-2\) is sent to an STF tensor of weight \(-1\) and
\[
\mathcal J_{\tilde q}^{\mathrm{cov}}(\omega^{-2}C)=\omega^{-1}\mathcal J_q^{\mathrm{cov}}C.
\]
Because \(K P^{-1/2}\) is an isometry for the weighted pairings, unwinding the definitions gives \(\int|\mathcal J_q^{\mathrm{cov}}C|^2dS=\int|C|^2dS\) and \(\mathcal J_q^{\mathrm{cov}}C=0\iff C=0\) on \((\ker\mathcal K_q^{(2)})^\perp\), with no uniformization or round-cut assumption. Thus the first-jet pair can be defined on arbitrary \(S^2\) cuts with both conformal covariance and the exact detector norm.

Moreover, \(\widetilde{\mathcal K}_q=\mu_q^{-3}\mathcal K_q^{(2)}\mu_q^4\) is itself local and conformally covariant from weight \(-2\) detector one-forms to weight \(-1\) STF tensors. Its polar decomposition on the non-kernel sector has the above \(\mathcal J_q^{\mathrm{cov}}\) as its unique isometric factor, since both geometric norms scale by the same \(\omega^{-4}\). Hence the weight-\(+1\) map is canonical, not an arbitrary choice. Remaining gaps are AldS/symplectic coupling, strong-equipment extension, and \(\beta_+\), not cut covariance. Lean: `ConformalJetIntertwiner.Algebra`, `input_weight`, `output_weight`, `jet_square_scaling`, `PolarAlgebra`, `polar_unique`.

### Conditional symplectic dual-news representation

In the controlled linear sector the flux is a pairing, not a square. Let \(\mathcal N^{\rm jet}_{\rm rad}:\Gamma_{\rm rad}\to\mathcal H_S\) be the linear first-jet map into rank-two pairs. Assuming injectivity/closed range, bounded flux one-forms \(\mathcal F_\xi^{\rm rad}(\delta)=\Omega(\delta,X_\xi)\), and gauge intertwining, the Riesz representation theorem gives a unique dual news \(\mathscr N_\xi\) with
\[
\mathcal F_\xi^{\rm rad}(\delta)=\langle \mathcal N^{\rm jet}_{\rm rad}\delta,\mathscr N_\xi\rangle_{\mathcal H_S},
\qquad
\mathscr N_\xi=((\mathcal N^{\rm jet}_{\rm rad})^{-1})^\star\mathcal F_\xi^{\rm rad}.
\]
It is \(\xi\)-linear, news-zero forces flux-zero, and flux-zero for all \(\delta\) is equivalent to \(\mathscr N_\xi=0\). A universal square law would need \(\mathscr N_\xi=c_\xi\mathcal N^{\rm jet}_{\rm rad}\), which the sign-flip and charge-blindness results exclude. Positivity requires the unproved restriction that the dual be proportional to the news on a chosen outgoing cone. Lean: `SymplecticDualNews.Model`, `flux_zero_of_news_zero`, `flux_zero_all_iff_dual_zero`, `not_square_of_sign_flip`.

In the linearized three-dimensional boundary theory the abstract dual news has an explicit local representative. For \(A_\xi h=\mathcal L_\xi h+2H\beta_\xi h\),
\[
\mathscr N_\xi^{\rm loc\,ab}
=
\varkappa\big[-D_c(\xi^cE^{ab})+2E^{c(a}D_c\xi^{b)}+2H\beta_\xi E^{ab}\big],
\qquad
\mathcal F_\xi=\int_{\scri^+}\mathscr N_\xi^{\rm loc\,ab}h_{ab}\,d\mu .
\]
Thus \(\mathscr N_\xi^{\rm loc}\) is the adjoint of \(A_\xi\) on the Weyl electric field, and its radiative projection is the canonical Riesz representative. It is \(\xi\)-linear and gauge invariant after projection, and in the no-incoming sector \(E\leftrightarrow J\hat C\), so it is local in the tensor detector. It is still a pairing, not a square: a square requires the extra retarded-sector relation \(E\sim\dot h\), which fails on the full linear phase space. Lean: `LocalDualNews.localDual`, `localDual_add`, `localDual_smul`, `PairingAlgebra`, `pairing`.

The retarded-sector square condition is an adjoint factorization, not necessarily pointwise proportionality. If \(P_{\rm rad}A_\xi h=B_\xi\nu_\xi\), \(P_{\rm rad}E=C_\xi\nu_\xi\), and \(\varkappa\langle C_\xi\nu,B_\xi\nu\rangle=c_\xi\|\nu\|^2\) with \(c_\xi\ge0\), then \(\mathcal F_\xi=c_\xi\|\nu_\xi\|^2=\|n_\xi\|^2\) and flux-zero is equivalent to news-zero when \(c_\xi>0\). The stronger condition \(E\propto A_\xi h\) is only a special case. In the full ABK retarded-source sector (smooth compact conserved source, small source size, stationarity outside a finite interval, first post-de Sitter/slow-motion approximation), ABK obtain
\[
E_T=\frac{G}{2\pi}\int_{\scri^+}dT\,d^2S\,
[\partial_r\int d^3x'\,T^{TT'}_{ab}(\eta_r,\vec x')]
[\partial_r\int d^3x'\,T^{TT'}_{cd}(\eta_r,\vec x')]\mathring q^{ac}\mathring q^{bd}\ge0,
\]
so the source radiation field \(\nu_T^{\rm src}\) is a genuine linear news seed, \(c_T=G/(2\pi)>0\), and flux-zero is equivalent to seed-zero. This remains a retarded linear result and does not bridge automatically to nonlinear AldS flux or the FAS first-jet news. Lean: `RetardedSquareCriterion.Model`, `square`, `nonnegative`, `zero_iff`, `ABKRetardedSource.Model`, `flux_nonneg`, `flux_zero_of_seedSq_zero`, `seedSq_zero_of_flux_zero`, `flux_zero_iff`.

These results combine into a central theorem for the **linear retarded-source sector**: with \(\mathcal N^{\rm ret}=P^{\rm tt}\nu^{\rm src}\), the field is a round-cut STF tensor; \(\mathcal N^{\rm ret}=0\) iff the retarded source radiation field and the time-translation radiative flux vanish; \(E_T=(G/2\pi)\|\mathcal N^{\rm ret}\|^2\ge0\); all generator fluxes are \(\xi\)-linear symplectic pairings with generator-dependent duals; and the flat limit reproduces Bondi news and Bondi mass loss. It is sectoral: it assumes the retarded source, observer projection, and ABK approximation, and gives neither arbitrary-boundary-data construction nor the nonlinear theorem. Lean packaging: `LinearRetardedCentralCore.Model`, `flux_nonneg`, `flux_zero_of_news_zero`, `newsSq_zero_of_flux_zero`, `flux_zero_iff_news_zero`.

In the controlled flat limit the ABK seed is related to ordinary Bondi news for every retarded source, not only quadrupoles. Since the retarded far-zone field is \(h^{\rm TT}_{AB}=(4G/r)\int T^{TT'}_{AB}(u,\vec x')+O(r^{-2})\) with \(u=\eta-r\), and \(\partial_r=-\partial_u\) on the source integral,
\[
N^{\rm Bondi}_{AB}=\partial_u(rh^{\rm TT}_{AB})=-\frac{4G}{r}P^{\rm tt}\nu^{\rm src}_{AB}+O(H).
\]
For a Newtonian quadrupole this reduces to \(\nu^{\rm src}_{ab}=-\tfrac12P^{\rm TT}\dddot Q^{(\rho)}_{ab}+O(H)\). Hence
\[
\frac{r^2}{32\pi G}N^{\rm Bondi}_{AB}N_{\rm Bondi}^{AB}
=
\frac{G}{2\pi}(P^{\rm tt}\nu^{\rm src})_{AB}(P^{\rm tt}\nu^{\rm src})^{AB},
\]
and the integrated ABK flux equals the standard Bondi mass loss. This identifies \(P^{\rm tt}\nu^{\rm src}\) as the flat Bondi image of the retarded source seed; it does not identify the full three-dimensional source field with Bondi news. Lean: `FlatBondiBridge.Model`, `scaled_seed_square`, `flux_equivalence`.

Under the controlled tensor normalization, \(N\Phi^{\rm norm}\) is isometric to \(\dot{\mathcal N}_{AB}=\partial_u(rN^{\rm Bondi}_{AB})\). For past-stationary sources let \(\mathcal I f(u)=\int_{-\infty}^u f\). Then \(\mathcal N=\mathcal I[\dot{\mathcal N}]\) and
\[
\frac{1}{32\pi G}\int|\mathcal I[\dot{\mathcal N}]|^2
=
\frac{G}{2\pi}\int(P^{\rm tt}\nu^{\rm src})^2
=
\lim_{H\to0}E_T^{\rm ABK}.
\]
Thus the Bondi/ABK flux is the square of a retarded antiderivative of the first-jet tensor news, not the pointwise derivative square appearing in the detector-gradient energy. The vector first-jet component is needed for detector zero-set/covariance, not for this flux formula. Lean: `RetardedJetFluxBridge.Model`, `dotNewsSq_eq`, `seedSq_eq_integratedDotSq`, `flux_eq_integratedDotSq`, `flux_zero_iff_integratedDotSq_zero`.

The antiderivative origin is extra structure. Replacing the lower endpoint \(u_0\) by \(u_1\) shifts the news antiderivative by \(\Delta_{01}=\int_{u_0}^{u_1}f\), and the square by \(2\langle\Delta_{01},\mathcal I_{u_0}f\rangle+|\Delta_{01}|^2\), generically nonzero. In flat Bondi gauge past stationarity and residual gauge absorb this choice; for spacelike \(\scri^+\) at \(\Lambda>0\) there is no canonical past endpoint and no BMS supertranslation freedom. Hence the retarded square law cannot be declared cut-intrinsic at \(\Lambda>0\). Lean: `RetardedOriginAmbiguity.Algebra`, `square_eq`, `square_eq_iff`, `square_ne_of_nonzero`.

### Flat-limit directional degeneracy

FAS gives the regular limit of rescaled radiant momenta,
\[
\lim_{\Lambda\to0}q^\pm{}^\alpha=\frac{(1\pm B)^3}{2\sqrt2}\,Q^\alpha_{\rm flat}.
\]
In the controlled outgoing sector \(Q_-^\mu=0\), hence \(q^-=0\) and
\[
0=\frac{(1-B)^3}{2\sqrt2}\,Q^\alpha_{\rm flat}.
\]
Thus nonzero flat Bondi news from a no-incoming de Sitter family requires \(B=1\), i.e. \(M^\alpha=Nm^\alpha\to N^\alpha|_{\Lambda=0}\) and the incoming cut-null direction collapses, \(\lim K^-=0\). If \(B\neq1\), no incoming radiation forces flat no radiation. Similarly no outgoing radiation forces \(B=-1\) or \(Q_{\rm flat}=0\). Lean: `FlatLimitDirection.Model`, `qMinus_zero_imp_Qflat_zero`, `qPlus_zero_imp_Qflat_zero`, `qMinus_zero_Qflat_ne_zero_imp_B_one`.

### Exact first-jet flat scaling

Write the outgoing rescaled supermomentum in the finite \(K^\pm\)-basis,
\[
q^+_\alpha=\alpha_+K^+_\alpha+\beta_+K^-_\alpha+\gamma_+{}^A E^+_{A\alpha}.
\]
Comparing with \(q^+=N^3Q^+\), \(K^\pm=Nk^\pm\), gives \(\alpha_+=N^2W^+\) and \(\beta_+=N^2Z^+\). FAS VI.108 fixes \(W^+=4|\Phi^{\rm norm}|^2=4\hat C^2\) in the outgoing no-incoming sector, while \(Z^+=4C^2\), so
\[
N^2|\Phi^{\rm norm}|^2=\frac{\alpha_+}{4},\qquad
N^2\|C_A[n^+]\|^2=\frac{\beta_+}{4},\qquad
N^2\|\mathcal N^{\rm jet}_{\delta,\gamma}\|^2=\frac{\alpha_+}{4}+\frac{\beta_+}{4}.
\]
For radiating no-incoming families \(B=1\), \(K^+\to\sqrt2\,N_{\rm flat}\), \(\lim q^+=2\sqrt2\,Q_{\rm flat}\), hence \(\alpha_+\to\alpha_\infty\neq0\) iff \(Q_{\rm flat}\neq0\). Therefore \(N\Phi^{\rm norm}\) has a universal nonvanishing flat limit in the tensor detector sector. The full jet requires \(\beta_\infty\). If \(B\neq\pm1\), \(\beta_\infty\) is finite but no-incoming forces it and \(\alpha_\infty\) to vanish. If \(B=1\), \(K^-\to0\) and \(\beta_+\) may diverge at a rate not fixed by \(q^+\); the vector detector, full first jet, \(V_{AB}\), and \(n^+_{AB}\) therefore lack a universal flat limit. Lean: `FirstJetFlatScaling.Algebra`, `scaled_phi_eq`, `scaled_vector_eq`, `scaled_jet_eq`, `tendsto_scaled_phi`, `tendsto_scaled_vector`, `tendsto_scaled_jet`.

The coefficient \(\beta_+\) is identified by the exact divergence relation \(N C_A[n^+]=-\tfrac12\epsilon_{AC}D_B n^{+BC}\), hence
\[
\beta_+=N^2Z^+=D_B n^{+BC}D_D n^{+D}{}_{C}.
\]
The finite detector is therefore \(N C_A[n^+]\), not \(C_A[n^+]\). If \(n^+\to\mathring n\) in \(C^1\), then \(\lim\beta_+=|\mathring D\mathring n|^2\) and \(\lim N C_A[n^+]=-\tfrac12\mathring\epsilon\mathring D\mathring n\). On the \(l\ge2\) sector nonzero flat radiant news has positive divergence-square, so bounded \(C_A\) forces \(\mathring n=0\); radiating families should have \(C_A\sim N^{-1}\) and finite nonzero \(\beta_\infty\). The flat companion theory fixes the normalization: its covariant news satisfies \(\mathcal Z=2|D\mathcal N|^2\), so if \(\mathring n=\mathcal N\) then \(\beta_\infty=\mathcal Z/2\). In a Bondi frame \(\mathcal N=rN^{\rm Bondi}\), hence \(\beta_\infty=r^2|D N^{\rm Bondi}|^2=|D N^{\rm cov}|^2\). This identification is now reduced under explicit hypotheses. In the strongly equipped \(\kappa=0\) frame, FAS gives \(V_{AB}=U_{AB}-\rho_{AB}=S_{AB}-\rho_{AB}\), while flat news is \(\mathcal N_{AB}=S^{\rm flat}_{AB}-\rho^{\rm flat}_{AB}\). Both \(\rho\)-tensors solve \(D_{[C}\rho_{A]B}=0\) with trace equal to the cut curvature and the same conformal gauge behaviour; on \(S^2\) this characterizes \(\rho\) uniquely. Thus \(C^1\) convergence of cut geometry and projected Schouten tensor implies convergence of the pulled-back Codazzi solution, hence \(V_{AB}\to\mathcal N_{AB}\) and \(\mathring n=0\iff\mathcal N=0\). The residual analytic input is projected-Schouten convergence; \(p^\alpha\to\mathcal Q^\alpha\) alone does not supply it. Lean: `BetaPlusDivergence.Algebra`, `beta_eq_div_sq`, `beta_nonneg`, `beta_eq_four_Nsq_Csq`, `NC_eq_neg_half_div`, `BetaPlusDivergence.LimitAlgebra`, `tendsto_beta`, `tendsto_NC`, `FlatNewsNormalization.FlatFAS`, `betaInf_eq_half_zFlat`, `zFlat_eq_two_betaInf`, `BondiFrame`, `covDivSq_eq`, `betaInf_eq_bondiDivSq`, `ControlledFlatNewsIdentification.Model`, `U_eq_S_of_strong_gauge`, `V_eq_flatNews`, `V_zero_iff_flatNews_zero`, `ControlledFlatNewsIdentification.LimitModel`, `tendsto_U`, `tendsto_V`. Expanding the news in STF tensor harmonics on the unit sphere gives \(\int D^BE_{AB}D_CE^{CB}=((l-1)(l+2)/2)\int E_{AB}E^{AB}\). Hence, conditionally on \(\mathring n=\mathcal N\),
\[
\mathcal B_\infty:=\int\beta_\infty\,d^2S
=32\pi G\sum_{l\ge2,m}\lambda_lP_{lm},\qquad \lambda_l=\frac{(l-1)(l+2)}{2}.
\]
Thus \(\mathcal B_\infty\ge64\pi GP_{\rm Bondi}\), with equality for pure quadrupole radiation, while \(\mathcal B_\infty/P_{\rm Bondi}\) is unbounded over radiative harmonics. Lean: `BetaSpectralWeight.Mode`, `lambda_ge_two`, `betaSq_eq_flux_weight`, `betaSq_ge_two_flux`, `betaSq_eq_quadrupole`.

Under the conditional identifications \(\mathring n=\mathcal N\) and \(N\Phi^{\rm norm}\to\dot{\mathcal N}\), the full first-jet norm is fixed:
\[
\lim_{\Lambda\to0}\int N^2\|\mathcal N^{\rm jet}\|^2
 =\int\left(\tfrac12\mathcal W+\tfrac18\mathcal Z\right)
 =r^2\int\left(|\partial_uN^{\rm Bondi}|^2+\tfrac14|DN^{\rm Bondi}|^2\right),
\]
with \(\alpha_\infty=2\mathcal W\) and \(\beta_\infty=\mathcal Z/2\). The \(1/4\) is the inverse-divergence normalization. Lean: `FlatJetEnergy.Algebra`, `alphaInf_eq_two_wFlat`, `betaInf_eq_half_zFlat`, `jetLimit_eq_detector`.

This balance is gauge-independent within the nondegenerate generalized FAS transport family. FAS VI.132 and VI.123 give \(\Phi^2/(\delta^2+\gamma^2)=\hat C^2\) and \(|Dn^+|^2/(\beta_F^2+\lambda_F^2)=N^2Z^+\). Thus, if \(\Phi/\sqrt{\delta^2+\gamma^2}\to\dot{\mathcal N}\) and \(Dn^+/\sqrt{\beta_F^2+\lambda_F^2}\to D\mathcal N\), the same \(\alpha_\infty=2\mathcal W\) and \(\beta_\infty=\mathcal Z/2\) follow for every finite nondegenerate transport normalization. The degenerate case can now be classified at the level of squares. With \(\varepsilon_T^2=\delta^2+\gamma^2\) and \(\Phi^{\rm raw}_{AB}=n'_{AB}-\Sigma_{(A}{}^C n_{B)C}\), \(\hat C^2=|\Phi^{\rm raw}|^2/\varepsilon_T^2\). If \(\varepsilon_T^2\to0\), a nonzero raw-square limit forces \(\hat C^2\to\infty\); bounded \(\hat C^2\) forces \(|\Phi^{\rm raw}|^2=O(\varepsilon_T^2)\to0\); and a vanishing raw square admits any quotient rate. The same trichotomy holds for \(\varepsilon_V^2=\beta_{\rm F}^2+\lambda_{\rm F}^2\) and \(|Dn^+|^2=N^2Z^+\varepsilon_V^2\). FAS pointwise nondegeneracy does not exclude both coefficients tending to zero together, so this is a conditional subcase, not universal convergence. Lean: `GeneralizedTransportFlatBalance.Model`, `tensor_normalization_gauge_free`, `vector_normalization_gauge_free`, plus `DegenerateTransportLimit.Algebra`, `raw_eq_detector_mul_scale`, `detector_eq_mul_inv`, `detector_ge_of_raw_lower_bound`, `raw_le_of_detector_bound`.

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

Fernández–Álvarez and Senovilla give a separate regular-limit constraint at the detector level: if \(\lim_{\Lambda\to0}g_{\alpha\beta}\) exists and is a good Lorentzian metric, then \(\lim_{\Lambda\to0}p^\alpha=Q^\alpha_{\rm flat}\). Thus de Sitter no radiation in criterion 1 forces flat radiant supermomentum and flat Bondi news to vanish. For the rescaled radiant momenta, \(\lim q^\pm{}^\alpha=2^{-3/2}(1\pm B)^3Q^\alpha_{\rm flat}\), so simultaneous vanishing is equivalent to flat no radiation. This does not prove that \(V_{AB}\), \(n^+_{AB}\), or the AldS fluxes themselves have a flat limit.

It is not a universal boundary limit. The sign-flipping transformation that rules out a positive square on the full dS phase space can be written explicitly in ABK's TT coefficients:
\[
E=c\sin(k/H)+d\cos(k/H),\qquad
B=-c\cos(k/H)+d\sin(k/H),
\]
and \(E\mapsto-E\), \(B\mapsto B\) sends
\[
\begin{pmatrix}c'\\d'\end{pmatrix}
=
\begin{pmatrix}
\cos(2k/H)&-\sin(2k/H)\\
-\sin(2k/H)&-\cos(2k/H)
\end{pmatrix}
\begin{pmatrix}c\\d\end{pmatrix}.
\]
For smooth \(H\to0\) families with fixed \(c,d\), the transformed coefficients typically oscillate infinitely fast. Thus the sign reversal leaves the controlled flat-limit family, reconciling the sign-flip obstruction with positive flat energy. Generic homogeneous dS waves can carry arbitrarily negative energy with respect to dS time translations, all dS Killing fields become spacelike near \(\mathscr I^+\), and the Bondi-gauge obstruction

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

2. **Construct a news candidate (partially reduced).** The intrinsic piece \(V_{AB}\) and the Codazzi equation for \(M_{AB}\) are known. In the round gauge the Codazzi operator has been inverted explicitly: \(M_{AB}\) is an inverse-elliptic, hence nonlocal, function of the \(s\ge2\) Hodge potentials of \(X_A\). The remaining task is to choose a weight-\(\omega^{-2}\), CKV-orthogonal one-form \(X_A\), equivalently a dimensionless function \(f\), from \((\mathscr I,h,\mathcal T)\) whose constancy matches no radiation. No canonical choice is known.

3. **Prove the flux representation (open).** Show that the AldS charge flux is reproduced by news pairings, first for linearized de Sitter waves and then generally. The simplified target \(-\int N_{AB}N^{AB}\,d\mu\) needs refinement because \(F_\xi\) is homogeneous of degree one in \(\xi\). The outgoing conditional density \(-p_m=2(\hat C^2+C^2)\) is known, but a linear pointwise tensor square is ruled out by `NewsSquareObstruction.no_linear_pointwise_square`, and the full linearized energy is ruled out as a sign-definite square by `LinearizedFluxObstruction.no_sign_flip_square`.

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
* Fernández-Álvarez & Senovilla, *Asymptotic structure with a positive cosmological constant*, arXiv:2105.09167v4, Class. Quantum Grav. 39 (2022) 165012 — equipped/strictly/strongly equipped \(\mathscr I\), radiant news \(n^\pm_{AB}=V_{AB}+X^\pm_{AB}\), zero-set theorem, and \(n^+_{AB}=2V_{AB}\) in the strongly equipped outgoing sector.
* Fernández-Álvarez & Senovilla, *Characterization of gravitational radiation at infinity with a cosmological constant*, arXiv:2510.07148v1, 8 Oct 2025 — Theorems 1–3; \(D_{ab}\) as FG third coefficient; canonical super-Poynting criterion.
* Fernández-Álvarez & Senovilla, *Asymptotic Gravitational Radiation of Photon Rockets with \(\Lambda\)*, arXiv:2608.31129v1, 31 Aug 2026 — confirms the \(\Lambda>0\) detector; gives \(\Lambda<0\) proportionality counterexamples to commutation.
* Senovilla, *Gravitational radiation and the cosmological constant* / C-metric radiation paper, arXiv:2007.11677v3 — conformal-boundary \(C_{ab},D_{ab}\) and nonzero C-metric super-Poynting data.
* Ashtekar, Bonga & Kesavan, *Asymptotics with a positive cosmological constant II/III*, arXiv:1506.06152, arXiv:1510.05593 — linear dS waves, quadrupole flux, and controlled \(\Lambda\to0\) retarded families.
* arXiv:2306.08029 — asymptotic symmetry algebra changes and emergence of BMS in the \(\Lambda\to0\) limit.
* arXiv:1904.02822 — subtle differences in recovering no-incoming-radiation Bondi–Sachs–Penrose data.
