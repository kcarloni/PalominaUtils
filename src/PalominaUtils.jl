module PalominaUtils

using Plots
using ColorSchemes

include("utils.jl")
include("units.jl")
include("hist_utils.jl")
include("plot_utils.jl")
include("plot_sq_contour.jl")
# include("heatmap_digitizer.jl")

export get_centers

# export in_circ_window
export in_l_window
export in_b_window
export in_lin_window

export calc_hist_w_errs
export calc_colnorm_hist2d
# export calc_col_quantile

export plot_hist_err!
export plot_1dim_samples!
export plot_dist_summary!

end