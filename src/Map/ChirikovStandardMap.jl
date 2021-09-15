"""

    ChirikovStandardMap(k, θ₁, p₁, N)

Simulate the Chirikov standard map as per B. V. Chirikov, Preprint N. 267, Institute of Nuclear Physics, Novosibirsk (1969).

    Usage:
```julia-repl
ChirikovStandardMap(k, θ₁, p₁, N)
```
Arguments:
- `k` : Value of the coefficient parameter.
- `θ₁` : Starting value of θ vector.
- `p₁` : Starting value of p vector.
- `N` : Length of the time series.
"""
function ChirikovStandardMap(k::Float64 = 0.971635, θ₁::Float64 = 0.001245, p₁::Float64 = 0.00875, N::Int64 = 1000)
    
    θ = zeros(N)
    p = zeros(N)
    θ[1] = θ₁
    p[1] = p₁

    for i in 2:N
        p[i] = p[i-1] + k * sin(θ[i-1])
        θ[i] = θ[i-1] + p[i]
    end

    return p, θ
end
