## function
## Create your function

greeting <- function() {
  print("Hello world")
}

greeting_name <- function(name) {
  text <- paste0("Hello! ", name)
  print(text)
}


## simple function
## default argument ## will calculate value on default
add_two_nums <- function(x,y) {
  return(x + y)
}

cube <- function(base, power) {
  base ** power
}

cube <- function(base,power) base ** power



hi1 <- function() print("hi")
hi2 <- function() print("hi! hi!")
hi3 <- function() print("hello!")

all_hi <- function() {
  hi1()
  hi2()
  hi3()
}

## control flow
## If for while

grading <- function(score) {
  if (score >= 80) {
    return("A")
  } else if(score >= 70) {
    return("B")
  } else if(score >= 60) {
    return("C")
  } else if(score >= 50) {
    return("D")
  } else {
    return("Failed")
  }
}

## for loop
## vectorization

nums <- c(25,30,40,100,1225)


for (i in nums) {
  if( i %% 2 == 0) {
    print(paste0(i,": Even number"))
  } else {
    print(paste0(i,": Odd number"))
  }
}

## while loop
count <- 0

while (count < 5) {
  print("ยังไม่ลืมแผนเก่า")
  count = count + 1
  if(count == 5) {
    print("ลืมได้แล้วนะครับ")
  }
}


## Take input from a user
## user input is a character

user_name <- readline("What is your name : ")
user_password <- readline("your password : ")

## Facebook login page logic

users <- c("toy", "john", "mary")
pw <- 1234

fb_login <- function() {
  print("Welcome to Facebook!")
  username <- readline("Username: ")
  password <- readline("Password: ")
  if ((username %in% users) & (password == pw)) {
    print("Log in successfully!")
  } else {
    print("Try again!")
  }
}
