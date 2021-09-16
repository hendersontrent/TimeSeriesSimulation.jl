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
    
    x = zeros(N)
    y = zeros(N)
    x[1] = 0.5 * rand(Uniform(0, 1), 1)[1]
    y[1] = 0.5 * rand(Uniform(0, 1), 1)[1]

    for i in 2:N
        x[i] = 1 - a * x[i-1]^2 + y[i-1]
        y[i] = b * x[i-1]
    end

    ϕ = x + y
    return ϕ
end



"""

    HyperChaoticGenHenonMap(a, b, N)

Simulate the hyperchaotic generalized Henon Map as per Richter, H. The generalized henon maps: examples for higher-dimensional chaos. Int. J. Bifurc. Chaos 12, 1371–1384 (2002).

    Usage:
```julia-repl
HyperChaoticGenHenonMap(a, b, N)
```
Arguments:
- `a` : Value of a parameter.
- `b` : Value of the coefficient parameter.
- `N` : Length of the time series.
"""
function HyperChaoticGenHenonMap(a::Float64 = 1.76, b::Float64 = 0.1, N::Int64 = 1000)

    Random.seed!(123) # Fix seed for reproduciblity
    
    x = zeros(N)
    x[1] = rand(Uniform(0, 1), 1)[1]
    x[2] = rand(Uniform(0, 1), 1)[1]

    for i in 3:N
        x[i] = a - x[i-1]^2 - b * x[i-2]
    end

    return x
end
