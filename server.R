shinyServer(function(input, output) {

     #all_cats = 
     output$graph <- renderImage({
      	text = c("content","gn")[match(input$text_var,c("Posts/statuses","Group topics"))]
      	category = c("F","M","T","13-23","24-34","35-45","46-56","57-67","68-78")[match(input$category,c("Female","Male","Transgender","Age 13-23","Age 24-34","Age 35-45","Age 46-56","Age 57-67","Age 68-78"))]
      	filename = paste(category,"_",text,".png",sep="")
        list(src = filename,
         contentType = 'image/png',
         width = 500,
         height = 300,
         alt = "This category hasn't been done yet.")
  }, deleteFile = F)

	output$text <- renderText({
      	paste("Most popular", input$text_var, "keywords for",input$category)
  })
  }
)
