"""

    ARIMA(ϕ, N, lag)

Simulate an autoregressive integrated moving average (ARIMA) process.

    Usage:
```julia-repl
ARIMA(ϕ, N, lag)
```
Arguments:
- `ϕ` : Value of the coefficient parameter.
- `N` : Length of the time series.
- `lag` : Order of the model.
"""
function ARIMA(ϕ::Float64 = 0.5, N::Int64 = 1000, lag::Int64 = 1)

    lag < N || error("`lag` order must be less than time-series length.")

    Random.seed!(123) # Fix seed for reproduciblity
    
    ϵ = rand(Normal(0, 1), τ)
    θ = rand(Normal(0, 1), 1)[1]
    X = zeros(τ)

    for i in 1:lag
        X[i] = ϵ[i]
    end

    for i in lag+1:N
        X[i] = ϵ[i] + ϕ * X[i-1] + θ * ϵ[i-1]
    end

    return X
end