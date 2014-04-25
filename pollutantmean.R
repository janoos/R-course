pollutantmean <- function(directory, pollutant, id = 1:332) 
{
	## initialize vector for the pollutant results
	meanvector<-vector()
	for (i in id)
	{
 		filename<-as.character(sprintf("%03d", i))
		j<-paste(directory,"/",filename,".csv",sep="")
 		testdata<-read.table(j,sep=",",header=TRUE) 
 		## remove NA		
		bad<-is.na(testdata[[pollutant]])
		## add the pollutant values for this id to the meanvector
		correcttestdata<-testdata[[pollutant]][!bad]
		for (count in seq_along(correcttestdata))
		{
			meanvector<-append(meanvector,correcttestdata[count])
		}

	}
	## calculate the mean for all pollutant values
	endresult<-mean(meanvector)
	print(endresult)
 }
