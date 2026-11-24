# Radiation criteria for \(\Lambda>0\): current synthesis

## Bottom line

A consolidated LaTeX article with full bibliography is available as
`LambdaPositive_Bondi_Article.tex`, with BibTeX database
`lambda_positive_bondi.bib` and compiled PDF `LambdaPositive_Bondi_Article.pdf`.

There is still **no complete Bondi–Sachs–Penrose package** for generic \(\Lambda>0\)
isolated systems.  What has been established recently is a covariant,
gauge-invariant **radiation detector** at spacelike infinity \(\mathscr I^\pm\):
for \(\Lambda>0\), absence of radiation is equivalent to vanishing of the
canonical asymptotic super-Poynting vector.  Algebraically this is equivalent
to commutation of the Cotton–York tensor of \(\mathscr I\) with the holographic
stress tensor (the electric part of the rescaled Weyl tensor, equivalently the
Fefferman–Graham third coefficient up to normalization).

This detector is **not** yet a Bondi news tensor.  It does not by itself give a
positive flux representation of AldS charges, a no-incoming-radiation boundary
condition, a peeling analogue, or a controlled \(\Lambda\to0\) limit.  A
restricted rank-two news tensor does exist in the strongly equipped outgoing
sector, where \(n^+_{AB}=2V_{AB}\); the detector-square pair
\((\hat C_{AB},C_A)\) represents \(p_m\) exactly but is not a rank-two tensor.

## The algebraic equivalence for \(\Lambda>0\)

Let \(h_{ij}\) be the Riemannian metric on \(\mathscr I^+\), let \(C_{ij}\) be its
Cotton–York tensor, and let \(D_{ij}\) (also denoted \(\mathcal F_{ij}\)) be the
rescaled-Weyl electric part / holographic stress.  In an oriented orthonormal
frame,

\[
  p_i \;\propto\; \epsilon_i{}^{jk} [C,D]_{jk},
  \qquad [C,D]=CD-DC,
\]

with a nonzero \(\Lambda\)-dependent normalization.  Since \([C,D]\) is
skew-symmetric and the Hodge dual on skew 3×3 matrices is injective,

\[
  p_i=0 \quad\Longleftrightarrow\quad [C,D]_{ij}=0 .
\]

The normalization is convention-dependent but the zero condition is not.
With \(N_\alpha=\partial_\alpha\Omega\), \(N^\alpha N_\alpha=-\Lambda/3\), the
unit normal is \(n_\alpha=\sqrt{3/\Lambda}\,N_\alpha\).  In these conventions,
\(C_{ab}=-\sqrt{3/\Lambda}\,Y_{ab}\), where \(Y_{ab}\) is the Cotton–York tensor
of \((\mathscr I,h)\), and

\[
  \overline{\mathcal P}_i
    = 2\,\epsilon_i{}^{jk} C_{j\ell}D^{\ell}{}_k
    = \epsilon_i{}^{jk}[C,D]_{jk}.
\]

Other papers use the unnormalized \(n=d\Omega\) or a factor \(1/2\) in the
Cotton–York definition, producing powers of \(\Lambda/3\); all such constants
are nonzero and do not affect the equivalence.

The Lean file `pnp-mathlib/PNP/LambdaPositiveBondi.lean` proves the finite-dimensional
algebraic core of this statement as
`canonicalSuperPoyntingZero_iff_commutatorZero`.

## Why the \(\Lambda<0\) commutation report is not a contradiction

For \(\Lambda<0\), \(\mathscr I\) is Lorentzian and there is no canonical unit
normal observer.  The no-radiation condition must be imposed using the family
of asymptotic super-Poynting vectors seen by all unit observers tangent to
\(\mathscr I\).  The resulting condition is **proportionality** (functional linear
dependence) of Cotton–York and holographic stress, not mere commutation.
Commuting symmetric tensors need only share an eigenframe; in Lorentzian
signature that is weaker than proportionality, and explicit photon-rocket
examples with \(\Lambda<0\) have commuting tensors but nonzero radiation.
For \(\Lambda>0\) the canonical normal observer removes this ambiguity, and
commutation is the correct criterion.

## Outgoing cut flux and the no-incoming condition

The bare detector \(\bar p_a=0\) does not distinguish incoming from outgoing radiation. Senovilla's 2022 paper introduces a conditional refinement: for a compact cut \(\mathcal S\subset\mathscr I^+\), impose the radiant supermomentum condition \(Q_-^\mu=0\), interpreted as absence of the incoming null component transverse to the cut. Under this condition, the normal component of the super-Poynting vector satisfies

\[
  p_m \;=\; \bar p_a m^a
  \;=\; -2\left(\hat{\mathcal F}_{AB}\hat{\mathcal F}^{AB}
                 +\mathcal F_A\mathcal F^A\right)
  \;=\; -2\left(\hat C_{AB}\hat C^{AB}
                 +C_A C^A\right)
  \;\le\;0 ,
\]

