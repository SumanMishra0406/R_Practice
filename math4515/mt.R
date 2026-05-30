#midterm practice questions
#################################################

generate_numbers <- function(N){
  U = runif(N, min = 0, max = 1)
  X = (-log(1-U))^(1/4)
  return(X)
}

N = 100
print(generate_numbers(N))
#################################################

#discrete
generate_new <-function(N){
  Y = rep(0,N)
  
  for (i in 1:N){
    U  = runif(1)
    Pk = 0
    k = 0
    
    while(TRUE){
      Pk = Pk + 1/(2^(k+1))
      if(U<=Pk){
        Y[i] = k
        break
      }
      k = k+1
    }
  }
  return(Y)
}

generate_new(100)

#################################################
#CONFIDENCE INTERVALS

