export BldcMotorPropellerPair


function BldcMotorPropellerPair(; name, τ)

    # translation
    @variables t thrust_cmd(t) = 0

    @parameters τ = τ

    @named system = FirstOrder(k=1.0, T=0.02)

    connections = [
        connect(thrust_cmd, system.input)
    ]

    ODESystem(connections, t, systems=[system]; name)

    # sys = structural_simplify(model);

end