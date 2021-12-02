{
  source(file="scripts/reference.r");
  accDeath= read.csv(file="data/accdeaths.csv");
  
  deathPlot= ggplot(data=accDeath) +
             geom_point(mapping=aes(x=time, y=value)) +
             ggtitle(label= "Accidental Deaths in the U.S (1973-1978)")+
                            xlab("Date")+ ylab("Number of Deaths") +
             theme(axis.text.x = element_text(angle=45, hjust=1))+
             scale_x_continuous(breaks = seq(from=1973, to=1978, by=0.5))+
             scale_y_continuous(breaks = seq(from=7000, to=11000, by=2000));
             
  plot(deathPlot);
  
}