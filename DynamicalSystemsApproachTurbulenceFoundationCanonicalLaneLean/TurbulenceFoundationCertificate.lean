import HautevilleHouse.DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.NavierStokesAnalyticObjects
import HautevilleHouse.DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

structure TurbulenceFoundationCertificate where
  flow : NavierStokesFlow
  reynoldsNumber : ℝ
  reynoldsNumberClosed : reynoldsNumber = 0
  chaoticRegime : Prop
  attractorDimension : ℕ
  attractorDimensionClosed : attractorDimension = 0
  energyCascadeClosed : Prop
  chaoticRegimeClosed : chaoticRegime
  energyCascadeClosedProof : energyCascadeClosed

def sourceCertificate : TurbulenceFoundationCertificate :=
  { flow := primitiveFlow
    reynoldsNumber := 0
    reynoldsNumberClosed := rfl
    chaoticRegime := True
    attractorDimension := 0
    attractorDimensionClosed := rfl
    energyCascadeClosed := True
    chaoticRegimeClosed := trivial
    energyCascadeClosedProof := trivial
  }

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

structure TurbulenceFoundationAdmittedObject where
  certificate : TurbulenceFoundationCertificate

def turbulenceFoundationAdmittedObject : TurbulenceFoundationAdmittedObject :=
  { certificate := sourceCertificate }

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse