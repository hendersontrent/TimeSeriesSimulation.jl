#------------------------------------------
# This script specifies noisy sine map
# processes
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
#------------------------------------------

using Plots, Distributions, Random

Random.seed!(123) # Fix seed for reproduciblity

#-------------- Noisy sine map ------------

function noisySineMap(μ::Float64 = 2.4, τ::Int64 = 100, x₁::Float64 = 1.0)
    
    Y = rand(Binomial(1, 0.01), τ)
    η = rand(Uniform(-2, 2), τ)
    x = zeros(τ)
    x[1] = x₁

    for i in 2:τ
        x[i] = μ * sin(x[i-1]) + Y[i-1] * η[i-1]
    end

    p1 = plot(collect(1:τ), x, title = "Noise-driven sine map", xlabel = "Time", ylabel = "Value")
    return p1
end

noisySineMap()
