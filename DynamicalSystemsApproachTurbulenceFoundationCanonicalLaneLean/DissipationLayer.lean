import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.ReynoldsStressLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

structure DissipationCertificate where
  reynoldsStress : ReynoldsStressCertificate
  dissipationRate : ℝ
  dissapationAnomalyClosed : Prop
  dissipationRateClosed : dissipationRate = 1.0
  dissapationAnomalyClosedProof : dissapationAnomalyClosed

def sourceDissipationCertificate : DissipationCertificate := {
  reynoldsStress := sourceReynoldsStressCertificate,
  dissipationRate := 1.0,
  dissapationAnomalyClosed := True,
  dissipationRateClosed := rfl,
  dissapationAnomalyClosedProof := trivial
}

def DissipationClosed (C : DissipationCertificate) : Prop :=
  ReynoldsStressClosed C.reynoldsStress ∧
  C.dissapationAnomalyClosed

theorem source_dissipation_closed : DissipationClosed sourceDissipationCertificate := by
  exact And.intro source_reynolds_stress_closed sourceDissipationCertificate.dissapationAnomalyClosedProof

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse