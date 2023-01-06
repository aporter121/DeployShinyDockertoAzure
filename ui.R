#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#







# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Example RC Scatter Plot"),
    
    
    fluidRow(
        
        selectizeInput("col_x","Choose X indicator",cols),
        selectizeInput("col_y","Choose Y indicator",cols),
        
    ),
    

    # Show a plot of the generated distribution
        mainPanel(
            
            plotlyOutput("distPlot")
        )
    )
)
