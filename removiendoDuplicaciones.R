family.salary <- c(40000,60000,50000,80000,60000,70000,60000)
family.size <- c(4, 3, 2, 2, 3, 4, 3)
family.car <- c("Lujo","Compacto","Utilitario","Lujo","Compacto","Compacto","Compacto")

data <- data.frame(family.salary,family.size,family.car)

# Obteniendo un dataframe evitando duplicaciones 
View(unique(data))

# Me devuelve las filas duplicadas
data[duplicated(data),]

# Me devuelce las filas que no son duplicadas 
data[!duplicated(data),]