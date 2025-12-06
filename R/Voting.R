#Counting votes 

mario <- as.integer(readline("Enter number of votes for Mario: "))
Peach <- as.integer(readline("Enter number of votes for Peach: "))
Bowser <- as.integer(readline("Enter number of votes for Bowser: "))

#total <- mario + Peach + Bowser 

print(paste("the total number of votes is",sum(mario , Peach , Bowser)))