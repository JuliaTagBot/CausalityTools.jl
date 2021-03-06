# [List of `causality` methods for uncertain data](@id causality_uncertaindata)

If your time series are uncertain both either in indices, values or both, then use one of the following strategies to compute causality statistics over the uncertain time series.

!!! note
    Uncertain data handling relies on the [UncertainData](https://github.com/kahaaga/UncertainData.jl).
    To use the resampling schemes, you need to load this package by first running `using UncertainData` 
    in the Julia console.

- [Naive resampling](@ref causality_uncertain_naiveresampling)
- [Naive constrained resampling](@ref causality_uncertain_naiveconstrained_resampling)
- [Binned resampling](@ref causality_uncertain_binneddatacausalitytest)
- [Strictly increasing, interpolated resampling](@ref causality_uncertain_strictlyincreasing_interpolated)
- [Interpolate-and-bin resampling](@ref causality_uncertain_interpolateandbin_resampling)
