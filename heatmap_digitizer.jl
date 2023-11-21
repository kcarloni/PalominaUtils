
using Images

function digitize_map( 
    map_path, scale_path, map_bins, vlims )

    img_scale = load( scale_path )
    img_map   = load( map_path )

    # sample once per bin: 
        n_x_bins, n_y_bins = map_bins
        n_x_pixels, n_y_pixels = size(img_map)

        x_bin_size = n_x_pixels ÷ n_x_bins 
        y_bin_size = n_y_pixels ÷ n_y_bins

        x_px0 = x_bin_size ÷ 2
        y_px0 = y_bin_size ÷ 2

        i_x = (x_px0):x_bin_size:(x_px0 + x_bin_size*(n_x_bins-1))
        i_y = (y_px0):y_bin_size:(y_px0 + y_bin_size*(n_y_bins-1))

        binned_map = img_map[ i_x, i_y ]
    #

    # take a slice of the colorbar: 
        cropped_scale = img_scale[:, 1]
        n_scale_pixels = size(cropped_scale)[1]

        pixel_vals = range( vlims..., length=n_scale_pixels )        
    #

    # now map colors -> values. 
    map_vals = Matrix{Float64}(undef, size(binned_map)...)

    cdiff_white = minimum( colordiff.( colorant"white", cropped_scale ) )
    cdiff_black = minimum( colordiff.( colorant"black", cropped_scale) )
    max_cdiff = min(cdiff_white, cdiff_black )

    for i in 1:n_x_bins, j in 1:n_y_bins
        c = binned_map[i,j]
        k = argmin( @. colordiff(cropped_scale, c) )

        bin = (30-i, j)
        if colordiff( cropped_scale[k], c ) > max_cdiff
            map_vals[bin...] = NaN
        else
            map_vals[bin...] = pixel_vals[n_scale_pixels+1-k]
        end
    end

    return map_vals
end