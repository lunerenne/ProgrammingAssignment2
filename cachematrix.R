## Put comments here that give an overall description of what your
## functions do

#makeCacheMatrix creates a special "matrix" object that can cache its inverse.
#cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix has not changed), then the cachesolve retrieves the inverse from the cache.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                        x <<- y
                        inv <<- NULL}
        get <- function() x
        inverse <- function(solve) inv <<- solve
        getinv <- function() inv
        matrix(set = set, get = get, inverse = inverse, getinv = getinv)
}


#cacheSolve will solve the matrix using the cache if it has not already been solved.

cacheSolve <- function(x, ...) {
        inv <- x$inverse
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$inverse(inv)
        inv
}