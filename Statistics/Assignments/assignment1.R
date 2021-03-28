
########ans.1############
##Difference between the vector and matrix#####
#####vector:- 1)vector is a list of numbers can be in a row or column.
######        2)vectors are dimensionless.
####Matrix:- 1) matrix is a rectangular array of numbers holding one or more rows and columns.
######       2)matrix are 2 dimensional vector.
##Similarity between the vector and matrix #####
##### vector:- 1) vector holds the elements of fixed size and similar data type.
##### matrix:- 1)matrix also holds the elements of fixed size and similar data type.




#######ans.2############
##Difference between the data frame and matrix####
### Data Frame:- 1)In a data frame holds multiple data types in multiple columns.
##              2) it is a list of vector of equal length.
##               3) it has a variable number of rows and columns.
## Matrix:-     1) matrix is a m*n array with similar data type.
###             2)created using a vector input.
###             3) has fixed number of rows and columns.
##              4) can perform arithmetic operations on matrix.
##similarity between data frame and matrix#####
###similarity between data frame and matrix is that  both are in m*n form.



###ans.3 creating a vector #######

v1 <- c(15,TRUE,"WORLD")#### when number and characters are together in datatype the numbers are casted in character#####
v1
###it will print the vector without an error



#####ans.4 subject data#######

v2 <-c("statictics","Linearalgebra" ,"calculs")
v2
v3 <-c(95,91,88)
v3
v4 <-c(v2,v3)
v4

######ans.5 checking type of created vector####

v1
v2
##using class we can check the data type of elements in the vector#######
class(v2)


#####ans.6 creating a matrix########

nums <- c(95,91,98,96,94,97,88,98,85)
nums
mat1 <- matrix(nums,nrow = 3,byrow = TRUE)
mat1
row_names <-c("Bhumi","Arya","Dev")
col_names <-c("Statictics","Linearalb","Calculs")
rownames(mat1) <-row_names
colnames(mat1) <-col_names
mat1


#####ans.7 converting matrix into data frame#######


mat1
df1=as.data.frame(t(mat1)) 
df1


#####ans.8 creating data frame#######




countryname <- c("Brazil","France","Italy","Spain","Mexico")
Totalcase <- c(12051619,4298395,3400877,3228803,2197160)
Totaldeath <- c(160200,92621,105328,73543,198239)
df <- data.frame(countryname,Totalcase,Totaldeath)
df

#####ans.9 #########

mtcars
str(mtcars)
class(vs)
names(mtcars)
mtcars$mpg <-as.character(mtcars$mpg)
str(mtcars)
mtcars$vs <-as.logical(mtcars$vs)
str(mtcars)
mtcars$am <- as.logical(mtcars$am)
str(mtcars)
mtcars$cyl <- as.factor(mtcars$cyl)
str(mtcars)
mtcars$drat <-as.integer(mtcars$drat)
str(mtcars)
