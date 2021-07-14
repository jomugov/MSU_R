{ 
  rm(list=ls()); options(show.error.messages = TRUE);
  setwd = ("C:/users/jmutchler/OneDrive-DOE/MSU_R");
  gunCrime=read.csv(file="data/Guns.csv",na.strings=c("", " ", 
                                          "NULL", NULL, "NA","na", NA, "null"));
  library(dplyr);
  alCrimeAll= filter(gunCrime, state == "Alabama");
  alCrimeViolent= alCrimeAll$violent;
  alIncome=alCrimeAll$income;
  alPopulation=alCrimeAll$population;
  plot(formula=alCrimeViolent~alIncome);
  model1=lm(formula=alCrimeViolent~alIncome);
  abline(model1 , col="blue");# skill 57
  print(summary(model1));
  #
  plot(formula=alCrimeViolent~alPopulation);
  model2=lm(formula=alCrimeViolent~alPopulation);
  abline(model2, col="blue");
  print(summary(model2));
  alAverageIncome = mean(alIncome);
  alIncomeLarge=which(alIncome >=11418);#Skill 58
  alIncomeSmall=which(alIncome<11418); #Skill 58
  states=gunCrime$state;
  caState=which(states == "California"); #skill 58
  allOtherState=which(states != "California"); #skill 58
  grepTest=grep("kansas", states);#skill 59
  grepTest2=grep("Kansas", states);#skill 59
  alCrimeLowIncome=alCrimeViolent[alIncomeSmall];#skill 60
  alCrimeHighIncome=alCrimeViolent[alIncomeLarge];#skil 60
  violentCrime=gunCrime$violent;
  caViolentCrime=violentCrime[caState];#skill 60

  onlyPrisoners=gunCrime$prisoners;
  onlyYear=gunCrime$year;
  onlyMurder=gunCrime$murder;
  only80sPrisoners=which(onlyYear > 1979 & onlyYear < 1990) & 
                    (onlyPrisoners>100); #skill 61 
  only80s=onlyMurder[only80sPrisoners];#used index vector to subset another vector
  
  calOnly80sPrisoners=intersect(onlyPrisoners, caState);# skill 63
  
  
  
}