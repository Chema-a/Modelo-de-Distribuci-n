# k-means only works with numerical variables,
# so don't give the user the option to select
# a categorical variable
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
            titlePanel("MDE"),
            plotOutput('plot1'),
            br(),
            br(),
        ),
        tabPanel(
            titlePanel("2"),
            plotOutput('plot2'),
            br(),
            br(),
        ),
        tabPanel(
            titlePanel("3"),
            plotOutput('plot3'),
            br(),
            br(),
        ),
        tabPanel(
            titlePanel("4"),
            plotOutput('plot4'), 
            br(),
            br(),
        )
    ),
    
))