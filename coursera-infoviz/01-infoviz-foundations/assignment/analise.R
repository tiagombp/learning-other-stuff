library(tidyverse)
library(lubridate)
library(RColorBrewer)
library(readr)
library(extrafont)
library(sf)
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

q1_plot2a <- ggplot(q1_1, aes(x = month(data_agregada), y = n, group = as.factor(year(data_agregada)), color = as.factor(year(data_agregada)))) +
  geom_line() +
  scale_x_continuous(labels = month.abb, breaks = 1:12) +
  scale_y_continuous(labels = function(x){format(x, big.mark = ",")}) +
  scale_color_brewer(palette = "Blues") +
  coord_polar() + 
  labs(title = "Number of inspections by month", y = NULL, x = NULL, color = "Year") +
  tema()

ggsave(q1_plot2a, file = "q1_plot2a.png", type = "cairo", width = 6, height = 5)  

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


# Question 2 --------------------------------------------------------------

# Question 2: Is there any difference in how the number of inspections changes over time in the 5 different boroughs of New York City?

q2 <- q1 %>%
  filter(BORO != "0") %>%
  group_by(BORO)

q2_1 <- q2 %>%
  count(data_agregada)

q2_plot1 <- ggplot(q2_1, aes(x = data_agregada, y = n, color = BORO)) +
  geom_line(size = 1) + 
  scale_y_continuous(labels = function(x){format(x, big.mark = ",")}) +
  scale_color_brewer(palette = "Set2") +
  facet_wrap(~BORO, scales = "free") + 
  labs(x = NULL, y = NULL, title = "Number of inspections over the years", subtitle = "By Borough") +
  tema() + theme(legend.position = "none")

ggsave(q2_plot1, file = "q2_plot1.png", type = "cairo", width = 6, height = 4.5) 

q2_plot1a <- ggplot(q2_1, aes(x = data_agregada, y = n, color = BORO)) +
  geom_line(size = 1) + 
  scale_y_continuous(labels = function(x){format(x, big.mark = ",")}) +
  scale_color_brewer(palette = "Set2") +
  labs(x = NULL, y = NULL, title = "Number of inspections over the years", subtitle = "By Borough", color = NULL) +
  tema() + theme(legend.position = "bottom")

ggsave(q2_plot1a, file = "q2_plot1a.png", type = "cairo", width = 6, height = 4) 

q2_2 <- q2_1 %>%
  ungroup() %>%
  filter(data_agregada > "2016-01-01") %>%
  group_by(data_agregada) %>%
  mutate(total_data = sum(n),
         pct = n / total_data)

q2_plot2 <- ggplot(q2_2, aes(x = data_agregada, y = pct, fill = BORO)) + 
  geom_area() +
  labs(x = NULL, y = NULL, title = "Distribution of the number of inspections by Borough", subtitle = "From 2016 onwards", fill = NULL) +
  scale_fill_brewer(palette = "Set2") +
  scale_y_continuous(labels = scales::percent) +
  tema() + theme(legend.position = "bottom")

ggsave(q2_plot2, file = "q2_plot2.png", type = "cairo", width = 6, height = 4.5) 
  
  

# Question 3 --------------------------------------------------------------

# Question 3: How are cuisines types distributed across the New York area? Are there geographical areas where certain cuisines tend to concentrate (that is are there any areas where certain cuisines are more prevalent than others)? NOTE: focus only on the top 5 most frequent “Cuisine Description” categories.

# top 5 cuisines

top5_cuisines <- q1 %>%
  count(`CUISINE DESCRIPTION`) %>%
  arrange(desc(n)) %>%
  filter(row_number()<=5) %>%
  select(`CUISINE DESCRIPTION`) %>%
  .[[1]]

# many restaurants are inspected more than once:
# q1 %>%
#   filter(`CUISINE DESCRIPTION` %in% top5_cuisines) %>%
#   filter(Latitude != 0, Longitude != 0) %>%
#   group_by(CAMIS) %>%
#   count() %>%
#   arrange(desc(n))


q3 <- q1 %>%
  filter(`CUISINE DESCRIPTION` %in% top5_cuisines) %>%
  filter(Latitude != 0, Longitude != 0) %>%
  group_by(CAMIS, `CUISINE DESCRIPTION`, Latitude, Longitude, BORO) %>%
  summarise(first(CAMIS)) %>% # para só pegar a primeira ocorrencia do restaurante
  ungroup() %>%
  select(`CUISINE DESCRIPTION`, Latitude, Longitude, BORO) %>%
  mutate(`CUISINE DESCRIPTION` = ifelse(`CUISINE DESCRIPTION` == "Latin (Cuban, Dominican, Puerto Rican, South & Central American)",
                                        "Latin (Cuban, Dominican, Puerto Rican,\n South & Central American)", 
                                        `CUISINE DESCRIPTION`))

boros <- sf::read_sf("./shapefiles/geo_export_dbc37508-1a74-4f9e-943b-53c8626577c3.shp")

# ggplot(boros) +
#   geom_sf() +
#   geom_point(data = q3, aes(x = Latitude, y = Longitude)) +
#   coord_sf(xlim = c(min(q3$Latitude),max(q3$Latitude)),
#            ylim = c(min(q3$Longitude),max(q3$Longitude)))

q3_sf <- st_as_sf(q3, coords = c("Longitude", "Latitude"))
st_crs(q3_sf) <- 4326

q3_plot <- ggplot() +
  geom_sf(data = boros, color = "ghostwhite") +
  geom_sf(data = q3_sf, aes(color = `CUISINE DESCRIPTION`), alpha = 0.5, size = 1) +
  labs(title = "Inspections by cuisine in NYC area", color = NULL,
       subtitle = "Only top 5 cuisines shown") +
  facet_wrap(~`CUISINE DESCRIPTION`) +
  tema() + theme(axis.text = element_blank(),
                 axis.ticks = element_blank(),
                 legend.position = "none")

ggsave(q3_plot, file = "q3_plot.png", type = "cairo", width = 9.5, height = 6, dpi = 300) 

    