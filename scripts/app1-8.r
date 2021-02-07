{
  rm(list=ls()); options(show.error.messages = TRUE);
  temp=readline("what is the temp?")
  temp=as.numeric(temp)
  
  if(temp >100 )
  {
    cat("invalid value");
  }
   
   else if (temp >60)
  {
    cat("hot");
  }
    
  else if (temp == 60)
  { 
     cat ("hottish");
  }
  else if (temp >30)
  {
    cat("warm");
  }
    
   else if (temp == 30)
    {
     cat("warmish");
    }

  else if (temp > -20)
  {
    cat("cold");
  }
  else if(temp < -20)
  {
    cat("invalid value");
  }
  
}