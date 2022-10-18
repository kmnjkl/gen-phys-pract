import Pkg
Pkg.add("PlotlyJS")

using Plots

plotlyjs()


"""
    plot_lin_ls(res)
    
    Plot linear least squares fit
    res: result of lin_ls() or const_ls()
    returns: nothing
    Plots: y = a*x + b, where `a = res["a"]`, `b = res["b"]`.
"""
function plot_lin_ls(res)
    if haskey(res, "x")
        x = res["x"]
        x_lo = minimum(x)
        x_hi = maximum(x)
    else
        x = 1:length(res["y"])
        x_lo = 1
        x_hi = length(res["y"])
    end
    y = res["y"]
    y_err = res["y_err"]
    if haskey(res, "a")
        a = res["a"]
        a_err = res["a_err"]
    else
        a = 0
        a_err = 0
    end
    b = res["b"]
    b_err = res["b_err"]
    if haskey(res, "r")
        r = res["r"]
    else
        r = 0
    end

    if size(y,1) < size(x,1)
        y = y'
    end

    p = plot(x, y, seriestype = :scatter, yerror = y_err, label = "", linewidth = 2)
    plot!([x_lo, x_hi], a .* x .+ b, label = "", linewidth = 3)
    plot!(size = (800, 600))

    display(p)
end
