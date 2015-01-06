data(mtcars)
### fit a linear regression model of weight (predictor) on mpg (outcome)
### Get a 95% confidence interval for the expected mpg at the average weight
### What is the lower endpoint?
wt <- mtcars$wt ; mpg<- mtcars$mpg
fit <- lm(mpg ~ wt, data=mtcars)
summary(fit1)$coefficients
newdata <- data.frame(wt = mean(wt))
x <- predict(fit, newdata, interval=("confidence"))
x