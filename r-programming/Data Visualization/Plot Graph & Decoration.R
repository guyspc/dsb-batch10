library(tidyverse)

# ggplot
# grammar of graphics - 2D
# hadley wickham

ggplot(data = mtcars,
       mapping = aes(x=mpg, y=hp)) +
  geom_point()

##  cheatsheet ggplot2 in R

## discrete vs. continuous

## discrete
## 1,2,3,4,5 or "M", "F" or "High","Med","Low"

## continuous (measurement)
## 176.567823135523...=> 176

## quiz
## heart rate => Discrete
## internet data (mb ...)

gpa <- c(3.41, 3.52, 2.98, 3.95)

## discrete, factor, categorical data

gender <- c(rep("M", 10), rep("F", 8))

gender_factor <- factor(gender, 
                        levels = c("M","F"), 
                        labels = c("M","F"))

animals <- c("Cat", "Dog","hippo","Cat")
animals <- factor(animals)

spending <- c("low", "high", "med", "med","high")

factor(spending,
       levels=c("low","med","high"),
       labels=c("low","med","high"),
       ordered = TRUE)


##one variable

ggplot(mtcars, aes(mpg)) +
  geom_histogram(bins=6)

base <- ggplot(mtcars, aes(mpg))

base + geom_density()
base + geom_histogram(bins=5,fill="gold",color="black")
base + geom_area(stat = "bin")

##one variable - discrete/ categorical
mtcars %>%
  select(hp, wt, am) %>%
  mutate(am = ifelse(am==0, "Auto", "Manual")) %>%
  ggplot(aes(am)) + geom_bar()

##two variables, both continuous
base <- ggplot(data = mtcars,
       mapping = aes(hp,mpg))
base +
  geom_point() +
  geom_smooth(method = "lm") +
  geom_rug()

## setting vs. mapping
base +
  geom_point(col = "red",
             size = 5,
             alpha=0.4, shape = 8)

base + 
  geom_point(
    mapping = aes(col=factor(am))
    
base +
  geom_point(mapping = aes(col=wt)
             
## explore data with chart
set.seed(42)
small_df <- diamonds %>%
  sample_frac(0.1) %>%
  filter(cut %in% c("Fair", "Premium", "Ideal"))

ggplot(diamonds %>% sample_frac(0.1), aes(carat,price)) +
  geom_point(alpha=0.3,col = "blue") +
  theme_minimal()

base2 <- ggplot(small_df, 
  mapping = aes(carat,price, col=cut)) +
  geom_point(size=3, alpha=0.2) +
  theme_minimal()

## facet, sub-plot
base2 +
  facet_wrap(~cut, nrow = 1)

base2 +
  facet_wrap(~color, ncol=3)

base2 +
  facet_grid(color ~ cut)

base3 <- ggplot(small_df %>%
         filter(carat<=2.5), 
       mapping = aes(carat,price)) +
  geom_point(size=3, alpha=0.2) +
  geom_smooth(se = FALSE, col="red") +
  theme_minimal() 

## set title, caption, x/y labels
base3 +
  labs(title = "Correlations is very strong",
       subtitle = "Correlation is 0.85",
       caption = "Soure : ggplot package",
       x = "Diamond Carat",
       y = "Price $ USD")

## change color manual
df <- data.frame(
  id = 1:5,
  fruit =c(rep("orange",3), rep("banana",2)),
  price =c(20,25,21,24,30),
  weight =c(5,4,7,6,10))

ggplot(df,aes(weight, price, col=fruit)) +
  geom_point(size = 3) +
  scale_color_manual(values = c("gold","orange")) +
  theme_minimal()

ggplot(df,aes(weight, price, col=price)) +
  geom_point(size = 3) +
  theme_minimal() +
  scale_color_gradient(low="gold",high="blue")

## final tips - multiple dataframe in one chart
df1 <- df %>% filter(weight < 7)
df2 <- df %>% filter(weight >= 7)

ggplot() +
  theme_minimal() +
  geom_point(data=df1,
             mapping = aes(weight, price),
             color="salmon", size=3) +
  geom_point(data=df2,
             mapping = aes(weight, price),
             color="black", size=3)
