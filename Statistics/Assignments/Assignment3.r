
getwd()
setwd("D:/GreyCampus-DS3/Statistics/Assignments")
getwd()


library(tidyverse)
covid19_data <- read.csv("COVID19.csv",
                         na.strings = c("","NA"),
                         stringsAsFactors = FALSE)
view(covid19_data)                    
head(covid19_data)

##### removing an "x"column
covid19_data %>%
  select(-2) -> coviddataset

head(coviddataset)
### converting data from char to integer

#install.packages("moments")
library(moments) 
str(coviddataset)
coviddataset$TotalCases <- gsub(",","",coviddataset$TotalCases)
coviddataset$TotalCases <- as.integer(coviddataset$TotalCases)
coviddataset$NewCases <- gsub(",","",coviddataset$NewCases)
coviddataset$NewCases <-as.integer(coviddataset$NewCases)
coviddataset$TotalDeaths <- gsub(",","",coviddataset$TotalDeaths)
coviddataset$TotalDeaths <-as.integer(coviddataset$TotalDeaths)
coviddataset$TotalRecovered <- gsub(",","",coviddataset$TotalRecovered)
coviddataset$TotalRecovered <-as.integer(coviddataset$TotalRecovered)
coviddataset$NewRecovered <- gsub(",","",coviddataset$NewRecovered)
coviddataset$NewRecovered <-as.integer(coviddataset$NewRecovered)
coviddataset$ActiveCases <- gsub(",","",coviddataset$ActiveCases)
coviddataset$ActiveCases <-as.integer(coviddataset$ActiveCases)
coviddataset$Serious.Critical <- gsub(",","",coviddataset$Serious.Critical)
coviddataset$Serious.Critical <-as.integer(coviddataset$Serious.Critical)
coviddataset$Tot.Cases.1M.pop <- gsub(",","",coviddataset$Tot.Cases.1M.pop)
coviddataset$Tot.Cases.1M.pop <-as.integer(coviddataset$Tot.Cases.1M.pop)
coviddataset$Deaths.1M.pop <- gsub(",","",coviddataset$Deaths.1M.pop)
coviddataset$Deaths.1M.pop <-as.integer(coviddataset$Deaths.1M.pop)
coviddataset$TotalTests <- gsub(",","",coviddataset$TotalTests)
coviddataset$TotalTests <-as.integer(coviddataset$TotalTests)
coviddataset$Tests.1M.pop <- gsub(",","",coviddataset$Tests.1M.pop)
coviddataset$Tests.1M.pop <-as.integer(coviddataset$Tests.1M.pop)
coviddataset$Population <- gsub(",","",coviddataset$Population)
coviddataset$Population <-as.integer(coviddataset$Population)
coviddataset$X1.Caseevery.X.ppl <- gsub(",","",coviddataset$X1.Caseevery.X.ppl)
coviddataset$X1.Caseevery.X.ppl <-as.integer(coviddataset$X1.Caseevery.X.ppl)
coviddataset$X1.Deathevery.X.ppl <- gsub(",","",coviddataset$X1.Deathevery.X.ppl)
coviddataset$X1.Deathevery.X.ppl<-as.integer(coviddataset$X1.Deathevery.X.ppl)
coviddataset$X1.Testevery.X.ppl <- gsub(",","",coviddataset$X1.Testevery.X.ppl)
coviddataset$X1.Testevery.X.ppl <-as.integer(coviddataset$X1.Testevery.X.ppl)
str(coviddataset)
hist(coviddataset$TotalCases)



###### Numerical summary of data

mean(coviddataset$TotalCases, na.rm = TRUE)
median(coviddataset$TotalCases,na.rm = TRUE)
mode(coviddataset$TotalCases)
y <- table(coviddataset$TotalCases)
y

###### cchecking for normally distribution

shapiro.test(coviddataset$TotalCases)
skewness(coviddataset$TotalCases,na.rm = TRUE)
hist(coviddataset$TotalCases)
#### The data is right skewed the mean value is greater than median value


####checking for percentage of NA's

colSums(is.na(coviddataset))
percent <- function(x){
  (sum(is.na(x))/length(x))*100
}
per_col <- apply(coviddataset,2,percent)
per_col


#### removing unwanted data

coviddataset %>%
  select(-X1.Caseevery.X.ppl:-X1.Testevery.X.ppl) ->Covid19data
Covid19data
view(Covid19data)


##### Step 3


boxplot(Covid19data$TotalCases,main="TotalCases",horizontal = TRUE,
        border = c("#999999", "#E69F00", "#56B4E9"),
                     col="maroon")

boxplot(Covid19data$TotalDeaths,main="TotalDeaths",horizontal = TRUE,
        border = c("#999999", "#E69F00", "#56B4E9"),
        col="Red")

boxplot(Covid19data$TotalRecovered,main="TotalRecovery",horizontal = TRUE,
        border = c("#999999", "#E69F00", "#56B4E9"),
        col="steelblue")

#########all the three graphs are right skewed


#######2



library(ggplot2)
coviddataset$TotalCases <- gsub(",","",coviddataset$TotalCases)
coviddataset$Population <- gsub(",","",coviddataset$Population)
Covid19data %>%
  ggplot(aes(x = TotalCases, y = Population))+
  geom_point()+
  labs(title = "Correlation between total cases and total population",
       x = "TotalCases",
       y = "Population")+
  scale_x_continuous(limits = c(-10,10))
  
  


with(Covid19data, plot(TotalCases, Population),pch= 20)
title(main = "covid 19 data sets")
model <- lm(TotalCases ~ Population , Covid19data)
abline(model , lwd=2)


######3



Covid19data %>%
  ggplot(aes(x = Tot.Cases.1M.pop, y = Population))+
  geom_point()+
  labs(title = "Correlation between total cases of 1M population and total population",
       x = "Tot.cases.1M.Pop",
       y = "Population")

with(Covid19data,main= "corelation of Totalcases/1MP and POpulation",plot(Tot.Cases.1M.pop,Population))
####there is a  positive corelation between totalcases.1m.pop

######## 4



boxplot(TotalCases ~ Tests.1M.pop, data = Covid19data, frame = FALSE)


##########5 



Covid19data %>%
  ggplot(aes(x = TotalCases, y = TotalDeaths))+
  geom_point()+
  labs(title = "Correlation between total cases and total deaths",
       x = "Total Cases",
       y = "Total Deaths")

#########6 


Covid19data %>%
  ggplot(aes(x = TotalCases, y = Deaths.1M.pop))+
  geom_point()+
  labs(title = "Correlation between total cases and total Deaths per population",
       x = "Totalcases",
       y = "Deaths.1M.Pop")


########7








ggplot(Covid19data, aes(Tot.Cases.1M.pop, Continent))+
  geom_point(colour = "maroon", size = 3)



#####8


ggplot(Covid19data, aes(Deaths.1M.pop, Continent))+
  geom_point(colour = "red", size = 3)


#########9

ggplot(Covid19data, aes(TotalTests, Tests.1M.pop))+
  geom_point(colour = "maroon", size = 3)


#######10


ggplot(Covid19data, aes(TotalTests, Continent))+
  geom_point(colour = "maroon", size = 3)


########11
###mean= median=mode its normally distributed
summary(Covid19data$Tests.1M.pop)
skewness(Covid19data$Tot.Cases.1M.pop,na.rm = TRUE)
hist(Covid19data$Tests.1M.pop)
qqnorm(Covid19data$Tests.1M.pop)
qqline(Covid19data$Tests.1M.pop)

###########its is right skewed
#####mean!median!mode not normally distributed it is right skewed











