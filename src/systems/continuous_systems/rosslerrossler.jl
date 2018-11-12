"""
    eom_rossler_rossler(u, p, t) -> Function

Equations of motions for a 6D dynamical system consisting
of two 3D Rössler attractors.
"""
function eom_rossler_rossler(u, p, t)
    a, b, c, ϵ₁, ϵ₂, ω₁, ω₂ = ([p[i] for i = 1:7]...)
    x₁, y₁, z₁, x₂, y₂, z₂ = ([u[i] for i = 1:6]...)
    # First Rössler system
    dx₁ = ω₁*(-y₁) - z₁ + ϵ₂*(x₁ - x₂)
    dy₁ = ω₁*x₁ + a*y₁
    dz₁ = b + z₁*(x₁ - c)

    # Second Rössler system
    dx₂ = ω₂*(-y₂) - z₂ + ϵ₁*(x₂ - x₁)
    dy₂ = ω₂*x₂ + a*y₂
    dz₂ = b + z₂*(x₂ - c)
    return SVector{6}(dx₁, dy₁, dz₁, dx₂, dy₂, dz₂)
end

"""
	rossler_rossler(uᵢ, a, b, c, ϵ₁, ϵ₂, ω₁, ω₂) -> ContinuousDynamicalSystem

A coupled 6D Rossler system from Krakovská et al. (2018).
The system consists of two separate subsystems, each being a 3D Rossler
attractor. The subsystems are bidirectionally coupled, influencing each other
through variables `x₁` and `x₂`.

The parameters and default values (if calling the keyword version of `rrbi`)
are as follows:

```
a = 0.1      # parameter in the Rössler attractor
b = 0.1      # parameter in the Rössler attractor
c = 14.0     # parameter in the Rössler attractor
ϵ₁ = 0.0     # influence of subsystem 1 on subsystem 2
ϵ₂ = 0.0     # influence of subsystem 2 on subsystem 1
ω₁ = 1+0.015 # the frequency of the first system
ω₂ = 1-0.015 # the frequency of the second system
```

The dynamics is generated by the vector field:

```math
\begin{aligned}
dx₁ = ω₁*(-y₁) - z₁ + ϵ₂*(x₁ - x₂)
dy₁ = ω₁*x₁ + a*y₁
dz₁ = b + z₁*(x₁ - c)

dx₂ = ω₂*(-y₂) - z₂ + ϵ₁*(x₂ - x₁)
dy₂ = ω₂*x₂ + a*y₂
dz₂ = b + z₂*(x₂ - c)
\end{aligned}
```

with the coupling constant ``c \geq 0``.

# References
Krakovská, A., Jakubík, J., Chvosteková, M., Coufal, D., Jajcay, N., & Paluš, M. (2018). Comparison of six methods for the detection of causality in a bivariate time series. Physical Review E, 97(4), 042207.
"""
function rossler_rossler(uᵢ, a, b, c, ϵ₁, ϵ₂, ω₁, ω₂)
    p = [a, b, c, ϵ₁, ϵ₂, ω₁, ω₂]
    return ContinuousDynamicalSystem(eom_rossler_rossler, uᵢ, p)
end

"""
	rossler_rossler(;uᵢ = rand(6), a = 0.1, b = 0.1, c = 14.0, ϵ₁ = 0.0,
		ϵ₂ = 0.0, ω₁ = 1 + 0.015, ω₂ = 1 - 0.015) -> ContinuousDynamicalSystem

A coupled 6D Rossler system from Krakovská et al. (2018).
The system consists of two separate subsystems, each being a 3D Rossler
attractor. The subsystems are bidirectionally coupled, influencing each other
through variables `x₁` and `x₂`.

The parameters and default values (if calling the keyword version of `rrbi`)
are as follows:

```
a = 0.1      # parameter in the Rössler attractor
b = 0.1      # parameter in the Rössler attractor
c = 14.0     # parameter in the Rössler attractor
ϵ₁ = 0.0     # influence of subsystem 1 on subsystem 2
ϵ₂ = 0.0     # influence of subsystem 2 on subsystem 1
ω₁ = 1+0.015 # the frequency of the first system
ω₂ = 1-0.015 # the frequency of the second system
```

The dynamics is generated by the vector field:

```math
\begin{aligned}
dx₁ = ω₁*(-y₁) - z₁ + ϵ₂*(x₁ - x₂)
dy₁ = ω₁*x₁ + a*y₁
dz₁ = b + z₁*(x₁ - c)

dx₂ = ω₂*(-y₂) - z₂ + ϵ₁*(x₂ - x₁)
dy₂ = ω₂*x₂ + a*y₂
dz₂ = b + z₂*(x₂ - c)
\end{aligned}
```

with the coupling constant ``c \geq 0``.

# References
Krakovská, A., Jakubík, J., Chvosteková, M., Coufal, D., Jajcay, N., & Paluš, M. (2018). Comparison of six methods for the detection of causality in a bivariate time series. Physical Review E, 97(4), 042207.
"""
rossler_rossler(;uᵢ = rand(6), a = 0.1, b = 0.1, c = 14.0,
            ϵ₁ = 0.0, ϵ₂ = 0.0, ω₁ = 1 + 0.015, ω₂ = 1 - 0.015) =
    rossler_rossler(uᵢ, a, b, c, ϵ₁, ϵ₂, ω₁, ω₂)
