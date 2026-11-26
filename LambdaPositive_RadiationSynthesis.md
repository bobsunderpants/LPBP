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
\(V_{AB}=0\iff P^a=0\) under strong equipment.  FAS also allow \(n^+_{(\mu)}=2\mu V\) for constant \(\mu\); this leaves the zero set unchanged. In the present framework the arbitrary scale is fixed by two independent requirements: matching the geometric detector square \(-\tfrac12p_m\) forces \(\mu^2=1\), and nonnegative radiated power with positive base power forces \(\mu\ge0\). Thus \(\mu=1\) in the matching, radiating sector. Lean: `GeneralizedRadiantNewsNormalization.Model`, `mu_sq_eq_one`, `mu_eq_one_or_neg_one`, `mu_nonneg`, `mu_eq_one`. If Senovilla's cut-news tensor is identified with the FAS outgoing radiant news
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

This sign flip also obstructs differentiable nonlinear squares. If
\(E[g_0]=0\), \(\sigma[g_0]=0\), and \(E[g]=\int\sigma[g]^2\), then the second
variation \(\int\dot\sigma[\gamma]^2\) is nonnegative on the full tangent
space. It therefore cannot equal the ABK linearized energy, which takes both
signs. Positivity requires a constrained tangent space excluding the sign-flip
directions; the retarded-source sector is the controlled example. The finite
second-variation algebra is
`NonlinearSquareLinearizationObstruction.Model`, `Q_nonneg`, `flip_nonneg`,
`Q_zero`, and `impossible`; analytic differentiability remains an external
hypothesis.

The same ABK formulas imply that the finite de Sitter charge family is blind to
part of the news. All seven Hamiltonian fluxes are \(E\)-\(B\) cross terms. If
\(E_{\vec k}\) and \(B_{\vec k}\) have disjoint compact momentum support, every
\(\mathcal H_K\) vanishes, while \(\mathcal E\neq0\), \(\mathcal B\neq0\), and
generically \([\mathcal B,\mathcal E]\neq0\). Hence detector news and the
first-jet news can be nonzero when all seven charge fluxes vanish. News-zero
forces radiative flux-zero, but the converse fails. Lean core:
`ChargeFluxBlindness.Model`, `news_zero_flux_zero`,
`not_flux_zero_imp_news_zero`.

FAS VII.116--VII.119 define a second-class Bel--Robinson bitranslation charge
whose outgoing radiative density is
\(\hat C^2-4C^2\), compared with the first-jet detector square
\(s=\hat C^2+C^2\). The single charge density is still blind to part of the
news: it vanishes when \(\hat C^2=4C^2\) while \(s>0\), and no scalar multiple
of it can equal \(s\). The pair \((s,\hat C^2-4C^2)\) does invert to
\(\hat C^2=(4s+r)/5\), \(C^2=(s-r)/5\), but the value of the charge is not a
flux. Under the conditional flat identification \(\mathring n=\mathcal N\),
\(N^2r\to\frac14\alpha_\infty-\beta_\infty
=\frac12(\mathcal W-\mathcal Z)=|\dot{\mathcal N}|^2-|D\mathcal N|^2\), a
time-minus-angular gradient energy rather than a Bondi news square. Lean:
`SecondClassBRCharge.Model`, `radiative_charge_may_vanish_on_nonzero_news`,
`hatC2_from_square_and_charge`, `C2_from_square_and_charge`,
`no_scalar_charge_equals_detector_square`, `flat_radiative_charge`.

A second FAS second-class charge, for a normal triplet of conformal Killing
fields, has outgoing density
\(w_{\rm can}=\hat C^2+4C^2+\frac32\mathcal V\). Together with the bitranslation
density \(\rho=\hat C^2-4C^2+\frac32\mathcal V\), it yields
\(\hat C^2=\frac12(w_{\rm can}+\rho-3\mathcal V)\),
\(C^2=\frac18(w_{\rm can}-\rho)\), and
\(s=\frac18(5w_{\rm can}+3\rho)-\frac32\mathcal V\). Thus the second-class
charge family fixes the vector detector directly and the full detector square
only after Coulomb subtraction; the missing objects remain the intrinsic
divergences. Lean: `SecondClassBRCharge.PairModel`,
`C2_from_superEnergy_and_bitranslation`,
`detectorSq_from_superEnergy_and_bitranslation`. At the algebraic level the Coulomb input is
genuinely necessary: \((\hat C^2,C^2,\mathcal V)=(1,0,0)\) and
\((0,0,2/3)\) have the same second-class densities \((1,1)\) but detector
squares \(1\) and \(0\). Lean: `pureTensorPair`, `pureCoulombPair`,
`pair_charge_blindness`.

