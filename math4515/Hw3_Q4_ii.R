library(Rfast)

x <- HW3_Data1[c("Stock 1", "Stock 2", "Stock 3")]
x <- na.omit(x)
x <- as.matrix(x)

# Sequence of candidate df
df_seq <- seq(3,5,0.01)
n=length(df_seq)
loglik=rep(0,n)

for(i in 1:n){
  fitres <- mvt.mle(x, v = df_seq[i])
  loglik[i] <- fitres$loglik   # Or fitres$loglikelihood depending on version
}
loglik<-as.matrix(loglik)
dfmax <- df[which.max(loglik)]
print(dfmax)
fitMLE=mvt.mle(x,v=dfmax) #Estimate the MLE of the parameters
print(fitMLE)