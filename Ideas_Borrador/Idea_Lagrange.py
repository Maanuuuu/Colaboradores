#Importar la libreria
import numpy as np
import matplotlib.pyplot as plt

#Datos de prueba
baja = np.array([10,7,4,3,5,2,2]) #Temperatura baja
alta = np.array([21,18,12,11,14,13,10]) #Temperatura alta

#Variables para trabajar:
dias = len(baja) #Esto es para contar cuanto dias
promedio_T = np.zeros(dias)
dias_lista = np.zeros(dias)

#Sacar promedio de temperatura
for i in range (dias):
    promedio_T[i]= (alta[i]+baja[i])/2

#Contar cantidad de dias
j = 1
for i in range (len(promedio_T)):
    dias_lista[i] = j
    j += 1

#Validacion de proceso:
#Validacion para ver que si la cantidad de datos que son iguales"
def Cantidad_dias (x,y):
    xx = len(x)
    yy = len(y)
    if xx != yy:
        return False
    else:
        return True

#Procedimiento para el Interpolacion de Lagrange:

#Sacar el valor el vector "X":
xpp = np.linspace(min(dias_lista), max(dias_lista), 100)

#Sacar el valor el vector "Y":
ypp = 0
for i in range (dias):
    acum_p = 1 #Para acumular el valor de y
    for j in range (dias):
        if i!= j:
            acum_p *= (xpp-dias_lista[j])/(dias_lista[i]-dias_lista[j])
    ypp += promedio_T[i] * acum_p

#Grafica
plt.plot(dias_lista, promedio_T, 'o', label="La semana de Temperatura") #Ubicar los puntos sobre el dia y su correspondiente temperatura
plt.plot(xpp,ypp,label="El resultado por Interpolacion de Lagrange") #Graficar el vector
plt.legend()
plt.show()