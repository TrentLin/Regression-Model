#Consider the data
#x <- -5:5
#y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
#Using a knot point at 0, fit a linear model that looks like a hockey stick 
#with two lines meeting at x=0. Include an intercept term,
#x and the knot point term. What is the estimated slope of the line after 0?
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
z <- (x > 0)*x
fit <- lm(y ~ x + z)
sum(coef(fit)[2:3])
