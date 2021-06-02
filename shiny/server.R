library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)
library(readr)

dataset <- read_csv("../data/student-por.csv")
dataset2 <- read_csv("../data/student-por.csv")
dataset3 <- read_csv("../data/student-por.csv")

server <- function(input, output){

    vals <- reactiveValues(keeprows = rep(TRUE, nrow(dataset)),
                           dataset = dataset)



    output$nbIndMean <- renderValueBox({
        valueBox(dim(vals$dataset)[1], "nb d'élèves au dessus de la mean", icon = icon("book"), color = "red")
    })

    output$studytime <- renderValueBox({
        valueBox(signif(mean(vals$dataset$studytime), 4), "Temps de travail", icon = icon("clock"), color = "blue")
    })

    output$failures <- renderValueBox({
        valueBox(signif(mean(vals$dataset2$failures), 4), "Nb d'échecs en dessous de la mean", icon = icon("sad-tear"), color = "green")
    })

    observeEvent(input$individusMean,{
        vals$dataset <- read_csv("../data/student-por.csv") %>% filter(G1 >= input$individusMean)
        vals$dataset2 <- read_csv("../data/student-por.csv") %>% filter(G1 <= input$individusMean)
    })

    observeEvent(input$travail_père,{
        vals$dataset3 <- read_csv("../data/student-por.csv") %>% filter(Fjob == input$travail_père)
    })

    output$G1andMean <- renderPlotly({
        temp_plot <- ggplot(vals$dataset3 %>% filter(age <= 19) %>% group_by(age) %>% mutate(mean_G1 = mean(G1)) %>% distinct(age, mean_G1), aes(x = age, y = mean_G1)) + geom_bar(stat = "identity")
        ggplotly(temp_plot)
    })

}
