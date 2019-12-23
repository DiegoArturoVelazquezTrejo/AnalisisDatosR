# Leyendo datos de un fichero JSON 

# Se necesita un paquete 
install.packages('jsonlite')

# usando la biblioteca 
library(jsonlite)

# Leyendo los datos del archivo JSON 
dat.1 <- fromJSON("tema1/students.json")

# Leyendo json del internet 
url <- "https://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?=json"

#   Instalando los paquetes necessarios 
install.packages("curl")
# Llamando a la biblioteca 
#library(curl)

currencies <- fromJSON(url)