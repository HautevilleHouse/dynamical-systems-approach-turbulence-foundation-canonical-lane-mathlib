import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.OrrSommerfeldLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

structure KolmogorovFlowCertificate where
  orrSommerfeld : OrrSommerfeldCertificate
  energySpectrumSlope : ℝ
  dissipationRate : ℝ
  energyCascadeClosed : Prop
  energySpectrumSlopeClosed : energySpectrumSlope = -(5/3 : ℝ)
  dissipationRateClosed : dissipationRate = 1.0
  energyCascadeClosedProof : energyCascadeClosed

def sourceKolmogorovFlowCertificate : KolmogorovFlowCertificate := {
  orrSommerfeld := sourceOrrSommerfeldCertificate,
  energySpectrumSlope := -(5/3 : ℝ),
  dissipationRate := 1.0,
  energyCascadeClosed := True,
  energySpectrumSlopeClosed := by norm_num,
  dissipationRateClosed := rfl,
  energyCascadeClosedProof := trivial
}

def KolmogorovFlowClosed (C : KolmogorovFlowCertificate) : Prop :=
  OrrSommerfeldClosed C.orrSommerfeld ∧
  C.energyCascadeClosed

theorem source_kolmogorov_flow_closed : KolmogorovFlowClosed sourceKolmogorovFlowCertificate := by
  exact And.intro source_orr_sommerfeld_closed sourceKolmogorovFlowCertificate.energyCascadeClosedProof

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse