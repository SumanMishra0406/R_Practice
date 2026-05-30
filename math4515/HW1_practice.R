# #MLE
# library(MASS)
# library(goftest)
# 
# x<-HW1_Data3$Logdailyreturn
# x<-na.omit(x)
# x<-x+0.000000000000001*rnorm(length(x),0,1) #avoid tie
# 
# MLE_normal <- fitdistr(x,"normal")
# 
# mu = MLE_normal$estimate["mean"]
# sd_calc = MLE_normal$estimate["sd"]
# 
# ks.test(x, "pnorm", mean = mu, sd = sd_calc)
# ad.test(x,"pnorm", mean = mu, sd = sd_calc)
# 
# 
# #now using t distribution
# library(Rfast)
# y<-HW1_Data3$Logdailyreturn
# y<- na.omit(y)
# y<-as.matrix(y)
# df = seq(2,8,0.0001)
# n = length(df)
# 
# loglik = rep(0,n)
# 
# for(i in 1:n){
#   fitres = mvt.mle(y,v=df[i])
#   loglik[i] = fitres$loglik
# }
# loglik <- as.matrix(loglik)
# max_index = which.max(loglik) # find index corresponding to maximum likelihood
# df_max = df[max_index]
# 
# fitMLE = mvt.mle(y,df_max)
# mu = fitMLE$location
# sd = sqrt(fitMLE$scatter[1,1])
# print(mu)
# print(sd)
# T = (x-mu)/sd
# 
# ks.test(T,"pt", df=df_max)
# ad.test(T,"pt",df=df_max)



#MLE
library(MASS)
x<-HW1_Data3$Logdailyreturn
x<-na.omit(x)
x<-x+0.000001*rnorm(length(x),0,1) #avoid tie

MLE_normal = fitdistr(x,"normal")
mu = MLE_normal$estimate["mean"]
sd_calc = MLE_normal$estimate["sd"]

print(mu)
print(sd_calc)

ks.test(x,"pnorm",mean = mu, sd=sd_calc)
ad.test(x,"pnorm", mean = mu, sd=sd_calc)


#MLE t distribution
library(Rfast)
y<-HW1_Data3$Logdailyreturn
y<-na.omit(y)
y<-as.matrix(y)

n = length(y)
df = seq(2,8,0.001)
loglik = rep(0,n)
for(i in 1:n){
  fit_mle = mvt.mle(y,v = df[i]) 
  loglik = fit_mle$loglik
}
loglik = as.matrix(loglik)
max_index = which.max(loglik)
df_max = df[max_index]

fit_mle = mvt.mle(y,v=df_max)
mu = fitMLE$location
sd = sqrt(fitMLE$scatter[1,1])
print(mu)
print(sd)

T = (x-mu)/sd

ks.test(T,"pt", df=df_max)
ad.test(T,"pt",df=df_max)


#######
