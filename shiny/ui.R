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


        radioButtons("sex", label = h3("Sexe"),
                     choices = list("Garçon" = "M", "Fille" = "F"),
                     selected = "M"),

        radioButtons("address", label = h3("Lieu de vie"),
                     choices = list("Ville" = "U", "Campagne" = "R"),
                     selected = "U"),

        selectInput("travail_mère", label = h3("Travail de la mère"),
                    choices = list("Education" = "teacher", "Santé" = "health", "Service publique" = "services", "Au foyer" = "at_home", "Autre" = "other"),
                    selected = "teacher"),

        selectInput("travail_père", label = h3("Travail du père"),
                    choices = list("Education" = "teacher", "Santé" = "health", "Service publique" = "services", "Au foyer" = "at_home", "Autre" = "other"),
                    selected = "teacher"),

        selectInput("education_mère", label = h3("Éducation de la mère"),
                    choices = list("Aucune" = 0, "Primaire" = 1, "Collège" = 2, "Lycée" = 3, "Sup" = 4),
                    selected = 1),

        selectInput("education_père", label = h3("Éducation du père"),
                    choices = list("Aucune" = 0, "Primaire" = 1, "Collège" = 2, "Lycée" = 3, "Sup" = 4),
                    selected = 1),

        selectInput("age", label = h3("Age"),
                    choices = list("15" = 15, "16" = 16, "17" = 17, "18" = 18, "19" = 19, "20" = 20, "21" = 21, "22" = 22),
                    selected = 15),

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
                        title = "Notes en fonction du travail des parents",
                        status = "primary",
                        solidHeader = TRUE,
                        plotlyOutput("G1andMean")
                    ))
            ),
            tabItem(
                tabName = "santé",
                fluidRow(
                    box(title = "État de santé filtré par les relations familiales",
                        status = "primary",
                        solidHeader = TRUE,
                        plotlyOutput("healthFamrelRep")),

                    box(title = "Filtre : Relation familiale",
                        sliderInput("famrel", "Jauge", min = 1, max = 5, value = c(1,5) )
                    )
                ),

                fluidRow(
                    title = "Santé en fonction du travail des parents",
                    box(title = "État de santé filtré par le travail des parents",
                        status = "primary",
                        solidHeader = TRUE,
                        plotlyOutput("healthJobRep")),

                    box(title = "Filtre : Métiers des parents",
                        radioButtons("metierM",
                                     label = "Mère",
                                     choices = list("Education" = 1, "Santé" = 2, "Service publique" = 3, "Au foyer" = 4, "Autre" = 5, "Tous" = 6),
                                     selected = 6
                        ),

                        radioButtons("metierP",
                                     label = "Père",
                                     choices = list("Education" = 1, "Santé" = 2, "Service publique" = 3, "Au foyer" = 4, "Autre" = 5, "Tous" = 6),
                                     selected = 6
                        )

                    ),
                ),

                fluidRow(
                    title = "Santé en fonction de l'éducation des parents",
                    box(title = "État de santé filtré par l'éducation des parents",
                        status = "primary",
                        solidHeader = TRUE,
                        plotlyOutput("healthEduRep")),

                    box(title = "Filtre: Éducation des parents",
                        radioButtons("eduM",
                                     label = "Mère",
                                     choices = list("0" = 0,"1" = 1, "2" = 2, "3" = 3, "4" = 4, "Tous" = 5),
                                     selected = 5
                        ),

                        radioButtons("eduP",
                                     label = "Père",
                                     choices = list("0" = 0,"1" = 1, "2" = 2, "3" = 3, "4" = 4, "Tous" = 5),
                                     selected = 5
                        )

                    )

                )

            ),
            tabItem(tabName = "relations_familiales",
                fluidRow(
                    infoBoxOutput("parentsJobFamrel"),
                    infoBoxOutput("parentsEduFamrel"),
                    infoBoxOutput("sexAdressAge")
                ),
                fluidRow(
                    box(
                        title = "Relations familiales selon le travail des parents",
                        status = "primary",
                        solidHeader = TRUE,
                        plotlyOutput("FamRelandJob")
                    ))
            )
        ),
    ),
)
