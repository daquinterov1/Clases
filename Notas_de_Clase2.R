# Clase 2

# Se le asigna a la variables utilizando "=" o "<-"
data = iris
pato <- 8

# Si se quiere mirar la base de datos se usa el comando View
View(data)

# Para saber cuales librerias tienes instaladas se usa comando installed.package
installed.packages()[c(1,3,4)]
  # [c(1,3,4)] le esta indicando a R que solo quiero ver los paquetes 1,3 y 4

installed.packages()

# Para verificar que un paquete en particular esta instalado se utiliza 
# comando is.element()
is.element("ggplot2",installed.packages()[,1])

# Para instalar un paquete se utiliza el comando install.packages()
install.packages("dplyr")

# Pueden existir paquetes en el disco duro pero para llamar a la sesion actual 
# se deben que llamar con comando require() & library()
require('dplyr')
library('dplyr')
  # La diferencia entre require() & library() es que...

# Para saber el numero de paquetes disponibles se utiliza el comando available.packages()
available.packages()[,1:2]
   # [,1:2] solo sirve para decirle a R como mostrar los datos
nrow(available.packages())
   # nrow sirve para mostrar el numero de paquetes en R
     # nrow cuenta el numero de columnas

# Para unload una base de datos se va a usar el comando detach
detach("package:dplyr", unload = TRUE)
   # Se tiene que especificar con "package: ..." cual paquete eliminar

# Para descargar una nueva version de un paquete viejo se usar el comando install_version
require(devtools)
install.version("ggplot2", version = "3.3.2", repos = "http://cran.us.r-project.org")
   # No me funciona y no sale en el Help

# Para eliminar un paquete que esta descargado usar comando remove.packages()
remove.packages("dplyr")
  # Especificar cuales paquetes eliminar





