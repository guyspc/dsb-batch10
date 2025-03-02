library(tidyverse)
library(glue)
library(RSQLite)
library(readxl)
library(jsonlite)

## read file into R

df1 <- read_csv("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_01.csv")

df2 <- read_csv2("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_02.csv")

df3 <- read_delim("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_03.txt", delim = "|")

df4 <- read_tsv("https://raw.githubusercontent.com/toyeiei/data-traninig/main/student_04.tsv")

## read excel file, sheet 1
df5 <- read_excel("student_05.xlsx", sheet = 1)


## how to read a json file into R >> for work with API
my_profile <- fromJSON("my_profile.json")

## read json as dataframe
temp <- fromJSON("example_df.json")

## data transformation 101
##library(tidyverse)
library(dplyr)

## 1. select colume => SQL select
## 2. filter colume => SQL where
## 3. arrange => SQL order by
## 4. mutate (create new colume)
## 5. summarise => SQL aggregate function

## how to select columns
select(mtcars, hp, wt, am)

select(mtcars, 1:5, 10)

select(mtcars, contains("a"))

## transformation data pipeline
m_cars <- mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model) ) %>%
  arrange(am, desc(hp))

## mutate.
hp_df <- mtcars %>%
  filter(hp < 100) %>%
  select(model, am, hp) %>%
  mutate(am_label = ifelse(am == 0,"Auto", "Manual"),
         hp_scale = hp/100,
         hp_double = hp * 2)

## summarise
mtcars %>%
  filter( wt <=5) %>%
  summarise(mean_hp = mean(hp),
            sum_hp = sum(hp),
            median_hp = median(hp),
            sd_hp = sd(hp),
            n = n())
