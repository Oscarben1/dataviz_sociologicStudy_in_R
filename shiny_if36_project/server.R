library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

dataset <- starwars

server <- function(input, output){
    
    vals <- reactiveValues(keeprows = rep(TRUE, nrow(dataset)),
                           dataset = dataset
    )
    
    output$individus <- renderValueBox({
        valueBox(dim(vals$dataset)[1], "Individus", icon = icon("list"), color = "red")
    })
    
    output$dimensions <- renderValueBox({
        valueBox(dim(dataset)[2], "Dimensions", icon = icon("columns"), color = "yellow")
    })
    
    output$averageheight <- renderInfoBox({
        infoBox("Average height (cm)", mean(vals$dataset$height, na.rm = TRUE), icon = icon("long-arrow-alt-up"), color = "purple")
    })
    
    output$medianmass <- renderInfoBox({
        infoBox("Median mass (kg)", median(vals$dataset$mass, na.rm = TRUE), icon = icon("weight-hanging"), color = "black")
    })
    
    observeEvent(input$datasize, {
        vals$dataset <- starwars[1:input$datasize,]
    }) 
    
    output$heightmass <- renderPlotly({
        temp_plot <- ggplot(vals$dataset, aes(x = mass, y = height, color = species)) + geom_point()
        ggplotly(temp_plot)
    })
    
    output$heightmass <- renderPlot({
        ggplot(vals$dataset, aes(get(input$selectcolor))) + geom_bar() + labs(x = input$selectcolor)
        
    })
    
    
}