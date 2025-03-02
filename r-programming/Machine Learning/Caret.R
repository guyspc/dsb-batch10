## Recap ML workflow (simple)
## 1. spilt data
## 2. Train model
## 3. score (predict test data)
## 4. evaluate model (train error vs. test error)

## the biggest problem = overfitting
## optimization vs. machine learning

library(tidyverse)
library(caret)
library(mlbench)

## spilt 
split_data <- function(data) {
  set.seed(42)
  n <- nrow(mtcars)
  id <- sample(1:n, size = 0.7*n)
  train_df <- data[id, ]
  test_df <- data[-id, ]
  return(list(train=train_df,test=test_df))
}

prep_df <- split_data(mtcars)

## k-fold cross validation

set.seed(42)

grid_k <- data.frame(k = c(5,9))

## repeated k-flod cv
ctrl <- trainControl(method = "repeatedcv",
                     number = 5,
                     repeats = 5,
                     verboseIter = TRUE)

knn <- train(mpg ~ .,
             data = prep_df$train,
             method = "knn",
             metric = "MAE",
             trControl = ctrl,
             ## ask program to random K
             tuneLength = 3 )


## ------------------------------------------------------------------
## Classification problem

data("PimaIndiansDiabetes")
View(PimaIndiansDiabetes)

df <- PimaIndiansDiabetes

## check/ inspect data
mean(complete.cases(df)) == 1
nrow(df)

##glimpse
glimpse(df)

## logistic regression method = "glm"
set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5)

logit_model <- train(diabetes ~ . - triceps,
                     data = df,
                     method = "glm",
                     metric = "Accuracy",
                     trControl = ctrl)

## final model
logit_model$finalModel

## variable importance
varImp(logit_model)

## confusion matrix
p <- predict(logit_model, newdata=df)

table(p, df$diabetes, dnn = c("Predict","Actual"))

## caret: confusion martix
confusionMatrix(p, df$diabetes, 
                positive = "pos",
                mode = "prec_recall")

## regression -> high bias
## data chabge => model doesn't change that much

## save model .RDS
saveRDS(logit_model, "logistic_reg.RDS")
