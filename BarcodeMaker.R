library(ggplot2)
library(stringr)
library(tidyverse)
library(baRcodeR)

data <- read.csv(paste0('Data/', list.files('Data')))

  data <- data %>% 
    mutate(brand = str_extract(Title, "^[^\\s]+\\s*"),
           Title = str_remove(Title, "^[^\\s]+\\s*")
           )
   
   
custom_create_PDF( name = 'LibrarikaLabels',
                   Labels = data$Accession.No,
                   type = 'linear2',
                   alt_text = paste(data$brand, "\n", data$Title,'\n','ID:',data$Accession.No),
                   page_width = 2,
                   page_height = 2,
                  numcol = 1, 
                   replace_label = TRUE, 
                   numrow = 1,
                   trunc = FALSE,
                  height_margin = .2,
                  Fsz = 9.5,
                  denote = "")

