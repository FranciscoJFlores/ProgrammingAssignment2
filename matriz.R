##establish a matrix in the format needed
makeCacheMatrix <- function(x1 = matriz()) {  
    inverso <- NULL
     set <- function(x2) {
       x1 <<- x2
       inverso <<- NULL
     }
      get <- function() x1
      setinv <- function(inverse) inverso <<- inverse 
      getinv <- function() inverso
      list(set=set, get=get,
           setinv=setinv,
           getinv=getinv)
}
##checks if there is a previous calculation and get it, if not it do it and store it.
cacheSolve <- function(x, ...) {
    inverso <- x$getinv()
    if (!is.null(inverso)){
     message("getting cached data")
     return(inverso)
    }
    mat.data <- x$get()
    inverso <- solve(mat.data, ...)
    x$setinv(inverso)
  inverso
}
