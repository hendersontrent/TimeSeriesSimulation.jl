#------------------------------------------
# This script specifies some cyclostationary
# AR processes
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
#------------------------------------------

using Plots, Distributions, Random

Random.seed!(123) # Fix seed for reproduciblity

#-------------- Cyclostationary AR process ---------------

function CyclostationaryAR(n::Int64 = 100)
    
    τ = 50
    ϵ = rand(Normal(0, 1), n)
    T = 10
    a₁ = 2 * cos(2 * π/ T) * ℯ^ -1 / τ
    a₂ = -ℯ^ -2 / τ
    X = zeros(n)
    X[1] = ϵ[1]
    X[2] = a₁ * X[1] + ϵ[2]

    for i in 3:n
        X[i] = a₁ * X[i-1] + a₂ * X[i-2] + ϵ[i]
    end

    p1 = plot(collect(1:n), X, title = "Cyclostationary AR process", xlabel = "Time", ylabel = "Value")
end

CyclostationaryAR(100)
