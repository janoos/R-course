corr<-function(directory,threshold=0)
{
	corr_vector<-NULL
	lfiles<-list.files(directory)
	for (i in lfiles)
	{
		j<-paste(directory,"/",i,sep="")
 		testdata<-read.table(j,sep=",",header=TRUE) 
 		## complete rows?		
		completed<-complete.cases(testdata)
		completedtestdata<-testdata[completed,]
		rowcount<-nrow(completedtestdata)
		if (rowcount>threshold)
		{
			correlation<-cor(completedtestdata[,2:3])
			corr_vector<-append(corr_vector,correlation[1,2])
		}
	}
	print(corr_vector)
}