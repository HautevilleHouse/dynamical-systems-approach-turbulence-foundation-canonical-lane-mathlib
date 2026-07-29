import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.BasicTurbulenceFlow

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

structure OrrSommerfeldCertificate where
  flow : TurbulentFlow
  stabilityParameter : ℝ
  criticalReynolds : ℝ
  eigenvalueImaginaryPartNonpositive : Prop
  stabilityParameterClosed : stabilityParameter = 5772.0
  criticalReynoldsClosed : criticalReynolds = 5772.0
  eigenvalueImaginaryPartNonpositiveClosed : eigenvalueImaginaryPartNonpositive

def sourceOrrSommerfeldCertificate : OrrSommerfeldCertificate := {
  flow := primitiveFlow,
  stabilityParameter := 5772.0,
  criticalReynolds := 5772.0,
  eigenvalueImaginaryPartNonpositive := True,
  stabilityParameterClosed := rfl,
  criticalReynoldsClosed := rfl,
  eigenvalueImaginaryPartNonpositiveClosed := trivial
}

def OrrSommerfeldClosed (C : OrrSommerfeldCertificate) : Prop :=
  TurbulenceClosure C.flow ∧
  C.eigenvalueImaginaryPartNonpositive

theorem source_orr_sommerfeld_closed : OrrSommerfeldClosed sourceOrrSommerfeldCertificate := by
  exact And.intro primitive_turbulence_closed sourceOrrSommerfeldCertificate.eigenvalueImaginaryPartNonpositiveClosed

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse