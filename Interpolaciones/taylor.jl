using Plots
using SymPy

function Interpolacion_y_prediccion(temp_medias, dias,x0)
    # Variables simbólicas
    x = symbols("x")
    n = length(dias)
    
    # Diferencias finitas
    diferencias = [temp_medias]
    for i in 1:(n-1)
        push!(diferencias, diff(diferencias[end]))
    end
 
    # Construcción del polinomio de Taylor
    polinomio_de_Taylor = diferencias[1][1]
    factorial = 1
    for i in 1:(n-1)
        factorial *= i
        term = diferencias[i+1][1] / factorial
        for j in 0:(i-1)
            term *= (x - dias[j+1])
        end
        polinomio_de_Taylor += term
    end
    
    # Predicción en x0 que tomamos como 2.4
    prediccion = subs(polinomio_de_Taylor, x, x0)
    
    return polinomio_de_Taylor, prediccion,x0
end

# Ejemplo de uso
temp_medias = [22.0, 24.5, 23.0, 21.0, 25.0, 26.5, 24.0]  # Promedios de temperaturas en 7 días
dias = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]  # Días

# Calcular la interpolación de Taylor y predecir sobre x0
taylor, prediccion, x0 = Interpolacion_y_prediccion(temp_medias, dias,2.4)

#Imprimimos nuestro Polinomio de Taylor y la prediccion
println("Nuestro Polinomio de Taylor: $taylor")
println("Predicción sobre el punto x0 es: $prediccion ")


# Graficamos la funcion de temperaturas por los dias y el polinomio de taylor
plot(dias, temp_medias, label="Datos originales", lw=2, marker=:o)
plot!(taylor, label="Interpolación de Taylor", lw=2)
xlabel!("Días")
ylabel!("Temperatura (°C)")
title!("Interpolación de Taylor")
ylims!(0, 30)
xlims!(1, 8)
