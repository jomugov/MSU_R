{
rm(list=ls()); options(show.error.messages = TRUE);
setwd = ("C:/users/jmutchler/OneDrive-DOE/MSU_R");
sturgeonData=read.csv(file="data/sturgeonData.csv",na.strings=c("", " ", 
                                                                "NULL", NULL, "NA", "na", NA, "null"));
fishData=read.csv(file="data/finalProjectData.csv",na.strings=c("", " ", 
                                                                "NULL", NULL, "NA", "na", NA, "null"));
library(tidyr);
library(ggplot2);
library(dplyr);

convertLength = function (mm) # skill 36
{
  mmToIn = (mm / 25.4);
  return(mmToIn);
}

allFishIn= convertLength(fishData$Total_Length_mm); # skill 38


speciesMaxLength=function (speciesOp) #skill 36
{
  
  speciesVec=length(fishData$Total_Length_mm)
  
  waedata=filter(fishData, Species_Name == "Walleye");
  waeLength=waedata$Total_Length_mm
  waeLength=na.omit(waeLength)
  
  sturgdata=filter(fishData, Species_Name == "Lake sturgeon");
  sturgLength=sturgdata$Total_Length_mm
  sturgLength=na.omit(sturgLength)
 
  
  for( i in 1:speciesVec)
  {
    
    if(speciesOp=="Walleye")
    {   
      maxLength= max(waeLength)
    }
    if  (speciesOp=="Lake sturgeon")
    { 
      maxLength= max(sturgLength)
    } 
    
  } 
  return(maxLength);
}
  walleyeMaxLength=speciesMaxLength(speciesOp  = "Walleye");
  lakeSturgeonMaxLength=speciesMaxLength(speciesOp = "Lake sturgeon");
  sturgeonData[,6]= round(x=sturgeonData[,6], digits = 1); #skill 44 
 
}