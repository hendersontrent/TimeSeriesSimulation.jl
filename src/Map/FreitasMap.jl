"""

    FreitasMap(N)

Simulate the Freitas map as per Freitas, U. S., Letellier, C. & Aguirre, L. A. Failure in distinguishing colored noise from chaos using the “noise titration” technique. Phys. Rev. E 79, 035201 (2009).

    Usage:
```julia-repl
FreitasMap(N)
```
Arguments:
- `N` : Length of the time series.
"""
function FreitasMap(N::Int64 = 1000)

    Random.seed!(123) # Fix seed for reproduciblity

    v0 = rand(Uniform(0, 1), N)
    v1 = zeros(N)
    v1[1] = 3 * rand(Uniform(0, 1), 1)[1] + 4 * rand(Uniform(0, 1), 1)[1] * (1 - rand(Uniform(0, 1), 1)[1])
    v1[2] = 3 * v0[2-1] + 4 * rand(Uniform(0, 1), 1)[1] * (1 - v0[2-1])

    for i in 3:N
        v1[i] = 3 * v0[i-1] + 4 * v0[i-2] * (1 - v0[i-1])
    end

    return v1
end
