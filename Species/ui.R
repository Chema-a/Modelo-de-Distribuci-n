# k-means only works with numerical variables,
# so don't give the user the option to select
# a categorical variable

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
        )
    )
    
))