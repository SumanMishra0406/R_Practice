dataset <- Data_Problem4
full_model <- lm( AMZN~DJI + SP500 + NASDAQ, data = dataset)
summary(full_model)

aic_mod = step(full_model)
summary(aic_mod)

bic_mod = step(full_model, k = log(n))
confint(aic_mod, level = 0.95)
predict(aic_mod, newdata = , interval = "confidence"

#pca
dataset <- na.omit(dataset)
prcomp(dataset[c(2,3,4,5)])
summary(prcomp(dataset[c(2,3,4,5)]))

#BOOTSTRAPPING
x<-HW3_Data1$`Stock 1`
n = length(x)
B=100000; #Number of bootstrap sample
Tboot=rep(0,B)
for (i in 1:B){
  xboot=sample(x,n,replace=TRUE)
  Tboot[i]=(mean(xboot)-mean(x))/(sd(xboot)/sqrt(n))
  print(i)}
alpha = 0.02
tL=quantile(Tboot,alpha/2)
tU=quantile(Tboot,alpha/2)

SE_x = sd(x)/sqrt(n)

ci_lower = mean(x) - tL*SE_x
ci_upper = mean(x) - tU*SE_x




y<-HW3_Data1$`Stock 1`
n = length(x)
B = 100000
T_boot = rep(0,B)
for(i in 1:B){
  y_boot = sample(y,n,replace = TRUE)
  T_boot[i] = (mean(yboot)-mean(y))
}




#Monte Carlo
n = 10000
t = 14
preturn = rep(0,n)
w = rep(0,3)
for(i in 1:n){
  w[1] = 0.4
  w[2] = 0.25
  w[3] = 0.35
  wcash = 0
  
  for(i in 1:j){
    return <-rmvt(1,fit)
  }
}