module TimeSeriesSimulation

using Random, Distributions, DifferentialEquations

include("AR/ARMA.jl")
include("AR/Cyclostationary.jl")
include("AR/RandomWalk.jl")
include("DE/Lorenz.jl")
include("DE/LotkaVolterra.jl")
include("DE/Rossler.jl")
include("Map/FreitasMap.jl")
include("Map/HenonMap.jl")
include("Map/IkedaMap.jl")
include("Map/NoisySineMap.jl")
include("Other/GOPY.jl")
include("Simulation/SimulateSystems.jl")

# Exports

export ARMA
export CyclostationaryAR
export RandomWalk
export TrendedRandomWalk
export myLorenz!
export myLV
export RosslerAttractor
export FreitasMap
export HenonMap
export IkedaMap
export NoisySineMap
export GOPY
export SimulateSystems

end
