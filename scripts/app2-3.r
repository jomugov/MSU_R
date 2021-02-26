{ rm(list=ls()); options(show.error.messages = TRUE);
  var1 = 45:167;
  var2 = 25:-7;
  var3 = seq( from=17, to=5, by=-3);
  
  for(i in var3)
  {
    cat("number in sequence", i, "value to the 3rd", i^3,
        "cubed root of value", i^(1/3) , "\n")
  }
  
}
{
  weatherData=read.csv("data/LansingWeather2.csv",stringsAsFactors = FALSE);
  weatherday=c(13, 3, 5, 8, 7)
  for ( daynumber in weatherday)
  {
    cat("on day", daynumber, "high temp was", weatherData
        [daynumber, "highTemp"], "\n");
    cat("on day", daynumber, "total inches of precip was", weatherData
        [daynumber, "precipitation"], "\n");
  }
}
{
  rm(list=ls()); options(show.error.messages = TRUE)
  weatherData=read.csv("data/LansingWeather2.csv", stringsAsFactors = FALSE);
  weatherData[ ,4];
  raindays = weatherData[ ,1];
  
  for(i in 1:14)
  { 
     if(weatherData[ i,4] >1)
     {
       cat("heavy rain day", raindays[i], "\n");
     }
}
}

