##Requiere
install.packages("stringi")

## directorio donde se encuentran los archivos
path <-"/Users/gustavojaimem/Desktop/names/"
setwd(path)

library(plyr)
library("stringi")
#Tomar todos los archivos
files <- as.data.frame(list.files(path))
files <- rename(files,c("list.files(path)"="nombres"))
#Seleccionar unicamente TXT
files <- subset(files, grepl("txt", files$nombres))
#Contar archivos
num <- length(files$nombres)

#Iterar sobre todos
for(i in 1:num)
{
  #Obtener nombre
  name <- files$nombres[i]
  #Leer archvio en Unicode
  mydata <- read.csv(as.character(name), header=F)
  #Parsear nombre de archivo para creear nuevo
  filename <- stri_sub(name,1,-5)
  #Incluir nuevas columnas con datos del nombre
  mydata$file <- filename
  #Escribir nuevo archivo
  write.table( mydata,file=as.character(name), sep="\t",  row.names = FALSE,col.names=FALSE)
  rm(name,mydata,filename,full_new_name)
  print(i)
}
