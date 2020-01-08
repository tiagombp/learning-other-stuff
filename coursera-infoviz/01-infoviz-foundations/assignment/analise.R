library(tidyverse)
library(lubridate)
library(RColorBrewer)
library(readr)
library(extrafont)
loadfonts()

dados <- read_csv("DOHMH_New_York_City_Restaurant_Inspection_Results.csv", 
                  col_types = cols(`INSPECTION DATE` = col_date(format = "%m/%d/%Y"), 
                                   `RECORD DATE` = col_date(format = "%m/%d/%Y"),
                                   ZIPCODE = col_character()))



# Question 1 --------------------------------------------------------------

# Question 1: How does the number of inspections change over time (use month as the level of temporal granularity)? Does the number of inspections increase or decreate over time? Are there any peak times? Is there any seasonal effect (like inspections being more common during cretain seasons or months)?

q1 <- dados %>%
  mutate(mes = month(`INSPECTION DATE`),
         ano = year(`INSPECTION DATE`),
         data_agregada = as.Date(paste(ano, mes, "01", sep = "-"))) %>%
  filter(ano > 1900 & ano < 2020)

q1_1 <- q1 %>%
  count(data_agregada)

ggplot(q1_1, aes(x = data_agregada, y = n)) +
  geom_line() +
  scale_x_date(date_labels = "%Y %b", date_breaks = "1 year") + theme_minimal()

# não era o desejado, mas ficou bonito
ggplot(q1_1, aes(x = month(data_agregada), y = n, color = year(data_agregada))) +
  geom_line() +
  coord_polar()

ggplot(q1_1, aes(x = month(data_agregada), y = n, group = year(data_agregada), color = year(data_agregada))) +
  geom_line() +
  coord_polar()

q1_2 <- q1 %>%
  count(mes)

ggplot(q1_2, aes(mes, n)) + geom_col()
  

# Question 2: Is there any difference in how the number of inspections changes over time in the 5 different boroughs of New York City?

q2 <- q1 %>%
  group_by(BORO) %>%
  count(data_agregada)

ggplot(q2, aes(x = data_agregada, y = n)) +
  geom_line() + 
  facet_wrap(~BORO, scales = "free") + 
  theme_minimal()
