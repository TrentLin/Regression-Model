data(mtcars)
# convert qualitative variables to factors
mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
mtcars$am <- factor(mtcars$am, labels = c("Automatic","Manual"))
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)

# create boxplot to explore the MPG between different transmission
## Figure1
summary(mtcars$mpg[mtcars$am=="Automatic"] )
summary(mtcars$mpg[mtcars$am=="Manual"] )
sd(mtcars$mpg[mtcars$am=="Automatic"])
sd(mtcars$mpg[mtcars$am=="Manual"])
boxplot(mpg ~ am, data = mtcars,
        xlab = "Transmission Type", ylab = "Mile Per Gallon",
        main = "MPG vs Transmission", col = c("salmon","steelblue"))
# check the correlation between every value
## Figure2
# create a pairwise plot of mtcars
pairwise <- pairs(mtcars,panel = panel.smooth,main = "Pairwise plot of mtcars")
## Figure3
# check the correlation of variances between every value
cov2cor(cov(sapply(mtcars,as.numeric)))
## Figure4
# Using all variables to fit model to find the most significant predictors
allInmodel <-lm(mpg ~., data = mtcars)
summary(allInmodel)$coef
allInmodel$coef

## Figure5
# Comparing two model with "am"" no adjusetd and add "wt" and "hp"
ammodel <- lm(mpg ~ am, data = mtcars)
adjustmodel <- lm(mpg ~ am + wt + hp, data = mtcars)

## Figure6
# calculate R squared in two models and perform the ANOVA.
summary(ammodel)$r.squared
summary(adjustmodel)$r.squared
anova(ammodel,adjustmodel)

## Figure7
# Plot to diagnose inear model residual 
par(mfrow = c(2,2))
plot(adjustmodel)
hist(adjustmodel$residual)

#hatvalues
hatvalues(adjustmodel)
lev_meas <- hatvalues(adjustmodel)
tail(sort(lev_meas),5)
#dfbetas
dfbetas(adjustmodel)
inf_meas <- dfbetas(adjustmodel)
tail(sort(inf_meas[,4]),5)
## Figure8
# conduct a t-test
t.test(mpg ~ am, data = mtcars)

