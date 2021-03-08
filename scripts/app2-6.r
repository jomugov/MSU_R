{
  rm(list=ls());options(show.error.messages = TRUE);
  weatherData=read.csv("data/LansingWeather2.csv");
  changeInTemp=c();
  highTemp=weatherData$highTemp;
  lowTemp=weatherData$lowTemp;
  vectorLength=length(lowTemp);
  aveHumidity = c(88,87,80,74,67,84,89,59,55,72,82,83,87,58);
  weatherData[,"humidity"]=aveHumidity;
  for(i in 1:vectorLength)
  {
    changeInTemp[i]=highTemp[i]-lowTemp[i];
  }
  weatherData[,"changeInTemp"]=changeInTemp;
  weatherData=weatherData[,c(1,3,6,2,5,4)];
  weatherDataA=weatherData[,c(1,3,6,2,5)];##created to avoid overwrite
  weatherDataHighTemp=weatherData;
  weatherDataHighTemp[,"highTemp"]=highTemp;## necessary?
  weatherDataHighTemp=weatherDataHighTemp[,c(1,4)];
  ## i cant isolate "highTemp" 
  ##into a seperate dataframe "weatherDataHighTemp" so i added date column ,Why?
  write.csv(x=weatherDataHighTemp, file="data/lansingWeatherHightTemp.csv");
}