where \(m^a\) is the unit normal to the cut inside \(\mathscr I^+\), and
\(\hat C_{AB},C_A\) are the trace-free part and trace of the Cotton tensor adapted to the cut. Moreover \(p_m=0\) implies the full \(\bar p_a=0\). This gives a conditional positive quadratic flux in terms of intrinsic boundary geometry, but only after the extra no-incoming condition \(Q_-^\mu=0\).

The Lean file encodes this as the abstract structure `OutgoingCutData` with theorems `normalFlux_nonpos` and `normalFlux_eq_zero_iff`.

## What plays the role of news?

The holographic stress \(D_{ij}=\mathcal T_{ij}\sim h^{(3)}_{ij}\) is a necessary
ingredient, but it is **not** by itself a news tensor:

* it is part of the Cauchy data \((h_{ij},\mathcal T_{ij})\) at \(\mathscr I\);
* the detector involves the *interplay* \( [C,D] \), not \(D\) alone;
* \(D\) alone has no positive-square flux law for AldS charges.

In the 2022 super-Poynting program, a cut-wise news candidate is decomposed as

\[
  N_{AB}=V_{AB}+M_{AB},
\]

where \(V_{AB}\) is explicitly determined by the intrinsic geometry of
\((\mathscr I,h)\) and the cut (corrected Schouten/shear data), while \(M_{AB}\)
must be solved for from a Codazzi-type equation sourced by a one-form \(X_A\).
The remaining research problem is to construct \(X_A\) from
\((\mathscr I,h,\mathcal T)\) so that:

1. the Codazzi equation is solvable;
2. \(X_A=0\) iff the canonical super-Poynting vector vanishes;
3. \(\Delta Q_\xi=-\int N_{AB}N^{AB}\,d\mu\le0\);
4. the flat limit recovers the Bondi news;
5. an incoming/outgoing split can be formulated.

The Lean file encodes items (2)–(3) as `DetectorNewsTarget`,
`NewsRepresentationTarget`, `NewsPositivityTarget`, and the full open target as
`DesiredCutNewsConstruction`.

## Cut-wise news: what is actually determined

Senovilla's Proposition 1 fixes more of \(N_{AB}=V_{AB}+M_{AB}\) than was
recorded above.  Let \(S\subset\mathscr I^+\) be a compact spherical cut, with
induced metric \(q_{AB}\), unit normal \(m^a\), second fundamental form
\(\varkappa_{AB}=\Sigma_{AB}+\tfrac12\varkappa q_{AB}\), Gaussian curvature
\(K\), and Schouten tensor \(S_{AB}\).  Define

\[
  U_{AB}
  := S_{AB}-\frac12\Sigma_A{}^D\Sigma_{BD}
     +\frac{\varkappa}{2}\Sigma_{AB}
     +\frac{\varkappa^2}{8}q_{AB},
  \qquad
  V_{AB}:=U_{AB}-\rho_{AB},
\]

where \(\rho_{AB}\) is the unique Codazzi tensor of trace \(K\) on an
\(S^2\)-cut (in a round gauge \(\rho_{AB}=Kq_{AB}/2\)).  Then \(V_{AB}\) is
symmetric, trace-free, gauge invariant, and completely intrinsic to
\((\mathscr I^+,h_{ab})\) and the cut.  The unknown part \(M_{AB}\) is
trace-free, symmetric and gauge invariant, and obeys

\[
  D_{[C}M_{A]B}
  = X_{CAB}
    -\frac12\sqrt{\frac{\Lambda}{3}}\epsilon_{CA}C_B
    +D_{[C}\!\left(\Sigma_{A]E}\Sigma_B{}^E\right)
    -\frac12 D_B\Sigma_{[C}{}^E\Sigma_{A]E},
\]

with
\[
  X_{CAB}=X_{[CA]B}=2q_{B[C}X_{A]}.
\]

Equivalently, the trace form is

\[
  \frac12 D_C M^C{}_A
  = X_A+\frac12\sqrt{\frac{\Lambda}{3}}\epsilon_{AB}C^B
    -\frac38 D_A(\Sigma_{DE}\Sigma^{DE})
    +\frac12\Sigma^{CE}D_C\Sigma_{EA}.
\]

Solvability on a compact cut requires the six CKV orthogonality conditions

\[
  \int_S \xi^A X_A\,dS = 0
  \qquad\text{for every conformal Killing vector }\xi^A.
\]

By the Hodge decomposition on \(S^2\),

\[
  X_A=\epsilon_A{}^B D_B x+D_A X,
\]

and the solvability condition removes the \(s=1\) spherical-harmonic pieces of
both potentials \(x,X\); their \(s=0\) pieces are pure gauge.  Hence the
remaining freedom is \(s\ge2\) multipoles.  This is a precise reduction of the
open problem: one must choose an \(s\ge2\), gauge-weight-\(\omega^{-2}\) one-form
\(X_A\) from the boundary data \((\mathscr I^+,h_{ab},\mathcal F_{ab})\) so that
\(X_A=0\) exactly when the canonical super-Poynting vector vanishes.

