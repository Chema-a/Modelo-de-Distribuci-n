library(dismo)
library(rgbif)
library(maptools)
library(rJava)

function(input, output, session) {

    #--Muestra el texto cuando el boton do es presionado, el texto no cambia hasta que vuelva a presionarce
    text_reactive <- eventReactive( input$do, {
        paste("Has seleccionado la especie ", input$species)#your_species_data
    })
    output$selected_species <- renderText({ 
        text_reactive()
    })
    #--PLOT 1
    
    plot_1 <- eventReactive(input$do, {
        data("wrld_simpl")
        your_species_data <<- occ_search(scientificName = input$species, 
                                         country = 'MX', fields=c('name','country','countryCode','stateProvince','year','decimalLatitude','decimalLongitude'), limit = input$occ_limit, return ='data') #Limite de informacion
        xlim <<- c(-129,-79) # this tells us to focus on mexico only
        ylim <<- c(15,35) # this tells us to focus on mexico only
        plot(wrld_simpl,xlim=xlim,ylim=ylim) # make a zoomed-in map of mexico
        points(your_species_data$data$decimalLongitude,your_species_data$data$decimalLatitude, col='purple')
    })
    output$plot1 <- renderPlot({
        plot_1()
    })
    #--PLOT 2
    plot_2 <- eventReactive(input$do, {
        path <<- file.path(system.file(package="dismo"), 'ex') # This line of code tells R where we stored out climate data.
        files <<- list.files(path, pattern='grd$', full.names=TRUE )
        files # here we see that R found many files related to global climate on the computer.
        predictors <<- stack(files)
        predictors
        extent_of_mexico_map <<- extent(-129, -79, -15, 35) # Set your extent to the area we're focused on
        predictors_cropped_to_mexico <<- crop(predictors, extent_of_mexico_map)
        plot(predictors_cropped_to_mexico)
    })
    output$plot2 <- renderPlot({
      plot_2()  
    })
    #--PLOT 3
    plot_3 <- eventReactive(input$do, {
        set.seed(0)
        group <<- kfold(your_species_data$data, 5)
        #Creation of data sets to train
        pres_train_your_species <<- your_species_data$data[group != 1, ]
        pres_train_your_species <<- as.data.frame(pres_train_your_species[,1:2])
        
        pres_test_your_species <<- your_species_data$data[group == 1, ]
        pres_test_your_species <<- as.data.frame(pres_test_your_species[,1:2])
        pred_nf <<- dropLayer(predictors_cropped_to_mexico, 'biome')
        backg <<- randomPoints(pred_nf, n=1000, ext=extent_of_mexico_map, extf = 1.25)
        colnames(backg) = c('lon', 'lat')
        group <<- kfold(backg, 5)
        backg_train <<- backg[group != 1, ]
        backg_test <<- backg[group == 1, ]
        jar <<- paste(system.file(package="dismo"), "/java/maxent.jar", sep='')
        xm <<- maxent(predictors_cropped_to_mexico, pres_train_your_species, factors='biome')
        plot(xm)
    })
    output$plot3 <- renderPlot({
        plot_3()
        })
    
    #--PLOT 4
    plot_4 <- eventReactive(input$do, {
        e <<- evaluate(pres_test_your_species, backg_test, xm, predictors_cropped_to_mexico)
        e
        px <<- predict(predictors_cropped_to_mexico, xm, ext=extent_of_mexico_map, progress='')
        par(mfrow=c(1,2))
        plot(px, main=input$species)
        tr <<- threshold(e, 'spec_sens')
        plot(px > tr, main='presence/absence')
        plot(wrld_simpl, add = TRUE, border = "blue")
    })
    
        output$plot4 <- renderPlot({
            plot_4()
        })
}
