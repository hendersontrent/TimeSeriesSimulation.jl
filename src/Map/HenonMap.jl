"""

    HenonMap(a, b, N)

Simulate the Henon Map as per M. Henon (1976). "A two-dimensional mapping with a strange attractor". Communications in Mathematical Physics 50 (1)

    Usage:
```julia-repl
HenonMap(a, b, N)
```
Arguments:
- `a` : Value of a parameter.
- `b` : Value of the coefficient parameter.
- `N` : Length of the time series.
"""
function HenonMap(a::Float64 = 1.4, b::Float64 = 0.3, N::Int64 = 1000)

    Random.seed!(123) # Fix seed for reproduciblity
    
    x = zeros(τ)
    y = zeros(τ)
    z = zeros(τ)
    x[1] = 0.5 * rand(Uniform(0, 1), 1)[1]
    y[1] = 0.5 * rand(Uniform(0, 1), 1)[1]
    z[1] = 0.5 * rand(Uniform(0, 1), 1)[1]

    for i in 2:N
        x[i] = a - y[i-1]^2 - b * z[i-1]
        y[i] = x[i-1]
        z[i] = y[i-1]
    end

    return x,y,z
end
