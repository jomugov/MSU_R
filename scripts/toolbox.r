myToken="yrqMalidtkrLhlOzTtQGRPGoAGpovwpp";
pythagoras = function(a,b)
{
  c = (a^2 + b^2)^(1/2);
  return(c);
}  
counter=function(vector,compareVal,conditionalOp=">")
{
  countVal=0;
  vecLength=length(vector);
  
    for(val in 1:vecLength)
    {
    if(!(conditionalOp == "==" ||conditionalOp == ">" ||conditionalOp == "<" ||
           conditionalOp == ">=" ||conditionalOp == "<=" ||conditionalOp == "!="))
    {
        cat("sorry invalid condition");
      break;
    }
      
    else if (conditionalOp ==">" && vector[val]>compareVal)
    {
      countVal=countVal+1;
    }
    else if ( conditionalOp =="<"&& vector[val]<compareVal)
    {
      countVal=countVal+1;
    }
    else if ( conditionalOp == "==" && vector[val]==compareVal)
    {
      countVal=countVal+1;
    }
    else if (conditionalOp == ">=" && vector [val]>=compareVal)
    {
      countVal=countVal+1;
    }
    else if (conditionalOp == "<=" && vector [val]<=compareVal)
    {
      countVal=countVal+1;
    }
    else if ( conditionalOp == "!=" && vector [val] != compareVal)
    {
      countVal=countVal+1;
    }
    
  }
return(countVal)
}
testFun=function(vector,giveVal,conditionOp)
{
  vectorLen=length(vector);
  conditionMet=FALSE;
  for(i in 1:vectorLen)
  {
    if (conditionOp == "==" && vector[i] == giveVal)
    {
      conditionMet=TRUE;
    }
    else if ( conditionOp ==">" && vector[i] > giveVal)
    {
      conditionMet=TRUE;
    }
    else if ( conditionOp == "<" && vector[i] < giveVal)
    {
      conditionMet=TRUE;
    }
  }
  return(conditionMet);
}
{
  timeConvert = function(hoursMinutes)
  {
    returnVector = c();
    for(i in 1:length(hoursMinutes))
    {
      numDigits = nchar(as.character(hoursMinutes[i]));
      minutes = substr(hoursMinutes[i], numDigits-1, numDigits);
      minutes = as.numeric(minutes)*(1/60);
      hours = floor(hoursMinutes[i]/100);
      returnVector[i] = round(hours+minutes, 2);
    }
    return(returnVector)
  }
}