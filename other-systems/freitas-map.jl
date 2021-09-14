#------------------------------------------
# This script specifies a Freitas map
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
#------------------------------------------

using Plots, Distributions, Random

Random.seed!(123) # Fix seed for reproduciblity

#-------------- Freitas map ---------------

function FreitasMap(τ::Int64 = 1000, firstReturn::Bool = false)

    v0 = rand(Uniform(0, 1), τ)
    v1 = zeros(τ)
    v1[1] = 3 * rand(Uniform(0, 1), 1)[1] + 4 * rand(Uniform(0, 1), 1)[1] * (1 - rand(Uniform(0, 1), 1)[1])
    v1[2] = 3 * v0[2-1] + 4 * rand(Uniform(0, 1), 1)[1] * (1 - v0[2-1])

    for i in 3:τ
        v1[i] = 3 * v0[i-1] + 4 * v0[i-2] * (1 - v0[i-1])
    end

    if firstReturn == true
        p1 = plot(v1[2:τ], v1[1:τ-1], title = "Freitas map", xlabel = "Time", ylabel = "Value", seriestype = :scatter)
    else
        p1 = plot(collect(1:τ), v1, title = "Freitas map", xlabel = "Time", ylabel = "Value")
    end
    return p1
end

FreitasMap(1000, true)
FreitasMap(1000, false)
