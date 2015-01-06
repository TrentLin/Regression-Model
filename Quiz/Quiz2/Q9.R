#Refer back to the mtcars data set with mpg as an outcome and weight (wt)
#as the predictor. About what is the ratio of the the sum of the
#squared errors, ???ni=1(Yi???Y^i)2 when comparing a model with just an 
#intercept (denominator) to the model with the intercept and slope (numerator)?

#This is simply one minus the R^2 values
fit1 <- lm(mpg ~ wt, data = mtcars)
fit2 <- lm(mpg ~ 1, data = mtcars)
1 - summary(fit1)$r.squared
## [1] 0.2472
sse1 <- sum((predict(fit1) - mtcars$mpg)^2)
sse2 <- sum((predict(fit2) - mtcars$mpg)^2)
sse1/sse2
## [1] 0.2472
