{
  rm(list=ls()); options(show.error.locations = TRUE);
  lansJanTempsDF=read.csv(file="data/lansingJanTemps.csv");
  lansJanTemps=as.matrix(x=lansJanTempsDF);
  
  boxplot(x=lansJanTemps, use.cols=TRUE,
          names=c(2011,2012,2013,2014,2015,2016),
          main="January 2011 to January 2016",
          xlab="Years",
          ylab= "Temperature(Farhnheit");
  ## A two sample t-test compares the means of two samples to test for significance in the
  # difference of means
  
  tTest1=t.test(x=lansJanTemps[,3],y=lansJanTemps[,6])
  #t.test is the function with arguments x,y representing temps from jan 2013
  #and jan 2016
  
  print(x=tTest1) # prints t test results in console
  
  # the summary of the t-test it is stated that
  
  #The mean of x (Jan 2013) is 34.2 and the mean of y (Jan 2016) is 31.7
  #If the "experiment" could be repeated, we would expect to see a difference of this size between the means 38.23% of the time (from the p-value of 0.3823)
  #We are 95% sure that the means of x and y have a difference between -3.09 and 7.93
  #We would not reject the null hypothesis that the means of x and y are equal
  
  tTest2= t.test(x=lansJanTemps[,2], y=lansJanTemps[,4]);
  print(x=tTest2);
  
  #In the summary of the t-test it is stated that
  
  #The mean of x (Jan 2012) is 35.8 and the mean of y (Jan 2014) is 23.4
  #If the "experiment" could be repeated, we would expect to see a difference of this size between the means 0.001195% of the time (from the p-value of 1.195e-05 or 0.00001195)
  #We are 95% sure that the means of x and y have a difference between 7.21 and 17.6
  #In this case, we would reject the null hypothesis that the means of x and y are equal.
  
  #ANOVAs, while similar functionally to a t-test, require that data be structured 
  #differently.  ANOVAs compare values in one column from a data frame (e.g., temperatures) 
  #based on groupings in another column (e.g., years).  The first column contains 
  #the data and the second column contains the groupings (also called categories, factors).
  
  #In our case, the data are the temperatures whereas the groupings are the years. 
  #So, we want to create a data frame with two columns -- one that has the temperature 
  #values and one that has the associated year. 
  
  JanTemps1 = c(lansJanTemps[,2], lansJanTemps[,4]);
  #create a new vector with only temp values for 2012 and 2014
  
  JanYears1=c(rep(2012,31),rep(2014,31));
  #create a grouped vector using rep() inside c() creates a column that reads
  #2012 31 times and 2014 31 times for 31 days in the month of jan for 2012 and 2014
  
  JanDataFrame1=data.frame(JanTemps1,JanYears1);
  #create new data frame with 2 columns temp data and years
  
  boxplot(formula=JanTemps1~JanYears1,data=JanDataFrame1);
  #use formula style of box plot (formula=x,y , data=)
  
  JanAnova1 = aov(formula=JanTemps1~JanYears1, data=JanDataFrame1);
  print(summary(JanAnova1));
  
  #perform an ANOVA on the data frame using the function aov()-- in other words, 
  #we are going to check whether the 2 different months of January temperatures 
  #are likely to be from the same distribution. 
  #We use the same parameters for aov() as we did for the previous boxplot(). 
  
  #a second ANOVA will compare all 4 years of january temperatures 
  # this is how ANOVA is usually used comparing more than two groups
  #follow the same steps
  
  JanTemps2=c(lansJanTemps[,1],lansJanTemps[,2],lansJanTemps[,5],lansJanTemps[,6]);
  JanYears2=c(rep(2011,31),rep(2012,31),rep(2015,31),rep(2016,31));
  JanDataFrame2=data.frame(JanTemps2,JanTemps1);
  JanAnova2=aov(formula=JanTemps2~JanYears2, data=JanDataFrame2);
  print(summary(JanAnova2));
  
  #
  #The results of the ANOVA show that the probability of the annual temperatures 
  #coming from the same distribution is 0.685, or 68.5%
  
  hist(x=residuals(JanAnova2));
  #we can perform a histogram on the residuals of the ANOVA to show the we have 
  #not violated normality assumptions.
  #The residuals() function gets the residuals from JanAnova and hist() plots the residuals.
  #by graphing the residuals we see a normal distribution curve and
  #normality assumption were not violated?
  
}