A useful observation is that the integrability condition is automatic for the
ansatz suggested in arXiv:2208.05436,

\[
  X_A=\Delta f\,D_A f,
\]

with gauge-invariant dimensionless \(f\).  Indeed Lemma 4 of that paper gives
\(\int_S \Delta f\,\pounds_\xi f=0\) for every CKV \(\xi\), and
\(\xi^A D_A f=\pounds_\xi f\).  Also \(X_A=0\) on connected \(S^2\) iff \(f\) is
constant.  Therefore the unresolved physical input is not the Codazzi
integrability condition; it is the construction of \(f\) from the radiative
boundary data with the correct zero set.  Under the outgoing condition
\(\mathcal Q_-^\mu=0\), eqs. (80) and (122) imply

\[
  \hat{\mathcal F}_{AB}=\epsilon_{AD}\hat C_B{}^D,
  \qquad
  \mathcal F_A=\epsilon_{AB}C^B,
\]

so the Hodge potentials of \(\hat{\mathcal F}\) are, modulo \(s\le1\) gauge
pieces, \(H_{\mathcal F}=-h_C\) and \(h_{\mathcal F}=H_C\).  Thus \(f\) should be
built from the Cotton potentials \(H_C,h_C\) together with the Cotton one-form
potentials, but no choice with the required zero set is known.

The constraints on \(X_A\) are now explicit.  It must have conformal weight
\(\tilde X_A=\omega^{-2}X_A\), satisfy \(\int_S\xi^AX_A=0\) for all six CKVs on
\(S^2\), and obey the paper's target condition \(X_A=0\) on the whole cut iff
\(N_{AB}=0\).  On \(\mathbb S^2\) the last condition is automatic once a solution
exists: \(D_{[C}N_{A]B}=0\) makes \(N_{AB}\) a trace-free Codazzi tensor, which
must vanish.  The Hodge decomposition gives
\(X_A=\epsilon_A{}^BD_Bx+D_AX\), with \(x,X\) defined only up to constants;
integrability removes their \(s=1\) harmonics, leaving \(s\ge2\) multipoles.
The general integrable one-form is an infinite \(s\ge2\) harmonic expansion, so
the ansatz \(X_A=\Delta f\,D_Af\) fixes a very special subfamily.

There is no equation in the paper relating \(X_A\) directly to \(\bar p_a\) or
\(Q_-^\mu\).  The bridge is only conceptual: \(V_{AB}\) is intrinsic geometry,
so \(M_{AB}\), hence \(X_A\), must carry the \(\mathcal F_{ab}\)-dependence.  A
direct scalar made from \([C,\mathcal F]\) also has the wrong transformation
weight: \(\bar p_a\sim\omega^{-5}\bar p_a\) while \(X_A\sim\omega^{-2}X_A\), and
\(f\) in \(X_A=\Delta f\,D_Af\) must be gauge invariant.  Moreover that ansatz
vanishes iff \(f\) is constant, not iff \(f=0\), so constancy of \(f\), rather
than vanishing, would have to characterize no radiation.  The Cotton/\(\mathcal
F\) potentials in eq. (122) are ambiguous by \(s=0,1\) harmonics and have no
simple gauge behavior, so no canonical \(f\) has been extracted.

Under \(Q_-^\mu=0\), Proposition 2 of the paper gives the sharper equivalence
\[
  Q_-^\mu=Q_+^\mu=0
  \iff Q_-^\mu=0,\ p_m=0
  \iff Q_-^\mu=0,\ \bar p_a=0
  \iff \hat{\mathcal F}_{AB}=\hat C_{AB}=0,\quad \mathcal F_A=C_A=0 .
\]
Here \(p_m\) and \(Q_+^\alpha\) are pure Cotton/intrinsic-geometry quantities;
only the tangential \(p_A\) still depends on the Coulombian scalar
\(\mathcal F^E{}_E\).  This is the cleanest outgoing-sector rigidity statement
currently available, but it is not an \(X_A\)-construction.

The Lean file now also records this logical core abstractly as
`CutNews.CutNewsCandidate`, with theorem
`CutNews.news_zero_iff_detector_zero`: if the Codazzi solution is unique and the
source vanishes exactly when the detector vanishes, then the constructed news
vanishes exactly in the non-radiating cases.  This is a conditional theorem; it
does not supply the geometric \(M_{AB}\) or \(f\).

