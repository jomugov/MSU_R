{
  rm(list=ls()); options(show.error.locations = TRUE);
  lansing2016Weather=read.csv("data/LansingNOAA2016Formatted.csv", 
                            stringsAsFactors = FALSE);
  source(file="scripts/toolbox.r");
  date = lansing2016Weather[,"date"];
  eventData = lansing2016Weather[,"eventData"];
  avgTemp = lansing2016Weather[,"avgTemp"];
  tempDept = lansing2016Weather[,"tempDept"];
  precipitation = lansing2016Weather[,"precipitation"];
  humidity = lansing2016Weather[,"humidity"];
  barometer = lansing2016Weather[,"barometer"];
  dewPoint = lansing2016Weather[,"dewPoint"];
  avgWind = lansing2016Weather[,"avgWind"];
  maxWind = lansing2016Weather[,"maxWind"];
  windDirection = lansing2016Weather[,"windDirection"];
  sunrise = lansing2016Weather[,"sunrise"];
  sunset = lansing2016Weather[,"sunset"];
  
  sunriseHRS=timeConvert(lansing2016Weather$sunrise);
  sunsetHRS=timeConvert(lansing2016Weather$sunset);
  hoursOfSun=c();
  lengthvector=length(sunriseHRS);
  for(i in 1:lengthvector)
  {
    hoursOfSun[i] = sunsetHRS[i]-sunriseHRS[i]
  }
  
  hoursOfSun10=which(hoursOfSun < 10);
  avgTempSun10=avgTemp[hoursOfSun10];
  hoursOfSun14=which(hoursOfSun >14);
  avgTempSun14=avgTemp[hoursOfSun14];
  
  highHumidity=which(humidity>90);
  highHumidityDate=date[highHumidity];
  highHumidityPrecip=precipitation[highHumidity];
  highHumidityWind=maxWind[highHumidity];
  
  onlyHazyDays=which(eventData == "HZ");
  hazyDays=grep("HZ",eventData);
  
}