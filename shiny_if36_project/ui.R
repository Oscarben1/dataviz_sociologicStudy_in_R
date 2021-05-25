library(dplyr)
library(shinydashboard)
library(plotly)


dashboardPage(
    skin="blue",
    dashboardHeader(title = "Analyse des étudiants"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Notes", tabName = "notes", icon=icon("font")),
            menuItem("Santé", tabName = "santé", icon=icon("heart")),
            menuItem("Relations familiales", tabName = "relations_familiales", icon=icon("star"))
        ),

        sliderInput("moyenne_générale" ,"Moyenne générale", min = 0, max = 20, value = c(5, 16)),
        
        radioButtons("sexe", label = h3("Sexe"), 
                     choices = list("Garçon" = 1, "Fille" = 2, "Les 2" = 3),
                     selected = 3),
        
        radioButtons("adresse", label = h3("Lieu de vie"), 
                     choices = list("Ville" = 1, "Campagne" = 2, "Les 2" = 3),
                     selected = 3),
        
        checkboxGroupInput("age", label = h3("Age"), 
                     choices = list("15" = 1, "16" = 2, "17" = 3, "18" = 4, "19" = 5, "20" = 6, "21" = 7, "22" = 8, "Tous" = 9),
                     selected = 9),
        
        selectInput("travail_mère", label = h3("Travail de la mère"), 
                           choices = list("Education" = 1, "Santé" = 2, "Service publique" = 3, "Au foyer" = 4, "Autre" = 5, "Tous" = 6),
                    selected = 6),
        
        selectInput("travail_père", label = h3("Travail du père"), 
                    choices = list("Education" = 1, "Santé" = 2, "Service publique" = 3, "Au foyer" = 4, "Autre" = 5, "Tous" = 6),
                    selected = 6),
        
        sliderInput("temps_de_travail" ,"Temps de travail", min = 1, max = 4, value = c(1, 4)),
        
        sliderInput("consommation_alcool_hebdo" ,"Consommation d'alcool hebdo", min = 1, max = 5, value = c(1, 5))
        
    ),
 
    dashboardBody(
        tabItems(
            tabItem(
                tabName = "notes",

            ),
            tabItem(tabName = "santé",
                
            ),
            tabItem(tabName = "relations_familiales",
                    
            )
        ),
    ),
)
