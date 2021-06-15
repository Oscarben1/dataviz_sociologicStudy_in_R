library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)
library(readr)

dataset <- read_csv("../data/student-por.csv")

server <- function(input, output){

    vals <- reactiveValues(keeprows = rep(TRUE, nrow(dataset)),
                           dataset = dataset)



    output$nbIndMean <- renderValueBox({
        data <- dataset %>% filter(G1 >= input$individusMean)
        data <- dim(data)[1]
        valueBox(data, "nb d'élèves au dessus de la mean", icon = icon("book"), color = "red")
    })

    output$studytime <- renderValueBox({
        data <- dataset %>% filter(G1 >= input$individusMean) %>% mutate(mean_study = mean(studytime)) %>% distinct(mean_study)
        data <- data[1,1]
        valueBox(signif(data, 4), "Temps de travail", icon = icon("clock"), color = "blue")
    })

    output$failures <- renderValueBox({
        data <- dataset %>% filter(G1 <= input$individusMean) %>% mutate(mean_fail = mean(failures)) %>% distinct(mean_fail)
        data <- data[1,1]
        valueBox(signif(data, 4), "Nb d'échecs en dessous de la mean", icon = icon("sad-tear"), color = "green")
    })

    output$G1andMean <- renderPlotly({
        temp_plot <- ggplot(dataset %>% filter(Mjob == input$travail_mère & Fjob == input$travail_père & age <= 19) %>% group_by(age) %>% mutate(mean_G1 = mean(G1)) %>% distinct(age, mean_G1), aes(x = age, y = mean_G1, fill = age)) +
                        geom_bar(stat = "identity") +
                        labs(x = "Age",
                             y = "Moyenne des notes") +
                        theme(legend.position = "none")
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

    ########################################################## Outputs sur les relations familiales ##################################################

    output$parentsJobFamrel <- renderInfoBox({
        data <- dataset %>% filter(Mjob == input$travail_mère & Fjob == input$travail_père) %>% mutate(mean_famrel = mean(famrel)) %>% distinct(mean_famrel)
        data <- data[1,1]
        infoBox("Moyenne famrel selon le travail des parents", signif(data, 4), icon = icon("long-arrow-alt-up"), color = "purple" )
    })

    output$parentsEduFamrel <- renderInfoBox({
        data <- dataset %>% filter(Medu == input$education_mère & Fedu == input$education_père) %>% mutate(mean_famrel = mean(famrel)) %>% distinct(mean_famrel)
        data <- data[1,1]
        infoBox("Moyenne famrel selon l'éducation des parents", signif(data, 4), icon = icon("long-arrow-alt-up"), color = "yellow" )
    })

    output$sexAdressAge <- renderInfoBox({
        data <- dataset %>% filter(age == input$age & sex == input$sex & address == input$address) %>% mutate(mean_famrel = mean(famrel)) %>% distinct(mean_famrel)
        data <- data[1,1]
        infoBox("Moyenne famrel selon le sexe, l'adresse et l'âge", signif(data, 4), icon = icon("long-arrow-alt-up"), color = "red" )
    })

    output$FamRelandJob <- renderPlotly({
        temp_plot <- ggplot(dataset %>% filter(Mjob == input$travail_mère & Fjob == input$travail_père & age <= 19) %>% group_by(age) %>% mutate(mean_famrel = mean(famrel)) %>% distinct(age, mean_famrel), aes(x = age, y = mean_famrel, fill = age)) +
            geom_bar(stat = "identity") +
            labs(x = "age",
                 y = "Moyenne des relations") +
            theme(legend.position = "none")
        ggplotly(temp_plot)
    })

}
