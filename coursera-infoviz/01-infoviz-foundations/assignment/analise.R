library(tidyverse)
library(RColorBrewer)
library(readr)

dados <- read_csv("DOHMH_New_York_City_Restaurant_Inspection_Results.csv", 
                  col_types = cols(`INSPECTION DATE` = col_date(format = "%m/%d/%Y"), 
                                   `RECORD DATE` = col_date(format = "%m/%d/%Y"),
                                   ZIPCODE = col_character()))

