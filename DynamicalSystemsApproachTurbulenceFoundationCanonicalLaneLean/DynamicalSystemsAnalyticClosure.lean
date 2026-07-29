import DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.DynamicalSystemsAnalyticCertificate
import DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.DynamicalSystemsFinalTheorem

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

def DynamicalSystemsAdmittedAnalyticClosure : Prop :=
  DynamicalSystemsAnalyticCertificateClosed sourceDynamicalSystemsAnalyticCertificate ∧
  ConstrainedDynamicalSystemsClosure analyticAdmissibleClass

def analyticAdmissibleClass : AdmissibleClass := {
  object := analyticAdmittedObject
  endpointSatisfied := TurbulenceEquationClosed primitiveTurbulentSolution
  remainderRecorded := false
  gateWitness := Or.inl primitive_turbulence_equation_closed_checked
}

def analyticAdmittedObject : AdmittedTheoremObject := {
  object := theoremSpecificObject
  localWitness := "Dynamical systems analytic certificate"
  bridgeEvidence := "source-derived Lean certificate fields"
  sourceKeyChecked := rfl
  theoremObjectChecked := rfl
}

theorem dynamical_systems_admitted_analytic_closure_checked :
    DynamicalSystemsAdmittedAnalyticClosure := by
  exact And.intro source_dynamical_systems_analytic_certificate_closed
    (constrained_dynamical_systems_endgame analyticAdmissibleClass)

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse
