library(tidyverse)
library(ggplot2)
library(readr)
library(mice)



titles <- read_csv("titles.csv")


##########Exploring Date #########################

print(head(titles))


str(titles)


# converting title to a factor type
titles$type<-as.factor(titles$type)


#checking for nulls in the data 

summary(titles)


#using histogram  to show the distribution of two variables



titles_year_dt<-titles%>%group_by(release_year)%>%summarise(number=n())


titles_year_dt%>%ggplot()+
    geom_col(aes(release_year,number,colour=release_year)) + ggtitle("Number of Movies per year")+
    labs(x="year" , y="number") + theme_bw() 
