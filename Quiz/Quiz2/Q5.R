data(mtcars)
### fit a linear regression model of weight (predictor) on mpg (outcome)
### A new car is coming weighing 3000 pounds
### Construct a 95% prediction interval for its mpg
### What is the upper endpoint?
wt <- mtcars$wt ; mpg <- mtcars$mpg
fit <- lm(mpg ~ wt, data=mtcars)
newdata <- data.frame(wt = 3000/1000)
x <- predict(fit, newdata, interval=("prediction"))
x