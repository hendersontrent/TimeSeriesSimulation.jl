#------------------------------------------
# This script specifies some random walk
# processes
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
#------------------------------------------

using Plots, Distributions, Random

Random.seed!(123) # Fix seed for reproduciblity

#-------------- Random walk ---------------

function RandomWalk(τ::Int64 = 100, trended::Bool = false)

    b = rand(Normal(0, 0.01), 1)[1]
    ϵ = rand(Normal(0, 1), τ)
    X = zeros(τ)
    X[1] = ϵ[1]

    for i in 2:τ
        if trended == true
            X[i] = X[i-1] + b + ϵ[i]
        else
            X[i] = X[i-1] + ϵ[i]
        end
    end

    if trended == true
        p1 = plot(collect(1:τ), X, title = "Trended random walk", xlabel = "Time", ylabel = "Value", legend = false)
    else
        p1 = plot(collect(1:τ), X, title = "Random walk", xlabel = "Time", ylabel = "Value", legend = false)
    end
    return p1
end
