"""

    SimulateSystems()

Automatically simulate many time-series models at once and return a dataframe for further usage.

    Usage:
```julia-repl
SimulateSystems()
```
"""
function SimulateSystems()
    
    #------- AR -----------

    ARMA_out = DataFrame(values = ARMA(), model = "ARMA")
    ARMA_out[!, :timepoint] = 1:nrow(ARMA_out)

    Cyclo_out = DataFrame(values = CyclostationaryAR(), model = "CyclostationaryAR")
    Cyclo_out[!, :timepoint] = 1:nrow(Cyclo_out)

    RW_out = DataFrame(values = RandomWalk(), model = "RandomWalk")
    RW_out[!, :timepoint] = 1:nrow(RW_out)

    TRW_out = DataFrame(values = TrendedRandomWalk(), model = "TrendedRandomWalk")
    TRW_out[!, :timepoint] = 1:nrow(TRW_out)

    #------- DiffEqs ------



    #------- Maps ---------

    CCMap_out = DataFrame(values = ChaoticCubicMap(), model = "ChaoticCubicMap")
    CCMap_out[!, :timepoint] = 1:nrow(CCMap_out)

    ChirikovMap_out = DataFrame(values = ChirikovStandardMap(), model = "ChirikovStandardMap")
    ChirikovMap_out[!, :timepoint] = 1:nrow(ChirikovMap_out)

    FreitasMap_out = DataFrame(values = FreitasMap(), model = "FreitasMap")
    FreitasMap_out[!, :timepoint] = 1:nrow(FreitasMap_out)

    GrebogiMap_out = DataFrame(values = GrebogiMap(), model = "GrebogiMap")
    GrebogiMap_out[!, :timepoint] = 1:nrow(GrebogiMap_out)

    HenonMap_out = DataFrame(values = HenonMap(), model = "HenonMap")
    HenonMap_out[!, :timepoint] = 1:nrow(HenonMap_out)

    HyperHenonMap_out = DataFrame(values = HyperChaoticGenHenonMap(), model = "HyperChaoticGenHenonMap")
    HyperHenonMap_out[!, :timepoint] = 1:nrow(HyperHenonMap_out)

    IkedaMap_out = DataFrame(values = IkedaMap(), model = "IkedaMap")
    IkedaMap_out[!, :timepoint] = 1:nrow(IkedaMap_out)

    LogisticMap_out = DataFrame(values = LogisticMap(), model = "LogisticMap")
    LogisticMap_out[!, :timepoint] = 1:nrow(LogisticMap_out)

    NSMap_out = DataFrame(values = NoisySineMap(), model = "NoisySineMap")
    NSMap_out[!, :timepoint] = 1:nrow(NSMap_out)

    #------- Other --------

    GN_out = DataFrame(values = GaussianNoise(), model = "GaussianNoise")
    GN_out[!, :timepoint] = 1:nrow(GN_out)

    GOPY_out = DataFrame(values = GOPY(), model = "GOPY")
    GOPY_out[!, :timepoint] = 1:nrow(GOPY_out)

    #------- Concatenate --------

    outData = [ARMA_out; Cyclo_out; RW_out; TRW_out; CCMap_out; ChirikovMap_out; FreitasMap_out; GrebogiMap_out; HenonMap_out; HyperHenonMap_out; IkedaMap_out; LogisticMap_out; NSMap_out; GN_out; GOPY_out]

    return outData

end