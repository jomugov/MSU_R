{
  source(file="scripts/reference.r");
  weatherData1=read.csv(file="data/LansingNOAA2016.csv" ,
                        stringsAsFactors = FALSE);
  windTempPlot = ggplot(data=weatherData1) +
                 geom_point(mapping = aes(x=windSpeed, y=abs(tempDept)),
                            color = rgb(red=0,green=0,blue=1),
                            size = 2, 
                            shape =18,
                            alpha = 0.7) +
  geom_smooth(mapping=aes(x=windSpeed, y=abs(tempDept)),
              method="lm",
              color="red", 
              size=1, 
              linetype=4, 
              fill="grey") +
    
    labs(title = "Windspeed Vs. Average Temperature Deviation" ,
         subtitle="Lansing, Michigan 2016" ,
         x= "Average Windspeed ",
         y=  "Average Temperature Deviation") +
    
    theme(axis.title.x = element_text(size=14, color="orangered2", face = "bold"), ##edit x axis tile size and color
          axis.title.y = element_text(size= 14, color="orangered2"),##edit y axis title size color 
          axis.text.y = element_text(angle=45), ##edit axis scale angle
          plot.title=element_text(size=18, face="bold", ##edit plot title text size, bold and color
                                  color ="darkblue"),
          plot.subtitle=element_text(size=10, face="bold.italic", 
                                     color ="brown", family="serif")) ##edit plot subtitle text size, color, bold and font
    ##a positive regression slope represents some correlation between temperature change and wind speed
    ## calculating an R value will determine the strength of that correlation
  
  plot(windTempPlot)
}