{ 
  rm(list=ls()); options(show.error.messages=TRUE);
  numbers=c (94,102,89,105,78,85);
  lengthVector=length(numbers);
  numberTotal=0; ##state variable
  maxNumber=numbers[1];##initial state variable
  minNumber=numbers[2];##initial
  greaterthan100 = FALSE;
  lessthan70=FALSE;
  equalto78=FALSE;
  equalto87=FALSE;
  
  for(i in 1: lengthVector)
  {
    numberTotal=numberTotal +numbers[i];
  }
    if (numbers[i] > maxNumber)
    { 
      maxNumber = numbers[i]; ## state variable intermediate}
    }
    if (numbers[i] < minNumber)
    {
      minNumber = numbers[i];##state variable intermediate
    }
    if (numbers[i] > 100)
    {
      greaterthan100=TRUE;
    }
    if(numbers[i] <70 )
    {
      lessthan70=TRUE;
    }
    if(numbers[i] ==78)
    {
      equalto78=TRUE;
    }
    if(numbers[i]==87)
    {
      equalto87=TRUE;
    }
  average= numberTotal/lengthVector
}

 