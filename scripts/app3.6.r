{
  rm(list=ls()); options(show.error.messages = TRUE);
  lansingNOAA2016Formatted=read.csv(file = "data/LansingNOAA2016Formatted.csv");
  source(file = "scripts/toolbox.r");
  sunriseHRS=timeConvert(lansingNOAA2016Formatted$sunrise);
  sunsetHRS=timeConvert(lansingNOAA2016Formatted$sunset);
  hoursOfSun=c();
  lengthvector=length(sunriseHRS);
  for(i in 1:lengthvector)
  {
    hoursOfSun[i] = sunsetHRS[i]-sunriseHRS[i]
  }
  
  plot(formula=lansingNOAA2016Formatted$avgTemp~hoursOfSun,
       xlab= "Hours of Sunlight",
       ylab= "Temperature (Farhnheit)",
       main="Temp Vs. Hours of Sunlight");
  model1 = lm(lansingNOAA2016Formatted$avgTemp~hoursOfSun);
  abline(model1, col="blue");
  print(summary(model1));
  
  cat(" The residuals indicate that this data is not skewed and there are not
        outliers within the data set to offset the regression line.  
        Adjusted R-squared value indicates that 56% percent of the variation in 
        Temperature is correlated to an increase in hours of sun light.
        P-value is lower than 0.05 which indicates that the correlation between
        hours of sunlight and average temperature is significant")
 
  plot(formula=lansingNOAA2016Formatted$humidity~hoursOfSun,
       xlab= "Hours of Sunlight",
       ylab= "Humidity",
       main="Humidity Vs. Hours of Sunlight");
  model2 = lm(lansingNOAA2016Formatted$humidity~hoursOfSun);
  abline(model2, col="blue");
  print(summary(model2));
  
  cat(" The residuals indicate that this data is not skewed and there are not
        outliers within the data set to offset the regression line. This is based
        on the magnitude of min/max and 1Q/3Q being similar and the median is 
        close to zero.Adjusted R-squared value indicates that 15 percent of the
        variation in humidity is correlated to an increase in hours of sun light,
        Which is not a very strong correlation.P-value is lower than 0.05 which 
        indicates that the correlation betweenhours of sunlight and humidity is 
        significant");
  
  plot(formula=lansingNOAA2016Formatted$barometer~hoursOfSun,
       xlab= "Hours of Sunlight",
       ylab= "Barometric Pressure",
       main="Barometric Pressure Vs. Hours of Sunlight");
  model3 = lm(lansingNOAA2016Formatted$barometer~hoursOfSun);
  abline(model3, col="blue");
  print(summary(model3));
  
  cat(" The residuals indicate that this data is not skewed and there are not
        outliers within the data set to offset the regression line.This is based
        on the magnitude of min/max and 1Q/3Q being similar and the median is 
        close to zero. Adjusted R-squared value indicates that 1 percent of the 
        variation in barometric pressure is correlated to an increase in hours of 
        sun light, Which is not a very strong correlation.
        P-value is greater than 0.05 which indicates that the correlation between
        hours of sunlight and barometric pressure is not significant");
}