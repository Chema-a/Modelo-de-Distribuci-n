# k-means only works with numerical variables,
# so don't give the user the option to select
# a categorical variable
<<<<<<< HEAD
library(shinythemes)
library(leaflet)
#Hoja de referencia   https://www.rstudio.com/wp-content/uploads/2015/03/shiny-spanish.pdf
shinyUI(fluidPage(
    
    theme = shinytheme("flatly"),
    # set the height of a #map object with CSS
    tags$style(type = "text/css", "#map {height: calc(100vh - 10px) !important;}"),
    #conditionalPanel(condition="input.ts_plot_type=='Mapa Principal'",
    leafletOutput("map")
    ,
    
    #add some panels above the map
    absolutePanel(
        top = 0, right = "30%", style = "z-index:500; text-align: center;",
        tags$h2("Modelo de Distribucion de Especies")
    ),
    absolutePanel(
        top = 70, right = 30, style = "z-index:500; text-align: right;",
        radioButtons("ts_plot_type","MAPAS:", choices=c(
            "Mapa Principal", "Clima", "Variable de Contribuacion", "INFO"), inline=F)
    ),
    absolutePanel(
        top = 60, left = 20, draggable = FALSE, width = "20%", 
        style = "z-index:1000; min-width: 300px;",
        selectInput("select", label = h3("Country"), 
                    choices = list("MÃ©xico" = "MX", "Brazil" = "BR", "Argentina" = "AR", "Colombia" = "CO"), 
                    selected = "MX"),
        textInput("species", h3("Nombre cientifico de especie"), 
                  value = "Canis lupus baileyi", placeholder="Ambystoma..."),  
        numericInput("occ_limit", h3("Limite de Ocurrencia"),value = 20),
        br(),
        actionButton("do", "Generar modelo"),
        br(),
        br()
    ),
    absolutePanel(
        bottom = 0, left = 0, draggable = FALSE, width = "20%", style = "z-index:5; min-width: 300px;",
        plotOutput("plot5")
    ),
    absolutePanel(
        bottom = 30, left = "20%", draggable = FALSE, width = "40%", style = "z-index:50; min-width: 300px;",
        tags$h4 (textOutput("tittle")),
        textOutput("text1")
        
    ),
    absolutePanel(
        top = "25%", left = "25%", width = "100%",style = "z-index:500; min-width: 300px;",
        conditionalPanel(condition="input.ts_plot_type=='Clima'",
                         plotOutput("plot2")
        ),
        conditionalPanel(condition="input.ts_plot_type=='Variable de Contribucion'",
                         plotOutput("plot3")
        )
    ),
    absolutePanel(
        top = "25%", left = "25%", width = "100%",style = "z-index:500; min-width: 300px;text-align: right;",
        conditionalPanel(condition="input.ts_plot_type=='INFO'",
                         imageOutput("info")
        )
=======
<<<<<<< HEAD
library(shinythemes)
library(leaflet)
#Hoja de referencia   https://www.rstudio.com/wp-content/uploads/2015/03/shiny-spanish.pdf
shinyUI(fluidPage(
    
    theme = shinytheme("flatly"),
    # set the height of a #map object with CSS
    tags$style(type = "text/css", "#map {height: calc(100vh - 10px) !important;}"),
    #conditionalPanel(condition="input.ts_plot_type=='Mapa Principal'",
                     leafletOutput("map")
    ,
    
    #add some panels above the map
    absolutePanel(
        top = 0, right = "30%", style = "z-index:500; text-align: center;",
        tags$h2("Modelo de Distribucion de Especies")
    ),
    absolutePanel(
        top = 70, right = 30, style = "z-index:500; text-align: right;",
        radioButtons("ts_plot_type","MAPAS:", choices=c(
            "Mapa Principal", "Clima", "Variable de Contribuacion", "INFO"), inline=F)
    ),
    absolutePanel(
        top = 60, left = 20, draggable = FALSE, width = "20%", 
            style = "z-index:1000; min-width: 300px;",
        textInput("species", h3("Nombre cientifico de especie"), 
                  value = "canis lupus baileyi", placeholder="Amystoma..."),  
        numericInput("occ_limit", h3("Limite de Ocurrencia"),value = 20),
        br(),
        actionButton("do", "Generar modelo"),
        br(),
        br()
    ),
    absolutePanel(
        bottom = 0, left = 0, draggable = FALSE, width = "20%", style = "z-index:5; min-width: 300px;",
        plotOutput("plot5")
    ),
    absolutePanel(
        bottom = 30, left = "20%", draggable = FALSE, width = "40%", style = "z-index:50; min-width: 300px;",
        tags$h4 (textOutput("tittle")),
        textOutput("text1")
        
    ),
    absolutePanel(
        top = "25%", left = "25%", width = "100%",style = "z-index:500; min-width: 300px;",
        conditionalPanel(condition="input.ts_plot_type=='Clima'",
                         plotOutput("plot2")
        ),
        conditionalPanel(condition="input.ts_plot_type=='Variable de Contribucion'",
                         plotOutput("plot3")
        )
    ),
    absolutePanel(
        top = "25%", left = "25%", width = "100%",style = "z-index:500; min-width: 300px;text-align: right;",
        conditionalPanel(condition="input.ts_plot_type=='INFO'",
                         imageOutput("info")
=======

#Hoja de referencia   https://www.rstudio.com/wp-content/uploads/2015/03/shiny-spanish.pdf
shinyUI(fluidPage(
    
    pageWithSidebar(
        headerPanel('Modelo de Distribucion de Especies'),
        sidebarPanel(
            textInput("species", h3("Nombre cientifico de especie"), 
                      value = ""),  
            numericInput("occ_limit", h3("Limite de Ocurrencia"),value = 20),
            br(),
            actionButton("do", "Generar modelo"),
            align = "center"
        ),
        
        mainPanel(
            #titlePanel("Presiona el boton cada vez que cambies de especie"),
            h4(textOutput('selected_species')),
        )
        
    ),
    
    tabsetPanel(
        tabPanel(
            titlePanel("Presencia"),
            plotOutput('plot1'),
            br(),
            br()
        ),
        tabPanel(
            titlePanel("CLIMA"),
            plotOutput('plot2'),
            br(),
            br()
        ),
        tabPanel(
            titlePanel("VARIABLE DE CONTRIBUCION"),
            plotOutput('plot3'),
            br(),
            br()
        ),
        tabPanel(
            titlePanel("MD"),
            plotOutput('plot4'), 
            br(),
            br()
>>>>>>> a37be8544c5d8e187c16f814cd4612a12e14f31f
        )
>>>>>>> 0adbdac3c786900b7324ebaf9f44b455758b22ee
    )
    
))