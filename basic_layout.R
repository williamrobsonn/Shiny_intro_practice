library(shiny)

# Define UI ----

ui <- fluidPage(titlePanel("Title panel"),
                  img(src=wfarm), 
                  sidebarLayout(
                  sidebarPanel("MySidebar",
                  h3("a button"),
                  actionButton(inputId="my_submitstatus",
                  label="Submit"), checkboxGroupInput(inputId = "my_checkgroup", 
                                                     h3("Select one habitat"), 
                                                     choices = list("Woodland" = 1, 
                                                                    "Grassland" = 2, 
                                                                    "Urban" = 3),
                                                     selected = 1)), position = "left",
           mainPanel(
          p("This website will be to help planners assess potential windfarm
           development areas in Cumbria, and achieve a ",strong("balance"),
           "between different ", em("interest groups"), "and other users."
           )
       )))






# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)

