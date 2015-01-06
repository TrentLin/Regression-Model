#Q3
#Consider the mtcars data set. Fit a model with mpg as the outcome that 
#considers number of cylinders as a factor variable and weight as confounder.
#Now fit a second model with mpg as the outcome model that considers the 
#interaction between number of cylinders (as a factor variable) and weight. 
#Give the P-value for the likelihood ratio test comparing the two models and
#suggest a model using 0.05 as a type I error rate significance benchmark.
data(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
fit <- lm(mpg ~ cyl + wt, data=mtcars)
fit2 <- lm(mpg ~ cyl + wt + interaction(cyl,wt), data=mtcars)
str(mtcars)
anova(fit,fit2)

###############################################################

