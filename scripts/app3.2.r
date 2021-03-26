{
  rm(list=ls()); options(show.error.messages = TRUE);
  source(file="scripts/toolbox.r"); 
  library(package = "rnoaa");
  library(package = "reshape2");
  lansingWeather =  ncdc(datasetid='GHCND', 
                       datatypeid=c("TMAX", "TAVG","TMIN", "PRCP", 
                                    "SNOW"),
                       stationid = 'GHCND:USW00014836', 
                       startdate = '2016-12-01', enddate ='2016-12-31',
                       token = myToken,
                       limit = 155);
  
  lansingDecWeather=lansingWeather[["data"]];
  lansingDecWeatherRS=dcast(data=lansingDecWeather,formula=date~datatype,
                          value.var="value");
  lansingDecWeatherRS=lansingDecWeatherRS[,c(1,6,5,4,2,3)];
  colnames(lansingDecWeatherRS)[2]="minTemp";
  colnames(lansingDecWeatherRS)[3]="maxTemp";
  colnames(lansingDecWeatherRS)[4]="avgTemp";
  
  lansingDecWeatherRS[ ,c(2:6)]=lansingDecWeatherRS[ ,c(2:6)]/10;
  lansingDecWeatherRS[ ,c(5,6)]=lansingDecWeatherRS[ ,c(5,6)]/25;
  lansingDecWeatherRS[ ,1]=substr(x=lansingDecWeatherRS[ ,1], start=3 , stop=10);
  
  meanMaxTemp=mean(lansingDecWeatherRS$maxTemp);
  sdMaxTemp=sd(lansingDecWeatherRS$maxTemp);
  varMaxTemp=var(lansingDecWeatherRS$maxTemp);
  
  meanMinTemp=mean(lansingDecWeatherRS$minTemp);
  sdMinTemp=sd(lansingDecWeatherRS$minTemp);
  varMinTemp=var(lansingDecWeatherRS$minTemp);
  
  changeInTemp=c();
  vectorLength=length(lansingDecWeatherRS$minTemp);
  dailyMaxTemp=lansingDecWeatherRS$maxTemp;
  dailyMinTemp=lansingDecWeatherRS$minTemp;
  for (i in 1:vectorLength)
  {
    changeInTemp[i]= dailyMaxTemp[i]-dailyMinTemp[i];
  }
  changeTemp=changeInTemp;
  lansingDecWeatherRS[ ,"changeTemp"] = changeInTemp;
}

