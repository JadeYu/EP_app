shinyUI(fluidPage(
  titlePanel("You are what you talk about"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("demo", 
        label = "Choose a demo mode",
        choices = c("Word cloud"="WC","Group network"="GN"),
        selected = "WC"),
        
      conditionalPanel(
      condition = "input.demo == 'WC'",
      h5(helpText("Keywords of interest to people in different demographic groups. Word clouds are generated using")), a(href=" http://www.abcya.com/word_clouds.htm","ABCya"),
      
      selectInput("text_var", 
        label = "Choose a text category",
        choices = c("Posts/statuses"="content","Group topics"="gn"),
        selected = "content"),
        
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
        selected = "F")
      )
      ),
      
      conditionalPanel(
      condition = "input.demo == 'GN'",
      h5(helpText("These networks reveal positive or negative associations among most popular topics. pmi (", a(href="https://en.wikipedia.org/wiki/Pointwise_mutual_information","pointwise mutual information"), ") quantifies how likely one topic is of interesting to someone given s/he is interested in another.")),
      
      selectInput("style",
      label="Choose a network style",
      choices=c("Gephi"="gephi","iGraph"="igraph"),
      selected = "igraph"),
      
      selectInput("relation",
      label="Association type",
      choices=c("Positive"="pos","Negative"="neg"),
      selected = "pos"),
      
      conditionalPanel(
      condition = "input.style == 'igraph'",
      sliderInput("threshold",
      	label="pmi threshold",
      	min=-0.35,max=0.35,value=0
      ),
            
      sliderInput("ngroup",
      	label="Number of top groups to analyze",
      	min=10,max=50,value=30
      )
      )
      ),
      helpText(em("This project is based on the"), a(href="http://cdips.physics.berkeley.edu/2015-cdips-data-science-workshop/","2015 CDIPS workshop"),em("of UC Berkeley. The team members (alphabetically) are:")),
      helpText("Dharshi Devendran"),
      helpText("Shannon Hateley"),
      helpText("Kevin Pollock"),
      helpText("Jade (Yu) Zhang"),
      helpText(h5(em("Special thanks to"),"Adam Kalman",em("from")),a(href="http://www.kanjoya.com/","Kanjoya"),".")
     ),
    mainPanel(
      helpText(h5("Big data-and-natural language-based solution to user behavior: using >500,000 instant posts from the social website ", a(href="http://www.experienceproject.com/","Experience Project"),"we explored:")), 
    helpText(h5("1) whether language used for online communication has outstandng demographic structure; ")), 
    helpText(h5("2) what are the 'trending words' for each demophic group and ")), 
    helpText(h5("3) whether there are underlying connections among topics most interesting to people.")),
      conditionalPanel(
      condition = "input.demo == 'WC'",
      imageOutput("graph",width=600,height=500)
      ),
      conditionalPanel(
      condition = "input.demo == 'GN'&&input.style == 'igraph'",
      plotOutput("network",width=700,height=600)
      ),
      conditionalPanel(
      condition = "input.demo == 'GN'&&input.style == 'gephi'",
      helpText("Graphs created in", a(href="http://gephi.github.io","Gephi"), "(provided by Dharshi Devendran)"),
      imageOutput("Gephi",width=600,height=500)
      
      ),
      fluidRow(
      column(4,
      helpText("Codes and graphs on this app can be found in:"),
      a(href="https://github.com/JadeYu/EP_app.git","https://github.com/JadeYu/EP_app.git")
      ),
      
      column(4,
      helpText("Data and codes for analysis can be found in:"),
      a(href="https://github.com/adamkalman/CDIPS_2015.git","https://github.com/adamkalman/CDIPS_2015.git"),offset=2
      )
      )
    )
  )
))
