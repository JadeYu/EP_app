shinyUI(fluidPage(
  titlePanel("You are what you talk about: Experience project"),
  
  sidebarLayout(
    sidebarPanel(
      h5(helpText("Most popular keywords in status/group topic  by age groups and gender")),
      
      selectInput("demo", 
        label = "Choose a demo mode",
        choices = c("Word cloud"="WC","Group network"="GN"),
        selected = "WC"),
        
      conditionalPanel(
      condition = "input.demo == 'WC'",
      selectInput("text_var", 
        label = "Choose a text category",
        choices = c("Posts/statuses"="content","Group topics"="gn"),
        selected = "gn"),
        
     # selectInput("method", 
      #  label = "Method",
       # choices = c("conditional","scikit"),
        #selected = "conditional"),
        
      selectInput("category", 
        label = "Category",
        choices = c("Age","Gender"),
        selected = "Age"),
            
      conditionalPanel(
      condition = "input.category == 'Age'",
      selectInput("age", 
        label = "Age groups",
        choices = c("13-23","24-34","35-45","46-56","57-67","68-78"),
        selected = "13-23")
      ),
      
      conditionalPanel(
      condition = "input.category == 'Gender'",
      selectInput("gender", 
        label = "Gender groups",
        choices = c("Male"="M","Female"="F","Transgender"="T"),
        selected = "M")
      )
      ),
      conditionalPanel(
      condition = "input.demo == 'GN'",
      sliderInput("threshold",
      	label="pmi threshold",
      	min=0,max=0.2,value=0.1
      ),
      sliderInput("ngroup",
      	label="Number of groups to be shown",
      	min=10,max=50,value=30
      )
      ),
      helpText("Codes and pictures can be found on GitHub in:"),
      a("https://github.com/JadeYu/EP_app.git")
        ),
    mainPanel(
      conditionalPanel(
      condition = "input.demo == 'WC'",
      imageOutput("graph")
      ),
      conditionalPanel(
      condition = "input.demo == 'GN'",
      plotOutput("network")
      ) 
    )
  )
))
