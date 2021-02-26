{ rm(list=ls());
  options(show.error.messages = TRUE);
  weatherData=read.csv("data/LansingWeather2.csv");
  
 precipitation=weatherData[ ,4];

 cat("3rd day of precip" , precipitation[3])
 cat("\n10th day of precip", precipitation[10])
 
 precipdata = precipitation
 
 cat('\n5th day of precip', precipdata[5])
 cat("\n 13th day of precip", precipdata[13])
 
 highTemp=weatherData[ ,2];
 lowTemp=weatherData[ ,3];
 
 fourthdaytempdiff= highTemp[4] - lowTemp[4]
 sixththdaytempdiff=highTemp[6] -lowTemp[6]
}
