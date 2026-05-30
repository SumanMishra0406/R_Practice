data <- HW1_Data1$data 

lambda_hat <- mean(data)
n <- length(data)
se_lambda <- sqrt(lambda_hat / n)
z <- qnorm(0.975) # 95% ci
ci_lower <- lambda_hat - z * se_lambda
ci_upper <- lambda_hat + z * se_lambda

# Print the results
cat("Estimated lambda:", lambda_hat, "\n")
cat("95% Confidence Interval: [", ci_lower, ", ", ci_upper, "]\n")
