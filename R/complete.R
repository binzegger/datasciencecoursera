complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

files_list <- list.files(directory, full.names=TRUE)		#creates a list of files

count <- vector("numeric")						#initialize empty vector

for(i in id){
            count <- c(count, nrow(na.omit(read.csv(files_list[i])))) 
        }

result <- data.frame(id = id, nobs = count)			#combine the 2 vectors
##cbind(id = i, nobs = count)						#other way to do the same
print(result)
}
