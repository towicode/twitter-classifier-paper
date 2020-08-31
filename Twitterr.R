# Title     : TODO
# Objective : TODO
# Created by: toddw
# Created on: 8/29/2020

install.packages("C50")
install.packages("pROC")
library(animation)
library(C50)
library(pROC)
library(e1071)


setwd("C:/Users/toddw/datamining/twitter")

users <- read.csv("output.csv", header=TRUE, colClasses=c(
'factor',
'integer',
'integer',
'integer',
'integer',
'integer',
'factor',
'factor',
'factor',
'factor',
'factor',
'factor',
'factor',
'factor'
))

#lapply(users,class)

#str(users)


bots <- users[users$bot=='YES',]
#barplot((table(bots$created_at)), ylim = c(0, 200), border="#69b3a2", col="white")

real <- users[users$bot=='NO',]

#barplot((table(real$created_at)), col=rgb(0.2,0.4,0.6,0.6), ylim = c(0, 200))


#size <- floor(0.85 * nrow(users))
#training_index <- sample(nrow(users), size = size, replace = FALSE)
#train <- users[training_index,]
#test <- users[-training_index,]
#
#users <- subset(users, select=-c(lang,created_at))
##get rid of
#var_names <- names(users)[-12]
#dt <- C5.0(x = train[,var_names], y = train$bot)
#
#dt_pred <- predict(dt, newdata = test)
#dt_evaluation <- cbind(test, dt_pred)
#dt_evaluation$correct <- ifelse(dt_evaluation$bot == dt_evaluation$dt_pred, 1, 0)
#
#sum(dt_evaluation$correct) / nrow(dt_evaluation)
#table(dt_evaluation$bot, dt_evaluation$dt_pred)
#
#dt_precision <- sum(dt_evaluation$bot == 'YES' & dt_evaluation$dt_pred == 'YES') / sum(dt_evaluation$dt_pred == 'YES')
#dt_recall <- sum(dt_evaluation$bot == 'YES' & dt_evaluation$dt_pred == 'YES') / sum(dt_evaluation$bot == 'YES')
#
#dt_precision
#dt_recall

#users <- subset(users, select=-c(lang,created_at))
#
#size <- floor(0.85 * nrow(users))
#training_index <- sample(nrow(users), size = size, replace = FALSE)
#train <- users[training_index,]
#test <- users[-training_index,]
#
#data.model <- naiveBayes(bot ~ ., data = train)
#data.predict <- predict(data.model, test, type='class')
#results <- data.frame(actual = test[,'bot'], predicted=data.predict)
#data.model
#table(results)


kmeans.totwithinss.k <- function(dataset, number_of_centers){
  km <- kmeans(dataset, number_of_centers)
  km$tot.withinss
}


#kmeans.totwithinss.k(nor_iris, 3)
#kmeans.totwithinss.k(nor_iris, 5)

kmeans.distortion <- function(dataset, maxk){
  vec <- as.vector(1:maxk)
  vec[1:maxk] <- sapply(1:maxk, kmeans.totwithinss.k, dataset = dataset)
  vec
  return(vec)
}

#

norm_users <- users[,c(2,3,5,6)]



maxk <- 10
dis_vt <- kmeans.distortion(norm_users, maxk)
plot(1:maxk,
     dis_vt,
     type = 'b',
     col ="blue",
     xlab = "number of clusters",
     ylab = "Distortion")

#num_cluster <- 3
#result <- kmeans.ani(norm_users, num_cluster)

kmeans(norm_users, centers=4)

