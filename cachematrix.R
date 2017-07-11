
## makeCacheMatrix function creates a special "matrix" object that can cache its inverse

## makeCacheMatrix creates really a list containing a function to

# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matri

makeCacheMatrix <- function(x = matrix()) {
        inve <- NULL
        set <- function(y){
                x <<- y
                inve <<- NULL
        }
        get <- function() x
        setInversion <- function(Inversion) inve <<- Inversion
        getInversion <- function() inve
        list(set = set, get = get, setInversion = setInversion, getInversion = getInversion)

}


## This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve retrieve the inverse from the cache if not cachesolve will inverse matrix .

cacheSolve <- function(x, ...) {
        inve <- x$getInversion()
        if(!is.null(inve)) {
                message("getting cached data")
                return(inve)
        }
        data <- x$get()
        inve <- solve(data)
        x$setInversion(inve)
        inve
}
