#+++++++++++++++++++++++++++#
#          Clase 3          # 
#+++++++++++++++++++++++++++#

#++++++++++++++++++++++++++++++#
#    Configuracion Inicial     #
#++++++++++++++++++++++++++++++#

# Se necesita cargar los paquetes que se van a usar 
install.packages("pacman")
pacman::p_load(tidyverse,haven,readxl,WriteXLS)
    # Se utiliza :: para llamar una funcion de un paquete
  
# Se utiliza el comando ls() para decir cuantas variables tienes en la memoria
ls()
list = ls()

# Para eliminar objetos se utiliza el comando rm()
rm()
rm(list = ls())
   # Se tiene list para poder borrar todas las variables de la memoria

# Se utiliza el comando cat para borrar toda la consola
cat()
cat("\f")

# Para saber cuales carpetas hay en el directorio actual se utiliza el comando dir()
dir(".")
dir("help")
   # Para conocer cuales archivos hay dentro de una carpeta se pone el nombre de la carpeta


#++++++++++++++++++++++++++++++#
# 1. Estructuras de datos en R #
#++++++++++++++++++++++++++++++#

# Para fijar el directorio se utiliza el comando setwd()
setwd("/Users/dq/Desktop/R/Git/")
setwd("/Users/dq/Desktop/R/Git/clase_3")

# Para saber en cual directorio se esta trabajando se utiliza el comando getwd()
getwd()

# Para saber cuales archivos tienes en el directorio de trabajado se utiliza
# el comando list.files()
list.files()

#++++++++++++++++++++++++#
# 2. Tipos de datos en R #
#++++++++++++++++++++++++#

   # Para escribir un vector con mas de un elemento se utiliza c

# El tipo de datos que son caracteres
vector_c = c("hola","hello")

# El tipo de datos es numerico 
vector_n = c(5,2)

# El tipo de dato son logicos
vector_l = c(TRUE,FALSE)

# Para saber que tipo de datos son se utiliza is.
  # Caracter
is.character(vector_c)

  # Logico
is.logical(vector_l)

  # Numerico
is.numeric(vector_n)

#++++++++++++++++++++++++++++++#
# 3. Estructuras de datos en R #
#++++++++++++++++++++++++++++++#

#--------------------------------------
# Dim |  Homogeneos	 |  Heterogeneos  |
#--------------------------------------
#  1d	|    Vector    |   Listas       |
#  2d	|    Matriz    |   Dataframe    |
#  nd	|    Array     |                |
#--------------------------------------


### Vectores ###

# Caracteres
char_vec = c("a","b","c","d","e","f","g","h")
char_vec

# logicos
log_vec = c(TRUE,FALSE,T,F)
log_vec

# numericvos
log_num = 1:5
log_num

  # ¡Ojo! Los elementos dentro del vector no son homogeneos
vector_h = c(TRUE,1,2,"c")
  # El comando str cambia todos los elementos de un vector para que sean caracteres
str(vector_h)
vector_h

# Para transformar a un numero se utiliza el comando as.numeric()
cambio_vectorh = as.numeric(vector_h)
cambio_vectorh
  # No son homogeneas y por eso el programa cambia valores a NA

# Para seleccionar valores dentro de un vector se utiliza []
char_vec
char_vec[3]
char_vec[1:3]

# Para eliminar el elemento de un vectos se utiliza [-]
char_vec = char_vec[-2]
char_vec

# Para dejar todos los elementos diferentes a "cualquier valor " se utiliza != "cualquier valor "
char_vec = char_vec[char_vec != "c"]
char_vec

# El simbolo ! significa negacion & el de %in% indica si estan en las posiciones
!char_vec %in% c("c","r")
char_vec 


### Matrices ###

# Para generar una matriz se utiliza el comando matrix
   # generemos una matriz de numeros aleatorios (de una distribucion normal)
matriz = matrix(rnorm(n = 25,mean = 50,sd = 5), nrow = 5, ncol = 5)
matriz

# Para saber el numero de filas y columnas de una matriz se se utiliza los comandos
# ncol & nrow
nrow(matriz)
ncol(matriz)

# Para saber como se llaman las filas y las columnas se utilizan los comandos
# rownames & colnames
rownames(matriz)
colnames(matriz)
   # Para cambiar los nombres de las columnas y filas
rownames(matriz) = c("Fila1","Fila2","Fila3","Fila4","Fila5")
rownames(matriz)
colnames(matriz) = c("Columna 1","Columna 2","Columna 3","Columna 4","Columna 5")
colnames(matriz)
   # Para saber y cambiar el nombra de una columna o fila en especifico
colnames(matriz)[3]
colnames(matriz)[2] = "Col 2"
matriz
rownames(matriz)[1] = "Fila 1"
matriz

# Para saber cuales elementos estan en cierta ubicacion usar [fila,columna]
matriz[1,]
matriz[3,2]
matriz[,4]

### Dataframes ###

# Crean vectores para despues unir en el dataframe
nota_numerica = seq(0,10,2)
nota_numerica
nota_alfabetica = c("a","b","b","a","c","b")
nota_alfabetica

# Para crear un data frame se necesita usar comando data.frame
dfm = data.frame(nota_alfabetica,nota_numerica)

# Para saber cuales elementos hay en un data frame usar [filas,columnas]
dfm[3,2]
dfm[,1]
dfm[4,]
dfm 

### Listas ###

# Para crear una lista se utiliza el comando list()
lista = list()
  # Para ir agregando valores a la lista utilizar [[#]]
lista[[1]] = matriz
lista[[2]] = dfm
A = matriz[,3]
lista[[3]] = A

# Para saber cuales elementos estar en una lista utilizar comando class
class(lista[[2]])
# Para verificar los nombres de los elementos utilizar comando colnames
# atributos de una lista
colnames(lista[[2]])
# Para saber la longitud de una lista utilizar el comando length
length(lista)

# Para ver los elementos dentro de las lista utilizar [[# Lista]][filas,columnas]
lista
lista[[1]][,2]
lista[[2]][,2]


