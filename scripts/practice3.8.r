{
  rm(list=ls()); options(show.error.locations = TRUE);  

# Get weather data for 2016 in Lansing, MI
lansing2016Weather = read.csv(file="data/LansingNOAA2016Formatted.csv",
                              stringsAsFactors = FALSE);

# Extract the various parts of the weather data and save each to a vector
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

daysOver80=which(avgTemp > 80);
datesOver80=date[daysOver80];
humidityOver80=humidity[daysOver80];
minHumOver80=min(humidity[daysOver80]);
maxHumOver80=max(humidity[daysOver80]);

tempsIn60=which(avgTemp >60 & avgTemp <70);
meanWinds60s=mean(avgWind[tempsIn60]);

highDepart=which(tempDept >15 | tempDept < -15);
plot(formula = avgTemp[highDepart]~barometer[highDepart]);
model=lm(formula= avgTemp[highDepart]~barometer[highDepart]);
abline(model, col="blue");
print(summary(model));

southWinds = which(windDirection > 90 & windDirection < 270);
plot(formula=avgTemp[southWinds]~barometer[southWinds]);
model2 = lm(formula=avgTemp[southWinds]~barometer[southWinds]);
abline(model2, col="blue");    # add the regression line to the plot
print(summary(model2));        # summary shows a relationship

daysWithPrecip=grep("SN|RN",eventData);
#grep will not find "SN&RN" it is not allowed so we intersect to combine into 1 vector

snowDays=grep("SN", eventData);
rainDays=grep("RA", eventData);
#define new index vectors using grep

daysSNRA=intersect(snowDays, rainDays);
#combine index vectors using intersect



}