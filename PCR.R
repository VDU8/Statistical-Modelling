library(tidyverse)
install.packages('pls')
library(pls)
library(dplyr)

data_df = read.csv("C:\\Users\\VDU\\Desktop\\train.csv")
head(data_df)
str(data_df)
boxplot(data)
table(is.na(data_df))
set.seed(123)

data_df <- na.omit(data_df)
model <- pcr(Y1~X8+X7+X6+X5+X4+X3+X2+ï..X1, data=data_df, scale=TRUE, validation="CV")

summary(model)

train <- data_df[1:375, c("Y1", "X8", "X7", "X6","X5", "X4", "X3", "X2", "ï..X1")]
y_test <- data_df[376:nrow(data_df), c("Y1")]
summary(y_test)

test <- data_df[376:nrow(data_df), c("X8", "X7", "X6","X5", "X4", "X3", "X2", "ï..X1")]


model_result <- pcr(Y1~X2+X3+X5+X6+X7+X8, data=data_df, scale=TRUE, validation="CV")
pred <- predict(model_result, test, ncomp=6)

rsq <- function (y_t,pr){
  cor(y_t,pr)^2
}
R2 = rsq(y_test,pred)

print(R2)

summary(pred)
sqrt(mean((pred - y_test)^2))

validationplot(model)
validationplot(model, val.type="MSEP")
validationplot(model, val.type="R2")
