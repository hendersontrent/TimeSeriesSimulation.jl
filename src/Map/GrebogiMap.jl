"""

    GrebogiMap(a, b, J₀, N)

Simulate the Grebogi map as per C. Grebogi, S. W. McDonald, E. Ott and J. A. Yorke, Final state sensitivity: An obstruction to predictability, Physics Letters A, 99, 9, 1983.

    Usage:
```julia-repl
GrebogiMap(a, b, J₀, N)
```
Arguments:
- `a` : Value of the coefficient parameter.
- `b` : Value of the starting point of the time-series vector.
- `J₀` : Value of 
- `N` : Length of the time series.
"""
function GrebogiMap(a::Float64 = 1.32, b::Float64 = 0.9, J₀::Float64 = 0.3, N::Int64 = 1000)
    
    θ = zeros(N)
    X = zeros(N)
    θ[1] = 0.2
    X[1] = 0.0

    for i in 2:N
        θ[i] = θ[i-1] + a * sin(2 * θ[i-1]) - b * sin(4 * θ[i-1]) - X[i-1] * sin(θ[i-1])
        X[i] = -J₀ * cos(θ[i-1])
    end

    return X
end