The closest thing to an actual news object comes from
Fernández-Álvarez--Senovilla, *Asymptotic structure with a positive
cosmological constant* (arXiv:2105.09167).  They equip \(\mathscr I^+\) with a
unit tangent field \(m^a\), call it strictly equipped when \(m^a\) defines a
foliation and strongly equipped when the leaves are umbilical, and define
radiant news
\[
  n^\pm_{AB}=V_{AB}+X^\pm_{AB},\qquad n^\pm_{AB}=0\iff Z^\pm=0 .
\]
Under strong equipment, \(S^2\) leaves, and \(Q_-^\mu=0\), the outgoing second
component exists with \(X^+_{AB}=V_{AB}\), so
\[
  n^+_{AB}=2V_{AB}.
\]
This is a genuine symmetric trace-free gauge-invariant rank-two news tensor in
that restricted sector.  Theorem 2 of the same paper gives
\(n^+_{AB}=0\iff P^a=0\iff\) no radiation, and Corollary VI.8 gives
\(V_{AB}=0\iff P^a=0\) under strong equipment.  If Senovilla's cut-news tensor is identified with the FAS outgoing radiant news
in this sector, then \(X^+_{AB}=V_{AB}\) corresponds to \(M_{AB}=V_{AB}\);
umbilicity then gives
\[
  X_A=\tfrac12D_CV^C{}_A-\tfrac12\sqrt{\Lambda/3}\,\epsilon_{AB}C^B .
\]
This cross-formalism identification remains unproved.  Independently, FAS give
\(D^BV_{AB}=-N\epsilon_{AB}C^{+B}\), so on a round cut
\[
  V_{AB}=\sum_{l\ge2,m}\left[
  \frac{\sigma_{lm}}{1-l(l+1)/2}H_{AB}(Y_{lm})
  +\frac{2\tau_{lm}}{1-l(l+1)}G_{AB}(Y_{lm})\right],
  \qquad n^+_{AB}=2V_{AB},
\]
where \(S_A=-N\epsilon_{AB}C^{+B}\) is decomposed into \(\sigma,\tau\).  The rank-two news is therefore inverse-elliptic on each cut.  On a unit round cut, with \(L=l(l+1)\),
\[
  \int_S |V_{AB}|^2
  =
  \sum_{l\ge2,m}\left[
  \frac{2}{L-2}|S^{\rm grad}_{lm}|^2
  +\frac{2(L-2)}{(L-1)^2}|S^{\rm curl}_{lm}|^2
  \right]
  \le \frac12\int_S |S_A|^2,
\]
with equality only for a pure \(l=2\) gradient source, and hence \(\int_S|n^+_{AB}|^2\le2\int_S|S_A|^2\).
It is not a generic AldS news object: it depends on the equipment, umbilical
foliation, \(S^2\) topology, and no-incoming condition, and its relation to the
AldS charge fluxes and the flat limit has not been proved.  Its finite logical
core is `RadiantCutNews.StrongModel`, `nPlus_zero_iff_V_zero`,
`Zplus_iff_V_zero`, `V_zero_iff_Pzero`, `nMinus_zero_of_noIncoming`,
`RadiantCutNews.StrongOutgoingInversion.div_V_eq_half_source`, and
`nPlus_eq_twoV_of_div`.

FAS also provide a transport law. Under strict equipment, \(S^2\) leaves, and
the solvability equations (VI.86), (VI.87), (VI.111), (VI.112),
\[
  N\epsilon_B{}^E C^{(\pm)}_{AE}
  =
  \dot n^{(\pm)}_{AB}-\Sigma^{(\pm)}_{(AC}n^{(\pm)}_{B)}{}^C,
  \qquad
  N^2W^{(\pm)}=(\dot n^{(\pm)}-\Sigma n^{(\pm)})^2 .
\]
For umbilical leaves, \(N^2W^{(\pm)}=\dot n^{(\pm)}_{AB}\dot n^{(\pm)AB}\); in the
strongly equipped outgoing sector, \(N^2W^+=4\dot V_{AB}\dot V^{AB}\). This is a
genuine radiant-superenergy square, but not an AldS charge-flux law, and the
zero-set theorem concerns \(n^+\) itself rather than its equipment derivative.
Its finite algebra is `RadiantNewsTransport.Model`, `W_nonneg`, and
`W_zero_iff_nDot_zero`.

A second, weaker object exactly represents the normal outgoing flux.  Under
\(Q_-^\mu=0\), set
\[
  \mathcal N^{\rm det}_{\rm out}:=(\hat C_{AB},C_A)\in\mathfrak{STF}(S)\oplus T^*S,
  \qquad
  |\mathcal N^{\rm det}_{\rm out}|^2=\hat C_{AB}\hat C^{AB}+C_A C^A .
\]
Then \(p_m=-2|\mathcal N^{\rm det}_{\rm out}|^2\).  The norm has conformal
weight \(\omega^{-6}\), matching \(p_m\).  This object has the right
sign and zero set and evades the pointwise linear STF-tensor obstruction by
using a larger target bundle.  It is not a rank-two cut tensor and is not the
AldS charge news.  Its Lean core is `DetectorSquareNews.Pair`,
`DetectorSquareNews.Model`, `normalFlux_nonpos`, and
`normalFlux_zero_iff_news_zero`.

