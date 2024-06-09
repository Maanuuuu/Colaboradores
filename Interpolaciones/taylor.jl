using PyCall
using Plots

np = pyimport("numpy")

x = range(0, 10, length=100)
y = sin.(x)
plot(x, y)
plot!(title = "Interpolacion de Taylor", xlabel = "Dias", ylabel = "Temperatura")