{
  rm(list=ls()); options(show.error.messages = TRUE);
  weatherData=read.csv("data/LansingWeather3.csv");
  highTempData=weatherData[ ,"highTemp"];
  lowTempData=weatherData[ ,"lowTemp"];
  dateData=weatherData[ ,"dayOfYear"];
  plot(formula=highTempData~dateData); ## plot(x=dateData ,y=highTempData) also works
                                        #format graph using plot parameter type =
                                       #"p" points only "l" line only "o" points and lines "n" neither
  plot(x=dateData, y=highTempData, type = "o",
       ylim=c(30,80),                   #sets min and max for y axis as does xlim() for x axis
       main="Lansing high temperatures",
       xlab= "Day of Year",
       ylab= "Temperature (F)",
       col="red");                     #col is used to set color
  
  points(x=dateData, y=lowTempData, type="o",col="blue")
  #points() is used exclusively with plot()
  # points() adds another layer of data to the graph with matching x variables
  
  legend(x="topleft",                      #legend position ("center" "bottomleft", "top" )
         legend=c("High Temp","Low Temp"),#legend labels are put in vector
         lty = c(1,1),                    #line type values can be changed for different display
         pch=c(1,1),                      #point character
         col=c("red","blue")              #color
         );  
  
}