On a round cut there is a minimal rank-two tensor-pair realization. Let
\[
  \mathcal K v_{AB}=D_{(A}v_{B)}-\tfrac12q_{AB}D_Cv^C,\qquad
  \mathcal J=\left(\frac{2}{-\Delta-2}\right)^{1/2}\mathcal K .
\]
On the \(l\ge2\) sector, \(\mathcal K(D_AY)=H_{AB}(Y)\),
\(\mathcal K(\epsilon_A{}^BD_BY)=G_{AB}(Y)\), and
\(\|\mathcal Kv\|_{L^2}^2=(L-2)\|v\|_{L^2}^2/2\), so \(\mathcal J\) is an
\(L^2\)-isometry from one-forms to STF tensors. Therefore
\[
  \mathcal N^{(2)}_{\rm out}:=(\hat C_{AB},\mathcal JC_A)
  \in\mathfrak{STF}(S)\oplus\mathfrak{STF}(S)
\]
has \(\|\mathcal N^{(2)}_{\rm out}\|^2=\int(\hat C^2+C^2)=-p_m/2\) and the
correct zero set. It saturates the harmonic multiplicity obstruction: two STF
tensors give \(4\mathcal H_l\), matching the detector pair. It is not a single
rank-two tensor and has no AldS charge-flux law. Its Lean core is
`RankTwoTensorPairNews.VectorTensorIsometry` and
`normalFlux_zero_iff_news_zero`.

A new derived result makes the nonlocality explicit.  In the round cut gauge,
put
\[
H_{AB}(Y)=D_AD_BY-\tfrac12q_{AB}\Delta Y,\qquad
G_{AB}(Y)=\epsilon_{(A}{}^CD_{B)}D_CY .
\]
For \(\Delta Y_{lm}=-l(l+1)Y_{lm}\),
\[
D^AH_{AB}(Y_{lm})=\left(1-\tfrac{l(l+1)}2\right)D_BY_{lm},
\qquad
D^AG_{AB}(Y_{lm})=\frac{1-l(l+1)}2\,\epsilon_B{}^CD_CY_{lm}.
\]
Therefore the source \(X_A=D_AX+\epsilon_A{}^BD_Bx\), with only \(s\ge2\)
harmonics, determines the unique trace-free solution of \(D^AM_{AB}=2X_B\) by
\[
M_{AB}
=
\sum_{l\ge2,m}\left[
\frac{2}{1-l(l+1)/2}X_{lm}H_{AB}(Y_{lm})
+
\frac{4}{1-l(l+1)}x_{lm}G_{AB}(Y_{lm})
\right].
\]
The multipliers decay like \(l^{-2}\), so \(M_{AB}\) is inverse-elliptic and
nonlocal on the cut.  The inversion coefficients are \(\Lambda\)-independent;
any \(\Lambda\to0\) singularity must enter through the source or the cut's
extrinsic/conformal data rather than this Codazzi operator.

## Exact-solution checks

The detector agrees with the expected classification in the available exact examples:

* de Sitter: \(C_{ab}=F_{ab}=0\), \(p_a=0\);
* Kottler/Schwarzschild–de Sitter: spherical symmetry gives commuting data and \(p_a=0\);
* Kerr–de Sitter: \(C_{ab}\) and \(F_{ab}\) are proportional through the induced conformal Killing field, hence \(p_a=0\);
* generic Robinson–Trautman-dS: \(C_{ab}\) and stress are not proportional and the detector is nonzero; static cases reduce to Kottler;
* photon rockets: in the oriented orthonormal frame,
  \(\bar{\mathcal P}^{\hat a}=-2(p^2+q^2)\delta^{\hat a}{}_{\hat1}+4q(m-p)\delta^{\hat a}{}_{\hat2}\), so \(p_a=0\iff p=q=0\), the generalized Kinnersley cases;
* C-metric: \(\bar{\mathcal P}^a\propto \alpha m^2\delta^a_p\), vanishing iff the acceleration \(\alpha\) vanishes.

These are consistency checks of the detector. They do not provide a general flux-square representation. The Mathlib file now contains two finite-dimensional algebraic versions: `rocket_noRadiation_iff` and `outgoing_noRadiation_iff`, with the square identity `outgoing_superPoynting_normal`.

## Linearized de Sitter waves

In TT gauge on the round \(S^3\) boundary of de Sitter, write
\(h_{ij}=\ell^2(q_{ij}+\varepsilon\kappa_{ij})\) with
\(D^i\kappa_{ij}=0=q^{ij}\kappa_{ij}\). Using
\(D_{ij}=-\tfrac32h^{(3)}_{ij}\) and \(\mathscr C_{ij}=-\ell^2Y_{ij}\),

\[
\delta Y_{ij}
 =
 -\tfrac12 \epsilon_{(i}{}^{kl}D_k(\Delta+1)\kappa_{j)l},
\qquad
\bar{\mathcal P}_i
 =
 3\ell^2\epsilon_i{}^{jk}Y_{j\ell}h^{(3)\ell}{}_k
\]

