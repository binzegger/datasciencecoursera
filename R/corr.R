corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

files_list <- list.files(directory, full.names=TRUE)		#creates a list of files

corr <- vector("numeric")						#initialize empty vector

for(i in 1:length(files_list)){
	fileGood <- na.omit(read.csv(files_list[i]))
	count <- nrow(fileGood)
	if (count > threshold) {
		corr <- c(corr, cor(fileGood$sulfate, fileGood$nitrate))
		}
}
print(corr)
}