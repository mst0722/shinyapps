#
# This is a Shiny web application. (http://shiny.rstudio.com/)
# 
# The application calculates the amount of lost productivity hours for social media users
# It also displays the social media utilization trends by age and gender for US adults.

library(shiny)
library(plotly)

# The UI for application 
ui <- fluidPage(
   
  headerPanel(title = "Survey: Social Media Use"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("firstname", "Enter your first name:"),
      textInput("country", "Enter your country:"),
      radioButtons("gender", "What is your gender?:", choices = c("Female", "Male")), #selected = "Female", inline='T'),
      textInput("language", "What is your first language?"),
      selectInput("app", "What social networking apps do you use?", choices =c("Facebook", "Facebook Messenger","Google Hangouts","GroupMe","Instagram","Pinterest", "Reddit","Sina Weibo","Skype","Snapchat","Telegram","Tencent QQ", "Tencent Renren","Twitter","Tumblr","Wechat","WhatsApp"), multiple=TRUE),
      sliderInput("hours", "How many hours do you spend on social media daily?:",min = 0, max = 23, value = 0)
      
      ),
    mainPanel(
      htmlOutput("testHTML"),
      htmlOutput("appsHTML"),
      textOutput("app_"),
      htmlOutput("hoursHTML"),
      textOutput("hours_"),
      htmlOutput("findingHTML"),
      textOutput("LostYears"),
      htmlOutput("LYHTML"),
      textOutput("Years_Lost"),
      htmlOutput("space1HTML"),
      plotlyOutput("ageplot"),
      htmlOutput("space2HTML"),
      plotlyOutput("genderplot")
    )
  )
  
  
)

# The server logic 
server <- function(input, output) {
   
  output$testHTML <- renderText({
    paste("<b> User name: ", "</b>", input$firstname, "<br>",
          "<b> Country name: ", "</b>", input$country, "<br>",
          "<b> Gender: ", "</b>", input$gender, "<br>",
          "<b> Language: ", "</b>", input$language)
    })
  
  output$appsHTML <- renderText({
    paste("<b> User applications: ","</b>")
  })
  output$app_ <- {(renderText(input$app))}

  output$hoursHTML <- renderText({
    paste("<b> Hours spent on social media: ","</b>", input$hours)
  })
  
  output$findingHTML <- renderText({
    paste("<br>",
          "<b> Findings: ", "</b>")
  }) 
  
  output$LYHTML <- renderText({
    paste("<b> Your Lost Productive Years: ", "</b>", 
          (input$hours * (if(input$gender=="Female") 0.30 else 0.70)))
  })
  #output$Years_Lost <- renderText(input$hours * (if(input$gender=="Female") 0.30 else 0.70))
 
  # space filler
  output$space1HTML <- renderText({paste("<br>")})
  
    # Plot of social media use by age group
  output$ageplot <- renderPlotly({
    
    age_SM <- read.table("age_SM.txt", header = TRUE)
    age_SM$TimePeriod <- as.Date(age_SM$Period, format = "%m / %d / %Y")
    
    plot_ly(age_SM, x = ~TimePeriod, color = I("cadetblue4")) %>%
      add_lines(y = ~X18_29, name = "18_29") %>%
      add_lines(y = ~X30_49, name = "30_49", color = I("chocolate1")) %>%
      add_lines(y = ~X50_64, name = "50_64", color = I("bisque4")) %>%
      add_lines(y = ~X65_plus, name = "65+", color = I("gold2")) %>%
      layout(title = "% of U.S. adult social media users, by age group",
             xaxis = list(title = "Dates"),
             yaxis = list (title = "% of U.S. adults")) %>% 
      layout(yaxis = list(tickformat = "%")) # change decimal values to percent
  })  
  
  # space filler
  output$space2HTML <- renderText({paste("<br>")})
  
  # Plot of social media use by age group
  output$genderplot <- renderPlotly({
    
    gender_SM <- read.table("gender_SM.txt", header = TRUE)
    gender_SM$TimePeriod <- as.Date(gender_SM$Period, format = "%m / %d / %Y")
    
    plot_ly(gender_SM, x = ~TimePeriod, color = I("deepskyblue3")) %>%
      add_lines(y = ~Men, name = "Men") %>%
      add_lines(y = ~Women, name = "Women", color = I("darkolivegreen4")) %>%
      layout(title = "% of U.S. adult social media users, by gender",
             xaxis = list(title = "Dates"),
             yaxis = list (title = "% of U.S. adults")) %>% 
      layout(yaxis = list(tickformat = "%")) # change decimal values to percent
  })  
   
}

# Run the application 
shinyApp(ui = ui, server = server)

