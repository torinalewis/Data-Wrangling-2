#save the data file into your working directory
# use if your need to know your working directory
getwd()


#0: Load the data in RStudio.  The data is in springboard.


# use if your need to know your working directory
getwd()

#start coding here
# type in your working directory
setwd("C:/Users/Torina/Documents/Emory")

#load packages you may need to install the packages (google install plyr package, etc.)
library("plyr")
library("dplyr")
library("tidyr")



#1 this code rplaced blanked spots with 1
titanic_original <- read.csv("titanic_original.csv")
titanic_new <- titanic_original %>% 
  mutate(embarked = ifelse(grepl(" ", embarked, ignore.case = TRUE), "S", embarked)) %>%
  replace_na(list(embarked = "S"))

#Used to replace numbers with original letters
titanic_new$embarked<-replace(titanic_new$embarked,titanic_new$embarked==1,"S" )
titanic_new$embarked<-replace(titanic_new$embarked,titanic_new$embarked==4,"S" )
titanic_new$embarked<-replace(titanic_new$embarked,titanic_new$embarked==2,"C" )

#2
titanic_new %>% 
  summarise(avg_age = mean(age, na.rm = TRUE))

#3
titanic_new <- titanic_new %>% 
  mutate(boat = ifelse(grepl(" ", boat, ignore.case = TRUE), "NA", boat)) %>%
  replace_na(list(embarked = "Na"))

titanic_new$boat<-replace(titanic_new$boat,titanic_new$boat==1,"NA" )

#4 this code is not returning the secifiy result (can someone help with this)
titanic_new <- titanic_new %>% 
  mutate(has_cabin_number = ifelse(grepl(" ", cabin), 0, 1))