The obstruction to turning the bitranslation charge into a flux is now
precise. FAS explicitly state that \(D_a\mathcal R^a\) requires
\(\mathcal L_{\vec n}d_{\alpha\beta\gamma\delta}\), which is not intrinsic
endpoint data. The Cotton-sourced spacetime divergence of the rescaled
Bel--Robinson tensor, the conformal field equations, the intrinsic divergences
\(D_b\mathcal D^{ab}=0\) and \(D_b\mathcal C^{ab}=0\), and the null-frame
Bianchi identities `eq:idbianchi1`--`eq:idbianchi8` do not determine that
normal Lie derivative. Therefore the cut charge alone cannot supply a flux
density without extra non-intrinsic extension data. The finite
non-factorization algebra is `SecondClassCurrentDivergenceObstruction.Model`,
`FactorsThroughIntrinsic`, `not_factors_through_intrinsic`, and
`factors_with_fixed_extension`; it does not assert physical realizability of
two extensions.

There is also a conformal-weight obstruction to making the first-jet pair
into a rank-two tensor pair on arbitrary cuts. Under \(q_{AB}\mapsto\omega^2q_{AB}\),
\(n^+_{AB}\) and \(N\) are invariant while \(\epsilon_{AB}\mapsto\omega^2\epsilon_{AB}\).
Since \(D^B n^+_{AB}\mapsto\omega^{-2}D^B n^+_{AB}\), the detector inversion
gives \(C_A\mapsto\omega^{-2}C_A\). FAS transport gives
\(\Phi^+_{AB}\mapsto\omega^{-1}\Phi^+_{AB}\), and \(\hat C_{AB}\) has the same
weight as \(\Phi^+_{AB}\). A rank-two realization therefore needs a map of
weight \(+1\). Natural local tensor differential operators in two dimensions
shift conformal weight by even integers only, so no local operator can do this.
The round-cut \(\mathcal J\) is nonlocal of order \(-1\), so the required object
is a conformally covariant pseudodifferential intertwiner; a weighted
conformal-Killing construction is given below. Lean: `ConformalWeightObstruction.LocalTensorOperator`,
`tensor_square_weight`, `vector_square_weight`, `no_local_rank_two_map`.

A metric-dependent arbitrary-cut version does exist. For a closed oriented
two-surface define \(\mathcal K_q v_{AB}=D_{(A}v_{B)}-\frac12q_{AB}D^Cv_C\),
with kernel the conformal Killing one-forms. Then
\(\widehat{\mathcal J}_q=\mathcal K_q(\mathcal K_q^\ast\mathcal K_q)^{-1/2}\)
is an \(L^2\)-isometry from \((\ker\mathcal K_q)^\perp\) into STF tensors, and
reduces to the round-cut Hodge inverse on \(S^2\). Hence the first-jet pair can
be built on arbitrary cuts with the same norm and zero set, provided
\(C_A[n^+]\perp\ker\mathcal K_q\). This does not satisfy the conformal
intertwining law by itself. A weighted refinement does: with
\(\mu_q=(\det q)^{1/4}\), the weight-two conformal Killing operator obeys
\(\mathcal K_{\tilde q}^{(2)}(\omega^2v)=\omega^2\mathcal K_q^{(2)}v\). Using
\(\langle v,u\rangle_V=\int q^{AB}v_Au_B\mu^{-8}dS\) and
\(\langle S,U\rangle_W=\int q^{AC}q^{BD}S_{AB}U_{CD}\mu^{-6}dS\), both of which
equal the geometric detector/tensor norms after \(v=\mu^4C\), \(S=\mu^3T\) and
both of which scale by \(\omega^{-4}\), the adjoint obeys
\(\mathcal K_{\tilde q}^{(2)\dagger}(\omega^2S)=\omega^2\mathcal K_q^{(2)\dagger}S\).
Hence \(P_q^{(2)}=\mathcal K_q^{(2)\dagger}\mathcal K_q^{(2)}\) is conformally
covariant. Then
\[
\mathcal J_q^{\rm cov}C
=
\mu_q^{-3}\mathcal K_q^{(2)}(P_q^{(2)})^{-1/2}(\mu_q^4C)
\]
maps detector weight \(-2\) to tensor weight \(-1\) and obeys
\(\mathcal J_{\tilde q}^{\rm cov}(\omega^{-2}C)=\omega^{-1}\mathcal J_q^{\rm cov}C\).
Because \(KP^{-1/2}\) is an isometry for the weighted pairings, arbitrary-cut
first-jet norm and zero set are conformally covariant once conformal-Killing
components are excluded; no uniformization is needed. The map is canonical:
\(\widetilde K_q=\mu_q^{-3}K_q^{(2)}\mu_q^4\) is local and conformally
covariant, and \(\mathcal J_q^{\rm cov}\) is the unique isometric polar factor
of \(\widetilde K_q\) on the non-kernel sector. Lean:
`ArbitraryCutJetNews.PolarData`, `toIsometry`, `J_zero_iff`, plus
`ConformalJetIntertwiner.Algebra`, `input_weight`, `output_weight`,
`jet_square_scaling`, `PolarAlgebra`, `polar_unique`.

