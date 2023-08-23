
module BldcMotorTest

using MtkLibrary
using ModelingToolkit
using OrdinaryDiffEq
using ModelingToolkitStandardLibrary.Blocks: Step
using GLMakie
using Test

@variables t

# initialize subsystems
@named reference = Step(start_time=1)
@named motor = BldcMotorPropellerPair(; name=:motor, τ=0.02)

# build system
eqns = [reference.output.u ~ motor.thrust_cmd]
sys = structural_simplify(ODESystem(eqns, t, systems=[reference, motor], name=:sys))

# simulation
tspan = (0.0, 4.0)
prob = ODEProblem(sys, [], tspan)
@time sol = solve(prob, Tsit5(), abstol=1e-8, reltol=1e-8)

# plotting
lines(sol.t, sol[motor.thrust_output])

end
