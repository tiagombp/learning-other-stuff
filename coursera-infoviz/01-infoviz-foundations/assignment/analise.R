library(tidyverse)
library(lubridate)
library(RColorBrewer)
library(readr)
library(extrafont)
loadfonts()

tema <- function(){
  theme_minimal() +
  theme(text = element_text(family = "Source Sans Pro", color = "#333333"),
        title = element_text(size = 10, color = "#111111"),
        plot.subtitle = element_text(color = "#333333"),
        panel.grid = element_blank(),
        axis.ticks = element_line(color = "#333333", size = 0.5))
}

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

q1_plot1 <- ggplot(q1_1, aes(x = data_agregada, y = n)) +
  geom_line(size = 1, color = "steelblue") +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") + 
  scale_y_continuous(labels = function(x){format(x, big.mark = ",")}) +
  labs(title = "Number of food inspections over time",
       subtitle = "The number of inspections increased sharply after 2016",
       x = NULL, y = NULL) +
  tema()

ggsave(q1_plot1, file = "q1_plot1.png", type = "cairo", width = 6, height = 3.5)

# não era o desejado, mas ficou bonito
ggplot(q1_1, aes(x = month(data_agregada), y = n, color = year(data_agregada))) +
  geom_line() +
  coord_polar() +
  tema()

ggplot(q1_1, aes(x = month(data_agregada), y = n, group = year(data_agregada), color = year(data_agregada))) +
  geom_line() +
  scale_x_continuous(labels = month.abb, breaks = 1:12) +
  coord_polar() + 
  tema()

q1_2 <- q1 %>%
  count(mes) %>%
  mutate(nome_mes = month.abb[mes],
         nome_mes = factor(nome_mes, levels = month.abb))

media <- mean(q1_2$n)

q1_plot2 <- ggplot(q1_2, aes(nome_mes, n)) + 
  geom_col(aes(fill = n > media), width = .75) +
  geom_hline(yintercept = media, linetype = "dashed") +
  annotate("text", y = media, x = 1, vjust = -0.5, fontface = "italic",
           label = "Average", family = "Source Sans Pro", size = 3.5) +
  scale_y_continuous(labels = function(x){format(x, big.mark = ",")}) +
  scale_fill_manual(values = c("TRUE" = "steelblue", "FALSE" = "lightsteelblue"),
                    labels = c("TRUE" = "Above average", "FALSE" = "Below average")) +
  labs(x = NULL, y = NULL, fill = NULL, title = "Total number of inspections by month") +
  tema() + theme(legend.position = "bottom")

ggsave(q1_plot2, file = "q1_plot2.png", type = "cairo", width = 6, height = 4.5)  

# Question 2: Is there any difference in how the number of inspections changes over time in the 5 different boroughs of New York City?

q2 <- q1 %>%
  filter(BORO != "0") %>%
  group_by(BORO)

q2_1 <- q2 %>%
  count(data_agregada)

ggplot(q2_1, aes(x = data_agregada, y = n)) +
  geom_line() + 
  facet_wrap(~BORO, scales = "free") + 

ggplot(q2_1, aes(x = data_agregada, y = n, color = BORO)) +
  geom_line()

q2_2 <- q2_1 %>%
  ungroup() %>%
  filter(data_agregada > "2016-01-01") %>%
  group_by(data_agregada) %>%
  mutate(total_data = sum(n),
         pct = n / total_data)

ggplot(q2_2, aes(x = data_agregada, y = pct, fill = BORO)) + 
  geom_area()

sf::  
  
  
