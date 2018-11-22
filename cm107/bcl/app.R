
library(shiny)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
    titlePanel("BC Liquor price app", 
               windowTitle = "BCL app"),
    sidebarLayout(
        sidebarPanel("This text is in the sidebar."),
        mainPanel(
            plotOutput("price_hist"),
            tableOutput("bcl_data")
                  )
    )

)


server <- function(input, output) {
    output$price_hist <-renderPlot(ggplot2::qplot(bcl$Price))
    output$bcl_data <- renderTable({
    
        
        bcl
        
        })


}

# Run the application 
shinyApp(ui = ui, server = server)
