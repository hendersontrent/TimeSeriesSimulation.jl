#------------------------------------------
# This script specifies the Henon map as
# per M. Henon (1976). "A two-dimensional 
# mapping with a strange attractor". 
# Communications in Mathematical Physics 50 (1)
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
#------------------------------------------

using Plots, Distributions, Random

Random.seed!(123) # Fix seed for reproduciblity

#-------------- Henon map ---------------

function HenonMap(a::Float64 = 1.4, b::Float64 = 0.3, τ::Int64 = 1000)
    
    x = zeros(τ)
    y = zeros(τ)
    z = zeros(τ)
    x[1] = 0.5 * rand(Uniform(0, 1), 1)[1]
    y[1] = 0.5 * rand(Uniform(0, 1), 1)[1]
    z[1] = 0.5 * rand(Uniform(0, 1), 1)[1]

    for i in 2:τ
        x[i] = a - y[i-1]^2 - b * z[i-1]
        y[i] = x[i-1]
        z[i] = y[i-1]
    end

    p1 = plot(x, y, z, title = "Henon map", legend = false)
    return p1
end
