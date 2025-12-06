#R can also work with a particular data structure , that is R data file 
#load("temps.RData") #since i dont have this i will create one 

temps <- c(15,-15,20,-20,33,43,65,38,26,31,35,14,24,14,14,31,35,5,16,19,27,21,7)

write.csv(temps, "temps.csv" , row.names = FALSE )

#converting this 

save(temps, file = "temps.RData")

load("temps.RData") #this alone wiwll load the df 


mean(temps)

#to pull out the outliers we can see all the values by looping them , or we can have a vector of outliers 

temps[c(2,4,7)] #gives us vector of outliers and now we have to remove them 

temps[-c(2,4,7)]

#to find the indecies of the outliers using comparison operators 

temps < 0 
#to get the indicies 

which(temps < 0) #will return indexes of TRUE values , now combining expressions AND & and OR | 

which(temps<0 | temps >60)

#now to remove 

temps[-which(temps<0 | temps >60)] #here which is redundant , this can be replaced by condition only instead 
filter <- !(temps<0 | temps >60)
temps[filter] #gives all elements for which this expression evaluates as TRUE , this condition is working as filter 

any(temps <0 ) #to check if there are any outliers , return TRUE if any of the elements satisfies 

#to check if all are outliers 

all(temps<0 | temps >60) #if any is FALSE than FALSE is returned 

no_outliers <- temps[!(temps<0 | temps >60)]

outliers <- temps[temps<0 | temps >60]

save(no_outliers ,  file = "no_outliers.RData")