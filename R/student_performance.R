data <- read.csv("student_performance.csv")
head(data)
str(data)
summary(data)
model <- lm(Final_Exam_Score ~ ., data = data)
summary(model)
data <- subset(data, select = -ID)
model_full <- lm(Final_Exam_Score ~ ., data = data)
model_selected <- step(model_full, direction = "backward")
summary(model_selected)
summary(model_selected)$r.squared
summary(model_selected)$adj.r.squared

