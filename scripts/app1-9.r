{ rm(list=ls()); options(show.error.messages = TRUE);
  
  fishage=readline("what is the age of the fish?");
  fishage=as.numeric(fishage);
  
  if(fishage >5 && fishage <8)
  {
    cat("that's a keeper bud");
  }
  
  
  fishWeight=readline("how much does this fish weigh in grams");
  fishWeight=as.numeric(fishWeight);
  
  if(fishWeight >50 && fishWeight< 150)
  {
    cat("not worth keeping");
  }
  
  fishgender=readline("male or female");
  
  fishlocation= readline("From which port was the fish caught");
  
  if(fishgender == "male" && fishlocation == "north")
   {
     cat("male fish from north port");
   }
  else if(fishgender == "male" && fishlocation == "south")
   {
     cat("male fish from south port");
  }
  else if(fishgender == "female" && fishlocation== "north")
  {
    cat("female fish from north port");
  }
   else if(fishgender == "female" && fishlocation == "south")
   {
     cat("female fish from south port");
   }

  else
  {
    cat("this answer does not work"); ## this my error case
  }
}  

{ rm(list=ls())
  
  fishWeight=readline("how much does this fish weigh in grams");
  fishWeight=as.numeric(fishWeight);
  fishlocation= readline("From which port was the fish caught"); 
  
  if( fishWeight >20 && fishWeight <100 && 
      fishlocation == "north" || "south")
  {
    cat ("bonus fish");
  }
}
  