The first-jet construction also survives the generalized FAS transport family.
With gauge-invariant scalars \(\delta,\gamma\), not both zero, the transport law
is \(N(\delta\mathcal C^{(+)}+\gamma R\mathcal C^{(+)})=\dot n-\Sigma n\), where
\(R^2=-1\) on STF tensors. Since
\((\delta I+\gamma R)^{-1}=(\delta I-\gamma R)/(\delta^2+\gamma^2)\), the
normalized component \(\Phi^{\rm norm}=\Phi/\sqrt{\delta^2+\gamma^2}\) has
\(|\Phi^{\rm norm}|^2=\hat C^2=W^+/4\). Thus the rank-two pair
\((\Phi^{\rm norm},\mathcal J C[n^+])\) keeps the detector norm and zero set
throughout the nondegenerate generalized transport family. Lean:
`GeneralizedJetRotation.TensorRotation`, `sq_inverse`, `inverse_zero_iff`.

The flux representation is correspondingly bilinear. Under injectivity and
boundedness assumptions, the first-jet map into rank-two pairs admits a unique
dual news \(\mathscr N_\xi\) such that
\[
\mathcal F_\xi^{\rm rad}(\delta)
=
\langle \mathcal N^{\rm jet}_{\rm rad}\delta,\mathscr N_\xi\rangle,
\qquad
\mathscr N_\xi=((\mathcal N^{\rm jet}_{\rm rad})^{-1})^\star\mathcal F_\xi^{\rm rad}.
\]
This is \(\xi\)-linear and gives news-zero \(\Rightarrow\) flux-zero, but a
universal square would require \(\mathscr N_\xi\propto\mathcal N^{\rm jet}\),
which the sign-flip and charge-blindness results rule out. Lean:
`SymplecticDualNews.Model`, `flux_zero_of_news_zero`,
`flux_zero_all_iff_dual_zero`.

The linearized boundary theory removes the abstractness of the dual news. If
\(A_\xi h=\mathcal L_\xi h+2H\beta_\xi h\), integration by parts gives the local
adjoint representative
\[
\mathscr N_\xi^{\rm loc\,ab}
=
\varkappa\big[-D_c(\xi^c E^{ab})+2E^{c(a}D_c\xi^{b)}+2H\beta_\xi E^{ab}\big],
\]
with \(\mathcal F_\xi=\int\mathscr N_\xi^{\rm loc\,ab}h_{ab}\,d\mu\). Its
radiative projection is the canonical Riesz representative. This is local and
\(\xi\)-linear and, in the no-incoming sector, \(E\) is the Hodge-rotated tensor
detector; it remains a pairing with \(h\), not a square, because the full
linearized phase space has no relation \(E\propto\dot h\). Lean:
`LocalDualNews.localDual`, `localDual_add`, `localDual_smul`,
`PairingAlgebra`, `pairing`.

