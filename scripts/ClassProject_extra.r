fishData=fishData %>% mutate(logw=log(Weight_grams),logl=log(Total_Length_mm));

walleyeData=filter(fishData, Species_Name == "Walleye");
walleymax=max(walleyeData$Total_Length_mm)

waelogplot= ggplot( data=walleyeData, aes(x=logl, y = logw)) + 
  geom_point(color="blue")
print(waelogplot)

speciesMaxlength=function (species, lengthData)
{
  species=fishData$Species_Name
  wae=which(species == "Walleye")
  WaeLength=Total_Length_mm[wae]
  waeLengthVec=length(WaeLength)
  
  for( i in 1:waeLengthVec)
  {
    maxLength=0
    
    if(Species_Name == "Walleye")
    {
      maxLength=max(WaeLength)
    }
  }
  return(speciesMaxLength)
}

walleyeMaxLength=speciesMaxlength("Walleye")


convertLength = function (mm)
{
  mmToIn = mm / 25.4
}
return(mmToIn)
  
  