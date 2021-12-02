{
  rm(list=ls()); options(show.error.messages = TRUE);
  lansJanTempsDF = read.csv(file = "data/lansingJanTemps.csv"); 
  lansJanTemps = as.matrix(x=lansJanTempsDF);
  
  randomTemps=sample(lansJanTemps,x=80,replace=TRUE);
  hist(x=randomTemps);
  abline(v=mean(randomTemps), col="red", lty=4);
  
  normalTemps = rnorm(n=100, mean = mean(lansJanTemps),
                      sd=sd(lansJanTemps));
  
  hist(normalTemps, angle=60, density=10,
       col=c("purple", "black", "red"),
       main="Histogram of Normal Temps Vector",
       xlab="Normal Temps");
  # lty: line type, lwd: line width
  abline(v=mean(normalTemps), col="darkgreen", lty=6, lwd=3);
  
  setSeedTemps = sample(x=lansJanTemps, size=80, replace=TRUE);
  
  # get 100 pseudo-random normalized temperature values
  setSeedNormalTemps = rnorm(n=100, mean = mean(lansJanTemps), 
                             sd=sd(lansJanTemps));
  
  # make a list of the four temperature vector we have generated in this script
  listOfTemps = list("Random_Temps" = randomTemps, 
                     "Normal_Temps" = normalTemps, 
                     "Set_Seed_Temps" = setSeedTemps, 
                     "Set_Seed_Normal_Temps" = setSeedNormalTemps);
  
  # subsetting temperature vectors from the list
  listRandomTemps = listOfTemps[["Random_Temps"]];
  listSeedTemps = listOfTemps[["Set_Seed_Normal_Temps"]];
}