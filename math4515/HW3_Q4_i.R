library(MASS)
library(goftest)
# (i) check if 
returns <- HW3_Data1[c("Stock 1", "Stock 2", "Stock 3")]

for (i in 1:3) {
  x <- returns[, i]
  
  # Fit univariate t-distribution
  fit <- fitdistr(x, "t")
  
  # Convert data to fitted CDF (probability integral transform)
  nu  <- fit$estimate["df"]
  mu  <- fit$estimate["m"]
  s   <- fit$estimate["s"]
  u   <- pt((x - mu) / s, df = nu)
  
  # Anderson–Darling test on transformed data (should be uniform[0,1])
  ad_result <- ad.test(u)
  
  print(colnames(returns)[i])
  print(fit)
  print(ad_result)
}

#(ii)

