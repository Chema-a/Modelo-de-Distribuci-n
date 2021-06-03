# k-means only works with numerical variables,
# so don't give the user the option to select
# a categorical variable
library(shinythemes)
library(leaflet)
#Hoja de referencia   https://www.rstudio.com/wp-content/uploads/2015/03/shiny-spanish.pdf
shinyUI(fluidPage(
    
    theme = shinytheme("flatly"),
    # set the height of a #map object with CSS
    tags$style(type = "text/css", "#map {height: calc(100vh - 10px) !important;}"),
    leafletOutput("map"),
    
    
    #add some panels above the map
    absolutePanel(
        top = 0, left = 60, style = "z-index:500; text-align: center;",
        tags$h1(strong("Modelo de Distribucion de Especies"))
    ),
    
    #
    absolutePanel(
        
        top = "10%", left = 15, draggable = FALSE, width = "30%", 
        style = "z-index:1000; min-width: 300px;overflow-y:scroll;max-height: 90%;text-align: center;",
        div(style="display:inline-block;vertical-align:top;",
        selectInput("select", label = h3("PAIS"), 
                    choices = list("México" = "MX", "Brazil" = "BR", "Argentina" = "AR", "Colombia" = "CO"), 
                    selected = "MX"),
        textInput("species", h3("Nombre cientifico de especie"), 
                  value = "Canis lupus baileyi", placeholder="Ambystoma, Canis latrans..."),  
        numericInput("occ_limit", h3("Limite de Ocurrencia"),value = 100),
        br(),
        actionButton("do", "Generar modelo"),
        br(),
        br(),
        ),
        #----------------------
        plotOutput("plot5"),
        tags$h3 (strong(textOutput("tittle"))),
        textOutput("text1"),
        br(),
        br(),
        plotOutput("plot2"),
        plotOutput("plot3")
        
    ),
    
))