mechacar_table <- read.csv('MechaCar_mpg.csv',stringsAsFactors = F) #import MechaCar car dataset


##Liner Model with Vehicle weight
model <- lm(mechacar_table$vehicle.weight ~ mechacar_table$mpg,mechacar_table) #create linear model
yvals <- model$coefficients["mechacar_table$mpg"]*mechacar_table$mpg + model$coefficients['(Intercept)'] #determine y-axis values from linear model
plt <- ggplot(mechacar_table,aes(x=mpg,y=vehicle.weight)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

##Liner Model with Vehicle length
model <- lm(mechacar_table$vehicle.length ~ mechacar_table$mpg,mechacar_table) #create linear model
yvals <- model$coefficients["mechacar_table$mpg"]*mechacar_table$mpg + model$coefficients['(Intercept)'] #determine y-axis values from linear model
plt <- ggplot(mechacar_table,aes(x=mpg,y=vehicle.length)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

##Liner Model with Vehicle spoiler.angle
model <- lm(mechacar_table$spoiler.angle ~ mechacar_table$mpg,mechacar_table) #create linear model
yvals <- model$coefficients["mechacar_table$mpg"]*mechacar_table$mpg + model$coefficients['(Intercept)'] #determine y-axis values from linear model
plt <- ggplot(mechacar_table,aes(x=mpg,y=spoiler.angle)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

##Liner Model with Vehicle ground.clearance
model <- lm(mechacar_table$ground.clearance ~ mechacar_table$mpg,mechacar_table) #create linear model
yvals <- model$coefficients["mechacar_table$mpg"]*mechacar_table$mpg + model$coefficients['(Intercept)'] #determine y-axis values from linear model
plt <- ggplot(mechacar_table,aes(x=mpg,y=ground.clearance)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model


##Multiple Liner Model with Vehicle mpg and other vehicle variables - vehicle.weight + vehicle.length + spoiler.angle + ground.clearance
car_linear <- lm(mpg ~ vehicle.weight + vehicle.length + spoiler.angle + ground.clearance, data=mechacar_table)
summary(car_linear)

#3d Plot for multiple linear regression - using plotly library
library(plotly)
plot_ly(data = mechacar_table, z = ~mpg, x = ~vehicle.length, y = ~vehicle.weight, color = ~AWD, colors = c('#0C4B8E' ,'#BF382A'),opacity = 0.5) %>%
  add_markers( marker = list(size = 2)) %>% layout(title="Correlation between mpg, vehicle length, vehicle weight and AWD")

plot_ly(data = mechacar_table, z = ~mpg, x = ~vehicle.length, y = ~vehicle.weight, color = ~spoiler.angle, colors = c('#0C4B8E' ,'#BF382A'),opacity = 0.5) %>%
  add_markers( marker = list(size = 2)) %>% layout(title="Correlation between mpg, vehicle length, vehicle weight and spoler angle")

plot_ly(data = mechacar_table, z = ~mpg, x = ~vehicle.length, y = ~vehicle.weight, color = ~ground.clearance, colors = c('#0C4B8E' ,'#BF382A'),opacity = 0.5) %>%
  add_markers( marker = list(size = 2)) %>% layout(title="Correlation between mpg, vehicle length, vehicle weight and ground clearance")

suspension_table <- read.csv('suspension_coil.csv') #import MechaCar car dataset
#summary of suspension_table
summary(suspension_table) #mean. median, max, min, 1st Qu. 3rd QU
std = sd(suspension_table$PSI) # calculating standard deviasion
variance = var(suspension_table$PSI) #calculating varience

##compare suspension coil's pound-per-inch vs the mean population results of 1500 pounds per inch
t.test(suspension_table$PSI, mu=1500)
