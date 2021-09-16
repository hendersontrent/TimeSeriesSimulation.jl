#--------------------------------------
# This script defines a bunch of
# helper functions to assist with the
# core functionality of TimeSeriesSimulation.jl
#--------------------------------------

#-------------------------------------------
# Author: Trent Henderson, 15 September 2021
#-------------------------------------------

#----------- Lorenz -----------------

function LorenzSetup(du, u, p, t)

    du[1] = p[1] * (u[2] - u[1])
    du[2] = u[1] * (p[2] - u[3]) - u[2]
    du[3] = u[1] * u[2] - p[3] * u[3]
end

#----------- Lotka-Volterra ---------

function LotkaVolterraSetup(Δu, u, params, t)

    α, β, γ, δ = params

    Δu[1] = α * u[1] -β * u[1] * u[2]
    Δu[2] = -δ * u[2]+ γ * u[1] * u[2]
end

#----------- Rössler ----------------

function RosslerSetup(Δu, u, params, t)
    
    a, b, c = params

    Δu[1] = -u[2] - u[3]
    Δu[2] = u[1] + a * u[2]
    Δu[3] = b + u[3] * (u[1] - c)
end
