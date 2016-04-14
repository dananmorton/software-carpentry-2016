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
