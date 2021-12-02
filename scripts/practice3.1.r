{
  rm(list=ls()); options(show.error.messages = TRUE);
  source(file="scripts/toolbox.r"); ## include a script file within a script file
  library(package = "rnoaa");
  library(package = "reshape2");
  lansingWeather =  ncdc(datasetid='GHCND', 
                         datatypeid=c("TMAX", "TAVG", "TMIN", "PRCP", 
                                      "SNOW", "AWND", "WDF2", "WSF2",  
                                      "WT01", "WT02", "WT03"),
                         stationid = 'GHCND:USW00014836', 
                         startdate = '2016-01-01', enddate ='2016-01-31',
                         token = myToken,
                         limit = 500); #assign the data set to an object "lansingWeather
  lansingWeatherDF=lansingWeather[["data"]] #subset data from a list using [[]]
  #subset data from a data frame using [] 
  
}