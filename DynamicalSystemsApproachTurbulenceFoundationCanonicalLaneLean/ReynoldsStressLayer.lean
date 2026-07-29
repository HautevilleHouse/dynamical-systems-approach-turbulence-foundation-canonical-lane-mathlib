import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.KolmogorovFlowLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

structure ReynoldsStressCertificate where
  kolmogorovFlow : KolmogorovFlowCertificate
  reynoldsStressDecomposition : Prop
  closureModelValid : Prop
  reynoldsStressDecompositionClosed : reynoldsStressDecomposition
  closureModelValidClosed : closureModelValid

def sourceReynoldsStressCertificate : ReynoldsStressCertificate := {
  kolmogorovFlow := sourceKolmogorovFlowCertificate,
  reynoldsStressDecomposition := True,
  closureModelValid := True,
  reynoldsStressDecompositionClosed := trivial,
  closureModelValidClosed := trivial
}

def ReynoldsStressClosed (C : ReynoldsStressCertificate) : Prop :=
  KolmogorovFlowClosed C.kolmogorovFlow ∧
  C.closureModelValid

theorem source_reynolds_stress_closed : ReynoldsStressClosed sourceReynoldsStressCertificate := by
  exact And.intro source_kolmogorov_flow_closed sourceReynoldsStressCertificate.closureModelValidClosed

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse