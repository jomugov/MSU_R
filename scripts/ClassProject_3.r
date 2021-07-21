{
  rm(list=ls()); options(show.error.messages = TRUE);
  sturgeonData=read.csv(file="data/sturgeonData.csv",na.strings=c("", " ", 
                                         "NULL", NULL, "NA", "na", NA, "null"));
  fishData=read.csv(file="data/finalProjectData.csv",na.strings=c("", " ", 
                                         "NULL", NULL, "NA", "na", NA, "null"));
  library(ggplot2);
  sturgeonLength=sturgeonData$Total_Length_mm;
  sturgeonLength=na.omit(sturgeonLength);
  sturgVecLength=length(sturgeonLength);
  lengthTotal=0;
  for(i in 1:sturgVecLength) 
  {
    lengthTotal=lengthTotal + sturgeonLength[i]
  }
  averageSturgLength = lengthTotal/sturgVecLength;
  sturgeonLengthHist = ggplot(data=sturgeonData) +
    geom_histogram(mapping=aes(x=Total_Length_mm), 
                   binwidth=50,
                   boundary=0,
                   closed="left",
                   fill="gray80", #filled bars with grey
                   color="black") + #added color
    labs(x = "Total Length (mm)",#added x and y labels
         y= " Number of Fish",
         title= "Length Distribution of Lake Sturgeon")+
    geom_vline(mapping=aes(xintercept=averageSturgLength),#added line to show average length
               color= "blue"); #skill 29,31,32,33
  plot(sturgeonLengthHist);
  
 speciesTotal= ggplot(data= fishData, aes(x=Species_Name , stat(count))) + 
                      geom_bar() + theme(axis.text.x = element_text(angle = 45,
                      hjust=1)) + labs(x= "Fish Species", y= "Number of Fish", 
                      title = "Survey Total Number of Fish");#skill 34 #skill 40 created bar plot and used function ggplot
 print(speciesTotal);
}  

