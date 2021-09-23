using TimeSeriesSimulation
using Test

@testset "TimeSeriesSimulation.jl" begin
    
    #------- AR -----------

    ARMA_out = ARMA()
    @test ARMA_out isa Array

    Cyclo_out = CyclostationaryAR()
    @test Cyclo_out isa Array

    RW_out = RandomWalk()
    @test RW_out isa Array

    TRW_out = TrendedRandomWalk()
    @test TRW_out isa Array

    #------- DiffEqs ------

    Lorenz_out = LorenzSystem()
    @test Lorenz_out isa Array

    LV_out = LotkaVolterraSystem()
    @test LV_out isa Array

    Rossler_out = RosslerSystem()
    @test Rossler_out isa Array

    #------- Maps ---------

    CCMap_out = ChaoticCubicMap()
    @test CCMap_out isa Array

    #ChirikovMap_out = ChirikovStandardMap()
    #@test ChirikovMap_out isa Array

    FreitasMap_out = FreitasMap()
    @test FreitasMap_out isa Array

    GrebogiMap_out = GrebogiMap()
    @test GrebogiMap_out isa Array

    HenonMap_out = HenonMap()
    @test HenonMap_out isa Array

    HyperHenonMap_out = HyperChaoticGenHenonMap()
    @test HyperHenonMap_out isa Array

    IkedaMap_out = IkedaMap()
    @test IkedaMap_out isa Array

    LogisticMap_out = LogisticMap()
    @test LogisticMap_out isa Array

    NSMap_out = NoisySineMap()
    @test NSMap_out isa Array

    #------- Other --------

    GN_out = GaussianNoise()
    @test GN_out isa Array

    GOPY_out = GOPY()
    @test GOPY_out isa Array

    #------- Driver -------

    outData = SimulateSystems()
    @test outData isa DataFrame

end
