"""

    GOPY(σ, N, x₁)

Simulate the GOPY model.

    Usage:
```julia-repl
GOPY(σ, N, x₁)
```
Arguments:
- `σ` : Value of the coefficient parameter.
- `N` : Length of the time series.
- `x₁` : Initial value at time 1.
"""
function GOPY(σ::Float64 = 1.5, N::Int64 = 1000, x₁::Float64 = 0.1)

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
