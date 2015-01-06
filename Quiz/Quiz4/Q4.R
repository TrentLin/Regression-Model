#Consider the insect spray data InsectSprays. 
#Fit a Poisson model using spray as a factor level. 
#Report the estimated relative rate comapring spray A (numerator) 
#to spray B (denominator).
data(InsectSprays)
InsectSprays
str(InsectSprays)

#Fitting a  Poisson model
fit1 <- glm(count ~ spray -1, family = "poisson" , data = InsectSprays)

#estimated relative rate comapring spray A (numerator) to spray B (denominator)
exp(fit1$coef[1])/exp(fit1$coef[2])