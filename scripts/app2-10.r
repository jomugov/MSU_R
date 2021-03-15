{rm(list=ls()); options(show.error.locations = TRUE); 
source("scripts/toolbox.r");

weatherData = read.csv("data/LansingWeather3.csv");
highTempData = weatherData[ ,"highTemp"];
test1=testFun(highTempData ,50, "==");
test2=testFun(highTempData , 200, "==");
test3=testFun(highTempData , 39, "<");
test4=testFun(highTempData, 74, ">");

counter1=counter(highTempData,60,"@");## relays invalid response too many times
counter2=counter(highTempData,60,">");
counter3=counter(highTempData,60,"=");
counter4=counter(highTempData,60,">=");
counter5=counter(highTempData,60,"<=");
counter6=counter(highTempData,60,"!=");
counter7=counter(highTempData,60,"<");
}