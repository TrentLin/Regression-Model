### Setting
library(UsingR)
data(diamond)
library(ggplot2)

### Code
data(diamond)
y <- diamond$price; x <- diamond$carat; n <- length(y)
fit <- lm(y ~ x)
e <- resid(fit)
yhat <- predict(fit)
max(abs(e -(y - yhat)))
max(abs(e - (y - coef(fit)[1] - coef(fit)[2] * x)))

### Residuals are the signed length of the red lines
plot(diamond$carat, diamond$price,  
     xlab = "Mass (carats)", 
     ylab = "Price (SIN $)", 
     bg = "lightblue", 
     col = "black", cex = 2, pch = 21,frame = FALSE)
abline(fit, lwd = 2)
for (i in 1 : n) 
  lines(c(x[i], x[i]), c(y[i], yhat[i]), col = "red" , lwd = 2)

### Residuals versus X
plot(x, e,  
     xlab = "Mass (carats)", 
     ylab = "Residuals (SIN $)", 
     bg = "lightblue", 
     col = "black", cex = 2, pch = 21,frame = FALSE)
abline(h = 0, lwd = 2)
for (i in 1 : n) 
  lines(c(x[i], x[i]), c(e[i], 0), col = "red" , lwd = 2)

### Non-linear data
x = runif(100, -3, 3); y = x + sin(x) + rnorm(100, sd = .2); 
library(ggplot2)
g = ggplot(data.frame(x = x, y = y), aes(x = x, y = y))
g = g + geom_smooth(method = "lm", colour = "black")
g = g + geom_point(size = 7, colour = "black", alpha = 0.4)
g = g + geom_point(size = 5, colour = "red", alpha = 0.4)
g

### Residual plot
g = ggplot(data.frame(x = x, y = resid(lm(y ~ x))), 
           aes(x = x, y = y))
g = g + geom_hline(yintercept = 0, size = 2); 
g = g + geom_point(size = 7, colour = "black", alpha = 0.4)
g = g + geom_point(size = 5, colour = "red", alpha = 0.4)
g = g + xlab("X") + ylab("Residual")
g

### Heteroskedasticity
x <- runif(100, 0, 6); y <- x + rnorm(100,  mean = 0, sd = .001 * x); 
g = ggplot(data.frame(x = x, y = y), aes(x = x, y = y))
g = g + geom_smooth(method = "lm", colour = "black")
g = g + geom_point(size = 7, colour = "black", alpha = 0.4)
g = g + geom_point(size = 5, colour = "red", alpha = 0.4)
g

### Getting rid of the blank space can be helpful
g = ggplot(data.frame(x = x, y = resid(lm(y ~ x))), 
           aes(x = x, y = y))
g = g + geom_hline(yintercept = 0, size = 2); 
g = g + geom_point(size = 7, colour = "black", alpha = 0.4)
g = g + geom_point(size = 5, colour = "red", alpha = 0.4)
g = g + xlab("X") + ylab("Residual")
g

### Diamond example
y <- diamond$price; x <- diamond$carat; n <- length(y)
fit <- lm(y ~ x)
summary(fit)$sigma
sqrt(sum(resid(fit)^2) / (n - 2))

### data(anscombe);example(anscombe)
require(stats); require(graphics); data(anscombe)
ff <- y ~ x
mods <- setNames(as.list(1:4), paste0("lm", 1:4))
for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  ## or   ff[[2]] <- as.name(paste0("y", i))
  ##      ff[[3]] <- as.name(paste0("x", i))
  mods[[i]] <- lmi <- lm(ff, data = anscombe)
  #print(anova(lmi))
}


## Now, do what you should have done in the first place: PLOTS
op <- par(mfrow = c(2, 2), mar = 0.1+c(4,4,1,1), oma =  c(0, 0, 2, 0))
for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  plot(ff, data = anscombe, col = "red", pch = 21, bg = "orange", cex = 1.2,
       xlim = c(3, 19), ylim = c(3, 13))
  abline(mods[[i]], col = "blue")
}
mtext("Anscombe's 4 Regression data sets", outer = TRUE, cex = 1.5)
par(op)


