# TimeSeriesSimulation.jl

[![Coverage](https://codecov.io/gh/hendersontrent/TimeSeriesSimulation.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/hendersontrent/TimeSeriesSimulation.jl)

Automatic simulation of numerous types of dynamical systems and time-series processes.

## Functionality

The main function is `SimulateSystems()` which automatically runs every individual system function included in `TimeSeriesSimulation.jl` and concetenates the results into a [tidy](https://vita.had.co.nz/papers/tidy-data.pdf) DataFrame ready for analysis or visualisation. This currently works via the following:

```
using TimeSeriesSimulation
data = SimulateSystems()
```

If you are instead interested only in individual systems, you can directly call that system's function, such as for the GOPY model:

```
x = GOPY(σ = 1.5, x₁ = 0.1, N = 1000)
```

## Notes

This package is intended to be a growing resource and is continuously being added to with more models, systems, and processes. In addition, while many great packages exist for simulating time-series models, this package is both: (i) trying to be as lightweight as possible; and (ii) a source of practice of manual system specification for the author.
