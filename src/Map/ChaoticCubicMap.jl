"""

    ChaoticCubicMap(f, Q, A, x₁, N)

Simulate the logistic map as per Venkatesan, A. & Lakshmanan, M. Interruption of torus doubling bifurcation and genesis of strange nonchaotic attractors in a quasiperiodically forced map: Mechanisms and their characterizations. Phys. Rev. E 63, 026219 (2001).

    Usage:
```julia-repl
ChaoticCubicMap(f, Q, A, x₁, N)
```
Arguments:
- `f` : Value of a coefficient parameter.
- `Q` : Value of a parameter.
- `A` : Value of a coefficient parameter.
- `x₁` : Initial value of x vector at time 1.
- `N` : Length of the time series.
"""
function ChaoticCubicMap(f::Float64 = -0.8, Q::Float64 = 0.0, A::Float64 = 1.5, x₁::Float64 = 0.1, N::int64 = 1000)

    ω = (sqrt(5)-1)/2
    x = zeros(N)
    θ = zeros(N)
    ϕ = zeros(N)
    x[1] = x₁
    θ[1] = 0.5

    for i in 2:N
        x[i] = Q + f * cos(2 * π * θ[i-1]) - A * x[i-1]^3
        θ[i] = mod(θ[i-1] + ω, 1)
    end

    ϕ = x/6 + θ/10
    return ϕ 
end