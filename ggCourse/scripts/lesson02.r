{
  source(file="scripts/reference.r");  ## pulls in script "reference.r", including ggplot functions
  packageData=read.csv(file="data/CRANpackages.csv");## pulls in .csv data
  
  plotData = ggplot(data=packageData) + ## ggplot function needs data
             geom_point(mapping=aes(x=Date , y=Packages)) + ## geom_point is scatter needs coordinates
             ggtitle(label= " Packages in CRAN (2001-2014) ") + 
             scale_y_continuous(breaks = seq(from=0 , to=6000, by=500))+
             theme(axis.text.x = element_text(angle=90, hjust=1)); ##theme, edits graph elements like axis text
                                                                   ##hjust (1) moves right of center
  plot(plotData);
}