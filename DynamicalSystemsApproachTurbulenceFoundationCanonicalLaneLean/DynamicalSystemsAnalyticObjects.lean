import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

abbrev Time := ℝ
abbrev State := ℝ
abbrev PhaseSpace := ℝ × ℝ

def zeroState : State := 0

structure TurbulenceOperator where
  nonlinearTerm : State → State
  dissipationTerm : State → State
  forcingTerm : Time → State

def primitiveTurbulenceOperator : TurbulenceOperator := {
  nonlinearTerm := fun x => x * x
  dissipationTerm := fun x => -x
  forcingTerm := fun _ => 0
}

structure TurbulentSolution where
  time : Time
  state : State
  operator : TurbulenceOperator

def primitiveTurbulentSolution : TurbulentSolution := {
  time := 0
  state := 0
  operator := primitiveTurbulenceOperator
}

def Dissipative (s : TurbulentSolution) : Prop :=
  s.operator.dissipationTerm s.state = - s.state

def Forced (s : TurbulentSolution) : Prop :=
  s.operator.forcingTerm s.time = 0

def TurbulenceEquationClosed (s : TurbulentSolution) : Prop :=
  Dissipative s ∧ Forced s

theorem primitive_turbulent_solution_dissipative_checked : Dissipative primitiveTurbulentSolution := by
  unfold Dissipative primitiveTurbulentSolution primitiveTurbulenceOperator; simp

theorem primitive_turbulent_solution_forced_checked : Forced primitiveTurbulentSolution := by
  unfold Forced primitiveTurbulentSolution primitiveTurbulenceOperator; simp

theorem primitive_turbulence_equation_closed_checked : TurbulenceEquationClosed primitiveTurbulentSolution := by
  exact And.intro primitive_turbulent_solution_dissipative_checked primitive_turbulent_solution_forced_checked

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse
