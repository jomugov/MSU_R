{
  rm(list=ls()); options(show.error.messages = TRUE);
  lansing2016Weather=read.csv(file="data/LansingNOAA2016.csv", 
                              stringsAsFactors = FALSE);
  date = lansing2016Weather[,"date"];
  eventData = lansing2016Weather[,"weatherType"];
  avgTemp = lansing2016Weather[,"avgTemp"];
  tempDept = lansing2016Weather[,"tempDept"]; 
  precipitation = lansing2016Weather[,"precip"]; 
  humidity = lansing2016Weather[,"relHum"];
  barometer = lansing2016Weather[,"stnPressure"];
  dewPoint = lansing2016Weather[,"dewPoint"];
  avgWind = lansing2016Weather[,"windSpeed"];
  maxWind = lansing2016Weather[,"windPeakSpeed"]; 
  windDirection = lansing2016Weather[,"windPeakDir"];
  sunrise = lansing2016Weather[,"sunrise"];
  sunset = lansing2016Weather[,"sunset"];
  
  for( i in 1:366)
  {
    if (precipitation[i] == "T")
    {
      precipitation[i]= 0.005;
    }
  }
  precipitation=as.numeric(precipitation);
  
  plot(formula=humidity~avgTemp, xlab="Average Temperature (F)" ,
       ylab="Humidity (%)",main="Humidity Vs.Average Temperature", 
       pch=4, col="blue", cex=0.7);
  pairs(formula=~avgTemp+humidity+precipitation);
  pairs(formula=~precipitation+avgTemp+maxWind+humidity+
          barometer+dewPoint+windDirection);
  plot(formula=avgTemp~dewPoint);
  model=lm(formula=avgTemp~dewPoint);
  print(summary(model));
  abline(model,col="blue"); # if i use x instead of a, regression line is not assigned
  
  plot(formula=avgTemp~barometer);
  model2=lm(formula=avgTemp~barometer);
  abline(model2, col="blue");
  print(summary(model2));
  
  formattedData = data.frame(date, eventData, avgTemp, tempDept, 
                             precipitation, humidity, barometer,
                             dewPoint, avgWind, maxWind, 
                             windDirection, sunrise, sunset); 
  write.csv(x=formattedData,
            file="data/LansingNOAA2016Formatted.csv",
            row.names = TRUE );
  
  
                              
}