
housing <- read.csv("tema1/BostonHousing.csv")

# Al momento de estandarizar valores se usa la función scale 
# Centrar los valores más probables en torno al cero (distribución normal)  Se usa con la media y la desviación típica
# Los valores que se acercan al cero son aquellos más próximos a la media 
# Y aquellos distintos a cero estarían muy alejados a la media de la columna 
housing.z <- scale(housing)


# Argumentos de scale 
scale(housing, center = TRUE, scale = TRUE)
#   center TRUE -> restando la media 
#   scale TRUE -> Dividiendo en la desviación típica 

scale.many <- function(dataframe,cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col],"z",sep = ".")
    dataframe[name] <- scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado ",length(cols)," variable(s)"))
  dataframe 
}

housing <- scale.many(housing, c(1,3,5:8))


