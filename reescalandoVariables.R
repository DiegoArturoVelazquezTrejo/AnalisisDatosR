
# Reescalando variables  en un margen dado 
# install.packages("scales")

library(scales)

students <- read.csv("tema1/data-conversion.csv")

# Reescalando datos de un dataframe 
rescale.many <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col],"rescaled",sep=".")
    dataframe[name] <- rescale(dataframe[,col])
  }
  cat(paste("Hemos reescalado", length(cols)," variable(s)"))
  dataframe
}

students <- rescale.many(students, c(1,4,5))
