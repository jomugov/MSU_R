{ rm(list=ls()); options(show.error.messages = TRUE);
     
  
  fishLocation = readline("fish location (north or south) port?");
  fishAge= as.numeric(readline("fish age ?"));
  
  if ((fishLocation != "north") && (fishLocation != "south"))
  {
    cat ("invalid");
  }
  else if ( (fishAge >3 && fishAge <5) && (fishLocation == "north"))
  {
    cat ("category I");
  }
  else if ((fishAge >2 && fishAge <6) &&(fishLocation == "south"))
  {
    cat("category II");
  }
  else if ((fishAge >=5) && (fishLocation =="north"))
  {
    cat("category III");
  }
  else if ((fishAge >=6) && (fishLocation == "south"))
  {
    cat ("category IV");
  }
}   