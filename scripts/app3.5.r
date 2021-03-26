{
  rm(list=ls());options(show.error.messages = TRUE);
  formatLansWeather=read.csv("data/formattedLansingWeather.csv");
  sampleWind=sample(x=formatLansWeather$AWND,size=50,replace=TRUE);
  hist(x=sampleWind);
  abline(v=mean(sampleWind), col="red",lty=4);
  samplePrecip=sample(x=formatLansWeather$PRCP, size=30, replace=FALSE);
  hist(x=samplePrecip);
  abline(v=mean(samplePrecip),col="red",lty=4);
  
  normalDWind = rnorm(n=20, mean = mean(formatLansWeather$AWND),
                      sd=sd(formatLansWeather$AWND));
  
  hist(normalDWind, angle=60, density=10,
       col=c("purple", "black", "red"),
       main="Histogram of Normal Wind Speed",
       xlab="Normal Wind Speed (n=20)");
  abline(v=mean(normalDWind), col="red", lty=6, lwd=3);
 
  normalDWind = rnorm(n=50, mean = mean(formatLansWeather$AWND),
                      sd=sd(formatLansWeather$AWND));
  
  hist(normalDWind, angle=60, density=10,
       col=c("purple", "black", "red"),
       main="Histogram of Normal Wind Speed",
       xlab="Normal Wind Speed (n=50)");
  abline(v=mean(normalDWind), col="red", lty=6, lwd=3); 
  
  normalDWind = rnorm(n=200, mean = mean(formatLansWeather$AWND),
                      sd=sd(formatLansWeather$AWND));
  
  hist(normalDWind, angle=60, density=10,
       col=c("purple", "black", "red"),
       main="Histogram of Normal Wind Speed",
       xlab="Normal Wind Speed (n=200)");
  abline(v=mean(normalDWind), col="red", lty=6, lwd=3);
  
  set.seed(seed=15)
  seedSample1=sample(x=formatLansWeather$AWND, size=20 , replace=TRUE);
  seedSample1 = rnorm(n=20, mean = mean(seedSample1),
                      sd=sd(seedSample1))
  
  hist(seedSample1, angle=60, density=10,
       col=c("purple", "black", "red"),
       main="Histogram of Seed Sample 1",
       xlab="Psuedo-random Values (n=20)");
  
  abline(v=mean(seedSample1), col="red", lty=6, lwd=3);
  
  seedSample2=sample(x=formatLansWeather$AWND, size=50, replace=TRUE);
  set.seed(seed=15)
  seedSample2=sample(x=formatLansWeather$AWND, size=50 , replace=TRUE);
  seedSample2 = rnorm(n=20, mean = mean(seedSample1),
                      sd=sd(seedSample2))
  
  hist(seedSample2, angle=60, density=10,
       col=c("purple", "black", "red"),
       main="Histogram of Seed Sample 2",
       xlab="Psuedo-random Values (n=50)");
  
  abline(v=mean(seedSample2), col="red", lty=6, lwd=3);
  
  seedSample3=sample(x=formatLansWeather$AWND, size=200, replace=TRUE);
  set.seed(seed=15);
  seedSample3=sample(x=formatLansWeather$AWND, size=200 , replace=TRUE);
  seedSample3 = rnorm(n=20, mean = mean(seedSample3),
                      sd=sd(seedSample3));
  
  hist(seedSample3, angle=60, density=10,
       col=c("purple", "black", "red"),
       main="Histogram of Seed Sample 3",
       xlab="Psuedo-random Values (n=200)");
  abline(v=mean(seedSample2), col="red", lty=6, lwd=3);
  
  seedFun=function(df,sampleSize,seedVal)
  {
    set.seed(seed=seedVal);
    normDist=rnorm(n=sampleSize,mean=mean(df),sd=sd(df));
    hist(normDist, angle=60, density=10,
         col=c("purple", "black", "red"),
         main="Histogram of Average Wind",
         xlab="Average Wind Speed");
    abline(v=mean(df), col="red", lty=6, lwd=3);
    return(normDist);
    return(hist);
    return(abline);
  }
  seedFun1=seedFun(df=formatLansWeather$AWND,sampleSize=20,seedVal=NULL);
  seedFun2=seedFun(df=formatLansWeather$AWND,sampleSize=50,seedVal=NULL);
  seedFun3=seedFun(df=formatLansWeather$AWND,sampleSize=200,seedVal=NULL);
  seedFun4=seedFun(df=formatLansWeather$AWND,sampleSize=20,seedVal=15);
  seedFun5=seedFun(df=formatLansWeather$AWND,sampleSize=50,seedVal=15);
  seedFun6=seedFun(df=formatLansWeather$AWND,sampleSize=200,seedVal=15);
}