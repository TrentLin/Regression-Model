x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
mew <-c(0.0025,0.3,0.1471,1.077)
for (each in mew){
  total <- 0
  print(each)
  #print(x[i])
  #print(w[i])
  for (i in 1:4){
    total = total + w[i]*(x[i]-each)^2
  }
  print(total)
}