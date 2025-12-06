#Counts <- read.table("Votes.csv", sep = ",", header = TRUE)

#instead of all this we can do 
Counts <- read.csv("Votes.csv")
View(Counts)

Counts[1,1] #gives mario 

Counts[,2] #gives second colomn 

Counts[2,] #gives second row

#syntax for accessing the coloumn by its name is 

Counts$Booth

#when accessing columns what R returns is a vector , as a new structure 

Counts$Candidate #returns vector of candidates therefore we can use [] just as we do in lists or arrays 

Counts$Candidate[1] 

sum(Counts$Booth[1], Counts$Booth[2] , Counts$Booth[3]) #this can be better designed as 

sum(Counts$Booth) #sum of the vector 

#now to get total sum of votes a single candidate got , that is sum across rows we can do 

sum(Counts[1,2] , Counts[1,3])
#this is the same as 
sum(Counts$Booth[1], Counts$Mail[1])

#vector arthematic can be used here as 
vex1 <- Counts$Booth + Counts$Mail #the value is calculated element wise

print(paste("The number of votes for Mario is",  vex1[1]))

#adding new column in the data frame 
Counts$Total <- Counts$Booth + Counts$Mail 

#Now to write to the csv 

write.csv(Counts , "New_Votes.csv") #but the numbering of the rows is shown , or row names of the data frame 

write.csv(Counts , "New_Votes.csv", row.names = FALSE)

colnames(Counts)
rownames(Counts)

row.names(Counts) <- c("First", "Second", "Third")

Counts["First",]

row.names(Counts) <- NULL

Counts[4,]<- c("Hermant", 33,11 , 44)


Counts$Fourth <- NULL  #removing a coloumn

Counts <- Counts[Counts$Booth != 33,] #Whatever is True is 

Counts <- Counts[ , colnames(Counts)!= "xyz"] #this can also be done as 

Counts <- Counts[, !colnames(Counts) %in% c("x","y") ]
#colnames(COunts) %in% c(),return TRUE if the name given exists in col names and ! turns that FALSE ,
#therefore only the TRUE columns are added to df otherwise the columns named are removed 

Counts <- read.csv("New_Votes.csv")
View(Counts)

row.names(Counts) <- c("First", "Second" , "Third")

Counts[4,] <- list("Higer", 56, 34, NA_integer_)

Counts$Total <- Counts$Booth + Counts$Mail

typeof(Counts$Total)

Counts$Mail <- as.integer(Counts$Mail)

typeof(Counts$Booth)

Counts$Total <- Counts$Booth + Counts$Mail

View(Counts)

Counts <- Counts[-4,]

#we can also do 

Counts[nrow(Counts)+1 , ] <- list(Candidate = "Fitz", Booth = 45 , Mail = 67 , Total = NA_real_)

#nrow used to get number of rows and the next row that will be created will be nrow+1 

#rbind can also be used 

#using subset 

Numbers <- data.frame(
  "a" = 1:5,
  "b" = 6:10,
  "c"= 11:15
)

Numbers <- subset(Numbers , select = c(1,2))

#Reorder coloumns 

Counts <- subset(Counts, select = c("Candidate", "Mail", "Booth", "Total")) 


