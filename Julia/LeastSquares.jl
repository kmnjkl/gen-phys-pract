module LeastSquares
    export LeastSquares, lin_ls, plot_lin_ls, const_ls
    import Pkg
    Pkg.add("Plots")
    using Plots
    include("Least_squares/least_squares.jl")
    include("Least_squares/plot_lin_ls.jl")
end