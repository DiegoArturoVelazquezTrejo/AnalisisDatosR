
students <- read.csv("tema1/data-conversion.csv")

# install.packages("dummies")
library(dummies)

# Vamos a crear variables ficticias que representen numericamente el estado/género de un dato
students.dummy <- dummy.data.frame(students, sep=".")

#Para aplicar dummy solo a una columna dummy(students$State, sep=".")

#Se pueden crear dummies para un subconjunto de datos 
dummy.data.frame(students, names=c("State","Gender"),sep=".")
