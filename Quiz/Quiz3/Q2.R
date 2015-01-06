#Q2
#Consider the mtcars data set. Fit a model with mpg as the outcome that 
#includes number of cylinders as a factor variable and weight as a possible
#confounding variable. Compare the effect of 8 versus 4 cylinders on mpg for 
#the adjusted and unadjusted by weight models. Here, adjusted means including 
#the weight variable as a term in the regression model and unadjusted means 
#the model without weight included. What can be said about the effect comparing
#8 and 4 cylinders after looking at models with and without weight included?.
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
fit <- lm(mpg ~ cyl, data=mtcars)
fitadjust <- lm(mpg ~ cyl + wt, data = mtcars)
summary(fit)$coef
summary(fitadjust)$coef