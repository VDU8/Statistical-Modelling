install.packages('rstanarm')
install.packages('performance')
install.packages('see')
install.packages('BayesPostEst')
install.packages('ggeffects')
install.packages('wooldridge')
library(tidyverse)
library(performance)
library(see)
library(bayesplot)
library(bayestestR)
library(ggeffects)
library(BayesPostEst)
library(wooldridge)
library(rstanarm)

data_df = read.csv("C:\\Users\\VDU\\Desktop\\train.csv")
head(data)
str(data)
boxplot(data)
table(is.na(data))

#Test and Train 

data_df <- na.omit(data_df) 

m1 <- stan_glm(Y1 ~ ï..X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8,
               prior = normal(),
               prior_intercept = normal(),
               data = data_df)
summary(m1)
plot(estimate_density(m1))

