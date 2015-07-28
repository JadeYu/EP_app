shinyUI(fluidPage(
  titlePanel("You are what you talk about: Experience project"),
  
  sidebarLayout(
    sidebarPanel(
      h5(helpText("Most popular keywords in status/group topic  by age groups and gender")),
      selectInput("method", 
        label = "Method",
        choices = c("conditional","scikit"),
        selected = "conditional"),
        
      selectInput("text_var", 
        label = "Choose a text category",
        choices = c("Posts/statuses","Group topics"),
        selected = "Group topics"),
      
      selectInput("category", 
        label = "Groups (by age or gender)",
        choices = c("Female","Male","Transgender","Age 13-23","Age 24-34","Age 35-45","Age 46-56","Age 57-67","Age 68-78"),
        selected = "Female")
        ),
    
    mainPanel(
      imageOutput("graph"),
      h4(textOutput("text"))
    )
  )
))
