{
  source(file="scripts/reference.R");
  weatherData = read.csv(file="data/LansingNOAA2016.csv", 
                         stringsAsFactors = FALSE);
  plotData= ggplot(data=weatherData) + 
            geom_point(mapping= aes( x=avgTemp , y=relHum ),
                       color= "darkgreen",
                       size = 2.5 ,   
                       shape= 17,
                       alpha=0.4) + ## 40 percent opaque
            theme_bw() +
    
            labs(title = "Humidity Vs.Temperature" ,
                 subtitle="Lansing, Michigan 2016" ,
                 x= "Average Temperature (F)",
                 y=  "Relative Humidity (%)") +
    
            theme(axis.title.x = element_text(size=14, color="orangered2"),
                  axis.text.y = element_text(size= 14, color="orangered4"),
                  plot.title=element_text(size=18, face="bold", 
                                          color ="darkblue"),
                  plot.subtitle=element_text(size=10, face="bold.italic", 
                                             color ="brown", family="serif"))+
    
            geom_smooth(mapping=aes(x=avgTemp, y=relHum), method="lm");
  
  plot(plotData);
}