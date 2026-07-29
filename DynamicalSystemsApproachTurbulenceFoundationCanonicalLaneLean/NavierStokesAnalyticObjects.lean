import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

structure NavierStokesOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveOperators : NavierStokesOperators :=
  { divergence := λ _ => λ _ _ => 0
    gradient := λ _ => λ _ _ => (0 : Space3)
    laplacian := λ u => u
    timeDerivative := λ _ => λ _ _ => (0 : Space3)
    transport := λ _ => λ _ _ => (0 : Space3)
    pressureProjection := λ u => u
    pressureProjectionIdempotent := by
      intro u; rfl
  }

structure NavierStokesFlow where
  velocity : VectorField
  pressure : ScalarField
  viscosity : ℝ
  operators : NavierStokesOperators

def primitiveFlow : NavierStokesFlow :=
  { velocity := λ _ _ => (0 : Space3)
    pressure := λ _ _ => 0
    viscosity := 1
    operators := primitiveOperators
  }

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse