library(shiny)

habitats <- read.csv("www/habitats.csv")

# Define UI ----

ui <- fluidPage(titlePanel("Windfarms in Cumbria"),
                  sidebarLayout(
                  sidebarPanel("",
                  h3("Click here for submission"),
                  actionButton(inputId="my_submitstatus",
                  label="Submit"), radioButtons(inputId = "my_checkgroup", 
                  h3("Select one habitat"), 
                  choices = list("Woodland" = 1,"Grassland" = 2, "Urban" = 3), selected = 1)),
                  
           mainPanel( p("This website will be to help planners assess potential windfarm
           development areas in Cumbria, and achieve a ",strong("balance"),
           "between different ", em("interest groups"), "and other users.", img(src=wfarm)
           ), plotOutput(outputId = "habitats_plot")
       )))






# Define server logic ----
server <- function(input, output) {
  output$habitats_plot <- renderPlot(
    hist(habitats[,as.numeric(input$my_checkgroup)])
  )
}

# Run the app ----
shinyApp(ui = ui, server = server)

