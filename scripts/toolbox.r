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