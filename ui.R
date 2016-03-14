library(shiny)


# Define UI for miles per gallon application
shinyUI(fluidPage(

        # Application title
        titlePanel("Prediction of child's height based on parents height"),

        sidebarPanel(

                h4("Introduction"),

                h5("This application uses the datased included in", code('UsingR'), " library,",
                         code('galton'), ", a tabulated data set collected and used by Sir Francis Galton
                         in 1885 to study the relationship between a parent's height and their children's."),

                h4("Methods"),

                h5("We use a linear model fit to predict the height of a child, in inches,
                   based on the height of the mid-parent (average of father and mother)."),

                h4("Height calculator"),

                sliderInput("slider", label = h5("Insert parents height (in inches)"),
                            min = 64.00, max = 73.00, step=0.5, value=64),
                submitButton("Submit")
        ),

        mainPanel(
                h4("Graphical view of the dataset"),
                h5("The red line shows the parents height selected, the blue line represents the linear regression model"),
                plotOutput('plot'),

                h4("Results"),
                h5("Parents height (in inches):"),
                verbatimTextOutput('text1'),
                h5("Which results on children's predicted heigth (in inches) of:"),
                verbatimTextOutput('text2'),
                h5("With a 95% confidence interval of:"),
                verbatimTextOutput('text3')


        )
))
