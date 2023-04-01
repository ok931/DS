rm(list=ls())
library(ISLR)
data(package="ISLR")
data <- Carseats
head(data)         #First few rows for each column of the data
library(tree)
require(tree)
names(data)
hist(data$Sales)
#creating Sales_bin based on the Sales variable
data$Sales_bin <- as.factor(ifelse(data$Sales >= 8, "yes", "no"))
#droping the original Sales variable
data$Sales = NULL
#Take a look at the data
head(data)
set.seed(200)
#Developing the model
train_m <- sample(1: nrow(data), nrow(data)*0.70)
#Making the split
Train_data <- data[train_m,] 
Test_data <- data[-train_m,]
rm(data, train_m)
head(Train_data)
head(Test_data)
Des_tree_model <- tree(Sales_bin~., Train_data)
plot(Des_tree_model)
text(Des_tree_model, pretty = 0)
#Using the model on testing dataset to check how good it is going
Pred_tree <- predict(Des_tree_model, Test_data, type = "class")
mean(Pred_tree != Test_data$Sales_bin)
