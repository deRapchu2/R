#Read and clean data 
 #read from a csv than remove NA 
#View(App_DAta)
#App_DAta[, 3] <- c(1:71)
App_DAta <- subset(App_DAta, !is.na(weight)) #data taken from chickwts 

#names(App_DAta)[names(App_DAta)== "V3"] <- "Chicks"
#App_DAta <- subset(App_DAta , select = c("Chicks","feed", "weight" ))

row.names(App_DAta) <-  NULL 
#Present MEnu for selected options 

feed_Options <- unique(App_DAta$feed)

formatted_options <- paste0(1:length(feed_Options), ". ", feed_Options)

#Prompt user with optiions 

cat(formatted_options, sep = "\n")
feed_Choice <- as.integer(readline("Feed Type: "))
#HEre to handle wrong inputs <=0 or >length(feed_Options)

if(feed_Choice<1 || feed_Choice > length(feed_Options)){
  cat("Invalid Choice") #we still see the error message regardless ,because its trying to print at that choice 
  #this can be prevented by printing the choice inside else 
} else {
  #Print selected options
  
  selected_feed <- feed_Options[feed_Choice]
  print(subset(App_DAta, feed == selected_feed))
}

App_DAta$Country <- "USA"

#Now to figure out which chickens were the highest in weight we can add new colomn saying high , low weight 

App_DAta$weight > 270 #returns a logical vector 

#we can use a conditional 

App_DAta$Weight_Class <-  ifelse(App_DAta$weight >270, "High", "Regular") #True shows high and false shows regular 
