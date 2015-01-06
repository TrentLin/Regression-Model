### Plot the data
library(UsingR)
data(diamond)
library(ggplot2)
plot(diamond$carat,diamond$price,
     xlab = "Mass (carats)",
     ylab = "Price (SIN $)",
     bg = "lightblue",
     col = "black" , cex = 1.1, pch = 21, frame = FALSE)
abline(lm(price ~ carat, data = diamond), lwd = 2)

### Fitting the linear regression model
fit <- lm(price ~ carat, data = diamond)
coef(fit)

### Getting a more interpretable intercept
fit2 <- lm(price ~ I(carat - mean(carat)), data = diamond)
coef(fit2)

### Changing scale
fit3 <- lm(price ~ I(carat * 10), data = diamond)
coef(fit3)

### Predicting the price of a diamond
newx <- c(0.16, 0.27, 0.34)
coef(fit)[1] + coef(fit)[2] * newx
predict(fit, newdata = data.frame(carat = newx))

### Predicted values at the observed Xs (red) and at the new Xs (lines)
data(diamond)
plot(diamond$carat, diamond$price,  
     xlab = "Mass (carats)", 
     ylab = "Price (SIN $)", 
     bg = "lightblue", 
     col = "black", cex = 1.1, pch = 21,frame = FALSE)
abline(fit, lwd = 2)
points(diamond$carat, predict(fit), pch = 19, col = "red")
lines(c(0.16, 0.16, 0.12), 
      c(200, coef(fit)[1] + coef(fit)[2] * 0.16,
        coef(fit)[1] + coef(fit)[2] * 0.16))
lines(c(0.27, 0.27, 0.12), 
      c(200, coef(fit)[1] + coef(fit)[2] * 0.27,
        coef(fit)[1] + coef(fit)[2] * 0.27))
lines(c(0.34, 0.34, 0.12), 
      c(200, coef(fit)[1] + coef(fit)[2] * 0.34,
        coef(fit)[1] + coef(fit)[2] * 0.34))
text(newx, rep(250, 3), labels = newx, pos = 2)
