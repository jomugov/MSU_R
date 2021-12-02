{
  rm(list=ls()); options(show.error.messages=TRUE);
  
  pythagorus=function(a,b)#create function and variables a and b
  {
    c=((a^2)+(b^2))^(1/2);#create  code block and return value and calculations for a and b
    return(c);#assign return variable c
  }
  hypoteneuse=pythagorus(a=5,b=7);#create a vector hypoteneuse to save answer of function
  convertTemp=function(tempVal,toCelsius)
  {
    if(toCelsius==TRUE)#boolean statement is either TRUE or FALSE
    {
      convertedTemp=(5/9)*(tempVal-32);#convert celsius to fahrenheit
    }
    else#boolean statement is FALSE
    {
      convertedTemp = (9/5)* tempVal + 32;#convert fahrenheit to celsius
    }
    return(convertedTemp);
    }
 temp1=convertTemp(32,TRUE);
 temp2=convertTemp(32,FALSE);
 temp3=convertTemp(c(0,23,32),TRUE);#insert vector into function
}
