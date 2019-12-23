#Tratando datos NA 

data <- read.csv("tema1/missing-data.csv", na.strings = "")

# Eliminando los casos 
data_cleaned <- na.omit(data)

# Para checar si un dato es NA 
# is.na(dato)

#Visualizando una sola columna del data frame 
# View(data_cleaned$Income)

#Para visualizar los datos de una columna que no tienen NA 
# View(data[!is.na(data$Income),])

# Para conseguir los datos de un dataframe que no sean NA (otra forma)
data_cleaned2 <- data[complete.cases(data),]

# Para reemplazar los ceros de la columna de Income del dataframe por NA 
data$Income[data$Income == 0] <- NA

#View(data)

# Reemplazando por las medidas de centralización (media, mediana)
# Despleagando el promedio de Income sin considerar a los NA na.rm => na remove 
print(mean(data$Income, na.rm=TRUE))
# Desviación típica (standard desviation)
print(sd(data$Income, na.rm=TRUE))

#Cuando se descartan los NA se pierde información útil 
# Vamos a computarlos reemplazando con algo que podría ser de utilidad 

data <- read.csv("tema1/missing-data.csv", na.strings="")

# Reemplazar los NA con el promedio 
# Creamos una cuarta columna con los datos reemplazados, en caso de ser NA se ejecuta la 
# condición de reemplazar NA por el promedio, de lo contrario se deja el ingreso original 
data$Income.mean <- ifelse(is.na(data$Income), 
                           mean(data$Income,na.rm=TRUE),
                           data$Income)

# Si parto de la hipótesis de que faltan datos, tomo la muestra de los datos que sí están completos 
# y reemplazo el faltante por uno aleatoriamente (variables categóricas)

# X es un vector de datos que puede contener NA's
rand.input <- function(x){
  # Vector que contiene un vector de booleanos que indican si el dato tiene NA o no 
  missing <- is.na(x) 
  # Cuando sumo un vector de booleanos, me regresa la cantidad de TRUE en el vector 
  # n.missing contiene cuantos valores son NA (cuantos valores faltan)
  n.missing <- sum(missing)
  # x.observado son los valores que tienen dato diferente a NA en x
  # me devuelve las observaciones donde no hay dato NA 
  x.observado <- x[!missing]
  # Por defecto, devolverpa lo mismo que había por parámetro 
  inputed <- x
  # Y donde haya un NA lo voy a reemplazar por un valor aleatorio que no sea NA (que si se conozca)
  inputed[missing] <- sample(x.observado, n.missing, replace=TRUE)
  return(inputed)
}

# Función que mapea la otra función de rand.input 
random.input.data.frame <- function(dataFrame, cols){
  # Obtiene los nombres de las columnas del dataframe 
  names <- names(dataFrame)
  # Recorre las columnas que se pasaron por parámetro (que se desean modificar)
  for(col in cols){
    # Concatena el nombre de la columna original con la palabra inputed 
    name <- paste(names[col],".inputed",sep=".")
    # Ejecuta la función sobre la columna especificada asignándola a una nueva columna de nombre name 
    dataFrame[name] = rand.input(dataFrame[,col])
  }
  # Regresa el dataframe 
  dataFrame
}

data <- read.csv("tema1/missing-data.csv", na.strings="")
# Reemplazamos los ceros por NA
data$Income[data$Income == 0] <- NA
# Mapeamos NA por reemplazar a otros datos 
data <- random.input.data.frame(data, c(1,2))