On retarded data the missing square law is an adjoint factorization. If
\(A_\xi h=B_\xi\nu_\xi\), \(E=C_\xi\nu_\xi\), and
\(\varkappa\langle C_\xi\nu,B_\xi\nu\rangle=c_\xi\|\nu\|^2\), then
\(\mathcal F_\xi=\|n_\xi\|^2\) with \(n_\xi=\sqrt{c_\xi}\nu_\xi\); flux-zero and
news-zero agree when \(c_\xi>0\). Pointwise proportionality is a special case.
The ABK retarded quadrupole computation realizes this structure: after
integration by parts its energy flux is the manifest positive square of
\(\partial_r\int T^{TT'}\). This supplies a genuine linear news seed in the
retarded sector, but not yet a nonlinear AldS or first-jet flux square. Lean:
`RetardedSquareCriterion.Model`, `square`, `nonnegative`, `zero_iff`.

The controlled flat limit fixes the normalization of this seed. With
\(\nu^{\rm src}_{ab}=-\tfrac12P^{\rm TT}\dddot Q^{(\rho)}_{ab}+O(H)\), the
standard quadrupole strain gives
\(N^{\rm Bondi}_{AB}=-(4G/r)P^{\rm tt}\nu^{\rm src}_{AB}+O(H)\), hence
\[
\frac{r^2}{32\pi G}N^{\rm Bondi}_{AB}N_{\rm Bondi}^{AB}
=
\frac{G}{2\pi}(P^{\rm tt}\nu^{\rm src})_{AB}(P^{\rm tt}\nu^{\rm src})^{AB}.
\]
Thus the ABK flux and the Bondi mass-loss flux agree exactly in this retarded
flat limit; only the radial tt-projected source field is the Bondi news image.
Lean: `FlatBondiBridge.Model`, `scaled_seed_square`, `flux_equivalence`.

The same bridge links the first-jet tensor news to the flux. Since
\(N\Phi^{\rm norm}\) is isometric to \(\dot{\mathcal N}=\partial_u(rN^{\rm Bondi})\),
past stationarity gives \(\mathcal N=\mathcal I[\dot{\mathcal N}]\) with
\(\mathcal I f(u)=\int_{-\infty}^u f\), and therefore
\[
\frac{1}{32\pi G}\int|\mathcal I[\dot{\mathcal N}]|^2
=\frac{G}{2\pi}\int(P^{\rm tt}\nu^{\rm src})^2
=\lim_{H\to0}E_T^{\rm ABK}.
\]
The flux is thus a retarded-antiderivative square of the tensor first-jet news,
not the pointwise derivative square of the detector-gradient energy. The vector
component is needed for the zero set and covariance, not for this flux.
Lean: `RetardedJetFluxBridge.Model`, `dotNewsSq_eq`,
`seedSq_eq_integratedDotSq`, `flux_eq_integratedDotSq`,
`flux_zero_iff_integratedDotSq_zero`.

That antiderivative is not intrinsic. Changing the lower endpoint from
\(u_0\) to \(u_1\) shifts \(\mathcal I f\) by
\(\Delta_{01}=\int_{u_0}^{u_1}f\), so the square changes by
\(2\langle\Delta_{01},\mathcal I_{u_0}f\rangle+|\Delta_{01}|^2\). Flat retarded
data fixes \(-\infty\) and residual Bondi gauge absorbs the remaining shift;
spacelike \(\scri^+\) at \(\Lambda>0\) supplies neither a canonical endpoint nor
BMS supertranslations. The retarded flux square therefore needs explicit origin
and foliation data before any de Sitter interpretation. Lean:
`RetardedOriginAmbiguity.Algebra`, `square_eq`, `square_eq_iff`,
`square_ne_of_nonzero`.

In the flat limit, the FAS rescaled radiant momenta obey
\(\lim q^\pm=((1\pm B)^3/(2\sqrt2))Q_{\rm flat}\). Since the no-incoming sector
has \(q^-=0\), either \(Q_{\rm flat}=0\) or \(B=1\). Thus nonzero flat Bondi news
requires the incoming null direction to collapse. Lean:
`FlatLimitDirection.Model`, `qMinus_zero_Qflat_ne_zero_imp_B_one`.

The first-jet scaling is now explicit. With \(q^+=\alpha_+K^++\beta_+K^-+\cdots\),
one has \(\alpha_+=N^2W^+\), \(\beta_+=N^2Z^+\) and hence
\[
N^2|\Phi^{\rm norm}|^2=\alpha_+/4,\quad
N^2\|C_A[n^+]\|^2=\beta_+/4,\quad
N^2\|\mathcal N^{\rm jet}\|^2=\alpha_+/4+\beta_+/4.
\]
Here FAS VI.108 gives \(W^+=4|\Phi^{\rm norm}|^2\), correcting the earlier factor-of-two convention mismatch with the Senovilla radiant superenergy.
For radiating no-incoming families \(B=1\), so \(\alpha_+\) has a finite nonzero
limit whenever \(Q_{\rm flat}\neq0\): the tensor first-jet component has a universal
\(N\)-renormalized flat limit. The full first jet needs \(\beta_\infty\), which is
not fixed by \(q^+\) when \(K^-\to0\). The obstruction is nevertheless concrete:
\(N C_A[n^+]=-\tfrac12\epsilon D n^+\) and
\(\beta_+=|D n^+|^2\), so the finite detector is \(N C_A[n^+]\), not
\(C_A[n^+]\). If \(n^+\to\mathring n\) in \(C^1\), then
\(\beta_\infty=|\mathring D\mathring n|^2\). Bounded \(C_A\) forces
\(\mathring n=0\) on the radiative sector; radiating families should have
\(C_A\sim N^{-1}\) and finite nonzero \(\beta_\infty\). Thus \(\beta_+\)
is the angular-divergence square of flat radiant news, not an independent
radiation coefficient. Lean:
`FirstJetFlatScaling.Algebra`, `scaled_phi_eq`, `scaled_vector_eq`,
`scaled_jet_eq`, `BetaPlusDivergence.Algebra`, `beta_eq_div_sq`,
`beta_eq_four_Nsq_Csq`, `NC_eq_neg_half_div`, `tendsto_beta`, `tendsto_NC`.

The flat companion theory now fixes the missing normalization. Its news detector
satisfies \(\mathcal Z=2|D\mathcal N|^2\), so if the controlled limit is the FAS
news, \(\mathring n=\mathcal N\), then
\[
\beta_\infty=\tfrac12\mathcal Z
             = r^2 D_B N^{\rm Bondi\,BC}D_D N^{\rm Bondi\,D}{}_C
             = |D N^{\rm cov}|^2 .
\]
Thus \(\beta_\infty\) is the angular-divergence square of the rescaled Bondi
news, not an independent coefficient. The identification \(\mathring n=\mathcal N\)
is now reduced: in the strongly equipped \(\kappa=0\) frame one has
\(V_{AB}=S_{AB}-\rho_{AB}\), while flat news is
\(\mathcal N_{AB}=S^{\rm flat}_{AB}-\rho^{\rm flat}_{AB}\); uniqueness of the
\(S^2\) Codazzi tensor \(\rho\) turns \(C^1\) convergence of cut geometry and
projected Schouten data into \(V_{AB}\to\mathcal N_{AB}\). The residual datum is
therefore projected-Schouten convergence, not a free normalization constant.
Lean:
`FlatNewsNormalization.FlatFAS`, `betaInf_eq_half_zFlat`,
`zFlat_eq_two_betaInf`, `BondiFrame`, `covDivSq_eq`,
`betaInf_eq_bondiDivSq`, `ControlledFlatNewsIdentification.Model`,
`U_eq_S_of_strong_gauge`, `V_eq_flatNews`, `V_zero_iff_flatNews_zero`,
`ControlledFlatNewsIdentification.LimitModel`, `tendsto_U`, `tendsto_V`.

The spectral form of this result is sharper. For an STF tensor harmonic on the
unit sphere,
\[
\int D^B E_{AB}D_C E^{CB}
=\frac{(l-1)(l+2)}{2}\int E_{AB}E^{AB},
\]
so the integrated flat detector coefficient is a weighted Bondi flux,
\[
\mathcal B_\infty:=\int\beta_\infty
=32\pi G\sum_{l\ge2,m}\lambda_l P_{lm},\qquad
\lambda_l=\frac{(l-1)(l+2)}{2}.
\]
Hence \(\mathcal B_\infty\ge64\pi GP_{\rm Bondi}\), with equality for a pure
quadrupole, but \(\mathcal B_\infty/P_{\rm Bondi}\) is unbounded over radiative
harmonics. Thus \(\beta_\infty\) carries angular-derivative information not
present in the total Bondi power. Lean: `BetaSpectralWeight.Mode`,
`lambda_ge_two`, `betaSq_eq_flux_weight`, `betaSq_ge_two_flux`,
`betaSq_eq_quadrupole`.

If the equipment derivative also converges, \(N\Phi^{\rm norm}\to\dot{\mathcal N}\),
then \(\alpha_\infty=2\mathcal W\) and the full jet limit closes:
\[
\lim_{\Lambda\to0}\int N^2\|\mathcal N^{\rm jet}\|^2
=\int\left(\tfrac12\mathcal W+\tfrac18\mathcal Z\right)
=r^2\int\left(|\partial_uN^{\rm Bondi}|^2+\tfrac14|DN^{\rm Bondi}|^2\right).
\]
The angular factor \(1/4\) comes from the inverse-divergence normalization; the
first-jet norm is a detector-gradient energy, not the Bondi mass-loss density.
Lean: `FlatJetEnergy.Algebra`, `alphaInf_eq_two_wFlat`,
`betaInf_eq_half_zFlat`, `jetLimit_eq_detector`.

The same balance is independent of the nondegenerate generalized FAS transport
scalars. Since \(\Phi^2/(\delta^2+\gamma^2)=\hat C^2\) and
\(|Dn^+|^2/(\beta_F^2+\lambda_F^2)=N^2Z^+\), the normalized limits
\(\Phi/\sqrt{\delta^2+\gamma^2}\to\dot{\mathcal N}\) and
\(Dn^+/\sqrt{\beta_F^2+\lambda_F^2}\to D\mathcal N\) give the same
\(\alpha_\infty=2\mathcal W\), \(\beta_\infty=\mathcal Z/2\) for every finite
nondegenerate transport choice. In the degenerate regime the quotient is a
singular-perturbation limit: if the normalization squared scale
\(\varepsilon_T^2=\delta^2+\gamma^2\) tends to zero and the raw square
\(|\Phi^{\rm raw}|^2\) tends to a positive constant, the detector square blows
up; if the detector square stays bounded, the raw square vanishes at least as
fast as \(\varepsilon_T^2\); and if both vanish, the quotient rate is undetermined.
The identical trichotomy holds for
\(\varepsilon_V^2=\beta_F^2+\lambda_F^2\) and \(|Dn^+|^2\). FAS pointwise
nondegeneracy does not forbid simultaneous decay of the two coefficients, so
this is a controlled conditional subcase only.
Lean: `GeneralizedTransportFlatBalance.Model`,
`tensor_normalization_gauge_free`, `vector_normalization_gauge_free`, and
`DegenerateTransportLimit.Algebra`, `raw_eq_detector_mul_scale`,
`detector_eq_mul_inv`, `detector_ge_of_raw_lower_bound`,
`raw_le_of_detector_bound`.

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

The derivative route has now been made explicit. The first jet
\[
  \Phi^+_{AB}:=\frac{1}{2N}\big(\dot n^+_{AB}-\Sigma^+_{(AC}n^+_{B)}{}^C\big)
\]
is, by FAS transport and the outgoing Cotton projection relations, the Hodge dual of \(\hat C_{AB}\), so its square is the tensor detector square. The inverse-divergence law recovers \(C_A\) from \(n^+=2V\). Hence
\[
  \mathcal N^{\rm jet}_+:=(\Phi^+_{AB},\mathcal J C_A[n^+])
\]
has \(\|\mathcal N^{\rm jet}_+\|^2=-\tfrac12 p_m\) and the same unified zero set as \(n^+\). This is the first object in the controlled sector carrying the detector square, the radiant transport square, and the minimal rank-two pair structure at once. FAS VI.123 rewrites the square as
\[
N^2\|\mathcal N^{\rm jet}_+\|^2
=\frac14\int\big[(\dot n^+-\Sigma n^+)^2+|Dn^+|^2\big]\,dS,
\]
so the detector square is a local first-derivative quadratic form of the news tensor. It is not yet the central theorem: it uses a first jet and an equipment, and the AldS/symplectic flux pairing and flat limit remain unproved. Lean core: `RadiantJetNews.Model`, `jet_sq_eq_neg_half_normalFlux`, `jet_zero_iff_detector_zero`, `NewsOnlyJetSquare.Algebra`, `scaled_jet_sq`.

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
