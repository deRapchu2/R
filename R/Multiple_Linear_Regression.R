df = data.frame(
  Students = c('Suhaib','Faizan','Faisal','Prince','Moieen','Nigga'),
  Study_Time = c(5,2,3,1,7,4),
  Attendance_Percentage = c(88,63,64,43,78,67),
  IQ = c(64,89,79,63,102,87),
  Total_Score_out_of_100 = c(74,87,83,34,98,91))
#applying single linear regression onto the data frame we get 
summary(df)
model <- lm(Total_Score_out_of_100 ~ Study_Time, data <- df)
class(model) 
summary(model)