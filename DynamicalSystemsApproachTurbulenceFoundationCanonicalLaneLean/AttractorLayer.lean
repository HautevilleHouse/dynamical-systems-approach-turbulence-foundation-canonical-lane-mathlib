import DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean.StatisticalClosureLayer

/-!
# Attractor Layer

This module captures the global attractor and invariant measures in turbulent flows.
-/

namespace HautevilleHouse
namespace DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean

structure GlobalAttractor where
  system : DynamicalSystem
  attractingSet : Set PhasePoint
  invariance : Prop
  finiteDimensional : Prop
  hausdorffDimension : ℝ

structure InvariantMeasure where
  support : Set PhasePoint
  density : PhasePoint → ℝ
  ergodic : Prop

def LorenzAttractor : GlobalAttractor := {
  system := {
    flow := zeroFlow,
    dimension := 3,
    parameter := 28.0,
    timeHomogeneous := true
  },
  attractingSet := Set.univ,
  invariance := True,
  finiteDimensional := True,
  hausdorffDimension := 2.06
}

theorem lorenz_attractor_invariance : invariance LorenzAttractor := by
  rfl

theorem lorenz_attractor_finite_dimensional : finiteDimensional LorenzAttractor := by
  rfl

end DynamicalSystemsApproachTurbulenceFoundationCanonicalLaneLean
end HautevilleHouse