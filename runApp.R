########################################################
#### 06/05/20
#### author: Jeremy Rohmer, BRGM
#### Web app for estimating calibration and informativeness score
#### using the possibilistic approach by Destercke & Chojnacki (2008)
#### using the classical model by Cooke (1991)
########################################################

library(shiny)

rm(list=ls())

#### R functions
source("./R/cookeFUN.R")
source("./R/possiFUN.R")
source("./R/scoring.R")
source("./R/plotFUN.R")

#### R shiny
source("ui.R")
source("server.R")

#### RUN
shinyApp(ui = ui, server = server)

