# Of the four types of sources indicated by the  (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 to 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 to 2008? Use the ggplot2 plotting system to make 
# a plot answer this question.

source("init-NEI-98-08-data.R")

png("plot3.png", width = 640, height = 480)
b_emissions <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(Emissions=sum(Emissions))

b_em_plot <- ggplot(data = b_emissions, aes(x = factor(year), y = Emissions, fill = type, colore = "black")) +
  geom_bar(stat = "identity") + facet_grid(. ~ type) + 
  xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
  ggtitle("Baltimore Emissions by Source Type") 
print(b_em_plot)
dev.off()