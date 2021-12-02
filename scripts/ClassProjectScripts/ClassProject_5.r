{
  rm(list=ls()); options(show.error.messages = TRUE);
  setwd = ("C:/users/jmutchler/OneDrive-DOE/MSU_R");
  esi=read.csv(file="data/esi.csv",na.strings=c("", " ", 
                                  "NULL", NULL, "NA", "na", NA, "null"));
  caSchools=read.csv(file="data/CASchools.csv",na.strings=c("", " ", 
                                         "NULL", NULL, "NA", "na", NA, "null"));
  gunCrime=read.csv(file="data/Guns.csv",na.strings=c("", " ", 
                                        "NULL", NULL, "NA","na", NA, "null"));
  
  library(reshape2);
  library(dplyr);
  
  esidata = dcast(data = esi, formula =  "esi" ~ country ,  value.var = "esi");
  # reshaped data frame just to show esi data in a different format
  colnames(x=esidata)[1]="";#skill 45
  rownames(x=esidata)[1]="Env Index";#skill 45
  
  studentTeacher= function(students , teachers, multiplier = 2) #skill 37,39
  {
    ratio= (students*multiplier)/teachers;
    return(ratio);
  }
  studentsPerteacher=studentTeacher(students=20, teachers=2);
  butteOrTulare=grep("Butte|Tulare",caSchools$county);#skill 62
  caSchools[,c(7,8,9,11,12,13,14)]=round(x=caSchools[,c(7,8,9,11,12,13,14)], 
                                         digits = 0); # skill 42
  caSchools[,5]=substr(x=caSchools[,5], start=5, stop=5); #skill 43
  minorityEng=filter(caSchools, english >= 50);
  majorityEng=filter(caSchools, english < 50);
  minReading=minorityEng[,14];
  majReading=majorityEng[,14];
  majReading=majReading[1:32];
  minMath=minorityEng[,15];
  majMath=majorityEng[,15];
  majMath=majMath[1:32];
  allTest=data.frame(minMath,majMath,minReading,majReading);
  tTestEng=t.test(x=minorityEng[,14] , y=majorityEng[,14]); #skill 50
  print(tTestEng);
  # results indicate that the difference in means is not equal to 0. The null
  #hypothesis is rejected based on p-value of < 0.05. Results show that schools
  #with  50% or more of students that speak English as a second language, on average,
  #scored lower in Reading
  tTestMath= t.test(x=minorityEng[,15], y=majorityEng[,15]); #skill 50
  print(tTestMath);
  # results indicate that the difference in means is not equal to 0. The null
  #hypothesis is rejected based on p-value of < 0.05. Results show that schools
  #with  50% or more of students that speak English as a second language, on average,
  #scored lower in Math
  allTestBoxP= boxplot(x= allTest, use.cols = TRUE,
                   main= "Test scores based on Primary Language",
                   ylab= "Test score",
                   xlab = "Test Type" ); #skill 51
  incomeVec=caSchools$income;
  mathScore=caSchools$math;
  readScore=caSchools$read;
  averageIncome=mean(caSchools$income);
  aboveMeanIncome=which(incomeVec > 15);
  belowMeanIncome=which(incomeVec <15);
  wealthyMath=mathScore[aboveMeanIncome];
  poorMath=mathScore[belowMeanIncome];
  wealthyRead=readScore[aboveMeanIncome];
  poorRead=readScore[belowMeanIncome];
  
  plot(formula=readScore[belowMeanIncome]~mathScore[belowMeanIncome],col="red",
       main="Test Scores Based on Relative Income",
       xlab= "Reading Score",
       ylab="Math Score");#skill 64
  points(formula=readScore[aboveMeanIncome]~mathScore[aboveMeanIncome],
          col = "blue");#skill 64
  legend(x="topleft", legend=c("Above average income", "Below average income"),
         pch=c(1,1),
         col=c("red","blue"));#skill 30
  
  pairs(caSchools[,14:15], phc=10); #skill 35
  
  listOfTestScores=list("WealthyMath"=wealthyMath, "PoorMath"=poorMath,
                        "WealthyRead"=wealthyRead, "PoorRead"=poorRead);
  save(listOfTestScores, file="data/listOfTestScores.rdata");# skill 65
  
  alCrime= filter(gunCrime, state == "Alabama");
  alCrime= alCrime$violent;
  akCrime=filter(gunCrime, state == "Alaska");
  akCrime=akCrime$violent;
  arCrime=filter(gunCrime, state == "Arizona");
  arCrime=arCrime$violent;
                  
  allCrime= c(alCrime,akCrime,arCrime);
  crimeMatrix= matrix(data = allCrime, nrow=23, ncol=3, byrow=FALSE); #skill 46
  colnames(crimeMatrix)= c("Alabama", "Alaska", "Arizona");
  rownames(crimeMatrix)= c(1977:1999);
  meanCrimeAk=mean(crimeMatrix[ ,2]);#mean crime in AK from 1977-1999 #skill 47
  meanCrim1977=mean(crimeMatrix[1,]);#mean crime for three states in 1977 #skill 47
  meanCrimeAll=mean(crimeMatrix);#mean crime for all three states from 1977-1999 #skill 47
  earlyCrime=filter(gunCrime, year == 1977);
  earlyCrimeV=earlyCrime$violent;
  lateCrime=filter(gunCrime, year == 1999);
  lateCrimeV=lateCrime$violent;
  violentRate=c(earlyCrimeV,lateCrimeV);#created vector including violent statistic in 1977 and 1997 for all 51 states
  violentYears= c(rep(1977,51), rep(1999,51));#skill 48
  violentTimeline=data.frame(violentRate,violentYears);
  crimeAnova= aov(formula = violentRate~violentYears, data=violentTimeline);#skill 49
  print(summary(crimeAnova));
  
  #Anova results show that probabilitly of the rate of crime for 1977 and 1999 comes from the 
  #same distribution is 18.5% . Meaning we fail to reject the null hypothesis 
  # and that there is no significant difference between the means. I assumed to reject the null hypothesis.
  
  earlyRob=earlyCrime$robbery;
  lateRob=lateCrime$robbery;
  robRate=c(earlyRob,lateRob);
  robYears=c(rep(1977,51), rep(1999,51));
  robTimeline=data.frame(robRate,robYears);
  robAnova=aov(formula=robRate~robYears, data=robTimeline);#skill 49
  print(summary(robAnova));
  
 # Anova results show that the probablility of the rate of robberies for 1977 and 1999 
  #comes from the same distribution is 40.7% .Meaning we fail to reject the null hypothesis 
  # and that there is no significant difference between the means. I assumed to reject the null hypothesis.
  
  randomViolent= sample(x=violentRate, size =20, replace = TRUE); #skill 52
  normalDistribution= rnorm(n =111, mean=30, sd=5); #skill 54
  set.seed(seed = 25);
  seedSample=sample(x=violentRate, size=25);#Skill 53
  
  violentList= list("Random"=randomViolent, "Normal"= normalDistribution, 
                    "Seed"=seedSample);
  save(violentList, file="data/violentList.rdata");
  load("data/violentList.rdata");
  randomViolentList=violentList[["Random"]];
  
}