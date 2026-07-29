import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.DynamicalSystemsAdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DynamicalMathlibProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def dynamicalMathlibProofObligation : DynamicalMathlibProofObligation := {
  sourceKey := sourceRepository
  theoremObject := sourceDescription
  commonCoreImported := true
  theoremSpecificDefinitionsNative := true
  theoremSpecificBridgeNative := true
  theoremSpecificAdmittedClosureNative := true
  unrestrictedClassicalClosureNative := false
  carriedGap := "theorem-specific Mathlib closure package closes over the admitted class; unrestricted classical closure remains carried"
}

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse
