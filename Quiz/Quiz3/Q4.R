#Q4
#Consider the mtcars data set. Fit a model with mpg as the outcome 
#that includes number of cylinders as a factor variable and weight 
#inlcuded in the model as
#lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)

fit1<-lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
fit2<-lm(mpg ~ wt + factor(cyl), data = mtcars)
summary(fit1)$coef
summary(fit2)$coef