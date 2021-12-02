{
  rm(list=ls());
  source("scripts/toolbox.r"); ##call on function stored in seperate script toolbox.r file
  
  hypoteneuse=pythagoras(8,12); ## use defined function pythagoras
  
  counter=function(vector,compareVAl)## create function counter to be stored in seperate script
  {                                ## counter has to arguments assigned by the caller (vector,compareVal)
                                     #the vector is the data column the compareVal is a value to compare to the data
    vecLength=length(vector);         ##determine vector length
    countVal=0                      ##determine state variable outside of for()
    for (val in 1:vecLength)            ##initiate for loop
    {
      if (vector[val]>compareVal) # if value of vector at location val is greater than compareVal(defined)
      {
        countVal=countVal+1
      }
               ##intermediate state variable to accumulate 1 when conditions are met
    }
  }
    return(countVal)           ## returns countVal/initiate outside of for() and inside function()
}

counter1=function(vector,compareVal,conditionalOP)
{
  countVal1=0
  veclength1=length(vector1)
  
  for(val in 1:veclength1)
  {
    if (conditionalOP== ">" && vector[val]>compareVal)
    {
      countVal1=countVal1+1
    }
    else if ( conditionalOP== "<" && vector[val]<compareVal)
    {
      countVal1=countVal1+1
    }
    else if (conditionalOP == "==" && vector[val]== compareVal)
    {
      countVal1=countval1+1
    }
  }
  return(countVal1)
}
rm(list=ls()); options(show.error.locations = TRUE); 
source("scripts/toolbox.r");

weatherData = read.csv("data/LansingWeather3.csv");
highTempData = weatherData[ ,"highTemp"];
lowTempData = weatherData[ ,"lowTemp"];

count1 = counter(vector = lowTempData, compareVal = 40, conditionalOp = "<");
count2 = counter(vector = highTempData, compareVal = 54, conditionalOp = "==");
count3 = counter(vector = lowTempData, compareVal = 40);
count4 = counter(vector = highTempData, compareVal = 60);
count5 = counter(lowTempData, 38, "==");
count6 = counter(highTempData, 50, ">");