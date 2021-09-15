"""

    LorenzSystem(σ, ρ, β, u₁, u₂, u₃, N)

Simulate the Lorenz system as per  E. N. Lorenz, J. atmos. Sci. 20, pp 130 (1963).

    Usage:
```julia-repl
LorenzSystem(σ, ρ, β, u₁, u₂, u₃, N)
```
Arguments:
- `σ` : Value of a coefficient.
- `ρ` : Value of a coefficient.
- `β` : Value of a coefficient.
- `u₁` : Starting value of the first system variable.
- `u₂` : Starting value of the second system variable.
- `u₃` : Starting value of the third system variable.
- `N` : Length of the time series.
"""
function LorenzSystem(σ::Float64 = 10.0, ρ::Float64 = 28.0, β::Float64 = 8/3, u₁::Float64 = 0.0, u₂::Float64 = 10.0, u₃::Float64 = 0.0, N::Int64 = 1000)
    
    # Set up parameters for the ODE

    u0 = [u₁, u₂, u₃]                       
    tspan = (0.0, N)                      
    p = [σ, ρ, β]

    # Solve the ODE

    prob = ODEProblem(LorenzSetup, u0, tspan, p)  
    sol = solve(prob) 
    v = sol.u
    return v
end
