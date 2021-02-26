{ rm(list=ls()); options(show.error.messages = TRUE);
  
  fishage=readline("what is the age of the fish?");
  fishage=as.numeric(fishage);
  fishWeight=readline("how much does this fish weigh in grams");
  fishWeight=as.numeric(fishWeight);
  fishgender=readline("male or female");
  fishlocation= readline("From which port was the fish caught");

  if(fishage >5 && fishage <8)
  {
    cat("that's a keeper bud");
  }
  if( fishWeight >20 && fishWeight <100 && 
      fishlocation == "north" || fishlocation== "south")
  {
    cat ("\nbonus fish");
  }
  
  else if(fishWeight >50 && fishWeight< 150)
  {
    cat("\nnot worth keeping");
  }
  
  if(fishgender == "male" && fishlocation == "north")
  {
    cat("\nmale fish from north port");
  }
  else if(fishgender == "male" && fishlocation == "south")
  {
    cat("\nmale fish from south port");
  }
  else if(fishgender == "female" && fishlocation== "north")
  {
    cat("\nfemale fish from north port");
  }
   else if(fishgender == "female" && fishlocation == "south")
  {
    cat("\nfemale fish from south port");
  }

  else
  {
    cat("\nthis answer does not work"); ## this my error case
  }

  
}
  