pollutantmean <- function(directory, pollutant, id=1:332){
     if(grep("specdata", directory) == T){
          directory <- ("./specdata/")
     }
     tm <- c()
     all_files <- as.character(list.files(directory))
     file_paths <- paste(directory, all_files, sep="")
     for (i in id){
          current_file <- read.csv(file_paths[i], header=T, sep=",")
          head(current_file)
          pollutant
          na_removed <- current_file[!is.na (current_file[, pollutant]), pollutant]
          tm <- c(tm, na_removed)
     }
     result <- mean(tm)
     return(round(result,3))
}

