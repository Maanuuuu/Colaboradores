using PyCall
using Plots
import SciPy ; const sp = SciPy
using Polynomials
sym = pyimport("sympy") 
np = pyimport("numpy") 

# Supongamos que tienes las siguientes listas:
dias = [1, 2, 3, 4, 5]  # Ejemplo de días
temperaturas = [23, 25, 28, 22, 24]  # Ejemplo de temperaturas en grados Celsius

# Ajustamos los datos a un polinomio, por ejemplo, de grado 2
p = fit(Polynomial, dias, temperaturas, 4)
println(p)
# Generamos valores de x para la gráfica (días)
x = range(minimum(dias), maximum(dias), length=100)

# Calculamos los valores de y (temperaturas) usando la función polinomial
y = p.(x)
interpolated_function = sp.interpolate.interp1d(x, y)

# Graficamos los datos originales como puntos y la función ajustada como una línea
scatter(dias, temperaturas, color=:red, label="Datos originales")
plot!(x, y, label="Ajuste polinomial", linewidth=2)
xlabel!("Días")
ylabel!("Temperatura (°C)")
title!("Ajuste de Temperatura vs Días")