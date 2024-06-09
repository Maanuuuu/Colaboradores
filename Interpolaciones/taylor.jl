using PyCall
using Plots

np = pyimport("numpy")

gr(size = (300, 300), legend = false)  # provide optional defaults
pgfplotsx()
plotly(ticks=:native)                  # plotlyjs for richer saving options
pythonplot()                           # backends are selected with lowercase names
unicodeplots() 