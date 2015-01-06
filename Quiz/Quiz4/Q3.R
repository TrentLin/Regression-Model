# Q3
# load data
library(MASS)
data(shuttle)
shuttle
#If you fit a logistic regression model to a binary variable, 
#for example use of the autolander, 
#then fit a logistic regression model for one minus the outcome
#(not using the autolander) what happens to the coefficients?

shuttle$auto <- as.numeric(shuttle$use=="auto")
fit1 <- glm(auto ~ wind,binomial, data = shuttle)
fit2 <- glm(1-auto ~ wind, binomial, data = shuttle)
fit1$coef
fit2$coef