up to the common normalization. Hence the detector is \(O(\varepsilon^2)\) around
pure de Sitter but can be \(O(\varepsilon)\) around a Coulomb background such as
Kottler, where \(Y^{(0)}=0\) but \(D^{(0)}\neq0\). The commutator and detector are
bilinear; the Lean file records this with `commutator_scaleSym_scaleSym`,
`superPoynting_scaleSym_scaleSym`, and
`linearized_superPoynting_is_quadratic`. A nonlinear detector cannot by itself
supply linear Bondi-like news.

The independent Hamiltonian analysis gives explicit TT modes
\[
h_{\vec k}^{(s)}=-2H\Big[
E_{\vec k}^{(s)}(\eta\cos k\eta-k^{-1}\sin k\eta)
-B_{\vec k}^{(s)}(\eta\sin k\eta+k^{-1}\cos k\eta)\Big],
\]
with \(\mathcal E_{ab}|_{\mathscr I^+}=k^2E\,\mathfrak e_{ab}\) and
\(\mathcal B_{ab}|_{\mathscr I^+}=k^2B\,{}^\ast\mathfrak e_{ab}\). The gauge-invariant
energy \(\mathcal H_T\) is quadratic; the \(B=0\) branch preserves first-order
conformal flatness and carries zero energy/momentum/angular momentum. These are
linear fluxes, not nonlinear news.

More precisely, in Fourier modes
\[
\mathcal H_T
=
\frac{H}{\kappa}\int\frac{d^3k}{(2\pi)^3}\,k
\sum_{s=1}^2\left[
E_{\vec k}^{(s)}\mathcal L_k(B_{\vec k}^{(s)})^\star
+
2E_{\vec k}^{(s)}(B_{\vec k}^{(s)})^\star
\right].
\]
For fixed \(B\), the energy is linear in \(E\), and \(E\) and \(B\) are independent
phase-space amplitudes. Thus \(E\mapsto-E\), \(B\mapsto B\) reverses its sign.
No sign-definite news square can represent the full linearized energy: any such
representation would force \(\mathcal H_T=0\). The algebraic core is in Lean as
`LinearizedFluxObstruction.SignFlipNewsModel`,
`energy_zero_of_sign_flip_square`, and `no_sign_flip_square`.

A conformal phase-space calculation adds a separate finite flux
\[
\bm F_\xi=\frac{\ell}{16\pi G}\int_{\mathscr I^+}
|\tilde\gamma|^{1/2}\delta\tilde e^{ab}
\mathcal L_{\tilde\xi}\delta\tilde\gamma_{ab},
\]
because the flat Geroch–Xanthopoulos \(O(\Omega)\) rescaling is unavailable for
\(\Lambda>0\). It diagnoses phase-space flow but does not yield a local news tensor.

## A linear news-square obstruction

Under \(Q_-^\mu=0\),

\[
-p_m=2(\hat C_{AB}\hat C^{AB}+C_A C^A)\ge0,
\]

with \(\hat C_{AB}\) and \(C_A\) independent. A purely linear pointwise tensor
ansatz \(N_{AB}=L(\hat C)_{AB}+K(C)_{AB}\) with square exactly \(\hat C^2+C^2\)
cannot exist: plugging in one input at a time forces \(L,K\) to be isometries,
and polarization then forces the cross term to vanish for all inputs. Taking a
nonzero \(C\) and choosing \(\hat C\) with \(L(\hat C)=K(C)\) contradicts this.
The two-dimensional core is proved in Lean as
`NewsSquareObstruction.no_linear_pointwise_square`. This does not rule out the
cut-Codazzi construction \(N_{AB}=V_{AB}+M_{AB}\); it rules out the simplest
pointwise linear square of the outgoing Cotton data.

There is a stronger nonlocal representation-theoretic obstruction. For each
\(l\ge2\), STF tensor harmonics split into the two families \(H_{AB}(Y_{lm})\)
and \(G_{AB}(Y_{lm})\), so they form \(2\mathcal H_l\) under \(\mathrm{SO}(3)\).
Vector harmonics likewise form \(2\mathcal H_l\) from \(D_AY_{lm}\) and
\(\epsilon_A{}^BD_BY_{lm}\). Hence the detector pair occupies \(4\mathcal H_l\),
while a rank-two news tensor occupies \(2\mathcal H_l\). Schur's lemma implies
that any \(\mathrm{SO}(3)\)-equivariant linear map between them has nontrivial
kernel in every \(l\)-sector, even if it is nonlocal or a spectral multiplier.
Therefore no such map can preserve \(\hat C^2+C^2\). The minimal linear
norm-preserving target is the detector pair itself. The finite-mode core is
`HarmonicDimensionObstruction.no_injective_pair_to_tensor`. Nonlinear,
symmetry-breaking, \(\xi\)-dependent, or multi-cut constructions remain open.

## Flux-linearity obstruction

