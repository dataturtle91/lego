# Load necessery 
library(tidyverse)
library(plotly)
library(ggthemes)


# Load data
df <- read.csv("D:/wd/lego_sets.csv")

# Number of bins (one bin per year)

bin_nr <- max(df$year) - min(df$year)

years <- df %>%
  select(year) %>%
  group_by(year) %>%
  summarize(n()) %>%
  rename("total" = "n()")


line_chart <- ggplot(years, aes(x = year, y = total)) +
  geom_line(col = "darkgray") +
  geom_point(size = 0.5, col = "navy") +
  labs(title = "Number of lego sets per year", x = "Year", y = "", 
       subtitle ="" ) +
  theme_minimal()
  
ggplotly(line_chart)

# Since 2010, the number of new Lego sets has not been less than 500 per year
