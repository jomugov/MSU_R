{
  rm(list=ls()); options(show.error.locations = TRUE);
  lansJanTempsDF=read.csv(file="data/lansingJanTemps.csv");
  lansJanTemps=as.matrix(x=lansJanTempsDF);
  
  tTest1=t.test(x=lansJanTemps[,4],y=lansJanTemps[,1]);
  tTest2=t.test(x=lansJanTemps[,4],y=lansJanTemps[,2]);
  tTest3=t.test(x=lansJanTemps[,4],y=lansJanTemps[,3]);
  tTest4=t.test(x=lansJanTemps[,4],y=lansJanTemps[,5]);
  tTest5=t.test(x=lansJanTemps[,4],y=lansJanTemps[,6]);
  
  print(x=tTest1);#2011 and 2014 temperatures are most similar (highest p-Value)
  print(x=tTest2);
  print(x=tTest3);
  print(x=tTest4);
  print(x=tTest5);
  
  JanTempsAll=c(lansJanTemps[,1],lansJanTemps[,2],lansJanTemps[,3],
                 lansJanTemps[,4],lansJanTemps[,5],lansJanTemps[,6]);
  JanYearsAll=c(rep(2011,31),rep(2012,31),rep(2013,31),rep(2014,31),rep(2015,31),
                rep(2016,31));
  JanYearAllDF=data.frame(JanTempsAll,JanYearsAll);
  
  boxplot(x=lansJanTemps, use.cols=TRUE,
          names=c(2011,2012,2013,2014,2015,2016),
          main="January 2011 to January 2016",
          xlab="Years",
          ylab= "Temperature(Farhnheit");
  JanAnovaAll=aov(formula = JanTempsAll~JanYearsAll,data=JanYearAllDF);
  print(summary(JanAnovaAll));
  
  hist(residuals(JanAnovaAll)); #residuals express a normal distribution
  #implying that normality assumptions were not violated
  
  write.csv(JanYearAllDF,"data/JanTempDF.csv");
}
