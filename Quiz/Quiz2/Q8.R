data(mtcars)
wt2 <- mtcars$wt+2 ; mpg <- mtcars$mpg
fit2 <- lm(mpg ~ wt2, data=mtcars)
summary(fit2)$coefficients