#------------------------------------------
# This script sets out to plot interesting 
# models from the Toker paper:
# https://www.nature.com/articles/s42003-019-0715-9.pdf
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 13 September 2021
#------------------------------------------

using Plots, Distributions, Random

Random.seed!(123) # Fix seed for reproduciblity

#-------------- GOPY ----------------

function GOPY(σ::Float64 = 1.5, τ::Int64 = 50, x₁::Float64 = 1.0)

    ω = MathConstants.golden
    x = zeros(τ)
    θ = zeros(τ)
    ϕ = zeros(τ)

    for i in 1:τ
        if i == 1
            x[i] = x₁
            θ[i] = 0.5
            ϕ[i] = x[i]/6 + θ[i]/10
        else
            x[i] = (2*σ)*(tanh(x[i-1]))*cos(2*π*θ[i-1])
            θ[i] = θ[i-1] + ω*(modf(θ[i-1])[1])
            ϕ[i] = x[i]/6 + θ[i]/10
        end
    end

    p1 = plot(collect(2:τ), ϕ[2:τ], title = "Time series of ϕ", xlabel = "Time", ylabel = "ϕ", lw = 2)
    p2 = plot(θ[2:τ], x[2:τ], title = "θ versus x", xlabel = "θ", ylabel = "x", color = Colors.JULIA_LOGO_COLORS[4], lw = 2)
    p3 = plot(p1, p2, layout = (2,1), legend = false)
    return p3   
end

GOPY()

#-------------- Noisy sine map ------------

function noisySineMap(μ::Float64 = 2.4, τ::Int64 = 50, x₁::Float64 = 1.0)
    
    x = zeros(τ)
    Y = rand(Binomial(1, 0.01), τ)
    η = rand(Uniform(-2, 2), τ)

    for i in 1:τ
        if i == 1
            x[i] = x₁
        else
            x[i] = μ * sin(x[i-1]) + Y[i-1] * η[i-1]
        end
    end

    p1 = plot(collect(2:τ), x[2:τ], title = "Noise-driven sine map", xlabel = "Time", ylabel = "Value", lw = 2)
    return p1
end

noisySineMap()

#-------------- Freitas map ---------------

function FreitasMap(τ::Int64 = 50)

    v0 = rand(Uniform(0, 1), τ)
    v1 = zeros(τ)

    for i in 1:τ
        if i == 1
            v1[i] = 3 * rand(Uniform(0, 1), 1)[1] + 4 * rand(Uniform(0, 1), 1)[1] * (1 - rand(Uniform(0, 1), 1)[1])
        elseif i == 2
            v1[i] = 3 * v0[i-1] + 4 * rand(Uniform(0, 1), 1)[1] * (1 - v0[i-1])
        else
            v1[i] = 3 * v0[i-1] + 4 * v0[i-2] * (1 - v0[i-1])
        end
    end
    
    p1 = plot(collect(1:τ), v1[1:τ], title = "Freitas map", xlabel = "Time", ylabel = "Value", lw = 2)
    return p1
end

FreitasMap()

#-------------- Random walk ---------------

function RandomWalk(τ::Int64 = 50, trended::Bool = false)

    X = zeros(τ + 1)
    b = rand(Normal(0, 0.01), 1)
    ϵ = rand(Normal(0, 1), τ + 1)

    for i in 2:τ+1
        if trended == true
            X[i] = X[i-1] + b[1] + ϵ[i]
        else
            X[i] = X[i-1] + ϵ[i]
        end
    end

    if trended == true
        p1 = plot(collect(2:τ+1), X[2:τ+1], title = "Trended random walk", xlabel = "Time", ylabel = "Value", lw = 2, legend = :topleft)
    else
        p1 = plot(collect(2:τ+1), X[2:τ+1], title = "Random walk", xlabel = "Time", ylabel = "Value", lw = 2, legend = :topleft)
    end
    return p1
end

RandomWalk(50, false)
RandomWalk(50, true)
