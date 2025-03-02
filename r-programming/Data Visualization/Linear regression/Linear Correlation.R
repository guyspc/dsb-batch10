## Correlation
cor(mtcars$hp,mtcars$mpg)
cor(mtcars$wt,mtcars$mpg)

plot(mtcars$hp,mtcars$mpg, pch=16)
plot(mtcars$wt,mtcars$mpg, pch=16)
plot(mtcars$wt,mtcars$hp, pch=16)

cor(mtcars[ , c("mpg","wt","hp")])

## dplyr (tidyverse)
library(dplyr)
cormat <- mtcars %>%
  select(mpg,wt,hp,am) %>%
  cor()

## Compute correlation (r) and sig test
cor(mtcars$hp,mtcars$mpg)
cor.test(mtcars$hp,mtcars$mpg)


## Linear regression
## mpg = f(hp)

lmfit <- lm(mpg ~ hp, data = mtcars)

summary(lmfit)

## Prediction
lmfit$coefficients[[1]] + lmfit$coefficients[[2]]*200

new_cars <- data.frame(
  hp = c(250,320,400,410,450)
)

## Predict()
new_cars$mpg_pred <- predict(lmfit, newdata = new_cars)
new_cars$hp_pred <- NULL

summary(mtcars$hp)

## Root Mean Squared Error (rmse)
## Multiple linear regression
## mpg = f(hp,wt,am)
## mpg = intecept + b0*hp + b1*wt + b2*am

lmfit_v2 <- lm(mpg ~ hp + wt + am, data = mtcars)

coefs <- coef(lmfit_v2)

coefs[[1]]+coefs[[2]]*200+coefs[[3]]*3.5+coefs[[4]]*1

## bulid full model
lmfit_full <- lm(mpg ~ ., data = mtcars)
mtcars$predicted <- predict(lmfit_full)

head(mtcars)

## train RMSE
squared_error <- (mtcars$mpg - mtcars$predicted) ** 2
(rmse <- sqrt(mean(squared_error)))

## split data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, n*0.7)
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]

## train model
model1 <- lm(mpg ~ hp + wt + am + disp, data = train_data)
p_train <- predict(model1)
error_train <- train_data$mpg - p_train
(rmse_train <- sqrt(mean((error_train)**2)))

## test model
p_test <- predict(model1, newdata = test_data)
error_test <- test_data$mpg - p_test
(rmse_test <- sqrt(mean(error_test**2)))

## print result
cat("RMSE Train", rmse_train,
    "\nRMSE Test", rmse_test)
