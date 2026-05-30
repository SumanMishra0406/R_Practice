#cp statistics
library(leaps)
data <- Data_SHOP_indexes
data <- na.omit(data)
x <- data[c(7,8,9)]
y<- data$SHOP

cp_result = leaps(x,y,method ="Cp")
t = which.min(cp_result$Cp) #which index has minimum Cp
cp_result$which[t,] #extract corresponding linear regression model


#aic
#full model
step(lm(y~data$DJI+data$SP500+data$NASDAQ),direction="both")
#null model
step(lm(y~1),scope=~.+data$DJI+data$SP500+data$NASDAQ,direction="both")


#bic


#pca
prcomp(x, center = TRUE)
summary(prcomp(x, center = TRUE))

