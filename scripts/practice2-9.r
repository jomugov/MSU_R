{
rm(list=ls()); options(show.error.locations = TRUE);

weatherData = read.csv("data/LansingWeather3.csv");
humidityData = weatherData[ ,"humidity"];
precipData=weatherData[ ,"precipitation"];
dateData=weatherData[,"date"];
lowTempData=weatherData[ ,"lowTemp"];
highTempData=weatherData[ ,"highTemp"];

hist(humidityData)#hist(dataframe created above just for humidity data)
#description of hist() and all its components
#https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/hist.html

hist(humidityData, labels=TRUE, breaks=4, right=FALSE,
xlab="humidity(%)", col=c("red","blue"), main="Humidity", ylim=c(0,10));
meanHumidity=mean(humidityData); 
abline(v=meanHumidity,col="darkgreen", lty=4);
##abline creates a vertacle line w/ parameter set to (v= vertical bar (data)
barplot(precipData,main="Precipitation over 14 days",xlab="Dates",
        names.arg = dateData,
        ylab="Precipitation (inches)", ylim=c(0,1.4),
        angle=60,density=30,col=c("purple","black","orange","red"));
##barplot paramaters angle=angle of hatch lines,density=30 hashes per inch,
##col=colors for bars in order of col=c(1,2,3,4)
## x lab-assign x axis title then use names.arg=dataFrame to assign x axis values
        meanprecip=mean(precipData);
        abline(h=meanprecip, col="darkgreen", lty=4);
#abline(h= horizontal line)
##BOXPLOT
boxplot(highTempData,lowTempData,    #leave () open when adjusting graph 
        ylim=c(20,90),
        names=c("HighTemp","LowTemp"));
        points(1,30, col="blue", pch=12); # add a point to a box plot
## points(address plot number or y axis position 1 or 2, x axis position)
##pch is pointcharacter size = 
}