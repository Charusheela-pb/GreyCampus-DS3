





###################ans 1.

a<- 4
b<- 2
if(a > b){
  print("France is winner")
}else{
  print("Cortia is a winner")
}



##################ans 2.

mtcars
str(mtcars)

for (i in 8:11){
  mtcars[,i] <- as.factor(mtcars[,i])
}
str(mtcars)



#########ans.3


library(readxl)
#library(DT)
data1 <- read_excel("Dataset2.1.xlsx")
head(data1)
colSums(is.na(data1))
percent <- function(x){
  (sum(is.na(x))/length(x))*100
}
per_col <- apply(data1,2,percent)
head(per_col)



####### ans 4.

rowSums((is.na(data1)))
percentage <- function(x){
  (sum(is.na(x))/length(x))*100
}
per_row <- apply(data1,1,percentage)
head(per_row)

####### ans5.

str(data1)
summary(data1$THC)
summary(data1$Year)
summary(data1$Test.Veh.Displacement.L)
summary(data1$Rated.Horsepower)
summary(data1$No.of.Cylinders.and.Rotors)
summary(data1$No.of.Gears)
summary(data1$Equivalent.Test.Weight.lbs)
summary(data1$Axle.Ratio)
summary(data1$N.V.Ratio)
summary(data1$Test.Fuel.Type.Cd)
summary(data1$Test.Category)
summary(data1$CO)
summary(data1$NOX)
summary(data1$RND_ADJ_FE)
summary(data1$FE.Bag.1)
summary(data1$FE.Bag.2)
summary(data1$FE.Bag.3)
summary(data1$Target.Coef.A)
summary(data1$Target.Coef.B.mph.)
summary(data1$Target.Coef.C.mph.2)
summary(data1$Set.Coef.A.)
summary(data1$Set.Coef.B.mph.)
summary(data1$Set.Coef.C.mph.2)
head(data1)
str(data1)
boxplot(data1$Year)



########ans6.

library(ggplot2)
str(data1)
hist(data1$THC)
hist(data1$Year)
hist(data1$Test.Veh.Displacement.L)
hist(data1$Rated.Horsepower)
hist(data1$No.of.Cylinders.and.Rotors)
hist(data1$No.of.Gears)
hist(data1$Equivalent.Test.Weight.lbs)
hist(data1$Axle.Ratio)
hist(data1$N.V.Ratio)
hist(data1$Test.Fuel.Type.Cd)
hist(data1$Test.Category)
hist(data1$CO)
hist(data1$NOX)
hist(data1$RND_ADJ_FE)
hist(data1$FE.Bag.1)
hist(data1$FE.Bag.2)
hist(data1$FE.Bag.3)
hist(data1$Target.Coef.A)
hist(data1$Target.Coef.B.mph.)
hist(data1$Target.Coef.C.mph.2)
hist(data1$Set.Coef.A.)
hist(data1$Set.Coef.B.mph.)
hist(data1$Set.Coef.C.mph.2)
data_dis <- function(x,y){
  ggplot(x)+aes(y)+geom_histogram()
}
data_dis(data1,data1$CO2)

####### ans7.

##read your file

library(tidyverse)
data <- read.csv("Dataset2.2.csv",
                 na.strings = c("","NA"),
                 stringsAsFactors = FALSE)
head(data)
str(data)
library(lubridate)
data$'First.FD.Date' <- mdy(data$'First.FD.Date')

data$'Last.FD.Date' <- mdy(data$'Last.FD.Date')

data$'FD.termination.date' <- mdy(data$'FD.termination.date')

str(data)
head(data)



#######ans 8.

tidy_date <- data %>%
  separate('Date.of.Birth', c("Day","Month","Year")) %>%
  mutate(Yr = case_when(Year > 20 ~ '19',
                        Year <= 20~'20')) %>%
  unite(Year, c("Yr","Year"),sep = "")
head(tidy_date)
tidy_date$Month <- match(tidy_date$Month,month.abb)
tidy_date2 <- tidy_date %>%
  unite(Date_of_birth,c("Month","Day","Year"),sep="/")
head(tidy_date2)



#########ANS 9.


tidy_date2$Date_of_birth <- gsub("NA/NA/NANA","NA",tidy_date2$Date_of_birth)
tidy_date2$Date_of_birth <- gsub("/NA/NANA","NA",tidy_date2$Date_of_birth)
head(tidy_date2)
str(data)

tidy_date2$Date_of_birth <- as.Date(tidy_date2$Date_of_birth,format = "%d/%m/%y")
str(tidy_date2)


#######ans.10


install.packages("gapminder")
library(gapminder)
library(tidyverse)

tidy_date3 <- tidy_date2 %>%
  mutate(age= (First.FD.Date - Date_of_birth)/365 ) %>%
  separate(age,(c("age","Decimal")))%>%
  select(-("Decimal"))
head(tidy_date3)
