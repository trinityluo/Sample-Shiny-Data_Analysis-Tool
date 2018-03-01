# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 10MB.
options(shiny.maxRequestSize = 10*1024^2)

addResourcePath("report","./report")


shinyServer(function(input, output, session) {
  
  output$prevfileselect <- renderUI({
    selectInput("prevfiles", "Choose a report to download:",
                rev(list.files(path="./report")), 
                selected=ifelse(length(list.files(path="./report")) == 0, NA, max(list.files(path="./report")))
                )
  })
  

  output$prevdownload <- downloadHandler(
    filename = function(){ paste(input$prevfiles, sep="") },
    content = function(file) {
      myfile <- paste0('./report/', input$prevfiles, collapse = NULL)
      file.copy(myfile, file) 
    }
  )
  

  
  observeEvent(input$checkReport,{
    withBusyIndicatorServer("checkReport", {
      
      reportFile <- input$reportFile$datapath
      reportName <- input$reportFile$name
      reportType <- input$reportType
      reportDir <- "./report/"
      
      
      params <- list(filename=reportFile)
      
      rmdFile <- "sample.Rmd"
      
      resultFile  <- paste0("test",
                            format(Sys.time(), "%Y%m%d_%H%M%S") ,
                            # tools::file_path_sans_ext(reportName),
                            "_",  
                            ".html")

      render(rmdFile, output_file=resultFile,
             output_dir=reportDir, params=params)
      
    

    })
    filechoices <- rev(list.files(path="./report", pattern="*.html"))
    
    updateSelectInput(session, "prevfiles", "Choose a report to download:",
                      filechoices, 
                      selected=max(filechoices))
    
    output$htmlReport <- renderUI({

      tags$iframe(src=paste0(reportDir, resultFile), 
                  width = '100%', height = input$dimension[2]-49, style="border:none;")
    })
  
  }, ignoreInit = FALSE)
})
