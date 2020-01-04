
# Análisis de componentes principales 
usarrests <- read.csv("r-course/data/tema3/USArrests.csv")

# Le cambiamos el identificador numérico de las filas por uno con nombre 
rownames(usarrests) <- usarrests$X
# Eliminamos la columna de X que tenía antes los nombres 
usarrests$X <- NULL
head(usarrests)

# Aplicando la función varianza para ver la varianza por variable del dataframe 
apply(usarrests, 2, var)

# Escalando las variables para perder la variabilidad tan grande 

acp <- prcomp(usarrests, center = TRUE, scale= TRUE)
# Imprime la desviación estandar y sus rotaciones 
print(acp)

# Graficando los componentes 
plot(acp, type = "l")

summary(acp)

# Para graicar el acp 
biplot(acp, scale = 0)

# Para obtener las componentes por variable 
pc1 <- apply(acp$rotation[,1]*usarrests, 1, sum)
pc2 <- apply(acp$rotation[,2]*usarrests, 1, sum)

usarrests$pc1 <- pc1
usarrests$pc2 <- pc2

# Ahora obtenemos el dataframe final que explica de la misma manera que el dataframe original con tan solo 
# 2 columnas de datos 
usarrests[, 1:4] <- NULL

