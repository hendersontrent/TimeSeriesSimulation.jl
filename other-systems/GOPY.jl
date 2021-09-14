#------------------------------------------
# This script specifies a GOPY model
#------------------------------------------

#------------------------------------------
# Author Trent Henderson, 14 September 2021
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
