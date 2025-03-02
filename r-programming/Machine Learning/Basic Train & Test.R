library(tidyverse)
library(caret)

##load data
mtcars

##split data 70:30
set.seed(42)
n <- nrow(mtcars) ##32
id <- sample(1:n, size = 0.7*n)
train_df <- mtcars[id, ]
test_df <- mtcars[-id, ]

## train
set.seed(42)
lm_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "lm")

## score
p_test <- predict(lm_model, newdata=test_df)



## evaluate
error <- test_df$mpg - p_test
mae <- mean(abs(error))
mse <- mean(error**2)
rmse <- sqrt(mean(error**2))
