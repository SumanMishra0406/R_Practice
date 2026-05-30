# Extract sample values from column 'y'
X <- HW1_Data2$y
n <- length(X)

# Function to compute MLE of theta given fixed alpha
mle_theta <- function(alpha, X) {
  (mean(X^alpha))^(1/alpha)
}

# Log-likelihood function given alpha and theta
log_likelihood <- function(alpha, theta, X) {
  n <- length(X)
  term1 <- n * log(alpha)
  term2 <- alpha * sum(log(X))
  term3 <- - alpha * n * log(theta)
  term4 <- - sum((X / theta)^alpha)
  term5 <- - sum(log(X))
  return(term1 + term2 + term3 + term4 + term5)
}

# Create a sequence of alpha values to search over
alpha_values <- seq(0.1, 5, by=0.01)

# Initialize vectors to store results
log_lik_values <- numeric(length(alpha_values))
theta_values <- numeric(length(alpha_values))

# Loop over alpha values to find corresponding theta and log-likelihood
for (i in seq_along(alpha_values)) {
  a <- alpha_values[i]
  t <- mle_theta(a, X)
  theta_values[i] <- t
  log_lik_values[i] <- log_likelihood(a, t, X)
}

# Find the index of the maximum log-likelihood
max_index <- which.max(log_lik_values)

# Extract MLE estimates of alpha and theta
alpha_hat <- alpha_values[max_index]
theta_hat <- theta_values[max_index]

# Print the results
cat("Estimated alpha:", alpha_hat, "\n")
cat("Estimated theta:", theta_hat, "\n")
