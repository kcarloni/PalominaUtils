module PalominaUtils

using Plots
using ColorSchemes
using LaTeXStrings

include("utils.jl")
include("units.jl")
include("hist_utils.jl")
include("plot_utils.jl")
include("plot_sq_contour.jl")
# include("heatmap_digitizer.jl")

import Base.*
*(Lstr_1::LaTeXString, Lstr_2::LaTeXString) = LaTeXString( Lstr_1[1:end-1] * Lstr_2[2:end] )

export get_centers
export get_diffs
export flatten
export try_make_range

# export in_circ_window
export in_l_window
export in_b_window
export in_lin_window

export calc_hist_w_errs
export calc_colnorm_hist2d
# export calc_col_quantile

export plot_hist_err_rect!
export plot_hist_err!
export plot_1dim_samples!
export plot_dist_summary!

end