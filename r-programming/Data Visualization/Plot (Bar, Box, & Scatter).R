library(tidyverse)

## basic plots (base R)

hist(mtcars$mpg)

## analyzing horse power
hist(mtcars$hp)
mean(mtcars$hp)
median(mtcars$hp)

str(mtcars)
mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("Auto","Manual"))

## bar plot - one quanlitative variable
barplot(table(mtcars$am))

## box plot
boxplot(mtcars$hp)
fivenum(mtcars$hp)

min(mtcars$hp)
quantile(mtcars$hp, probs = c(.25,.5,.75))
max(mtcars$hp)

## whisker calculation
Q3 <- quantile(mtcars$hp, probs = .75)
Q1 <- quantile(mtcars$hp, probs = .25)
IQR_hp <- Q3 - Q1 

Q3 + 1.5 * IQR_hp
Q1 - 1.5 * IQR_hp

boxplot.stats(mtcars$hp, coef = 1.5)

## filter out outliers
mtcars_no_out <- mtcars %>%
  filter(hp < 335)

boxplot(mtcars_no_out$hp)

## boxplot 2 variables
## Qualitative x Quantitative
boxplot(mpg ~ am, data = mtcars,
        col = c("gold", "salmon"))

## scatter plot
## 2 x quantitative
plot(mtcars$hp,mtcars$mpg, pch= 16, 
     col = "blue",
     main = "Relationship between HP and MPG",
     xlab = "Horse power",
     ylab = "Miles Per Gallon")


cor(mtcars$hp,mtcars$mpg)
lm(mpg ~ hp, data = mtcars)
