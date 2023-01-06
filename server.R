#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#




library(tidyverse)
library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlotly({

        # generate bins based on input$bins from ui.R
        # x    <- faithful[, 2]
        # bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        

        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')

        colx <- sym(input$col_x)
        coly <- sym(input$col_y)
        
        sample4<- WTL_data %>% 
          filter(`Indicator Name`==colx|`Indicator Name`==coly)  %>% 
          filter(GeographyID != 'ENGLAND')  %>% 
          select(`Indicator Name`,Value,GeographyName) %>% 
          pivot_wider(names_from = `Indicator Name`, values_from = Value) 

        p<-ggplot(sample4, mapping=aes(x=!!colx  ,y=!!coly, text=GeographyName)) + geom_point() 
       
        return(ggplotly(p, tooltip="text"))
    })

})
