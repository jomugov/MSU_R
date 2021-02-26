{rm(list=ls()); options(show.error.messages = TRUE);
  
  weatherData = read.csv("data/LansingWeather2.csv", 
  na.strings=c("", " ", "NULL", NULL, "NA", "na", NA, "null"));
  highTemp=weatherData[ ,2];
  changeinHighTemp = c();
  vectorlength=length(highTemp);
  
  for ( i in 1:vectorlength)
  {
  changeinHighTemp[i] = highTemp[i]-highTemp[i-1]
  }
## NA was automatically assigned to vector?
  weatherData[ ,"deltaHighTemp"]=changeinHighTemp;
}