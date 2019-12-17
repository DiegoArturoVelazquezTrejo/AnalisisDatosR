# Se necesita instalar este paquete para trabajar con archivos XML 
#install.packages("XML")

# Incluyendo la biblioteca de XML 
library(XML)
url <- "tema1/cd_catalog.xml"

xmldoc <- xmlParse(url)
# Nos coloca en el origen del archivo 
rootnode <- xmlRoot(xmldoc)

# Accediendo al primer elemento del nodo raíz 
# Accediendo a los datos del XML 
rootnode[2]

# Función que iterativamente obtiene los datos de los nodos hijos del raíz
cds_data = xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))

# Realizando una transposición de filas por columnas 
cds.catalog = data.frame(t(cds_data),row.names = NULL)

