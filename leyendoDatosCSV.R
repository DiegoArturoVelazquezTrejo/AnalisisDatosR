# Leyendo los datos de un archivo csv 
auto <- read.csv("tema1/auto-mpg.csv", header=TRUE, sep=",")
# Te despliega el dataframe como si fuera excel 
View(auto)
# Desplegando el nombre de las columnas/variables
names(auto)
# Desplegando las primeras 5 filas de datos (head)
head(auto,5)
# leyendo datos de internet a través de la URL
data_internet <- read.csv("https://frogames.es/course-contents/r/intro/tema1/WHO.csv")
View(data_internet)




