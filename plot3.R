# Of the four types of sources indicated by the  (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 to 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 to 2008? Use the ggplot2 plotting system to make 
# a plot answer this question.

source("init-NEI-98-08-data.R")

png("plot3.png")
b_emissions <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(Emissions=sum(Emissions))

b_em_plot <- ggplot(data = b_emissions, aes(x = year, y = Emissions, color = type)) +
  geom_line(size = 2) + xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
  ggtitle("Baltimore Emissions by Source Type")
print(b_em_plot)
dev.off()