The simplified target \( \Delta Q_\xi=-\int N_{AB}N^{AB}\,d\mu \) also needs refinement: the left side is homogeneous of degree one in the boundary vector field \(\xi\), while a single \(\xi\)-independent square density is not. If the same density represented \(F_\xi=\Delta Q_\xi\) for every \(\xi\), then applying the representation to \(2\xi\) gives \(2F_\xi=F_\xi\), hence \(F_\xi=0\). Thus a real target must fix a particular translation, introduce a \(\xi\)-dependent weight linear in \(D_{(i}\xi_{j)}\), or use bilinear news pairings. The finite-dimensional core is in Lean as `LinearFluxObstruction.no_nonzero_constant_square`.

The bilinear-pairing route has an exact linearized realization. On de Sitter \(\mathscr I^+\), the renormalized symplectic potential gives
\[
  \mathcal F_\xi=\frac{\ell}{16\pi G}\int \delta e^{ab}\mathcal L_\xi\delta\gamma_{ab}.
\]
With \(h_{ab}=(\delta\gamma_{ab})^{\mathrm{tf}}\) and \(E_{ab}=\delta e_{ab}\), this is \(\mathcal F_\xi=\varkappa\int E^{ab}\mathcal L_\xi h_{ab}\). Since \(D^aE_{ab}=0\) and \(\xi\) is conformal Killing, it can be rewritten as
\[
  \mathcal F_\xi=\varkappa\int\xi^cJ_c,\qquad
  J_c=-\tfrac23h_{ab}D_cE^{ab}+E^{ab}\big(\tfrac13D_ch_{ab}-2D_ah_{cb}\big).
\]
Thus the linearized news is the phase-space pair \((h_{ab},E_{ab})\), paired with the symmetry generator \(\mathcal L_\xi h\); this solves exact \(\xi\)-linearity and gauge invariance at the linear level. The ABK energy \(\mathcal H_T=\frac1{2H\kappa}\int E^{ab}(\mathcal L_Th_{ab}+2Hh_{ab})\) is the time-translation case and has the positive Minkowski flux as its controlled flat limit. For the ABK symmetry prescription, the nonlinear candidate charge-difference linearizes to exactly these symplectic fluxes, so this is a rigorous linearized representation of the AldS charge-flux law. It is not a positive square on the full phase space: \(E\mapsto-E\), \(B\mapsto B\) reverses the energy. Positivity remains tied to no-incoming/outgoing restrictions. Lean core: `HamiltonianNewsFlux.Model`, `flux_smul`, `flux_add`, `flux_zero`.

One apparent contradiction is now resolved. The simpler volume flux \(-\int \cT^{ij}D_i\xi_j\) vanishes identically when \(\cT^{ij}\) is trace-free and \(\xi\) is a boundary conformal Killing field: the symmetric part of \(D_i\xi_j\) is pure trace and the antisymmetric part does not couple to a symmetric tensor. Thus it cannot represent the nonzero de Sitter energy. This matches ABK's observation that conformal flatness at \(\mathscr I^+\) trivializes the fluxes. The Hamiltonian charge-flux relation is different: the candidate nonlinear charges depend on the full boundary conformal geometry, and their linearization contains \(\mathcal L_\xi h_{ab}\). Lean core: `CKVFluxDegeneracy.contract_zero`.

The same linearized Weyl electric data also connects the flux news to the detector. Because \(\cT_{ab}\propto e_{ab}\) and Senovilla's \(\mathcal F_{ab}\) is the rescaled electric Weyl tensor, the radiative components of \(\delta\cT\) are the detector components. In the no-incoming sector \(Q_-^\mu=0\), \(\hat{\mathcal F}_{AB}=\epsilon_{AD}\hat C_B{}^D\) and \(\mathcal F_A=\epsilon_{AB}C^B\), so the radiative part of the linearized AldS news pair is the detector pair \((\hat C_{AB},C_A)\) up to a fixed rotation and normalization. Its square is proportional to \(\hat C^2+C^2=-\tfrac12p_m\), giving a common zero set for the linearized outgoing flux news and the radiation detector in that sector. This is compatibility, not a nonlinear theorem or an unconditional positivity result.

The outgoing zero sets now unify completely in the controlled sector. Under \(Q_-^\mu=0\), strict/strong equipment, \(S^2\) cuts, criterion 2 and the radiant solvability equations,
\[
  \cN^{\mathrm{det}}_{\mathrm{out}}=0
  \iff Q_+^\mu=0
  \iff n^+_{AB}=0
  \iff V_{AB}=0
  \iff P^a=0 .
\]
Thus detector news, radiant rank-two news, outgoing radiant supermomentum and no radiation all vanish together. The remaining gap is one of magnitudes, not zero sets: the detector pair carries \(-\tfrac12p_m\), \(n^+=2V\) carries \(N^2W^+=4\dot V^2\), and the linearized Hamiltonian pair carries the symplectic/AldS flux. A central news object must reproduce all three without collapsing the detector into the forbidden single rank-two square.

