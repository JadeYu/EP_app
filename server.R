library(igraph)
pmi = read.csv("pmi_matrix.csv",header=T)[,-1]
node_size = read.csv("node_weight.csv")[,2]
source("network_plotting.R")

shinyServer(function(input, output) {
	 output$graph <- renderImage({
      	text = input$text_var
      	if(input$category=="Age"){
      		category = input$age
      	}else{
      		category = input$gender
      	}
       	filename = paste("WC_graphs/",category,"_",text,"_conditional.png",sep="")
        list(src = filename,
         contentType = 'image/png',
         width = 600,
         height = 350,
         alt = "This category hasn't been done yet.")
  }, deleteFile = F)
  
     output$network <- renderPlot({
     		plot_network(pmi,input$ngroup,input$threshold,node_size)
     })
     
     output$Gephi <- renderImage({
         list(src = "betweenessNetwork_f14.png",
         contentType = 'image/png',
         width = 600,
         height = 350,
         alt = "This category hasn't been done yet.")
  }, deleteFile = F)

  }
)
