logreturn <- HW1_Data3$Logdailyreturn

library(MASS)
library(fitdistrplus)

# Fit t-distribution to the data
fit_t <- fitdist(logreturn, "t", start = list(m = mean(logreturn), s = sd(logreturn), df = 5))

# Print the estimated parameters
print(fit_t)


# Load necessary package for AD test
library(nortest)

# Extract parameters from the fit object
mu_t <- fit_t$estimate["m"]
sigma_t <- fit_t$estimate["s"]
df_t <- fit_t$estimate["df"]

# Define the CDF of the general t-distribution (scaled and shifted)
pt_gen <- function(x) {
  pt((x - mu_t) / sigma_t, df = df_t)
}

# Perform KS-test for general t-distribution
ks_result_t <- ks.test(logreturn, pt_gen)

# Note: AD test for t-distribution is not built-in, so we'll use the general AD test on transformed data

# Transform the data using the fitted t-distribution CDF
u <- pt_gen(logreturn)

# Perform AD test on uniform distribution (transformed data should be uniform if fit is good)
ad_result_t <- ad.test(u)

# Print results
cat("KS-test result for general t-distribution:\n")
print(ks_result_t)
cat("\nAD-test result for general t-distribution (on transformed data):\n")
print(ad_result_t)