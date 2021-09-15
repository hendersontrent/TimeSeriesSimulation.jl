"""

    GaussianNoise(N)

Simulate of Gaussian white noise.

    Usage:
```julia-repl
GaussianNoise(N)
```
Arguments:
- `N` : Length of the time series.
"""
function GaussianNoise(N::Int64 = 1000)
    
    Random.seed!(123) # Fix seed for reproduciblity

    X = rand(Normal(0, 1), N)

    return X
end