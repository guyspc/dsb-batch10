## load library
library(tidyverse)
library(glue)
library(RSQLite)

## glue => string template
name <- "toy"
age <- 35

glue("Hello my name is {name}, and i am {age} years old")

## connect sqlite datdabase
## created connection

con <- dbConnect(SQLite(), "chinook.db")

## how many table
dbListTables(con)

## how many colume
dbListFields(con, "customers")

## get data from a table
usa_customer <- dbGetQuery(con,"SELECT 
           firstname,
           lastname,
           country,
           email
           From customers
           WHERE country = 'USA'")

dbListTables(con)

## write table in database
branches <- data.frame(
  branch_ID = 1:3,
  branch_name = c("BKK","LON","SEOUL")
)

dbWriteTable(con,"branches",branches)

## remove table
dbRemoveTable(con,"branches")

## dbDisconnect()
dbDisconnect(con)
