#------------------------------------------
# This script specifies some ARMA processes
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
#------------------------------------------

using Plots, Distributions, Random

Random.seed!(123) # Fix seed for reproduciblity

#-------------- ARMA model ---------------

function ARMA(ϕ::Float64 = 0.5, τ::Int64 = 100, lag::Int64 = 1)
    
    ϵ = rand(Normal(0, 1), τ)
    θ = rand(Normal(0, 1), 1)[1]
    X = zeros(τ)

    for i in 1:lag
        X[i] = ϵ[i]
    end

    for i in lag+1:τ
        X[i] = ϵ[i] + ϕ * X[i-1] + θ * ϵ[i-1]
    end

    p1 = plot(collect(1:τ), X, title = "ARMA", xlabel = "Time", ylabel = "Value", legend = false)
    return p1
end
