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

function GOPY(σ::Float64 = 1.5, τ::Int64 = 1000, x₁::Float64 = 0.1, phase::Bool = true)

    ω = (sqrt(5)-1)/2
    x = zeros(τ)
    θ = zeros(τ)
    ϕ = zeros(τ)
    x[1] = x₁
    θ[1] = 0.5

    for i in 2:τ
        x[i] = 2 * σ * tanh(x[i-1]) * cos(2 * π * θ[i-1])
        θ[i] = mod(θ[i-1] + ω, 1)
    end

    ϕ = x/6 + θ/10

    p1 = plot(collect(1:τ), ϕ, title = "Time series of ϕ", xlabel = "Time", ylabel = "ϕ")

    if phase == true
        p2 = plot(ϕ[1:τ-1], ϕ[2:τ], title = "Phase portait", xlabel = "ϕ[1:τ-1]", ylabel = "ϕ[2:τ]", color = Colors.JULIA_LOGO_COLORS[4])
    else
        p2 = plot(θ, x, title = "θ versus x", xlabel = "θ", ylabel = "x", color = Colors.JULIA_LOGO_COLORS[4])
    end
    p3 = plot(p1, p2, layout = (2,1), legend = false)
    return p3   
end

GOPY(1.5, 1000, 0.1, true)
GOPY(1.5, 1000, 0.1, false)

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
        p1 = plot(collect(1:τ), X, title = "Trended random walk", xlabel = "Time", ylabel = "Value", legend = :topleft)
    else
        p1 = plot(collect(1:τ), X, title = "Random walk", xlabel = "Time", ylabel = "Value", legend = :topleft)
    end
    return p1
end

RandomWalk(100, true)
RandomWalk(100, false)

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
