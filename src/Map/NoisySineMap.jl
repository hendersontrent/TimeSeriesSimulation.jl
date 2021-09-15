"""

    NoisySineMap(μ, N, x₁)

Simulate a noisy sine map process.

    Usage:
```julia-repl
NoisySineMap(μ, N, x₁)
```
Arguments:
- `μ` : Value of the coefficient parameter.
- `N` : Length of the time series.
- `x₁` : Initial value at time 1.
"""
function NoisySineMap(μ::Float64 = 2.4, N::Int64 = 1000, x₁::Float64 = 1.0)

    Random.seed!(123) # Fix seed for reproduciblity
    
    Y = rand(Binomial(1, 0.01), N)
    η = rand(Uniform(-2, 2), N)
    x = zeros(N)
    x[1] = x₁

    for i in 2:N
        x[i] = μ * sin(x[i-1]) + Y[i-1] * η[i-1]
    end
    return x
end
