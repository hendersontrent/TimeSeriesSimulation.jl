"""

    RandomWalk(N)

Simulate a random walk process.

    Usage:
```julia-repl
RandomWalk(N)
```
Arguments:
- `N` : Length of the time series.
"""
function RandomWalk(N::Int64 = 1000)

    Random.seed!(123) # Fix seed for reproduciblity

    b = rand(Normal(0, 0.01), 1)[1]
    ϵ = rand(Normal(0, 1), N)
    X = zeros(τ)
    X[1] = ϵ[1]

    for i in 2:N
        X[i] = X[i-1] + ϵ[i]
    end

    return X
end



"""

    TrendedRandomWalk(N)

Simulate a trended random walk process.

    Usage:
```julia-repl
TrendedRandomWalk(N)
```
Arguments:
- `N` : Length of the time series.
"""
function TrendedRandomWalk(N::Int64 = 1000)

    Random.seed!(123) # Fix seed for reproduciblity

    b = rand(Normal(0, 0.01), 1)[1]
    ϵ = rand(Normal(0, 1), N)
    X = zeros(τ)
    X[1] = ϵ[1]

    for i in 2:N
        X[i] = X[i-1] + b + ϵ[i]
    end

    return X
end
