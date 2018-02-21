library(dplyr)
library(ggplot2)

FORCE_RELOAD <- FALSE

exdata_filename <- "exdata-data-NEI_data.zip"

if (!file.exists(exdata_filename)) {
  download_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(download_url, destfile = exdata_filename)
  unzip (zipfile = exdata_filename)
}

if (!exists("NEI") ||FORCE_RELOAD) {
  print("Loading NEI Data, please wait.")
  NEI <- readRDS("summarySCC_PM25.rds") 
}

if (!exists("SCC") || FORCE_RELOAD) {
  print("Loading SCC Data.")
  SCC <- readRDS("Source_Classification_Code.rds")
}

