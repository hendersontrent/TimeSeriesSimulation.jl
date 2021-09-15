"""

    LotkaVolterraSystem(α, β, γ, δ, u₁, u₂, N)

Simulate the Lotka-Volterra equations (predator-prey model) as per Lotka, A. J. (1910). "Contribution to the Theory of Periodic Reaction". J. Phys. Chem. 14 (3): 271–274. doi:10.1021/j150111a004.

    Usage:
```julia-repl
LotkaVolterraSystem(α, β, γ, δ, u₁, u₂, N)
```
Arguments:
- `α` : Value of a coefficient.
- `β` : Value of a coefficient.
- `γ` : Value of a coefficient.
- `ρ` : Value of a coefficient.
- `u₁` : Starting value of the first system variable.
- `u₂` : Starting value of the second system variable.
- `N` : Length of the time series.
"""
function LotkaVolterraSystem(α::Float64 = 2.0, β::Float64 = 0.5, γ::Float64 = 0.2, δ::Float64 = 0.6, u₁::Float64 = 10.0, u₂::Float64 = 10.0, N::Int64 = 1000)
    
    # Set up parameters for the ODE

    u0 = [u₁, u₂]                       
    tspan = (0.0, N)                      
    p = [α, β, γ, δ]
    
    # Solve the ODE
    
    prob = ODEProblem(LotkaVolterraSetup, u0, tspan, p)  
    sol = solve(prob) 
    v = sol.u
    return v
end
