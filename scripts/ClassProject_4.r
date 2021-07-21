{
  rm(list=ls()); options(show.error.messages = TRUE);
  sturgeonData=read.csv(file="data/sturgeonData.csv",na.strings=c("", " ", 
                      "NULL", NULL, "NA", "na", NA, "null"));
  fishData=read.csv(file="data/finalProjectData.csv",na.strings=c("", " ", 
                  "NULL", NULL, "NA", "na", NA, "null"));
  convertLength = function (mm) # skill 36 created function to convert mm to in
  {
    mmToIn = (mm / 25.4);
    return(mmToIn);
  }
  allFishIn= convertLength(fishData$Total_Length_mm); # skill 38 saved return value from function to variable
  speciesMaxLength=function (speciesOp) #skill 36 created function to determine species max length
  {
    speciesVec=length(fishData$Total_Length_mm);
    waedata=filter(fishData, Species_Name == "Walleye");
    waeLength=waedata$Total_Length_mm;
    waeLength=na.omit(waeLength);
    sturgdata=filter(fishData, Species_Name == "Lake sturgeon");
    sturgLength=sturgdata$Total_Length_mm;
    sturgLength=na.omit(sturgLength);
    for( i in 1:speciesVec)
    {
      if(speciesOp=="Walleye")
      {   
        maxLength= max(waeLength);
      }
      if  (speciesOp=="Lake sturgeon")
      { 
        maxLength= max(sturgLength);
      } 
    } 
    return(maxLength);
  }
  walleyeMaxLength=speciesMaxLength(speciesOp  = "Walleye");
  lakeSturgeonMaxLength=speciesMaxLength(speciesOp = "Lake sturgeon");
  sturgeonData[,6]= round(x=sturgeonData[,6], digits = 1); #skill 44 used function round to round data to one decimal
 
}