library(tidyverse)
library(plotly)


library(readxl)
WTL_data <- read_excel("WTL-Data-201920-(20210419)-v1.03.xlsx", 
                       sheet = "Data")


# not sure I understand R data types, but I saw an example...
# where if you put column names with protected character, like -
# into a string, it can't be used... but with sym data type, it works.

colx <- sym('CAN1920-PRES01C')
coly <- sym('ENDPRES1920I')

# take the data i loaded in excel using import dataset - need to save this code somewhere, or sort for loading in Shinyapps.io


# This gets a big list of indicator names. 
cols <- distinct(WTL_data,`Indicator Name`)