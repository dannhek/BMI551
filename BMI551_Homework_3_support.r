library(Hmisc)
library(knitr)

probability_range <- seq(0.100,0.700,0.001) 
possible_bounds <- data.frame(
      P = probability_range
      ,`P(k=0)` = round(dbinom(0,20,probability_range),6)
      ,`P(k=1)` = round(dbinom(1,20,probability_range),6)
      ,`P(k=2)` = round(dbinom(2,20,probability_range),6)
      ,`P(k=3)` = round(dbinom(3,20,probability_range),6)
      ,`P(k=4)` = round(dbinom(4,20,probability_range),6)
      ,`P(k=5)` = round(dbinom(5,20,probability_range),6)
) 
names(possible_bounds)<-c('possible_pi','P(k=0)','P(k=1)','P(k=2)','P(k=3)','P(k=4)','P(k=5)')
possible_bounds$`P(k<=1)` <- possible_bounds$`P(k=0)` + possible_bounds$`P(k=1)`
possible_bounds$`P(k<=2)` <- possible_bounds$`P(k=0)` + possible_bounds$`P(k=1)` + possible_bounds$`P(k=2)`
possible_bounds$`P(k<=3)` <- possible_bounds$`P(k=0)` + possible_bounds$`P(k=1)` + possible_bounds$`P(k=2)` 
                              + possible_bounds$`P(k=3)` 
possible_bounds$`P(k<=4)` <- possible_bounds$`P(k=0)` + possible_bounds$`P(k=1)` + possible_bounds$`P(k=2)` 
                              + possible_bounds$`P(k=3)` + possible_bounds$`P(k=4)` 
possible_bounds$`P(k<=5)` <- possible_bounds$`P(k=0)` + possible_bounds$`P(k=1)` + possible_bounds$`P(k=2)` 
                              + possible_bounds$`P(k=3)` + possible_bounds$`P(k=4)` + possible_bounds$`P(k=5)`  
kable(possible_bounds)