data(mtcars)
### a linear regression model with mpg as predicted by weight (in 1,000 lbs)
### A ¡§short¡¨ ton is defined as 2,000 lbs.
### Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in weight. 
### Give the lower endpoint.
### to get an increase of 1 short tonne, divide by 2
fit <- lm(mpg ~ I(wt * 0.5), data = mtcars)
confint(fit)[2, ]
##   2.5 %  97.5 % 
## -12.973  -8.405
