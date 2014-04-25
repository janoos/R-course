complete<-function(directory,id=1:332)
{
	new<-TRUE
	for (i in id)
	{
 		filename<-as.character(sprintf("%03d", i))
		j<-paste(directory,"/",filename,".csv",sep="")
 		testdata<-read.table(j,sep=",",header=TRUE) 
 		## complete rows?		
		completed<-complete.cases(testdata)
		completedtestdata<-testdata[completed,]
		
		if (new==TRUE)
		{
			## first time: initialize the data.frame
			completed_df<-data.frame(id=i,nobs=nrow(completedtestdata))
			new<-FALSE
		} 
		else 
		{
			## add row to data.frame
			new_row = c("id"=i, "nobs"=nrow(completedtestdata))
			completed_df=rbind(completed_df,new_row)
		}
	}
	print(completed_df)
}