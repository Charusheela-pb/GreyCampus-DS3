

library(tidyverse)
data <- read.csv("COVID19.CSV",
                 na.strings = c("","NA"),
                 stringsAsFactors = FALSE)
str(data)
data$TotalCases <- gsub(",","",data$TotalCases)
data$TotalCases <- as.integer(data$TotalCases)
str(data)
boxplot(data$TotalCases)
