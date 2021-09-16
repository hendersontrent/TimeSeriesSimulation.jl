"""

    CyclostationaryAR(N)

Simulate a cyclostationary autoregressive process.

    Usage:
```julia-repl
CyclostationaryAR(N)
```
Arguments:
- `N` : Length of the time series.
"""
function CyclostationaryAR(N::Int64 = 1000)

    Random.seed!(123) # Fix seed for reproduciblity
    
    τ = 50
    ϵ = rand(Normal(0, 1), N)
    T = 10
    a₁ = 2 * cos(2 * π/ T) * ℯ^ -1 / τ
    a₂ = -ℯ^ -2 / τ
    X = zeros(N)
    X[1] = ϵ[1]
    X[2] = a₁ * X[1] + ϵ[2]

    for i in 3:N
        X[i] = a₁ * X[i-1] + a₂ * X[i-2] + ϵ[i]
    end

    return X
end
