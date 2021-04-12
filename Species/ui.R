# k-means only works with numerical variables,
# so don't give the user the option to select
# a categorical variable

pageWithSidebar(
    headerPanel('Modelo de Distribucion de Especies'),
    sidebarPanel(
        textInput("species", h3("Nombre cientifico de especie"), 
                  value = "Canis latrans"),  
        numericInput("occ_limit", h2("Limite de Ocurrencia"),value = 20),
    ),
    mainPanel(
        textOutput('selected_species'),
        plotOutput('plot1'),
        plotOutput('plot2'),
        plotOutput('plot3'),
        plotOutput('plot4')
    )
)