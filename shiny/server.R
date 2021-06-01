library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)
library(readr)

dataset <- read_csv("../data/student-por.csv") %>% filter(sex==input$sex)

server <- function(input, output){
    
    vals <- reactiveValues(keeprows = rep(TRUE, nrow(dataset)),
                           dataset = dataset)
    
    output$meanStudytimeM <- renderValueBox({
        valueBox(mean(vals$dataset$studytime), "Temps moyen de travail garçon", icon = icon("list"), color = "red")
    })
    
    
}