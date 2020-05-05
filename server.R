# server()
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

  #output$table <- renderDT(
  #  data_expert()
  #)
  #observeEvent(input$do, {
  output$plot_resu_cal <- renderPlot({
    plotFUN_resu_cal(score()$cal_classical,score()$cal_possi)
  })

  output$plot_resu_imp <- renderPlot({
    plotFUN_resu_imp(score()$imp_classical,score()$imp_possi)
  })
  #})

}

