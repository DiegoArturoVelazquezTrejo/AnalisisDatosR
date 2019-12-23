# Falta o desconocimiento de datos 

housing.data <- read.csv("tema1/housing-with-missing-value.csv", header= TRUE, stringsAsFactors = FALSE)

# Realizando un resumen de las variables 
summary(housing.data)

# Eliminando los NA 
housing.data.1 <- na.omit(housing.data)
summary(housing.data.1)
# Al momento de eliminar dichos datos, se alteró el summary 
# Hay discrepancias con dataframes con NA y sin NA 

# Eliminar las NA de ciertas columnas 
drop_na <- c("rad")

# Desaparecer los NA de todas las columnas menos el de la columna rad 
housing.data.2 <- housing.data[complete.cases(
  housing.data[,!(names(housing.data))%in%drop_na]),]

summary(housing.data.2)

# Eliminando una columna completa 
housing.data$rad <- NULL
# Eliminar dos o más columnas 
drops <- c("rad","ptratio")
housing.data.3 <- housing.data[,!(names(housing.data)%in% drops)]

