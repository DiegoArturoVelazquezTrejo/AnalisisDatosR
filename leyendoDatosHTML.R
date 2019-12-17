
# Leyendo de un archivo html 
population_url <- "tema1/WorldPopulation-wiki.htm"

# Tablas de la página html 
tables <- readHTMLTable(population_url)

# Accediendo al elemento dentro de tables que contiene los países y sus poblaciones
most_populated <- tables[[6]]
# Imprimendo las primeras filas 
head(most_populated,3)

# -------- Otra forma de hacer los últimos dos pasos: 
custom_table <- readHTMLTable(population_url, which = 6)
