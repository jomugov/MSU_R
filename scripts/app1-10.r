{ rm(list=ls()); options(show.error.messages = TRUE);
     
     fishage= as.numeric(readline("fish age ?"));
    fishlocation = readline("fish location (north or south) port?");
     
     
  if ( (fishage >3 && fishage <5) && (fishlocation == "north"))
  {
    cat (" category I");
  }
  else if ((fishage >2 && fishage <6) &&(fishlocation == "south"))
  {
    cat("category II");
  }
  else if ((fishage >=5) && (fishlocation =="north"))
  {
    cat("category III");
  }
  else if ((fishage >=6) && (fishlocation == "south"))
  {
    cat ("category IV")
  }
  
    else if ((fishlocation != "north") && fishlocation != "south")
    {
      cat ("invalid")
    }
}   