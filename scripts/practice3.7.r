rm(list=ls()); options(show.error.locations = TRUE);
humidity = c(12,67,34,88,49,40);

humiditySubset = c();


# Go through each value in the humidity vector
for(i in 1:length(humidity))
{
  if(humidity[i] > 50) # if the value is greater than 50
  {
    humiditySubset = c(humiditySubset, i); # add i to the vector
  }
  
  humiditySubset1=which(humidity > 50) #same as using the for loop
  #which() answers the question: Which of the values in this vector meet a 
  #specified condition? And the answer to the which() is presented as a 
  #vector of index values representing the values in the vector where the 
  #condition is TRUE.
  
  lansing2016Weather = read.csv(file="data/LansingNOAA2016Formatted.csv",
                                stringsAsFactors = FALSE);
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
  
  snowDays1=c();
  for(i in 1:366)
  {
    if(eventData[i] == "SN")
    {
      snowDays1=c(snowDays1,i)
    }
  }
  snowDays2=which(eventData == "SN");
  snowDayTemps= avgTemp[snowDays2];#use the indexed vector to index another vector
  snowDayWinds= avgWind[snowDays2];
  snowDay3=grep("SN",eventData);
  #grep also creates a vector of indices like which(), but which() only finds an
  #index that matches the query exactly "SN"
  #grep can find index of substring that match query within a string "SN,FOG,Haze"
  
  snowDaysMinTemp=min(x=avgTemp[snowDay3]);#stats on subsets
  snowdaysMeanWind=mean(x=avgWind[snowDay3]);
  
  daysNoPrecip=which(precipitation == 0.00);
  daysHighPrecip=which(precipitation > 1.00);
  
  #plotting subsets
  plot(x=avgTemp[daysNoPrecip], y=humidity[daysNoPrecip]);
  plot(x=avgTemp[daysHighPrecip], y=humidity[daysHighPrecip]);
  windyDayIndex=which(maxWind>45);
  windyDays=date[windyDayIndex];
  print(windyDays);
}