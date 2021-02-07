{rm(list=ls()); options(show.error.messages = TRUE);
  grade=readline("what is your grade");
  
  if (grade == "A" || grade=="a")
  {
    cat ( "90-100");
  }
  else if (grade== "B" || grade=="b")
  {
    cat ("80-90");
  }
  else if (grade == "C" || grade=="b")
  {
    cat ("70-80");
  }
  else if (grade == "D" || grade =="d")
  {
    cat ("60-70");
  }
  else if (grade == "E"|| grade == "e")
  {
    cat ("50-60");
  }
  else
  {
    cat("error")
  }
}