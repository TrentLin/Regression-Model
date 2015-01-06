# load data
library(MASS)
data(shuttle)
shuttle
# convert outcome to 0 = noauto, 1 = auto
shuttle$use <- factor(shuttle$use, levels=c("auto","noauto"),labels=c(1,0))

#Q2
#Consider the previous problem. Give the estimated odds ratio for autolander
#use comparing head winds (numerator) to tail winds (denominator) 
#adjusting for wind strength from the variable magn.

# create logistic regression model adjusted by magn
fit2 <- glm(use ~ wind + magn - 1,data = shuttle, family = "binomial")
summary(fit2)$coef

# Give the estimated odds ratio for autolander use comparing head winds, labeled as "head" in the variable headwind to tail winds.
windhead <-fit2$coef[1] 
windtail <-fit2$coef[2]

# exponentail windhead and windtail to create odds ratio
exp(windtail)/exp(windhead)