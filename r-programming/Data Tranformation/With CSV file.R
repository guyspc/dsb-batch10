## install packages
## install packages(dplyr)
install.packages("dplyr")

## load package
library(dplyr)

## read csv file into Rstudio
imdb <- read.csv("imdb.csv", stringsAsFactors = FALSE)
View(imdb)

## review data structure
glimpse(imdb)

##print head and tail of data
head(imdb,10)
tail(imdb,10)

## select columns
select(imdb, movie_name, rating)
select(imdb, 1, 5)

select(imdb, movie_name = MOVIE_NAME, released_year = YEAR)

## pipe operator
imdb %>% 
  select(released_year = year) %>%
  head(10)

## filter data
filter(imdb, SCORE >= 9.0)

imdb %>% filter(SCORE >= 9.0)

names(imdb) <- tolower(names(imdb)) 

imdb %>%
  select(movie_name, year, score) %>%
  filter(score >= 9 & year > 2000)

imdb %>%
  select(movie_name, year, score) %>%
  filter(score == 8.8 | score == 8.3 | score == 9)
  
imdb %>%
  select(movie_name, year, score) %>%
  filter(score %in% c(8.3,8.8,9))

## filter string columns
imdb %>%
  select(movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre))

imdb %>%
  select(movie_name) %>%
  filter(grepl("King",imdb$movie_name))


## create new columns
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"),
  length_group = if_else(length >= 120, "Long Film", "Short Film"))

imdb %>%
  select(movie_name, score) %>%
  mutate(score = score + 0.1) %>%
  head(10)

## arrange data
head(imdb)

imdb %>%
  arrange(length) %>%
  head(10)

imdb %>%
  arrange(desc(length)) %>% ## descending order
  head(10)

imdb %>%
  arrange(rating, desc(length)) 

## summarize and group by
imdb %>%
  filter(rating != "") %>%
  group_by(rating) %>%
  summarise(mean_length = mean(length),
            sum_length = sum(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n())

## join table
favourite_films <- data_frame(id = c(5,10,25,30,98))

favourite_films %>%
  inner_join(imdb, by = c("id" = "no"))

## write csv file (export result)
imdb %>%
  select(movie_name, year, rating, length, score) %>%
  filter(rating == "R" & year > 2000)

## export file
write.csv(imdb,"imdb_prep.csv", row.names = FALSE)
