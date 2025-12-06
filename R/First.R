#=============================
# BASIC OPERATIONS
#=============================

3+5 
2^3
10%%3   #remainder 

#=============================
# VARIABLE ASSIGNMENT
#=============================

#to assign variables
x <-45 
y=5
z <- x+y 
print(z)

p<- "THis is my name"
print(p)
noquote(p)
typeof(p)

d <- TRUE  
typeof(d)
as.integer(d) #because its true its 1 , this is typecasting

#=============================
# DATA STRUCTURES: VECTORS
#=============================

#data structures 
typeof(d) #for changing this we can do d<- as.xxx(d)
print(1:10) #print 1 to 10
seq(1,65,17)#print 1 to 65 with separation of 17
rep(9,6) #repetition of 9 6 times 
#a vector is same as an array in C

v <- c(seq(1,10,1))
print(v)
v[-2] #all elements except the second , x[c(1,3)] elements 1 and 3 , 1:3 for 1 to 3 

#to acess the first element we haave 
v[1:3]#acess elements from 1 to 3 index 
f <- v*2
e <- sum(f)#multiply each by 2 
print(e)

#elements are added into the vector as 
print(v)
h <-v + c(rep(1,10))#here we added one to each element of v but it doesnt change the original v
print(h)
#if we want to change to v than instead of h we write v 
print(v)
mean(v) #we have various others like sort , min , max , unique(x) removes double elements 

v>20 #return boolean for each value 
v[v>20] #print elements greater than 20
names(v) <- c("a","b","c","d","e","f","g","h","i","j") #naming each element 
names(v) <- NULL
v <- c(v,11,12,13) #adding to v

#=============================
# LISTS
#=============================

#lists contain different data types 
list <- list(name = "MArksman", age = 76, phone_number = 384782374 , marks = list(Maths= 45 , chem =33))
#this is a list within a list
print(list)

#to access elements we have 
print(list$name)
print(list$marks$Maths)
list$marks$Maths <- 67
print(list$marks$Maths)

#we also have this 
list[4] #[] this returns a sublist and [[]] returns or modifies single element inside the list 
list[5] = address = "Baramulla"
print(list)
typeof(list[5]) #this is still a list 

list[[6]] <- 67#directly assigns the value of the 6th element not as a sub list 
typeof(list[[6]])#this returns the value inside the element present and when we do [] this retirns the element as a sub list 

list[[2]] #value inside the second element 
list[[4]][1] #access the first element inside the inner list 
list[[4]][[1]] #access the value inside the first element of the inner list 

print(list) 
#assigning name to 5th element address 
names(list)[5] <- "address"
# Rename element inside a sub-list
names(list$marks)[names(list$marks) == "chem"] <- "Chemistry"

print(list)

#to change all the names of all elements , the length must match 
names(list$marks) <- c("Maths", "Chemistry") 
print(list)

o <- list(2,3,4,5,3,3,4,5)
h <- list(2,3,2,5,4,3,5,3)
o <- c(o,h)
mapply('-', o, h) #element wise arithmetic operations 
print(o)

#=============================
# MATRICES
#=============================

#MATRICES : A 2D data structure of same data type
m <- matrix(3:10, nrow = 3, ncol = 3)#here one element is less 3 to 10 , 8 elements , if less it starts repeating 3 ,4,5 
print(m)
#to acess row [row number, ], to access a coloumn [, cokoum ni]
m[1,2]
p<- matrix(seq(103,165, 7), nrow = 3, ncol = 3)
m*p #matrix multiplication
t(m) #transpose of a matrix 
#=============================
# DATAFRAMES
#=============================

frame <- data.frame(
  name = c("Zaid", "wasil"),
  age = c(45, 34),
  phone_number = c("342423434","432432423"),
  marks = I(list(list(math = 45 , chemistry = 67), list(math = 90 , chemistry = 87))) #I stands for as is , tells R 
  #not to break this apart when binding df , prevents automatic expanding of lists to make coloumns by R
) 

frame$marks[[2]]$math
frame[1,4]
print(frame)

#to add new coloumn 
frame$lele <- c(34,44)

#to add a row 
new_row <- data.frame(
  name = "Aman",
  age = 66,
  phone_number = "435345235",
  marks = I(list(list(math = 99, chemistry = 88))),
  lele = 56
) #this works 
frame <- rbind(frame , new_row) #rbind binds two dataframes 
View(frame)

frame$lele <- NULL #deleting a cloumn 
#to do by index we have 
new_row <- new_row[,-5] #deletes the fifth coloumn , to delete multiple [, -c(2,3)] deletes coloumn 2 to 3 
print(new_row)

#=============================
# FACTORS
#=============================

age <- factor(c("Adult" , "Kid" , "Kid", "Kid", "Adult"),levels = c("Kid", "Adult"), ordered = TRUE)#in levels first one is lesser in numeric value
age #prints levels as adult and kid
levels(age) #shows all possible categories
as.numeric(age) # stores adult as 2 and kid as 1 
age[1]>age[2]

#assigning labels to values or value to labels , value in labels and 
frame$age_group_factor <- factor(frame$age , levels = c(66,45,34),
                                 labels = c("Hag", "Old","Managable")) 
print(frame)

#if we want to assign based on a property 
frame$half_century <- ifelse(frame$age >50 , "Crossed","Nearing")

#=============================
# CONTROL STATEMENTS
#=============================

k <- 3 

