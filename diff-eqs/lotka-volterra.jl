#------------------------------------------
# This script specifies the Lotka-Volterra 
# equations
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
#------------------------------------------

using Plots, DifferentialEquations

params = (2.0, .5, .2, .6)

function myLV(Δu, u, params, t)

    α, β, γ, δ = params

    Δu[1] = α * u[1] -β * u[1] * u[2]
    Δu[2] = -δ * u[2]+ γ * u[1] * u[2]
end

u0 = [10.0; 10.0]
tspan = (0.0, 100.0)

prob = ODEProblem(myLV, u0, tspan, params)
sol = solve(prob)
