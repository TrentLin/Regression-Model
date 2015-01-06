# Q1
###  x as the predictor and y as as the outcome find P-value
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
summary(fit)$coefficients

# Q2
### Consider the previous problem, give the estimate of the residual standard deviation.
Coef <- summary(fit)$coefficients
n <- length(x)
e <- y - Coef[1,1] - Coef[2,1]*x
sigma <- sqrt(sum(e^2)/(n-2))