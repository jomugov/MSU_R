{
  rm(list=ls()); options(show.error.location=TRUE);
  
  location = readline("what is your location?");
  temp1=12;
  temp2=18;
  temp3=8;
  temp4=4;
  temp5=7;
  meantemp = ((temp1+temp2+temp3+temp4+temp5)/5);
  averageTemp = readline("what was the average temperature this week?")
  cat("The temperatures are from",location, "\nThe temperature measurements are",
      temp1, temp2, temp3, temp4, temp5, "\nThe mean temperature is", meantemp);
}