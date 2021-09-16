"""

    GOPY(σ, x₁, N)

Simulate the GOPY model.

    Usage:
```julia-repl
GOPY(σ, x₁, N)
```
Arguments:
- `σ` : Value of the coefficient parameter.
- `x₁` : Initial value at time 1.
- `N` : Length of the time series.
"""
function GOPY(σ::Float64 = 1.5, x₁::Float64 = 0.1, N::Int64 = 1000)

    ω = (sqrt(5)-1)/2
    x = zeros(N)
    θ = zeros(N)
    ϕ = zeros(N)
    x[1] = x₁
    θ[1] = 0.5

    for i in 2:N
        x[i] = 2 * σ * tanh(x[i-1]) * cos(2 * π * θ[i-1])
        θ[i] = mod(θ[i-1] + ω, 1)
    end

    ϕ = x/6 + θ/10
    return ϕ 
end
