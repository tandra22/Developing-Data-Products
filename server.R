library(shiny)
library(UsingR)
library(ggplot2)
data(galton)

fit <- lm(child~parent,galton)

pr <- function(x){
        r <- predict.lm(fit,data.frame(parent=x))
        return(as.numeric(r[1]))
}

pr2 <- function(x){
         t <- predict.lm(fit,data.frame(parent=x), interval="confidence")
         t2 <- c((round(t[2],2)),(round(t[3],2)))
         return (paste("[",t2[1],",",t2[2],"]", sep=""))
}


shinyServer(
        function(input, output) {

                output$text1 <- renderPrint({input$slider})
                output$text2 <- renderPrint({pr(input$slider)})
                output$text3 <- renderPrint({pr2(input$slider)})

                output$plot <- renderPlot(qplot(galton$parent,galton$child,
                                                geom=c("point","smooth"))
                                          +xlab("Parent's height")
                                          +ylab("Children's predicted height")
                                          +scale_x_continuous(breaks=62:75)
                                          +scale_y_continuous(breaks=62:74)
                                          +geom_vline(xintercept=input$slider, colour='red', size=2))

})
