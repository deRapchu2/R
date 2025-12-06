library(tidyverse)

student <- read.csv("student_performance.csv")
View(student)

better_students <- student[student$Hours_Studied>4.5,]

row.names(better_students) <- NULL
View(better_students)

hard_working <- student[student$Hours_Studied > 5,]
View(hard_working)

row.names(hard_working) <- NULL

better_students %>%
  filter(Final_Exam_Score>70)%>%
  select(Hours_Studied, CGPA, Internal_Score, Final_Exam_Score, PartTime_Job)%>%
  mutate(Bonus = Internal_Score*0.05)%>%
  arrange(desc(Final_Exam_Score))%>%
  group_by(PartTime_Job)%>%
    summarise(
      avg_score = mean(Final_Exam_Score), 
      max_score = max(Final_Exam_Score), 
      min_score = min(Final_Exam_Score),
      count = n())

student%>%
  group_by(Final_Exam_Score > 90)%>%
  summarise(count = n())

str(student) #object details 

df <- data.frame(
  Name = c("A","B"),
  Math = c(90,85),
  Science = c(80,78)
)

df_long <- df%>%
  pivot_longer(
    cols = c(Math,Science),
    names_to = "Subject",
    values_to = "Marks"
  )

df_wide <- df_long%>%
  pivot_wider(
    names_from = Subject,
    values_from = Marks
  )

#CEntering 
x_centered <- scale(student$Final_Exam_Score, center = TRUE , scale = FALSE)

x_scaled <- scale(student$Final_Exam_Score, center = FALSE , scale = TRUE)

x_scaled #here scaling works better 

x_standard <- scale(student$Final_Exam_Score)

x_standard

x_norm <- (student$Final_Exam_Score - min(student$Final_Exam_Score))/(max(student$Final_Exam_Score) - min(student$Final_Exam_Score))

x_norm 

View(better_students)


social_students <- better_students[order(-better_students$Social_Activity),]

View(social_students)

better_students %>% arrange(desc(Social_Activity))

aggregate(social_students$Social_Activity ~ social_students$PartTime_Job ,data = social_students, sum)




#testing 
t.test(hard_working$Final_Exam_Score , mu = 58)

t.test(hard_working$Final_Exam_Score ~ hard_working$Hours_Studied, data = hard_working)

t.test(hard_working$Final_Exam_Score , hard_working$Hours_Studied ) #not related as p<0.05


tbl <- table(hard_working$Final_Exam_Score , hard_working$Hours_Studied)
tbl

chisq.test(tbl)


model <- lm(hard_working$Final_Exam_Score ~ hard_working$Hours_Studied , data = hard_working)
summary(model)

model <- lm(hard_working$Final_Exam_Score ~ hard_working$Hours_Studied + hard_working$Attendance ,
            data = hard_working)

summary(model)

plot(model)

ggplot(hard_working, aes(hard_working$Final_Exam_Score , hard_working$Hours_Studied))+
  geom_point(color = "red", size = 4)+
  labs(title = "Comparison",
          x = "Score",
          y = "Hours Studied")+
  theme_minimal()

ggplot(social_students, aes(Internet_Usage)) +
  geom_histogram(color = "black", fill = "lightblue", bins = 50) +
  labs(title = "Distribution of Internet Usage",
       x = "Internet Usage",
       y = "Count") +
  theme_classic()
aes(color = Internet_Usage)

ggplot(student , aes(x = ))+
  geom_bar(fill = "skyblue")+
  labs(title = "Hmm",
       x= "Hours",
       y = "Score",
       caption = "My Data")+
  theme_minimal()

geom_smooth (method = "lm", se = FALSE)

ggplot(student , aes(x = PartTime_Job , y = Internal_Score ))+
  geom_boxplot(fill = "skyblue")+
  labs(title = "Hmm",
       x= "Hours",
       y = "Score",
       caption = "My Data")+
  theme_minimal()


summary(student)
boxplot(student$Lab_Marks)


