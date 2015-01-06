#Q1
#Consider the mtcars data set. Fit a model with mpg as the outcome that
#includes number of cylinders as a factor variable and weight as confounder. 
#Give the adjusted estimate for the expected change in mpg comparing
#8 cylinders to 4.
data(mtcars)
mtcars
mtcars$cyl <- factor(mtcars$cyl)
fit <- lm(mpg ~ cyl + wt, data=mtcars)
summary(fit)
