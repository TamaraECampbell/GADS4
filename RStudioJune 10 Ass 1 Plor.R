# Source data: https://nycopendata.socrata.com/Statistics/Historical-and-Projected-New-York-City-Population-/aa3c-n969
getwd()
list.files()
d <- read.csv('Test CHR Historical_and_Projected_New_York_City_Population_by_Boroughs.csv', as.is=T)
str(d)
e <- d[1:14,]
e
e[,2:6] <- lapply(e[,2:6], function(x) {as.numeric(gsub(",","",x))})
str(e)
boropopmelt <- melt.data.frame(e, id="Year")
boropopmelt
str(boropopmelt)
names(boropopmelt)[2]<-paste("Borough")
names(boropopmelt)[3]<-paste("Population")
head(boropopmelt)
p <- ggplot(boropopmelt, aes(Year, Population, color=Borough)) + geom_point()
p
p + geom_line()
p + geom_line() + scale_x_continuous(breaks = seq(1910, 2030, 10)) + scale_y_continuous(breaks = seq(0, 3100000, 100000)) + ggtitle("NYC Population by Borough: Historical 1910-2000, Projected 2010-2030")
