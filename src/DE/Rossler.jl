"""

    RosslerSystem(a, b, c, u₁, u₂, u₃, N)

Simulate the Rössler system as per O. E. Rössler, Phys. Lett. 57A, pp 397 (1976).

    Usage:
```julia-repl
RosslerSystem(a, b, c, u₁, u₂, u₃, N)
```
Arguments:
- `a`` : Value of a coefficient.
- `b` : Value of a coefficient.
- `c` : Value of a coefficient.
- `u₁` : Starting value of the first system variable.
- `u₂` : Starting value of the second system variable.
- `u₃` : Starting value of the third system variable.
- `N` : Length of the time series.
"""
function RosslerSystem(a::Float64 = 0.2, b::Float64 = 0.2, c::Float64 = 5.7, u₁::Float64 = 1.0, u₂::Float64 = -2.0, u₃::Float64 = 0.1, N::Int64 = 1000)
    
    # Set up parameters for the ODE

    u0 = [u₁, u₂, u₃]                       
    tspan = (0.0, N)                      
    p = [a, b, c]
        
    # Solve the ODE
        
    prob = ODEProblem(RosslerSetup, u0, tspan, p)  
    sol = solve(prob) 
    v = sol.u
    return v
end
