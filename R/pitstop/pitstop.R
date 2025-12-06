pitstop <- read.csv(readline("Enter the CSV file to analyze: "))

total_pitstops <- length(pitstop$time)

print(paste("THe total number of pitstops for the given data file is",total_pitstops))

full <- pitstop[which(pitstop$time == min(pitstop$time)), ]

print(paste("THe minimum pitstop time in the given data is",min(pitstop$time),"seconds and was acheived by",full$team, "team at lap number", full$lap))
      
max <- pitstop[which(pitstop$time == max(pitstop$time)),] 

print(paste("The maximum pitstop time in the given data is",max(pitstop$time),"seconds and was acheived by",max$team, "team at lap number", max$lap))

print(paste("The total time taken by all teams across all pitstops in total is", sum(pitstop$time),"seconds"))
