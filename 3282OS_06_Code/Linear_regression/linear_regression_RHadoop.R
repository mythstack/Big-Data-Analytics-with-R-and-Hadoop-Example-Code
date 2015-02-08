================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 6 Understanding Big Data Analysis with Machine Learning  
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

# Definig the datasets with big data matrix X
X = matrix(rnorm(20000), ncol = 10)
X.index = to.dfs(cbind(1:nrow(X), X))
y = as.matrix(rnorm(2000))


# Function defined to be used as reducers 
Sum = 
  function(., YY) 
    keyval(1, list(Reduce('+', YY)))

XtX = 
  values(
    from.dfs(
      mapreduce(
        input = X.index,
        map = 
          function(., Xi) {
            yi = y[Xi[,1],]
            Xi = Xi[,-1]
            keyval(1, list(t(Xi) %*% Xi))},
        reduce = Sum,
        combine = TRUE)))[[1]]

		
Xty =  values(
    from.dfs(
      mapreduce(
        input = X.index,
        map = function(., Xi) {
          yi = y[Xi[,1],]
          Xi = Xi[,-1]
          keyval(1, list(t(Xi) %*% yi))},
        reduce = Sum,
        combine = TRUE)))[[1]]

solve(XtX, Xty) 