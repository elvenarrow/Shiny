library(shiny)
library(shinyIncubator)

shinyUI(
  fluidPage(
    # CSS theme
    theme = "bootstrap.css",
    
    # Progress bar
    progressInit(),
    
    # Application title
    titlePanel("Wisdom of Crowds"),
    
    # Sidebar
    sidebarLayout(
      sidebarPanel(
        width = 3, 
        
        sliderInput("n", "Number of tested people", 
                    min = 1, max = 1000, value = 100, width = "100%"), hr(),
        
        sliderInput("val", "Number of gumballs in the jar", 
                    min = 1, max = 1000,value = 200, width = "100%"), hr(),
        
        sliderInput("error", "% error of individual estimates", 
                    min = 0, max = 1, value = 0.2, width = "100%"), hr(),
        
        sliderInput("soc", "Intensity of social influence", 
                    min = 0, max = 1, value = 0, width = "100%"), hr(),
        
        div(style = "text-align: center;",
            actionButton("goButton", "Rerun", icon = icon("refresh"))
        )
        
      ),
      
      # Main panel
      mainPanel(
        tabsetPanel(
          
          # Model panel
          tabPanel(
            title = "Simulations",
            
            fluidRow(
              column(6,
                     plotOutput("IBM.plot1")),
              
              column(6,
                     plotOutput("IBM.plot2"))
            )
          ),
          
          # About panel
          tabPanel(
            title = "About",
            
            tags$hr(),
            
            p(strong("Author:"), " Simon Garnier"),
            
            p(strong("Twitter:"), a("@sjmgarnier", 
                                    href = "https://twitter.com/sjmgarnier",
                                    target = "_blank")),
            
            p(strong("Website:"), a("http://www.theswarmlab.com", 
                                    href = "http://www.theswarmlab.com",
                                    target = "_blank")),
            
            p(strong("Source code:"), 
              a("GitHub",
                href = "https://github.com/morpionZ/Shiny/tree/master/wisdom_of_crowds/model",
                target = "_blank")),
            
            p(strong("Created with:"), 
              a("RStudio",
                href = "http://www.rstudio.com/",
                target = "_blank"), 
              " and ",
              a("Shiny.",
                href = "http://shiny.rstudio.com",
                target = "_blank")),
            
            p(strong("License:"), 
              a("GPL v3",
                href = "http://www.gnu.org/copyleft/gpl.html",
                target = "_blank")),
            
            tags$hr(),
            
            h4("References:"),
            
            p(HTML('<ol>'),
              
              HTML('<li>'), "Lorenz J, Rauhut H, Schweitzer F, Helbing D (2011) How social influence can undermine the wisdom of crowd effect. Proc Natl Acad Sci USA 108: 9020–9025.", 
              a("doi:10.1073/pnas.1008636108.",
                href = "http://www.pnas.org/content/108/22/9020",
                target = "_blank"),
              
              HTML('<li>'), "Moussaïd M, Kämmer JE, Analytis PP, Neth H (2013) Social influence and the collective dynamics of opinion formation. PLoS One 8: e78433.", 
              a("doi:10.1371/journal.pone.0078433.",
                href = "http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0078433",
                target = "_blank"),
              
              HTML('</ol>'))
          )
        )
      )
    )
  )
)