The magnitude gap is now quantitative. On a round cut,
\[
  \frac{\int|V|^2}{\int|S|^2}
  =
  \frac{2}{L-2}
  \ \text{or}\
  \frac{2(L-2)}{(L-1)^2},
  \qquad S_A=-N\epsilon_{AB}C^{+B},
\]
for pure gradient/curl harmonics. Both ratios vanish as \(L\to\infty\), so \(\int|V|^2\) cannot be norm-equivalent to the Cotton detector square. The conditional rank-two news has the correct zero set but loses high-harmonic detector weight; any central object must retain that weight through a derivative, a tensor pair, or a bilinear flux pairing. Lean core: `SpectralNormMismatch.Model`, `no_uniform_lower_bound`.

## Flat limit

Controlled retarded quadrupole families on de Sitter do approach Einstein’s
quadrupole formula as \(H=\sqrt{\Lambda/3}\to0\), with the tail term \(O(H)\) in
the physical \((t,\vec x)\) chart. Fernández–Álvarez and Senovilla also show
that a regular metric limit sends the de Sitter canonical supermomentum to the
flat radiant supermomentum, \(\lim_{\Lambda\to0}p^\alpha=Q^\alpha_{\rm flat}\),
and \(\lim q^\pm{}^\alpha=2^{-3/2}(1\pm B)^3Q^\alpha_{\rm flat}\). Hence de Sitter
no radiation implies flat Bondi news vanishes under that regularity assumption.
This is a detector-level implication, not a flat limit of \(V_{AB}\), \(n^+_{AB}\),
or the AldS fluxes. It remains a limited result, not a universal boundary limit.
Homogeneous dS waves can have arbitrarily negative dS energy,
all dS Killing fields become spacelike near \(\mathscr I^+\), and the
Bondi-gauge relation \(\Lambda\gamma_1=\cdots\) requires the lower-order bracket
to be \(O(\Lambda)\) for \(\gamma_1\) to remain finite. In ABK's TT coefficients,
\(E=c\sin(k/H)+d\cos(k/H)\) and \(B=-c\cos(k/H)+d\sin(k/H)\); the sign flip
\(E\mapsto-E\), \(B\mapsto B\) sends
\[
\binom{c'}{d'}=
\begin{pmatrix}
\cos(2k/H)&-\sin(2k/H)\\
-\sin(2k/H)&-\cos(2k/H)
\end{pmatrix}
\binom{c}{d}.
\]
For smooth \(H\to0\) families this is generically infinitely oscillatory, so
the sign-flip operation leaves the controlled flat-limit sector. Flux formulas can pass
continuously while the asymptotic symmetry algebra jumps to BMS, and recovery
of no-incoming Bondi data has additional subtleties. A viable news candidate
therefore needs both an outgoing/no-incoming condition and a scaling prescription.

## Benchmark status

| Benchmark | \(\Lambda=0\) package | \(\Lambda>0\) status |
|---|---|---|
| News tensor | intrinsic on null \(\mathscr I\) | detector available; news construction open |
| No incoming radiation | well-defined at \(\mathscr I^-\) | no universal condition; all radiation crosses spacelike \(\mathscr I\) |
| Mass loss/positivity | Bondi mass loss, positivity | partial AldS flux/monotonicity; general positivity open |
| Symmetries | BMS | Diff/CKV proposals; no universal BMS analogue |
| Peeling | NP peeling | no general peeling analogue |
| \(\Lambda\to0\) | — | controlled retarded quadrupole families work; universal boundary limit singular/open |

## Sources

* arXiv:2208.05436, *Gravitational radiation at infinity with non-negative cosmological constant* — Theorems 1–3; eqs. (23), (26), (65)–(75); discussion of incoming/outgoing radiation and the cut-wise news proposal.
* arXiv:2510.07148, *Characterization of gravitational radiation at infinity with a cosmological constant* — Theorems 1–3; \(D_{\alpha\beta}\) as FG third coefficient, \(C_{\alpha\beta}=-3Y_{\alpha\beta}/\Lambda\), canonical super-Poynting criterion.
* arXiv:2608.31129, *Asymptotic Gravitational Radiation of Photon Rockets with \(\Lambda\)* — confirms \(\Lambda>0\) canonical super-Poynting criterion; for \(\Lambda<0\) proportionality rather than commutation is required, with explicit counterexamples to the commuting criterion.
* arXiv:2007.11677v3 — C-metric conformal-boundary \(C_{ab},D_{ab}\) and nonzero acceleration super-Poynting vector.
* arXiv:1506.06152, arXiv:1510.05593 — linear dS waves, quadrupole flux, and controlled \(\Lambda\to0\) retarded families.
* arXiv:2504.20845 — conformal phase-space flux and failure of the flat Geroch–Xanthopoulos rescaling.
* arXiv:2306.08029, arXiv:1904.02822 — symmetry-algebra jump and subtle recovery of no-incoming Bondi data.
