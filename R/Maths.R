v <- c(1:24)
l <- c(34:11)

k <-c(56,45)


sum(l,v) #returns sum of the vector 
prod(k)

max(l,v)

mean(l)

median(v)

sd(l)

var(l)

range(l)

cummin(v)

log(l , base = 3)

sqrt(v)

which.max(v)

model <- names(which.max(table(ChickWeight$weight)))

table(chickwts) #frequency of each element 

gender <- c("M", "F","M")
passed <- c("Yes","No","Yes")

table(gender,passed)

mode_val <- names(which.max(table(df$age)))
df$age[is.na(df$age)] <- mode_val
#to replace with most frequent value 