if(k>3){
  print("k is greater than 3")
}else if(k==3){
  print("k is equal to 3")
}else {
  print("idk")
} 

#ifelse is a vectorised conditional ie it works on every element of the vector 
r <- c(50,44,90)
r <- ifelse(r>50 , "pass", "Fail" )
print(r)

firstsemester <- data.frame(
  subjects = c("C_PRogramming ", "IoT", "Managament"),
  Internals = c(13,22,11),
  externals = c(56,57,31)
)
firstsemester$passed <- ifelse(firstsemester$Internals+firstsemester$externals > 56 , "PASSEd","Fail")
View(firstsemester)

#FOR LOOP
o <- 0
numbers <- c()
results <- c()
for (i in seq(10,60,7)){
  numbers <- c(numbers , i)
  if (i %% 2 == 0){
    results <- c(results , "Even")
    o = o+ 1
  }else{
    results <- c(results, "Odd")
  }
} 
print(paste("The number of even numbers is ",o))#when some object use print paste , C style can also be used using sprintf
#to print without quotes we can use 
cat("THe number of even number is ",o,"\n")

Even_odd <- data.frame(numbers , results)
print(Even_odd, row.names = FALSE) #remoev left side numbering , row.names can also be used to reaname the left side numbering 

#ROW NAMES
row.names(frame) <- c("what", "is", "this")
print(frame)
row.names(frame) <- NULL

#WHILE LOOP
u <- 0
while(u <= 4){
  print(u)
  u <- u+1
}

#REPEAT AND BREAK
j <- 1
repeat {
  if (j == 7) {
    j <- j + 1     # increment first
    next           # skip printing when j == 7
  }
  print(j)
  j <- j + 1
  if (j > 8) {
    break          
  }
}

#SWITCH
grade <- "B"
t <- 1
switch(grade, 
       A = "Exc",
       B = "Good",
       C = "Nahh",
       "fail")    
switch(t, "Kill", "Me")

#=============================
# APPLY FUNCTIONS
#=============================

#apply -> works on dataframes and matrices, apply(dataframe, margin , function), margin 1 for rows and 2 for coloumns  

mat <- matrix(1:9 , nrow = 3)
print(mat)

apply(mat , 2 , mean) #prints mean of each coloumn 
apply(mat ,  1  ,  sum)

#lapply for list and vectors , list apply 

e <- list(a = 4:8 , b = 3:9 )
lapply(e, sum) #always returns a list 

#sapply , returns a vector or matrix instead of a list when possible 
y <- sapply(e, median) #vaaply we can specify, simpplify to true defaults to matrix or a vector otherwise there is to array 
y
typeof(y)
#tapply , table apply , applies function to a subset of vectors grouped by a factor 

#takes two vectors as input and gives us the relation between them 
score <- c(45,43,67,89,36,33)
sex <- c("M", "F", "M", "M", "F","F")
race <- c("W","W","W","B","W","B")
tapply(score , sex , sum)["F"] #returns sum of female marks 
tapply(score , sex , max )#returns maximum marks in each group 
tapply(score , sex , mean )
tapply(score , list(sex ,race), mean) #multiple factors 


#AGGREGATE aggregate(col ~ group , data , function)

workers <- data.frame(
  gender = c("M","F","M","F","M","F"),
  Performance = c(45,23,56,78,54,33))
Perf_Level <- cut(workers$Performance, #cut categorizes numerical data into ranges with breaks and assigns labels 
                            breaks = c(0, 40, 60, 80),
                            labels = c("Low", "Medium", "High"))


aggregate(gender == "F" ~ Perf_Level, data = workers, sum) #performance level for number of females , how many low performing etc
#gender == "F" creates a logical vector:TRUE for female, FALSE for male
#.When you use sum() on a logical vector: TRUE counts as 1 FALSE counts as 0
aggregate(Performance~gender , data = workers , sum )#apply function to performance grouped by gender 
aggregate(Performance ~gender == "F", data = workers , median) #false showed the performance of males and true for females 

#Cbind stands for coloumn bind used to join df , vectors , matrices side by side (by colomns)

Tags <- c("KillerBean", "UtopianDog", "Dystopiangroyper")
KD <- c(4,1,13)
gender <- c("Cuck","Gay","Male")

cbind(Tags  , KD , gender ) #cbind forces R to store all coloumns as character on plain vectors 

gamer <- cbind(Tags  , KD , gender)
scores = c(45,23,98)
levels <- as.character( cut(scores , breaks= c(0,45,90,100), labels = c("Low", "Good", "Excellent"))) #because R automatically converts
#your numeric data into a factor — a special type of categorical variable that stores sd 1,2,3
print(gamer)
gamer <- cbind(gamer , scores)
gamer <- cbind(gamer , levels) #cbind doesnt have name explicitly to new coloumns but not for df$new 

#MAPPING , applying a function to each element of a structure 

rank <- c("B", "S", "G", "D", "G", "B")
rank_map <- c(B = "Bronze",S =  "Silver",G=  "Gold",D =  "Diamond")
mapped_rank <- rank_map[rank]
print(mapped_rank)

a <- 1:3 
b<- 4:6

Map(function(x,y) x+y , a,b)

#GIVING INPUT in R 
#return a string 
setence <- readline(prompt = "Enter something: ")
noquote(paste("Hello , ", setence))

#assign it as an integer 

number <- as.integer(readline(prompt = "Enter your integer: "))
cat("Half of your integer is", number/2 , "\n")


