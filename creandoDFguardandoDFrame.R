# Generando un dataframe 

pagos <- as.Date(c("2019-09-17","2019-07-12","2016-12-10"))
clientes <- c("Chucho","Jesus","EL Jusys")
cantidad <- c(123.35,178.90,192.87)

data_frame <- data.frame(pagos,clientes,cantidad)

# Guarando en un archivo R el dataframe
saveRDS(data_frame,file = "data_frame.rds")

# Para cargar el rds 
data_frame_cargado <- readRDS("data_frame.rds")

