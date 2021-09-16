"""

    ARMA(ϕ, θ, p, q, N, lag)

Simulate an autoregressive moving average (ARMA) process.

    Usage:
```julia-repl
ARMA(ϕ, θ, p, q, N, lag)
```
Arguments:
- `ϕ` : Value of the autoregressive coefficient parameter.
- `θ` : Value of the moving average coefficient parameter.
- `p` : Order of the autoregressive component.
- `q` : Order of the moving average component.
- `N` : Length of the time series.
"""
function ARMA(ϕ::Float64 = 0.5, θ::Float64 = 0.5, p::Int64 = 1, q::Int64 = 1, N::Int64 = 1000)

    p < N || error("`p` order must be less than time-series length.")
    q < N || error("`q` order must be less than time-series length.")

    Random.seed!(123) # Fix seed for reproduciblity
    
    ϵ = rand(Normal(0, 1), N)
    X = zeros(N)
    ΣAR = zeros(N)
    ΣMA = zeros(N)

    for i in 1:p
        X[i] = ϵ[i]
    end

    for i in p+1:N
        AR = zeros(p)
        for j in 1:p
            AR[j] = ϕ * X[i-j]
        end
        ΣAR[i] = sum(AR)
    end

    for i in q+1:N
        MA = zeros(q)
        for k in 1:q
            MA[q] = θ * ϵ[i-k]
        end
        ΣMA[i] = sum(MA)
    end

    X = ΣAR + ΣMA + ϵ

    for i in 1:p
        X[i] = ϵ[i]
    end

    return X
end
