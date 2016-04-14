setwd("~/Desktop/software-carpentry-2016/data-files/r-lesson/data/")
list.files()
read.csv("inflammation-01.csv", header = FALSE)

weight_kg <- 55
weight_kg

weight_kg*2.2
weight_kg <- 57
weight_kg*2.2


weight_lb <- weight_kg*2.2
weight_kg <- 100
weight_lb

dat <- read.csv("inflammation-01.csv", header = FALSE)
dat
class(dat)
dim(dat)
dat[1,1]


raptor_1 <- dat[1,]
max (raptor_1)


?apply
average_raptor_inflammation = apply(dat,1, mean)
average_day_infl = apply (dat, 2, mean)

average_day_infl
average_raptor_inflammation

average_all = apply(dat, c(1,2), mean)


animal <- c("m", "o", "n", "k", "e", "y")
# first three characters
animal[1:3]
# last three characters
animal[4:6]

animal[-1]
animal[-4]
animal[-1:-4]
animal[1:4]

# last three characters
animal[4:1]

animal[c(5,2,3)]


plot(average_day_infl)
max_day_infl <- apply(dat, 2, max)
plot(max_day_infl)

min_day_infl <- apply(dat, 2, min)
plot(min_day_infl)

sd_day_infl <- apply(dat, 2, sd)
plot(sd_day_infl)




setwd("~/Desktop/software-carpentry-2016/data-files/r-lesson/data/")

#build a fucntion that converts fahrenheit temps to Kelvin "return" gives the result
fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}
fahr_to_kelvin(32)


#challenge- create a function

best_practice <- c("Write", "programs", "for", "people", "not", "computers")
asterisk <- "***"  # R interprets a variable with a single value as a vector
fence <- function(original, wrapper) {
  concat_string = c(wrapper, original, wrapper)
  return(concat_string)
}
#use "original" and "wrapper" as a place holder, like X and Y. once outside of the function, those words are not stored as anything by R. 
fence(best_practice, asterisk)



list.files()


analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}

analyze("inflammation-01.csv")


#for loops lesson

best_practice <- c("let", "the", "computer", "do", "the", "work")
best_practice

print_words <- function(sentence) {
  for (word in sentence){  #"in" is crucial, indicates that word is a unit of Sentence
    print(word)
  }
}

print_words(best_practice)
print_words(best_practice[-6])
  


#general format of a for loop in R

# for (variable in collection) {
  #do things with the variable
  #}  curly brackets define boundary of for loop in R

len <- 0
vowels <- c("a", "e", "i", "o", "u")
  for (v in vowels) {
    len <- len + 1
  print(len)
  }

len
v




print_N <- function(natural_numbers) {
  #function that prints natural_numbers, input is a number
  for (number in seq(natural_numbers)) {  
   print(number)
 }
}

print_N(6)


#loop through files analysis

list.files()
Sys.glob("*.csv")  # returns all files with that ending

filenames <- Sys.glob("i*.csv")

#run analysis on each file
for (file in filenames){
  print(file)
  analyze(file)
}

#saving plots to a file


analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}


analyze_all <- function(pattern) {
  # Runs the function analyze for each file in the current working directory
  # that contains the given pattern.
  filenames <- list.files(path = "data", pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    analyze(f)
  }
}


#print plots to PDF
pdf("inflammation-01.pdf")
analyze("inflammation-01.csv")
dev.off()  #this is important! "closes" the pdf. otherwise new analyses will overwrite the pdf

pdf("inflammation-02.pdf")
analyze("inflammation-02.csv")
dev.off()


#Conditionals - "if" "then" statements

num <- 102
if (num > 100){
  print ("greater")  #need curly brackets for each part of the statement
} else {
  print ("not greater")
}
print("done")    #print done at end to show that the program is done running


# a slightly more complicated conditional 
sign <- function(num) {
  if (num > 0) {    # can use, <==, >==, =/=
    return(1)
  }else if (num == 0) {    # is num exactly equal to 0? if so, return 0
    return(0)
  }else {
    return(-1)
  }
}
  
sign (0)
sign(10)
sign(-1)


# can use and's(&) and or's (|) to string together conditionals:

if (1>0 & -1 > 0) {
  print ("both parts are true")
} else {
  print ("at least one part is not true")
}

if (1>0 | -1 > 0) {
  print ("at least one part is true")
} else {
  print ("niether part is true")
}