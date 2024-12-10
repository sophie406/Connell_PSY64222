############## Visualisation ##############


data <- read.csv("/Users/sophieconnell/Desktop/coding/sophieconnell_psy64222/data/dataset.csv")

#upload visualisation package 
library(ggplot2)
library(tidyverse)

### GRAPH 1 ###
#creating line graph to show the increase of alcoholic deaths in men an women throughout 2002-2022

# Create the line graph
ggplot(data, aes(x = Year)) +
  
# Line for the trend of deaths with a label in the legend
geom_line(aes(y = PersonsDeaths, color = "Trend Line"), size = 1.5) +

# Points for individual data values with a label in the legend
geom_point(aes(y = PersonsDeaths, color = "Data Points"), size = 4) +
  
# Custom labels for the axes and title
labs(
  title = "Alcohol-Specific Deaths in the UK (2002-2022)",
  x = "Year",
  y = "Number of Deaths",
  color = "Legend" # Title of the legend
  ) +
  
# Show every year on the x-axis
scale_x_continuous(breaks = seq(2002, 2022, by = 1)) +

# Y-axis breaks in increments of 500, with limits
scale_y_continuous(
 limits = c(4000, 8000),
 breaks = seq(4000, 8000, by = 500)
  ) +
# Making it look nice
scale_color_manual(
  values = c("Trend Line" = "darkgreen", "Data Points" = "pink")
  ) +
  theme_minimal() +
  theme(
    panel.grid.major = element_line(color = "grey", linetype = "dashed"), # Green gridlines
    panel.grid.minor = element_blank(), # Remove minor gridlines
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5, color = "darkgreen"), # Purple title
    axis.title.x = element_text(size = 14, face = "bold", color = "darkgreen"), # Purple x-axis label
    axis.title.y = element_text(size = 14, face = "bold", color = "darkgreen"), # Purple y-axis label
    axis.text.x = element_text(size = 12, color = "darkgreen"), # Purple x-axis ticks
    axis.text.y = element_text(size = 12, color = "darkgreen"), # Purple y-axis ticks
    legend.position = "bottom", # Move the legend to the bottom
    legend.title = element_text(size = 12, face = "bold"), # Style the legend title
    legend.text = element_text(size = 10) # Style the legend text
  )

### GRAPH 2 ###

#Simple bar chart to show the difference of total deaths from alcohol in 20002 and 2022

#Filtering the data for the years 2002 ane 2022
bar_data <- data[data$Year %in% c(2002, 2022), ]

#creating the bar chart 
ggplot(bar_data, aes(x = factor(Year), y = PersonsDeaths, fill = factor(Year))) +
  geom_bar(stat = "identity", width = 0.6, show.legend = FALSE) +
  labs( title = "Comparison of Alcohol-Specific Deaths (2002 vs. 2022)", 
        x = "Year", 
        y = "Number of Deaths"
  ) +
#making it look nice
scale_fill_manual(values = c("#9B59B6", "#C8A2C8")) +
  theme_minimal() +
  theme(
    panel.grid.major = element_blank(), # Remove major gridlines
    panel.grid.minor = element_blank(), # Remove minor gridlines
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5, color = "#8E44AD"), # Purple title
    axis.title.x = element_text(size = 14, face = "bold", color = "#36013F"), # Purple x-axis label
    axis.title.y = element_text(size = 14, face = "bold", color = "#36013F"), # Purple y-axis label
    axis.text.x = element_text(size = 12, color = "#36013F"), # Purple x-axis ticks
    axis.text.y = element_text(size = 12, color = "#36013F")  # Purple y-axis ticks
  )

### GRAPH 3 ###

# Summarize data for the specified year ranges
summary_data <- data %>%
  mutate(Period = case_when(
    Year %in% 2017:2019 ~ "2017-2019",
    Year %in% 2020:2022 ~ "2020-2022",
    TRUE ~ NA_character_  # Exclude other years
  )) %>%
  filter(!is.na(Period)) %>%
  group_by(Period) %>%
  summarise(MeanDeaths = mean(PersonsDeaths))

# Create the bar chart
ggplot(summary_data, aes(x = Period, y = MeanDeaths, fill = Period)) +
geom_bar(stat = "identity", width = 0.6, show.legend = FALSE) +
geom_text(aes(label = round(MeanDeaths, 1)), vjust = -0.5, size = 5, color = "black") +
labs(
  title = "Comparison of Mean Alcohol-Specific Deaths: 2017-2019 vs. 2020-2022",
  x = "Time Period", y = "Mean Deaths"
  ) +
  
#Make it look nice
scale_fill_manual(values = c("2017-2019" = "#FFC0CB", "2020-2022" = "#FF69B4")) +
  theme_minimal() +
  theme(
    panel.grid.major = element_blank(), # Remove major gridlines
    panel.grid.minor = element_blank(), # Remove minor gridlines
    panel.border = element_rect(color = "black", fill = NA), # Add black border
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5, color = "black"), # Black title
    axis.title.x = element_text(size = 14, face = "bold", color = "black"), # Black x-axis label
    axis.title.y = element_text(size = 14, face = "bold", color = "black"), # Black y-axis label
    axis.text.x = element_text(size = 12, color = "black"), # Black x-axis ticks
    axis.text.y = element_text(size = 12, color = "black")  # Black y-axis ticks
  )



