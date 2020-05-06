########################################################
#### 06/05/20
#### author: Jeremy Rohmer, BRGM
#### server.R
#### Web app for estimating calibration and informativeness score
#### using the possibilistic approach by Destercke & Chojnacki (2008)
#### using the classical model by Cooke (1991)
########################################################
server <- function(input, output) {

  data_expert <- reactive({
    req(input$file_expert)
    read.csv(input$file_expert$datapath,header=T,sep=";")
  })

  data_seed <- reactive({
    req(input$file_seed)
    read.csv(input$file_seed$datapath,header=T,sep=";")
  })
 
  score <- reactive({
     req(input$file_expert)
     q<-input$q
     scoring(data_expert(),data_seed(),q)
  })

  output$plot_resu_cal <- renderPlot({
    plotFUN_resu_cal(score()$cal_classical,score()$cal_possi)
  })

  output$plot_resu_imp <- renderPlot({
    plotFUN_resu_imp(score()$imp_classical,score()$imp_possi)
  })

}

