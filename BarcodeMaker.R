library(ggplot2)
library(stringr)
library(tidyverse)

data <- read.csv(paste0('Data/', list.files('Data')))

   
   
   
custom_create_PDF( name = 'LibrarikaLabels',
                   Labels = data$Accession.No,
                   type = 'linear',
                   alt_text = paste(data$Title,'\n',data$Accession.No),
                   page_width = 2,
                   page_height = 1.5,
                  numcol = 1, 
                   replace_label = TRUE, 
                   numrow = 1,
                   trunc = FALSE,
                  height_margin = .2,
                  Fsz = 7)

