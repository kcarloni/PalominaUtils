module PalominaUtils

include("macros.jl")
export @println
export @display
export @dump
export @flatten

using ColorSchemes
using Colors
include("colors.jl")
export rby_4, earth_4, egypt_4, west_4, poppy_4, buor_4, burd_4
export gpb_pastel_12, dracula_8, dracula_6
export CMR_6, CMR_5, CMR_spectrum
export prometheus_6
include("colors_distinct_sequential.jl")
export distinct_sequential


# macro that allows for easy wrapping of strings into latexstrings.
# this is needed because string multiplication, interpolation outputs strings by default;
# adding a wrapper quickly turns them back into latexstrings. e.g: 
# @lstring "energy [" * L"10^{2.7}" * " GeV]"
# gamma = 2.7; str = @lstring "energy [$(L"10^{%$gamma}") GeV]"
using LaTeXStrings: latexstring
macro lstring(x)
    return quote
        latexstring( $(esc(x)) )
    end
end
export @lstring


get_diffs( x ) = (x[2:end] .- x[1:end-1])
get_centers( x ) = 0.5 .* (x[1:end-1] .+ x[2:end])
get_centers( x::AbstractRange ) = range( first(x)+step(x)/2, last(x)-step(x)/2, step=step(x) )
get_edges( x::AbstractRange ) = range( first(x)-step(x)/2, last(x)+step(x)/2, step=step(x) )
flatten( x::AbstractArray ) = reshape( x, prod(size(x)) )
function try_make_range( x, rtol=1e-5 )

    xr = range( x[1], x[end], length(x) )

    if all( isapprox.( x, xr; rtol ) )
        return xr 
    else
        error("steps not approx. equal")
    end
end
export get_diffs, get_centers, get_edges, try_make_range, flatten

const PalomaPath = pkgdir(@__MODULE__) * "/"
export PalomaPath

# include("plot_sq_contour.jl")
# include("hist_utils.jl")
# include("plot_utils.jl")

# export calc_hist_w_errs
# export calc_colnorm_hist2d
# # export calc_col_quantile

# export plot_hist_err_rect!
# export plot_hist_err!
# export plot_1dim_samples!
# export plot_dist_summary!


# # # py-utils
# # include("py_utils.jl")

end