import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.DynamicalSystemsAdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DynamicalTheoremSpecificObject where
  sourceKey : String
  theoremObject : String
  claimBoundary : String

def sourceRepository : String := "dynamical-systems-approach-turbulence-foundation"
def sourceDescription : String := "Turbulence Foundation Theorem"
def sourceTheoremBoundary : String := "Classical boundary of turbulence"

def dynamicalTheoremSpecificObject : DynamicalTheoremSpecificObject := {
  sourceKey := sourceRepository
  theoremObject := sourceDescription
  claimBoundary := sourceTheoremBoundary
}

structure DynamicalAdmittedTheoremObject where
  object : DynamicalTheoremSpecificObject
  localWitness : String
  bridgeEvidence : String
  sourceKeyChecked : object.sourceKey = sourceRepository
  theoremObjectChecked : object.theoremObject = sourceDescription

def NativeBridgeClosed (O : DynamicalAdmittedTheoremObject) : Prop :=
  O.object.sourceKey = sourceRepository ∧ O.object.theoremObject = sourceDescription

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse
