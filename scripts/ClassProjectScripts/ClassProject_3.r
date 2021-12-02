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
  
  sturgeonLength=sturgeonData$Total_Length_mm;
  sturgeonLength=na.omit(sturgeonLength);
  sturgVecLength=length(sturgeonLength);
  lengthTotal=0;
  for(i in 1:sturgVecLength) #Skill 24
  {
    lengthTotal=lengthTotal + sturgeonLength[i]
  }
  averageSturgLength = lengthTotal/sturgVecLength;
  sturgeonLengthHist = ggplot(data=sturgeonData,aes(x=Total_Length_mm)) + 
                        geom_histogram(binwidth=50,boundary=0,closed="left",
                        fill="gray80",color="black")+ labs( x = 
                        "Total Length (mm)" , y= " Number of Fish", title= 
                        "Length Distribution of Lake Sturgeon")+ 
                        geom_vline(aes(xintercept=averageSturgLength), 
                        color= "blue"); #skill 29,31,32,33
 print(sturgeonLengthHist);
  
 speciesTotal= ggplot(data= fishData, aes(x=Species_Name , stat(count))) + 
                      geom_bar() + theme(axis.text.x = element_text(angle = 45,
                      hjust=1)) + labs(x= "Fish Species", y= "Number of Fish", 
                      title = "Survey Total Number of Fish");#skill 34 #skill 40
 print(speciesTotal);
}  

