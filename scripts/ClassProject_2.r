{
  rm(list=ls()); options(show.error.messages = TRUE);
  setwd = ("C:/users/jmutchler/OneDrive-DOE/MSU_R");
  fishData=read.csv(file="data/finalProjectData.csv",na.strings=c("", " ", 
                                "NULL", NULL, "NA", "na", NA, "null")); #Skill14
  library(tidyr);
  library(dplyr);
  fishPoint=fishData[1,3];#skill 15
  fishLength=fishData$Total_Length_mm; #Skill 16
  cat("the first length for all fish  is ", fishLength[1]); #skill 17
  for(seqVal in 1:3) #skill 18
  {
    cat("the count is", seqVal, "\n");
    cat("Species ", seqVal, " is ", fishData[seqVal, "Species_Name"], "\n");
  }
  for(fishNum in seq(from=1, to=10, by=2)) #skill 19
  {
    cat("Species type for fish", fishNum , "was", fishData[fishNum,
        "Species_Name"], "\n");
  }
  lengthVector= length(fishLength);#skill 20
  for(i in 1560:lengthVector)
  {
    cat( "the number", i ,"fish measured was", fishData[i,"Total_Length_mm"], 
        "mm \n");
  }
  stateVector=c(1,3,4,2,3,5);
  lengthVector2=length(stateVector);
  total=0; #skill 21
  for(i in 1:lengthVector2)
  {
    cat(" Total before iteration", i, "=", total); 
    total = total + stateVector[i]; #skill 21
    cat("\t\tAfter iteration", i, "=", total, "\n"); 
  }
  fishLength=fishData$Total_Length_mm;
  fishLength=na.omit(fishLength);
  fishLengthVector=length(fishLength);
  longestFish = fishLength[1]; #skill 21
  for(i in 1: fishLengthVector)
  {
    if(fishLength[i] > longestFish) #skill22
    {
      longestFish = fishLength[i];  #SKill21 
    }
  } 
  fishLength2=fishData$Total_Length_mm;
  fishLength2=na.omit(fishLength2); #skill 25
  fishLengthVector2=length(fishLength2);
  shortestFish = fishLength2[1]; #skill 21
  for(i in 1: fishLengthVector2)
  {
    if(fishLength2[i] < shortestFish) #skill 22
    {
      shortestFish = fishLength2[i];  #SKill21 
    }
  }
  fishLength3=fishData$Total_Length_mm;
  fishLength3=na.omit(fishLength3);
  fishLengthVector3=length(fishLength3);
  fishLengthunder100= FALSE; #skill 23
  for(i in 1: fishLengthVector3)
  {
    if(fishLength3[i] < 100) 
    {
      fishLengthunder100 = TRUE;  
    }
  }
  lakeSturgeonData = filter(fishData, Species_Name == "Lake sturgeon");#skill 40
  sturgLength=lakeSturgeonData$Total_Length_mm;
  sturgLength=na.omit(sturgLength);
  sturgVecLength=length(sturgLength);
  lengthTotal=0;
  minFishLength=sturgLength[1];
  maxFishLength=sturgLength[1];
  for(i in 1: sturgVecLength) #Skill 24
  {
    lengthTotal=lengthTotal + sturgLength[i]
  }
  averageSturgLength= lengthTotal/sturgVecLength;
  for(i in 1:sturgVecLength) 
  {
    if(sturgLength[i] < minFishLength)
    {
     minimumLength = sturgLength[i]; #skill 24
    }
  }
  for(i in 1:sturgVecLength)
  {
    if(sturgLength[i] > maxFishLength)
    {
       maximumLength = sturgLength[i]; #skill 24
    }
  }
  lakeSturgeonData = filter(fishData, Species_Name == "Lake sturgeon");
  sturgLength=lakeSturgeonData$Total_Length_mm;
  sturgVecLength=length(sturgLength);
  sturgeonLengthIn=c();
  for( i in 1:sturgVecLength)
  {
    sturgeonLengthIn[i]=(sturgLength[i]/(25.4));
  }
  lakeSturgeonData[ ,"Total_Length_in"]=sturgeonLengthIn;#skill 26
  lakeSturgeonData2=lakeSturgeonData[ ,c(1,2,3,4,10,5)];#skill 27
  write.csv(x=lakeSturgeonData2, file="data/sturgeonData.csv");#skill 28
}