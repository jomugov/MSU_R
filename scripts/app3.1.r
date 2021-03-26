{
rm(list=ls()); options(show.error.messages = TRUE);
source(file="scripts/toolbox.r"); ## include a script file within a script file
library(package = "rnoaa");
library(package = "reshape2");
lansingWeather =  ncdc(datasetid='GHCND', 
                       datatypeid=c("TMAX", "TAVG","TMIN", "PRCP", 
                                    "SNOW"),
                       stationid = 'GHCND:USW00014836', 
                       startdate = '2016-12-01', enddate ='2017-02-28',
                       token = myToken,
                       limit = 500);
lansingWinterWeather=lansingWeather[["data"]]
}