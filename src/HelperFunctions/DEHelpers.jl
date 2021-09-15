#--------------------------------------
# This script defines a bunch of
# helper functions to assist with the
# core functionality of TimeSeriesSimulation.jl
#--------------------------------------

#-------------------------------------------
# Author: Trent Henderson, 15 September 2021
#-------------------------------------------

#----------- Lorenz ------------

function LorenzSetup(du, u, p, t)

    du[1] = p[1] * (u[2] - u[1])
    du[2] = u[1] * (p[2] - u[3]) - u[2]
    du[3] = u[1] * u[2] - p[3] * u[3]
end

#----------- Lotka-Volterra ------------



#----------- Rössler ------------


