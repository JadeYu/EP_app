shinyUI(fluidPage(
  titlePanel("People who get you: Experience project"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("demo", 
        label = "Choose a demo mode",
        choices = c("Word cloud"="WC","Group network"="GN"),
        selected = "WC"),
        
      conditionalPanel(
      condition = "input.demo == 'WC'",
      h5(helpText("Most popular keywords in status/group topic  by age groups and gender")),
      
      selectInput("text_var", 
        label = "Choose a text category",
        choices = c("Posts/statuses"="content","Group topics"="gn"),
        selected = "gn"),
        
      selectInput("category", 
        label = "Category",
        choices = c("Age","Gender"),
        selected = "Age"),
            
      conditionalPanel(
      condition = "input.category == 'Age'",
      selectInput("age", 
        label = "Age groups",
        choices = c("13-23","24-34","35-45","46-56","57-67","68-78"),
        selected = "35-45")
      ),
      
      conditionalPanel(
      condition = "input.category == 'Gender'",
      selectInput("gender", 
        label = "Gender groups",
        choices = c("Male"="M","Female"="F","Transgender"="T"),
        selected = "T")
      )
      ),
      
      conditionalPanel(
      condition = "input.demo == 'GN'",
      selectInput("relation",
      label="Association type",
      choices=c("Positive"="posi","Negative"="negi"),
      selected = "posi"),
      
      sliderInput("threshold",
      	label="pmi threshold",
      	min=-0.35,max=0.35,value=0.2
      ),
            
      sliderInput("ngroup",
      	label="Number of groups to be shown",
      	min=10,max=50,value=30
      )
      ),
      helpText("Codes and pictures can be found on GitHub in:"),
      a(href="https://github.com/JadeYu/EP_app.git","https://github.com/JadeYu/EP_app.git")
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
