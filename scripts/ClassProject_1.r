{
  rm(list=ls()); options(show.error.messages = TRUE);
  a=(5+8)/(4^2); #Skill 1,2,3
  fishType=readline("What type of fish is your favorite to catch?");#Skill 4
  fish1=readline("How long was your biggest fish (inches)?");
  fish1=as.numeric(fish1);
  fish2=readline("How long was your second biggest fish (inches)?");
  fish2=as.numeric(fish2);
  
  cat("Your favorite fish to catch is", fishType, "\nYour biggest fish caught was"
  ,fish1, "inches \nYour second biggest fish caught was", fish2,"inches"); #SKILL 5,6
  
  if(fishType == "Steelhead") #Skill 7  ## if fishType is Steelhead the cat() response is given
  {
    cat("\nSteelhead are my favorite fish to catch")
  }
  else
  {
    cat("\nAll fish lives matter");#skill 10 ## else can act like an error condition if fishtype is not steelhead 
  }
  if (fishType != "Walleye") #Skill 7 ## use of conditional operator
  {
    cat("\nHave you tried fishing Walleye?");
  }
  
  if(fish1 <= 27) #skill 7 ## use of conditional operator
  {
    cat("\nnice fish bud");
  }
  if (fish1 >=30 || fish2 >30 && fishType == "Steelhead") #Skill 7,11,12, 13 ## if fish1 or fish2 meet the condition and the fish type is steelhead
  {
    cat("\nThat's the fish I've been dreaming of\nAre you sure the fish was that big?"); 
  }
  else if (fish1 < 26) #skill 7,9 ##use of else if and conditional operator
  {
    cat("\nYou can catch bigger fish than that");
  }
 
}

