{ rm(list = ls());
  options(show.error.locations=TRUE);
  location=readline("what is your location");
  temp1 = readline("what is the high temp today?");
 temp1= as.numeric(temp1);
 temp2=readline("what was the high temp yesterday?");
 temp2=as.numeric(temp2);
 temp3=readline("what was the high temp 2 days ago?");
 temp3=as.numeric(temp3);
 temp4=readline("what was the high temp 3 days ago?");
 temp4=as.numeric(temp4);
 temp5=readline("what was the high temp 4 days ago?");
 temp5=as.numeric(temp5);
 
 averagetemp= (temp5+temp4+temp3+temp2+temp1)/5
}
