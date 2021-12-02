{
  rm(list=ls()); options(show.error.messages = TRUE);
  weatherData=read.csv("data/LansingWeather3.csv");
  lowTempData=weatherData[ ,"lowTemp"];
  highTempData=weatherData[ , "highTemp"];
  dateData=weatherData[ ,"dayOfYear"]
  precipData=weatherData[ ,"precipitation"];
  humidData=weatherData[ ,"humidity"];
  changeInTemp=c()
  lengthVector=length(lowTempData)
  
  for(i in 1:lengthVector)
  {
    changeInTemp[i]=highTempData[i]-lowTempData[i]
  }
  
  plot(x=precipData, y=humidData, type = "p",ylim=c(30,80),
       main="Humidity Vs.Precipitation",xlab= "precipitation (in) ",
       ylab= "humidity (%)",col="red");
  plot(x=dateData, y =highTempData, type="o" ,col="red",ylim=c(0,80))
  points(x=dateData, y=lowTempData, type="o",col="blue")
  points(x=dateData, y= changeInTemp, type="o", col="purple")
  legend(x="topleft",legend=c("High Temp","Low Temp","Change in Temp"),
         lty = c(1,1,1),pch=c(1,1,1),col=c("red","blue","Purple"));  
}