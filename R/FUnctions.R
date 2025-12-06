myfunction <- function(arg1 , arg2){
  return( arg1 + arg2)
}

myfunction(3,1)

crazy <- function(x, y = 10, ...) {
  
  if (x > 10) {
    stop("Cant do this")
    
  } else if (x > 4) {
    warning("Too much")
    return(x^y)
    
  } else {
    return(x^y)
  }
}


safe_mean <- function(x , trim = TRUE){
  
  if (!is.numeric(x)) stop("x must be numeric")
  mean(x , na.rm = trim)
} 

sum_list <- function(list1 , list2 , ...)
  {
  if (!is.list(list1) || !is.list(list2))
    {
    stop("Please enter a list into the function")
  }else if(length(list1) != length(list2))
    {
      stop("The length of the lists must be the same") 
  }else{                                                 #this could better be done by sapply
      a <<- unlist(list1) 
      b <<- unlist(list2)
      return(mapply(function(x,y) x+y ,a,b))
    }
}

stats_summary <- function(x) {
  list(mean = mean(x), sd = sd(x), n = length(x))
}
