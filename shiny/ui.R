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

        sliderInput("individusMean" ,"Moyenne de l'élève", 4, 19, 10),


        radioButtons("meanStudyTime", label = h3("Sexe"),
                     choices = list("Garçon" = "M", "Fille" = "F"),
                     selected = "M"),

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
                    choices = list("Education" = "teacher", "Santé" = "health", "Service publique" = "services", "Au foyer" = "at_home", "Autre" = "other"),
                    selected = "teacher"),

        sliderInput("temps_de_travail" ,"Temps de travail", min = 1, max = 4, value = c(1, 4)),

        sliderInput("consommation_alcool_hebdo" ,"Consommation d'alcool hebdo", min = 1, max = 5, value = c(1, 5))

    ),

    dashboardBody(
        tabItems(
            tabItem(
                tabName = "notes",
                fluidRow(
                    valueBoxOutput("nbIndMean"),
                    valueBoxOutput("studytime"),
                    valueBoxOutput("failures"),
                ),
                fluidRow(
                    box(
                        title = "Notes en fonction de l'âge, et des parents",
                        status = "primary",
                        solidHeader = TRUE,
                        plotlyOutput("G1andMean")
                ))
            ),
            tabItem(tabName = "santé",

            ),
            tabItem(tabName = "relations_familiales",

            )
        ),
    ),
)
