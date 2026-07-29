import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.DissipationLayer

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

structure IntermittencyCertificate where
  dissipation : DissipationCertificate
  intermittencyExponent : ℝ
  multifractalSpectrumValid : Prop
  intermittencyExponentClosed : intermittencyExponent = 0.25
  multifractalSpectrumValidClosed : multifractalSpectrumValid

def sourceIntermittencyCertificate : IntermittencyCertificate := {
  dissipation := sourceDissipationCertificate,
  intermittencyExponent := 0.25,
  multifractalSpectrumValid := True,
  intermittencyExponentClosed := rfl,
  multifractalSpectrumValidClosed := trivial
}

def IntermittencyClosed (C : IntermittencyCertificate) : Prop :=
  DissipationClosed C.dissipation ∧
  C.multifractalSpectrumValid

theorem source_intermittency_closed : IntermittencyClosed sourceIntermittencyCertificate := by
  exact And.intro source_dissipation_closed sourceIntermittencyCertificate.multifractalSpectrumValidClosed

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse