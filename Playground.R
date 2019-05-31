

# rbind() to combine rows to data.frame
# cbind() to combine by columnsn to data.frame,
#   or add a single column as df$NewCol=c(...)

# str(df) to see structure of data.frame
# summary(df) to get summary stats on each field of df

# subset(df, field == "Value")
# tapply applies function to each member
#
# PLOTTING SUMMARY STATISTICS
# hist
# boxplot (yvar ~ xvar)
# table()
#
#
#
#
# write.csv(df,"filename.csv") write to CSV file
#
# rm(list = ls()) --- when done, clears most vars
#





#First Set of Countries
Country = c("Brazil","China","India","Switzerland","USA")
LifeExpectancy = c(74,76,65,83,79)
CountryData = data.frame(Country,LifeExpectancy)
CountryData$Population = c(199000,1390000,1240000,7997,318000)

#Second Set of Countries
Country=c("Australia","Greece")
LifeExpectancy=c(82,81)
Population=c(23050,11125)
NewCountryData=data.frame(Country, LifeExpectancy, Population)

#Combined Set of Countries
AllcountryData=rbind(CountryData,NewCountryData)



