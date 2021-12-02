{
  rm(list=ls()); options(show.error.locations = TRUE);  
  lansing2016Weather = read.csv(file="data/LansingNOAA2016Formatted.csv",
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
  windDirection =  lansing2016Weather[,"windDirection"];
  sunrise = lansing2016Weather[,"sunrise"];
  sunset = lansing2016Weather[,"sunset"];
  
  febMarDates=grep("02-|03-",date);
  peakWind=which(maxWind>40);
  windyDates=date[peakWind];
  windyprecip=precipitation[peakWind];
  peakWindSpeed=maxWind[peakWind];
  
  northernlyWinds=which(windDirection < 90|windDirection >270);
  heavyPrecip=which(precipitation > 0.5);
  northRain=intersect(northernlyWinds,heavyPrecip);
  windDates=date[northernlyWinds];
  print(windDates);
  windRainDates=date[northRain];
  print(windRainDates);
  
  sunriseHRS=timeConvert(lansing2016Weather$sunrise);
  sunsetHRS=timeConvert(lansing2016Weather$sunset);
  hoursOfSun=c();
  lengthvector=length(sunriseHRS);
  for(i in 1:lengthvector)
  {
    hoursOfSun[i] = sunsetHRS[i]-sunriseHRS[i]
  }
  
  janFebDays=grep("01-|02-",date);
  janFebAvgTemp=avgTemp[janFebDays];
  janFebSun=hoursOfSun[janFebDays];
  plot(formula=janFebAvgTemp~janFebSun);
  janFebModel=lm(formula=janFebAvgTemp~janFebSun);
  abline(janFebModel, col="blue");
  print(summary(janFebModel));
  
  marAprDays=grep("03-|04-",date);
  marAprAvgTemp=avgTemp[marAprDays];
  marAprSun=hoursOfSun[marAprDays];
  plot(formula=marAprAvgTemp~marAprSun);
  marAprModel=lm(formula=marAprAvgTemp~marAprSun);
  abline(marAprModel, col="blue");
  print(summary(marAprModel));
  
  mayJunDays=grep("05-|06-",date);
  mayJunAvgTemp=avgTemp[mayJunDays];
  mayJunSun=hoursOfSun[mayJunDays];
  plot(formula=mayJunAvgTemp~mayJunSun);
  mayJunModel=lm(formula=mayJunAvgTemp~mayJunSun);
  abline(mayJunModel, col="blue");
  print(summary(mayJunModel));
  
  julAugDays=grep("07-|08-",date);
  julAugAvgTemp=avgTemp[julAugDays];
  julAugSun=hoursOfSun[julAugDays];
  plot(formula=julAugAvgTemp~julAugSun);
  julAugModel=lm(formula=julAugAvgTemp~julAugSun);
  abline(julAugModel, col="blue");
  print(summary(julAugModel));
  
  septOctDays=grep("09-|10-",date);
  septOctAvgTemp=avgTemp[septOctDays];
  septOctSun=hoursOfSun[septOctDays];
  plot(formula=septOctAvgTemp~septOctSun);
  septOctModel=lm(formula=septOctAvgTemp~septOctSun);
  abline(septOctModel, col="blue");
  print(summary(septOctModel));
  
  novDecDays=grep("11-|12-",date);
  novDecAvgTemp=avgTemp[novDecDays];
  novDecSun=hoursOfSun[novDecDays];
  plot(formula=novDecAvgTemp~novDecSun);
  novDecModel=lm(formula=novDecAvgTemp~novDecSun);
  abline(novDecModel, col="blue");
  print(summary(novDecModel));
  
}