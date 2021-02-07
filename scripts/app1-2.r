{
  rm(list=ls());
  options(show.error.locations = TRUE);
##create variables
total_catch_northport = 1000;
total_catch_southport =500;
days_fished_northport =8;
days_fished_southport =10;
##calculate average catch per day for both ports
average_catch_per_day_northport = total_catch_northport/days_fished_northport;
average_catch_per_day_southport = total_catch_southport/days_fished_southport;
##calculate catch per day for both ports
catch_per_day_bothports= average_catch_per_day_northport+average_catch_per_day_southport;
}