# Árboles de decisión 

#Hola, me dejas hacer un pull??

library(readxl)
library(expss)


dir1 <- "D:/OneDrive - Universidad de Málaga/Usuarios/Martina/IHQ_Prosigna"

setwd(dir1)
dat <- read_excel("IHQ-Prosigna_1521.xls")


library(rpart)        
library(rpart.plot)   
library(caret)        

library(dplyr)  # Manipulación de datos

attach(dat)
datos_red <- dat %>%
  select(c(RIESGO, KI67, RE, RP, GRADO)) %>%
  mutate(GRADO   = factor(GRADO, levels = c(1,2,3), labels= c('Bajo', 'Intermedio','Alto')))  %>%
  na.omit()  


arbol1 <- rpart(formula = RIESGO ~., data=datos_red, method='class')
rpart.plot(arbol1)
