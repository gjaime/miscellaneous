## directorio donde se encuentran los archivos
path <-"PAHT"
setwd(path)

library(plyr)

#Tomar todos los archivos
files <- as.data.frame(list.files(path))
files <- rename(files,c("list.files(path)"="nombres"))
#Contar archivos
num <- length(files$nombres)

#Iterar sobre todos
for(i in 1:num)
{
  #Obtener nombre
  name <- files$nombres[i]
  #Leer archvio en Unicode
  mydata <- read.delim(as.character(name), header=F, fileEncoding = "UCS-2LE")
  #Parsear nombre de archivo para creear nuevo
  name_part1 <- substr(name, 2, 7)
  name_part2 <- substr(name, 11, 16)
  full_new_name <- paste0(name_part1,"_",name_part2,".txt")
  #Incluir nuevas columnas con datos del nombre
  mydata$c1 <- name_part1
  mydata$c2 <- name_part2
  #Escribir nuevo archivo
  write.table( mydata,file=full_new_name, sep="\t",  row.names = FALSE,col.names=FALSE)
  rm(name,mydata,name_part1,name_part2,full_new_name)
  print(i)
}

