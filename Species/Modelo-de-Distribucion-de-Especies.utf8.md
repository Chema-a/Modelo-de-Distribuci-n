
<!-- rnb-text-begin -->

---
title: 'Create of SDM'
output:
  pdf_document: default
  html_document:
    df_print: paged
  html_notebook: default
---

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaW5zdGFsbC5wYWNrYWdlcygncnNjb25uZWN0JylcbmBgYCJ9 -->

```r
install.packages('rsconnect')
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiSW5zdGFsbGluZyBwYWNrYWdlIGludG8g46S847ixQzovVXNlcnMvamVzaDIvRG9jdW1lbnRzL1Ivd2luLWxpYnJhcnkvNC4w46S847iyXG4oYXMg46S847ixbGli46S847iyIGlzIHVuc3BlY2lmaWVkKVxudHJ5aW5nIFVSTCAnaHR0cHM6Ly9jcmFuLnJzdHVkaW8uY29tL2Jpbi93aW5kb3dzL2NvbnRyaWIvNC4wL3JzY29ubmVjdF8wLjguMTcuemlwJ1xuQ29udGVudCB0eXBlICdhcHBsaWNhdGlvbi96aXAnIGxlbmd0aCA2NjUwNTIgYnl0ZXMgKDY0OSBLQilcbmRvd25sb2FkZWQgNjQ5IEtCXG4ifQ== -->

```
Installing package into 㤼㸱C:/Users/jesh2/Documents/R/win-library/4.0㤼㸲
(as 㤼㸱lib㤼㸲 is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.0/rsconnect_0.8.17.zip'
Content type 'application/zip' length 665052 bytes (649 KB)
downloaded 649 KB
```



<!-- rnb-output-end -->

<!-- rnb-output-begin eyJkYXRhIjoicGFja2FnZSDigJhyc2Nvbm5lY3TigJkgc3VjY2Vzc2Z1bGx5IHVucGFja2VkIGFuZCBNRDUgc3VtcyBjaGVja2VkXG5cblRoZSBkb3dubG9hZGVkIGJpbmFyeSBwYWNrYWdlcyBhcmUgaW5cblx0QzpcXFVzZXJzXFxqZXNoMlxcQXBwRGF0YVxcTG9jYWxcXFRlbXBcXFJ0bXA2TnJsS0VcXGRvd25sb2FkZWRfcGFja2FnZXNcbiJ9 -->

```
package ‘rsconnect’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\jesh2\AppData\Local\Temp\Rtmp6NrlKE\downloaded_packages
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

Aqui se pone el token de la pagina de shiny

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucnNjb25uZWN0OjpzZXRBY2NvdW50SW5mbyhuYW1lPSdqZS1zaCcsIHRva2VuPSdFQ0I2NDZCMTUyQkQ5MjYzMEVFMEREQTYyOUFBRTZCNycsIHNlY3JldD0nc2VjcmV0JylcbmBgYCJ9 -->

```r
rsconnect::setAccountInfo(name='je-sh', token='ECB646B152BD92630EE0DDA629AAE6B7', secret='secret')
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

conecta y sube la pagina a shiny

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubGlicmFyeShyc2Nvbm5lY3QpXG5gYGAifQ== -->

```r
library(rsconnect)
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoicGFja2FnZSCRcnNjb25uZWN0kiB3YXMgYnVpbHQgdW5kZXIgUiB2ZXJzaW9uIDQuMC41V2FybmluZyBtZXNzYWdlczpcbjE6IHBhY2thZ2Ug4oCYZGlzbW/igJkgd2FzIGJ1aWx0IHVuZGVyIFIgdmVyc2lvbiA0LjAuNSBcbjI6IE5vdCBhIHZhbGlkT2JqZWN0KCk6IHJlYWNoZWQgZWxhcHNlZCB0aW1lIGxpbWl0IFxuIn0= -->

```
package 㤼㸱rsconnect㤼㸲 was built under R version 4.0.5Warning messages:
1: package ‘dismo’ was built under R version 4.0.5 
2: Not a validObject(): reached elapsed time limit 
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGVwbG95QXBwKClcbmBgYCJ9 -->

```r
deployApp()
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiUHJlcGFyaW5nIHRvIGRlcGxveSBhcHBsaWNhdGlvbi4uLlxuIn0= -->

```
Preparing to deploy application...
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

First, we'll download up all the important R packages

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaW5zdGFsbC5wYWNrYWdlcygnZGlzbW8nKVxuaW5zdGFsbC5wYWNrYWdlcygncmdiaWYnKVxuaW5zdGFsbC5wYWNrYWdlcygnbWFwdG9vbHMnKVxuaW5zdGFsbC5wYWNrYWdlcygnckphdmEnKVxuXG5gYGAifQ== -->

```r
install.packages('dismo')
install.packages('rgbif')
install.packages('maptools')
install.packages('rJava')

```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


Then, we'll load up all the packages

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubGlicmFyeShkaXNtbylcbmxpYnJhcnkocmdiaWYpXG5saWJyYXJ5KG1hcHRvb2xzKVxubGlicmFyeShySmF2YSlcbmBgYCJ9 -->

```r
library(dismo)
library(rgbif)
library(maptools)
library(rJava)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

First download on species points contained within mexico. Look up and then insert your invasive species scientific name.
Wesearch for occurrence data on website [GBIF](https://www.gbif.org)

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuICB5b3VyX3NwZWNpZXNfZGF0YSA8LSBvY2Nfc2VhcmNoKHNjaWVudGlmaWNOYW1lID0gXCJBbWJ5c3RvbWEgbWV4aWNhbnVtXCIsIFxuICAgICAgICAgICAgICAgICAgICAgICAgICBjb3VudHJ5ID0gJ01YJywgZmllbGRzPWMoJ25hbWUnLCdjb3VudHJ5JywnY291bnRyeUNvZGUnLCdzdGF0ZVByb3ZpbmNlJywneWVhcicsJ2RlY2ltYWxMYXRpdHVkZScsJ2RlY2ltYWxMb25naXR1ZGUnKSwgbGltaXQgPSA1MDAsIHJldHVybiA9J2RhdGEnKSAjTGltaXRlIGRlIGluZm9ybWFjaW9uXG5gYGAifQ== -->

```r
  your_species_data <- occ_search(scientificName = "Ambystoma mexicanum", 
                          country = 'MX', fields=c('name','country','countryCode','stateProvince','year','decimalLatitude','decimalLongitude'), limit = 500, return ='data') #Limite de informacion
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

Lets make a quick map of the 500 points we downloaded for the species in Mexico.

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGF0YShcIndybGRfc2ltcGxcIilcbnhsaW0gPC0gYygtMTI5LC03OSkgIyB0aGlzIHRlbGxzIHVzIHRvIGZvY3VzIG9uIG1leGljbyBvbmx5XG55bGltIDwtIGMoMTUsMzUpICMgdGhpcyB0ZWxscyB1cyB0byBmb2N1cyBvbiBtZXhpY28gb25seVxucGxvdCh3cmxkX3NpbXBsLHhsaW09eGxpbSx5bGltPXlsaW0pICMgbWFrZSBhIHpvb21lZC1pbiBtYXAgb2YgbWV4aWNvXG5wb2ludHMoeW91cl9zcGVjaWVzX2RhdGEkZGF0YSRkZWNpbWFsTG9uZ2l0dWRlLHlvdXJfc3BlY2llc19kYXRhJGRhdGEkZGVjaW1hbExhdGl0dWRlLCBjb2w9J3B1cnBsZScpXG5gYGAifQ== -->

```r
data("wrld_simpl")
xlim <- c(-129,-79) # this tells us to focus on mexico only
ylim <- c(15,35) # this tells us to focus on mexico only
plot(wrld_simpl,xlim=xlim,ylim=ylim) # make a zoomed-in map of mexico
points(your_species_data$data$decimalLongitude,your_species_data$data$decimalLatitude, col='purple')
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

### Extracting data


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucGF0aCA8LSBmaWxlLnBhdGgoc3lzdGVtLmZpbGUocGFja2FnZT1cImRpc21vXCIpLCAnZXgnKSAjIFRoaXMgbGluZSBvZiBjb2RlIHRlbGxzIFIgd2hlcmUgd2Ugc3RvcmVkIG91dCBjbGltYXRlIGRhdGEuXG5maWxlcyA8LSBsaXN0LmZpbGVzKHBhdGgsIHBhdHRlcm49J2dyZCQnLCBmdWxsLm5hbWVzPVRSVUUgKVxuZmlsZXMgIyBoZXJlIHdlIHNlZSB0aGF0IFIgZm91bmQgbWFueSBmaWxlcyByZWxhdGVkIHRvIGdsb2JhbCBjbGltYXRlIG9uIHRoZSBjb21wdXRlci5cbmBgYCJ9 -->

```r
path <- file.path(system.file(package="dismo"), 'ex') # This line of code tells R where we stored out climate data.
files <- list.files(path, pattern='grd$', full.names=TRUE )
files # here we see that R found many files related to global climate on the computer.
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



Our next step is to group our climate data.  R calls this "stacking" so now, let's stack up all of our climate data.

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJlZGljdG9ycyA8LSBzdGFjayhmaWxlcylcbnByZWRpY3RvcnNcbmV4dGVudF9vZl9tZXhpY29fbWFwIDwtIGV4dGVudCgtMTI5LCAtNzksIC0xNSwgMzUpICMgU2V0IHlvdXIgZXh0ZW50IHRvIHRoZSBhcmVhIHdlJ3JlIGZvY3VzZWQgb25cbnByZWRpY3RvcnNfY3JvcHBlZF90b19tZXhpY28gPC0gY3JvcChwcmVkaWN0b3JzLCBleHRlbnRfb2ZfbWV4aWNvX21hcClcbmBgYCJ9 -->

```r
predictors <- stack(files)
predictors
extent_of_mexico_map <- extent(-129, -79, -15, 35) # Set your extent to the area we're focused on
predictors_cropped_to_mexico <- crop(predictors, extent_of_mexico_map)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


We can see how the climate data look.  Areas that are colored in green mean those areas have higher temperature or higher precipitation amounts.

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucGxvdChwcmVkaWN0b3JzX2Nyb3BwZWRfdG9fbWV4aWNvKVxuYGBgIn0= -->

```r
plot(predictors_cropped_to_mexico)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

Now, we gather climate information at every blue dot on our map.  This is our way of knowing whether sloths like area with lots of rain, or warm temperatures.  This is the best and most useful part of a species distribution model. We know what conditions species really enjoy.

After taking the next few steps and writing the next lines of code, we have a bunch of data points corresponding to the type of climate that the species likes best, and other data points corresponding to climate the invasive species doesn't like as much.

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuc2V0LnNlZWQoMClcbmdyb3VwIDwtIGtmb2xkKHlvdXJfc3BlY2llc19kYXRhJGRhdGEsIDUpXG4jQ3JlYXRpb24gb2YgZGF0YSBzZXRzIHRvIHRyYWluXG5wcmVzX3RyYWluX3lvdXJfc3BlY2llcyA8LSB5b3VyX3NwZWNpZXNfZGF0YSRkYXRhW2dyb3VwICE9IDEsIF1cbnByZXNfdHJhaW5feW91cl9zcGVjaWVzIDwtIGFzLmRhdGEuZnJhbWUocHJlc190cmFpbl95b3VyX3NwZWNpZXNbLDE6Ml0pXG5cbnByZXNfdGVzdF95b3VyX3NwZWNpZXMgPC0geW91cl9zcGVjaWVzX2RhdGEkZGF0YVtncm91cCA9PSAxLCBdXG5wcmVzX3Rlc3RfeW91cl9zcGVjaWVzIDwtIGFzLmRhdGEuZnJhbWUocHJlc190ZXN0X3lvdXJfc3BlY2llc1ssMToyXSlcblxuYGBgIn0= -->

```r
set.seed(0)
group <- kfold(your_species_data$data, 5)
#Creation of data sets to train
pres_train_your_species <- your_species_data$data[group != 1, ]
pres_train_your_species <- as.data.frame(pres_train_your_species[,1:2])

pres_test_your_species <- your_species_data$data[group == 1, ]
pres_test_your_species <- as.data.frame(pres_test_your_species[,1:2])

```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

#### What kind of climate does the sloth NOT like?

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJlZF9uZiA8LSBkcm9wTGF5ZXIocHJlZGljdG9yc19jcm9wcGVkX3RvX21leGljbywgJ2Jpb21lJylcbmJhY2tnIDwtIHJhbmRvbVBvaW50cyhwcmVkX25mLCBuPTEwMDAsIGV4dD1leHRlbnRfb2ZfbWV4aWNvX21hcCwgZXh0ZiA9IDEuMjUpXG5gYGAifQ== -->

```r
pred_nf <- dropLayer(predictors_cropped_to_mexico, 'biome')
backg <- randomPoints(pred_nf, n=1000, ext=extent_of_mexico_map, extf = 1.25)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

This bunch of code let us know if the maps we make are accurate.

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuY29sbmFtZXMoYmFja2cpID0gYygnbG9uJywgJ2xhdCcpXG5ncm91cCA8LSBrZm9sZChiYWNrZywgNSlcbmJhY2tnX3RyYWluIDwtIGJhY2tnW2dyb3VwICE9IDEsIF1cbmJhY2tnX3Rlc3QgPC0gYmFja2dbZ3JvdXAgPT0gMSwgXVxuYGBgIn0= -->

```r
colnames(backg) = c('lon', 'lat')
group <- kfold(backg, 5)
backg_train <- backg[group != 1, ]
backg_test <- backg[group == 1, ]
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

### Maxent
Now, we make our predictive maps using the modeling software called `Maxent`

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuamFyIDwtIHBhc3RlKHN5c3RlbS5maWxlKHBhY2thZ2U9XCJkaXNtb1wiKSwgXCIvamF2YS9tYXhlbnQuamFyXCIsIHNlcD0nJylcbnhtIDwtIG1heGVudChwcmVkaWN0b3JzX2Nyb3BwZWRfdG9fbWV4aWNvLCBwcmVzX3RyYWluX3lvdXJfc3BlY2llcywgZmFjdG9ycz0nYmlvbWUnKVxucGxvdCh4bSlcbmBgYCJ9 -->

```r
jar <- paste(system.file(package="dismo"), "/java/maxent.jar", sep='')
xm <- maxent(predictors_cropped_to_mexico, pres_train_your_species, factors='biome')
plot(xm)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->

#### Making our maps
There are a few important statistics that tell us if our ecological model is very good.  When we get the maps, the left map is really key. Anywhere we see green, we have a really good chance of seeing sloths.

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZSA8LSBldmFsdWF0ZShwcmVzX3Rlc3RfeW91cl9zcGVjaWVzLCBiYWNrZ190ZXN0LCB4bSwgcHJlZGljdG9yc19jcm9wcGVkX3RvX21leGljbylcbmVcbnB4IDwtIHByZWRpY3QocHJlZGljdG9yc19jcm9wcGVkX3RvX21leGljbywgeG0sIGV4dD1leHRlbnRfb2ZfbWV4aWNvX21hcCwgcHJvZ3Jlc3M9JycpXG5wYXIobWZyb3c9YygxLDIpKVxucGxvdChweCwgbWFpbj0nQ2FuaXMgbGF0cmFucycpXG50ciA8LSB0aHJlc2hvbGQoZSwgJ3NwZWNfc2VucycpXG5wbG90KHB4ID4gdHIsIG1haW49J3ByZXNlbmNlL2Fic2VuY2UnKVxucGxvdCh3cmxkX3NpbXBsLCBhZGQgPSBUUlVFLCBib3JkZXIgPSBcImJsdWVcIilcblxuYGBgIn0= -->

```r
e <- evaluate(pres_test_your_species, backg_test, xm, predictors_cropped_to_mexico)
e
px <- predict(predictors_cropped_to_mexico, xm, ext=extent_of_mexico_map, progress='')
par(mfrow=c(1,2))
plot(px, main='Canis latrans')
tr <- threshold(e, 'spec_sens')
plot(px > tr, main='presence/absence')
plot(wrld_simpl, add = TRUE, border = "blue")

```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->

