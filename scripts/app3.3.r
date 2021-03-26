{
  rm(list=ls()); options(show.error.locations = TRUE);
  source(file="scripts/toolbox.r");
  library(rnoaa);
  
  lansWindJan16 = ncdc(datasetid="GHCND",
                       datatypeid=c("AWND"),
                       stationid="GHCND:USW00014836",
                       startdate = "2016-01-01", enddate ="2016-01-31",
                       token=myToken,
                       limit=50  );
  
  lansWindFeb16 = ncdc(datasetid="GHCND",
                       datatypeid=c("AWND"),
                       stationid="GHCND:USW00014836",
                       startdate = "2016-02-01", enddate ="2016-02-29",
                       token=myToken,
                       limit=50  );
  
  lansWindMar16 = ncdc(datasetid="GHCND",
                       datatypeid=c("AWND"),
                       stationid="GHCND:USW00014836",
                       startdate = "2016-03-01", enddate ="2016-03-31",
                       token=myToken,
                       limit=50  );
  
  lansWindApr16 = ncdc(datasetid="GHCND",
                       datatypeid=c("AWND"),
                       stationid="GHCND:USW00014836",
                       startdate = "2016-04-01", enddate ="2016-04-30",
                       token=myToken,
                       limit=50  ); 
  
  lansWindApr16=lansWindApr16[["data"]];
  lansWindFeb16=lansWindFeb16[["data"]];
  lansWindMar16=lansWindMar16[["data"]];
  lansWindJan16=lansWindJan16[["data"]];
  
  lansWindJan16=lansWindJan16$value;
  lansWindFeb16=lansWindFeb16$value;
  lansWindMar16=lansWindMar16$value;
  lansWindApr16=lansWindApr16$value;
  lansWindFeb16=c(lansWindFeb16,NA,NA);
  lansWindApr16=c(lansWindApr16,NA);
  
  na.strings=c("", " ", "NULL", NULL, "NA", "na", NA, "null");
  na.rm=FALSE;
  
  Date=c(1:31);
  lansWindAll=c(Date,lansWindJan16,lansWindFeb16,lansWindMar16,lansWindFeb16);
  lansWindMat=matrix(data=lansWindAll,nrow=31,ncol=5,byrow=FALSE);
  colnames(lansWindMat)=c("Date","January","February","March","April");
  
  meanWindFeb=mean(lansWindMat[,"February"],na.rm=TRUE);
  sdWindFeb=sd(lansWindMat[,"February"],na.rm=TRUE);
  varWindFeb=var(lansWindMat[,"February"],na.rm=TRUE);
  
  meanWindMarch=mean(lansWindMat[,"March"],na.rm=TRUE);
  sdWindMarch=sd(lansWindMat[,"March"],na.rm=TRUE);
  varWindMarch=var(lansWindMat[,"March"],na.rm=TRUE);
  
  monthlyMean=c()
  for(i in 2:5)
  {
    monthlyMean[i]=mean(lansWindMat[ ,i],na.rm=TRUE);
  }
  
  dailyMaxAvgWind=c()
  for(x in 1:31)
  {
    dailyMaxAvgWind[x]=max(lansWindMat[ ,x],na.rm=TRUE);
  }
}
##I'd like to use if and cat to relay the maximum monthly and daily means in the 
#console