# How have emissions from motor vehicle sources changed from 1999 to 2008 in Baltimore City?

source("init-NEI-98-08-data.R")

vehicles_SCC <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
vehicle_emissions <- NEI %>% 
  filter(SCC %in% vehicles_SCC & fips == "24510") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))
  
png("plot5.png", width = 640, height = 480)
v_plot <- ggplot(coal_summary, aes(x=year, y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) +
  geom_bar(stat="identity") + ylab(expression('PM'[2.5]*' Emissions in Kilotons')) + xlab("Year") +
  geom_label(aes(fill = year),colour = "white", fontface = "bold") +
  ggtitle("Baltimore Vehicle Emissions, 1999 to 2008.")
print(v_plot)
dev.off()