================================================================================
Book - Big Data Analytics with R and Hadoop
Book URL - https://www.packtpub.com/big-data-analytics-with-r-and-hadoop/book
Chapter - 6 Understanding Big Data Analysis with Machine Learning  
Author - Vignesh Prajapati
Contact - a. email -> vignesh2066@gmail.com
          b. LinkedIn -> http://www.linkedin.com/in/vigneshprajapati   	  
================================================================================

# distance calculation function 
dist.fun = function(C, P) {
  apply(C,1, function(x) colSums((t(P) - x)^2))}

# k-Means Mapper
 kmeans.map = function(., P) {
   nearest = {
   if(is.null(C)) 
             sample(
              1:num.clusters, 
              nrow(P), 
              replace = T)
          else {
            D = dist.fun(C, P)
            nearest = max.col(-D)}}
        if(!(combine || in.memory.combine))
          keyval(nearest, P) 
        else 
          keyval(nearest, cbind(1, P))}

# k-Means Reducer
 kmeans.reduce = {
      if (!(combine || in.memory.combine) ) 
        function(., P) 
          t(as.matrix(apply(P, 2, mean)))
      else 
        function(k, P) 
          keyval(
            k, 
            t(as.matrix(apply(P, 2, sum))))}
			
			
kmeans.mr = function( P, num.clusters, num.iter, combine, in.memory.combine) {
 C = NULL
 for(i in 1:num.iter ) {
   C = values(from.dfs(mapreduce(P, 
   map = kmeans.map,
   reduce = kmeans.reduce)))
   if(combine || in.memory.combine)
      C = C[, -1]/C[, 1]
   if(nrow(C) < num.clusters) {
      C = rbind(C, matrix(rnorm((num.clusters - nrow(C)) * nrow(C)), ncol = nrow(C)) %*% C) }}
   C
 }

P = do.call(rbind,rep(list(matrix(rnorm(10, sd = 10),
                                  ncol=2)),
								  20)) + matrix(rnorm(200), 
								  ncol =2)
	
kmeans.mr(to.dfs(P),
		  num.clusters = 12, 
          num.iter = 5,
          combine = FALSE,
          in.memory.combine = FALSE)