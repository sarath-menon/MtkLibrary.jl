
module RigidBodyTest

using MtkLibrary
using ModelingToolkit
using OrdinaryDiffEq
using GLMakie
using Test

@variables t


@named rb = RigidBody(; name=:rb)

# build system
thrust_eqn = rb.f .~ [0; 0; 1.5]
torque_eqn = rb.τ .~ [0; 0; 0]

eqns = vcat(thrust_eqn, torque_eqn)

@named model = ODESystem(eqns, systems=[rb])
sys = structural_simplify(model)

# simulation
tspan = (0.0, 4.0)
params = [
    rb.m => 1.0,
    rb.I_xx => 0.2,
    rb.I_yy => 0.2,
    rb.I_zz => 0.4,
]

ModelingToolkit.get_ps(sys)


prob = ODEProblem(sys, [], tspan, params)
@time sol = solve(prob, Tsit5(), abstol=1e-8, reltol=1e-8)


# plotting
# lines(sol.t, sol[motor.thrust_output])

end
