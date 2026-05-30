library(Rfast)
data <- Return_USstock[c(2,3,4,5,6)]
data <- na.omit(data)
data <- as.matrix(data)

fit_result = mvnorm.mle(data)
print(fit_result)


#t distribution
x<- Return_USstock[c(3,4,5)]
x<- na.omit(x)
x<- as.matrix(x)

df = seq(3,5,0.001)
n = length(df)
loglik = rep(0,n)


for (i in 1:n){
  fitres = mvt.mle(x, df[i])
  loglik[i] = fitres$loglik
}

loglik <- as.matrix(loglik)
max_index = which.max(loglik)
df_max = df[max_index]
fitres = mvt.mle(x,df_max)
print(df_max)
print(fitres)



###
#Monte Carlo - check this again
n_sim=1000
t = 30 #number of investment days
Preturn = rep(0,n_sim)
for(i in 1:n_sim){
  w = rep(0,3)
  w[1] = 0.2
  w[2] = 0.3
  w[3] = 0.5
  for(j in 1:t){
    x<-rmvt(1,mu = fitres$location, sigma = fitres$scatter, v = df_max)
    w = w*(exp(x))
  }
  Preturn[i] = sum(w) - 1
}
y<-ifelse(Preturn>0.05,1,0)
hist(Preturn)


