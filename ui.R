

source("helpers.R")

shinyUI(fluidPage(theme=shinytheme("flatly"),
                  useShinyjs(),
                  tags$style(type="text/css",
                             ".recalculating { opacity: 1.0; }"
                  ),
                  tags$head(tags$script('
                                var dimension = [0, 0];
                                $(document).on("shiny:connected", function(e) {
                                    dimension[0] = window.innerWidth;
                                    dimension[1] = window.innerHeight;
                                    Shiny.onInputChange("dimension", dimension);
                                });
                                $(window).resize(function(e) {
                                    dimension[0] = window.innerWidth;
                                    dimension[1] = window.innerHeight;
                                    Shiny.onInputChange("dimension", dimension);
                                });
                            ')),
  titlePanel("Wine Data Analysis"),
  sidebarLayout(
    sidebarPanel(
      fileInput('reportFile', 'Choose the file to upload',
                accept = c(
                '.csv', '.xlsx'
                )),
      

      withBusyIndicatorUI(actionButton("checkReport", "Generate Report")),
      
      hr(),
      
      uiOutput('prevfileselect'),
      downloadButton('prevdownload', 'Download Report', 
                     class="btn btn-success")
      


    ),
    mainPanel(
 
       htmlOutput('htmlReport')
    )
  )
))
