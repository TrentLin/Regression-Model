x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
n <- length(x)
y <-c(0.573,0.8,0.36,0.44)
for (each in y){
  total <- 0
  print(each)
  #print(x[i])
  #print(w[i])
  for (i in 1:n){
    total = total + (each - x[i])^2
  }
  print(total)
}