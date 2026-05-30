#(i)
logreturn <- HW1_Data3$Logdailyreturn

# MLE of mean (mu) ignoring NAs
mu_hat <- mean(logreturn, na.rm = TRUE)

# MLE of variance (sigma^2) ignoring NAs
sigma2_hat <- mean((logreturn - mu_hat)^2, na.rm = TRUE)

cat("MLE of mean (mu):", mu_hat, "\n")
cat("MLE of variance (sigma^2):", sigma2_hat, "\n")

##########
#(ii)
library(nortest)

# KS test against normal distribution with estimated parameters
ks_result <- ks.test(logreturn, "pnorm", mean = mu_hat, sd = sqrt(sigma2_hat), exact = FALSE)

# AD test for normality
ad_result <- ad.test(logreturn)

print(ks_result)
print(ad_result)

#Since the p-values are extremely small, 
#reject the null hypothesis that the logreturn follows a normal distribution at any reasonable significance level.


######
#(b)(i)
library(MASS)
# Define density function for general t-distribution with location and scale
dt_ls <- function(x, df, mean, sd) {
  dt((x - mean) / sd, df) / sd
}

# Fit t-distribution to logreturn data (ignoring NAs)
fit_t <- fitdistr(na.omit(logreturn), dt_ls, 
                  start = list(df = 5, mean = mean(logreturn, na.rm=TRUE), sd = sd(logreturn, na.rm=TRUE)),
                  lower = c(2, -Inf, 0.0001))

print(fit_t)

####
#(b)(ii)
# Standardize data with estimated mean and scale
T <- (logreturn - fit_t$estimate["mean"]) / fit_t$estimate["sd"]

# Perform KS-test against t-distribution with estimated degrees of freedom
ks_t_result <- ks.test(T, "pt", df = fit_t$estimate["df"], exact = FALSE)

print(ks_t_result)
#adtest
# Check for NA or infinite values
sum(is.na(T))
sum(is.infinite(T))

# Remove any NA or infinite values
T_clean <- T[!is.na(T) & !is.infinite(T)]

# Run AD test again on cleaned data
library(goftest)

# Define custom CDF function for t-distribution with estimated df
cdf_t <- function(x) pt(x, df = fit_t$estimate["df"])

# Run Anderson-Darling test with custom CDF function
ad_t_result <- ad.test(T_clean, null = cdf_t)

print(ad_t_result)

