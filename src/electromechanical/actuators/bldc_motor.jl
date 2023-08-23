export BldcMotorPropellerPair, selva


function BldcMotorPropellerPair(; name)

    # translation
    @variables t thrust_cmd(t) = 0 thrust_output(t) = 0

    @named first_order_system = FirstOrder(k=1.0, T=τ)

    eqns = [thrust_cmd ~ first_order_system.u,
        thrust_output ~ first_order_system.y]

    ODESystem(eqns, t, systems=[first_order_system]; name)
end

selva() = print("ok")