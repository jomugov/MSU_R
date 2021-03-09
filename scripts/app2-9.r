{
  rm(list=ls()); options(show.error.locations = TRUE);
  weatherData = read.csv("data/LansingWeather3.csv");
  humidityData = weatherData[ ,"humidity"];
  precipData=weatherData[ ,"precipitation"];
  dateData=weatherData[,"date"];
  lowTempData=weatherData[ ,"lowTemp"];
  highTempData=weatherData[ ,"highTemp"];
  changeInTempData=c();
  vectorlength=length(lowTempData);
  for(i in 1:vectorlength)
  {
    changeInTempData[i]=highTempData[i]-lowTempData[i];
  }
  tempDifference=changeInTempData;
  weatherData[ ,"tempDifference"]=tempDifference;
  hist(tempDifference, xlab="Daily Change in Temperature (F)", 
    ylab= "Number of Days", 
    main="Difference of Daily High and Low Temp",breaks=2,ylim=c(0,8));
  meanTempChange=mean(tempDifference);
  abline(v=meanTempChange, col="red",lty=4);
  combineTemps=c(highTempData,lowTempData)
  barplot(combineTemps,main="High and Low Temperatures",ylab="Temperature (F)",
    xlab="Temp Readings",col=c("red","blue","orange")) ##why three bins?
  avgTemp=mean(combineTemps);
  abline(h=avgTemp, col="black", lty=20);
  #after combining temps to create new vector i wasn't able to manipulate x axis
  #to include dates. I'm missing something here.
  humidityDec=c();
  vectorlength2=length(humidityData);
  for(i in 1:vectorlength2)
  {
    humidityDec[i]=humidityData[i]/100;
  }
  averagehumidity=mean(humidityDec);
  averageprecip=mean(precipData);
  boxplot(humidityDec,precipData, ylim=c(0,1.5), names = c("Percent Humidity",
    "Precipitation (in)"),main= "Humidity and Precipitation");
  points(1,0.76, col="red", pch=15);
  points(2,0.26, col="blue", pch=15);
}
## Id like to add y axis scales on both sides with individual labels for inches
## and humidity