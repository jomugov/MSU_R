{
  rm(list=ls()); options(show.error.messages = TRUE);
  setwd = ("C:/users/jmutchler/OneDrive-DOE/MSU_R");
  
  a=(5+8)/(4^2); #Skill 1,2,3
  fishType=readline("What type of fish is your favorite to catch?");#Skill 4
  fish1=readline("How long was your biggest fish (inches)?");
  fish1=as.numeric(fish1);
  fish2=readline("How long was your second biggest fish (inches)?");
  fish2=as.numeric(fish2);
  
  cat("Your favorite fish to catch is", fishType, "\nYour biggest fish caught was"
  ,fish1, "inches \nYour second biggest fish caught was", fish2,"inches"); #SKILL 5,6
  
  if(fishType != "Steelhead") #Skill 7
  {
    cat("\nSteelhead are my favorite fish to catch");
  }
  else if (fishType == "Walleye") #Skill 7,8,9
  {
    cat("\nWalleye are fun to catch");
  }
  else #Skill 10
  {
    cat("I haven't heard of that kind of fish");
  }
  if(fish1 <= 27) #skill 7
  {
    cat("\nnice fish bud");
  }
  if (fish2 > 28) #skill 7
  {
    cat("\nNot your biggest catch but still a nice fish");
  }
  if (fish1 >=30 && fishType == "Steelhead") #Skill 13
  {
    cat("\nThat's the fish I've been dreaming of"); #Skill 11
  }
  if (fish1 < 26) #skill 7
  {
    cat("\nthat beats my personal best");
  }
  if (fish1 >=30 || fish2 >=30) #skill 7,12
  {
    cat("\nAre you sure the fish was that big?");
  }
}

