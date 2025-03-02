## create a new database

con <- dbConnect(SQLite(), "school.db")

dbWriteTable(con, "student",
             data.frame(id = 1:2,
                        names = c("toy","joe")))

dbGetQuery(con, "SELECT names FROM student")

dbDisconnect(con)
