#Use dplyr 
library(dslabs)
library(dplyr)
data("murders")

#"Redifine" data that will have more column (rateの列を追加するため)
murders_1 <- mutate(murders, rate = (total/population)*100000 )
murders_1

# use rank by the rate
rate = (murders$total/murders$population)*100000
murders_2 <- mutate(murders_1, rank = rank(-rate))
murders_2

# use select to show only topic we want
select(murders_2,state,rank,rate)


#filter
filter(murders_2,population < 900000,rank <= 3)

#filter_2
no_west <- filter(murders_2,region != "West")
#find row
nrow(no_west)


#use %in%
murders_nw <- filter(murders,region %in% c("Northeast","West"))
#find row
nrow(murders_nw)

#ADD MORE CLOUMN use mutate thaen make table for specific topic , | = or
my_states <- filter(murders_2,region == "Northeast" & rate < 1 | region =="West" & rate < 1)
#select only topic we want
select(my_states,state,rate,rank)

#use pipe %>%
#same as the code above but easier to write
filter(murders_2, region %in% c("Northeast", "West") & rate <1 ) %>% 
  select(state,rate,rank)

#creat everthings from start
modnajra_state <- murders %>% 
  mutate(rate = total/population * 100000, rank =rank(-rate)) %>% 
  filter(region %in% c("Northeast","West") & rate < 1) %>% 
  select(state,rate,rank)
modnajra_state

