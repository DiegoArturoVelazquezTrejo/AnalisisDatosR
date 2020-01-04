
cp <- read.csv("r-course/data/tema3/college-perf.csv")

cp$Perf <- ordered(cp$Perf, levels=c("Low","Medium","High"))

cp$Pred <- ordered(cp$Pred, levels = c("Low", "Medium", "High"))

# Generar una matriz de confusión o de clasificación 

table <- table(cp$Perf, cp$Pred, dnn = c("Actual", "Predecido"))

# Dividiendo entre el total para ver las probabilidades 
prop.table(table)

# Leyendo la matriz con porcentajes y dos decimales
round(prop.table(table, 2)*100,2)

# Graficando utilmente 
# Lo que está encerrado en el cuadro es lo que realmente sacó la persona 
barplot(table, legend = TRUE, xlab = "Nota predecida por el modelo")

# Otra forma de ver los resultados del modelo 
mosaicplot(table, main = "Eficiencia del modelo")

# La función de summary aplicada sobre la tabla nos aporta información 
# Número de casos en la tabla, test de la G-CUADRADA o de INDEPENDENCIA 

summary(table)

# el P-VALOR bajo indica dependencia entre el valor actual y el predicho, es decir: EL MODELO ES EFICIENTE