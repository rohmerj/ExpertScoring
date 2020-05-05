library(shiny)

rm(list=ls())

source("./R/cookeFUN.R")
source("./R/possiFUN.R")
source("./R/scoring.R")
source("./R/plotFUN.R")

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)

