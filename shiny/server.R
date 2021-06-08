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
    
    ########################################################## Outputs sur la santé ##################################################
    
    output$healthFamrelRep <- renderPlotly(
        {
            data <- dataset %>% filter(famrel >= input$famrel[1] , famrel <= input$famrel[2]) %>%
                select(health)
            
            famrelPlot <- ggplot(data, aes(x = factor(health), fill = health)) + 
                geom_bar() + 
                labs(title = "Répartition de l'état de santé",
                     subtitle = "filtré par la relation familiale",
                     x = "État de santé",
                     y = "Effectif") + 
                guides(fill=guide_legend(title="Santé"))
            
            ggplotly(famrelPlot)
        }
        
    )
    
    output$healthJobRep <- renderPlotly(
        { 
            data <- dataset %>% select(health, Mjob, Fjob)
            
            filterM <- ifelse( input$metierM[1] == 6, FALSE, TRUE) 
            
            filterF <- ifelse( input$metierP[1] == 6, FALSE, TRUE) 
            
            correspondancesMetiers = list("1" = "teacher",
                                          "2" = "health",
                                          "3" = "services",
                                          "4" = "at_home",
                                          "5" = "other")
            
            if(filterM){
                data <- data %>% filter(Mjob == correspondancesMetiers[input$metierM[1]])
            }
            
            if(filterF){
                data <- data %>% filter(Fjob == correspondancesMetiers[input$metierP[1]])
            }
            
            healthPlotJob <- ggplot(data, aes(x = factor(health), fill = health)) +
                geom_bar() +
                labs(title = "Répartition de l'état de santé",
                     subtitle = "Filtré par les métiers des parents",
                     x = "État de santé",
                     y = "Effectif") + 
                guides(fill=guide_legend(title="Santé"))
            
            ggplotly(healthPlotJob)
            
        }
    )
    
    output$healthEduRep <- renderPlotly(
        {
            data <- dataset %>% select(health, Medu, Fedu)
            
            filterM <- ifelse( input$eduM[1] == 5, FALSE, TRUE) 
            
            filterF <- ifelse( input$eduP[1] == 5, FALSE, TRUE) 
            
            
            if(filterM){
                data <- data %>% filter(Medu == as.integer(input$eduM[1]))
            }
            
            if(filterF){
                data <- data %>% filter(Fedu == as.integer(input$eduP[1]))
            }
            
            healthPlotEdu <- ggplot(data, aes(x = factor(health), fill = health)) +
                geom_bar() + 
                labs(title = "Répartition de l'état de santé",
                     subtitle = "Filtré par l'éducation des parents",
                     x = "État de santé",
                     y = "Effectif") +
                guides(fill=guide_legend(title="Santé"))
            
            
            ggplotly(healthPlotEdu)
        }
    )

}
