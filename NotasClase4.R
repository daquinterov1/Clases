#----------------#
#     Clase 4    #
#----------------#

# Configuracion Inicial
rm(list = ls())
pacman::p_load(tidyverse,readxl,haven)
  
# Para mirar el URL donde se saca la base de datos usar comando browseURL
    # Tydyverse
browseURL(url = "https://www.tidyverse.org", browser = getOption("browser"))

#----------------#
# 1. Data Tyding #
#----------------#

# Para cargar bases de datos de la internet utilizar el comando readRDS
   # Solo funciona cuando se utiliza un RDS no para otros formatos
browseURL(url = "https://www.dane.gov.co/index.php/estadisticas-por-tema/demografia-y-poblacion/proyecciones-de-poblacion", browser = getOption("browser")) # Fuente: DANE
Dane = readRDS(file = 'data/input/proyecciones DANE.rds') %>%
  dplyr::select(.,name_codigo , year , total_poblacion , codigo)
  # El %>% se llama pipe y permite adicionarle una funcion adicional
  # Se utiliza el comando select para escoger las variables de la base que queremos

# Para generar una nueva en el dataframe existente se utiliza nombre_de_base$nombre_variable
Dane$dummy = 1
   # Tienen indicar a cual objeto agregar a la base de datos Dane

# Para generar variables en data frame se utiliza el comando mutate
Dane = mutate(Dane, colombia = 1)
   # Se dice que quieres crear una variable donde mutate(base_datos,nombre_variable)

# El comando nchar me devuelve el numero de caracteres
nchar('Hola')

# El comando ifelse sirve para probar una condicional 
Dane = mutate(Dane , depto = ifelse(test = nchar(codigo) == 2 , yes = 1 , no = 0))
   # Todas las observaciones cuya fila tengan dos caracteres se devuelve 1 de lo contrario 0

# Para crear una variable usando el vector utilizar $
Dane$mpio = ifelse(test =  nchar(Dane$codigo) > 2 , yes = 1, no = 0)
   # Para no tener que indicar otra vez de cual base y variable estamos usando poner $

# Para rellenar el nombre de la variable se utiliza el comando subset
Dane_mpio = subset(Dane, mpio == 1)
    # Una nueva variable que muestra solo los datos que cumpla las condiciones
    # Filtrar la base de datos

# Se utiliza el substr para que devuelve cierta parte de una palabra
substr(x = 'Hola', start = 2, stop = 4 )
substr(x = 'Hola', start = 1, stop = 3)

# El comando str_locate pone una cadena de caracters y se pone que devuelva 
# la posicion de lo que le pedimos buscar
str_locate(string = 'Hola - todos', pattern = '-')

Dane_mpio = mutate(dane_mpio , name = substr(x =  name_codigo ,start = 1 , stop =  str_locate(string = name_codigo,pattern = '-')))
Dane_mpio = Dane_mpio %>% group_by(codigo) %>% fill(name, .direction = "down")

# El comando gsub buscar un pattern y lo reemplaza
gsub(pattern = "ol",replacement = "-",x = "Hola")
Dane_mpio = mutate(Dane_mpio , name = gsub(pattern = " -",replacement = "" ,x = name))

# Para exportar la base de datos se utilizar el comando saveRDS
Dane_mpio = Dane_mpio[,c('codigo','name','year','total_poblacion')]
saveRDS(object = Dane_mpio, file = "data/output/proyecciones DANE.rds")


#--------------------------------#
# 2.Filtrar (filas y/o columnas) # 
#--------------------------------#

# Para cargar una base de datos que es de excel se utiliza comando read_excel
browseURL(url = "https://www.policia.gov.co/grupo-información-criminalidad/estadistica-delictiva", browser = getOption("browser")) # Fuente: DANE
data = read_excel("data/input/homicidios-2020.xlsx")

# Para mirar cuales datos hay dentro de las columnas un dataframe utilizar colnames
colnames(data)
data_1 = dplyr::select(data , municipio , `codigo dane` , mes , cantidad) 
    #Ojo!Se debe usar `` cuando hay espacios en los nombres
data_2 = dplyr::select(data , -departamento) 
    #Se utilizo - para eliminar la variable
data_3 = data[,c('municipio' , 'codigo dane' , 'mes' , 'cantidad')]

# Se pueden seleccionar elementos especificos del dataframe utilizando su posicion
colnames(data)
colnames(data)[c(2,3,9)]
data_rdata_3 = data[,c(2,3,9)]

# El comando grep se asegura de buscar cuales elementos cumplen el pattern especificado
grep(pattern = 'la' , x = c('Hola','Pola','Nada','Todo'))
grep(pattern = 'municipio' , x = colnames(data))
   # Ahi encontramos que la columna de municipio esta en la segunda columna

rm(list = ls()) # Limpio todos los datos
df = readRDS("data/output/proyecciones DANE.rds") # Importar base RDS

# Se van a nombrar las columnas de df
colnames(df) = c('cod_dane','name_muni','year','poblacion')
df

# Se va a crear una nueva variable con las posiciones
df_1a = df[1:953,]
    # Ahi se especifica que se quiere hasta la fila 953

nrow(df)
df_1b = df[17000:nrow(df),]
    # Se crea una nueva variable que solo tenga 17000 columnas

# El comando retorno variables que cumplen con los criterios especificados
df_2 = subset(x = df, subset = is.na(name_muni) == F)
df_3 = subset(x = df, subset =  poblacion > 100000)
df_4 = subset(x = df, subset = is.na(name_muni) == F  & as.numeric(poblacion) > 100000) # coombinando las opciones
df_5a = df[df$poblacion > 100000,]
df_5b = dplyr::filter(df, poblacion > 100000)

#### 2.2.3 Usando un vector

df_6a = dplyr::filter(df, cod_dane %in% c('05001','08001','13001'))
    # filter funciona para filtrar la base segun condiciones
df_6b = subset(x = df, cod_dane %in% c('05001','08001','13001'))

df_6c = df[df$cod_dane %in% c('05001','08001','13001') , ]


