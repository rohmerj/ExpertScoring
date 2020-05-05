# ui object
ui <- fluidPage(
  titlePanel(p("Expert scoring app", style = "color:#3474A7")),
  sidebarLayout(
    sidebarPanel(
      fileInput(
        inputId = "file_expert",
        label = "Upload data. Choose expert file",
        accept = c(".csv")
      ),
      fileInput(
        inputId = "file_seed",
        label = "Upload data. Choose seed file",
        accept = c(".csv")
      ),
      selectInput(inputId = "q", label = h3("Q1-Q2-Q3"), 
        choices = list("Q5-Q50-Q95" = 1, "Q10-Q50-Q90" = 2, "Q01-Q50-Q99" = 3), 
      selected = 1),
      #actionButton("do", "RUN"),
      p("Made within", a("H2020-NARSIS",
        href = "http://www.narsis.eu/"
      ), "."),
      img(
        src = "http://www.narsis.eu/sites/all/themes/satellite/logo.png",
        width = "70px", height = "70px"
      )
    ),

    mainPanel(
      #DTOutput(outputId = "table"),
      plotOutput(outputId = "plot_resu_cal"),
      plotOutput(outputId = "plot_resu_imp")
    )
  )
)