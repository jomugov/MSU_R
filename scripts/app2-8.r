{
  rm(list=ls()); options(show.error.messages = TRUE);
  convertWeight=function(weightVal,kgtog,lbstog,gtokg,kgtolbs,lbstokg,gtolbs)
  {
    if(kgtog==TRUE)
    {
      convertedWeight=(weightVal*1000)
    }
    else if (gtokg==TRUE)
    {
      convertedWeight=(weightVal/1000)
    }
    else if (lbstog==TRUE)
    {
      convertedWeight=(weightVal*454)
    }
    else if (gtolbs==TRUE)
    {
      convertedWeight=(weightVal/454)
    }
    else if (kgtolbs==TRUE)
    {
      convertedWeight=(weightVal*2.205)
    }
    else if (lbstokg==TRUE)
    {
      convertedWeight=(weightVal/2.205)
    }
    return(convertedWeight);
  }
  kilogramsToGrams=convertWeight(weightVal=1,kgtog=TRUE);
  gramsToKilograms=convertWeight(weightVal=1,gtokg=TRUE,kgtog=FALSE);
  poundsToGrams=convertWeight(weightVal=1,kgtog=FALSE,gtokg=FALSE,lbstog=TRUE);
  gramsToPounds=convertWeight(weightVal=1,kgtog=FALSE,gtokg=FALSE,lbstog=FALSE,
    gtolbs=TRUE);
  kilogramsToPounds=convertWeight(weightVal=1,kgtolbs=TRUE,kgtog=FALSE,
    gtokg=FALSE,lbstog=FALSE,gtolbs=FALSE);
  poundsToKilograms=convertWeight(weightVal=1,lbstokg=TRUE,kgtolbs=FALSE,
    kgtog=FALSE,gtokg=FALSE,lbstog=FALSE,gtolbs=FALSE);
 
## I feel like I'm missing the point

##part 2
  
   
    weatherData = read.csv("data/LansingWeather2.csv", na.strings=c("", " ", 
    "NULL", NULL, "NA", "na", NA, "null"));
    highTemp=weatherData[ ,2];
    vectorlength=length(highTemp);
    differenceInTemp=function(i)
    {
      changeinHighTemp = c()
      for ( i in 1:length(highTemp))
      {
      changeinHighTemp[i] = highTemp[i]-highTemp[i-1];
      }
    return(changeinHighTemp);
    }
    deltatemp=differenceInTemp(i)
}
