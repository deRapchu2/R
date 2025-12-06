View(chickwts)

chickwts[, 3] <- c(1:71)
names(chickwts)[names(chickwts)== "V3"] <- "Chicks"
chickwts <- subset(chickwts , select = c("Chicks","feed", "weight" ))


#HEre weight is the weight of the chicks at the end of two weeks , to find the average chick weighed 
#Or how much each weighed based on what they ate and therefore what is more nutritous 

#for that we can subset based on feed and find the average 
typeof(chickwts$weight)

#to remove the NA values inside the weight 

mean(chickwts$weight , na.rm = TRUE)

#to find the healthiest meal for the chicks 

#casien chicks 

casein_chicks <- chickwts[c(60:71),]

mean(casein_chicks$weight)

#instead of all this we can do 

chickwts$feed == "casein" #we can do which() to get indexes and therefore we dont already dont need to know the index 
chickwts$feed == "soybean"
#to subset this data frame 

soy_chicks <- chickwts[c(chickwts$feed == "soybean"),]

unique(chickwts$feed)

meat_chicks <- chickwts[c(chickwts$feed == "meatmeal"),]
horse_chicks <- chickwts[c(chickwts$feed == "horsebean"),]
lin_chicks <- chickwts[c(chickwts$feed == "linseed"),]
sun_chicks <- chickwts[c(chickwts$feed == "sunflower"),]


mean(meat_chicks$weight , na.rm = TRUE)
mean(horse_chicks$weight , na.rm = TRUE)
mean(lin_chicks$weight , na.rm = TRUE)
mean(sun_chicks$weight , na.rm = TRUE)
mean(soy_chicks$weight , na.rm = TRUE)

#instead of all this na.rm we can remove them earlier 

#first let us check if NA exists 

is.na(chickwts$weight)

#to return their indiceis we can do which()

which(is.na(chickwts$weight))

without_NA <- chickwts[!is.na(chickwts$weight),] #keep only the rows where there is no NA values 
with_NA <- chickwts[is.na(chickwts$weight),] #shows variables which oly have NA values 

subset_way <- subset(chickwts, !is.na(weight))

row.names(subset_way)  #here after removing the NA the chickcount has to be reset , to do that 

row.names(subset_way) <- NULL #this will reset it to count sequentially again 

#NUMBER OF NA values present we can do

sum(is.na(chickwts$weight)) 
