library(readr)

# Populations by province and Age
PopProvAge <- read_delim("PopXProvincesXAge.csv", delim = ";", 
                         locale = locale(grouping_mark = "."),)

PopProvAge <- as.data.frame(PopProvAge[,c(1,4,6)]) #only keep relevant columns
PopProvAge[,1] <- factor(PopProvAge[,1],levels=unique(PopProvAge[,1]))
PopProvAge[,2] <- factor(PopProvAge[,2],levels=PopProvAge[1:21,2])

PopProvAges <- matrix(PopProvAge[,3],nrow=21)
colnames(PopProvAges) <- levels(PopProvAge[,1])
rownames(PopProvAges) <- levels(PopProvAge[,2])

PopAges<-apply(PopProvAges,1,sum)

# Mortality by age (whole Spain)
MortAge <- read_delim("MortalityXAge.csv", delim = ";", 
                         locale = locale(grouping_mark = "."),)

MortAge <- as.data.frame(MortAge[,c(1,3,4)])
MortAge[,1] <- factor(MortAge[,1],levels = unique(MortAge[,1]))
MortAge[,2] <- factor(MortAge[,2],levels = MortAge[1:21,2])

MortAges <- matrix(MortAge[,3],nrow=21)
colnames(MortAges) <- levels(MortAge[,1])
rownames(MortAges) <- levels(MortAge[,2])

# Homogenize age groups in mortality and population data sets
PopProvAges<-rbind(PopProvAges[1:19,],PopProvAges[20,]+PopProvAges[21,])
rownames(PopProvAges)[20] <- "95 años y más"
PopAges <- apply(PopProvAges,1,sum)

MortAges <- rbind(MortAges[1,]+MortAges[2,],MortAges[3:21,])
rownames(MortAges)[1] <- "De 0 a 4 años"

# Calculation of the expected cases
RatesAges <- apply(MortAges,2,function(x) x/PopAges)
Expected <- t(PopProvAges)%*%RatesAges
#save(Expected,file="c:/kk/Expected.Rdata")

