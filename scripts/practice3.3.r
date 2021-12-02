{rm(list=ls());  options(show.error.locations = TRUE);

# myToken is in the toolbox.r script
source(file="scripts/toolbox.r");

# give this script access to the functions in the rnoaa package
library(rnoaa);

# get the maximum temperatures for every day in  January 2011 from the NOAA database
lansWeather11 = ncdc(datasetid="GHCND",
                     datatypeid=c("TMAX"),
                     stationid="GHCND:USW00014836",
                     startdate = "2011-01-01", enddate ="2011-01-31",
                     token=myToken,
                     limit=50  );
lw11Data=lansWeather11[["data"]]
lw11Temps = lw11Data$value;

### Repeat the above steps for 2012, 2013, 2104, 2015, and 2016
# add a half-second delay because the database will not always accept multiple requests without delays
Sys.sleep(time=0.5);
lansWeather12 = ncdc(datasetid="GHCND",
                     datatypeid=c("TMAX"),
                     stationid="GHCND:USW00014836",
                     startdate = "2012-01-01", enddate ="2012-01-31",
                     token=myToken,
                     limit=50  );
Sys.sleep(time=0.5);
lansWeather13 = ncdc(datasetid="GHCND",
                     datatypeid=c("TMAX"),
                     stationid="GHCND:USW00014836",
                     startdate = "2013-01-01", enddate ="2013-01-31",
                     token=myToken,
                     limit=50  );
Sys.sleep(time=0.5);
lansWeather14 = ncdc(datasetid="GHCND",
                     datatypeid=c("TMAX"),
                     stationid="GHCND:USW00014836",
                     startdate = "2014-01-01", enddate ="2014-01-31",
                     token=myToken,
                     limit=50  );
Sys.sleep(time=0.5);
lansWeather15 = ncdc(datasetid="GHCND",
                     datatypeid=c("TMAX"),
                     stationid="GHCND:USW00014836",
                     startdate = "2015-01-01", enddate ="2015-01-31",
                     token=myToken,
                     limit=50  );
Sys.sleep(time=0.5);
lansWeather16 = ncdc(datasetid="GHCND",
                     datatypeid=c("TMAX"),
                     stationid="GHCND:USW00014836",
                     startdate = "2016-01-01", enddate ="2016-01-31",
                     token=myToken,
                     limit=50  );

# for 2012-2016: subset the data frames from the lists (just like we did with 2011)
lw12Data = lansWeather12[["data"]];
lw13Data = lansWeather13[["data"]];
lw14Data = lansWeather14[["data"]];
lw15Data = lansWeather15[["data"]];
lw16Data = lansWeather16[["data"]];

# for 2012-2016: save the columns named "value" to a vector (just like 2011)
lw12Temps = lw12Data$value;
lw13Temps = lw13Data$value;
lw14Temps = lw14Data$value;
lw15Temps = lw15Data$value;
lw16Temps = lw16Data$value;

lansTempsAll = c(lw11Temps, lw12Temps, lw13Temps,
                 lw14Temps, lw15Temps, lw16Temps);

lansWeatherMat = matrix(data=lansTempsAll, nrow=31, ncol=6, byrow = FALSE);

lansWeatherMat = lansWeatherMat * 0.1;


lansWeatherMat = (9/5) * lansWeatherMat + 32;


lansWeatherMat = signif(x=lansWeatherMat, digits=2);


write.csv(x=lansWeatherMat, file="data/lansingJanTemps.csv", row.names=FALSE)
}