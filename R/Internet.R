#often we dont work on our own data but somebody elses

url <- "https://github.com/fivethirtyeight/data/raw/master/non-voters/nonvoters_data.csv"

#data about poll on people in US about their polling habits in questions  
df <- read.csv(url)

ncol(df) #each question asked to a voter
nrow(df) #each represents voter or a non voter 

#we usually would have a code book saying what question was what 

df$voter_category #how each voter represented their voting habits , a vector 

#To see out of all these response what are the unique ones , we have function unique

unique(df$voter_category) #voters could have categorized themselves into one of these three 

df$Q22 #Question was you previously described you are not registered to vote . Which one of the following reasons 
#describes why you are not currently registered to vote? 
#NA would indicate that these people Not Answered or the person is already registered to vote 

unique(df$Q22) #shows the choices that were selected , 7,6,5,4,3,2,1 or NA 

df$Q21 #THere will be election for president , do you plan to vote ? 1 > Yes , 2 > NO , 3> Unsure 
unique(df$Q21) #here -1 is garbage data or wrong because it doesnt correalate to anything 

factor(df$Q21 , 
       labels = c("Yes", "No", "Unsure") ,
       exclude = c(-1)
)

#Transforming data 




