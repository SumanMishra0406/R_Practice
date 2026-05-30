#HW2
N = 100000
x = rexp(N, rate = 3)
y = exp(-x^2)

print(mean(y))
se = sd(y)/N
print(se)

#rejection sampling
fx = function(x){
  y=exp(-x^(1.5))
  return(y)
}

gx = function (x){
  y = exp(-x)
  return(y)
}

X = rep(0,N)
M=exp(4/27)
counter=0

while(counter<N){
  U = runif(1, min = 0, max = 1)
  x = rexp(1,rate = 1)
  if(U<(fx(x)/M*gx(x))){
    counter = counter+1
    X[counter] = x
  }
}

hist(X,breaks=1000)

#importance sampling
N = 10000
S0 = 100
X = 250
sigma = 0.2
r = 0.03
T = 1
VT = rep(0,N)
counter = 0
mu = (log(X/S0) - (r-(sigma^2)/2)*T)/sigma

fX=function(x){
  (1/sqrt(2*pi*T))*exp(-(x^2)/(2*T))
  } #Old dist. of WT

gX=function(x){
  (1/sqrt(2*pi*T))*exp(-((x-mu)^2)/(2*T))
  } #New dist. of WT

for (i in 1:N){
  WT = rnorm(1,mean = mu, sd = sqrt(T))
  ST=S0*exp((r-(sigma^2)/2)*T+sigma*WT)
  VT[i] = exp(-r*T)*max(ST-X,0)*fX(WT)/gX(WT)
  }
Estimate=mean(VT) #estimate
SE=sd(VT)/sqrt(N) #Standard error
PE=SE*100/Estimate #Percentage error (in percentage)

#BOOTSTRAPPING
x<-HW3_Data1$`Stock 1`
n = length(x)
B=100000; #Number of bootstrap sample
Tboot=rep(0,B)
for (i in 1:B){
  xboot=sample(x,n,replace=TRUE)
  Tboot[i]=(mean(xboot)-mean(x))/(sd(xboot)/sqrt(n))
  print(i)}
tL=quantile(Tboot,0.01)
tU=quantile(Tboot,0.99)


