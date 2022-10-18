
include("../Julia/Least_squares/least_squares.jl")
include("../Julia/Least_squares/plot_lin_ls.jl")

x = as = [
    0
    0.0018
    0.0027
    0.0038
    0.0052
    0.0067
    0.0085
]

y = J = [
    0.0033
    0.00472
    0.00526
    0.00621
    0.0076
    0.0086
    0.0101
]

Sy = Sj = [
    0.0003
    0.00019
    0.00018
    0.00021
    0.0003
    0.0003
    0.0003
]

res = lin_ls(x, y, Sy)
println("a = ", res["a"])
println("Sa = ", res["Sa"])
println("b = ", res["b"])
println("Sb = ", res["Sb"])
println("r = ", res["r"])

res["x"] *= 1000
res["y"] *= 1000
res["Sy"] *= 1000
# res["a"] *= 1000
# res["Sa"] *= 1000
res["b"] *= 1000
res["Sb"] *= 1000

plot_lin_ls(res)

# Plot customizations
plot!(box=:box)
plot!(gridalpha=0.3)
plot!(xlabel="a^2 * 10^-3, м^2    --->", ylabel="J * 10^-3, кг*м^2    --->")
plot!(xticks=[0, 1, 2, 3, 4, 5, 6, 7, 8])
plot!(yticks=[3, 4, 5, 6, 7, 8, 9, 10])
