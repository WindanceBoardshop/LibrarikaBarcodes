library(ggplot2)
library(stringr)
library(tidyverse)
library(baRcodeR)
library(pdftools)

data <- read.csv(paste0('Data/', list.files('Data')))

  data <- data %>% 
    mutate(brand = str_to_title(str_extract(Title, "^[^\\s]+\\s*")),
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

# Make a booklet of products grouped by Brand

# this makes a df for each brand
brand_df <- data %>% 
  split(.$brand)


# this makes the labels for each brand


custom_create_PDF( name ='LibrarikaBooklet',
                   Labels = data$Accession.No,
                   type = 'linear2',
                   alt_text = paste(data$brand, '\n',data$Title,'\n','ID:',data$Accession.No,'\n'),
                   page_width = 8.5,
                   page_height = 11,
                   numcol = 3, 
                   replace_label = TRUE, 
                   numrow = 8,
                   trunc = FALSE,
                   height_margin = 1,
                   Fsz = 9.5,
                   denote = "",
                   label_height = .9)
# run this to combine the DEMO Fleet How To Guide with the Demo Fleet Barcodes.  

pdftools::pdf_combine(input = c('LibrarikaBooklet.pdf','Demo_Fleet_Guide.pdf'), output = 'DemoFleetGuide.pdf')
