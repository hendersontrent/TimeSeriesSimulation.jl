#------------------------------------------
# This script specifies the Lorenz system
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
#------------------------------------------

using Plots, DifferentialEquations

function myLorenz!(du, u, p, t)
    
    x, y, z = u
    σ, ρ, β, = p
    
    du[1] = dx = σ * (y - x)
    du[2] = dy = x*(ρ-z) - y
    du[3] = dz = x*y - β*z
end

u0 = [1.0, 0.0, 0.0] 
tspan = (0.0, 100.0)
p = [10.0, 28.0, 8/3]

prob = ODEProblem(myLorenz!, u0, tspan, p)
sol = solve(prob)

plot(sol, label = ["x" "y" "z"])
