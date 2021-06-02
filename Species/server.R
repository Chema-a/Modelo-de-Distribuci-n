function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() %>% addTiles() %>%
      setView(-105, 22, zoom = 5)
  })
  
  observeEvent(input$do, {
    if(input$select == "MX" )
    {
      xlim <<- c(-129,-79) # this tells us to focus on mexico only
      ylim <<- c(15,35) # this tells us to focus on mexico only
      view_valuex = -105
      view_valuey = 22
      zoom_value = 5
    }
    else if(input$select == "BR")
    {
      xlim <<- c(-75,-20)
      ylim <<- c(-35,5)
      
      view_valuex = -47
      view_valuey = -17
      zoom_value = 4
      
    }
    else if(input$select == "AR")
    {
      xlim <<- c(-90,-36)
      ylim <<- c(-90,-20)
      view_valuex = -65
      view_valuey = -30
      zoom_value = 4
      
    }
    else if(input$select == "CO")
    {
      xlim <<- c(-90,-36)
      ylim <<- c(-10,12)
      view_valuex = -75
      view_valuey = 2
      zoom_value = 6
      
    }
    tryCatch({
      library(rvest)
      library(stringr)
      name<- str_replace_all(input$species," ","_")
      
      searcher = gsub(" ", "", name)
      link = gsub(" ", "",paste("https://es.wikipedia.org/wiki/",tolower(searcher),"")) 
      print(link)
      page <- read_html(paste(link))
      node_title<-page%>%
        html_nodes(xpath='//*[@id="firstHeading"]')%>%html_text()
      print(input$select)
      output$tittle <- renderText(node_title)
      
      withProgress(
        message = 'Recolectando de www.gbif.org...',
        value = 1/5, {
          
          library(dismo)
          library(rgbif)
          library(maptools)
          library(rJava)
          
          incProgress(1/5)
          tryCatch({
            
            your_species_data <<- occ_search(scientificName = node_title, 
                                             country = input$select, fields=c('name','country','countryCode','stateProvince','year','decimalLatitude','decimalLongitude'), limit = input$occ_limit, return ='data') #Limite de informacion
            #plot(wrld_simpl,xlim=xlim,ylim=ylim) # make a zoomed-in map of mexico
            #points(your_species_data$data$decimalLongitude,your_species_data$data$decimalLatitude, col='purple')
            path <<- file.path(system.file(package="dismo"), 'ex') # This line of code tells R where we stored out climate data.
            files <<- list.files(path, pattern='grd$', full.names=TRUE )
            files # here we see that R found many files related to global climate on the computer.
            predictors <<- stack(files)
            predictors
            extent_of_mexico_map <<- extent(xlim, ylim) # Set your extent to the area we're focused on
            predictors_cropped_to_mexico <<- crop(predictors, extent_of_mexico_map)
            
            plot(predictors_cropped_to_mexico)
            # plot2<<-plot(predictors_cropped_to_mexico)
            #----
            
            incProgress(1/5)
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
            
            
            incProgress(1/5)
            e <<- evaluate(pres_test_your_species, backg_test, xm, predictors_cropped_to_mexico)
            e
            px <<- predict(predictors_cropped_to_mexico, xm, ext=extent_of_mexico_map, progress='')
            plot(px, main='Canis latrans')
            r <<- px
            
            pal <<- colorNumeric(c("#038247", "#99a10b", "#992806"), values(r), na.color = "transparent")
            pal <<- colorNumeric(c("#038247", "#99a10b", "#992806"), values(r),          na.color = "transparent")
            
            #**se puede cambiar
            basemap = leaflet("map") %>% addTiles() %>%  # Add default OpenStreetMap map tiles
              #leafletProxy("map") %>% addTiles() %>%  # Add default OpenStreetMap map tiles
              addMarkers(lng=your_species_data$data$decimalLongitude, lat=your_species_data$data$decimalLatitude, popup=input$species) %>%
              addRasterImage(r, colors = pal, opacity = 0.6) %>%
              addLegend("bottomright",pal = pal, values = values(r),
                        title = 'Proyeccion de incidencia')%>%
              
              setView(view_valuex, view_valuey, zoom = zoom_value)
            
            #**y aniadir        
            output$map <- renderLeaflet({           basemap        })
            
            output$plot2=renderPlot({plot(predictors_cropped_to_mexico)},bg="white")
            output$plot3=renderPlot({plot(xm)})
            
            incProgress(1/5)
            #-----------Imagen
            tryCatch({
              library("rvest")
              library("imager")
              library("magick")
              searcher = gsub(" ", "", input$species)
              link = gsub(" ", "",paste("https://www.google.com/search?site=&tbm=isch&q=",searcher,"")) 
              print(link)
              forecasts <- read_html(paste(link)) %>% html_nodes("img") %>% html_attr("src")
              specie_image <- image_read(forecasts[[3]])
              
              
              output$plot5 <- renderPlot({
                plot(image_scale(specie_image))          },bg="transparent") 
            },
            error = function(e) {
              showModal(modalDialog(title = "Lo lamentamos", 
                                    tags$p("No pudimos encontrar una imagen sobre esa especie")))
            })
            #---------------TEXTO
            tryCatch({
              
              name<- str_replace_all(input$species," ","_")
              
              searcher = gsub(" ", "",name )
              link = gsub(" ", "",paste("https://es.wikipedia.org/wiki/",tolower(searcher),"")) 
              print(link)
              page <- read_html(paste(link))
              nodes<-page%>%
                html_nodes(xpath='//*[@id="mw-content-text"]/div[1]/p[1]')%>%html_text()
              #print(nodes)
              output$text1 <- renderText({nodes})
              
              info_node<-page%>%
                html_nodes(xpath='//*[@id="mw-content-text"]/div[1]/table[1]/tbody')%>%htmlOutput()
              print(info_node)
              output$info <- renderImage({info_node})
              print(renderImage({info_node}))
              
            }, 
            error = function(e) {
              showModal(modalDialog(title = "Lo lamentamos", 
                                    tags$p("No pudimos encontrar informacion textual sobre esa especie")))
            })
            #--------------------
            
            
          },       
          error = function(e) {
            showModal(modalDialog(title = "Lo lamentamos", 
                                  tags$p("No pudimos encontrar incidencias sobre esa especie en esta zona"),
                                  tags$p("Intenta con otra especie")))
          })
        })
    },       
    error = function(e) {
      showModal(modalDialog(title = "Lo lamentamos", 
                            tags$p("No pudimos encontrar informacion sobre esa especie"),
                            tags$p("Intenta con otro nombre")))
    })
  })
}