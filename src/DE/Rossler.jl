#------------------------------------------
# This script specifies the Rössler system
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
#------------------------------------------

using Plots, DifferentialEquations

params = (0.2, 0.2, 5.7)

function RosslerAttractor(Δu, u, params, t)
    a, b, c = params

    Δu[1] = -u[2] - u[3]
    Δu[2] = u[1] + a * u[2]
    Δu[3] = b + u[3] * (u[1] - c)
end

u0 = [1.0; 1.0; 1.0]
tspan = (0.0, 1000.0)

prob = ODEProblem(RosslerAttractor, u0, tspan, params)
sol = solve(prob)
