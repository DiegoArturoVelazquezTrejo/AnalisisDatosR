
students <- read.csv("tema1/data-conversion.csv")

# install.packages("dummies")
library(dummies)

# Vamos a crear variables ficticias que representen numericamente el estado/género de un dato
students.dummy <- dummy.data.frame(students, sep=".")
