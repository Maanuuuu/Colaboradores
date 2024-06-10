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